module Conduit::Driver::Wave
  class CreateMessageTemplate < Conduit::Driver::Wave::Base
    url_route          '/message_templates'
    required_attributes *Conduit::Driver::Wave.credentials,
                         :profile_id, :body, :sender, :delivery_mechanism
    optional_attributes :name, :subject, :email_format
    http_method         :post
  end
end
