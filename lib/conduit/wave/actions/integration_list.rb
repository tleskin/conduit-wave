module Conduit::Driver::Wave
  # Parse the response from the integrations index
  class IntegrationList < Conduit::Driver::Wave::Base
    url_route          '/integrations'
    required_attributes *(Conduit::Driver::Wave.credentials)
    http_method         :get
  end
end
