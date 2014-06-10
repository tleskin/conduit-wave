require 'conduit/wave/version'
require 'conduit/wave/configuration'

require 'conduit/engine'
require 'conduit'

# Railtie is needed to ensure we're loading
# the conduit configuration after conduit
# has loaded it's own configuration
#
class ConduitRailtie < Rails::Railtie
  initializer 'conduit-wave.configure', after: 'conduit.load_app_root' do |app|

    # Set the driver path
    Conduit::Configuration.configure do |config|
      config.driver_paths << File.join(File.dirname(__FILE__), 'wave')
    end

  end
end

