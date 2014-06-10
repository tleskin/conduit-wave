require 'spec_helper'

describe Conduit::Driver::Wave::ListProfiles::Parser do
  include JsonResponses

  subject { described_class.new(list_profiles_json_response) }

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
          result.should eql response_hash['profiles'][0][attr_id.to_s]
        end
      end
    end
  end

  def response_hash
    @response_hash ||= MultiJson.load(list_profiles_json_response)
  end
end
