# Default url, required_attributes, and Content-Type for
# Wave API.
#
module Conduit::Driver::Wave
  class Base < Conduit::Core::Action
    Excon.defaults[:headers]['Content-Type'] = 'application/json'
  end
end
