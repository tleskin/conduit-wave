module Conduit::Driver::Wave
  # Create an outbound message in Wave
  class SendMessage < Conduit::Driver::Wave::Base
    url_route          '/outbound_messages'
    required_attributes *Conduit::Driver::Wave.credentials,
                         :recipient, :message_template_id
    optional_attributes :payload
    http_method         :post
  end
end
