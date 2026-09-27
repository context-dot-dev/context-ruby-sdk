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

        # Completion time, or null while in progress.
        sig { returns(T.nilable(Time)) }
        attr_accessor :completed_at

        # Attempt error, or null if none.
        sig { returns(T.nilable(ContextDev::Webhooks::Attempt::Error)) }
        attr_reader :error

        sig do
          params(
            error: T.nilable(ContextDev::Webhooks::Attempt::Error::OrHash)
          ).void
        end
        attr_writer :error

        # HTTP response status, or null if no response was received.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :http_status

        # Attempt start time.
        sig { returns(Time) }
        attr_accessor :started_at

        # `initial`, `automatic` (scheduled retry), or `manual` (Retry endpoint).
        sig { returns(ContextDev::Webhooks::Attempt::Trigger::TaggedSymbol) }
        attr_accessor :trigger

        # URL used for this attempt.
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
          # Completion time, or null while in progress.
          completed_at:,
          # Attempt error, or null if none.
          error:,
          # HTTP response status, or null if no response was received.
          http_status:,
          # Attempt start time.
          started_at:,
          # `initial`, `automatic` (scheduled retry), or `manual` (Retry endpoint).
          trigger:,
          # URL used for this attempt.
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

          # Error code.
          sig { returns(String) }
          attr_accessor :code

          # Error details.
          sig { returns(String) }
          attr_accessor :message

          # Attempt error, or null if none.
          sig do
            params(code: String, message: String).returns(T.attached_class)
          end
          def self.new(
            # Error code.
            code:,
            # Error details.
            message:
          )
          end

          sig { override.returns({ code: String, message: String }) }
          def to_hash
          end
        end

        # `initial`, `automatic` (scheduled retry), or `manual` (Retry endpoint).
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
