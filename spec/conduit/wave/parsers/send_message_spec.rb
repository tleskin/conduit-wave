require 'spec_helper'

describe Conduit::Driver::Wave::SendMessage::Parser do
  include ServerResponse

  subject { described_class.new(server_response) }

  context 'successful message sent' do
    let(:response_file) { %w(send_message success.json) }
    it_should_behave_like 'parser success response'

    its(:message_id) do
      should eql response_hash_item('outbound_messages')['id']
    end

    its(:recipient) do
      should eql response_hash_item('outbound_messages')['recipient']
    end

    its(:message) do
      should eql response_hash_item('outbound_messages')['message']
    end

    its(:message_template_id) do
      should eql response_hash_item('outbound_messages')['message_template_id']
    end

    its(:identifier) do
      should eql response_hash_item('outbound_messages')['identifier']
    end
  end

  context 'unsuccessful message sent' do
    let(:response_file) { %w(send_message failure.json) }
    it_should_behave_like 'parser failure response'
  end

  context 'unexpected server response' do
    let(:response_file)   { %w(error.json) }
    it_should_behave_like 'parser error response'
  end
end
