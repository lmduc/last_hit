require "last_hit/version"
require 'last_hit/railtie' if defined?(Rails::Railtie)

require 'last_hit/rc_adapter/git_adapter'
require 'last_hit/file_filter/spec_filter'

require 'last_hit/test_handler'

module LastHit
  class << self
    def run_modified_tests
      files = RcAdapter::GitAdapter.get_modified_files
      tests = FileFilter::SpecFilter.get_files(files)
      TestHandler.run(tests)
    end
  end
end
