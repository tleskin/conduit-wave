require 'spec_helper'

describe Conduit::Driver::Wave::Parser::Base do
  include ServerResponse

  subject do
    class SampleParser < Conduit::Driver::Wave::Parser::Base
      def response_content?
        true
      end
    end

    SampleParser.new(server_response)
  end

  let(:response_file) { %w(create_message_template success.json) }

  context 'with a json response to a valid request' do
    describe '#object_path' do
      context 'when the path has one segment' do
        it 'should return the object at that location' do
          subject.send(:object_path, 'message_templates').
            should be_a_kind_of(Array)
        end
      end

      context 'when the path includes an index into an array' do
        it 'should return the object at that location' do
          subject.send(:object_path, 'message_templates/0').
            should be_a_kind_of(Hash)
        end
      end

      context 'when the path includes the attribute of an indexed array element' do
        it 'should return the attribute at that location' do
          subject.send(:object_path, 'message_templates/0/delivery_mechanism').
            should eql 'sms'
        end
      end
    end

    describe '#response_status' do
      its(:response_status) { should eql 'success' }
    end

    describe '#response_errors' do
      its(:response_errors) { should be_empty }
    end
  end

  context 'with a json response that includes errors' do
    let(:response_file) { %w(create_message_template failure.json) }

    describe '#response_status' do
      its(:response_status) { should eql 'failure' }
    end

    describe '#response_errors' do
      its(:response_errors) { should_not be_empty }
    end
  end
end
