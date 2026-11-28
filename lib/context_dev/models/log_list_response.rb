# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Logs#list
    class LogListResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #   Log entries on this page, newest first.
      #
      #   @return [Array<ContextDev::Models::LogListResponse::Data>]
      required :data, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::LogListResponse::Data] }

      # @!attribute has_more
      #   Whether more results are available after this page.
      #
      #   @return [Boolean]
      required :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute limit
      #   Maximum number of log entries to return per page.
      #
      #   @return [Integer]
      required :limit, Integer

      # @!attribute page
      #   Current page number.
      #
      #   @return [Integer]
      required :page, Integer

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::LogListResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::LogListResponse::KeyMetadata }

      # @!method initialize(data:, has_more:, limit:, page:, request_id:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::LogListResponse} for more details.
      #
      #   @param data [Array<ContextDev::Models::LogListResponse::Data>] Log entries on this page, newest first.
      #
      #   @param has_more [Boolean] Whether more results are available after this page.
      #
      #   @param limit [Integer] Maximum number of log entries to return per page.
      #
      #   @param page [Integer] Current page number.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param key_metadata [ContextDev::Models::LogListResponse::KeyMetadata] Credits this request used and your remaining balance.

      class Data < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_used
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_used, Integer

        # @!attribute error_code
        #   The response's `error_code`. `null` on success.
        #
        #   @return [String, nil]
        required :error_code, String, nil?: true

        # @!attribute key_id
        #   ID of the API key that made the request. Can be `null` for `MONITOR` and `BATCH`
        #   entries.
        #
        #   @return [String, nil]
        required :key_id, String, nil?: true

        # @!attribute latency_ms
        #   Server-side processing time, in milliseconds.
        #
        #   @return [Float]
        required :latency_ms, Float

        # @!attribute method_
        #   HTTP method, or `MONITOR` for a monitor run and `BATCH` for a batch settlement.
        #
        #   @return [String]
        required :method_, String, api_name: :method

        # @!attribute path
        #   Endpoint path that was called.
        #
        #   @return [String]
        required :path, String

        # @!attribute request_id
        #   ID of the logged request.
        #
        #   @return [String]
        required :request_id, String

        # @!attribute status_code
        #   HTTP status code of the response.
        #
        #   @return [Integer]
        required :status_code, Integer

        # @!attribute tags
        #   Tags sent with the request.
        #
        #   @return [Array<String>]
        required :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute timestamp
        #   When the request completed.
        #
        #   @return [Time]
        required :timestamp, Time

        # @!attribute zdr
        #   Whether the request used zero data retention (ZDR).
        #
        #   @return [Boolean]
        required :zdr, ContextDev::Internal::Type::Boolean

        # @!method initialize(credits_used:, error_code:, key_id:, latency_ms:, method_:, path:, request_id:, status_code:, tags:, timestamp:, zdr:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::LogListResponse::Data} for more details.
        #
        #   @param credits_used [Integer] Credits charged for this request.
        #
        #   @param error_code [String, nil] The response's `error_code`. `null` on success.
        #
        #   @param key_id [String, nil] ID of the API key that made the request. Can be `null` for `MONITOR` and `BATCH`
        #
        #   @param latency_ms [Float] Server-side processing time, in milliseconds.
        #
        #   @param method_ [String] HTTP method, or `MONITOR` for a monitor run and `BATCH` for a batch settlement.
        #
        #   @param path [String] Endpoint path that was called.
        #
        #   @param request_id [String] ID of the logged request.
        #
        #   @param status_code [Integer] HTTP status code of the response.
        #
        #   @param tags [Array<String>] Tags sent with the request.
        #
        #   @param timestamp [Time] When the request completed.
        #
        #   @param zdr [Boolean] Whether the request used zero data retention (ZDR).
      end

      # @see ContextDev::Models::LogListResponse#key_metadata
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
