# Sass Import Once Plugin

Sass import_once changes the behaviour of the sass @import directive making never require the same file twice.

## Installation

    $ gem install sass-import_once

## Use with the Sass command line

    $ sass -r sass-import_once --watch sass_dir:css_dir

## Use with compass

Add the following to your compass configuration:

    $ gem install 'compass-import_once'
    require 'compass-import_once'

## Stylesheet Syntax

The same as always :)