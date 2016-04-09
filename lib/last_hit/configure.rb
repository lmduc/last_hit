class LastHit
  def self.configure
    yield(Configure) if block_given?
  end

  class Configure
    @test_command = "bundle exec rspec"
    @default_base_branch = "development"

    class << self
      attr_accessor :test_command, :default_base_branch
    end
  end
end
