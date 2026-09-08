# typed: strong

module ContextDev
  module Models
    module Webhooks
      class DeliveryRetryParams < ContextDev::Internal::Type::BaseModel
        extend ContextDev::Internal::Type::RequestParameters::Converter
        include ContextDev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Webhooks::DeliveryRetryParams,
              ContextDev::Internal::AnyHash
            )
          end

        # Delivery ID.
        sig { returns(String) }
        attr_accessor :delivery_id

        # Resend a delivery that already succeeded.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :force

        sig { params(force: T::Boolean).void }
        attr_writer :force

        # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :tags

        sig { params(tags: T::Array[String]).void }
        attr_writer :tags

        # Unique key to prevent duplicate retry requests.
        sig { returns(T.nilable(String)) }
        attr_reader :idempotency_key

        sig { params(idempotency_key: String).void }
        attr_writer :idempotency_key

        sig do
          params(
            delivery_id: String,
            force: T::Boolean,
            tags: T::Array[String],
            idempotency_key: String,
            request_options: ContextDev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Delivery ID.
          delivery_id:,
          # Resend a delivery that already succeeded.
          force: nil,
          # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
          tags: nil,
          # Unique key to prevent duplicate retry requests.
          idempotency_key: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              delivery_id: String,
              force: T::Boolean,
              tags: T::Array[String],
              idempotency_key: String,
              request_options: ContextDev::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
