module Rubbr

  # Handles command line output and input.
  module Cli
    def notice(message)
      putting message
    end

    def warning(message)
      putting "  - #{message}"
    end

    def error(message)
      putting "  * #{message}"
    end

    def putting(output)
      puts output if Rubbr.options[:verbose]
    end

    def disable_stdout
      old_stdout = STDOUT.dup
      STDOUT.reopen('/dev/null')
      yield
      STDOUT.reopen(old_stdout)
    end

    def disable_stderr
      old_stderr = STDERR.dup
      STDERR.reopen('/dev/null')
      yield
      STDERR.reopen(old_stderr)
    end

    def disable_stdinn
      old_stdinn = STDIN.dup
      STDIN.reopen('/dev/null')
      yield
      STDIN.reopen(old_stdinn)
    end

    def executable?(executable)
      disable_stdout do
        @existing = system("which #{executable}")
      end
      @existing
    end

    def valid_executable(executable)
      if executable?(executable)
        executable
      else
        error "Missing executable #{executable}"
        exit
      end
    end
  end
end
