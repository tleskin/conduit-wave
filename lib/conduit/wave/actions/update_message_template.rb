module Conduit::Driver::Wave
  class UpdateMessageTemplate < CreateMessageTemplate
    required_attributes *Conduit::Driver::Wave.credentials,
      :message_template_id, :profile_id, :body, :sender, :delivery_mechanism

    optional_attributes :subject, :format

    # Required entry method, the main driver
    # class will use this to trigger the
    # request.
    #
    def perform
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
