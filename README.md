# Sass Import Once Plugin

Sass import_once changes the behavior of the sass @import directive making it never require the same file twice.

## Installation

    $ gem install sass-import_once

## Use with the Sass command line

    $ sass -r sass-import_once --watch sass_dir:css_dir

## Use with compass

Install the [compass-import_once](https://www.github.com/theblacksmith/compass-import_once)

    $ gem install 'compass-import_once'

Add the following to your compass configuration:

    require 'compass-import_once'

## Stylesheet Syntax

The same as always :)
