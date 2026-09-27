# typed: strong

module ContextDev
  module Models
    module Webhooks
      class DeliveryRetrieveParams < ContextDev::Internal::Type::BaseModel
        extend ContextDev::Internal::Type::RequestParameters::Converter
        include ContextDev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Webhooks::DeliveryRetrieveParams,
              ContextDev::Internal::AnyHash
            )
          end

        # Delivery ID.
        sig { returns(String) }
        attr_accessor :delivery_id

        # Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :tags

        sig { params(tags: T::Array[String]).void }
        attr_writer :tags

        sig do
          params(
            delivery_id: String,
            tags: T::Array[String],
            request_options: ContextDev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Delivery ID.
          delivery_id:,
          # Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
          tags: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              delivery_id: String,
              tags: T::Array[String],
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
