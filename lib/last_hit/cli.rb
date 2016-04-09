require 'thor'

class LastHit
  class Cli < Thor
    include Thor::Actions

    desc 'modified_tests', 'Run tests which are currently modified'
    def modified_tests
      LastHit.new.modified_tests
    end

    desc 'all_tests', 'Run all tests which have been modified in the current branch'
    method_option :base, aliases: '-b', desc: 'Base branch for compare', type: :string
    def all_tests
      LastHit.new.all_tests(options[:base])
    end
  end
end
