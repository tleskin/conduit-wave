module Conduit
  module Wave
    # Hold configuration information for
    # the Conduit::Driver::Wave
    module Configuration
      class << self
        attr_accessor :api_host

        def configure(&block)
          yield self
        end
      end

      self.api_host = 'http://www.wave.dev'
    end
  end
end
