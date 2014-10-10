require 'spec_helper'

describe Conduit::Driver::Wave::SendMessage do
  subject do
    described_class.new(
      token:                'foo-bar',
      message_template_id:  1,
      recipient:            '2125551212',
      payload:              { pin: '123456' }
    )
  end

  its(:remote_url) { should =~ /\/outbound_messages\z/ }

  %i(token message_template_id recipient).
    each do |required_attr|
    context "##{required_attr}" do
      it 'should be a required attribute' do
        subject.requirements.should include required_attr
      end
    end
  end

  context 'when providing a override host' do
    subject do
      described_class.new(
        token:                'foo-bar',
        message_template_id:  1,
        recipient:            '2125551212',
        payload:              { pin: '123456' },
        host_override: 'http://www.hello-labs.com'
      )
    end

    its(:remote_url) { should =~ /hello-labs/ }
  end

  context "#payload" do
    it 'should not be a required attribute' do
      subject.requirements.should_not include :payload
    end
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        token:                'foo-bar',
        message_template_id:  1,
        recipient:            '2125551212',
        payload:              { pin: '123456' },
        mock:  :error
      ).perform.parser
    end
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        token:                'foo-bar',
        message_template_id:  1,
        recipient:            '2125551212',
        payload:              { pin: '123456' },
        mock:  :failure
      ).perform.parser
    end
  end

  it_should_behave_like 'parser success response' do
    subject do
      described_class.new(
        token:                'foo-bar',
        message_template_id:  1,
        recipient:            '2125551212',
        payload:              { pin: '123456' },
        mock:  :success
      ).perform.parser
    end
  end
end
