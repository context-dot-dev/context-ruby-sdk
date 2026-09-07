# typed: strong

module ContextDev
  module Models
    module Webhooks
      class Attempt < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(ContextDev::Webhooks::Attempt, ContextDev::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Integer) }
        attr_accessor :attempt

        sig { returns(T.nilable(Time)) }
        attr_accessor :completed_at

        sig { returns(T.nilable(ContextDev::Webhooks::Attempt::Error)) }
        attr_reader :error

        sig do
          params(
            error: T.nilable(ContextDev::Webhooks::Attempt::Error::OrHash)
          ).void
        end
        attr_writer :error

        sig { returns(T.nilable(Integer)) }
        attr_accessor :http_status

        sig { returns(Time) }
        attr_accessor :started_at

        sig { returns(ContextDev::Webhooks::Attempt::Trigger::TaggedSymbol) }
        attr_accessor :trigger

        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            id: String,
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
          id:,
          attempt:,
          completed_at:,
          error:,
          http_status:,
          started_at:,
          trigger:,
          url:
        )
        end

        sig do
          override.returns(
            {
              id: String,
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
