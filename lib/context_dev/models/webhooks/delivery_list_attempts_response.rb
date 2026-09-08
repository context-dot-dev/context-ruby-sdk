# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      # @see ContextDev::Resources::Webhooks::Deliveries#list_attempts
      class DeliveryListAttemptsResponse < ContextDev::Internal::Type::BaseModel
        # @!attribute data
        #   Delivery attempts.
        #
        #   @return [Array<ContextDev::Models::Webhooks::Attempt>]
        required :data, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Webhooks::Attempt] }

        # @!attribute has_more
        #   Whether more attempts are available.
        #
        #   @return [Boolean]
        required :has_more, ContextDev::Internal::Type::Boolean

        # @!attribute next_cursor
        #   Next page cursor, or null on the last page.
        #
        #   @return [String, nil]
        required :next_cursor, String, nil?: true

        # @!attribute key_metadata
        #   Credit usage, included whenever a valid API key is provided.
        #
        #   @return [ContextDev::Models::Webhooks::DeliveryListAttemptsResponse::KeyMetadata, nil]
        optional :key_metadata, -> { ContextDev::Models::Webhooks::DeliveryListAttemptsResponse::KeyMetadata }

        # @!method initialize(data:, has_more:, next_cursor:, key_metadata: nil)
        #   @param data [Array<ContextDev::Models::Webhooks::Attempt>] Delivery attempts.
        #
        #   @param has_more [Boolean] Whether more attempts are available.
        #
        #   @param next_cursor [String, nil] Next page cursor, or null on the last page.
        #
        #   @param key_metadata [ContextDev::Models::Webhooks::DeliveryListAttemptsResponse::KeyMetadata] Credit usage, included whenever a valid API key is provided.

        # @see ContextDev::Models::Webhooks::DeliveryListAttemptsResponse#key_metadata
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
