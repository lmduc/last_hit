require 'thor'
require 'yaml'

class LastHit
  class FileNotFound < StandardError; end

  class Cli < Thor
    CONFIG_PATH = './last_hit.yml'

    include Thor::Actions

    class << self
      def load_config(path)
        fail(FileNotFound, 'Config file not found') unless File.file?(path)
        config = YAML.load_file(File.expand_path(path))
        Configure.set(config)
      rescue FileNotFound => e
        $stdout.puts(e.message)
      end
    end

    desc 'init', 'Create config file for last_hit'
    method_option :path, aliases: '-p', desc: 'Path of the config', type: :string, default: CONFIG_PATH
    def init
      create_file options[:path], <<-CONTENT
base_branch: 'development'
test_command: 'bundle exec rspec'
      CONTENT
    end

    desc 'modified_tests', 'Run tests which are currently modified'
    def modified_tests
      LastHit.new.modified_tests
    end

    desc 'all_tests', 'Run all tests which have been modified in the current branch'
    method_option :base, aliases: '-b', desc: 'Base branch for compare', type: :string
    method_option :config, aliases: '-C', desc: 'Path to the config file', type: :string, default: CONFIG_PATH
    def all_tests
      Cli.load_config(options[:config])
      LastHit.new.all_tests(options[:base])
    end
  end
end
