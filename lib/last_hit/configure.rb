module LastHit
  class Configure
    @@test_command = "bundle exec rspec"
    @@default_base_branch = "development"

    class << self
      attr_accessor :test_command, :default_base_branch

      def config
        yield(self)
      end
    end
  end
end
