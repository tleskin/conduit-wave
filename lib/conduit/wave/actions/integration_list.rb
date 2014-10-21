require 'conduit/wave/actions/base'

module Conduit::Driver::Wave
  # Parse the response from the integrations index
  class IntegrationList < Conduit::Driver::Wave::Base
    url_route          '/integrations'
    http_method         :get
  end
end
