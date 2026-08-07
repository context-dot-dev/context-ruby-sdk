# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#delete
    class BatchDeleteResponse < ContextDev::Internal::Type::BaseModel
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
      #   Metadata about the API key used for the request. Included in every response
      #   whenever a valid API key is provided, even when the response status is not 200.
      #
      #   @return [ContextDev::Models::BatchDeleteResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BatchDeleteResponse::KeyMetadata }

      # @!method initialize(id: nil, deleted: nil, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchDeleteResponse} for more details.
      #
      #   @param id [String] ID of the deleted batch.
      #
      #   @param deleted [Boolean] Always true on success.
      #
      #   @param key_metadata [ContextDev::Models::BatchDeleteResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when

      # @see ContextDev::Models::BatchDeleteResponse#key_metadata
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
