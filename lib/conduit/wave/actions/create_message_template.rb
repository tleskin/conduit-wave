require 'conduit/wave/configuration'

module Conduit::Driver::Wave
  class CreateMessageTemplate < Conduit::Core::Action
    remote_url "#{Conduit::Wave::Configuration.api_host}/message_templates"

    required_attributes *Conduit::Driver::Wave.credentials,
      :profile_id, :body, :sender, :delivery_mechanism

    optional_attributes :name

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
