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

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute sources
      #   URLs of the pages and company/profile records read for the answer, followed by
      #   URLs cited in json_content.
      #
      #   @return [Array<String>]
      required :sources, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::WebAnswersResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebAnswersResponse::KeyMetadata }

      # @!attribute partial
      #   True when the answer is incomplete: the request deadline ended research, or a
      #   requested list item has no researched values.
      #
      #   @return [Boolean, nil]
      optional :partial, ContextDev::Internal::Type::Boolean

      # @!method initialize(json_content:, request_id:, sources:, key_metadata: nil, partial: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebAnswersResponse} for more details.
      #
      #   @param json_content [Hash{Symbol=>Object}] The answer, in the shape requested by json_format.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param sources [Array<String>] URLs of the pages and company/profile records read for the answer, followed by U
      #
      #   @param key_metadata [ContextDev::Models::WebAnswersResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param partial [Boolean] True when the answer is incomplete: the request deadline ended research, or a re

      # @see ContextDev::Models::WebAnswersResponse#key_metadata
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
