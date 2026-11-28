# typed: strong

module ContextDev
  module Models
    module Webhooks
      class DeliverySummary < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Webhooks::DeliverySummary,
              ContextDev::Internal::AnyHash
            )
          end

        # Unique ID of the delivery.
        sig { returns(String) }
        attr_accessor :id

        # When the event was created.
        sig { returns(Time) }
        attr_accessor :created_at

        # When the delivery last succeeded. `null` until it succeeds.
        sig { returns(T.nilable(Time)) }
        attr_accessor :delivered_at

        # Event that triggered the delivery.
        sig do
          returns(ContextDev::Webhooks::DeliverySummary::Event::TaggedSymbol)
        end
        attr_accessor :event

        # Most recent delivery error. `null` when there is none.
        sig do
          returns(T.nilable(ContextDev::Webhooks::DeliverySummary::LastError))
        end
        attr_reader :last_error

        sig do
          params(
            last_error:
              T.nilable(
                ContextDev::Webhooks::DeliverySummary::LastError::OrHash
              )
          ).void
        end
        attr_writer :last_error

        # When the next attempt is scheduled. `null` when none is scheduled.
        sig { returns(T.nilable(Time)) }
        attr_accessor :next_attempt_at

        # Last time you can retry the delivery manually, 7 days after the event.
        sig { returns(Time) }
        attr_accessor :retry_expires_at

        # Batch or monitor run that produced the event.
        sig { returns(ContextDev::Webhooks::DeliverySummary::Source::Variants) }
        attr_accessor :source

        # Delivery state. `pending` is waiting for an attempt, `delivering` has an attempt
        # in progress, `retrying` is waiting for an automatic retry, `delivered` was
        # acknowledged with a 2xx, `failed` has no automatic retries left, and `cancelled`
        # means the source or its webhook was removed.
        sig do
          returns(ContextDev::Webhooks::DeliverySummary::Status::TaggedSymbol)
        end
        attr_accessor :status

        # URL the webhook is sent to.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            id: String,
            created_at: Time,
            delivered_at: T.nilable(Time),
            event: ContextDev::Webhooks::DeliverySummary::Event::OrSymbol,
            last_error:
              T.nilable(
                ContextDev::Webhooks::DeliverySummary::LastError::OrHash
              ),
            next_attempt_at: T.nilable(Time),
            retry_expires_at: Time,
            source:
              T.any(
                ContextDev::Webhooks::DeliverySummary::Source::Batch::OrHash,
                ContextDev::Webhooks::DeliverySummary::Source::Monitor::OrHash
              ),
            status: ContextDev::Webhooks::DeliverySummary::Status::OrSymbol,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique ID of the delivery.
          id:,
          # When the event was created.
          created_at:,
          # When the delivery last succeeded. `null` until it succeeds.
          delivered_at:,
          # Event that triggered the delivery.
          event:,
          # Most recent delivery error. `null` when there is none.
          last_error:,
          # When the next attempt is scheduled. `null` when none is scheduled.
          next_attempt_at:,
          # Last time you can retry the delivery manually, 7 days after the event.
          retry_expires_at:,
          # Batch or monitor run that produced the event.
          source:,
          # Delivery state. `pending` is waiting for an attempt, `delivering` has an attempt
          # in progress, `retrying` is waiting for an automatic retry, `delivered` was
          # acknowledged with a 2xx, `failed` has no automatic retries left, and `cancelled`
          # means the source or its webhook was removed.
          status:,
          # URL the webhook is sent to.
          url:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              delivered_at: T.nilable(Time),
              event: ContextDev::Webhooks::DeliverySummary::Event::TaggedSymbol,
              last_error:
                T.nilable(ContextDev::Webhooks::DeliverySummary::LastError),
              next_attempt_at: T.nilable(Time),
              retry_expires_at: Time,
              source: ContextDev::Webhooks::DeliverySummary::Source::Variants,
              status:
                ContextDev::Webhooks::DeliverySummary::Status::TaggedSymbol,
              url: String
            }
          )
        end
        def to_hash
        end

        # Event that triggered the delivery.
        module Event
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::Webhooks::DeliverySummary::Event)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BATCH_COMPLETED =
            T.let(
              :"batch.completed",
              ContextDev::Webhooks::DeliverySummary::Event::TaggedSymbol
            )
          BATCH_FAILED =
            T.let(
              :"batch.failed",
              ContextDev::Webhooks::DeliverySummary::Event::TaggedSymbol
            )
          BATCH_CANCELLED =
            T.let(
              :"batch.cancelled",
              ContextDev::Webhooks::DeliverySummary::Event::TaggedSymbol
            )
          CHANGE_DETECTED =
            T.let(
              :"change.detected",
              ContextDev::Webhooks::DeliverySummary::Event::TaggedSymbol
            )
          RUN_COMPLETED =
            T.let(
              :"run.completed",
              ContextDev::Webhooks::DeliverySummary::Event::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Webhooks::DeliverySummary::Event::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class LastError < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Webhooks::DeliverySummary::LastError,
                ContextDev::Internal::AnyHash
              )
            end

          # Machine-readable error code.
          sig { returns(String) }
          attr_accessor :code

          # Human-readable explanation of the error.
          sig { returns(String) }
          attr_accessor :message

          # Most recent delivery error. `null` when there is none.
          sig do
            params(code: String, message: String).returns(T.attached_class)
          end
          def self.new(
            # Machine-readable error code.
            code:,
            # Human-readable explanation of the error.
            message:
          )
          end

          sig { override.returns({ code: String, message: String }) }
          def to_hash
          end
        end

        # Batch or monitor run that produced the event.
        module Source
          extend ContextDev::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                ContextDev::Webhooks::DeliverySummary::Source::Batch,
                ContextDev::Webhooks::DeliverySummary::Source::Monitor
              )
            end

          class Batch < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Webhooks::DeliverySummary::Source::Batch,
                  ContextDev::Internal::AnyHash
                )
              end

            # ID of the batch.
            sig { returns(String) }
            attr_accessor :batch_id

            # The event came from a batch.
            sig do
              returns(
                ContextDev::Webhooks::DeliverySummary::Source::Batch::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            sig do
              params(
                batch_id: String,
                type:
                  ContextDev::Webhooks::DeliverySummary::Source::Batch::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the batch.
              batch_id:,
              # The event came from a batch.
              type:
            )
            end

            sig do
              override.returns(
                {
                  batch_id: String,
                  type:
                    ContextDev::Webhooks::DeliverySummary::Source::Batch::Type::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The event came from a batch.
            module Type
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::Webhooks::DeliverySummary::Source::Batch::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              BATCH =
                T.let(
                  :batch,
                  ContextDev::Webhooks::DeliverySummary::Source::Batch::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Webhooks::DeliverySummary::Source::Batch::Type::TaggedSymbol
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
                  ContextDev::Webhooks::DeliverySummary::Source::Monitor,
                  ContextDev::Internal::AnyHash
                )
              end

            # ID of the monitor.
            sig { returns(String) }
            attr_accessor :monitor_id

            # ID of the monitor run.
            sig { returns(String) }
            attr_accessor :run_id

            # The event came from a monitor run.
            sig do
              returns(
                ContextDev::Webhooks::DeliverySummary::Source::Monitor::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            sig do
              params(
                monitor_id: String,
                run_id: String,
                type:
                  ContextDev::Webhooks::DeliverySummary::Source::Monitor::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the monitor.
              monitor_id:,
              # ID of the monitor run.
              run_id:,
              # The event came from a monitor run.
              type:
            )
            end

            sig do
              override.returns(
                {
                  monitor_id: String,
                  run_id: String,
                  type:
                    ContextDev::Webhooks::DeliverySummary::Source::Monitor::Type::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The event came from a monitor run.
            module Type
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::Webhooks::DeliverySummary::Source::Monitor::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MONITOR =
                T.let(
                  :monitor,
                  ContextDev::Webhooks::DeliverySummary::Source::Monitor::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Webhooks::DeliverySummary::Source::Monitor::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          sig do
            override.returns(
              T::Array[ContextDev::Webhooks::DeliverySummary::Source::Variants]
            )
          end
          def self.variants
          end
        end

        # Delivery state. `pending` is waiting for an attempt, `delivering` has an attempt
        # in progress, `retrying` is waiting for an automatic retry, `delivered` was
        # acknowledged with a 2xx, `failed` has no automatic retries left, and `cancelled`
        # means the source or its webhook was removed.
        module Status
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::Webhooks::DeliverySummary::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :pending,
              ContextDev::Webhooks::DeliverySummary::Status::TaggedSymbol
            )
          DELIVERING =
            T.let(
              :delivering,
              ContextDev::Webhooks::DeliverySummary::Status::TaggedSymbol
            )
          RETRYING =
            T.let(
              :retrying,
              ContextDev::Webhooks::DeliverySummary::Status::TaggedSymbol
            )
          DELIVERED =
            T.let(
              :delivered,
              ContextDev::Webhooks::DeliverySummary::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              ContextDev::Webhooks::DeliverySummary::Status::TaggedSymbol
            )
          CANCELLED =
            T.let(
              :cancelled,
              ContextDev::Webhooks::DeliverySummary::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Webhooks::DeliverySummary::Status::TaggedSymbol
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
