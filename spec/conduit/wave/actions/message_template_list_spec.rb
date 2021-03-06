require 'spec_helper'

describe Conduit::Driver::Wave::MessageTemplateList do
  subject do
    described_class.new(
      token: 'foo-bar'
    )
  end

  its(:remote_url) { should =~ /\/message_templates\z/ }

  %i(token).each do |required_attr|
    context "##{required_attr}" do
      it 'should be a required attribute' do
        subject.requirements.should include required_attr
      end
    end
  end

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
        mock_status: :error
      ).perform.parser
    end
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        token:              'foo-bar',
        mock_status: :failure
      ).perform.parser
    end
  end

  it_should_behave_like 'parser success response' do
    subject do
      described_class.new(
        token:              'foo-bar',
        mock_status: :success
      ).perform.parser
    end
  end
end
