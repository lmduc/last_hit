namespace :last_hit do
  desc "Run current modified tests before commiting"
  task :current_modified => :environment do
    LastHit.run_modified_tests
  end

  desc "Run all changed tests of a branch from its fork with another branch"
  task :current_branch, [:another_branch] => :environment do |task, args|
    LastHit.run_current_branch_tests(args.another_branch)
  end
end
