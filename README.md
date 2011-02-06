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
    -e, --engine [ENGINE]            Select processing engine (latex, pdflatex)
    -d, --display                    Display the document
    -s, --spell                      Spell check source files
    -v, --verbose                    Enable verbose feedback
    -V, --verboser                   Enable very verbose feedback
    -h, --help                       Show this help message

Standard project layout:

    root_dir         = Dir.pwd
    source_dir       = 'src'
    
    @defaults ||= {
      :root_dir          => File.pwd,
      :source_dir        => source_dir,
      :build_dir         => 'tmp',
      :distribution_dir  => 'dist',
      :template_file     => 'template.erb',
      :base_file         => 'base',
      :vendor_dir        => source_dir + '/vendor',
      :graphics_dir      => source_dir + '/graphics',
      :spell_dir         => source_dir,
      :spell_file        => 'dictionary.ispell',
      :distribution_name => distribution_name(root_dir)
    }

All these can be changed with a config.yml in the root_dir:

    ---
    build_dir: build
    graphics_dir: src/figures

Install
-------

    gem install rubbr
