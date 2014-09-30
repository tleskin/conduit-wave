module Conduit::Driver::Wave
  # Parse the response from the integrations index
  class IntegrationList < Conduit::Driver::Wave::Base
    remote_url "#{Conduit::Wave::Configuration.api_host}/integrations"
    required_attributes *(Conduit::Driver::Wave.credentials)

    def perform
      response = request(body: view, method: :get)
      parser   = parser_class.new(response.body)
      Conduit::ApiResponse.new(raw_response: response, parser: parser)
    end
  end
end
