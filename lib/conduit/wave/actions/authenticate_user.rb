module Conduit::Driver::Wave
  class AuthenticateUser < Conduit::Driver::Wave::Base
    url_route           '/users/sessions.json'
    required_attributes :email, :password
    http_method         :post
  end
end
