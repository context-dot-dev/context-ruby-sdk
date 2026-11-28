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

        sig do
          returns(
            T.any(
              ContextDev::Webhooks::DeliveryListParams::Body::Batch,
              ContextDev::Webhooks::DeliveryListParams::Body::Monitor
            )
          )
        end
        attr_accessor :body

        sig do
          params(
            body:
              T.any(
                ContextDev::Webhooks::DeliveryListParams::Body::Batch::OrHash,
                ContextDev::Webhooks::DeliveryListParams::Body::Monitor::OrHash
              ),
            request_options: ContextDev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(body:, request_options: {})
        end

        sig do
          override.returns(
            {
              body:
                T.any(
                  ContextDev::Webhooks::DeliveryListParams::Body::Batch,
                  ContextDev::Webhooks::DeliveryListParams::Body::Monitor
                ),
              request_options: ContextDev::RequestOptions
            }
          )
        end
        def to_hash
        end

        module Body
          extend ContextDev::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                ContextDev::Webhooks::DeliveryListParams::Body::Batch,
                ContextDev::Webhooks::DeliveryListParams::Body::Monitor
              )
            end

          class Batch < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Webhooks::DeliveryListParams::Body::Batch,
                  ContextDev::Internal::AnyHash
                )
              end

            # List batch webhook deliveries.
            sig { returns(Symbol) }
            attr_accessor :type

            # Filter by batch ID.
            sig { returns(T.nilable(String)) }
            attr_reader :batch_id

            sig { params(batch_id: String).void }
            attr_writer :batch_id

            # Only include deliveries created after this time.
            sig { returns(T.nilable(Time)) }
            attr_reader :created_after

            sig { params(created_after: Time).void }
            attr_writer :created_after

            # Cursor from the previous page's `next_cursor`. Omit for the first page.
            sig { returns(T.nilable(String)) }
            attr_reader :cursor

            sig { params(cursor: String).void }
            attr_writer :cursor

            # Maximum number of deliveries to return per page.
            sig { returns(T.nilable(Integer)) }
            attr_reader :limit

            sig { params(limit: Integer).void }
            attr_writer :limit

            # Filter by delivery status.
            sig do
              returns(
                T.nilable(
                  ContextDev::Webhooks::DeliveryListParams::Body::Batch::Status::OrSymbol
                )
              )
            end
            attr_reader :status

            sig do
              params(
                status:
                  ContextDev::Webhooks::DeliveryListParams::Body::Batch::Status::OrSymbol
              ).void
            end
            attr_writer :status

            # Labels for this request. Filter usage and request logs by them in the dashboard
            # or with `GET /org/logs`.
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :tags

            sig { params(tags: T::Array[String]).void }
            attr_writer :tags

            sig do
              params(
                batch_id: String,
                created_after: Time,
                cursor: String,
                limit: Integer,
                status:
                  ContextDev::Webhooks::DeliveryListParams::Body::Batch::Status::OrSymbol,
                tags: T::Array[String],
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Filter by batch ID.
              batch_id: nil,
              # Only include deliveries created after this time.
              created_after: nil,
              # Cursor from the previous page's `next_cursor`. Omit for the first page.
              cursor: nil,
              # Maximum number of deliveries to return per page.
              limit: nil,
              # Filter by delivery status.
              status: nil,
              # Labels for this request. Filter usage and request logs by them in the dashboard
              # or with `GET /org/logs`.
              tags: nil,
              # List batch webhook deliveries.
              type: :batch
            )
            end

            sig do
              override.returns(
                {
                  type: Symbol,
                  batch_id: String,
                  created_after: Time,
                  cursor: String,
                  limit: Integer,
                  status:
                    ContextDev::Webhooks::DeliveryListParams::Body::Batch::Status::OrSymbol,
                  tags: T::Array[String]
                }
              )
            end
            def to_hash
            end

            # Filter by delivery status.
            module Status
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::Webhooks::DeliveryListParams::Body::Batch::Status
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              PENDING =
                T.let(
                  :pending,
                  ContextDev::Webhooks::DeliveryListParams::Body::Batch::Status::TaggedSymbol
                )
              DELIVERING =
                T.let(
                  :delivering,
                  ContextDev::Webhooks::DeliveryListParams::Body::Batch::Status::TaggedSymbol
                )
              RETRYING =
                T.let(
                  :retrying,
                  ContextDev::Webhooks::DeliveryListParams::Body::Batch::Status::TaggedSymbol
                )
              DELIVERED =
                T.let(
                  :delivered,
                  ContextDev::Webhooks::DeliveryListParams::Body::Batch::Status::TaggedSymbol
                )
              FAILED =
                T.let(
                  :failed,
                  ContextDev::Webhooks::DeliveryListParams::Body::Batch::Status::TaggedSymbol
                )
              CANCELLED =
                T.let(
                  :cancelled,
                  ContextDev::Webhooks::DeliveryListParams::Body::Batch::Status::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Webhooks::DeliveryListParams::Body::Batch::Status::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Monitor < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Webhooks::DeliveryListParams::Body::Monitor,
                  ContextDev::Internal::AnyHash
                )
              end

            # List monitor webhook deliveries.
            sig { returns(Symbol) }
            attr_accessor :type

            # Only include deliveries created after this time.
            sig { returns(T.nilable(Time)) }
            attr_reader :created_after

            sig { params(created_after: Time).void }
            attr_writer :created_after

            # Cursor from the previous page's `next_cursor`. Omit for the first page.
            sig { returns(T.nilable(String)) }
            attr_reader :cursor

            sig { params(cursor: String).void }
            attr_writer :cursor

            # Maximum number of deliveries to return per page.
            sig { returns(T.nilable(Integer)) }
            attr_reader :limit

            sig { params(limit: Integer).void }
            attr_writer :limit

            # Filter by monitor ID.
            sig { returns(T.nilable(String)) }
            attr_reader :monitor_id

            sig { params(monitor_id: String).void }
            attr_writer :monitor_id

            # Filter by monitor run ID.
            sig { returns(T.nilable(String)) }
            attr_reader :run_id

            sig { params(run_id: String).void }
            attr_writer :run_id

            # Filter by delivery status.
            sig do
              returns(
                T.nilable(
                  ContextDev::Webhooks::DeliveryListParams::Body::Monitor::Status::OrSymbol
                )
              )
            end
            attr_reader :status

            sig do
              params(
                status:
                  ContextDev::Webhooks::DeliveryListParams::Body::Monitor::Status::OrSymbol
              ).void
            end
            attr_writer :status

            # Labels for this request. Filter usage and request logs by them in the dashboard
            # or with `GET /org/logs`.
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :tags

            sig { params(tags: T::Array[String]).void }
            attr_writer :tags

            sig do
              params(
                created_after: Time,
                cursor: String,
                limit: Integer,
                monitor_id: String,
                run_id: String,
                status:
                  ContextDev::Webhooks::DeliveryListParams::Body::Monitor::Status::OrSymbol,
                tags: T::Array[String],
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Only include deliveries created after this time.
              created_after: nil,
              # Cursor from the previous page's `next_cursor`. Omit for the first page.
              cursor: nil,
              # Maximum number of deliveries to return per page.
              limit: nil,
              # Filter by monitor ID.
              monitor_id: nil,
              # Filter by monitor run ID.
              run_id: nil,
              # Filter by delivery status.
              status: nil,
              # Labels for this request. Filter usage and request logs by them in the dashboard
              # or with `GET /org/logs`.
              tags: nil,
              # List monitor webhook deliveries.
              type: :monitor
            )
            end

            sig do
              override.returns(
                {
                  type: Symbol,
                  created_after: Time,
                  cursor: String,
                  limit: Integer,
                  monitor_id: String,
                  run_id: String,
                  status:
                    ContextDev::Webhooks::DeliveryListParams::Body::Monitor::Status::OrSymbol,
                  tags: T::Array[String]
                }
              )
            end
            def to_hash
            end

            # Filter by delivery status.
            module Status
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::Webhooks::DeliveryListParams::Body::Monitor::Status
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              PENDING =
                T.let(
                  :pending,
                  ContextDev::Webhooks::DeliveryListParams::Body::Monitor::Status::TaggedSymbol
                )
              DELIVERING =
                T.let(
                  :delivering,
                  ContextDev::Webhooks::DeliveryListParams::Body::Monitor::Status::TaggedSymbol
                )
              RETRYING =
                T.let(
                  :retrying,
                  ContextDev::Webhooks::DeliveryListParams::Body::Monitor::Status::TaggedSymbol
                )
              DELIVERED =
                T.let(
                  :delivered,
                  ContextDev::Webhooks::DeliveryListParams::Body::Monitor::Status::TaggedSymbol
                )
              FAILED =
                T.let(
                  :failed,
                  ContextDev::Webhooks::DeliveryListParams::Body::Monitor::Status::TaggedSymbol
                )
              CANCELLED =
                T.let(
                  :cancelled,
                  ContextDev::Webhooks::DeliveryListParams::Body::Monitor::Status::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Webhooks::DeliveryListParams::Body::Monitor::Status::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          sig do
            override.returns(
              T::Array[ContextDev::Webhooks::DeliveryListParams::Body::Variants]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
