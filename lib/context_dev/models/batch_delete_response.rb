# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#delete
    class BatchDeleteResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute id
      #   ID of the deleted batch.
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute deleted
      #   Always true on success.
      #
      #   @return [Boolean, nil]
      optional :deleted, ContextDev::Internal::Type::Boolean

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::BatchDeleteResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BatchDeleteResponse::KeyMetadata }

      # @!method initialize(request_id:, id: nil, deleted: nil, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchDeleteResponse} for more details.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param id [String] ID of the deleted batch.
      #
      #   @param deleted [Boolean] Always true on success.
      #
      #   @param key_metadata [ContextDev::Models::BatchDeleteResponse::KeyMetadata] Credits this request used and your remaining balance.

      # @see ContextDev::Models::BatchDeleteResponse#key_metadata
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
