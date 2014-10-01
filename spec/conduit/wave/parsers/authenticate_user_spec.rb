require 'spec_helper'

describe Conduit::Driver::Wave::AuthenticateUser::Parser do
  include ServerResponse

  subject { described_class.new(server_response) }

  context 'successful user authentication' do
    let(:response_file) { %w(authenticate_user success.json) }
    it_should_behave_like 'parser success response'
  end

  context 'unsuccessful user authentication' do
    let(:response_file) { %w(authenticate_user failure.json) }
    it_should_behave_like 'parser failure response'
  end

  context 'user authentication error' do
    let(:response_file)   { %w(error.json) }
    it_should_behave_like 'parser error response'
  end

  context 'internal server error in wave' do
    let(:response_file)   { %w(ise.json) }
    it_should_behave_like 'parser error response'
  end
end
