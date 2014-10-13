module Conduit::Driver::Wave
  class CreateProfile < Conduit::Driver::Wave::Base
    url_route          '/profiles'
    required_attributes *Conduit::Driver::Wave.credentials, :name
    optional_attributes :provider, :credentials
    http_method         :post
  end
end
