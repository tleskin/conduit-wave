require 'spec_helper'

describe Conduit::Driver::Wave::CreateMessageTemplate do
  subject do
    described_class.new(
      token:              'foo-bar',
      profile_id:         1,
      body:               'Your PIN is {{pin}}',
      sender:             '2125551212',
      delivery_mechanism: 'sms'
    )
  end

  its(:remote_url) { should =~ /\/message_templates\z/ }

  %i(profile_id body sender delivery_mechanism).each do |required_attr|
    context "##{required_attr}" do
      it 'should be a required attribute' do
        subject.requirements.should include required_attr
      end
    end
  end
end
