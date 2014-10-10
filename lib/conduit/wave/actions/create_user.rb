module Conduit::Driver::Wave
  class CreateUser < Conduit::Driver::Wave::Base
    url_route          '/users.json'
    required_attributes :first_name, :last_name, :email,
                        :password, :password_confirmation
    http_method         :post
  end
end
