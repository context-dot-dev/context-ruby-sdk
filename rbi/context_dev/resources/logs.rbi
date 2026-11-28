# typed: strong

module ContextDev
  module Resources
    # Inspect your organization's API requests, including retained inputs and
    # responses.
    class Logs
      # Retrieve a request's metadata, retained input, and response. A request that just
      # finished can return 404 `NOT_FOUND` for a few seconds, so retry shortly.
      sig do
        params(
          request_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::LogRetrieveResponse)
      end
      def retrieve(
        # ID of the request, from its response's `request_id` or `X-Request-Id` header.
        request_id,
        request_options: {}
      )
      end

      # List your organization's API requests, newest first. Filter by time, endpoint,
      # API key, status, error code, tags, or text. Includes batch settlements and
      # monitor runs.
      sig do
        params(
          error_code: String,
          errors_only: T::Boolean,
          from: Time,
          key_id: String,
          limit: Integer,
          page: Integer,
          path: String,
          search: String,
          status_code: Integer,
          tags: String,
          to: Time,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::LogListResponse)
      end
      def list(
        # Filter by the `error_code` returned in the response.
        error_code: nil,
        # Return only requests that failed with a 4xx or 5xx status.
        errors_only: nil,
        # Return requests at or after this time. Defaults to 24 hours before `to`.
        from: nil,
        # Filter by the ID of the API key that made the request.
        key_id: nil,
        # Maximum number of log entries to return per page.
        limit: nil,
        # Page number, starting at 1.
        page: nil,
        # Filter by endpoint path, with or without the `/v1` prefix.
        path: nil,
        # Case-insensitive text to find in the request query or body, such as a domain.
        search: nil,
        # Filter by exact HTTP status code.
        status_code: nil,
        # Comma-separated tags. Returns log entries that have any of them. Up to 20 tags
        # of 1 to 50 characters each.
        tags: nil,
        # Return requests at or before this time. Defaults to now.
        to: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: ContextDev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
