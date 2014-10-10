module Conduit
  module Wave
    # Hold configuration information for
    # the Conduit::Driver::Wave
    module Configuration
      class << self

        def api_host
          'http://www.wave.dev'
        end

        def configure(&block)
          yield self
        end
      end
    end
  end
end
