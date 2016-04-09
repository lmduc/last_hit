require "last_hit/version"
require "last_hit/configure"

require 'last_hit/rc_adapter'
require 'last_hit/file_filter'

require 'last_hit/test_handler'

class LastHit
  def modified_tests
    files = RcAdapter::GitAdapter.modified_files
    process(files)
  end

  def all_tests(base_branch)
    files = RcAdapter::GitAdapter.current_branch_files(base_branch)
    process(files)
  end

  private

  def process(files)
    tests = FileFilter::Spec.filter(files)
    TestHandler.run(tests)
  end
end
