module EnvPullRequest
  module Utils
    def integral_string?(value)
      value.is_a?(String) && /^\d+$/ =~ value ? true : false
    end
    module_function :integral_string?
  end
end
