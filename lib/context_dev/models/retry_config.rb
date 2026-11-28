# frozen_string_literal: true

module ContextDev
  module Models
    class RetryConfig < ContextDev::Internal::Type::BaseModel
      # @!attribute delays_seconds
      #   Delay before each automatic retry, in seconds, totaling at most 72 hours. Pass
      #   `[]` to disable automatic retries.
      #
      #   @return [Array<Integer>, nil]
      optional :delays_seconds, ContextDev::Internal::Type::ArrayOf[Integer]

      # @!method initialize(delays_seconds: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::RetryConfig} for more details.
      #
      #   Automatic retry settings. Pass `{}` for the default schedule.
      #
      #   @param delays_seconds [Array<Integer>] Delay before each automatic retry, in seconds, totaling at most 72 hours. Pass `
    end
  end
end
