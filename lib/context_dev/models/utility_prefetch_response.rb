# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Utility#prefetch
    class UtilityPrefetchResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute domain
      #   The domain that was queued for prefetching
      #
      #   @return [String, nil]
      optional :domain, String

      # @!attribute key_metadata
      #   Credit usage, included whenever a valid API key is provided.
      #
      #   @return [ContextDev::Models::UtilityPrefetchResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::UtilityPrefetchResponse::KeyMetadata }

      # @!attribute message
      #   Success message
      #
      #   @return [String, nil]
      optional :message, String

      # @!attribute status
      #   Status of the response, e.g., 'ok'
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute type
      #   The type of prefetch that was queued, echoed from the request
      #
      #   @return [Symbol, ContextDev::Models::UtilityPrefetchResponse::Type, nil]
      optional :type, enum: -> { ContextDev::Models::UtilityPrefetchResponse::Type }

      # @!method initialize(domain: nil, key_metadata: nil, message: nil, status: nil, type: nil)
      #   @param domain [String] The domain that was queued for prefetching
      #
      #   @param key_metadata [ContextDev::Models::UtilityPrefetchResponse::KeyMetadata] Credit usage, included whenever a valid API key is provided.
      #
      #   @param message [String] Success message
      #
      #   @param status [String] Status of the response, e.g., 'ok'
      #
      #   @param type [Symbol, ContextDev::Models::UtilityPrefetchResponse::Type] The type of prefetch that was queued, echoed from the request

      # @see ContextDev::Models::UtilityPrefetchResponse#key_metadata
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

      # The type of prefetch that was queued, echoed from the request
      #
      # @see ContextDev::Models::UtilityPrefetchResponse#type
      module Type
        extend ContextDev::Internal::Type::Enum

        BRAND = :brand
        STYLEGUIDE = :styleguide

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
