require 'conduit/wave/parsers/base'

module Conduit::Driver::Wave
  class IntegrationList::Parser < Parser::Base
    attribute :integration_count do
      object_path('meta/pagination/total_count')
    end

    attribute :integrations do
      object_path('integrations').map do |integration_attr|
        attr = integration_attr.slice('profile_id', 'driver', 'credentials')
        attr.merge('integration_id' => integration_attr('id'))

        integration_class = ::Struct.new(*attr.keys.map(&:to_sym))
        integration_class.new.tap do |instance|
          attr.each { |k, v| instance[k] = v }
        end
      end
    end

    def response_content?
      !object_path('integrations').nil?
    end
  end
end
