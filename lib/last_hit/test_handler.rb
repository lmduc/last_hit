module LastHit
  class TestHandler
    class << self
      def run(files)
        file_string = files.join(" ")

        before_run(file_string)
        exec_command = command(file_string)
        system(exec_command)
      end

      private

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
