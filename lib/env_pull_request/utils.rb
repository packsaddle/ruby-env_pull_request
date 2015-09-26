module EnvPullRequest
  module Utils
    module_function

      def integral_string?(value)
        value.is_a?(String) && /^\d+$/ =~ value ? true : false
      end
  end
end
