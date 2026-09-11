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
        #   Unique id of this API call, also sent in the X-Request-Id response header. Quote
        #   it when contacting support about a failed request.
        #
        #   @return [String]
        required :request_id, String

        # @!attribute key_metadata
        #   Credit usage, included whenever a valid API key is provided.
        #
        #   @return [ContextDev::Models::Webhooks::DeliveryRetryResponse::KeyMetadata, nil]
        optional :key_metadata, -> { ContextDev::Models::Webhooks::DeliveryRetryResponse::KeyMetadata }

        # @!method initialize(id:, request_id:, key_metadata: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::Webhooks::DeliveryRetryResponse} for more details.
        #
        #   @param id [String] Delivery ID.
        #
        #   @param request_id [String] Unique id of this API call, also sent in the X-Request-Id response header. Quote
        #
        #   @param key_metadata [ContextDev::Models::Webhooks::DeliveryRetryResponse::KeyMetadata] Credit usage, included whenever a valid API key is provided.

        # @see ContextDev::Models::Webhooks::DeliveryRetryResponse#key_metadata
        class KeyMetadata < ContextDev::Internal::Type::BaseModel
          # @!attribute credits_consumed
          #   Credits used by this request.
          #
          #   @return [Integer]
          required :credits_consumed, Integer

          # @!attribute credits_remaining
          #   Credits remaining for your organization.
          #
          #   @return [Integer]
          required :credits_remaining, Integer

          # @!method initialize(credits_consumed:, credits_remaining:)
          #   Credit usage, included whenever a valid API key is provided.
          #
          #   @param credits_consumed [Integer] Credits used by this request.
          #
          #   @param credits_remaining [Integer] Credits remaining for your organization.
        end
      end
    end
  end
end
