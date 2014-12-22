require "last_hit/version"
require 'last_hit/railtie' if defined?(Rails)

module LastHit
  module RcAdapter
    require 'rc_adapter/git_adapter'
  end

  module FileFilter
    require 'file_filter/spec_filter'
  end

  require 'last_hit/test_handler'

  class << self
    def run_modified_tests
      files = RcAdapter::GitAdapter.get_modified_files
      tests = FileFilter::SpecFilter.get_files(files)
      TestHandler.run(tests)
    end
  end
end
