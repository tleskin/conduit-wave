require 'spec_helper'

describe Conduit::Driver::Wave::CreateMessageTemplate::Parser do
  include ServerResponse

  subject               { described_class.new(server_response) }
  let(:collection_node) { 'message_templates' }

  context 'successful message template creation' do
    let(:response_file) { %w(create_message_template success.json) }
    it_should_behave_like 'parser success response'

    its(:message_template_id) do
      should eql response_hash_item('message_templates')['id']
    end

    its(:sender) do
      should eql response_hash_item('message_templates')['sender']
    end

    its(:body) do
      should eql response_hash_item('message_templates')['body']
    end

    its(:delivery_mechanism) do
      should eql response_hash_item('message_templates')['delivery_mechanism']
    end

    its(:profile_id) do
      should eql response_hash_item('message_templates')['profile_id']
    end
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
