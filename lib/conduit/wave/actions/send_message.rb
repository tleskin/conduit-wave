require 'conduit/wave/configuration'

module Conduit::Driver::Wave
  # Create an outbound message in Wave
  class SendMessage < Conduit::Core::Action
    remote_url "#{Conduit::Wave::Configuration.api_host}/outbound_messages"

    required_attributes *Conduit::Driver::Wave.credentials,
      :recipient, :message_template_id

    optional_attributes :payload

    # Required entry method, the main driver
    # class will use this to trigger the
    # request.
    #
    def perform
      request(
        body:     view,
        method:   :post,
        headers:  { 'Content-Type' => 'application/json' }
      )
    end
  end
end
