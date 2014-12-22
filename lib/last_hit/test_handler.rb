class TestHandler
  class << self
    def run(files)
      files.each do |file|
        `rspec #{file}`
      end
    end
  end
end
