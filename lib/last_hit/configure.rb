module LastHit
  class Configure
    class << self
      attr_accessor :test_command

      def config
        yield(self)
      end
    end
  end
end
