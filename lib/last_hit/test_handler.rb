module LastHit
  class TestHandler
    class << self
      def run(files)
        files.each do |file|
          p "Start to run file #{file}"
          `bundle exec rspec #{file}`.split("\n").map(&method(:p))
          3.times { p "" }
        end
      end
    end
  end
end
