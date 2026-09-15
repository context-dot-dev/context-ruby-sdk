# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#web_scrape_images
    class WebWebScrapeImagesResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute cache_metadata
      #   Cache outcome for this response. Composite responses are hits only when every
      #   cache-controlled fetch contributing to the output was a hit; age_ms is the
      #   oldest contributing hit.
      #
      #   @return [ContextDev::Models::WebWebScrapeImagesResponse::CacheMetadata]
      required :cache_metadata, -> { ContextDev::Models::WebWebScrapeImagesResponse::CacheMetadata }

      # @!attribute images
      #   Images found on the page.
      #
      #   @return [Array<ContextDev::Models::WebWebScrapeImagesResponse::Image>]
      required :images,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebWebScrapeImagesResponse::Image] }

      # @!attribute request_id
      #   Unique id of this API call, also sent in the X-Request-Id response header. Quote
      #   it when contacting support about a failed request.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute success
      #   Always true on success.
      #
      #   @return [Boolean, ContextDev::Models::WebWebScrapeImagesResponse::Success]
      required :success, enum: -> { ContextDev::Models::WebWebScrapeImagesResponse::Success }

      # @!attribute url
      #   Page URL that was scraped.
      #
      #   @return [String]
      required :url, String

      # @!attribute actions_applied
      #   One verified outcome per requested browser action, in request order.
      #
      #   @return [Array<ContextDev::Models::WebWebScrapeImagesResponse::ActionsApplied>, nil]
      optional :actions_applied,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebWebScrapeImagesResponse::ActionsApplied] },
               api_name: :actionsApplied

      # @!attribute final_dom_state
      #   How complete the returned content is. `loaded` means the page finished the waits
      #   the request asked for. `still-loading` only occurs with
      #   timeoutOpts.behavior=return-partial: the timeoutOpts.milliseconds deadline was
      #   reached first, so the content reflects the DOM at that moment and late-rendering
      #   parts may be missing. Partial results are billed at the base request cost.
      #
      #   @return [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::FinalDomState, nil]
      optional :final_dom_state,
               enum: -> { ContextDev::Models::WebWebScrapeImagesResponse::FinalDomState },
               api_name: :finalDOMState

      # @!attribute key_metadata
      #   Credit usage, included whenever a valid API key is provided.
      #
      #   @return [ContextDev::Models::WebWebScrapeImagesResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebWebScrapeImagesResponse::KeyMetadata }

      # @!attribute partial
      #   True when the deadline interrupted rendering or image enrichment. Partial
      #   results are billed at the base request cost, without enrichment or actions
      #   surcharges.
      #
      #   @return [Boolean, nil]
      optional :partial, ContextDev::Internal::Type::Boolean

      # @!method initialize(cache_metadata:, images:, request_id:, success:, url:, actions_applied: nil, final_dom_state: nil, key_metadata: nil, partial: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebScrapeImagesResponse} for more details.
      #
      #   @param cache_metadata [ContextDev::Models::WebWebScrapeImagesResponse::CacheMetadata] Cache outcome for this response. Composite responses are hits only when every ca
      #
      #   @param images [Array<ContextDev::Models::WebWebScrapeImagesResponse::Image>] Images found on the page.
      #
      #   @param request_id [String] Unique id of this API call, also sent in the X-Request-Id response header. Quote
      #
      #   @param success [Boolean, ContextDev::Models::WebWebScrapeImagesResponse::Success] Always true on success.
      #
      #   @param url [String] Page URL that was scraped.
      #
      #   @param actions_applied [Array<ContextDev::Models::WebWebScrapeImagesResponse::ActionsApplied>] One verified outcome per requested browser action, in request order.
      #
      #   @param final_dom_state [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::FinalDomState] How complete the returned content is. `loaded` means the page finished the waits
      #
      #   @param key_metadata [ContextDev::Models::WebWebScrapeImagesResponse::KeyMetadata] Credit usage, included whenever a valid API key is provided.
      #
      #   @param partial [Boolean] True when the deadline interrupted rendering or image enrichment. Partial result

      # @see ContextDev::Models::WebWebScrapeImagesResponse#cache_metadata
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
        #   @return [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::CacheMetadata::Status]
        required :status, enum: -> { ContextDev::Models::WebWebScrapeImagesResponse::CacheMetadata::Status }

        # @!method initialize(age_ms:, status:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebScrapeImagesResponse::CacheMetadata} for more
        #   details.
        #
        #   Cache outcome for this response. Composite responses are hits only when every
        #   cache-controlled fetch contributing to the output was a hit; age_ms is the
        #   oldest contributing hit.
        #
        #   @param age_ms [Integer] Age of the cached data in milliseconds. Zero for miss and zdr responses.
        #
        #   @param status [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::CacheMetadata::Status] Whether the response was served from cache, required fresh work, or honored zero

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        #
        # @see ContextDev::Models::WebWebScrapeImagesResponse::CacheMetadata#status
        module Status
          extend ContextDev::Internal::Type::Enum

          HIT = :hit
          MISS = :miss
          ZDR = :zdr

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Image < ContextDev::Internal::Type::BaseModel
        # @!attribute alt
        #   Image alt text, or null when unavailable.
        #
        #   @return [String, nil]
        required :alt, String, nil?: true

        # @!attribute element
        #   Where the image was found.
        #
        #   @return [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::Image::Element]
        required :element, enum: -> { ContextDev::Models::WebWebScrapeImagesResponse::Image::Element }

        # @!attribute src
        #   Original image value: URL, inline SVG or HTML, or base64 data URI.
        #
        #   @return [String]
        required :src, String

        # @!attribute type
        #   Format of src.
        #
        #   @return [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::Image::Type]
        required :type, enum: -> { ContextDev::Models::WebWebScrapeImagesResponse::Image::Type }

        # @!attribute enrichment
        #   Requested metadata for images that could be processed.
        #
        #   @return [ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment, nil]
        optional :enrichment, -> { ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment }

        # @!method initialize(alt:, element:, src:, type:, enrichment: nil)
        #   @param alt [String, nil] Image alt text, or null when unavailable.
        #
        #   @param element [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::Image::Element] Where the image was found.
        #
        #   @param src [String] Original image value: URL, inline SVG or HTML, or base64 data URI.
        #
        #   @param type [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::Image::Type] Format of src.
        #
        #   @param enrichment [ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment] Requested metadata for images that could be processed.

        # Where the image was found.
        #
        # @see ContextDev::Models::WebWebScrapeImagesResponse::Image#element
        module Element
          extend ContextDev::Internal::Type::Enum

          IMG = :img
          SVG = :svg
          LINK = :link
          SOURCE = :source
          VIDEO = :video
          CSS = :css
          OBJECT = :object
          META = :meta
          BACKGROUND = :background

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Format of src.
        #
        # @see ContextDev::Models::WebWebScrapeImagesResponse::Image#type
        module Type
          extend ContextDev::Internal::Type::Enum

          URL = :url
          HTML = :html
          BASE64 = :base64

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::WebWebScrapeImagesResponse::Image#enrichment
        class Enrichment < ContextDev::Internal::Type::BaseModel
          # @!attribute height
          #   Image height in pixels, when measured.
          #
          #   @return [Integer, nil]
          optional :height, Integer

          # @!attribute mimetype
          #   Detected MIME type, when hosted.
          #
          #   @return [String, nil]
          optional :mimetype, String

          # @!attribute type
          #   Visual asset category, when classified.
          #
          #   @return [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type, nil]
          optional :type, enum: -> { ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type }

          # @!attribute url
          #   Brand.dev CDN URL, when hosted.
          #
          #   @return [String, nil]
          optional :url, String

          # @!attribute width
          #   Image width in pixels, when measured.
          #
          #   @return [Integer, nil]
          optional :width, Integer

          # @!method initialize(height: nil, mimetype: nil, type: nil, url: nil, width: nil)
          #   Requested metadata for images that could be processed.
          #
          #   @param height [Integer] Image height in pixels, when measured.
          #
          #   @param mimetype [String] Detected MIME type, when hosted.
          #
          #   @param type [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type] Visual asset category, when classified.
          #
          #   @param url [String] Brand.dev CDN URL, when hosted.
          #
          #   @param width [Integer] Image width in pixels, when measured.

          # Visual asset category, when classified.
          #
          # @see ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment#type
          module Type
            extend ContextDev::Internal::Type::Enum

            PHOTOGRAPHY = :photography
            ILLUSTRATION = :illustration
            LOGO = :logo
            WORDMARK = :wordmark
            ICON = :icon
            PATTERN = :pattern
            GRAPHIC = :graphic
            OTHER = :other

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # Always true on success.
      #
      # @see ContextDev::Models::WebWebScrapeImagesResponse#success
      module Success
        extend ContextDev::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      class ActionsApplied < ContextDev::Internal::Type::BaseModel
        # @!attribute instruction
        #
        #   @return [String]
        required :instruction, String

        # @!attribute status
        #   Applied means the requested page state was visibly verified. Failed means it was
        #   not verified. Skipped means it was not attempted.
        #
        #   @return [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::ActionsApplied::Status]
        required :status, enum: -> { ContextDev::Models::WebWebScrapeImagesResponse::ActionsApplied::Status }

        # @!attribute completion_evidence
        #   Visible page evidence used to verify an applied action.
        #
        #   @return [String, nil]
        optional :completion_evidence, String, api_name: :completionEvidence

        # @!attribute duration_ms
        #
        #   @return [Float, nil]
        optional :duration_ms, Float, api_name: :durationMs

        # @!attribute error
        #
        #   @return [String, nil]
        optional :error, String

        # @!attribute method_
        #
        #   @return [String, nil]
        optional :method_, String, api_name: :method

        # @!attribute target_description
        #
        #   @return [String, nil]
        optional :target_description, String, api_name: :targetDescription

        # @!method initialize(instruction:, status:, completion_evidence: nil, duration_ms: nil, error: nil, method_: nil, target_description: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebScrapeImagesResponse::ActionsApplied} for more
        #   details.
        #
        #   @param instruction [String]
        #
        #   @param status [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::ActionsApplied::Status] Applied means the requested page state was visibly verified. Failed means it was
        #
        #   @param completion_evidence [String] Visible page evidence used to verify an applied action.
        #
        #   @param duration_ms [Float]
        #
        #   @param error [String]
        #
        #   @param method_ [String]
        #
        #   @param target_description [String]

        # Applied means the requested page state was visibly verified. Failed means it was
        # not verified. Skipped means it was not attempted.
        #
        # @see ContextDev::Models::WebWebScrapeImagesResponse::ActionsApplied#status
        module Status
          extend ContextDev::Internal::Type::Enum

          APPLIED = :applied
          FAILED = :failed
          SKIPPED = :skipped

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
      # @see ContextDev::Models::WebWebScrapeImagesResponse#final_dom_state
      module FinalDomState
        extend ContextDev::Internal::Type::Enum

        LOADED = :loaded
        STILL_LOADING = :"still-loading"

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::WebWebScrapeImagesResponse#key_metadata
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
