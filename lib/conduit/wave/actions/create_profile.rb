require 'conduit/wave/actions/base'

module Conduit::Driver::Wave
  class CreateProfile < Conduit::Driver::Wave::Base
    url_route          '/profiles'
    required_attributes :name
    optional_attributes :provider, :credentials
    http_method         :post
  end
end
