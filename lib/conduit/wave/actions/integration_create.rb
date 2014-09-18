module Conduit::Driver::Wave
  # Parse the response from the integrations index
  class IntegrationCreate < Conduit::Core::Action
    remote_url "#{Conduit::Wave::Configuration.api_host}/integrations"

    required_attributes *Conduit::Driver::Wave.credentials, :profile_id,
      :driver, :credentials

    def perform
      request(
        body:    view,
        method:  :post,
        headers: { 'Content-Type' => 'application/json' }
      )
    end
  end
end

