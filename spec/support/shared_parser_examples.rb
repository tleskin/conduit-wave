require 'spec_helper'

shared_examples_for 'parser success response' do
  its(:response_status) { should eql 'success' }
  its(:response_errors) { should be_empty }
end

shared_examples_for 'parser failure response' do
  its(:response_status) { should eql 'failure' }
  its(:response_errors) { should_not be_empty }
end

shared_examples_for 'parser error response' do
  its(:response_errors) do
    expected = { 'base' => 'Unexpected response from server.' }
    should eql expected
  end

  its(:response_status) { should eql 'error' }
end
