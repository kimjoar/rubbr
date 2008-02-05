module Rubbr
  module Runner
    class LaTeX < Base
      def initialize(input_file, silent=false, executable='latex')
        super
      end

      def run
        disable_stdinn do
          messages = /^(Overfull|Underfull|No file|Package \w+ Warning:)/
          run = `#@executable #@input_file`
          @warnings = run.grep(messages)
          lines = run.split("\n")
          while lines.shift
            if lines.first =~ /^!/
              3.times { @errors << lines.shift }
            end
          end
          feedback
        end
      end
    end
  end
end
