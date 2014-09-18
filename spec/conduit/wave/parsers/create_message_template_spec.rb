require 'spec_helper'

describe Conduit::Driver::Wave::CreateMessageTemplate::Parser do
  include ServerResponse

  subject               { described_class.new(server_response) }
  let(:collection_node) { 'message_templates' }

  context 'successful message template creation' do
    let(:response_file) { %w(create_message_template success.json) }
    it_should_behave_like 'parser success response'

    its(:message_template_id) { should eql response_hash['id'] }
    its(:sender)              { should eql response_hash['sender'] }
    its(:body)                { should eql response_hash['body'] }
    its(:delivery_mechanism)  { should eql response_hash['delivery_mechanism'] }
    its(:profile_id)          { should eql response_hash['profile_id'] }
  end

  context 'unsuccessful message template creation' do
    let(:response_file) { %w(create_message_template failure.json) }
    it_should_behave_like 'parser failure response'
  end

  context 'unexpected server response' do
    let(:response_file)   { %w(error.json) }
    it_should_behave_like 'parser error response'
  end
end
