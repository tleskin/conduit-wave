require 'conduit/wave/parsers/base'

module Conduit::Driver::Wave
  # Parse the response from the order creation
  # endpoint of Wave Api
  class AuthenticateUser::Parser < Parser::Base
    def response_errors
      return unexpected_response_hash['errors'] if !response_content?
      object_path('error') || []
    end

    attribute :email do
      object_path('email')
    end

    attribute :auth_token do
      object_path('auth_token')
    end

    def response_content?
      !(object_path('auth_token').nil? && object_path('email').nil?) ||
        !object_path('error').nil?
    end
  end
end
