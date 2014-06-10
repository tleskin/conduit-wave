require 'conduit/wave/parsers/base'

module Conduit::Driver::Wave
  # Parse the response from the order creation
  # endpoint of Wave Api
  class ListMessageTemplates::Parser < Parser::Base
    attribute :message_template_count do
      object_path('meta/pagination/total_count')
    end

    attribute :products do
      object_path('message_templates').map do |message_template_attr|
        template_attr = template_attributes_from(message_template_attr)
        OpenStruct.new(template_attr)
      end
    end

    private

    def template_attributes_from(message_template_attr = {})
      template_attr_id = %w(sender body delivery_mechanism profile_id)
      template_attr = message_template_attr.slice(*template_attr_id)
      template_attr.merge('template_id' => product_attr['id'])
    end
  end
end
