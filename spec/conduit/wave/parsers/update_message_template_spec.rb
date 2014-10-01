require 'spec_helper'

describe Conduit::Driver::Wave::UpdateMessageTemplate::Parser do
  include ServerResponse
  include JsonResponses

  subject { described_class.new(update_message_template_json_response) }

  its(:message_template_id) { should eql response_hash['id'] }
  its(:sender)              { should eql response_hash['sender'] }
  its(:body)                { should eql response_hash['body'] }
  its(:delivery_mechanism)  { should eql response_hash['delivery_mechanism'] }
  its(:profile_id)          { should eql response_hash['profile_id'] }

  def response_hash
    @response_hash ||= MultiJson.load(update_message_template_json_response)
    @response_hash['message_templates'][0]
  end

  context 'unexpected response from server' do
    subject { described_class.new(server_response) }
    let(:response_file)   { %w(error.json) }
    it_should_behave_like 'parser error response'
  end

  context 'internal server error in wave' do
    subject { described_class.new(server_response) }
    let(:response_file)   { %w(ise.json) }
    it_should_behave_like 'parser error response'
  end
end
