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

      # @!attribute parse_pdf
      #   When true (default), PDF pages are fetched and their text layer is extracted and
      #   converted to Markdown alongside HTML pages. When false, PDF pages are skipped
      #   entirely (not included in results and not counted as failures).
      #
      #   @return [Boolean, nil]
      optional :parse_pdf, ContextDev::Internal::Type::Boolean, api_name: :parsePDF

      # @!attribute shorten_base64_images
      #   Truncate base64-encoded image data in the Markdown output
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

      # @!method initialize(url:, follow_subdomains: nil, include_frames: nil, include_images: nil, include_links: nil, max_age_ms: nil, max_depth: nil, max_pages: nil, parse_pdf: nil, shorten_base64_images: nil, timeout_ms: nil, url_regex: nil, use_main_content_only: nil, request_options: {})
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
      #   @param parse_pdf [Boolean] When true (default), PDF pages are fetched and their text layer is extracted and
      #
      #   @param shorten_base64_images [Boolean] Truncate base64-encoded image data in the Markdown output
      #
      #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      #   @param url_regex [String] Regex pattern. Only URLs matching this pattern will be followed and scraped.
      #
      #   @param use_main_content_only [Boolean] Extract only the main content, stripping headers, footers, sidebars, and navigat
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
