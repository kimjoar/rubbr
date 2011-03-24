rubbr
=====

* http://rubyforge.org/projects/rubbr/
* by Eivind Uggedal <eu@redflavor.com>

Description
-----------

Build LaTeX documents.

Synopsis
--------

Usage: `rubbr [options]`

    -f, --format [FORMAT]            Select output format (dvi, ps, pdf)
    -F, --force                      Force execution regardless of changes
    -e, --engine [ENGINE]            Select processing engine (latex, pdflatex)
    -d, --display                    Display the document
    -D, --display-build              Display the build version of the document
    -s, --spell                      Spell check source files
    -v, --verbose                    Enable verbose feedback
    -V, --verboser                   Enable verbose feedback for hboxes
    -c, --color                      Enable colorized feedback
    -h, --help                       Show this help message

Standard project layout:

    root_dir         = Dir.pwd
    source_dir       = 'src'

    @defaults ||= {
      :root_dir          => root_dir,
      :source_dir        => source_dir,
      :build_dir         => 'tmp',
      :distribution_dir  => 'dist',
      :base_file         => 'base',
      :vendor_dir        => source_dir + '/vendor',
      :graphics_dir      => source_dir + '/graphics',
      :spell_dir         => source_dir,
      :spell_file        => 'dictionary.ispell',
      :inventory_file    => '.inventory',
      :distribution_name => distribution_name(root_dir),
      :force             => false,
      :verbose           => false,
      :verboser          => false,
      :color             => false,
      :view_build        => false,
      :format            => :dvi,
      :engine            => :latex
    }

All these can be changed with a `config.yml` in the `root_dir`:

    ---
    build_dir: build
    graphics_dir: src/figures

Install
-------

    gem install rubbr
