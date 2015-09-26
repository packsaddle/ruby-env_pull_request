require_relative 'helper'

module EnvPullRequest
  class TestUtils < Test::Unit::TestCase
    target = Class.new do
      include Utils
    end.new

    sub_test_case 'not integral' do
      test 'nil' do
        assert do
          target.integral_string?(nil) == false
        end
      end
      test 'empty string' do
        assert do
          target.integral_string?('') == false
        end
      end
      test 'integer' do
        assert do
          target.integral_string?(1) == false
        end
      end
      test 'decimal string' do
        assert do
          target.integral_string?('1.1') == false
        end
      end
    end
    sub_test_case 'integral' do
      test '1' do
        assert do
          target.integral_string?('1') == true
        end
      end
      test '10000000000000000' do
        assert do
          target.integral_string?('10000000000000000') == true
        end
      end
    end
  end
end