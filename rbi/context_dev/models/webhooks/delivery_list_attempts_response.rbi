# typed: strong

module ContextDev
  module Models
    module Webhooks
      class DeliveryListAttemptsResponse < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::Webhooks::DeliveryListAttemptsResponse,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(T::Array[ContextDev::Webhooks::Attempt]) }
        attr_accessor :data

        sig { returns(T::Boolean) }
        attr_accessor :has_more

        sig { returns(T.nilable(String)) }
        attr_accessor :next_cursor

        # Metadata about the API key used for the request. Included in every response
        # whenever a valid API key is provided, even when the response status is not 200.
        sig do
          returns(
            T.nilable(
              ContextDev::Models::Webhooks::DeliveryListAttemptsResponse::KeyMetadata
            )
          )
        end
        attr_reader :key_metadata

        sig do
          params(
            key_metadata:
              ContextDev::Models::Webhooks::DeliveryListAttemptsResponse::KeyMetadata::OrHash
          ).void
        end
        attr_writer :key_metadata

        sig do
          params(
            data: T::Array[ContextDev::Webhooks::Attempt::OrHash],
            has_more: T::Boolean,
            next_cursor: T.nilable(String),
            key_metadata:
              ContextDev::Models::Webhooks::DeliveryListAttemptsResponse::KeyMetadata::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          has_more:,
          next_cursor:,
          # Metadata about the API key used for the request. Included in every response
          # whenever a valid API key is provided, even when the response status is not 200.
          key_metadata: nil
        )
        end

        sig do
          override.returns(
            {
              data: T::Array[ContextDev::Webhooks::Attempt],
              has_more: T::Boolean,
              next_cursor: T.nilable(String),
              key_metadata:
                ContextDev::Models::Webhooks::DeliveryListAttemptsResponse::KeyMetadata
            }
          )
        end
        def to_hash
        end

        class KeyMetadata < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::Webhooks::DeliveryListAttemptsResponse::KeyMetadata,
                ContextDev::Internal::AnyHash
              )
            end

          # The number of credits consumed by this request.
          sig { returns(Integer) }
          attr_accessor :credits_consumed

          # The number of credits remaining for your organization after this request.
          sig { returns(Integer) }
          attr_accessor :credits_remaining

          # Metadata about the API key used for the request. Included in every response
          # whenever a valid API key is provided, even when the response status is not 200.
          sig do
            params(
              credits_consumed: Integer,
              credits_remaining: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # The number of credits consumed by this request.
            credits_consumed:,
            # The number of credits remaining for your organization after this request.
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
end
