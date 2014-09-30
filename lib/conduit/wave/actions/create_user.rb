require 'conduit/wave/configuration'

module Conduit::Driver::Wave
  class CreateUser < Conduit::Driver::Wave::Base
    remote_url "#{Conduit::Wave::Configuration.api_host}/users.json"

    required_attributes :first_name, :last_name, :email,
      :password, :password_confirmation
  end
end
