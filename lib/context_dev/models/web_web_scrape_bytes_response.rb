# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#web_scrape_bytes
    class WebWebScrapeBytesResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute bytes
      #   Base64-encoded resource bytes, without a data URI prefix. Decode this field to
      #   recover the downloaded file.
      #
      #   @return [String]
      required :bytes, String

      # @!attribute content_length
      #   Number of decoded resource bytes, before base64 encoding.
      #
      #   @return [Integer]
      required :content_length, Integer, api_name: :contentLength

      # @!attribute content_type
      #   The Content-Type returned by the origin, including any charset. Defaults to
      #   application/octet-stream when absent.
      #
      #   @return [String]
      required :content_type, String, api_name: :contentType

      # @!attribute encoding
      #
      #   @return [Symbol, ContextDev::Models::WebWebScrapeBytesResponse::Encoding]
      required :encoding, enum: -> { ContextDev::Models::WebWebScrapeBytesResponse::Encoding }

      # @!attribute final_url
      #   The resource URL after redirects.
      #
      #   @return [String]
      required :final_url, String, api_name: :finalUrl

      # @!attribute request_id
      #   Unique id of this API call, also sent in the X-Request-Id response header. Quote
      #   it when contacting support about a failed request.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute status_code
      #   HTTP status returned by the origin.
      #
      #   @return [Integer]
      required :status_code, Integer, api_name: :statusCode

      # @!attribute success
      #
      #   @return [Boolean, ContextDev::Models::WebWebScrapeBytesResponse::Success]
      required :success, enum: -> { ContextDev::Models::WebWebScrapeBytesResponse::Success }

      # @!attribute url
      #   The requested resource URL.
      #
      #   @return [String]
      required :url, String

      # @!attribute key_metadata
      #   Credit usage, included whenever a valid API key is provided.
      #
      #   @return [ContextDev::Models::WebWebScrapeBytesResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebWebScrapeBytesResponse::KeyMetadata }

      # @!method initialize(bytes:, content_length:, content_type:, encoding:, final_url:, request_id:, status_code:, success:, url:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebScrapeBytesResponse} for more details.
      #
      #   @param bytes [String] Base64-encoded resource bytes, without a data URI prefix. Decode this field to r
      #
      #   @param content_length [Integer] Number of decoded resource bytes, before base64 encoding.
      #
      #   @param content_type [String] The Content-Type returned by the origin, including any charset. Defaults to appl
      #
      #   @param encoding [Symbol, ContextDev::Models::WebWebScrapeBytesResponse::Encoding]
      #
      #   @param final_url [String] The resource URL after redirects.
      #
      #   @param request_id [String] Unique id of this API call, also sent in the X-Request-Id response header. Quote
      #
      #   @param status_code [Integer] HTTP status returned by the origin.
      #
      #   @param success [Boolean, ContextDev::Models::WebWebScrapeBytesResponse::Success]
      #
      #   @param url [String] The requested resource URL.
      #
      #   @param key_metadata [ContextDev::Models::WebWebScrapeBytesResponse::KeyMetadata] Credit usage, included whenever a valid API key is provided.

      # @see ContextDev::Models::WebWebScrapeBytesResponse#encoding
      module Encoding
        extend ContextDev::Internal::Type::Enum

        BASE64 = :base64

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::WebWebScrapeBytesResponse#success
      module Success
        extend ContextDev::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # @see ContextDev::Models::WebWebScrapeBytesResponse#key_metadata
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
