# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      # @see ContextDev::Resources::Webhooks::Deliveries#list
      class DeliveryListResponse < ContextDev::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [Array<ContextDev::Models::Webhooks::Delivery>]
        required :data, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Webhooks::Delivery] }

        # @!attribute has_more
        #
        #   @return [Boolean]
        required :has_more, ContextDev::Internal::Type::Boolean

        # @!attribute next_cursor
        #
        #   @return [String, nil]
        required :next_cursor, String, nil?: true

        # @!attribute key_metadata
        #   Metadata about the API key used for the request. Included in every response
        #   whenever a valid API key is provided, even when the response status is not 200.
        #
        #   @return [ContextDev::Models::Webhooks::DeliveryListResponse::KeyMetadata, nil]
        optional :key_metadata, -> { ContextDev::Models::Webhooks::DeliveryListResponse::KeyMetadata }

        # @!method initialize(data:, has_more:, next_cursor:, key_metadata: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::Webhooks::DeliveryListResponse} for more details.
        #
        #   @param data [Array<ContextDev::Models::Webhooks::Delivery>]
        #
        #   @param has_more [Boolean]
        #
        #   @param next_cursor [String, nil]
        #
        #   @param key_metadata [ContextDev::Models::Webhooks::DeliveryListResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when

        # @see ContextDev::Models::Webhooks::DeliveryListResponse#key_metadata
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
