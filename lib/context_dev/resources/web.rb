# frozen_string_literal: true

module ContextDev
  module Resources
    class Web
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebExtractFontsParams} for more details.
      #
      # Scrape font information from a website including font families, usage
      # statistics, fallbacks, and element/word counts.
      #
      # @overload extract_fonts(direct_url: nil, domain: nil, timeout_ms: nil, request_options: {})
      #
      # @param direct_url [String] A specific URL to fetch fonts from directly, bypassing domain resolution (e.g.,
      #
      # @param domain [String] Domain name to extract fonts from (e.g., 'example.com', 'google.com'). The domai
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::WebExtractFontsResponse]
      #
      # @see ContextDev::Models::WebExtractFontsParams
      def extract_fonts(params = {})
        parsed, options = ContextDev::WebExtractFontsParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "web/fonts",
          query: query.transform_keys(direct_url: "directUrl", timeout_ms: "timeoutMS"),
          model: ContextDev::Models::WebExtractFontsResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebExtractStyleguideParams} for more details.
      #
      # Extract a comprehensive design system from a website including colors,
      # typography, spacing, shadows, and UI components.
      #
      # @overload extract_styleguide(direct_url: nil, domain: nil, timeout_ms: nil, request_options: {})
      #
      # @param direct_url [String] A specific URL to fetch the styleguide from directly, bypassing domain resolutio
      #
      # @param domain [String] Domain name to extract styleguide from (e.g., 'example.com', 'google.com'). The
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::WebExtractStyleguideResponse]
      #
      # @see ContextDev::Models::WebExtractStyleguideParams
      def extract_styleguide(params = {})
        parsed, options = ContextDev::WebExtractStyleguideParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "web/styleguide",
          query: query.transform_keys(direct_url: "directUrl", timeout_ms: "timeoutMS"),
          model: ContextDev::Models::WebExtractStyleguideResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebScreenshotParams} for more details.
      #
      # Capture a screenshot of a website.
      #
      # @overload screenshot(direct_url: nil, domain: nil, full_screenshot: nil, max_age_ms: nil, page: nil, timeout_ms: nil, viewport: nil, wait_for_ms: nil, request_options: {})
      #
      # @param direct_url [String] A specific URL to screenshot directly, bypassing domain resolution (e.g., 'https
      #
      # @param domain [String] Domain name to take screenshot of (e.g., 'example.com', 'google.com'). The domai
      #
      # @param full_screenshot [Symbol, ContextDev::Models::WebScreenshotParams::FullScreenshot] Optional parameter to determine screenshot type. If 'true', takes a full page sc
      #
      # @param max_age_ms [Integer] Return a cached screenshot if a prior screenshot for the same parameters exists
      #
      # @param page [Symbol, ContextDev::Models::WebScreenshotParams::Page] Optional parameter to specify which page type to screenshot. If provided, the sy
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param viewport [ContextDev::Models::WebScreenshotParams::Viewport] Optional browser viewport dimensions for the screenshot. Defaults to 1920x1080.
      #
      # @param wait_for_ms [Integer] Optional browser wait time in milliseconds after initial page load before taking
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::WebScreenshotResponse]
      #
      # @see ContextDev::Models::WebScreenshotParams
      def screenshot(params = {})
        parsed, options = ContextDev::WebScreenshotParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "web/screenshot",
          query: query.transform_keys(
            direct_url: "directUrl",
            full_screenshot: "fullScreenshot",
            max_age_ms: "maxAgeMs",
            timeout_ms: "timeoutMS",
            wait_for_ms: "waitForMs"
          ),
          model: ContextDev::Models::WebScreenshotResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebWebCrawlMdParams} for more details.
      #
      # Performs a crawl starting from a given URL, extracts page content as Markdown,
      # and returns results for all crawled pages.
      #
      # @overload web_crawl_md(url:, follow_subdomains: nil, include_frames: nil, include_images: nil, include_links: nil, max_age_ms: nil, max_depth: nil, max_pages: nil, pdf: nil, shorten_base64_images: nil, timeout_ms: nil, url_regex: nil, use_main_content_only: nil, wait_for_ms: nil, request_options: {})
      #
      # @param url [String] The starting URL for the crawl (must include http:// or https:// protocol)
      #
      # @param follow_subdomains [Boolean] When true, follow links on subdomains of the starting URL's domain (e.g. docs.ex
      #
      # @param include_frames [Boolean] When true, the contents of iframes are rendered to Markdown for each crawled pag
      #
      # @param include_images [Boolean] Include image references in the Markdown output
      #
      # @param include_links [Boolean] Preserve hyperlinks in the Markdown output
      #
      # @param max_age_ms [Integer] Return a cached result if a prior scrape for the same parameters exists and is y
      #
      # @param max_depth [Integer] Maximum link depth from the starting URL (0 = only the starting page)
      #
      # @param max_pages [Integer] Maximum number of pages to crawl. Hard cap: 500.
      #
      # @param pdf [ContextDev::Models::WebWebCrawlMdParams::Pdf] PDF parsing controls. Use start/end to limit text extraction and OCR to an inclu
      #
      # @param shorten_base64_images [Boolean] Truncate base64-encoded image data in the Markdown output
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param url_regex [String] Regex pattern. Only URLs matching this pattern will be followed and scraped.
      #
      # @param use_main_content_only [Boolean] Extract only the main content, stripping headers, footers, sidebars, and navigat
      #
      # @param wait_for_ms [Integer] Optional browser wait time in milliseconds after initial page load for each craw
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::WebWebCrawlMdResponse]
      #
      # @see ContextDev::Models::WebWebCrawlMdParams
      def web_crawl_md(params)
        parsed, options = ContextDev::WebWebCrawlMdParams.dump_request(params)
        @client.request(
          method: :post,
          path: "web/crawl",
          body: parsed,
          model: ContextDev::Models::WebWebCrawlMdResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebWebScrapeHTMLParams} for more details.
      #
      # Scrapes the given URL and returns the raw HTML content of the page.
      #
      # @overload web_scrape_html(url:, include_frames: nil, max_age_ms: nil, pdf: nil, timeout_ms: nil, wait_for_ms: nil, request_options: {})
      #
      # @param url [String] Full URL to scrape (must include http:// or https:// protocol)
      #
      # @param include_frames [Boolean] When true, iframes are rendered inline into the returned HTML.
      #
      # @param max_age_ms [Integer] Return a cached result if a prior scrape for the same parameters exists and is y
      #
      # @param pdf [ContextDev::Models::WebWebScrapeHTMLParams::Pdf] PDF parsing controls. Use start/end to limit text extraction and OCR to an inclu
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param wait_for_ms [Integer] Optional browser wait time in milliseconds after initial page load. Min: 0. Max:
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::WebWebScrapeHTMLResponse]
      #
      # @see ContextDev::Models::WebWebScrapeHTMLParams
      def web_scrape_html(params)
        parsed, options = ContextDev::WebWebScrapeHTMLParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "web/scrape/html",
          query: query.transform_keys(
            include_frames: "includeFrames",
            max_age_ms: "maxAgeMs",
            timeout_ms: "timeoutMS",
            wait_for_ms: "waitForMs"
          ),
          model: ContextDev::Models::WebWebScrapeHTMLResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebWebScrapeImagesParams} for more details.
      #
      # Extract image assets from a web page, including standard URLs, inline SVGs, data
      # URIs, responsive image sources, metadata, CSS backgrounds, video posters, and
      # embeds. The base request costs 1 credit; enrichment costs 1 credit per returned
      # image.
      #
      # @overload web_scrape_images(url:, enrichment: nil, max_age_ms: nil, timeout_ms: nil, wait_for_ms: nil, request_options: {})
      #
      # @param url [String] Page URL to inspect. Must include http:// or https://.
      #
      # @param enrichment [ContextDev::Models::WebWebScrapeImagesParams::Enrichment] Optional per-image processing, sent as deep-object query params such as enrichme
      #
      # @param max_age_ms [Integer] Reuse a cached result this many milliseconds old or newer. Default: 86400000 (1
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param wait_for_ms [Integer] Optional browser wait time in milliseconds after initial page load before collec
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::WebWebScrapeImagesResponse]
      #
      # @see ContextDev::Models::WebWebScrapeImagesParams
      def web_scrape_images(params)
        parsed, options = ContextDev::WebWebScrapeImagesParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "web/scrape/images",
          query: query.transform_keys(
            max_age_ms: "maxAgeMs",
            timeout_ms: "timeoutMS",
            wait_for_ms: "waitForMs"
          ),
          model: ContextDev::Models::WebWebScrapeImagesResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebWebScrapeMdParams} for more details.
      #
      # Scrapes the given URL into LLM usable Markdown.
      #
      # @overload web_scrape_md(url:, include_frames: nil, include_images: nil, include_links: nil, max_age_ms: nil, pdf: nil, shorten_base64_images: nil, timeout_ms: nil, use_main_content_only: nil, wait_for_ms: nil, request_options: {})
      #
      # @param url [String] Full URL to scrape into LLM usable Markdown (must include http:// or https:// pr
      #
      # @param include_frames [Boolean] When true, the contents of iframes are rendered to Markdown.
      #
      # @param include_images [Boolean] Include image references in Markdown output
      #
      # @param include_links [Boolean] Preserve hyperlinks in Markdown output
      #
      # @param max_age_ms [Integer] Return a cached result if a prior scrape for the same parameters exists and is y
      #
      # @param pdf [ContextDev::Models::WebWebScrapeMdParams::Pdf] PDF parsing controls. Use start/end to limit text extraction and OCR to an inclu
      #
      # @param shorten_base64_images [Boolean] Shorten base64-encoded image data in the Markdown output
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param use_main_content_only [Boolean] Extract only the main content of the page, excluding headers, footers, sidebars,
      #
      # @param wait_for_ms [Integer] Optional browser wait time in milliseconds after initial page load before conver
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::WebWebScrapeMdResponse]
      #
      # @see ContextDev::Models::WebWebScrapeMdParams
      def web_scrape_md(params)
        parsed, options = ContextDev::WebWebScrapeMdParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "web/scrape/markdown",
          query: query.transform_keys(
            include_frames: "includeFrames",
            include_images: "includeImages",
            include_links: "includeLinks",
            max_age_ms: "maxAgeMs",
            shorten_base64_images: "shortenBase64Images",
            timeout_ms: "timeoutMS",
            use_main_content_only: "useMainContentOnly",
            wait_for_ms: "waitForMs"
          ),
          model: ContextDev::Models::WebWebScrapeMdResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebWebScrapeSitemapParams} for more details.
      #
      # Crawl an entire website's sitemap and return all discovered page URLs.
      #
      # @overload web_scrape_sitemap(domain:, max_links: nil, timeout_ms: nil, url_regex: nil, request_options: {})
      #
      # @param domain [String] Domain to build a sitemap for
      #
      # @param max_links [Integer] Maximum number of links to return from the sitemap crawl. Defaults to 10,000. Mi
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param url_regex [String] Optional RE2-compatible regex pattern. Only URLs matching this pattern are retur
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::WebWebScrapeSitemapResponse]
      #
      # @see ContextDev::Models::WebWebScrapeSitemapParams
      def web_scrape_sitemap(params)
        parsed, options = ContextDev::WebWebScrapeSitemapParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "web/scrape/sitemap",
          query: query.transform_keys(max_links: "maxLinks", timeout_ms: "timeoutMS", url_regex: "urlRegex"),
          model: ContextDev::Models::WebWebScrapeSitemapResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [ContextDev::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
