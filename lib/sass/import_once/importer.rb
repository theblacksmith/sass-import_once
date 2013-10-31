class Sass::ImportOnce::Importer < ::Sass::Importers::Filesystem
    
    attr_accessor :root, :staleness_check, :imported, :original_filename

    # Creates a new filesystem importer that imports files relative to a given path.
    #
    # @param root [String] The root path.
    #   This importer will import files relative to this path.
    def initialize(root)
        @imported = []
        super(root)
    end

    # Same as Sass
    COLORS = { :red => 31, :green => 32, :yellow => 33 }

    def color(color, str)
        raise "[BUG] Unrecognized color #{color}" unless COLORS[color]

        # Almost any real Unix terminal will support color,
        # so we just filter for Windows terms (which don't set TERM)
        # and not-real terminals, which aren't ttys.
        return str if ENV["TERM"].nil? || ENV["TERM"].empty? || !STDOUT.tty?
        return "\e[#{COLORS[color]}m#{str}\e[0m"
    end

    @@DEBUG = false
    
    def self.DEBUG=(value)
        @@DEBUG = value
    end

    def debug(text, level = 1)
        if @@DEBUG
            puts "__ DEBUG: " + text.to_s
        end
    end

    def update_imported_list(options)
        @original_filename ||= options[:original_filename]
        
        if @original_filename != options[:original_filename]
            @imported = []
            @original_filename = options[:original_filename]
        end
    end

    def staleness_check?(options)
        # as per sass/importers/filesystem.rb : 135, 148
        # quote: "If options[:_line] exists, we're here due to an actual import in an import_node
        #         Otherwise, we're here via StalenessChecker."
        # But it's not true, place two @import's to file A inside a file B and both will have _line set.
        # So, unfortunately, for now, we'll have to check the stack
        
        Kernel.caller.each {|call|
            return true if call.include? "staleness_checker"
        }

        return false
    end

    # @see Base#find_relative
    def find_relative(name, base, options)
        update_imported_list options
        debug color(:yellow, "    finding relative ") + color(:green, name)
        just_checking = staleness_check? options

        # get the real file
        real_file, syntax = Sass::Util.destructure(find_real_file(File.dirname(base), name, options))
        
        if !real_file
            raise color(:red, "Could not find a RELATIVE file '#{name}'. Imported at #{options[:original_filename]}:#{options[:_line]}")
            return nil
        end

        unless just_checking

            if @imported.include? real_file
                debug color(:red, "        already included")

                return empty(options)
            end

        else
            debug "        Just checking"
        end
        
        f = _find(File.dirname(base), name, options)

        if f
            debug color(:yellow, "        imported: ") + color(:green, real_file) unless just_checking
            @imported << real_file unless just_checking
        end

        return f
    end

    # @see Base#find
    def find(name, options)
        debug color(:red, "find called")
        update_imported_list options
        debug "finding absolute " + color(:green, name)
        just_checking = staleness_check? options

        # get the real file
        real_file, syntax = Sass::Util.destructure(find_real_file(@root, name, options))

        if !real_file
            raise color(:red, "Could not find file '#{name}'. Imported at #{options[:original_filename]}:#{options[:_line]}")
            return nil
        end
        
        unless just_checking

            if @imported.include? real_file
                debug color(:red, "already included")
                return empty(options)
            end

        else
            debug "Just checking", 2
        end

        f = _find(@root, name, options)
        
        if f
            debug "    imported: " + color(:green, real_file) unless just_checking
            @imported << real_file unless just_checking
        else
            debug color(:red, "NOT FOUND!")
        end

        return f
    end

    protected

    def empty(options)
        return Sass::Engine.new("", options)
    end
end