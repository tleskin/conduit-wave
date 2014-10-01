require 'spec_helper'

describe Conduit::Driver::Wave::IntegrationList::Parser do
  include ServerResponse

  subject { described_class.new(server_response) }

  context 'successful integration list' do
    let(:response_file) { %w(integration_list success.json) }
    it_should_behave_like 'parser success response'
  end

  context 'unsuccessful integration list' do
    let(:response_file) { %w(integration_list failure.json) }
    it_should_behave_like 'parser failure response'
  end

  context 'unexpected server response' do
    let(:response_file)   { %w(error.json) }
    it_should_behave_like 'parser error response'
  end

  context 'internal server error in wave' do
    let(:response_file)   { %w(ise.json) }
    it_should_behave_like 'parser error response'
  end
end
