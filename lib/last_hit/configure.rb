class LastHit
  def self.configure
    yield(Configure) if block_given?
  end

  class Configure
    @test_command = "bundle exec rspec"
    @base_branch = "development"

    class << self
      attr_accessor :test_command, :default_base_branch

      def set(config)
        @test_command = config['test_command'] if config['test_command'].present?
        @base_branch = config['base_branch'] if config['base_branch'].present?
      end
    end
  end
end
