# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#search
    class WebSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute query
      #   Natural-language search query.
      #
      #   @return [String]
      required :query, String

      # @!attribute exclude_domains
      #   Blocklist — drop results from these domains. Example: ["pinterest.com",
      #   "reddit.com"].
      #
      #   @return [Array<String>, nil]
      optional :exclude_domains, ContextDev::Internal::Type::ArrayOf[String], api_name: :excludeDomains

      # @!attribute freshness
      #   Restrict results to content published within this window.
      #
      #   @return [Symbol, ContextDev::Models::WebSearchParams::Freshness, nil]
      optional :freshness, enum: -> { ContextDev::WebSearchParams::Freshness }

      # @!attribute include_domains
      #   Allowlist — only return results from these domains. Example: ["arxiv.org",
      #   "github.com"].
      #
      #   @return [Array<String>, nil]
      optional :include_domains, ContextDev::Internal::Type::ArrayOf[String], api_name: :includeDomains

      # @!attribute markdown_options
      #   Inline Markdown scraping for each result. Set `enabled: true` to activate.
      #
      #   @return [ContextDev::Models::WebSearchParams::MarkdownOptions, nil]
      optional :markdown_options,
               -> { ContextDev::WebSearchParams::MarkdownOptions },
               api_name: :markdownOptions

      # @!attribute query_fanout
      #   Expand the query into multiple parallel variants for broader recall.
      #
      #   @return [Boolean, nil]
      optional :query_fanout, ContextDev::Internal::Type::Boolean, api_name: :queryFanout

      # @!attribute timeout_ms
      #   Optional timeout in milliseconds for the request. If the request takes longer
      #   than this value, it will be aborted with a 408 status code. Maximum allowed
      #   value is 300000ms (5 minutes).
      #
      #   @return [Integer, nil]
      optional :timeout_ms, Integer, api_name: :timeoutMS

      # @!method initialize(query:, exclude_domains: nil, freshness: nil, include_domains: nil, markdown_options: nil, query_fanout: nil, timeout_ms: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebSearchParams} for more details.
      #
      #   @param query [String] Natural-language search query.
      #
      #   @param exclude_domains [Array<String>] Blocklist — drop results from these domains. Example: ["pinterest.com", "reddit.
      #
      #   @param freshness [Symbol, ContextDev::Models::WebSearchParams::Freshness] Restrict results to content published within this window.
      #
      #   @param include_domains [Array<String>] Allowlist — only return results from these domains. Example: ["arxiv.org", "gith
      #
      #   @param markdown_options [ContextDev::Models::WebSearchParams::MarkdownOptions] Inline Markdown scraping for each result. Set `enabled: true` to activate.
      #
      #   @param query_fanout [Boolean] Expand the query into multiple parallel variants for broader recall.
      #
      #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Restrict results to content published within this window.
      module Freshness
        extend ContextDev::Internal::Type::Enum

        LAST_24_HOURS = :last_24_hours
        LAST_WEEK = :last_week
        LAST_MONTH = :last_month
        LAST_YEAR = :last_year

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class MarkdownOptions < ContextDev::Internal::Type::BaseModel
        # @!attribute enabled
        #   Scrape each result to Markdown. Off by default to keep search cheap and fast.
        #
        #   @return [Boolean, nil]
        optional :enabled, ContextDev::Internal::Type::Boolean

        # @!attribute include_frames
        #   Render iframe contents into the Markdown.
        #
        #   @return [Boolean, nil]
        optional :include_frames, ContextDev::Internal::Type::Boolean, api_name: :includeFrames

        # @!attribute include_images
        #   Emit image references in the Markdown.
        #
        #   @return [Boolean, nil]
        optional :include_images, ContextDev::Internal::Type::Boolean, api_name: :includeImages

        # @!attribute include_links
        #   Keep hyperlinks in the Markdown.
        #
        #   @return [Boolean, nil]
        optional :include_links, ContextDev::Internal::Type::Boolean, api_name: :includeLinks

        # @!attribute max_age_ms
        #   Cache TTL in ms for scraped Markdown keyed by URL + options. Default 1 day, max
        #   30 days. Set to 0 to force a fresh scrape.
        #
        #   @return [Integer, nil]
        optional :max_age_ms, Integer, api_name: :maxAgeMs

        # @!attribute pdf
        #   PDF handling. Use start/end to bound text extraction and OCR to a page range.
        #
        #   @return [ContextDev::Models::WebSearchParams::MarkdownOptions::Pdf, nil]
        optional :pdf, -> { ContextDev::WebSearchParams::MarkdownOptions::Pdf }

        # @!attribute shorten_base64_images
        #   Truncate inline base64 image payloads to keep responses small.
        #
        #   @return [Boolean, nil]
        optional :shorten_base64_images, ContextDev::Internal::Type::Boolean, api_name: :shortenBase64Images

        # @!attribute timeout_ms
        #   Optional timeout in milliseconds for the request. If the request takes longer
        #   than this value, it will be aborted with a 408 status code. Maximum allowed
        #   value is 300000ms (5 minutes).
        #
        #   @return [Integer, nil]
        optional :timeout_ms, Integer, api_name: :timeoutMS

        # @!attribute use_main_content_only
        #   Strip nav, header, footer, and sidebar — keep only the primary article content.
        #
        #   @return [Boolean, nil]
        optional :use_main_content_only, ContextDev::Internal::Type::Boolean, api_name: :useMainContentOnly

        # @!attribute wait_for_ms
        #   Extra wait after page load before rendering, in ms (0–30000). Useful for
        #   JS-heavy pages.
        #
        #   @return [Integer, nil]
        optional :wait_for_ms, Integer, api_name: :waitForMs

        # @!method initialize(enabled: nil, include_frames: nil, include_images: nil, include_links: nil, max_age_ms: nil, pdf: nil, shorten_base64_images: nil, timeout_ms: nil, use_main_content_only: nil, wait_for_ms: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebSearchParams::MarkdownOptions} for more details.
        #
        #   Inline Markdown scraping for each result. Set `enabled: true` to activate.
        #
        #   @param enabled [Boolean] Scrape each result to Markdown. Off by default to keep search cheap and fast.
        #
        #   @param include_frames [Boolean] Render iframe contents into the Markdown.
        #
        #   @param include_images [Boolean] Emit image references in the Markdown.
        #
        #   @param include_links [Boolean] Keep hyperlinks in the Markdown.
        #
        #   @param max_age_ms [Integer] Cache TTL in ms for scraped Markdown keyed by URL + options. Default 1 day, max
        #
        #   @param pdf [ContextDev::Models::WebSearchParams::MarkdownOptions::Pdf] PDF handling. Use start/end to bound text extraction and OCR to a page range.
        #
        #   @param shorten_base64_images [Boolean] Truncate inline base64 image payloads to keep responses small.
        #
        #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
        #
        #   @param use_main_content_only [Boolean] Strip nav, header, footer, and sidebar — keep only the primary article content.
        #
        #   @param wait_for_ms [Integer] Extra wait after page load before rendering, in ms (0–30000). Useful for JS-heav

        # @see ContextDev::Models::WebSearchParams::MarkdownOptions#pdf
        class Pdf < ContextDev::Internal::Type::BaseModel
          # @!attribute end_
          #   Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must
          #   be >= start.
          #
          #   @return [Integer, nil]
          optional :end_, Integer, api_name: :end

          # @!attribute should_parse
          #   Parse PDF URLs. When false, PDF results are skipped with WEBSITE_ACCESS_ERROR.
          #
          #   @return [Boolean, nil]
          optional :should_parse, ContextDev::Internal::Type::Boolean, api_name: :shouldParse

          # @!attribute start
          #   First PDF page to parse (1-based, inclusive). Defaults to page 1.
          #
          #   @return [Integer, nil]
          optional :start, Integer

          # @!method initialize(end_: nil, should_parse: nil, start: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::WebSearchParams::MarkdownOptions::Pdf} for more details.
          #
          #   PDF handling. Use start/end to bound text extraction and OCR to a page range.
          #
          #   @param end_ [Integer] Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must be
          #
          #   @param should_parse [Boolean] Parse PDF URLs. When false, PDF results are skipped with WEBSITE_ACCESS_ERROR.
          #
          #   @param start [Integer] First PDF page to parse (1-based, inclusive). Defaults to page 1.
        end
      end
    end
  end
end
