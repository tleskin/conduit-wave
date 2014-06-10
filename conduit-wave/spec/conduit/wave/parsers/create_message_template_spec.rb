require 'spec_helper'

describe Conduit::Driver::Wave::CreateMessageTemplate::Parser do
  include JsonResponses

  subject { described_class.new(create_message_template_json_response) }

  its(:message_template_id) { should eql response_hash['id'] }
  its(:sender)              { should eql response_hash['sender'] }
  its(:body)                { should eql response_hash['body'] }
  its(:delivery_mechanism)  { should eql response_hash['delivery_mechanism'] }
  its(:profile_id)          { should eql response_hash['profile_id'] }

  def response_hash
    @response_hash ||= MultiJson.load(create_message_template_json_response)
    @response_hash['message_templates'][0]
  end
end
