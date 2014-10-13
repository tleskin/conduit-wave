require 'spec_helper'

describe Conduit::Driver::Wave::IntegrationCreate do
  context 'when providing a override host' do
    subject do
      described_class.new(
        token:         'foo-bar',
        driver:        'atom',
        profile_id:    1,
        credentials:{
          token: :token
        },
        host_override: 'http://www.hello-labs.com'
      )
    end

    its(:remote_url) { should =~ /hello-labs/ }
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        token:         'foo-bar',
        driver:        'atom',
        profile_id:    1,
        credentials:{
          token: :token
        },
        mock_status: :error
      ).perform.parser
    end
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        token:         'foo-bar',
        driver:        'atom',
        profile_id:    1,
        credentials:{
          token: :token
        },
        mock_status: :failure
      ).perform.parser
    end
  end

  it_should_behave_like 'parser success response' do
    subject do
      described_class.new(
        token:         'foo-bar',
        driver:        'atom',
        profile_id:    1,
        credentials:{
          token: :token
        },
        mock_status: :success
      ).perform.parser
    end
  end
end
