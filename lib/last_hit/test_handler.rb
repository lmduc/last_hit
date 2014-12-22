module LastHit
  class TestHandler
    class << self
      def run(files)
        files.each do |file|
          `bundle exec rspec #{file}`
        end
      end
    end
  end
end
