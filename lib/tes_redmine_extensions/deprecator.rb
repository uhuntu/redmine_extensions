module TesRedmineExtensions
  class Deprecator

    def deprecation_warning(method_name, message, caller_backtrace = nil)
      caller_backtrace ||= caller(2)
      message = "#{method_name} is deprecated and will be removed from TesRedmineExtensions in v1.0"
      ActiveSupport::Deprecation.warn message, caller_backtrace
    end

  end
end
