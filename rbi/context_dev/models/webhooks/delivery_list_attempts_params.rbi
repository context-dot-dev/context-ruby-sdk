# typed: strong

module ContextDev
  module Models
    module Webhooks
      class DeliveryListAttemptsParams < ContextDev::Internal::Type::BaseModel
        extend ContextDev::Internal::Type::RequestParameters::Converter
        include ContextDev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Webhooks::DeliveryListAttemptsParams,
              ContextDev::Internal::AnyHash
            )
          end

        # Delivery ID.
        sig { returns(String) }
        attr_accessor :delivery_id

        # The next_cursor from the previous response.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Number of attempts to return.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :tags

        sig { params(tags: T::Array[String]).void }
        attr_writer :tags

        sig do
          params(
            delivery_id: String,
            cursor: String,
            limit: Integer,
            tags: T::Array[String],
            request_options: ContextDev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Delivery ID.
          delivery_id:,
          # The next_cursor from the previous response.
          cursor: nil,
          # Number of attempts to return.
          limit: nil,
          # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
          # characters.
          tags: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              delivery_id: String,
              cursor: String,
              limit: Integer,
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
