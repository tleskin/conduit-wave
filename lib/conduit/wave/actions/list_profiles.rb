require 'conduit/wave/configuration'

module Conduit::Driver::Wave
  class ListProfiles < Conduit::Core::Action
    remote_url "#{Conduit::Wave::Configuration.api_host}/profiles"

    required_attributes *Conduit::Driver::Wave.credentials

    # Required entry method, the main driver
    # class will use this to trigger the
    # request.
    #
    def perform
      request(
        body:     view,
        method:   :get,
        headers:  { 'Content-Type' => 'application/json' }
      )
    end
  end
end
