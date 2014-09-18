require 'multi_json'

module Conduit::Driver::Wave
  module Parser
    # Provides the base functionality for parsing
    # JSON responses from the Wave API with an
    # xpath-like object_path accessor
    class Base < Conduit::Core::Parser
      def initialize(json)
        @json    = MultiJson.load(json)
        @success = true
      rescue MultiJson::ParseError
        @json = unexpected_response_hash
        @success = false
      end

      # True if the JSON was parsed successfully
      # and there were no errors returned from
      # the Wave API
      #
      def response_status
        @success &&= response_errors.empty?

        if @success
          'success'
        elsif !response_content?
          'error'
        else
          'failure'
        end
      end

      # Errors returned from the Wave API
      #
      def response_errors
        object_path('errors') || []
      end

      def response_content?
        raise(StandardError, 'Please implement response_content? in your parser')
      end

      private

      attr_reader :json

      def unexpected_response_hash
        { 'errors' => { 'base' => 'Unexpected response from server.' } }
      end

      # An xpath-like accessor for retrieving
      # data elements from the json.
      #
      # e.g.,
      #   object_path('meta/paginaton/total_count')
      #     => Total number of records from the paginaton
      #
      #   object_path('products/0/price')
      #     => Price attribute of the first element in
      #     the product array
      def object_path(path)
        return nil if json.nil?

        data = json

        path.split('/').map do |element|
          key = element.match(/\A\d+\Z/) ? element.to_i : element
          data = data[key]
        end.last
      end
    end
  end
end
