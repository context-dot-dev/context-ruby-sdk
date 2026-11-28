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

        # ID of the delivery.
        sig { returns(String) }
        attr_accessor :delivery_id

        # Cursor from the previous page's `next_cursor`. Omit for the first page.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Maximum number of attempts to return per page.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Comma-separated labels for this request, such as `production,team-alpha`. Filter
        # usage and request logs by them.
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
          # ID of the delivery.
          delivery_id:,
          # Cursor from the previous page's `next_cursor`. Omit for the first page.
          cursor: nil,
          # Maximum number of attempts to return per page.
          limit: nil,
          # Comma-separated labels for this request, such as `production,team-alpha`. Filter
          # usage and request logs by them.
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
