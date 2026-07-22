# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#get_credit_usage
    class MonitorGetCreditUsageResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Array<ContextDev::Models::MonitorGetCreditUsageResponse::Data>]
      required :data,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorGetCreditUsageResponse::Data] }

      # @!attribute total_credits
      #   Sum of credits across all monitors in the window.
      #
      #   @return [Integer]
      required :total_credits, Integer

      # @!method initialize(data:, total_credits:)
      #   @param data [Array<ContextDev::Models::MonitorGetCreditUsageResponse::Data>]
      #
      #   @param total_credits [Integer] Sum of credits across all monitors in the window.

      class Data < ContextDev::Internal::Type::BaseModel
        # @!attribute credits
        #   Credits charged to this monitor over the window.
        #
        #   @return [Integer]
        required :credits, Integer

        # @!attribute monitor_id
        #
        #   @return [String]
        required :monitor_id, String

        # @!attribute name
        #   Monitor name (falls back to the id when the monitor was deleted).
        #
        #   @return [String]
        required :name, String

        # @!attribute runs
        #   Number of billed runs over the window.
        #
        #   @return [Integer]
        required :runs, Integer

        # @!method initialize(credits:, monitor_id:, name:, runs:)
        #   @param credits [Integer] Credits charged to this monitor over the window.
        #
        #   @param monitor_id [String]
        #
        #   @param name [String] Monitor name (falls back to the id when the monitor was deleted).
        #
        #   @param runs [Integer] Number of billed runs over the window.
      end
    end
  end
end
