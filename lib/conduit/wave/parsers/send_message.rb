require 'conduit/wave/parsers/base'

module Conduit::Driver::Wave
  # Parse the response from the order creation
  # endpoint of Wave Api
  class SendMessage::Parser < Parser::Base
    attribute :message_id do
      object_path('outbound_messages/0/id')
    end

    attribute :sender do
      object_path('outbound_messages/0/sender')
    end

    attribute :recipient do
      object_path('outbound_messages/0/recipient')
    end

    attribute :message do
      object_path('outbound_messages/0/message')
    end

    attribute :message_template_id do
      object_path('outbound_messages/0/message_template_id')
    end

    attribute :delivery_mechanism do
      object_path('outbound_messages/0/delivery_mechanism')
    end

    attribute :identifier do
      object_path('outbound_messages/0/identifier')
    end

    def response_content?
      !object_path('outbound_messages').nil?
    end
  end
end
