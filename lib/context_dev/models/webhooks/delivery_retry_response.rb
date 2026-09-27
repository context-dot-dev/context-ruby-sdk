# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      # @see ContextDev::Resources::Webhooks::Deliveries#retry_
      class DeliveryRetryResponse < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #   Delivery ID.
        #
        #   @return [String]
        required :id, String

        # @!attribute request_id
        #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        #   support.
        #
        #   @return [String]
        required :request_id, String

        # @!attribute key_metadata
        #   Credits this request used and your remaining balance.
        #
        #   @return [ContextDev::Models::Webhooks::DeliveryRetryResponse::KeyMetadata, nil]
        optional :key_metadata, -> { ContextDev::Models::Webhooks::DeliveryRetryResponse::KeyMetadata }

        # @!method initialize(id:, request_id:, key_metadata: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::Webhooks::DeliveryRetryResponse} for more details.
        #
        #   @param id [String] Delivery ID.
        #
        #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
        #
        #   @param key_metadata [ContextDev::Models::Webhooks::DeliveryRetryResponse::KeyMetadata] Credits this request used and your remaining balance.

        # @see ContextDev::Models::Webhooks::DeliveryRetryResponse#key_metadata
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
end
