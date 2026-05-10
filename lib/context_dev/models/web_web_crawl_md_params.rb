# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#web_crawl_md
    class WebWebCrawlMdParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute url
      #   The starting URL for the crawl (must include http:// or https:// protocol)
      #
      #   @return [String]
      required :url, String

      # @!attribute follow_subdomains
      #   When true, follow links on subdomains of the starting URL's domain (e.g.
      #   docs.example.com when starting from example.com). www and apex are always
      #   treated as equivalent.
      #
      #   @return [Boolean, nil]
      optional :follow_subdomains, ContextDev::Internal::Type::Boolean, api_name: :followSubdomains

      # @!attribute include_frames
      #   When true, the contents of iframes are rendered to Markdown for each crawled
      #   page.
      #
      #   @return [Boolean, nil]
      optional :include_frames, ContextDev::Internal::Type::Boolean, api_name: :includeFrames

      # @!attribute include_images
      #   Include image references in the Markdown output
      #
      #   @return [Boolean, nil]
      optional :include_images, ContextDev::Internal::Type::Boolean, api_name: :includeImages

      # @!attribute include_links
      #   Preserve hyperlinks in the Markdown output
      #
      #   @return [Boolean, nil]
      optional :include_links, ContextDev::Internal::Type::Boolean, api_name: :includeLinks

      # @!attribute max_age_ms
      #   Return a cached result if a prior scrape for the same parameters exists and is
      #   younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
      #   omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer, api_name: :maxAgeMs

      # @!attribute max_depth
      #   Maximum link depth from the starting URL (0 = only the starting page)
      #
      #   @return [Integer, nil]
      optional :max_depth, Integer, api_name: :maxDepth

      # @!attribute max_pages
      #   Maximum number of pages to crawl. Hard cap: 500.
      #
      #   @return [Integer, nil]
      optional :max_pages, Integer, api_name: :maxPages

      # @!attribute pdf
      #   PDF parsing controls. Use start/end to limit text extraction and OCR to an
      #   inclusive 1-based page range.
      #
      #   @return [ContextDev::Models::WebWebCrawlMdParams::Pdf, nil]
      optional :pdf, -> { ContextDev::WebWebCrawlMdParams::Pdf }

      # @!attribute shorten_base64_images
      #   Truncate base64-encoded image data in the Markdown output
      #
      #   @return [Boolean, nil]
      optional :shorten_base64_images, ContextDev::Internal::Type::Boolean, api_name: :shortenBase64Images

      # @!attribute stop_after_ms
      #   Soft time budget for the crawl in milliseconds. After each scrape, the crawler
      #   checks the elapsed time and, if exceeded, returns the pages collected so far
      #   instead of continuing. Min: 10000 (10s). Max: 240000 (4 min). Default: 120000 (2
      #   min).
      #
      #   @return [Integer, nil]
      optional :stop_after_ms, Integer, api_name: :stopAfterMs

      # @!attribute timeout_ms
      #   Optional timeout in milliseconds for the request. If the request takes longer
      #   than this value, it will be aborted with a 408 status code. Maximum allowed
      #   value is 300000ms (5 minutes).
      #
      #   @return [Integer, nil]
      optional :timeout_ms, Integer, api_name: :timeoutMS

      # @!attribute url_regex
      #   Regex pattern. Only URLs matching this pattern will be followed and scraped.
      #
      #   @return [String, nil]
      optional :url_regex, String, api_name: :urlRegex

      # @!attribute use_main_content_only
      #   Extract only the main content, stripping headers, footers, sidebars, and
      #   navigation
      #
      #   @return [Boolean, nil]
      optional :use_main_content_only, ContextDev::Internal::Type::Boolean, api_name: :useMainContentOnly

      # @!attribute wait_for_ms
      #   Optional browser wait time in milliseconds after initial page load for each
      #   crawled page. Min: 0. Max: 30000 (30 seconds).
      #
      #   @return [Integer, nil]
      optional :wait_for_ms, Integer, api_name: :waitForMs

      # @!method initialize(url:, follow_subdomains: nil, include_frames: nil, include_images: nil, include_links: nil, max_age_ms: nil, max_depth: nil, max_pages: nil, pdf: nil, shorten_base64_images: nil, stop_after_ms: nil, timeout_ms: nil, url_regex: nil, use_main_content_only: nil, wait_for_ms: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebCrawlMdParams} for more details.
      #
      #   @param url [String] The starting URL for the crawl (must include http:// or https:// protocol)
      #
      #   @param follow_subdomains [Boolean] When true, follow links on subdomains of the starting URL's domain (e.g. docs.ex
      #
      #   @param include_frames [Boolean] When true, the contents of iframes are rendered to Markdown for each crawled pag
      #
      #   @param include_images [Boolean] Include image references in the Markdown output
      #
      #   @param include_links [Boolean] Preserve hyperlinks in the Markdown output
      #
      #   @param max_age_ms [Integer] Return a cached result if a prior scrape for the same parameters exists and is y
      #
      #   @param max_depth [Integer] Maximum link depth from the starting URL (0 = only the starting page)
      #
      #   @param max_pages [Integer] Maximum number of pages to crawl. Hard cap: 500.
      #
      #   @param pdf [ContextDev::Models::WebWebCrawlMdParams::Pdf] PDF parsing controls. Use start/end to limit text extraction and OCR to an inclu
      #
      #   @param shorten_base64_images [Boolean] Truncate base64-encoded image data in the Markdown output
      #
      #   @param stop_after_ms [Integer] Soft time budget for the crawl in milliseconds. After each scrape, the crawler c
      #
      #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      #   @param url_regex [String] Regex pattern. Only URLs matching this pattern will be followed and scraped.
      #
      #   @param use_main_content_only [Boolean] Extract only the main content, stripping headers, footers, sidebars, and navigat
      #
      #   @param wait_for_ms [Integer] Optional browser wait time in milliseconds after initial page load for each craw
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      class Pdf < ContextDev::Internal::Type::BaseModel
        # @!attribute end_
        #   Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
        #   Must be greater than or equal to start when both are provided.
        #
        #   @return [Integer, nil]
        optional :end_, Integer, api_name: :end

        # @!attribute should_parse
        #   When true, PDF pages are fetched and parsed. When false, PDF pages are skipped
        #   entirely (not included in results and not counted as failures).
        #
        #   @return [Boolean, nil]
        optional :should_parse, ContextDev::Internal::Type::Boolean, api_name: :shouldParse

        # @!attribute start
        #   First 1-based PDF page to parse. When omitted, parsing starts at the first page.
        #
        #   @return [Integer, nil]
        optional :start, Integer

        # @!method initialize(end_: nil, should_parse: nil, start: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebCrawlMdParams::Pdf} for more details.
        #
        #   PDF parsing controls. Use start/end to limit text extraction and OCR to an
        #   inclusive 1-based page range.
        #
        #   @param end_ [Integer] Last 1-based PDF page to parse. When omitted, parsing ends at the last page. Mus
        #
        #   @param should_parse [Boolean] When true, PDF pages are fetched and parsed. When false, PDF pages are skipped e
        #
        #   @param start [Integer] First 1-based PDF page to parse. When omitted, parsing starts at the first page.
      end
    end
  end
end
