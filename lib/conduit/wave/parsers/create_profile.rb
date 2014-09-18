require 'conduit/wave/parsers/base'

module Conduit::Driver::Wave
  # Parse the response from the order creation
  # endpoint of Wave Api
  class CreateProfile::Parser < Parser::Base
    attribute :profile_id do
      object_path('profiles/0/id')
    end

    attribute :name do
      object_path('profiles/0/name')
    end

    attribute :credentials do
      object_path('profiles/0/credentials')
    end

    attribute :provider do
      object_path('profiles/0/provider')
    end

    def response_content?
      !object_path('profiles').nil?
    end
  end
end
