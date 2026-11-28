# frozen_string_literal: true

module ContextDev
  module Resources
    # Inspect your organization's API requests, including retained inputs and
    # responses.
    class Logs
      # Retrieve a request's metadata, retained input, and response. A request that just
      # finished can return 404 `NOT_FOUND` for a few seconds, so retry shortly.
      #
      # @overload retrieve(request_id, request_options: {})
      #
      # @param request_id [String] ID of the request, from its response's `request_id` or `X-Request-Id` header.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::LogRetrieveResponse]
      #
      # @see ContextDev::Models::LogRetrieveParams
      def retrieve(request_id, params = {})
        @client.request(
          method: :get,
          path: ["org/logs/%1$s", request_id],
          model: ContextDev::Models::LogRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::LogListParams} for more details.
      #
      # List your organization's API requests, newest first. Filter by time, endpoint,
      # API key, status, error code, tags, or text. Includes batch settlements and
      # monitor runs.
      #
      # @overload list(error_code: nil, errors_only: nil, from: nil, key_id: nil, limit: nil, page: nil, path: nil, search: nil, status_code: nil, tags: nil, to: nil, request_options: {})
      #
      # @param error_code [String] Filter by the `error_code` returned in the response.
      #
      # @param errors_only [Boolean] Return only requests that failed with a 4xx or 5xx status.
      #
      # @param from [Time] Return requests at or after this time. Defaults to 24 hours before `to`.
      #
      # @param key_id [String] Filter by the ID of the API key that made the request.
      #
      # @param limit [Integer] Maximum number of log entries to return per page.
      #
      # @param page [Integer] Page number, starting at 1.
      #
      # @param path [String] Filter by endpoint path, with or without the `/v1` prefix.
      #
      # @param search [String] Case-insensitive text to find in the request query or body, such as a domain.
      #
      # @param status_code [Integer] Filter by exact HTTP status code.
      #
      # @param tags [String] Comma-separated tags. Returns log entries that have any of them. Up to 20 tags o
      #
      # @param to [Time] Return requests at or before this time. Defaults to now.
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
          path: "org/logs",
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
