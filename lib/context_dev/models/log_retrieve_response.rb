# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Logs#retrieve
    class LogRetrieveResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [ContextDev::Models::LogRetrieveResponse::Data]
      required :data, -> { ContextDev::Models::LogRetrieveResponse::Data }

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::LogRetrieveResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::LogRetrieveResponse::KeyMetadata }

      # @!method initialize(data:, request_id:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::LogRetrieveResponse} for more details.
      #
      #   @param data [ContextDev::Models::LogRetrieveResponse::Data]
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param key_metadata [ContextDev::Models::LogRetrieveResponse::KeyMetadata] Credits this request used and your remaining balance.

      # @see ContextDev::Models::LogRetrieveResponse#data
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

        # @!attribute input
        #   Input retained from the request.
        #
        #   @return [ContextDev::Models::LogRetrieveResponse::Data::Input]
        required :input, -> { ContextDev::Models::LogRetrieveResponse::Data::Input }

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

        # @!attribute user_agent
        #   The request's `User-Agent` header.
        #
        #   @return [String, nil]
        required :user_agent, String, nil?: true

        # @!attribute zdr
        #   Whether the request used zero data retention (ZDR).
        #
        #   @return [Boolean]
        required :zdr, ContextDev::Internal::Type::Boolean

        # @!attribute response
        #   Retained JSON response with credentials redacted. `null` when unavailable, such
        #   as under ZDR.
        #
        #   @return [Object, nil]
        optional :response, ContextDev::Internal::Type::Unknown

        # @!method initialize(credits_used:, error_code:, input:, key_id:, latency_ms:, method_:, path:, request_id:, status_code:, tags:, timestamp:, user_agent:, zdr:, response: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::LogRetrieveResponse::Data} for more details.
        #
        #   @param credits_used [Integer] Credits charged for this request.
        #
        #   @param error_code [String, nil] The response's `error_code`. `null` on success.
        #
        #   @param input [ContextDev::Models::LogRetrieveResponse::Data::Input] Input retained from the request.
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
        #   @param user_agent [String, nil] The request's `User-Agent` header.
        #
        #   @param zdr [Boolean] Whether the request used zero data retention (ZDR).
        #
        #   @param response [Object] Retained JSON response with credentials redacted. `null` when unavailable, such

        # @see ContextDev::Models::LogRetrieveResponse::Data#input
        class Input < ContextDev::Internal::Type::BaseModel
          # @!attribute query
          #   Query parameters of the request.
          #
          #   @return [Hash{Symbol=>Object}]
          required :query, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

          # @!attribute body
          #   Request body with credentials and uploaded content redacted.
          #
          #   @return [Object, nil]
          optional :body, ContextDev::Internal::Type::Unknown

          # @!method initialize(query:, body: nil)
          #   Input retained from the request.
          #
          #   @param query [Hash{Symbol=>Object}] Query parameters of the request.
          #
          #   @param body [Object] Request body with credentials and uploaded content redacted.
        end
      end

      # @see ContextDev::Models::LogRetrieveResponse#key_metadata
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
