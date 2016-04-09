class LastHit
  module FileFilter
    class SpecFilter
      SPEC_REGEX = /\A.+_spec.rb\z/

      class << self
        def get_files(files)
          files.select { |file| file =~ SPEC_REGEX }
        end
      end
    end
  end
end
