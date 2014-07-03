require 'conduit/wave/configuration'

module Conduit::Driver::Wave
  class UpdateMessageTemplate < CreateMessageTemplate
    remote_url Conduit::Wave::Configuration.api_host

    required_attributes *Conduit::Driver::Wave.credentials,
      :message_template_id, :profile_id, :body, :sender, :delivery_mechanism

    optional_attributes :subject, :format

    # Required entry method, the main driver
    # class will use this to trigger the
    # request.
    #
    def perform
      request(
        body:     view,
        method:   :put,
        path:     "message_templates/#{@options[:message_template_id]}",
        headers:  { 'Content-Type' => 'application/json' }
      )
    end
  end
end
