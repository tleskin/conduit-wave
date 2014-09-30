require 'spec_helper'

describe Conduit::Driver::Wave::ProfileList::Parser do
  include ServerResponse

  subject { described_class.new(server_response) }

  context 'successful profile list' do
    let(:response_file) { %w(profile_list success.json) }

    its(:profile_count) do
      should eql response_hash['profiles'].size
    end

    its(:profiles) { should_not be_nil }
    its('profiles.size') do
      should eql response_hash['profiles'].size
    end

    describe '#profiles' do
      %i(name answer transcribable max_session_length tts_voice profile_id).
        each do |attr_id|
        context "##{attr_id}" do
          it 'should be supported' do
            subject.profiles.each do |profile|
              profile.should respond_to(attr_id)
            end
          end

          it 'should map the corresponding json attribute' do
            result = subject.profiles.first.send(attr_id)

            attr_id = 'id' if attr_id == :profile_id
            result.should eql response_hash_item('profiles')[attr_id.to_s]
          end
        end
      end
    end
  end

  context 'unsuccessful profile list' do
    let(:response_file) { %w(profile_list failure.json) }
    it_should_behave_like 'parser failure response'
  end

  context 'unexpected server response' do
    let(:response_file)   { %w(error.json) }
    it_should_behave_like 'parser error response'
  end
end
