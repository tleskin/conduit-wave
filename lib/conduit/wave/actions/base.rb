# Default url, required_attributes, and Content-Type for
# Wave API.
#
module Conduit::Driver::Wave
  class Base < Conduit::Core::Action
    Excon.defaults[:headers]['Content-Type'] = 'application/json'

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
        @options[:host_override] + self.class.url_route
      else
        "#{Conduit::Wave::Configuration.api_host}" + self.class.url_route
      end
    end

    def perform_request
      response = request(body: view, method: self.class.http_method)
      parser   = parser_class.new(response.body)
      Conduit::ApiResponse.new(raw_response: response, parser: parser)
    end

    private

    def action_name
      ActiveSupport::Inflector.demodulize(self.class)
    end

    def request_mocker
      "Conduit::Wave::RequestMocker::#{action_name}".constantize
    end

    def mock_mode?
      @options.has_key?(:mock)
    end

    def host_override?
      @options.has_key?(:host_override)
    end
  end
end
