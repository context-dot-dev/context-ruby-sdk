# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#extract
    class WebExtractParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute schema
      #   JSON Schema for the returned data object. Image fields such as `image_urls` or
      #   `product_photos` automatically make page image references available to
      #   extraction, so product data and photos can be returned in one call. TypeScript
      #   Zod users can pass a JSON Schema generated from a Zod object; Python users can
      #   pass the equivalent JSON Schema object.
      #
      #   @return [Hash{Symbol=>Object}]
      required :schema, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

      # @!attribute url
      #   The starting website URL to crawl and extract from. Must include http:// or
      #   https://.
      #
      #   @return [String]
      required :url, String

      # @!attribute actions
      #   Optional browser actions executed in order on the requested page after it loads
      #   and before extraction. Requires a paid plan. When actions are provided and
      #   stopAfterMs is omitted, the crawl budget defaults to 110000 ms.
      #
      #   @return [Array<ContextDev::Models::WebExtractParams::Action::Wait, ContextDev::Models::WebExtractParams::Action::Perform>, nil]
      optional :actions, -> { ContextDev::Internal::Type::ArrayOf[union: ContextDev::WebExtractParams::Action] }

      # @!attribute fact_check
      #   When true, every returned value must be grounded in facts stated on the page;
      #   fields that cannot be supported by the page are returned as null/empty. When
      #   false (default), the model may make reasonable inferences and derivations from
      #   the page content (e.g. ideal customer, competitor analysis, recommendations)
      #   while keeping verifiable specifics (names, quotes, URLs, dates, metrics)
      #   faithful to the source.
      #
      #   @return [Boolean, nil]
      optional :fact_check, ContextDev::Internal::Type::Boolean, api_name: :factCheck

      # @!attribute follow_subdomains
      #   When true, follow links on subdomains of the starting URL's domain.
      #
      #   @return [Boolean, nil]
      optional :follow_subdomains, ContextDev::Internal::Type::Boolean, api_name: :followSubdomains

      # @!attribute include_frames
      #   When true, iframe contents are included in Markdown before extraction.
      #
      #   @return [Boolean, nil]
      optional :include_frames, ContextDev::Internal::Type::Boolean, api_name: :includeFrames

      # @!attribute instructions
      #   Optional extraction guidance, such as which facts to prioritize or how to
      #   interpret fields in the schema.
      #
      #   @return [String, nil]
      optional :instructions, String

      # @!attribute max_age_ms
      #   Return cached scrape results if a prior scrape for the same parameters is
      #   younger than this many milliseconds. Defaults to 7 days (604800000 ms).
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer, api_name: :maxAgeMs

      # @!attribute max_depth
      #   Optional maximum link depth from the starting URL (0 = only the starting page).
      #   If omitted, there is no crawl depth limit.
      #
      #   @return [Integer, nil]
      optional :max_depth, Integer, api_name: :maxDepth

      # @!attribute max_pages
      #   Maximum number of pages to analyze for extraction. Hard cap: 50. Defaults to 5.
      #
      #   @return [Integer, nil]
      optional :max_pages, Integer, api_name: :maxPages

      # @!attribute pdf
      #
      #   @return [ContextDev::Models::WebExtractParams::Pdf, nil]
      optional :pdf, -> { ContextDev::WebExtractParams::Pdf }

      # @!attribute settle_animations
      #   When true, waits briefly for CSS and transition animations to settle before
      #   extracting each crawled page. Defaults to false. This adds a bit of latency in
      #   exchange for more stable output on animated pages.
      #
      #   @return [Boolean, nil]
      optional :settle_animations, ContextDev::Internal::Type::Boolean, api_name: :settleAnimations

      # @!attribute stop_after_ms
      #   Soft time budget for the crawl in milliseconds. Min: 10000 (10s). Max: 110000
      #   (110s). Defaults to 80000 (80s), or 110000 (110s) when browser actions are
      #   provided.
      #
      #   @return [Integer, nil]
      optional :stop_after_ms, Integer, api_name: :stopAfterMs

      # @!attribute tags
      #   Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_ms
      #   Optional timeout in milliseconds for the request. If the request takes longer
      #   than this value, it will be aborted with a 408 status code. Maximum allowed
      #   value is 300000ms (5 minutes).
      #
      #   @return [Integer, nil]
      optional :timeout_ms, Integer, api_name: :timeoutMS

      # @!attribute wait_for_ms
      #   Optional browser wait time in milliseconds after initial page load for each
      #   crawled page.
      #
      #   @return [Integer, nil]
      optional :wait_for_ms, Integer, api_name: :waitForMs

      # @!method initialize(schema:, url:, actions: nil, fact_check: nil, follow_subdomains: nil, include_frames: nil, instructions: nil, max_age_ms: nil, max_depth: nil, max_pages: nil, pdf: nil, settle_animations: nil, stop_after_ms: nil, tags: nil, timeout_ms: nil, wait_for_ms: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebExtractParams} for more details.
      #
      #   @param schema [Hash{Symbol=>Object}] JSON Schema for the returned data object. Image fields such as `image_urls` or `
      #
      #   @param url [String] The starting website URL to crawl and extract from. Must include http:// or http
      #
      #   @param actions [Array<ContextDev::Models::WebExtractParams::Action::Wait, ContextDev::Models::WebExtractParams::Action::Perform>] Optional browser actions executed in order on the requested page after it loads
      #
      #   @param fact_check [Boolean] When true, every returned value must be grounded in facts stated on the page; fi
      #
      #   @param follow_subdomains [Boolean] When true, follow links on subdomains of the starting URL's domain.
      #
      #   @param include_frames [Boolean] When true, iframe contents are included in Markdown before extraction.
      #
      #   @param instructions [String] Optional extraction guidance, such as which facts to prioritize or how to interp
      #
      #   @param max_age_ms [Integer] Return cached scrape results if a prior scrape for the same parameters is younge
      #
      #   @param max_depth [Integer] Optional maximum link depth from the starting URL (0 = only the starting page).
      #
      #   @param max_pages [Integer] Maximum number of pages to analyze for extraction. Hard cap: 50. Defaults to 5.
      #
      #   @param pdf [ContextDev::Models::WebExtractParams::Pdf]
      #
      #   @param settle_animations [Boolean] When true, waits briefly for CSS and transition animations to settle before extr
      #
      #   @param stop_after_ms [Integer] Soft time budget for the crawl in milliseconds. Min: 10000 (10s). Max: 110000 (1
      #
      #   @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      #   @param wait_for_ms [Integer] Optional browser wait time in milliseconds after initial page load for each craw
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Browser action discriminated by `do`. Each variant exposes only its applicable
      # fields.
      module Action
        extend ContextDev::Internal::Type::Union

        discriminator :do

        # Pause for a fixed number of milliseconds before continuing to the next action.
        variant :wait, -> { ContextDev::WebExtractParams::Action::Wait }

        # Resolve and perform one natural-language browser action.
        variant :perform, -> { ContextDev::WebExtractParams::Action::Perform }

        class Wait < ContextDev::Internal::Type::BaseModel
          # @!attribute do_
          #
          #   @return [Symbol, :wait]
          required :do_, const: :wait, api_name: :do

          # @!attribute time_ms
          #
          #   @return [Integer]
          required :time_ms, Integer, api_name: :timeMs

          # @!method initialize(time_ms:, do_: :wait)
          #   Pause for a fixed number of milliseconds before continuing to the next action.
          #
          #   @param time_ms [Integer]
          #   @param do_ [Symbol, :wait]
        end

        class Perform < ContextDev::Internal::Type::BaseModel
          # @!attribute action
          #
          #   @return [String]
          required :action, String

          # @!attribute do_
          #
          #   @return [Symbol, :perform]
          required :do_, const: :perform, api_name: :do

          # @!method initialize(action:, do_: :perform)
          #   Resolve and perform one natural-language browser action.
          #
          #   @param action [String]
          #   @param do_ [Symbol, :perform]
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::WebExtractParams::Action::Wait, ContextDev::Models::WebExtractParams::Action::Perform)]
      end

      class Pdf < ContextDev::Internal::Type::BaseModel
        # @!attribute end_
        #   Last 1-based PDF page to parse. Must be greater than or equal to start when both
        #   are provided.
        #
        #   @return [Integer, nil]
        optional :end_, Integer, api_name: :end

        # @!attribute should_parse
        #   When true, PDF pages are fetched and parsed. When false, PDF pages are skipped.
        #
        #   @return [Boolean, nil]
        optional :should_parse, ContextDev::Internal::Type::Boolean, api_name: :shouldParse

        # @!attribute start
        #   First 1-based PDF page to parse.
        #
        #   @return [Integer, nil]
        optional :start, Integer

        # @!method initialize(end_: nil, should_parse: nil, start: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebExtractParams::Pdf} for more details.
        #
        #   @param end_ [Integer] Last 1-based PDF page to parse. Must be greater than or equal to start when both
        #
        #   @param should_parse [Boolean] When true, PDF pages are fetched and parsed. When false, PDF pages are skipped.
        #
        #   @param start [Integer] First 1-based PDF page to parse.
      end
    end
  end
end
