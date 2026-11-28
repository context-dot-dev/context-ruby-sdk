# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#get_limits
    class MonitorGetLimitsResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute monitors_limit
      #   Maximum number of monitors your organization can have, from your plan or a
      #   custom limit.
      #
      #   @return [Integer]
      required :monitors_limit, Integer

      # @!attribute monitors_used
      #   Number of monitors your organization has.
      #
      #   @return [Integer]
      required :monitors_used, Integer

      # @!attribute plan
      #   Your plan tier. `free` is Free, `starter` is Developer, `pro` is Pro or Growth,
      #   and `scale` is Scale or Enterprise.
      #
      #   @return [Symbol, ContextDev::Models::MonitorGetLimitsResponse::Plan]
      required :plan, enum: -> { ContextDev::Models::MonitorGetLimitsResponse::Plan }

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::MonitorGetLimitsResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::MonitorGetLimitsResponse::KeyMetadata }

      # @!method initialize(monitors_limit:, monitors_used:, plan:, request_id:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorGetLimitsResponse} for more details.
      #
      #   @param monitors_limit [Integer] Maximum number of monitors your organization can have, from your plan or a custo
      #
      #   @param monitors_used [Integer] Number of monitors your organization has.
      #
      #   @param plan [Symbol, ContextDev::Models::MonitorGetLimitsResponse::Plan] Your plan tier. `free` is Free, `starter` is Developer, `pro` is Pro or Growth,
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param key_metadata [ContextDev::Models::MonitorGetLimitsResponse::KeyMetadata] Credits this request used and your remaining balance.

      # Your plan tier. `free` is Free, `starter` is Developer, `pro` is Pro or Growth,
      # and `scale` is Scale or Enterprise.
      #
      # @see ContextDev::Models::MonitorGetLimitsResponse#plan
      module Plan
        extend ContextDev::Internal::Type::Enum

        FREE = :free
        STARTER = :starter
        PRO = :pro
        SCALE = :scale

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::MonitorGetLimitsResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits your organization has left after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits your organization has left after this request.
      end
    end
  end
end
