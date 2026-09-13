# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#answers
    class WebAnswersResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute json_content
      #   The answer, in the shape requested by json_format.
      #
      #   @return [Hash{Symbol=>Object}]
      required :json_content, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

      # @!attribute sources
      #   URLs that supplied search results or readable page content, in first-seen order.
      #   Unreadable pages are excluded.
      #
      #   @return [Array<String>]
      required :sources, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute key_metadata
      #   Credit usage, included whenever a valid API key is provided.
      #
      #   @return [ContextDev::Models::WebAnswersResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebAnswersResponse::KeyMetadata }

      # @!method initialize(json_content:, sources:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebAnswersResponse} for more details.
      #
      #   @param json_content [Hash{Symbol=>Object}] The answer, in the shape requested by json_format.
      #
      #   @param sources [Array<String>] URLs that supplied search results or readable page content, in first-seen order.
      #
      #   @param key_metadata [ContextDev::Models::WebAnswersResponse::KeyMetadata] Credit usage, included whenever a valid API key is provided.

      # @see ContextDev::Models::WebAnswersResponse#key_metadata
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
