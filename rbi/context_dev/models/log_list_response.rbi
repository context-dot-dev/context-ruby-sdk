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

      # Log entries on this page, newest first.
      sig { returns(T::Array[ContextDev::Models::LogListResponse::Data]) }
      attr_accessor :data

      # Whether more results are available after this page.
      sig { returns(T::Boolean) }
      attr_accessor :has_more

      # Maximum number of log entries to return per page.
      sig { returns(Integer) }
      attr_accessor :limit

      # Current page number.
      sig { returns(Integer) }
      attr_accessor :page

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Credits this request used and your remaining balance.
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
        # Log entries on this page, newest first.
        data:,
        # Whether more results are available after this page.
        has_more:,
        # Maximum number of log entries to return per page.
        limit:,
        # Current page number.
        page:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Credits this request used and your remaining balance.
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

        # The response's `error_code`. `null` on success.
        sig { returns(T.nilable(String)) }
        attr_accessor :error_code

        # ID of the API key that made the request. Can be `null` for `MONITOR` and `BATCH`
        # entries.
        sig { returns(T.nilable(String)) }
        attr_accessor :key_id

        # Server-side processing time, in milliseconds.
        sig { returns(Float) }
        attr_accessor :latency_ms

        # HTTP method, or `MONITOR` for a monitor run and `BATCH` for a batch settlement.
        sig { returns(String) }
        attr_accessor :method_

        # Endpoint path that was called.
        sig { returns(String) }
        attr_accessor :path

        # ID of the logged request.
        sig { returns(String) }
        attr_accessor :request_id

        # HTTP status code of the response.
        sig { returns(Integer) }
        attr_accessor :status_code

        # Tags sent with the request.
        sig { returns(T::Array[String]) }
        attr_accessor :tags

        # When the request completed.
        sig { returns(Time) }
        attr_accessor :timestamp

        # Whether the request used zero data retention (ZDR).
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
          # The response's `error_code`. `null` on success.
          error_code:,
          # ID of the API key that made the request. Can be `null` for `MONITOR` and `BATCH`
          # entries.
          key_id:,
          # Server-side processing time, in milliseconds.
          latency_ms:,
          # HTTP method, or `MONITOR` for a monitor run and `BATCH` for a batch settlement.
          method_:,
          # Endpoint path that was called.
          path:,
          # ID of the logged request.
          request_id:,
          # HTTP status code of the response.
          status_code:,
          # Tags sent with the request.
          tags:,
          # When the request completed.
          timestamp:,
          # Whether the request used zero data retention (ZDR).
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

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits your organization has left after this request.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Credits this request used and your remaining balance.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Credits charged for this request.
          credits_consumed:,
          # Credits your organization has left after this request.
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
