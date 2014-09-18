require 'spec_helper'

describe Conduit::Driver::Wave::CreateMessageTemplate::Parser do
  include ServerResponse

  subject { described_class.new(server_response) }

end
