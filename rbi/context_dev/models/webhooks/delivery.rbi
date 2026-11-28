# typed: strong

module ContextDev
  module Models
    module Webhooks
      class Delivery < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(ContextDev::Webhooks::Delivery, ContextDev::Internal::AnyHash)
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
        sig { returns(ContextDev::Webhooks::Delivery::Event::TaggedSymbol) }
        attr_accessor :event

        # Event ID, sent as `X-Context-Id` and as `id` in the payload. It stays the same
        # across retries, so use it to deduplicate.
        sig { returns(String) }
        attr_accessor :event_id

        # Most recent attempt. `null` before the first attempt.
        sig { returns(T.nilable(ContextDev::Webhooks::Attempt)) }
        attr_reader :last_attempt

        sig do
          params(
            last_attempt: T.nilable(ContextDev::Webhooks::Attempt::OrHash)
          ).void
        end
        attr_writer :last_attempt

        # Most recent delivery error. `null` when there is none.
        sig { returns(T.nilable(ContextDev::Webhooks::Delivery::LastError)) }
        attr_reader :last_error

        sig do
          params(
            last_error:
              T.nilable(ContextDev::Webhooks::Delivery::LastError::OrHash)
          ).void
        end
        attr_writer :last_error

        # When the next attempt is scheduled. `null` when none is scheduled.
        sig { returns(T.nilable(Time)) }
        attr_accessor :next_attempt_at

        # Automatic retry settings. Pass `{}` for the default schedule.
        sig { returns(ContextDev::RetryConfig) }
        attr_reader :retry_

        sig { params(retry_: ContextDev::RetryConfig::OrHash).void }
        attr_writer :retry_

        # Last time you can retry the delivery manually, 7 days after the event.
        sig { returns(Time) }
        attr_accessor :retry_expires_at

        # Batch or monitor run that produced the event.
        sig { returns(ContextDev::Webhooks::Delivery::Source::Variants) }
        attr_accessor :source

        # Delivery state. `pending` is waiting for an attempt, `delivering` has an attempt
        # in progress, `retrying` is waiting for an automatic retry, `delivered` was
        # acknowledged with a 2xx, `failed` has no automatic retries left, and `cancelled`
        # means the source or its webhook was removed.
        sig { returns(ContextDev::Webhooks::Delivery::Status::TaggedSymbol) }
        attr_accessor :status

        # URL the webhook is sent to.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            id: String,
            created_at: Time,
            delivered_at: T.nilable(Time),
            event: ContextDev::Webhooks::Delivery::Event::OrSymbol,
            event_id: String,
            last_attempt: T.nilable(ContextDev::Webhooks::Attempt::OrHash),
            last_error:
              T.nilable(ContextDev::Webhooks::Delivery::LastError::OrHash),
            next_attempt_at: T.nilable(Time),
            retry_: ContextDev::RetryConfig::OrHash,
            retry_expires_at: Time,
            source:
              T.any(
                ContextDev::Webhooks::Delivery::Source::Batch::OrHash,
                ContextDev::Webhooks::Delivery::Source::Monitor::OrHash
              ),
            status: ContextDev::Webhooks::Delivery::Status::OrSymbol,
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
          # Event ID, sent as `X-Context-Id` and as `id` in the payload. It stays the same
          # across retries, so use it to deduplicate.
          event_id:,
          # Most recent attempt. `null` before the first attempt.
          last_attempt:,
          # Most recent delivery error. `null` when there is none.
          last_error:,
          # When the next attempt is scheduled. `null` when none is scheduled.
          next_attempt_at:,
          # Automatic retry settings. Pass `{}` for the default schedule.
          retry_:,
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
              event: ContextDev::Webhooks::Delivery::Event::TaggedSymbol,
              event_id: String,
              last_attempt: T.nilable(ContextDev::Webhooks::Attempt),
              last_error: T.nilable(ContextDev::Webhooks::Delivery::LastError),
              next_attempt_at: T.nilable(Time),
              retry_: ContextDev::RetryConfig,
              retry_expires_at: Time,
              source: ContextDev::Webhooks::Delivery::Source::Variants,
              status: ContextDev::Webhooks::Delivery::Status::TaggedSymbol,
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
              T.all(Symbol, ContextDev::Webhooks::Delivery::Event)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BATCH_COMPLETED =
            T.let(
              :"batch.completed",
              ContextDev::Webhooks::Delivery::Event::TaggedSymbol
            )
          BATCH_FAILED =
            T.let(
              :"batch.failed",
              ContextDev::Webhooks::Delivery::Event::TaggedSymbol
            )
          BATCH_CANCELLED =
            T.let(
              :"batch.cancelled",
              ContextDev::Webhooks::Delivery::Event::TaggedSymbol
            )
          CHANGE_DETECTED =
            T.let(
              :"change.detected",
              ContextDev::Webhooks::Delivery::Event::TaggedSymbol
            )
          RUN_COMPLETED =
            T.let(
              :"run.completed",
              ContextDev::Webhooks::Delivery::Event::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[ContextDev::Webhooks::Delivery::Event::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        class LastError < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Webhooks::Delivery::LastError,
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
                ContextDev::Webhooks::Delivery::Source::Batch,
                ContextDev::Webhooks::Delivery::Source::Monitor
              )
            end

          class Batch < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Webhooks::Delivery::Source::Batch,
                  ContextDev::Internal::AnyHash
                )
              end

            # ID of the batch.
            sig { returns(String) }
            attr_accessor :batch_id

            # The event came from a batch.
            sig do
              returns(
                ContextDev::Webhooks::Delivery::Source::Batch::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            sig do
              params(
                batch_id: String,
                type:
                  ContextDev::Webhooks::Delivery::Source::Batch::Type::OrSymbol
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
                    ContextDev::Webhooks::Delivery::Source::Batch::Type::TaggedSymbol
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
                    ContextDev::Webhooks::Delivery::Source::Batch::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              BATCH =
                T.let(
                  :batch,
                  ContextDev::Webhooks::Delivery::Source::Batch::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Webhooks::Delivery::Source::Batch::Type::TaggedSymbol
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
                  ContextDev::Webhooks::Delivery::Source::Monitor,
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
                ContextDev::Webhooks::Delivery::Source::Monitor::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            sig do
              params(
                monitor_id: String,
                run_id: String,
                type:
                  ContextDev::Webhooks::Delivery::Source::Monitor::Type::OrSymbol
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
                    ContextDev::Webhooks::Delivery::Source::Monitor::Type::TaggedSymbol
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
                    ContextDev::Webhooks::Delivery::Source::Monitor::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MONITOR =
                T.let(
                  :monitor,
                  ContextDev::Webhooks::Delivery::Source::Monitor::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Webhooks::Delivery::Source::Monitor::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          sig do
            override.returns(
              T::Array[ContextDev::Webhooks::Delivery::Source::Variants]
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
              T.all(Symbol, ContextDev::Webhooks::Delivery::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :pending,
              ContextDev::Webhooks::Delivery::Status::TaggedSymbol
            )
          DELIVERING =
            T.let(
              :delivering,
              ContextDev::Webhooks::Delivery::Status::TaggedSymbol
            )
          RETRYING =
            T.let(
              :retrying,
              ContextDev::Webhooks::Delivery::Status::TaggedSymbol
            )
          DELIVERED =
            T.let(
              :delivered,
              ContextDev::Webhooks::Delivery::Status::TaggedSymbol
            )
          FAILED =
            T.let(:failed, ContextDev::Webhooks::Delivery::Status::TaggedSymbol)
          CANCELLED =
            T.let(
              :cancelled,
              ContextDev::Webhooks::Delivery::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[ContextDev::Webhooks::Delivery::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
