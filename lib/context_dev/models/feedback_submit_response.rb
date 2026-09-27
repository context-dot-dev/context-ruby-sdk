# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Feedback#submit
    class FeedbackSubmitResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute already_submitted
      #   True when feedback for this request_id was already recorded; the original
      #   feedback_id is returned.
      #
      #   @return [Boolean]
      required :already_submitted, ContextDev::Internal::Type::Boolean

      # @!attribute feedback_id
      #   ID of the stored feedback.
      #
      #   @return [String]
      required :feedback_id, String

      # @!attribute request_id
      #   Unique id of this API call, also sent in the X-Request-Id response header. Quote
      #   it when contacting support about a failed request.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute key_metadata
      #   Credit usage, included whenever a valid API key is provided.
      #
      #   @return [ContextDev::Models::FeedbackSubmitResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::FeedbackSubmitResponse::KeyMetadata }

      # @!method initialize(already_submitted:, feedback_id:, request_id:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::FeedbackSubmitResponse} for more details.
      #
      #   @param already_submitted [Boolean] True when feedback for this request_id was already recorded; the original feedba
      #
      #   @param feedback_id [String] ID of the stored feedback.
      #
      #   @param request_id [String] Unique id of this API call, also sent in the X-Request-Id response header. Quote
      #
      #   @param key_metadata [ContextDev::Models::FeedbackSubmitResponse::KeyMetadata] Credit usage, included whenever a valid API key is provided.

      # @see ContextDev::Models::FeedbackSubmitResponse#key_metadata
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
