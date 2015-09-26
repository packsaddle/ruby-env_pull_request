require_relative 'helper'

module EnvPullRequest
  class TestUtils < Test::Unit::TestCase
    target = Class.new do
      include Utils
    end.new

    sub_test_case 'integral' do
      test 'nil' do
        assert do
          target.integral_string?(nil) == false
        end
      end
    end
  end
end
