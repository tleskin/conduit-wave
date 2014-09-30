require 'spec_helper'

describe Conduit::Driver::Wave::IntegrationCreate::Parser do
  include ServerResponse

  subject { described_class.new(server_response) }

  context 'successful integration create' do
    let(:response_file) { %w(integration_create success.json) }
    it_should_behave_like 'parser success response'
  end

  context 'unsuccessful integration create' do
    let(:response_file) { %w(integration_create failure.json) }
    it_should_behave_like 'parser failure response'
  end

  context 'unexpected server response' do
    let(:response_file)   { %w(error.json) }
    it_should_behave_like 'parser error response'
  end
end

