module Conduit::Driver::Wave
  # Create an outbound message in Wave
  class SendMessage < Conduit::Driver::Wave::Base
    remote_url "#{Conduit::Wave::Configuration.api_host}/outbound_messages"

    required_attributes *Conduit::Driver::Wave.credentials,
      :recipient, :message_template_id

    optional_attributes :payload
  end
end
