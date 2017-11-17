module Kenshoo
  module Configuration
    VALID_OPTIONS_KEYS = [:username, :password, :ks_id, :endpoint, :version]
    DEFAULT_USERNAME = nil
    DEFAULT_PASSWORD = nil
    DEFAULT_KS_ID = nil
    DEFAULT_ENDPOINT = 'https://api.kenshoo.com'
    DEFAULT_VERSION = 'v2'

    attr_accessor *VALID_OPTIONS_KEYS

    def configure
      self.reset
      yield self
    end

    def options
      Hash[VALID_OPTIONS_KEYS.map { |key| [key, send(key)] }]
    end

    def reset
      self.username = DEFAULT_USERNAME
      self.password = DEFAULT_PASSWORD
      self.ks_id = DEFAULT_KS_ID
      self.endpoint = DEFAULT_ENDPOINT
      self.version = DEFAULT_VERSION
      self
    end
  end
end
