class LastHit
  module RcAdapter
    class GitAdapter
      class << self
        def modified_files
          `git status -z`.split("\x0").map { |line| line.split(" ").last }
        end

        def current_branch_files(another_branch)
          current_sha = current_commit_sha
          ancestor_sha = common_ancestor(current_branch, another_branch)

          `git diff --name-only #{current_sha} #{ancestor_sha} -z`.split("\x0")
        end

        private

        def current_branch
          `git rev-parse --abbrev-ref HEAD`
        end

        def current_commit_sha
          `git rev-parse --verify HEAD`
        end

        def common_ancestor(branch_1, branch_2)
          `git merge-base #{branch_1} #{branch_2}`
        end
      end
    end
  end
end
