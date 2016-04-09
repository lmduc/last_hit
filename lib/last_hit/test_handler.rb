class LastHit
  class TestHandler
    class << self
      def run(files)
        if files.empty?
          run_no_tests
        else
          run_tests(files)
        end
      end

      private

      def run_no_tests
        $stdout.puts "No test found"
      end

      def run_tests(files)
        file_string = files.join(" ")

        before_run(file_string)
        exec_command = command(file_string)
        system(exec_command)
      end

      def before_run(file_string)
        $stdout.puts "Run files: #{file_string}"
        $stdout.puts
      end

      def command(file_string)
        "#{Configure.test_command} #{file_string}"
      end
    end
  end
end
