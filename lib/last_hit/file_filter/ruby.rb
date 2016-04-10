class LastHit
  module FileFilter
    class Ruby
      RUBY_REGEX = /\A.+_spec.rb\z/

      class << self
        def filter(files)
          files.select { |file| match?(file) }
        end

        def match?(file)
          return false if Spec.match?(file)
          ['app', 'lib'].each do |dr|
            regex = /#{dr}\/.+\.rb/
            return true if file =~ regex
          end
          false
        end
      end
    end
  end
end
