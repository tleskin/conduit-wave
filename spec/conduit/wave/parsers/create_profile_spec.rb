require 'spec_helper'

describe Conduit::Driver::Wave::CreateProfile::Parser do
  include ServerResponse

  subject { described_class.new(server_response) }

  context 'successful profile creation' do
    let(:response_file) { %w(create_profile success.json) }
    it_should_behave_like 'parser success response'
  end

  context 'unsuccessful profile creation' do
    let(:response_file) { %w(create_profile failure.json) }
    it_should_behave_like 'parser failure response'
  end

  context 'profile creation error' do
    let(:response_file)   { %w(error.json) }
    it_should_behave_like 'parser error response'
  end

  context 'internal server error in wave' do
    let(:response_file)   { %w(ise.json) }
    it_should_behave_like 'parser error response'
  end
end
