# typed: strong

module ContextDev
  module Models
    class LogListResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::LogListResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Log entries, newest first.
      sig { returns(T::Array[ContextDev::Models::LogListResponse::Data]) }
      attr_accessor :data

      # Whether a next page exists.
      sig { returns(T::Boolean) }
      attr_accessor :has_more

      # Entries per page.
      sig { returns(Integer) }
      attr_accessor :limit

      # Current page number.
      sig { returns(Integer) }
      attr_accessor :page

      # Unique id of this API call, also sent in the X-Request-Id response header. Quote
      # it when contacting support about a failed request.
      sig { returns(String) }
      attr_accessor :request_id

      # Credit usage, included whenever a valid API key is provided.
      sig do
        returns(T.nilable(ContextDev::Models::LogListResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata: ContextDev::Models::LogListResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          data: T::Array[ContextDev::Models::LogListResponse::Data::OrHash],
          has_more: T::Boolean,
          limit: Integer,
          page: Integer,
          request_id: String,
          key_metadata: ContextDev::Models::LogListResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Log entries, newest first.
        data:,
        # Whether a next page exists.
        has_more:,
        # Entries per page.
        limit:,
        # Current page number.
        page:,
        # Unique id of this API call, also sent in the X-Request-Id response header. Quote
        # it when contacting support about a failed request.
        request_id:,
        # Credit usage, included whenever a valid API key is provided.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            data: T::Array[ContextDev::Models::LogListResponse::Data],
            has_more: T::Boolean,
            limit: Integer,
            page: Integer,
            request_id: String,
            key_metadata: ContextDev::Models::LogListResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class Data < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::LogListResponse::Data,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_used

        # The `error_code` from the response, or null on success.
        sig { returns(T.nilable(String)) }
        attr_accessor :error_code

        # ID of the API key that made the request.
        sig { returns(T.nilable(String)) }
        attr_accessor :key_id

        # Server-side processing time in milliseconds.
        sig { returns(Float) }
        attr_accessor :latency_ms

        # HTTP method.
        sig { returns(String) }
        attr_accessor :method_

        # Endpoint path as called.
        sig { returns(String) }
        attr_accessor :path

        # Request ID of the logged API call.
        sig { returns(String) }
        attr_accessor :request_id

        # HTTP status code returned.
        sig { returns(Integer) }
        attr_accessor :status_code

        # Request tags supplied by the caller.
        sig { returns(T::Array[String]) }
        attr_accessor :tags

        # When the request completed.
        sig { returns(Time) }
        attr_accessor :timestamp

        # Whether the request was made under zero data retention.
        sig { returns(T::Boolean) }
        attr_accessor :zdr

        sig do
          params(
            credits_used: Integer,
            error_code: T.nilable(String),
            key_id: T.nilable(String),
            latency_ms: Float,
            method_: String,
            path: String,
            request_id: String,
            status_code: Integer,
            tags: T::Array[String],
            timestamp: Time,
            zdr: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Credits charged for this request.
          credits_used:,
          # The `error_code` from the response, or null on success.
          error_code:,
          # ID of the API key that made the request.
          key_id:,
          # Server-side processing time in milliseconds.
          latency_ms:,
          # HTTP method.
          method_:,
          # Endpoint path as called.
          path:,
          # Request ID of the logged API call.
          request_id:,
          # HTTP status code returned.
          status_code:,
          # Request tags supplied by the caller.
          tags:,
          # When the request completed.
          timestamp:,
          # Whether the request was made under zero data retention.
          zdr:
        )
        end

        sig do
          override.returns(
            {
              credits_used: Integer,
              error_code: T.nilable(String),
              key_id: T.nilable(String),
              latency_ms: Float,
              method_: String,
              path: String,
              request_id: String,
              status_code: Integer,
              tags: T::Array[String],
              timestamp: Time,
              zdr: T::Boolean
            }
          )
        end
        def to_hash
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::LogListResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits used by this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits remaining for your organization.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Credit usage, included whenever a valid API key is provided.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Credits used by this request.
          credits_consumed:,
          # Credits remaining for your organization.
          credits_remaining:
        )
        end

        sig do
          override.returns(
            { credits_consumed: Integer, credits_remaining: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
