require_relative 'helper'

# CAUTION: DO NOT ADD encrypted value!
#          test/test_test_helper.rb asserts ENV.
#          And this will show ENV accidentally in CI log.

module EnvPullRequest
  class TestTestHelperInclude < Test::Unit::TestCase
    include ::EnvPullRequest::TestHelper
    def self.startup
      @actual_original_travis_pull_request = ENV['TRAVIS_PULL_REQUEST']
      ENV.delete 'TRAVIS_PULL_REQUEST'
    end

    def self.shutdown
      ENV['TRAVIS_PULL_REQUEST'] = @actual_original_travis_pull_request
    end

    sub_test_case 'stash and restore' do
      expected = 'example11'
      setup do
        ENV['TRAVIS_PULL_REQUEST'] = expected
      end
      teardown do
        ENV.delete 'TRAVIS_PULL_REQUEST'
      end
      test 'stash and restore_env_pull_request' do
        stash_env_pull_request
        restore_env_pull_request
        assert do
          ENV['TRAVIS_PULL_REQUEST'] == expected
        end
      end
    end
    sub_test_case 'stash' do
      expected = 'example12'
      setup do
        ENV['TRAVIS_PULL_REQUEST'] = expected
      end
      teardown do
        ENV.delete 'TRAVIS_PULL_REQUEST'
      end
      test 'stash_env_pull_request' do
        stash_env_pull_request
        assert do
          ENV['TRAVIS_PULL_REQUEST'].nil?
        end
      end
    end
    sub_test_case 'restore' do
      expected = 'example13'
      setup do
        ENV['TRAVIS_PULL_REQUEST'] = expected
      end
      teardown do
        ENV.delete 'TRAVIS_PULL_REQUEST'
      end
      test 'restore_env_pull_request' do
        restore_env_pull_request
        assert do
          ENV['TRAVIS_PULL_REQUEST'].nil?
        end
      end
    end
  end
  class TestTestHelperModule < Test::Unit::TestCase
    def self.startup
      @actual_original_travis_pull_request = ENV['TRAVIS_PULL_REQUEST']
      ENV.delete 'TRAVIS_PULL_REQUEST'
    end

    def self.shutdown
      ENV['TRAVIS_PULL_REQUEST'] = @actual_original_travis_pull_request
    end

    sub_test_case 'stash and restore' do
      expected = 'example1'
      setup do
        ENV['TRAVIS_PULL_REQUEST'] = expected
      end
      teardown do
        ENV.delete 'TRAVIS_PULL_REQUEST'
      end
      test 'stash and restore_env_pull_request' do
        ::EnvPullRequest::TestHelper.stash_env_pull_request
        ::EnvPullRequest::TestHelper.restore_env_pull_request
        assert do
          ENV['TRAVIS_PULL_REQUEST'] == expected
        end
      end
    end
    sub_test_case 'stash' do
      expected = 'example2'
      setup do
        ENV['TRAVIS_PULL_REQUEST'] = expected
      end
      teardown do
        ENV.delete 'TRAVIS_PULL_REQUEST'
      end
      test 'stash_env_pull_request' do
        ::EnvPullRequest::TestHelper.stash_env_pull_request
        assert do
          ENV['TRAVIS_PULL_REQUEST'].nil?
        end
      end
    end
    sub_test_case 'restore' do
      expected = 'example3'
      setup do
        ENV['TRAVIS_PULL_REQUEST'] = expected
      end
      teardown do
        ENV.delete 'TRAVIS_PULL_REQUEST'
      end
      test 'restore_env_pull_request' do
        ::EnvPullRequest::TestHelper.restore_env_pull_request
        assert do
          ENV['TRAVIS_PULL_REQUEST'].nil?
        end
      end
    end
  end
end
