# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#get_limits
    class MonitorGetLimitsResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute monitors_limit
      #   Maximum number of monitors allowed for the account. Defaults to the plan
      #   allowance unless a custom limit is set for the organization.
      #
      #   @return [Integer]
      required :monitors_limit, Integer

      # @!attribute monitors_used
      #   Number of monitors the account currently has.
      #
      #   @return [Integer]
      required :monitors_used, Integer

      # @!attribute plan
      #   The plan tier the limit was resolved from.
      #
      #   @return [Symbol, ContextDev::Models::MonitorGetLimitsResponse::Plan]
      required :plan, enum: -> { ContextDev::Models::MonitorGetLimitsResponse::Plan }

      # @!method initialize(monitors_limit:, monitors_used:, plan:)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorGetLimitsResponse} for more details.
      #
      #   @param monitors_limit [Integer] Maximum number of monitors allowed for the account. Defaults to the plan allowan
      #
      #   @param monitors_used [Integer] Number of monitors the account currently has.
      #
      #   @param plan [Symbol, ContextDev::Models::MonitorGetLimitsResponse::Plan] The plan tier the limit was resolved from.

      # The plan tier the limit was resolved from.
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
    end
  end
end
