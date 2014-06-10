require 'spec_helper'
require 'conduit/wave/parsers/base'

describe Conduit::Driver::Wave::Parser::Base do
  include JsonResponses

  context 'with a json response to a valid request' do
    subject { described_class.new(query_line_json_response) }

    describe '#object_path' do
      context 'when the path has one segment' do
        it 'should return the object at that location' do
          subject.send(:object_path, 'lines').should be_a_kind_of(Array)
        end
      end

      context 'when the path includes an index into an array' do
        it 'should return the object at that location' do
          subject.send(:object_path, 'lines/0').should be_a_kind_of(Hash)
        end
      end

      context 'when the path includes the attribute of an indexed array element' do
        it 'should return the attribute at that location' do
          subject.send(:object_path, 'lines/0/mdn').should eql '8658248958'
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
    subject { described_class.new(error_json_response) }

    describe '#response_status' do
      its(:response_status) { should eql 'failure' }
    end

    describe '#response_errors' do
      its(:response_errors) { should_not be_empty }
    end
  end
end
