require 'conduit/wave/parsers/base'

module Conduit::Driver::Wave
  # Parse the response from the order creation
  # endpoint of Wave Api
  class CreateUser::Parser < Parser::Base
    attribute :user_id do
      object_path('users/0/id')
    end

    attribute :first_name do
      object_path('users/0/first_name')
    end

    attribute :last_name do
      object_path('users/0/last_name')
    end

    attribute :email do
      object_path('users/0/email')
    end

    def response_content?
      !object_path('users').nil?
    end
  end
end
