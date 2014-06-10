# Require Files
#
require 'rails'
require 'active_record'
require 'conduit/wave'
require 'conduit/wave/driver'

# Load all of the _spec.rb files
#
Dir[File.join(File.dirname(__FILE__), 'support', '**', '*.rb')].each do |f|
  require f
end

# Rspec Configuration
#
RSpec.configure do |config|
  config.before(:suite) do
    Excon.defaults[:mock] = true
  end
end
