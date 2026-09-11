# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#delete
    class BatchDeleteResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute request_id
      #   Unique id of this API call, also sent in the X-Request-Id response header. Quote
      #   it when contacting support about a failed request.
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
      #   Credit usage, included whenever a valid API key is provided.
      #
      #   @return [ContextDev::Models::BatchDeleteResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BatchDeleteResponse::KeyMetadata }

      # @!method initialize(request_id:, id: nil, deleted: nil, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchDeleteResponse} for more details.
      #
      #   @param request_id [String] Unique id of this API call, also sent in the X-Request-Id response header. Quote
      #
      #   @param id [String] ID of the deleted batch.
      #
      #   @param deleted [Boolean] Always true on success.
      #
      #   @param key_metadata [ContextDev::Models::BatchDeleteResponse::KeyMetadata] Credit usage, included whenever a valid API key is provided.

      # @see ContextDev::Models::BatchDeleteResponse#key_metadata
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
