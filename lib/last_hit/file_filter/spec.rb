class LastHit
  module FileFilter
    class Spec
      SPEC_REGEX = /\A.+_spec.rb\z/

      class << self
        def filter(files)
          files.select { |file| file =~ SPEC_REGEX }
        end
      end
    end
  end
end
