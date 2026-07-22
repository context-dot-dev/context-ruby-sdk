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

      # Sum of credits across all monitors in the window.
      sig { returns(Integer) }
      attr_accessor :total_credits

      sig do
        params(
          data:
            T::Array[
              ContextDev::Models::MonitorGetCreditUsageResponse::Data::OrHash
            ],
          total_credits: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        data:,
        # Sum of credits across all monitors in the window.
        total_credits:
      )
      end

      sig do
        override.returns(
          {
            data:
              T::Array[ContextDev::Models::MonitorGetCreditUsageResponse::Data],
            total_credits: Integer
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
    end
  end
end
