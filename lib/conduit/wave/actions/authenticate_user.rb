require 'conduit/wave/configuration'

module Conduit::Driver::Wave
  class AuthenticateUser < Conduit::Driver::Wave::Base
    remote_url "#{Conduit::Wave::Configuration.api_host}/users/sessions.json"

    required_attributes :email, :password
  end
end
