# Default url, required_attributes, and Content-Type for
# Wave API.
#
require 'forwardable'

module Conduit::Driver::Wave
  class Base < Conduit::Core::Action
    extend Forwardable

    def_delegator :'self.class', :http_method
    def_delegator :'self.class', :url_route

    def self.inherited(base)
      base.send :required_attributes, *(Conduit::Driver::Wave.credentials)
      base.send :required_attributes, *(Conduit::Driver::Wave.required_attributes)
      base.send :optional_attributes, *(Conduit::Driver::Wave.optional_attributes)
    end

    class << self
      def http_method(http_method = nil)
        @http_method = http_method unless http_method.nil?
        @http_method
      end

      def url_route(url_route = nil)
        @url_route = url_route unless url_route.nil?
        @url_route
      end
    end

    def perform
      if mock_mode?
        mocker = request_mocker.new(self, @options)
        mocker.with_mocking { perform_request }
      else
        perform_request
      end
    end

    def remote_url
      if host_override?
        @options[:host_override] + url_route
      else
        Conduit::Wave::Configuration.api_host + url_route
      end
    end

    def perform_request
      response = request(body: view, method: http_method, headers: http_headers)
      parser   = parser_class.new(response.body)
      Conduit::ApiResponse.new(raw_response: response, parser: parser)
    end

    private

    def http_headers
      {
        'Accept'       => 'application/json',
        'Content-Type' => 'application/json',
        'X-AUTH-TOKEN' => @options[:token]
      }
    end

    def action_name
      ActiveSupport::Inflector.demodulize(self.class)
    end

    def request_mocker
      "Conduit::Wave::RequestMocker::#{action_name}".constantize
    end

    def mock_mode?
      @options.key?(:mock_status)
    end

    def host_override?
      @options.key?(:host_override)
    end
  end
end
