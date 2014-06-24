require 'spec_helper'

describe Conduit::Driver::Wave::MessageTemplateList::Parser do
  include JsonResponses

  subject { described_class.new(list_message_templates_json_response) }

  its(:message_template_count) do
    should eql response_hash['message_templates'].size
  end

  its(:message_templates) { should_not be_nil }
  its('message_templates.size') do
    should eql response_hash['message_templates'].size
  end

  describe '#message_templates' do
    %i(sender body delivery_mechanism profile_id template_id).each do |attr_id|
      context "##{attr_id}" do
        it 'should be supported' do
          subject.message_templates.each do |message_template|
            message_template.should respond_to(attr_id)
          end
        end

        it 'should map the corresponding json attribute' do
          result = subject.message_templates.first.send(attr_id)

          attr_id = 'id' if attr_id == :template_id
          result.should eql response_hash['message_templates'][0][attr_id.to_s]
        end
      end
    end
  end

  def response_hash
    @response_hash ||= MultiJson.load(list_message_templates_json_response)
  end
end
