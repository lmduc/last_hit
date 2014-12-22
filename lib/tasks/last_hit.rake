namespace :last_hit do
  desc "Run current modified tests"
  task :modified_tests => :environment do
    LastHit.run_modified_tests
  end
end
