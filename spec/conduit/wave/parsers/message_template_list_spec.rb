require 'spec_helper'

describe Conduit::Driver::Wave::MessageTemplateList::Parser do
  include ServerResponse

  subject { described_class.new(server_response) }

  context 'successful message template list' do
    let(:response_file) { %w{message_template_list success.json} }
    it_should_behave_like 'parser success response'

    its(:message_template_count) do
      should eql response_hash['message_templates'].size
    end

    its(:message_templates) { should_not be_nil }

    its('message_templates.size') do
      should eql response_hash['message_templates'].size
    end

    describe '#message_templates' do
      %i(sender body delivery_mechanism profile_id message_template_id).each do |attr_id|
        context "##{attr_id}" do
          it 'should be supported' do
            subject.message_templates.each do |message_template|
              message_template.should respond_to(attr_id)
            end
          end

          it 'should map the corresponding json attribute' do
            result = subject.message_templates.first.send(attr_id)

            attr_id = 'id' if attr_id == :message_template_id
            result.should eql response_hash_item('message_templates')[attr_id.to_s]
          end
        end
      end
    end
  end

  context 'unsuccessful message template list' do
    let(:response_file) { %w(message_template_list failure.json) }
    it_should_behave_like 'parser failure response'
  end

  context 'message template lsit error' do
    let(:response_file)   { %w(error.json) }
    it_should_behave_like 'parser error response'
  end
end
