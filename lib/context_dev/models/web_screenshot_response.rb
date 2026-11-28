# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#screenshot
    class WebScreenshotResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute cache_metadata
      #   Cache status of this response.
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
      #   HTTP status code, repeated in the body.
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute domain
      #   Normalized domain that was captured.
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
      #   Height of the returned image, in pixels.
      #
      #   @return [Integer, nil]
      optional :height, Integer

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::WebScreenshotResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebScreenshotResponse::KeyMetadata }

      # @!attribute screenshot
      #   URL of the screenshot image. A data URL instead when `zdr` is `enabled` or
      #   `headers` are sent.
      #
      #   @return [String, nil]
      optional :screenshot, String

      # @!attribute screenshot_type
      #   Whether the image covers the viewport or the full page.
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
      #   Width of the returned image, in pixels.
      #
      #   @return [Integer, nil]
      optional :width, Integer

      # @!method initialize(cache_metadata:, request_id:, code: nil, domain: nil, final_dom_state: nil, height: nil, key_metadata: nil, screenshot: nil, screenshot_type: nil, status: nil, width: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebScreenshotResponse} for more details.
      #
      #   @param cache_metadata [ContextDev::Models::WebScreenshotResponse::CacheMetadata] Cache status of this response.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param code [Integer] HTTP status code, repeated in the body.
      #
      #   @param domain [String] Normalized domain that was captured.
      #
      #   @param final_dom_state [Symbol, ContextDev::Models::WebScreenshotResponse::FinalDomState] `loaded`, or `still-loading` when capture ended before the page finished loading
      #
      #   @param height [Integer] Height of the returned image, in pixels.
      #
      #   @param key_metadata [ContextDev::Models::WebScreenshotResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param screenshot [String] URL of the screenshot image. A data URL instead when `zdr` is `enabled` or `head
      #
      #   @param screenshot_type [Symbol, ContextDev::Models::WebScreenshotResponse::ScreenshotType] Whether the image covers the viewport or the full page.
      #
      #   @param status [String] Always `ok` on success.
      #
      #   @param width [Integer] Width of the returned image, in pixels.

      # @see ContextDev::Models::WebScreenshotResponse#cache_metadata
      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute age_ms
        #   Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
        #
        #   @return [Integer]
        required :age_ms, Integer

        # @!attribute status
        #   `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
        #   retention bypassed the cache.
        #
        #   @return [Symbol, ContextDev::Models::WebScreenshotResponse::CacheMetadata::Status]
        required :status, enum: -> { ContextDev::Models::WebScreenshotResponse::CacheMetadata::Status }

        # @!method initialize(age_ms:, status:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScreenshotResponse::CacheMetadata} for more details.
        #
        #   Cache status of this response.
        #
        #   @param age_ms [Integer] Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
        #
        #   @param status [Symbol, ContextDev::Models::WebScreenshotResponse::CacheMetadata::Status] `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data re

        # `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
        # retention bypassed the cache.
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

      # Whether the image covers the viewport or the full page.
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
