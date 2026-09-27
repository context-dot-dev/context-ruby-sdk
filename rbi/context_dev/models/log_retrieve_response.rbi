# typed: strong

module ContextDev
  module Models
    class LogRetrieveResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::LogRetrieveResponse,
            ContextDev::Internal::AnyHash
          )
        end

      sig { returns(ContextDev::Models::LogRetrieveResponse::Data) }
      attr_reader :data

      sig do
        params(data: ContextDev::Models::LogRetrieveResponse::Data::OrHash).void
      end
      attr_writer :data

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Credits this request used and your remaining balance.
      sig do
        returns(T.nilable(ContextDev::Models::LogRetrieveResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::LogRetrieveResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          data: ContextDev::Models::LogRetrieveResponse::Data::OrHash,
          request_id: String,
          key_metadata:
            ContextDev::Models::LogRetrieveResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        data:,
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
            data: ContextDev::Models::LogRetrieveResponse::Data,
            request_id: String,
            key_metadata: ContextDev::Models::LogRetrieveResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class Data < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::LogRetrieveResponse::Data,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_used

        # The `error_code` from the response, or null on success.
        sig { returns(T.nilable(String)) }
        attr_accessor :error_code

        # What was sent with the request.
        sig { returns(ContextDev::Models::LogRetrieveResponse::Data::Input) }
        attr_reader :input

        sig do
          params(
            input: ContextDev::Models::LogRetrieveResponse::Data::Input::OrHash
          ).void
        end
        attr_writer :input

        # ID of the API key that made the request.
        sig { returns(T.nilable(String)) }
        attr_accessor :key_id

        # Server-side processing time in milliseconds.
        sig { returns(Float) }
        attr_accessor :latency_ms

        # HTTP method, or `MONITOR` / `BATCH` for monitor-run and batch-settlement
        # entries.
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

        # User-Agent header of the request.
        sig { returns(T.nilable(String)) }
        attr_accessor :user_agent

        # Whether the request was made under zero data retention.
        sig { returns(T::Boolean) }
        attr_accessor :zdr

        # The retained JSON response with credentials redacted, or null when unavailable.
        sig { returns(T.nilable(T.anything)) }
        attr_reader :response

        sig { params(response: T.anything).void }
        attr_writer :response

        sig do
          params(
            credits_used: Integer,
            error_code: T.nilable(String),
            input: ContextDev::Models::LogRetrieveResponse::Data::Input::OrHash,
            key_id: T.nilable(String),
            latency_ms: Float,
            method_: String,
            path: String,
            request_id: String,
            status_code: Integer,
            tags: T::Array[String],
            timestamp: Time,
            user_agent: T.nilable(String),
            zdr: T::Boolean,
            response: T.anything
          ).returns(T.attached_class)
        end
        def self.new(
          # Credits charged for this request.
          credits_used:,
          # The `error_code` from the response, or null on success.
          error_code:,
          # What was sent with the request.
          input:,
          # ID of the API key that made the request.
          key_id:,
          # Server-side processing time in milliseconds.
          latency_ms:,
          # HTTP method, or `MONITOR` / `BATCH` for monitor-run and batch-settlement
          # entries.
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
          # User-Agent header of the request.
          user_agent:,
          # Whether the request was made under zero data retention.
          zdr:,
          # The retained JSON response with credentials redacted, or null when unavailable.
          response: nil
        )
        end

        sig do
          override.returns(
            {
              credits_used: Integer,
              error_code: T.nilable(String),
              input: ContextDev::Models::LogRetrieveResponse::Data::Input,
              key_id: T.nilable(String),
              latency_ms: Float,
              method_: String,
              path: String,
              request_id: String,
              status_code: Integer,
              tags: T::Array[String],
              timestamp: Time,
              user_agent: T.nilable(String),
              zdr: T::Boolean,
              response: T.anything
            }
          )
        end
        def to_hash
        end

        class Input < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::LogRetrieveResponse::Data::Input,
                ContextDev::Internal::AnyHash
              )
            end

          # Query parameters as sent.
          sig { returns(T::Hash[Symbol, T.anything]) }
          attr_accessor :query

          # Request body with credentials and uploaded content redacted.
          sig { returns(T.nilable(T.anything)) }
          attr_reader :body

          sig { params(body: T.anything).void }
          attr_writer :body

          # What was sent with the request.
          sig do
            params(
              query: T::Hash[Symbol, T.anything],
              body: T.anything
            ).returns(T.attached_class)
          end
          def self.new(
            # Query parameters as sent.
            query:,
            # Request body with credentials and uploaded content redacted.
            body: nil
          )
          end

          sig do
            override.returns(
              { query: T::Hash[Symbol, T.anything], body: T.anything }
            )
          end
          def to_hash
          end
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::LogRetrieveResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits remaining for your organization.
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
