require 'conduit/wave/actions/base'

module Conduit::Driver::Wave
  class ProfileList < Conduit::Driver::Wave::Base
    url_route          '/profiles'
    http_method         :get
  end
end
