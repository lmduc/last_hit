module RcAdapter
  class GitAdapter
    class << self
      def get_modified_files
        `git status -z`.split("\x0").map { |line| line.split(" ").last }
      end
    end
  end
end
