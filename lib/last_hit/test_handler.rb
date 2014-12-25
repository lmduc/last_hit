module LastHit
  class TestHandler
    class << self
      def run(files)
        exec_command = command(files.join(" "))
        system(exec_command)
      end

      private

      def command(file_string)
        "bundle exec rspec #{file_string}"
      end
    end
  end
end
