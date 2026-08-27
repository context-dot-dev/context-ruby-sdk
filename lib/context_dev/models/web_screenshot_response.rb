# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#screenshot
    class WebScreenshotResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute cache_metadata
      #   Cache outcome for this response. Composite responses are hits only when every
      #   cache-controlled fetch contributing to the output was a hit; age_ms is the
      #   oldest contributing hit.
      #
      #   @return [ContextDev::Models::WebScreenshotResponse::CacheMetadata]
      required :cache_metadata, -> { ContextDev::Models::WebScreenshotResponse::CacheMetadata }

      # @!attribute code
      #   HTTP status code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute domain
      #   The normalized domain that was processed
      #
      #   @return [String, nil]
      optional :domain, String

      # @!attribute height
      #   Height in pixels of the returned screenshot image
      #
      #   @return [Integer, nil]
      optional :height, Integer

      # @!attribute key_metadata
      #   Metadata about the API key used for the request. Included in every response
      #   whenever a valid API key is provided, even when the response status is not 200.
      #
      #   @return [ContextDev::Models::WebScreenshotResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebScreenshotResponse::KeyMetadata }

      # @!attribute screenshot
      #   Public image URL for standard requests, or an in-memory data URL when ZDR is
      #   enabled.
      #
      #   @return [String, nil]
      optional :screenshot, String

      # @!attribute screenshot_type
      #   Type of screenshot that was captured
      #
      #   @return [Symbol, ContextDev::Models::WebScreenshotResponse::ScreenshotType, nil]
      optional :screenshot_type,
               enum: -> { ContextDev::Models::WebScreenshotResponse::ScreenshotType },
               api_name: :screenshotType

      # @!attribute status
      #   Status of the response, e.g., 'ok'
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute width
      #   Width in pixels of the returned screenshot image
      #
      #   @return [Integer, nil]
      optional :width, Integer

      # @!method initialize(cache_metadata:, code: nil, domain: nil, height: nil, key_metadata: nil, screenshot: nil, screenshot_type: nil, status: nil, width: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebScreenshotResponse} for more details.
      #
      #   @param cache_metadata [ContextDev::Models::WebScreenshotResponse::CacheMetadata] Cache outcome for this response. Composite responses are hits only when every ca
      #
      #   @param code [Integer] HTTP status code
      #
      #   @param domain [String] The normalized domain that was processed
      #
      #   @param height [Integer] Height in pixels of the returned screenshot image
      #
      #   @param key_metadata [ContextDev::Models::WebScreenshotResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when
      #
      #   @param screenshot [String] Public image URL for standard requests, or an in-memory data URL when ZDR is ena
      #
      #   @param screenshot_type [Symbol, ContextDev::Models::WebScreenshotResponse::ScreenshotType] Type of screenshot that was captured
      #
      #   @param status [String] Status of the response, e.g., 'ok'
      #
      #   @param width [Integer] Width in pixels of the returned screenshot image

      # @see ContextDev::Models::WebScreenshotResponse#cache_metadata
      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute age_ms
        #   Age of the cached data in milliseconds. Zero for miss and zdr responses.
        #
        #   @return [Integer]
        required :age_ms, Integer

        # @!attribute status
        #   Whether the response was served from cache, required fresh work, or honored
        #   zero-data-retention cache bypass.
        #
        #   @return [Symbol, ContextDev::Models::WebScreenshotResponse::CacheMetadata::Status]
        required :status, enum: -> { ContextDev::Models::WebScreenshotResponse::CacheMetadata::Status }

        # @!method initialize(age_ms:, status:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScreenshotResponse::CacheMetadata} for more details.
        #
        #   Cache outcome for this response. Composite responses are hits only when every
        #   cache-controlled fetch contributing to the output was a hit; age_ms is the
        #   oldest contributing hit.
        #
        #   @param age_ms [Integer] Age of the cached data in milliseconds. Zero for miss and zdr responses.
        #
        #   @param status [Symbol, ContextDev::Models::WebScreenshotResponse::CacheMetadata::Status] Whether the response was served from cache, required fresh work, or honored zero

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        #
        # @see ContextDev::Models::WebScreenshotResponse::CacheMetadata#status
        module Status
          extend ContextDev::Internal::Type::Enum

          HIT = :hit
          MISS = :miss
          ZDR = :zdr

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::WebScreenshotResponse#key_metadata
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

      # Type of screenshot that was captured
      #
      # @see ContextDev::Models::WebScreenshotResponse#screenshot_type
      module ScreenshotType
        extend ContextDev::Internal::Type::Enum

        VIEWPORT = :viewport
        FULL_PAGE = :fullPage

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
