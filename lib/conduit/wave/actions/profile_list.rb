module Conduit::Driver::Wave
  class ProfileList < Conduit::Driver::Wave::Base
    remote_url "#{Conduit::Wave::Configuration.api_host}/profiles"
    required_attributes *(Conduit::Driver::Wave.credentials)

    # Required entry method, the main driver
    # class will use this to trigger the
    # request.
    #
    def perform
      response = request(body: view, method: :get)
      parser   = parser_class.new(response.body)
      Conduit::ApiResponse.new(raw_response: response, parser: parser)
    end
  end
end
