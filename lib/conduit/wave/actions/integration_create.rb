module Conduit::Driver::Wave
  # Parse the response from the integrations index
  class IntegrationCreate < Conduit::Driver::Wave::Base
    remote_url "#{Conduit::Wave::Configuration.api_host}/integrations"

    required_attributes *Conduit::Driver::Wave.credentials, :profile_id,
      :driver, :credentials
  end
end

