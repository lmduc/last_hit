module LastHit
  class Configure
    class << self
      attr_accessor :test_command, :default_base_branch

      def config
        yield(self)
      end
    end
  end
end
