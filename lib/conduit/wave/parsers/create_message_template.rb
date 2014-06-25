require 'conduit/wave/parsers/base'

module Conduit::Driver::Wave
  # Parse the response from the order creation
  # endpoint of Wave Api
  class CreateMessageTemplate::Parser < Parser::Base
    attribute :message_template_id do
      object_path('message_templates/0/id')
    end

    attribute :sender do
      object_path('message_templates/0/sender')
    end

    attribute :body do
      object_path('message_templates/0/body')
    end

    attribute :name do
      object_path('message_templates/0/name')
    end

    attribute :delivery_mechanism do
      object_path('message_templates/0/delivery_mechanism')
    end

    attribute :profile_id do
      object_path('message_templates/0/profile_id')
    end
  end
end
