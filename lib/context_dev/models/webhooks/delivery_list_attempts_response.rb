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

        # @!attribute request_id
        #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        #   support.
        #
        #   @return [String]
        required :request_id, String

        # @!attribute key_metadata
        #   Credits this request used and your remaining balance.
        #
        #   @return [ContextDev::Models::Webhooks::DeliveryListAttemptsResponse::KeyMetadata, nil]
        optional :key_metadata, -> { ContextDev::Models::Webhooks::DeliveryListAttemptsResponse::KeyMetadata }

        # @!method initialize(data:, has_more:, next_cursor:, request_id:, key_metadata: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::Webhooks::DeliveryListAttemptsResponse} for more details.
        #
        #   @param data [Array<ContextDev::Models::Webhooks::Attempt>] Delivery attempts.
        #
        #   @param has_more [Boolean] Whether more attempts are available.
        #
        #   @param next_cursor [String, nil] Next page cursor, or null on the last page.
        #
        #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
        #
        #   @param key_metadata [ContextDev::Models::Webhooks::DeliveryListAttemptsResponse::KeyMetadata] Credits this request used and your remaining balance.

        # @see ContextDev::Models::Webhooks::DeliveryListAttemptsResponse#key_metadata
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
