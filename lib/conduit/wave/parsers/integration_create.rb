require 'conduit/wave/parsers/base'

module Conduit::Driver::Wave
  class IntegrationCreate::Parser < Parser::Base
    attribute :integration_id do
      object_path('integrations/0/id')
    end

    attribute :profile_id do
      object_path('integrations/0/profile_id')
    end

    attribute :driver do
      object_path('integrations/0/driver')
    end

    attribute :credentials do
      object_path('integrations/0/credentials')
    end

    def response_content?
      !object_path('integrations').nil?
    end
  end
end
