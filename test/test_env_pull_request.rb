require_relative 'helper'

module EnvPullRequest
  class TestEnvPullRequest < Test::Unit::TestCase
    test 'version' do
      assert do
        !::EnvPullRequest::VERSION.nil?
      end
    end
  end
end
