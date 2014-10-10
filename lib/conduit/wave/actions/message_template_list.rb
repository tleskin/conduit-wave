module Conduit::Driver::Wave
  class MessageTemplateList < Conduit::Driver::Wave::Base
    url_route          '/message_templates'
    required_attributes *(Conduit::Driver::Wave.credentials)
    http_method         :get
  end
end
