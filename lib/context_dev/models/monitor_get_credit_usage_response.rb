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

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute total_credits
      #   Sum of credits across all monitors in the window.
      #
      #   @return [Integer]
      required :total_credits, Integer

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::MonitorGetCreditUsageResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::MonitorGetCreditUsageResponse::KeyMetadata }

      # @!method initialize(data:, request_id:, total_credits:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorGetCreditUsageResponse} for more details.
      #
      #   @param data [Array<ContextDev::Models::MonitorGetCreditUsageResponse::Data>]
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param total_credits [Integer] Sum of credits across all monitors in the window.
      #
      #   @param key_metadata [ContextDev::Models::MonitorGetCreditUsageResponse::KeyMetadata] Credits this request used and your remaining balance.

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

      # @see ContextDev::Models::MonitorGetCreditUsageResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits remaining for your organization.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits remaining for your organization.
      end
    end
  end
end
