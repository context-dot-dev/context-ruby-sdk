# typed: strong

module ContextDev
  module Resources
    # Read your organization's API request logs.
    class Logs
      # Retrieve a request’s metadata, retained input, and response.
      sig do
        params(
          request_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::LogRetrieveResponse)
      end
      def retrieve(
        # The request ID of the logged API call.
        request_id,
        request_options: {}
      )
      end

      # List your organization’s request logs with filters and pagination. Logs also
      # include batch settlements and monitor runs.
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
        # Only include requests that returned a 4xx or 5xx status.
        errors_only: nil,
        # Only include requests at or after this ISO 8601 timestamp. Defaults to 24 hours
        # before `to`.
        from: nil,
        # Filter by the API key that made the request.
        key_id: nil,
        # Number of log entries per page.
        limit: nil,
        # Page number, starting at 1.
        page: nil,
        # Filter by endpoint path, with or without the /v1 prefix.
        path: nil,
        # Case-insensitive substring match against the request query and body, e.g. a
        # domain.
        search: nil,
        # Filter by exact HTTP status code.
        status_code: nil,
        # Comma-separated request tags. Matches requests carrying any of them. Up to 20
        # tags, each 1-50 characters.
        tags: nil,
        # Only include requests at or before this ISO 8601 timestamp. Defaults to now.
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
