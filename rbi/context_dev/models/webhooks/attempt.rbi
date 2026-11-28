# typed: strong

module ContextDev
  module Models
    module Webhooks
      class Attempt < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(ContextDev::Webhooks::Attempt, ContextDev::Internal::AnyHash)
          end

        # Attempt number, starting at 1.
        sig { returns(Integer) }
        attr_accessor :attempt

        # When the attempt finished. `null` while in progress.
        sig { returns(T.nilable(Time)) }
        attr_accessor :completed_at

        # Why the attempt failed. `null` when it did not fail.
        sig { returns(T.nilable(ContextDev::Webhooks::Attempt::Error)) }
        attr_reader :error

        sig do
          params(
            error: T.nilable(ContextDev::Webhooks::Attempt::Error::OrHash)
          ).void
        end
        attr_writer :error

        # HTTP status your endpoint returned. `null` when no response was received.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :http_status

        # When the attempt started.
        sig { returns(Time) }
        attr_accessor :started_at

        # What started the attempt: `initial` is the first send, `automatic` is a
        # scheduled retry, and `manual` came from
        # `POST /webhooks/deliveries/{delivery_id}/retry`.
        sig { returns(ContextDev::Webhooks::Attempt::Trigger::TaggedSymbol) }
        attr_accessor :trigger

        # URL this attempt was sent to.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            attempt: Integer,
            completed_at: T.nilable(Time),
            error: T.nilable(ContextDev::Webhooks::Attempt::Error::OrHash),
            http_status: T.nilable(Integer),
            started_at: Time,
            trigger: ContextDev::Webhooks::Attempt::Trigger::OrSymbol,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Attempt number, starting at 1.
          attempt:,
          # When the attempt finished. `null` while in progress.
          completed_at:,
          # Why the attempt failed. `null` when it did not fail.
          error:,
          # HTTP status your endpoint returned. `null` when no response was received.
          http_status:,
          # When the attempt started.
          started_at:,
          # What started the attempt: `initial` is the first send, `automatic` is a
          # scheduled retry, and `manual` came from
          # `POST /webhooks/deliveries/{delivery_id}/retry`.
          trigger:,
          # URL this attempt was sent to.
          url:
        )
        end

        sig do
          override.returns(
            {
              attempt: Integer,
              completed_at: T.nilable(Time),
              error: T.nilable(ContextDev::Webhooks::Attempt::Error),
              http_status: T.nilable(Integer),
              started_at: Time,
              trigger: ContextDev::Webhooks::Attempt::Trigger::TaggedSymbol,
              url: String
            }
          )
        end
        def to_hash
        end

        class Error < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Webhooks::Attempt::Error,
                ContextDev::Internal::AnyHash
              )
            end

          # Machine-readable error code.
          sig { returns(String) }
          attr_accessor :code

          # Human-readable explanation of the error.
          sig { returns(String) }
          attr_accessor :message

          # Why the attempt failed. `null` when it did not fail.
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

        # What started the attempt: `initial` is the first send, `automatic` is a
        # scheduled retry, and `manual` came from
        # `POST /webhooks/deliveries/{delivery_id}/retry`.
        module Trigger
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::Webhooks::Attempt::Trigger)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INITIAL =
            T.let(
              :initial,
              ContextDev::Webhooks::Attempt::Trigger::TaggedSymbol
            )
          AUTOMATIC =
            T.let(
              :automatic,
              ContextDev::Webhooks::Attempt::Trigger::TaggedSymbol
            )
          MANUAL =
            T.let(:manual, ContextDev::Webhooks::Attempt::Trigger::TaggedSymbol)

          sig do
            override.returns(
              T::Array[ContextDev::Webhooks::Attempt::Trigger::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
