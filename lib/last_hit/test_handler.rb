module LastHit
  class TestHandler
    class << self
      def run(files)
        files.each do |file|
          p "Running file #{file}"
          p `bundle exec rspec #{file}`
        end
      end
    end
  end
end
