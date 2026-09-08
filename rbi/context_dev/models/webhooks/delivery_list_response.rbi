# typed: strong

module ContextDev
  module Models
    module Webhooks
      class DeliveryListResponse < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::Webhooks::DeliveryListResponse,
              ContextDev::Internal::AnyHash
            )
          end

        # Webhook deliveries.
        sig { returns(T::Array[ContextDev::Webhooks::DeliverySummary]) }
        attr_accessor :data

        # Whether more deliveries are available.
        sig { returns(T::Boolean) }
        attr_accessor :has_more

        # Next page cursor, or null on the last page.
        sig { returns(T.nilable(String)) }
        attr_accessor :next_cursor

        # Credit usage, included whenever a valid API key is provided.
        sig do
          returns(
            T.nilable(
              ContextDev::Models::Webhooks::DeliveryListResponse::KeyMetadata
            )
          )
        end
        attr_reader :key_metadata

        sig do
          params(
            key_metadata:
              ContextDev::Models::Webhooks::DeliveryListResponse::KeyMetadata::OrHash
          ).void
        end
        attr_writer :key_metadata

        sig do
          params(
            data: T::Array[ContextDev::Webhooks::DeliverySummary::OrHash],
            has_more: T::Boolean,
            next_cursor: T.nilable(String),
            key_metadata:
              ContextDev::Models::Webhooks::DeliveryListResponse::KeyMetadata::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Webhook deliveries.
          data:,
          # Whether more deliveries are available.
          has_more:,
          # Next page cursor, or null on the last page.
          next_cursor:,
          # Credit usage, included whenever a valid API key is provided.
          key_metadata: nil
        )
        end

        sig do
          override.returns(
            {
              data: T::Array[ContextDev::Webhooks::DeliverySummary],
              has_more: T::Boolean,
              next_cursor: T.nilable(String),
              key_metadata:
                ContextDev::Models::Webhooks::DeliveryListResponse::KeyMetadata
            }
          )
        end
        def to_hash
        end

        class KeyMetadata < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::Webhooks::DeliveryListResponse::KeyMetadata,
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
            params(
              credits_consumed: Integer,
              credits_remaining: Integer
            ).returns(T.attached_class)
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
end
