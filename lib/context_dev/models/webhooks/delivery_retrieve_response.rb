# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      # @see ContextDev::Resources::Webhooks::Deliveries#retrieve
      class DeliveryRetrieveResponse < ContextDev::Models::Webhooks::Delivery
        # @!attribute key_metadata
        #   Credit usage, included whenever a valid API key is provided.
        #
        #   @return [ContextDev::Models::Webhooks::DeliveryRetrieveResponse::KeyMetadata, nil]
        optional :key_metadata, -> { ContextDev::Models::Webhooks::DeliveryRetrieveResponse::KeyMetadata }

        # @!method initialize(key_metadata: nil)
        #   @param key_metadata [ContextDev::Models::Webhooks::DeliveryRetrieveResponse::KeyMetadata] Credit usage, included whenever a valid API key is provided.

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
