module Conduit::Driver::Wave
  class ProfileList < Conduit::Driver::Wave::Base
    url_route          '/profiles'
    required_attributes *(Conduit::Driver::Wave.credentials)
    http_method         :get
  end
end
