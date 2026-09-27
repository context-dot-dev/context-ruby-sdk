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
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
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
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param key_metadata [ContextDev::Models::FeedbackSubmitResponse::KeyMetadata] Credits this request used and your remaining balance.

      # @see ContextDev::Models::FeedbackSubmitResponse#key_metadata
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
