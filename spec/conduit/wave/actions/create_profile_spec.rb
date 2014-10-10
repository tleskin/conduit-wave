require 'spec_helper'

describe Conduit::Driver::Wave::CreateProfile do
  context 'when providing a override host' do
    subject do
      described_class.new(
        token:         'foo-bar',
        name:          'test',
        provider:      'twilio',
        host_override: 'http://www.hello-labs.com'
      )
    end

    its(:remote_url) { should =~ /hello-labs/ }
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        token:         'foo-bar',
        name:          'test',
        provider:      'twilio',
        mock: :error
      ).perform.parser
    end
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        token:         'foo-bar',
        name:          'test',
        provider:      'twilio',
        mock: :failure
      ).perform.parser
    end
  end

  it_should_behave_like 'parser success response' do
    subject do
      described_class.new(
        token:         'foo-bar',
        name:          'test',
        provider:      'twilio',
        mock: :success
      ).perform.parser
    end
  end
end
