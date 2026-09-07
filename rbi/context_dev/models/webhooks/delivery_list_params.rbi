# typed: strong

module ContextDev
  module Models
    module Webhooks
      class DeliveryListParams < ContextDev::Internal::Type::BaseModel
        extend ContextDev::Internal::Type::RequestParameters::Converter
        include ContextDev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Webhooks::DeliveryListParams,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :batch_id

        sig { params(batch_id: String).void }
        attr_writer :batch_id

        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        sig { returns(T.nilable(String)) }
        attr_reader :monitor_id

        sig { params(monitor_id: String).void }
        attr_writer :monitor_id

        sig { returns(T.nilable(String)) }
        attr_reader :run_id

        sig { params(run_id: String).void }
        attr_writer :run_id

        sig do
          returns(
            T.nilable(
              ContextDev::Webhooks::DeliveryListParams::Status::OrSymbol
            )
          )
        end
        attr_reader :status

        sig do
          params(
            status: ContextDev::Webhooks::DeliveryListParams::Status::OrSymbol
          ).void
        end
        attr_writer :status

        # Optional comma-separated caller-defined tags for tracking this request. Tags are
        # recorded on the request's usage log and can be used to filter usage on the
        # dashboard usage page. Up to 20 tags, each 1-50 characters.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :tags

        sig { params(tags: T::Array[String]).void }
        attr_writer :tags

        sig do
          params(
            batch_id: String,
            cursor: String,
            limit: Integer,
            monitor_id: String,
            run_id: String,
            status: ContextDev::Webhooks::DeliveryListParams::Status::OrSymbol,
            tags: T::Array[String],
            request_options: ContextDev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          batch_id: nil,
          cursor: nil,
          limit: nil,
          monitor_id: nil,
          run_id: nil,
          status: nil,
          # Optional comma-separated caller-defined tags for tracking this request. Tags are
          # recorded on the request's usage log and can be used to filter usage on the
          # dashboard usage page. Up to 20 tags, each 1-50 characters.
          tags: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              batch_id: String,
              cursor: String,
              limit: Integer,
              monitor_id: String,
              run_id: String,
              status:
                ContextDev::Webhooks::DeliveryListParams::Status::OrSymbol,
              tags: T::Array[String],
              request_options: ContextDev::RequestOptions
            }
          )
        end
        def to_hash
        end

        module Status
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::Webhooks::DeliveryListParams::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :pending,
              ContextDev::Webhooks::DeliveryListParams::Status::TaggedSymbol
            )
          DELIVERING =
            T.let(
              :delivering,
              ContextDev::Webhooks::DeliveryListParams::Status::TaggedSymbol
            )
          RETRYING =
            T.let(
              :retrying,
              ContextDev::Webhooks::DeliveryListParams::Status::TaggedSymbol
            )
          DELIVERED =
            T.let(
              :delivered,
              ContextDev::Webhooks::DeliveryListParams::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              ContextDev::Webhooks::DeliveryListParams::Status::TaggedSymbol
            )
          CANCELLED =
            T.let(
              :cancelled,
              ContextDev::Webhooks::DeliveryListParams::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Webhooks::DeliveryListParams::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
