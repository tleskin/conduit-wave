require 'spec_helper'

shared_examples_for 'parser success response' do
  it                      { should be_an_instance_of parser }
  its(:response_status)   { should eql 'success' }
  its(:response_errors)   { should be_empty }
end

shared_examples_for 'parser failure response' do
  it                    { should be_an_instance_of parser }
  its(:response_status) { should eql 'failure' }
  its(:response_errors) { should_not be_empty }
end

shared_examples_for 'parser error response' do
  its(:response_errors) do
    expected = { 'base' => 'Unexpected response from server.' }
    should eql expected
  end
  it                    { should be_an_instance_of parser }
  its(:response_status) { should eql 'error' }
  its(:response_errors) { should_not be_empty }
end

def parser  
  if described_class.name.include?('Parser')
    described_class
  else
    klass_name = ActiveSupport::Inflector.demodulize(described_class.name) + '::Parser'
    klass = Object.const_get klass_name
  end
end
