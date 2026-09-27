# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#screenshot
    class WebScreenshotResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute cache_metadata
      #   Whether this response came from cache.
      #
      #   @return [ContextDev::Models::WebScreenshotResponse::CacheMetadata]
      required :cache_metadata, -> { ContextDev::Models::WebScreenshotResponse::CacheMetadata }

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

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

      # @!attribute final_dom_state
      #   `loaded`, or `still-loading` when capture ended before the page finished
      #   loading.
      #
      #   @return [Symbol, ContextDev::Models::WebScreenshotResponse::FinalDomState, nil]
      optional :final_dom_state,
               enum: -> { ContextDev::Models::WebScreenshotResponse::FinalDomState },
               api_name: :finalDOMState

      # @!attribute height
      #   Height in pixels of the returned screenshot image
      #
      #   @return [Integer, nil]
      optional :height, Integer

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::WebScreenshotResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebScreenshotResponse::KeyMetadata }

      # @!attribute screenshot
      #   Public image URL for standard requests, or an in-memory data URL when ZDR or
      #   non-empty custom headers are supplied.
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
      #   Always `ok` on success.
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute width
      #   Width in pixels of the returned screenshot image
      #
      #   @return [Integer, nil]
      optional :width, Integer

      # @!method initialize(cache_metadata:, request_id:, code: nil, domain: nil, final_dom_state: nil, height: nil, key_metadata: nil, screenshot: nil, screenshot_type: nil, status: nil, width: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebScreenshotResponse} for more details.
      #
      #   @param cache_metadata [ContextDev::Models::WebScreenshotResponse::CacheMetadata] Whether this response came from cache.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param code [Integer] HTTP status code
      #
      #   @param domain [String] The normalized domain that was processed
      #
      #   @param final_dom_state [Symbol, ContextDev::Models::WebScreenshotResponse::FinalDomState] `loaded`, or `still-loading` when capture ended before the page finished loading
      #
      #   @param height [Integer] Height in pixels of the returned screenshot image
      #
      #   @param key_metadata [ContextDev::Models::WebScreenshotResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param screenshot [String] Public image URL for standard requests, or an in-memory data URL when ZDR or non
      #
      #   @param screenshot_type [Symbol, ContextDev::Models::WebScreenshotResponse::ScreenshotType] Type of screenshot that was captured
      #
      #   @param status [String] Always `ok` on success.
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
        #   Whether this response came from cache.
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

      # `loaded`, or `still-loading` when capture ended before the page finished
      # loading.
      #
      # @see ContextDev::Models::WebScreenshotResponse#final_dom_state
      module FinalDomState
        extend ContextDev::Internal::Type::Enum

        LOADED = :loaded
        STILL_LOADING = :"still-loading"

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::WebScreenshotResponse#key_metadata
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
