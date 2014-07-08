require 'conduit/wave/configuration'

module Conduit::Driver::Wave
  class CreateUser < Conduit::Core::Action
    remote_url "#{Conduit::Wave::Configuration.api_host}/users"

    required_attributes :first_name, :last_name, :email,
      :password, :password_confirmation

    def perform
      request(
        body:    view,
        method:  :post,
        headers: { 'Content-Type' => 'application/json' }
      )
    end
  end
end
