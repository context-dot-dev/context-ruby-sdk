# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#run
    class MonitorRunResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute monitor_id
      #
      #   @return [String]
      required :monitor_id, String

      # @!attribute queued
      #
      #   @return [Boolean]
      required :queued, ContextDev::Internal::Type::Boolean

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute run_id
      #   ID of the queued run; pass it to Retrieve a monitor run.
      #
      #   @return [String]
      required :run_id, String

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::MonitorRunResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::MonitorRunResponse::KeyMetadata }

      # @!method initialize(monitor_id:, queued:, request_id:, run_id:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorRunResponse} for more details.
      #
      #   @param monitor_id [String]
      #
      #   @param queued [Boolean]
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param run_id [String] ID of the queued run; pass it to Retrieve a monitor run.
      #
      #   @param key_metadata [ContextDev::Models::MonitorRunResponse::KeyMetadata] Credits this request used and your remaining balance.

      # @see ContextDev::Models::MonitorRunResponse#key_metadata
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
