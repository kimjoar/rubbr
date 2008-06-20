require 'optparse'
$:.unshift File.dirname(__FILE__)

module Rubbr
  VERSION = '1.1.4'

  autoload :Options,       'rubbr/options'
  autoload :Cli,           'rubbr/cli'
  autoload :Config,        'rubbr/config'
  autoload :Scm,           'rubbr/scm'
  autoload :Change,        'rubbr/change'
  autoload :Runner,        'rubbr/runner'
  autoload :Builder,       'rubbr/builder'
  autoload :Viewer,        'rubbr/viewer'
  autoload :Spell,         'rubbr/spell'

  class << self
    @@cmd_opts = {}

    def options
      @@global_opts ||= Rubbr::Options.setup.merge(@@cmd_opts)
    end

    def run(args = ARGV)
      opts = OptionParser.new do |opts|
        opts.version = Rubbr::VERSION
        opts.banner = 'Usage: rubbr [options]'

        opts.on('-f', '--format [FORMAT]', [:dvi, :ps, :pdf],
          'Select output format (dvi, ps, pdf)') do |format|
          @@cmd_opts[:format] = format
        end

        opts.on('-e', '--engine [ENGINE]', [:pdflatex, :ps, :pdf],
          'Select processing engine (latex, pdflatex)') do |engine|
          @@cmd_opts[:engine] = engine
        end

        opts.on('-d', '--display', 'Display the document') do
          @@cmd_opts[:view] = true
        end

        opts.on('-s', '--spell', 'Spell check source files') do
          @@cmd_opts[:spell] = true
        end

        opts.on('-v', '--verbose', 'Enable verbose feedback') do
          @@cmd_opts[:verbose] = true
        end

        opts.on('-V', '--verboser', 'Enable verbose feedback for hboxes') do
          @@cmd_opts[:verbose] = true
          @@cmd_opts[:verboser] = true
        end

        opts.on('-c', '--color', 'Enable colorized feedback') do
          @@cmd_opts[:color] = true
        end

        opts.on('-h', '--help', 'Show this help message') do
          puts opts
          exit 1
        end
      end

      begin
        opts.parse!(args)
      rescue OptionParser::ParseError
        puts opts
        exit 1
      end

      if @@cmd_opts[:spell]
        Rubbr::Spell.new.check
      elsif @@cmd_opts[:view]
        Rubbr::Builder.build
        Rubbr::Viewer.view
      else
        Rubbr::Builder.build
      end
    end
  end
end
