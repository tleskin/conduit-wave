require 'conduit/wave/actions/base'

module Conduit::Driver::Wave
  class UpdateMessageTemplate < Conduit::Driver::Wave::Base
    url_route          '/message_templates'
    required_attributes :message_template_id, :profile_id, :body, :sender,
                        :delivery_mechanism

    optional_attributes :subject, :format

    # Required entry method, the main driver
    # class will use this to trigger the
    # request.
    #
    def perform_request
      response = request(
        body:   view,
        method: :put,
        path:   "message_templates/#{@options[:message_template_id]}"
      )
      parser   = parser_class.new(response.body)
      Conduit::ApiResponse.new(raw_response: response, parser: parser)
    end
  end
end
