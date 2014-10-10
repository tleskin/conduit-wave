require 'spec_helper'

describe Conduit::Driver::Wave::IntegrationList do
  context 'when providing a override host' do
    subject do
      described_class.new(
        token:         'foo-bar',
        host_override: 'http://www.hello-labs.com'
      )
    end

    its(:remote_url) { should =~ /hello-labs/ }
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        token:              'foo-bar',
        mock: :error
      ).perform.parser
    end
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        token:              'foo-bar',
        mock: :failure
      ).perform.parser
    end
  end

  it_should_behave_like 'parser success response' do
    subject do
      described_class.new(
        token:              'foo-bar',
        mock: :success
      ).perform.parser
    end
  end
end
