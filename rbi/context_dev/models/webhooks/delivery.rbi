# typed: strong

module ContextDev
  module Models
    module Webhooks
      class Delivery < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(ContextDev::Webhooks::Delivery, ContextDev::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :id

        # Number of delivery attempts started, including any attempt in progress.
        sig { returns(Integer) }
        attr_accessor :attempt_count

        sig { returns(Time) }
        attr_accessor :created_at

        # Most recent successful acknowledgment; retained if a later forced resend fails.
        sig { returns(T.nilable(Time)) }
        attr_accessor :delivered_at

        sig { returns(ContextDev::Webhooks::Delivery::Event::TaggedSymbol) }
        attr_accessor :event

        # Stable event ID. Unchanged across automatic and manual attempts; use it to
        # deduplicate events.
        sig { returns(String) }
        attr_accessor :event_id

        sig { returns(ContextDev::Webhooks::Delivery::LastAttempt) }
        attr_reader :last_attempt

        sig do
          params(
            last_attempt: ContextDev::Webhooks::Delivery::LastAttempt::OrHash
          ).void
        end
        attr_writer :last_attempt

        sig { returns(T.nilable(ContextDev::Webhooks::Delivery::LastError)) }
        attr_reader :last_error

        sig do
          params(
            last_error:
              T.nilable(ContextDev::Webhooks::Delivery::LastError::OrHash)
          ).void
        end
        attr_writer :last_error

        sig { returns(T.nilable(Time)) }
        attr_accessor :next_attempt_at

        # Opt into durable webhook delivery. An empty object uses the default retry
        # schedule. Omit retry to preserve legacy delivery behavior. The policy is
        # snapshotted for each event.
        sig { returns(ContextDev::RetryConfig) }
        attr_reader :retry_

        sig { params(retry_: ContextDev::RetryConfig::OrHash).void }
        attr_writer :retry_

        # Seven days after event creation. Manual retries after this time return 410.
        # Delivery and attempt metadata remain available for up to 30 days.
        sig { returns(Time) }
        attr_accessor :retry_expires_at

        sig { returns(ContextDev::Webhooks::Delivery::Source::Variants) }
        attr_accessor :source

        sig { returns(ContextDev::Webhooks::Delivery::Status::TaggedSymbol) }
        attr_accessor :status

        # Destination recorded for this delivery. Each attempt records the URL it used.
        # Monitor retries use the currently configured URL and signing secret.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            id: String,
            attempt_count: Integer,
            created_at: Time,
            delivered_at: T.nilable(Time),
            event: ContextDev::Webhooks::Delivery::Event::OrSymbol,
            event_id: String,
            last_attempt: ContextDev::Webhooks::Delivery::LastAttempt::OrHash,
            last_error:
              T.nilable(ContextDev::Webhooks::Delivery::LastError::OrHash),
            next_attempt_at: T.nilable(Time),
            retry_: ContextDev::RetryConfig::OrHash,
            retry_expires_at: Time,
            source:
              T.any(
                ContextDev::Webhooks::Delivery::Source::UnionMember0::OrHash,
                ContextDev::Webhooks::Delivery::Source::UnionMember1::OrHash
              ),
            status: ContextDev::Webhooks::Delivery::Status::OrSymbol,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Number of delivery attempts started, including any attempt in progress.
          attempt_count:,
          created_at:,
          # Most recent successful acknowledgment; retained if a later forced resend fails.
          delivered_at:,
          event:,
          # Stable event ID. Unchanged across automatic and manual attempts; use it to
          # deduplicate events.
          event_id:,
          last_attempt:,
          last_error:,
          next_attempt_at:,
          # Opt into durable webhook delivery. An empty object uses the default retry
          # schedule. Omit retry to preserve legacy delivery behavior. The policy is
          # snapshotted for each event.
          retry_:,
          # Seven days after event creation. Manual retries after this time return 410.
          # Delivery and attempt metadata remain available for up to 30 days.
          retry_expires_at:,
          source:,
          status:,
          # Destination recorded for this delivery. Each attempt records the URL it used.
          # Monitor retries use the currently configured URL and signing secret.
          url:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              attempt_count: Integer,
              created_at: Time,
              delivered_at: T.nilable(Time),
              event: ContextDev::Webhooks::Delivery::Event::TaggedSymbol,
              event_id: String,
              last_attempt: ContextDev::Webhooks::Delivery::LastAttempt,
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

        class LastAttempt < ContextDev::Models::Webhooks::Attempt
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Webhooks::Delivery::LastAttempt,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
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

          sig { returns(String) }
          attr_accessor :code

          sig { returns(String) }
          attr_accessor :message

          sig do
            params(code: String, message: String).returns(T.attached_class)
          end
          def self.new(code:, message:)
          end

          sig { override.returns({ code: String, message: String }) }
          def to_hash
          end
        end

        module Source
          extend ContextDev::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                ContextDev::Webhooks::Delivery::Source::UnionMember0,
                ContextDev::Webhooks::Delivery::Source::UnionMember1
              )
            end

          class UnionMember0 < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Webhooks::Delivery::Source::UnionMember0,
                  ContextDev::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :batch_id

            sig do
              returns(
                ContextDev::Webhooks::Delivery::Source::UnionMember0::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            sig do
              params(
                batch_id: String,
                type:
                  ContextDev::Webhooks::Delivery::Source::UnionMember0::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(batch_id:, type:)
            end

            sig do
              override.returns(
                {
                  batch_id: String,
                  type:
                    ContextDev::Webhooks::Delivery::Source::UnionMember0::Type::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            module Type
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::Webhooks::Delivery::Source::UnionMember0::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              BATCH =
                T.let(
                  :batch,
                  ContextDev::Webhooks::Delivery::Source::UnionMember0::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Webhooks::Delivery::Source::UnionMember0::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class UnionMember1 < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Webhooks::Delivery::Source::UnionMember1,
                  ContextDev::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :monitor_id

            sig { returns(String) }
            attr_accessor :run_id

            sig do
              returns(
                ContextDev::Webhooks::Delivery::Source::UnionMember1::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            sig do
              params(
                monitor_id: String,
                run_id: String,
                type:
                  ContextDev::Webhooks::Delivery::Source::UnionMember1::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(monitor_id:, run_id:, type:)
            end

            sig do
              override.returns(
                {
                  monitor_id: String,
                  run_id: String,
                  type:
                    ContextDev::Webhooks::Delivery::Source::UnionMember1::Type::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            module Type
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::Webhooks::Delivery::Source::UnionMember1::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MONITOR =
                T.let(
                  :monitor,
                  ContextDev::Webhooks::Delivery::Source::UnionMember1::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Webhooks::Delivery::Source::UnionMember1::Type::TaggedSymbol
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
