# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#delete
    class MonitorDeleteResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute deleted
      #
      #   @return [Boolean]
      required :deleted, ContextDev::Internal::Type::Boolean

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::MonitorDeleteResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::MonitorDeleteResponse::KeyMetadata }

      # @!method initialize(id:, deleted:, request_id:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorDeleteResponse} for more details.
      #
      #   @param id [String]
      #
      #   @param deleted [Boolean]
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param key_metadata [ContextDev::Models::MonitorDeleteResponse::KeyMetadata] Credits this request used and your remaining balance.

      # @see ContextDev::Models::MonitorDeleteResponse#key_metadata
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
