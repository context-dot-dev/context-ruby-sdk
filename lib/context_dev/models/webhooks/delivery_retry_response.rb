# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      # @see ContextDev::Resources::Webhooks::Deliveries#retry_
      class DeliveryRetryResponse < ContextDev::Models::Webhooks::Delivery
        # @!attribute key_metadata
        #   Metadata about the API key used for the request. Included in every response
        #   whenever a valid API key is provided, even when the response status is not 200.
        #
        #   @return [ContextDev::Models::Webhooks::DeliveryRetryResponse::KeyMetadata, nil]
        optional :key_metadata, -> { ContextDev::Models::Webhooks::DeliveryRetryResponse::KeyMetadata }

        # @!method initialize(key_metadata: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::Webhooks::DeliveryRetryResponse} for more details.
        #
        #   @param key_metadata [ContextDev::Models::Webhooks::DeliveryRetryResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when

        class KeyMetadata < ContextDev::Internal::Type::BaseModel
          # @!attribute credits_consumed
          #   The number of credits consumed by this request.
          #
          #   @return [Integer]
          required :credits_consumed, Integer

          # @!attribute credits_remaining
          #   The number of credits remaining for your organization after this request.
          #
          #   @return [Integer]
          required :credits_remaining, Integer

          # @!method initialize(credits_consumed:, credits_remaining:)
          #   Metadata about the API key used for the request. Included in every response
          #   whenever a valid API key is provided, even when the response status is not 200.
          #
          #   @param credits_consumed [Integer] The number of credits consumed by this request.
          #
          #   @param credits_remaining [Integer] The number of credits remaining for your organization after this request.
        end
      end
    end
  end
end
