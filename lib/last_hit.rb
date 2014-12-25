require "last_hit/version"
require "last_hit/configure"
require 'last_hit/railtie' if defined?(Rails::Railtie)

require 'last_hit/rc_adapter/git_adapter'
require 'last_hit/file_filter/spec_filter'

require 'last_hit/test_handler'

module LastHit
  class << self
    def run_modified_tests
      files = RcAdapter::GitAdapter.get_modified_files
      process(files)
    end

    def run_current_branch_tests(another_branch)
      files = RcAdapter::GitAdapter.get_current_branch_files(another_branch)
      process(files)
    end

    private

    def process(files)
      tests = FileFilter::SpecFilter.get_files(files)
      TestHandler.run(tests)
    end
  end
end
