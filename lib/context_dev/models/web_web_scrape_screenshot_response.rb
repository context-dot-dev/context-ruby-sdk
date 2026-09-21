# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#web_scrape_screenshot
    class WebWebScrapeScreenshotResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute cache_metadata
      #   Cache outcome for this response. Composite responses are hits only when every
      #   cache-controlled fetch contributing to the output was a hit; age_ms is the
      #   oldest contributing hit.
      #
      #   @return [ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata]
      required :cache_metadata, -> { ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata }

      # @!attribute height
      #   Height of the returned image in pixels.
      #
      #   @return [Integer]
      required :height, Integer

      # @!attribute request_id
      #   Unique id of this API call, also sent in the X-Request-Id response header. Quote
      #   it when contacting support about a failed request.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute screenshot
      #   Public image URL for standard requests, or an in-memory data URL when ZDR or
      #   non-empty custom headers are supplied.
      #
      #   @return [String]
      required :screenshot, String

      # @!attribute url
      #   The requested page URL.
      #
      #   @return [String]
      required :url, String

      # @!attribute width
      #   Width of the returned image in pixels.
      #
      #   @return [Integer]
      required :width, Integer

      # @!attribute final_dom_state
      #   How complete the returned content is. `loaded` means the page finished the waits
      #   the request asked for. `still-loading` only occurs with
      #   timeoutOpts.behavior=return-partial: the timeoutOpts.milliseconds deadline was
      #   reached first, so the content reflects the DOM at that moment and late-rendering
      #   parts may be missing. Partial results are billed at the base request cost.
      #
      #   @return [Symbol, ContextDev::Models::WebWebScrapeScreenshotResponse::FinalDomState, nil]
      optional :final_dom_state,
               enum: -> { ContextDev::Models::WebWebScrapeScreenshotResponse::FinalDomState },
               api_name: :finalDOMState

      # @!attribute key_metadata
      #   Credit usage, included whenever a valid API key is provided.
      #
      #   @return [ContextDev::Models::WebWebScrapeScreenshotResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebWebScrapeScreenshotResponse::KeyMetadata }

      # @!method initialize(cache_metadata:, height:, request_id:, screenshot:, url:, width:, final_dom_state: nil, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebScrapeScreenshotResponse} for more details.
      #
      #   @param cache_metadata [ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata] Cache outcome for this response. Composite responses are hits only when every ca
      #
      #   @param height [Integer] Height of the returned image in pixels.
      #
      #   @param request_id [String] Unique id of this API call, also sent in the X-Request-Id response header. Quote
      #
      #   @param screenshot [String] Public image URL for standard requests, or an in-memory data URL when ZDR or non
      #
      #   @param url [String] The requested page URL.
      #
      #   @param width [Integer] Width of the returned image in pixels.
      #
      #   @param final_dom_state [Symbol, ContextDev::Models::WebWebScrapeScreenshotResponse::FinalDomState] How complete the returned content is. `loaded` means the page finished the waits
      #
      #   @param key_metadata [ContextDev::Models::WebWebScrapeScreenshotResponse::KeyMetadata] Credit usage, included whenever a valid API key is provided.

      # @see ContextDev::Models::WebWebScrapeScreenshotResponse#cache_metadata
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
        #   @return [Symbol, ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata::Status]
        required :status, enum: -> { ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata::Status }

        # @!method initialize(age_ms:, status:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata} for more
        #   details.
        #
        #   Cache outcome for this response. Composite responses are hits only when every
        #   cache-controlled fetch contributing to the output was a hit; age_ms is the
        #   oldest contributing hit.
        #
        #   @param age_ms [Integer] Age of the cached data in milliseconds. Zero for miss and zdr responses.
        #
        #   @param status [Symbol, ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata::Status] Whether the response was served from cache, required fresh work, or honored zero

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        #
        # @see ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata#status
        module Status
          extend ContextDev::Internal::Type::Enum

          HIT = :hit
          MISS = :miss
          ZDR = :zdr

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # How complete the returned content is. `loaded` means the page finished the waits
      # the request asked for. `still-loading` only occurs with
      # timeoutOpts.behavior=return-partial: the timeoutOpts.milliseconds deadline was
      # reached first, so the content reflects the DOM at that moment and late-rendering
      # parts may be missing. Partial results are billed at the base request cost.
      #
      # @see ContextDev::Models::WebWebScrapeScreenshotResponse#final_dom_state
      module FinalDomState
        extend ContextDev::Internal::Type::Enum

        LOADED = :loaded
        STILL_LOADING = :"still-loading"

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::WebWebScrapeScreenshotResponse#key_metadata
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
