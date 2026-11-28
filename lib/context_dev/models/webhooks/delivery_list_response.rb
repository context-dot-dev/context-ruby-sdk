# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      # @see ContextDev::Resources::Webhooks::Deliveries#list
      class DeliveryListResponse < ContextDev::Internal::Type::BaseModel
        # @!attribute data
        #   Webhook deliveries on this page.
        #
        #   @return [Array<ContextDev::Models::Webhooks::DeliverySummary>]
        required :data, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Webhooks::DeliverySummary] }

        # @!attribute has_more
        #   Whether more results are available after this page.
        #
        #   @return [Boolean]
        required :has_more, ContextDev::Internal::Type::Boolean

        # @!attribute next_cursor
        #   Pass as `cursor` to fetch the next page. `null` on the last page.
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
        #   @return [ContextDev::Models::Webhooks::DeliveryListResponse::KeyMetadata, nil]
        optional :key_metadata, -> { ContextDev::Models::Webhooks::DeliveryListResponse::KeyMetadata }

        # @!method initialize(data:, has_more:, next_cursor:, request_id:, key_metadata: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::Webhooks::DeliveryListResponse} for more details.
        #
        #   @param data [Array<ContextDev::Models::Webhooks::DeliverySummary>] Webhook deliveries on this page.
        #
        #   @param has_more [Boolean] Whether more results are available after this page.
        #
        #   @param next_cursor [String, nil] Pass as `cursor` to fetch the next page. `null` on the last page.
        #
        #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
        #
        #   @param key_metadata [ContextDev::Models::Webhooks::DeliveryListResponse::KeyMetadata] Credits this request used and your remaining balance.

        # @see ContextDev::Models::Webhooks::DeliveryListResponse#key_metadata
        class KeyMetadata < ContextDev::Internal::Type::BaseModel
          # @!attribute credits_consumed
          #   Credits charged for this request.
          #
          #   @return [Integer]
          required :credits_consumed, Integer

          # @!attribute credits_remaining
          #   Credits your organization has left after this request.
          #
          #   @return [Integer]
          required :credits_remaining, Integer

          # @!method initialize(credits_consumed:, credits_remaining:)
          #   Credits this request used and your remaining balance.
          #
          #   @param credits_consumed [Integer] Credits charged for this request.
          #
          #   @param credits_remaining [Integer] Credits your organization has left after this request.
        end
      end
    end
  end
end
