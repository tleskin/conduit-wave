require 'conduit/wave/configuration'

module Conduit::Driver::Wave
  class AuthenticateUser < Conduit::Core::Action
    remote_url "#{Conduit::Wave::Configuration.api_host}/users/sessions.json"

    required_attributes :email, :password

    # Required entry method, the main driver
    # class will use this to trigger the
    # request.
    #
    def perform
      request(
        body:     view,
        method:   :post,
        headers:  { 'Content-Type' => 'application/json' }
      )
    end
  end
end
