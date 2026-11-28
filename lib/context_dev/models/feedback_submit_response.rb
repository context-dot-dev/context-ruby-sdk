# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Feedback#submit
    class FeedbackSubmitResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute already_submitted
      #   `true` when feedback for this `request_id` was already recorded. `feedback_id`
      #   is then the original ID.
      #
      #   @return [Boolean]
      required :already_submitted, ContextDev::Internal::Type::Boolean

      # @!attribute feedback_id
      #   Unique ID of the feedback.
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
      #   @param already_submitted [Boolean] `true` when feedback for this `request_id` was already recorded. `feedback_id` i
      #
      #   @param feedback_id [String] Unique ID of the feedback.
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
