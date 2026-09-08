# typed: strong

module ContextDev
  module Models
    module Webhooks
      class DeliveryRetrieveResponse < ContextDev::Models::Webhooks::Delivery
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::Webhooks::DeliveryRetrieveResponse,
              ContextDev::Internal::AnyHash
            )
          end

        # Credit usage, included whenever a valid API key is provided.
        sig do
          returns(
            T.nilable(
              ContextDev::Models::Webhooks::DeliveryRetrieveResponse::KeyMetadata
            )
          )
        end
        attr_reader :key_metadata

        sig do
          params(
            key_metadata:
              ContextDev::Models::Webhooks::DeliveryRetrieveResponse::KeyMetadata::OrHash
          ).void
        end
        attr_writer :key_metadata

        sig do
          params(
            key_metadata:
              ContextDev::Models::Webhooks::DeliveryRetrieveResponse::KeyMetadata::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Credit usage, included whenever a valid API key is provided.
          key_metadata: nil
        )
        end

        sig do
          override.returns(
            {
              key_metadata:
                ContextDev::Models::Webhooks::DeliveryRetrieveResponse::KeyMetadata
            }
          )
        end
        def to_hash
        end

        class KeyMetadata < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::Webhooks::DeliveryRetrieveResponse::KeyMetadata,
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
