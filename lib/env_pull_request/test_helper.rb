module EnvPullRequest
  # Test helper for pull request with environment variables
  module TestHelper
    module_function

      # Stash original environment variables for pull request.
      # And delete for testing.
      #
      # @example with test-unit
      #   class TestExample < Test::Unit::TestCase
      #     extend TestHelper
      #
      #     def self.startup
      #       stash_env_pull_request
      #     end
      #   end
      #
      # @return [void]
      def stash_env_pull_request
        # NOTE: stash and restore only if exists
        @original_travis_pull_request = ENV['TRAVIS_PULL_REQUEST']
        @original_circle_pr_number = ENV['CIRCLE_PR_NUMBER']
        @original_ghprb_pull_id = ENV['ghprbPullId']
        ENV.delete 'TRAVIS_PULL_REQUEST'
        ENV.delete 'CIRCLE_PR_NUMBER'
        ENV.delete 'ghprbPullId'
      end

      # Restore original environment variables for pull request.
      #
      # @example with test-unit
      #   class TestExample < Test::Unit::TestCase
      #     extend TestHelper
      #
      #     def self.shutdown
      #       restore_env_pull_request
      #     end
      #   end
      #
      # @return [void]
      def restore_env_pull_request
        ENV['TRAVIS_PULL_REQUEST'] = @original_travis_pull_request
        ENV['CIRCLE_PR_NUMBER'] = @original_circle_pr_number
        ENV['ghprbPullId'] = @original_ghprb_pull_id
      end
  end
end
