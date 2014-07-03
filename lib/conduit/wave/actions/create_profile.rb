require 'conduit/wave/configuration'

module Conduit::Driver::Wave
  class CreateProfile < Conduit::Core::Action
    remote_url "#{Conduit::Wave::Configuration.api_host}/profiles"

    required_attributes *Conduit::Driver::Wave.credentials, :name
    optional_attributes :provider, :credentials

    # Required entry method, the main driver
    # class will use this to trigger the
    # request.
    #
    def perform
      request(
        body:     view,
        method:   :post,
        headers:  { 'Content-Type' => 'application/json' }
      )
    end
  end
end
