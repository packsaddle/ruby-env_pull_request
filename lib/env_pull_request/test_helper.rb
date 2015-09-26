module EnvPullRequest
  module TestHelper
    def stash_env_pull_request
      @original_travis_pull_request = ENV['TRAVIS_PULL_REQUEST']
      @original_circle_pr_number = ENV['CIRCLE_PR_NUMBER']
      ENV.delete 'TRAVIS_PULL_REQUEST'
      ENV.delete 'CIRCLE_PR_NUMBER'
    end

    def restore_env_pull_request
      ENV['TRAVIS_PULL_REQUEST'] = @original_travis_pull_request
      ENV['CIRCLE_PR_NUMBER'] = @original_circle_pr_number
    end
  end
end
