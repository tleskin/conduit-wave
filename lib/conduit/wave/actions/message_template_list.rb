require 'conduit/wave/actions/base'

module Conduit::Driver::Wave
  class MessageTemplateList < Conduit::Driver::Wave::Base
    url_route          '/message_templates'
    http_method         :get
  end
end
