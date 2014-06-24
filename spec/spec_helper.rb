# Require Files
#
require 'conduit/wave'
require 'conduit/wave/driver'
require 'rspec/its'

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
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
