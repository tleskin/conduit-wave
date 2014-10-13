require 'conduit/wave/version'
require 'conduit/wave/configuration'
require 'conduit/wave/request_mocker'
require 'conduit'

# Set the driver path
Conduit.configure do |config|
  config.driver_paths << File.join(File.dirname(__FILE__), 'wave')
end
