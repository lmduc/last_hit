class LastHit
  module RcAdapter
    class Git
      class << self
        def modified_files
          `git status -z`.split("\x0").map { |line| line.split(" ").last }
        end

        def current_branch_files(base_branch)
          current_sha = current_commit_sha
          $stdout.puts "Run tests changed between: #{base_branch} -> #{current_branch}"
          ancestor_sha = common_ancestor(current_branch, base_branch)

          `git diff --name-only #{current_sha} #{ancestor_sha} -z`.split("\x0")
        end

        private

        def current_branch
          # NOTE: We need to remove the last 2 characters of the sha
          # because they're white line characters
          # E.g: "master\n" should become to "master"

          `git rev-parse --abbrev-ref HEAD`[0..-2]
        end

        def current_commit_sha
          # NOTE: We need to remove the last 2 characters of the sha
          # because they're white line characters
          # E.g: "b0fb765371777c8c8e340bbf32dc9f2e160ca998\n"
          # should become "b0fb765371777c8c8e340bbf32dc9f2e160ca998"

          `git rev-parse --verify HEAD`[0..-2]
        end

        def common_ancestor(branch_1, branch_2)
          # NOTE: We need to remove the last 2 characters of the sha
          # because they're white line characters
          # E.g: "6b90b4e272b717a33cd40687b1914dd87022d3b0\n"
          # should become "6b90b4e272b717a33cd40687b1914dd87022d3b0"

          `git merge-base #{branch_1} #{branch_2}`[0..-2]
        end
      end
    end
  end
end
