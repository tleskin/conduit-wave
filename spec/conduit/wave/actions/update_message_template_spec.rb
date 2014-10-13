require 'spec_helper'

describe Conduit::Driver::Wave::UpdateMessageTemplate do
  subject do
    described_class.new(
      token:                'foo-bar',
      message_template_id:  1,
      profile_id:           1,
      body:                 'Your PIN is {{pin}}',
      sender:               '2125551212',
      delivery_mechanism:   'sms'
    )
  end

  %i(token profile_id message_template_id body sender delivery_mechanism).
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
        profile_id:           1,
        body:                 'Your PIN is {{pin}}',
        sender:               '2125551212',
        delivery_mechanism:   'sms',
        format:               'test',
        host_override: 'http://www.hello-labs.com'
      )
    end

    its(:remote_url) { should =~ /hello-labs/ }
  end

  it_should_behave_like 'parser error response' do
    subject do
      described_class.new(
        token:                'foo-bar',
        message_template_id:  1,
        profile_id:           1,
        body:                 'Your PIN is {{pin}}',
        sender:               '2125551212',
        delivery_mechanism:   'sms',
        format:               'test',
        mock_status: :error
      ).perform.parser
    end
  end

  it_should_behave_like 'parser failure response' do
    subject do
      described_class.new(
        token:                'foo-bar',
        message_template_id:  1,
        profile_id:           1,
        body:                 'Your PIN is {{pin}}',
        sender:               '2125551212',
        delivery_mechanism:   'sms',
        format:               'test',
        mock_status: :failure
      ).perform.parser
    end
  end

  it_should_behave_like 'parser success response' do
    subject do
      described_class.new(
        token:                'foo-bar',
        message_template_id:  1,
        profile_id:           1,
        body:                 'Your PIN is {{pin}}',
        sender:               '2125551212',
        delivery_mechanism:   'sms',
        format:               'test',
        mock_status: :success
      ).perform.parser
    end
  end 
end
