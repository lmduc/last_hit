namespace :last_hit do
  desc "Run current modified tests"
  task modified_tests: :environment do
    files = RcAdapter::GitAdapter.get_modified_files
    tests = FileFilter::SpecFilter.get_files(files)
    TestHandler.run(tests)
  end
end
