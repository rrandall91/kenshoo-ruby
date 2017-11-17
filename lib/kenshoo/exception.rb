module Kenshoo
  class ConnectionError < StandardError
    attr :error_string

    def initialize(error_string)
      @error_string = error_string
    end

    def message
      if @error_string =~ /400/
        "Kenshoo returned a Bad Request error: #{error_string}"
      else
        @error_string
      end
    end

    def self.raise_error(response)
      exception = Kenshoo::ConnectionError.new response
      raise exception, exception.message
    end
  end
end
