# typed: strong

module ContextDev
  module Models
    class MonitorGetCreditUsageResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::MonitorGetCreditUsageResponse,
            ContextDev::Internal::AnyHash
          )
        end

      sig do
        returns(
          T::Array[ContextDev::Models::MonitorGetCreditUsageResponse::Data]
        )
      end
      attr_accessor :data

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Sum of credits across all monitors in the window.
      sig { returns(Integer) }
      attr_accessor :total_credits

      # Credits this request used and your remaining balance.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::MonitorGetCreditUsageResponse::KeyMetadata
          )
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::MonitorGetCreditUsageResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          data:
            T::Array[
              ContextDev::Models::MonitorGetCreditUsageResponse::Data::OrHash
            ],
          request_id: String,
          total_credits: Integer,
          key_metadata:
            ContextDev::Models::MonitorGetCreditUsageResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        data:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Sum of credits across all monitors in the window.
        total_credits:,
        # Credits this request used and your remaining balance.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            data:
              T::Array[ContextDev::Models::MonitorGetCreditUsageResponse::Data],
            request_id: String,
            total_credits: Integer,
            key_metadata:
              ContextDev::Models::MonitorGetCreditUsageResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class Data < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorGetCreditUsageResponse::Data,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits charged to this monitor over the window.
        sig { returns(Integer) }
        attr_accessor :credits

        sig { returns(String) }
        attr_accessor :monitor_id

        # Monitor name (falls back to the id when the monitor was deleted).
        sig { returns(String) }
        attr_accessor :name

        # Number of billed runs over the window.
        sig { returns(Integer) }
        attr_accessor :runs

        sig do
          params(
            credits: Integer,
            monitor_id: String,
            name: String,
            runs: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Credits charged to this monitor over the window.
          credits:,
          monitor_id:,
          # Monitor name (falls back to the id when the monitor was deleted).
          name:,
          # Number of billed runs over the window.
          runs:
        )
        end

        sig do
          override.returns(
            {
              credits: Integer,
              monitor_id: String,
              name: String,
              runs: Integer
            }
          )
        end
        def to_hash
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorGetCreditUsageResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits remaining for your organization.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Credits this request used and your remaining balance.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Credits charged for this request.
          credits_consumed:,
          # Credits remaining for your organization.
          credits_remaining:
        )
        end

        sig do
          override.returns(
            { credits_consumed: Integer, credits_remaining: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
