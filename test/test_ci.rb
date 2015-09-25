require_relative 'helper'

module EnvPullRequest
  class TestCi < Test::Unit::TestCase
    sub_test_case 'not pull request' do
      test '#pull_request?' do
        env = EnvPullRequest.new
        assert do
          env.pull_request? == false
        end
      end
      test '#pull_request_id' do
        env = EnvPullRequest.new
        assert do
          env.pull_request_id.nil?
        end
      end
    end
  end
end
