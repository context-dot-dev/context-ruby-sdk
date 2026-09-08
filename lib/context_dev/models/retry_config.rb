# frozen_string_literal: true

module ContextDev
  module Models
    class RetryConfig < ContextDev::Internal::Type::BaseModel
      # @!attribute delays_seconds
      #   Retry delays in seconds, totaling at most 72 hours. Use [] to disable automatic
      #   retries.
      #
      #   @return [Array<Integer>, nil]
      optional :delays_seconds, ContextDev::Internal::Type::ArrayOf[Integer]

      # @!method initialize(delays_seconds: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::RetryConfig} for more details.
      #
      #   Webhook retry settings. Use {} for the default schedule.
      #
      #   @param delays_seconds [Array<Integer>] Retry delays in seconds, totaling at most 72 hours. Use [] to disable automatic
    end
  end
end
