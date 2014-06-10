require 'spec_helper'

describe Conduit::Driver::Wave::SendMessage::Parser do
  include JsonResponses

  subject { described_class.new(send_message_json_response) }

  its(:message_id)          { should eql response_hash['id'] }
  its(:recipient)           { should eql response_hash['recipient'] }
  its(:message)             { should eql response_hash['message'] }
  its(:message_template_id) { should eql response_hash['message_template_id'] }
  its(:identifier)          { should eql response_hash['identifier'] }

  def response_hash
    @response_hash ||= MultiJson.load(send_message_json_response)
    @response_hash['outbound_messages'][0]
  end
end
