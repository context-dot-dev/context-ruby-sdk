# frozen_string_literal: true

module ContextDev
  module Resources
    # Read your organization's API request logs.
    class Logs
      # Retrieve a request’s metadata, retained input, and response.
      #
      # @overload retrieve(request_id, request_options: {})
      #
      # @param request_id [String] The request ID of the logged API call.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::LogRetrieveResponse]
      #
      # @see ContextDev::Models::LogRetrieveParams
      def retrieve(request_id, params = {})
        @client.request(
          method: :get,
          path: ["logs/%1$s", request_id],
          model: ContextDev::Models::LogRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::LogListParams} for more details.
      #
      # List your organization’s request logs with filters and pagination. Logs also
      # include batch settlements and monitor runs.
      #
      # @overload list(error_code: nil, errors_only: nil, from: nil, key_id: nil, limit: nil, page: nil, path: nil, search: nil, status_code: nil, tags: nil, to: nil, request_options: {})
      #
      # @param error_code [String] Filter by the `error_code` returned in the response.
      #
      # @param errors_only [Boolean] Only include requests that returned a 4xx or 5xx status.
      #
      # @param from [Time] Only include requests at or after this ISO 8601 timestamp. Defaults to 24 hours
      #
      # @param key_id [String] Filter by the API key that made the request.
      #
      # @param limit [Integer] Number of log entries per page.
      #
      # @param page [Integer] Page number, starting at 1.
      #
      # @param path [String] Filter by endpoint path, with or without the /v1 prefix.
      #
      # @param search [String] Case-insensitive substring match against the request query and body, e.g. a doma
      #
      # @param status_code [Integer] Filter by exact HTTP status code.
      #
      # @param tags [String] Comma-separated request tags. Matches requests carrying any of them. Up to 20 ta
      #
      # @param to [Time] Only include requests at or before this ISO 8601 timestamp. Defaults to now.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::LogListResponse]
      #
      # @see ContextDev::Models::LogListParams
      def list(params = {})
        parsed, options = ContextDev::LogListParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "logs",
          query: query,
          model: ContextDev::Models::LogListResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [ContextDev::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
