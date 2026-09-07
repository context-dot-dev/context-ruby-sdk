# frozen_string_literal: true

module ContextDev
  module Models
    class RetryConfig < ContextDev::Internal::Type::BaseModel
      # @!attribute delays_seconds
      #   Wait in seconds after each failed attempt. The first attempt is immediate. At
      #   most 10 delays, each 1–86400 seconds, totaling at most 72 hours. Small jitter is
      #   added automatically. An empty array disables automatic retries; manual retries
      #   remain available.
      #
      #   @return [Array<Integer>, nil]
      optional :delays_seconds, ContextDev::Internal::Type::ArrayOf[Integer]

      # @!method initialize(delays_seconds: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::RetryConfig} for more details.
      #
      #   Opt into durable webhook delivery. An empty object uses the default retry
      #   schedule. Omit retry to preserve legacy delivery behavior. The policy is
      #   snapshotted for each event.
      #
      #   @param delays_seconds [Array<Integer>] Wait in seconds after each failed attempt. The first attempt is immediate. At mo
    end
  end
end
