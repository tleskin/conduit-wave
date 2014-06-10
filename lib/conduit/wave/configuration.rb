module Conduit
  module Wave
    # Hold configuration information for
    # the Conduit::Driver::Wave
    module Configuration
      class << self
        mattr_accessor :api_host
        self.api_host = 'http://www.wave.dev'

        def configure(&block)
          yield self
        end
      end
    end
  end
end
