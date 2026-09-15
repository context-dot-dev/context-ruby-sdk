# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#web_scrape_html
    class WebWebScrapeHTMLResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute cache_metadata
      #   Cache outcome for this response. Composite responses are hits only when every
      #   cache-controlled fetch contributing to the output was a hit; age_ms is the
      #   oldest contributing hit.
      #
      #   @return [ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata]
      required :cache_metadata, -> { ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata }

      # @!attribute final_dom_state
      #   How complete the returned content is. `loaded` means the page finished the waits
      #   the request asked for. `still-loading` only occurs with
      #   timeoutOpts.behavior=return-partial: the timeoutOpts.milliseconds deadline was
      #   reached first, so the content reflects the DOM at that moment and late-rendering
      #   parts may be missing. Partial results are billed at the base request cost.
      #
      #   @return [Symbol, ContextDev::Models::WebWebScrapeHTMLResponse::FinalDomState]
      required :final_dom_state,
               enum: -> { ContextDev::Models::WebWebScrapeHTMLResponse::FinalDomState },
               api_name: :finalDOMState

      # @!attribute html
      #   The scraped content of the page. For normal pages this is the raw HTML. When the
      #   page is a sitemap or feed served behind an XSL stylesheet (which browsers render
      #   into HTML), this is the underlying XML instead — see the `type` field.
      #
      #   @return [String]
      required :html, String

      # @!attribute metadata
      #   Metadata extracted from the scraped page HTML.
      #
      #   @return [ContextDev::Models::WebWebScrapeHTMLResponse::Metadata]
      required :metadata, -> { ContextDev::Models::WebWebScrapeHTMLResponse::Metadata }

      # @!attribute request_id
      #   Unique id of this API call, also sent in the X-Request-Id response header. Quote
      #   it when contacting support about a failed request.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute success
      #   Indicates success
      #
      #   @return [Boolean, ContextDev::Models::WebWebScrapeHTMLResponse::Success]
      required :success, enum: -> { ContextDev::Models::WebWebScrapeHTMLResponse::Success }

      # @!attribute type
      #   Detected content type of the returned `html` field. Sitemaps and feeds are
      #   surfaced as `xml`; ordinary pages are `html`. Excel workbooks are surfaced as
      #   `xlsx`/`xls` with the extracted sheets as HTML tables; PowerPoint presentations
      #   are surfaced as `pptx`/`ppt` with the extracted slides as HTML.
      #
      #   @return [Symbol, ContextDev::Models::WebWebScrapeHTMLResponse::Type]
      required :type, enum: -> { ContextDev::Models::WebWebScrapeHTMLResponse::Type }

      # @!attribute url
      #   The URL that was scraped
      #
      #   @return [String]
      required :url, String

      # @!attribute actions_applied
      #   One verified outcome per requested browser action, in request order.
      #
      #   @return [Array<ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied>, nil]
      optional :actions_applied,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied] },
               api_name: :actionsApplied

      # @!attribute actions_html_stale
      #   True when an action was applied but the returned content could not be refreshed
      #   afterward.
      #
      #   @return [Boolean, nil]
      optional :actions_html_stale, ContextDev::Internal::Type::Boolean, api_name: :actionsHtmlStale

      # @!attribute key_metadata
      #   Credit usage, included whenever a valid API key is provided.
      #
      #   @return [ContextDev::Models::WebWebScrapeHTMLResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebWebScrapeHTMLResponse::KeyMetadata }

      # @!method initialize(cache_metadata:, final_dom_state:, html:, metadata:, request_id:, success:, type:, url:, actions_applied: nil, actions_html_stale: nil, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebScrapeHTMLResponse} for more details.
      #
      #   @param cache_metadata [ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata] Cache outcome for this response. Composite responses are hits only when every ca
      #
      #   @param final_dom_state [Symbol, ContextDev::Models::WebWebScrapeHTMLResponse::FinalDomState] How complete the returned content is. `loaded` means the page finished the waits
      #
      #   @param html [String] The scraped content of the page. For normal pages this is the raw HTML. When the
      #
      #   @param metadata [ContextDev::Models::WebWebScrapeHTMLResponse::Metadata] Metadata extracted from the scraped page HTML.
      #
      #   @param request_id [String] Unique id of this API call, also sent in the X-Request-Id response header. Quote
      #
      #   @param success [Boolean, ContextDev::Models::WebWebScrapeHTMLResponse::Success] Indicates success
      #
      #   @param type [Symbol, ContextDev::Models::WebWebScrapeHTMLResponse::Type] Detected content type of the returned `html` field. Sitemaps and feeds are surfa
      #
      #   @param url [String] The URL that was scraped
      #
      #   @param actions_applied [Array<ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied>] One verified outcome per requested browser action, in request order.
      #
      #   @param actions_html_stale [Boolean] True when an action was applied but the returned content could not be refreshed
      #
      #   @param key_metadata [ContextDev::Models::WebWebScrapeHTMLResponse::KeyMetadata] Credit usage, included whenever a valid API key is provided.

      # @see ContextDev::Models::WebWebScrapeHTMLResponse#cache_metadata
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
        #   @return [Symbol, ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata::Status]
        required :status, enum: -> { ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata::Status }

        # @!method initialize(age_ms:, status:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata} for more details.
        #
        #   Cache outcome for this response. Composite responses are hits only when every
        #   cache-controlled fetch contributing to the output was a hit; age_ms is the
        #   oldest contributing hit.
        #
        #   @param age_ms [Integer] Age of the cached data in milliseconds. Zero for miss and zdr responses.
        #
        #   @param status [Symbol, ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata::Status] Whether the response was served from cache, required fresh work, or honored zero

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        #
        # @see ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata#status
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
      # @see ContextDev::Models::WebWebScrapeHTMLResponse#final_dom_state
      module FinalDomState
        extend ContextDev::Internal::Type::Enum

        LOADED = :loaded
        STILL_LOADING = :"still-loading"

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::WebWebScrapeHTMLResponse#metadata
      class Metadata < ContextDev::Internal::Type::BaseModel
        # @!attribute final_url
        #   Final URL scraped after redirects or scraper fallback, when known. Falls back to
        #   sourceUrl when unavailable.
        #
        #   @return [String]
        required :final_url, String, api_name: :finalUrl

        # @!attribute source_url
        #   Original URL requested by the caller.
        #
        #   @return [String]
        required :source_url, String, api_name: :sourceUrl

        # @!attribute additional_meta
        #   Additional non-social meta tags not promoted to top-level metadata fields.
        #
        #   @return [Hash{Symbol=>String, Array<String>}, nil]
        optional :additional_meta,
                 -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::AdditionalMeta] },
                 api_name: :additionalMeta

        # @!attribute alternates
        #   Resolved alternate links from link rel=alternate tags.
        #
        #   @return [Array<ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Alternate>, nil]
        optional :alternates,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Alternate] }

        # @!attribute author
        #   Author metadata, when present.
        #
        #   @return [String, nil]
        optional :author, String

        # @!attribute canonical_url
        #   Resolved canonical URL, when present.
        #
        #   @return [String, nil]
        optional :canonical_url, String, api_name: :canonicalUrl

        # @!attribute description
        #   Best description extracted from standard, Open Graph, or Twitter metadata.
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute favicon
        #   Resolved favicon URL, when present.
        #
        #   @return [String, nil]
        optional :favicon, String

        # @!attribute headings
        #   Page headings (h1–h6) in document order, extracted from the unfiltered document.
        #   Capped at the first 500 headings. Omitted when the page has none.
        #
        #   @return [Array<ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Heading>, nil]
        optional :headings,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Heading] }

        # @!attribute image
        #   Primary resolved preview image from Open Graph, Twitter, or image metadata.
        #
        #   @return [String, nil]
        optional :image, String

        # @!attribute json_ld
        #   JSON-LD structured data blocks parsed from the page.
        #
        #   @return [Array<Hash{Symbol=>Object}>, nil]
        optional :json_ld,
                 ContextDev::Internal::Type::ArrayOf[ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]],
                 api_name: :jsonLd

        # @!attribute keywords
        #   Keywords extracted from the page's keywords meta tag.
        #
        #   @return [Array<String>, nil]
        optional :keywords, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute language
        #   Language extracted from html lang or language meta tags.
        #
        #   @return [String, nil]
        optional :language, String

        # @!attribute modified_time
        #   Modified timestamp/date from page metadata, when present.
        #
        #   @return [String, nil]
        optional :modified_time, String, api_name: :modifiedTime

        # @!attribute open_graph
        #   Open Graph metadata with the og: prefix removed and keys camel-cased.
        #
        #   @return [Hash{Symbol=>String, Array<String>}, nil]
        optional :open_graph,
                 -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::OpenGraph] },
                 api_name: :openGraph

        # @!attribute published_time
        #   Published timestamp/date from page metadata, when present.
        #
        #   @return [String, nil]
        optional :published_time, String, api_name: :publishedTime

        # @!attribute robots
        #   Robots meta directive, when present.
        #
        #   @return [String, nil]
        optional :robots, String

        # @!attribute site_name
        #   Site or application name from page metadata.
        #
        #   @return [String, nil]
        optional :site_name, String, api_name: :siteName

        # @!attribute title
        #   Best title extracted from the page.
        #
        #   @return [String, nil]
        optional :title, String

        # @!attribute twitter
        #   Twitter card metadata with the twitter: prefix removed and keys camel-cased.
        #
        #   @return [Hash{Symbol=>String, Array<String>}, nil]
        optional :twitter,
                 -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Twitter] }

        # @!method initialize(final_url:, source_url:, additional_meta: nil, alternates: nil, author: nil, canonical_url: nil, description: nil, favicon: nil, headings: nil, image: nil, json_ld: nil, keywords: nil, language: nil, modified_time: nil, open_graph: nil, published_time: nil, robots: nil, site_name: nil, title: nil, twitter: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebScrapeHTMLResponse::Metadata} for more details.
        #
        #   Metadata extracted from the scraped page HTML.
        #
        #   @param final_url [String] Final URL scraped after redirects or scraper fallback, when known. Falls back to
        #
        #   @param source_url [String] Original URL requested by the caller.
        #
        #   @param additional_meta [Hash{Symbol=>String, Array<String>}] Additional non-social meta tags not promoted to top-level metadata fields.
        #
        #   @param alternates [Array<ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Alternate>] Resolved alternate links from link rel=alternate tags.
        #
        #   @param author [String] Author metadata, when present.
        #
        #   @param canonical_url [String] Resolved canonical URL, when present.
        #
        #   @param description [String] Best description extracted from standard, Open Graph, or Twitter metadata.
        #
        #   @param favicon [String] Resolved favicon URL, when present.
        #
        #   @param headings [Array<ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Heading>] Page headings (h1–h6) in document order, extracted from the unfiltered document.
        #
        #   @param image [String] Primary resolved preview image from Open Graph, Twitter, or image metadata.
        #
        #   @param json_ld [Array<Hash{Symbol=>Object}>] JSON-LD structured data blocks parsed from the page.
        #
        #   @param keywords [Array<String>] Keywords extracted from the page's keywords meta tag.
        #
        #   @param language [String] Language extracted from html lang or language meta tags.
        #
        #   @param modified_time [String] Modified timestamp/date from page metadata, when present.
        #
        #   @param open_graph [Hash{Symbol=>String, Array<String>}] Open Graph metadata with the og: prefix removed and keys camel-cased.
        #
        #   @param published_time [String] Published timestamp/date from page metadata, when present.
        #
        #   @param robots [String] Robots meta directive, when present.
        #
        #   @param site_name [String] Site or application name from page metadata.
        #
        #   @param title [String] Best title extracted from the page.
        #
        #   @param twitter [Hash{Symbol=>String, Array<String>}] Twitter card metadata with the twitter: prefix removed and keys camel-cased.

        module AdditionalMeta
          extend ContextDev::Internal::Type::Union

          variant String

          variant -> { ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::AdditionalMeta::StringArray }

          # @!method self.variants
          #   @return [Array(String, Array<String>)]

          # @type [ContextDev::Internal::Type::Converter]
          StringArray = ContextDev::Internal::Type::ArrayOf[String]
        end

        class Alternate < ContextDev::Internal::Type::BaseModel
          # @!attribute href
          #   Resolved alternate URL.
          #
          #   @return [String]
          required :href, String

          # @!attribute hreflang
          #   Language or locale for the alternate URL, when present.
          #
          #   @return [String, nil]
          optional :hreflang, String

          # @!attribute title
          #   Alternate resource title, when present.
          #
          #   @return [String, nil]
          optional :title, String

          # @!attribute type
          #   Alternate resource MIME type, when present.
          #
          #   @return [String, nil]
          optional :type, String

          # @!method initialize(href:, hreflang: nil, title: nil, type: nil)
          #   @param href [String] Resolved alternate URL.
          #
          #   @param hreflang [String] Language or locale for the alternate URL, when present.
          #
          #   @param title [String] Alternate resource title, when present.
          #
          #   @param type [String] Alternate resource MIME type, when present.
        end

        class Heading < ContextDev::Internal::Type::BaseModel
          # @!attribute level
          #   Heading level, 1–6 (from h1–h6).
          #
          #   @return [Integer]
          required :level, Integer

          # @!attribute text
          #   Heading text with whitespace collapsed, truncated to 1000 characters.
          #
          #   @return [String]
          required :text, String

          # @!method initialize(level:, text:)
          #   @param level [Integer] Heading level, 1–6 (from h1–h6).
          #
          #   @param text [String] Heading text with whitespace collapsed, truncated to 1000 characters.
        end

        module OpenGraph
          extend ContextDev::Internal::Type::Union

          variant String

          variant -> { ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::OpenGraph::StringArray }

          # @!method self.variants
          #   @return [Array(String, Array<String>)]

          # @type [ContextDev::Internal::Type::Converter]
          StringArray = ContextDev::Internal::Type::ArrayOf[String]
        end

        module Twitter
          extend ContextDev::Internal::Type::Union

          variant String

          variant -> { ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Twitter::StringArray }

          # @!method self.variants
          #   @return [Array(String, Array<String>)]

          # @type [ContextDev::Internal::Type::Converter]
          StringArray = ContextDev::Internal::Type::ArrayOf[String]
        end
      end

      # Indicates success
      #
      # @see ContextDev::Models::WebWebScrapeHTMLResponse#success
      module Success
        extend ContextDev::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # Detected content type of the returned `html` field. Sitemaps and feeds are
      # surfaced as `xml`; ordinary pages are `html`. Excel workbooks are surfaced as
      # `xlsx`/`xls` with the extracted sheets as HTML tables; PowerPoint presentations
      # are surfaced as `pptx`/`ppt` with the extracted slides as HTML.
      #
      # @see ContextDev::Models::WebWebScrapeHTMLResponse#type
      module Type
        extend ContextDev::Internal::Type::Enum

        HTML = :html
        XML = :xml
        JSON = :json
        TEXT = :text
        CSV = :csv
        MARKDOWN = :markdown
        SVG = :svg
        PDF = :pdf
        DOCX = :docx
        DOC = :doc
        XLSX = :xlsx
        XLS = :xls
        PPTX = :pptx
        PPT = :ppt

        # @!method self.values
        #   @return [Array<Symbol>]
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
        #   @return [Symbol, ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied::Status]
        required :status, enum: -> { ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied::Status }

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
        #   {ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied} for more details.
        #
        #   @param instruction [String]
        #
        #   @param status [Symbol, ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied::Status] Applied means the requested page state was visibly verified. Failed means it was
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
        # @see ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied#status
        module Status
          extend ContextDev::Internal::Type::Enum

          APPLIED = :applied
          FAILED = :failed
          SKIPPED = :skipped

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::WebWebScrapeHTMLResponse#key_metadata
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
