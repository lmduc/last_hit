require "last_hit/version"
require "last_hit/configure"

require 'last_hit/rc_adapter'
require 'last_hit/file_filter'

require 'last_hit/test_handler'
require 'last_hit/checker'

require 'last_hit/cli'

class LastHit
  def modified_tests
    files = RcAdapter::Git.modified_files
    process(files)
  end

  def all_tests(base_branch)
    base_branch = Configure.base_branch if base_branch.nil?
    files = RcAdapter::Git.current_branch_files(base_branch)
    process(files)
  end

  def check(base_branch)
    base_branch = Configure.base_branch if base_branch.nil?
    files = RcAdapter::Git.current_branch_files(base_branch)
    warning(files)
  end

  private

  def process(files)
    tests = FileFilter::Spec.filter(files)
    TestHandler.run(tests)
  end

  def warning(files)
    Checker.check(files)
  end
end
