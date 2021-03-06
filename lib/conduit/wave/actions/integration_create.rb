require 'conduit/wave/actions/base'

module Conduit::Driver::Wave
  # Parse the response from the integrations index
  class IntegrationCreate < Conduit::Driver::Wave::Base
    url_route          '/integrations'
    required_attributes :profile_id, :driver, :credentials
    http_method         :post
  end
end
