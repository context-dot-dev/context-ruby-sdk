# typed: strong

module ContextDev
  module Models
    class LogListParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::LogListParams, ContextDev::Internal::AnyHash)
        end

      # Filter by the `error_code` returned in the response.
      sig { returns(T.nilable(String)) }
      attr_reader :error_code

      sig { params(error_code: String).void }
      attr_writer :error_code

      # Return only requests that failed with a 4xx or 5xx status.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :errors_only

      sig { params(errors_only: T::Boolean).void }
      attr_writer :errors_only

      # Return requests at or after this time. Defaults to 24 hours before `to`.
      sig { returns(T.nilable(Time)) }
      attr_reader :from

      sig { params(from: Time).void }
      attr_writer :from

      # Filter by the ID of the API key that made the request.
      sig { returns(T.nilable(String)) }
      attr_reader :key_id

      sig { params(key_id: String).void }
      attr_writer :key_id

      # Maximum number of log entries to return per page.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Page number, starting at 1.
      sig { returns(T.nilable(Integer)) }
      attr_reader :page

      sig { params(page: Integer).void }
      attr_writer :page

      # Filter by endpoint path, with or without the `/v1` prefix.
      sig { returns(T.nilable(String)) }
      attr_reader :path

      sig { params(path: String).void }
      attr_writer :path

      # Case-insensitive text to find in the request query or body, such as a domain.
      sig { returns(T.nilable(String)) }
      attr_reader :search

      sig { params(search: String).void }
      attr_writer :search

      # Filter by exact HTTP status code.
      sig { returns(T.nilable(Integer)) }
      attr_reader :status_code

      sig { params(status_code: Integer).void }
      attr_writer :status_code

      # Comma-separated tags. Returns log entries that have any of them. Up to 20 tags
      # of 1 to 50 characters each.
      sig { returns(T.nilable(String)) }
      attr_reader :tags

      sig { params(tags: String).void }
      attr_writer :tags

      # Return requests at or before this time. Defaults to now.
      sig { returns(T.nilable(Time)) }
      attr_reader :to

      sig { params(to: Time).void }
      attr_writer :to

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
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
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
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
