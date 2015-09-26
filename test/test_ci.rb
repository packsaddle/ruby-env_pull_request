require_relative 'helper'

module EnvPullRequest
  class TestCi < Test::Unit::TestCase
    def self.startup
      @original_travis_pull_request = ENV['TRAVIS_PULL_REQUEST']
      @original_circle_pr_number = ENV['CIRCLE_PR_NUMBER']
      ENV.delete 'TRAVIS_PULL_REQUEST'
      ENV.delete 'CIRCLE_PR_NUMBER'
    end

    def self.shutdown
      ENV['TRAVIS_PULL_REQUEST'] = @original_travis_pull_request
      ENV['CIRCLE_PR_NUMBER'] = @original_circle_pr_number
    end

    sub_test_case 'not pull request' do
      test '#pull_request?' do
        assert do
          EnvPullRequest.new.pull_request? == false
        end
      end
      test '#pull_request_id' do
        assert do
          EnvPullRequest.new.pull_request_id.nil?
        end
      end
    end

    sub_test_case 'travis-ci' do
      pull_id = 800
      setup do
        ENV['TRAVIS_PULL_REQUEST'] = pull_id.to_s
      end

      teardown do
        ENV.delete 'TRAVIS_PULL_REQUEST'
      end

      test '#pull_request?' do
        assert do
          EnvPullRequest.new.pull_request? == true
        end
      end
      test '#pull_request_id' do
        assert do
          EnvPullRequest.new.pull_request_id == pull_id
        end
      end
    end

    sub_test_case 'circle ci' do
      pull_id = 800
      setup do
        ENV['CIRCLE_PR_NUMBER'] = pull_id.to_s
      end

      teardown do
        ENV.delete 'CIRCLE_PR_NUMBER'
      end

      test '#pull_request?' do
        assert do
          EnvPullRequest.new.pull_request? == true
        end
      end
      test '#pull_request_id' do
        assert do
          EnvPullRequest.new.pull_request_id == pull_id
        end
      end
    end
  end
end
