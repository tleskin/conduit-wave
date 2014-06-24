require 'spec_helper'

describe Conduit::Driver::Wave::ProfileList do
  subject do
    described_class.new(
      token: 'foo-bar'
    )
  end

  its(:remote_url) { should =~ /\/profiles\z/ }

  %i(token).each do |required_attr|
    context "##{required_attr}" do
      it 'should be a required attribute' do
        subject.requirements.should include required_attr
      end
    end
  end
end
