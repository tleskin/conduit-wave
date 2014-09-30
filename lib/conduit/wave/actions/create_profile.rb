require 'conduit/wave/configuration'

module Conduit::Driver::Wave
  class CreateProfile < Conduit::Driver::Wave::Base
    remote_url "#{Conduit::Wave::Configuration.api_host}/profiles"

    required_attributes *Conduit::Driver::Wave.credentials, :name
    optional_attributes :provider, :credentials
  end
end
