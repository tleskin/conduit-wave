module Conduit::Driver::Wave
  # Parse the response from the integrations index
  class IntegrationList < Conduit::Core::Action
    remote_url "#{Conduit::Wave::Configuration.api_host}/integrations"

    required_attributes *Conduit::Driver::Wave.credentials

    def perform
      request(
        body:    view,
        method:  :get,
        headers: { 'Content-Type' => 'application/json' }
      )
    end
  end
end

