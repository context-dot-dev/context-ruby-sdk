# frozen_string_literal: true

module ContextDev
  module Resources
    class Web
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebAnswersParams} for more details.
      #
      # Research the web and return a sourced answer in your JSON shape. Choose `fast`
      # for a short task or `ultra` for deeper research.
      #
      # @overload answers(task:, json_format: nil, mode: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #
      # @param task [String] Research task. The agent selects company/profile lookups, web searches, or page
      #
      # @param json_format [Hash{Symbol=>Object}] Example answer object, not JSON Schema. Up to 8 levels, 500 values, and 16000 ch
      #
      # @param mode [Symbol, ContextDev::Models::WebAnswersParams::Mode] `fast` prioritizes speed, with extra verification for people and companies; `ult
      #
      # @param tags [Array<String>] Labels for filtering usage in the dashboard.
      #
      # @param timeout_opts [ContextDev::Models::WebAnswersParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      # @param zdr [Symbol, ContextDev::Models::WebAnswersParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::WebAnswersResponse]
      #
      # @see ContextDev::Models::WebAnswersParams
      def answers(params)
        parsed, options = ContextDev::WebAnswersParams.dump_request(params)
        @client.request(
          method: :post,
          path: "web/answers",
          body: parsed,
          model: ContextDev::Models::WebAnswersResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebExtractCompetitorsParams} for more details.
      #
      # Analyze a company's landing page and web search evidence to return direct
      # competitors for the same product or market.
      #
      # @overload extract_competitors(domain:, num_competitors: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #
      # @param domain [String] Company domain to analyze, such as `stripe.com`. Full http(s) URLs are accepted
      #
      # @param num_competitors [Integer] Exact number of direct competitors to return. Defaults to 5.
      #
      # @param tags [Array<String>] Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      #
      # @param timeout_opts [ContextDev::Models::WebExtractCompetitorsParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      # @param zdr [Symbol, ContextDev::Models::WebExtractCompetitorsParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::WebExtractCompetitorsResponse]
      #
      # @see ContextDev::Models::WebExtractCompetitorsParams
      def extract_competitors(params)
        parsed, options = ContextDev::WebExtractCompetitorsParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "web/competitors",
          query: query.transform_keys(num_competitors: "numCompetitors", timeout_opts: "timeoutOpts"),
          model: ContextDev::Models::WebExtractCompetitorsResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebExtractStyleguideParams} for more details.
      #
      # Extract colors, typography, spacing, and component styles from a website.
      #
      # @overload extract_styleguide(color_scheme: nil, direct_url: nil, domain: nil, max_age_ms: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #
      # @param color_scheme [Symbol, ContextDev::Models::WebExtractStyleguideParams::ColorScheme] Optional browser color scheme to emulate for websites that respond to prefers-co
      #
      # @param direct_url [String] Exact URL to inspect. Provide either `domain` or `directUrl`, not both.
      #
      # @param domain [String] Domain name to extract styleguide from (e.g., 'example.com', 'google.com'). The
      #
      # @param max_age_ms [Integer, nil] Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1 yea
      #
      # @param tags [Array<String>] Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      #
      # @param timeout_opts [ContextDev::Models::WebExtractStyleguideParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      # @param zdr [Symbol, ContextDev::Models::WebExtractStyleguideParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
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
          query: query.transform_keys(
            color_scheme: "colorScheme",
            direct_url: "directUrl",
            max_age_ms: "maxAgeMs",
            timeout_opts: "timeoutOpts"
          ),
          model: ContextDev::Models::WebExtractStyleguideResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebMapURLsParams} for more details.
      #
      # Discover a site's URLs, with page titles, descriptions, keywords, and language
      # when available. Metadata can be missing on newly discovered URLs.
      #
      # @overload map_urls(domain:, headers: nil, include_subdomains: nil, max_links: nil, search: nil, sitemap_url: nil, tags: nil, timeout_opts: nil, url_regex: nil, zdr: nil, request_options: {})
      #
      # @param domain [String] Domain to map, e.g. `stripe.com`.
      #
      # @param headers [Hash{Symbol=>String}] HTTP headers for the target origin. Non-empty headers bypass caching.
      #
      # @param include_subdomains [Boolean] Include URLs on subdomains.
      #
      # @param max_links [Integer] Maximum number of URLs to return.
      #
      # @param search [String] Filter URLs by a topic or phrase, most relevant first.
      #
      # @param sitemap_url [String] Fetch this sitemap instead of discovering sitemaps. Must belong to the domain or
      #
      # @param tags [Array<String>] Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      #
      # @param timeout_opts [ContextDev::Models::WebMapURLsParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      # @param url_regex [String] Optional RE2-compatible regex pattern. Only URLs matching this pattern are retur
      #
      # @param zdr [Symbol, ContextDev::Models::WebMapURLsParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::WebMapURLsResponse]
      #
      # @see ContextDev::Models::WebMapURLsParams
      def map_urls(params)
        parsed, options = ContextDev::WebMapURLsParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "web/urls",
          query: query.transform_keys(
            include_subdomains: "includeSubdomains",
            max_links: "maxLinks",
            sitemap_url: "sitemapUrl",
            timeout_opts: "timeoutOpts",
            url_regex: "urlRegex"
          ),
          model: ContextDev::Models::WebMapURLsResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebScrapeParams} for more details.
      #
      # Scrape anything from a URL on the internet. Returns the outputs you enable in
      # formats. Handles PDFs, DOCX, PPT, XLSX, and 40 other file formats.
      #
      # @overload scrape(formats:, url:, highlights_params: nil, image_params: nil, json_params: nil, markdown_params: nil, max_age_ms: nil, parse_params: nil, product_params: nil, screenshot_params: nil, shared_params: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #
      # @param formats [ContextDev::Models::WebScrapeParams::Formats] Outputs to return. Set at least one to `true`.
      #
      # @param url [String] Public HTTP or HTTPS URL to scrape.
      #
      # @param highlights_params [ContextDev::Models::WebScrapeParams::HighlightsParams] Required when `formats.highlights` is `true`.
      #
      # @param image_params [ContextDev::Models::WebScrapeParams::ImageParams] Image options. Requires formats.images: true.
      #
      # @param json_params [ContextDev::Models::WebScrapeParams::JsonParams] Required when formats.json is true.
      #
      # @param markdown_params [ContextDev::Models::WebScrapeParams::MarkdownParams] Markdown options. Requires `formats.markdown`.
      #
      # @param max_age_ms [Integer] Maximum age of a cached output, in milliseconds. `0` fetches fresh. Defaults to
      #
      # @param parse_params [ContextDev::Models::WebScrapeParams::ParseParams] Required when formats.parse is true.
      #
      # @param product_params [ContextDev::Models::WebScrapeParams::ProductParams] Product options. Requires formats.product: true.
      #
      # @param screenshot_params [ContextDev::Models::WebScrapeParams::ScreenshotParams] Screenshot options. Requires formats.screenshot: true.
      #
      # @param shared_params [ContextDev::Models::WebScrapeParams::SharedParams] Browser and content settings shared by all outputs.
      #
      # @param tags [Array<String>] Labels for tracking request usage. Not retained when zdr is enabled.
      #
      # @param timeout_opts [ContextDev::Models::WebScrapeParams::TimeoutOpts] Deadline for the whole request. Defaults to 60000 ms with `fail`. Fixed waits mu
      #
      # @param zdr [Symbol, ContextDev::Models::WebScrapeParams::Zdr] `enabled` turns on zero data retention. Your organization must have ZDR enabled.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::WebScrapeResponse]
      #
      # @see ContextDev::Models::WebScrapeParams
      def scrape(params)
        parsed, options = ContextDev::WebScrapeParams.dump_request(params)
        @client.request(
          method: :post,
          path: "web/scrape",
          body: parsed,
          model: ContextDev::Models::WebScrapeResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebScreenshotParams} for more details.
      #
      # Capture a screenshot of a website.
      #
      # @overload screenshot(clear_popups: nil, color_scheme: nil, country: nil, direct_url: nil, domain: nil, full_screenshot: nil, handle_cookie_popup: nil, headers: nil, max_age_ms: nil, page: nil, scroll_offset: nil, tags: nil, timeout_opts: nil, viewport: nil, wait_for_ms: nil, zdr: nil, request_options: {})
      #
      # @param clear_popups [Boolean] Optional parameter for comprehensive popup cleanup. If 'true', the browser dismi
      #
      # @param color_scheme [Symbol, ContextDev::Models::WebScreenshotParams::ColorScheme] Optional parameter to choose the site's visual theme in the screenshot. Use 'lig
      #
      # @param country [Symbol, ContextDev::Models::WebScreenshotParams::Country] Fetch from this country (ISO 3166-1 alpha-2).
      #
      # @param direct_url [String] A specific URL to screenshot directly, bypassing domain resolution (e.g., 'https
      #
      # @param domain [String] Domain name to take screenshot of (e.g., 'example.com', 'google.com'). The domai
      #
      # @param full_screenshot [Symbol, ContextDev::Models::WebScreenshotParams::FullScreenshot] Optional parameter to determine screenshot type. If 'true', takes a full page sc
      #
      # @param handle_cookie_popup [Boolean] Optional parameter to control cookie/consent popup handling. If 'true', we dismi
      #
      # @param headers [Hash{Symbol=>String}] Optional outbound HTTP headers, using the same JSON object or deep-object query
      #
      # @param max_age_ms [Integer, nil] Return a cached screenshot if a prior screenshot for the same parameters exists
      #
      # @param page [Symbol, ContextDev::Models::WebScreenshotParams::Page] Optional parameter to specify which page type to screenshot. If provided, the sy
      #
      # @param scroll_offset [Integer, nil] Optional vertical scroll offset in pixels for capturing a long page in viewport-
      #
      # @param tags [Array<String>] Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      #
      # @param timeout_opts [ContextDev::Models::WebScreenshotParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      # @param viewport [ContextDev::Models::WebScreenshotParams::Viewport] Optional browser viewport dimensions for the screenshot. Defaults to 1920x1080.
      #
      # @param wait_for_ms [Integer, nil] Optional browser wait time in milliseconds after initial page load before taking
      #
      # @param zdr [Symbol, ContextDev::Models::WebScreenshotParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
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
            clear_popups: "clearPopups",
            color_scheme: "colorScheme",
            direct_url: "directUrl",
            full_screenshot: "fullScreenshot",
            handle_cookie_popup: "handleCookiePopup",
            max_age_ms: "maxAgeMs",
            scroll_offset: "scrollOffset",
            timeout_opts: "timeoutOpts",
            wait_for_ms: "waitForMs"
          ),
          model: ContextDev::Models::WebScreenshotResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebSearchParams} for more details.
      #
      # Search the web and optionally return page content with each result.
      #
      # @overload search(query:, country: nil, exclude_domains: nil, freshness: nil, include_domains: nil, markdown_options: nil, num_results: nil, query_fanout: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #
      # @param query [String] Search query. Accepts natural language as well as Google-style search operators
      #
      # @param country [Symbol, ContextDev::Models::WebSearchParams::Country] Two-letter ISO 3166-1 alpha-2 country code to localize results to a specific cou
      #
      # @param exclude_domains [Array<String>] Blocklist — drop results from these domains. Example: ["pinterest.com", "reddit.
      #
      # @param freshness [Symbol, ContextDev::Models::WebSearchParams::Freshness] Restrict results to content published within this window.
      #
      # @param include_domains [Array<String>] Allowlist — only return results from these domains. Example: ["arxiv.org", "gith
      #
      # @param markdown_options [ContextDev::Models::WebSearchParams::MarkdownOptions] Inline Markdown scraping for each result. Set `enabled: true` to activate.
      #
      # @param num_results [Integer] Number of results to request and return (10–100). Defaults to 10.
      #
      # @param query_fanout [Boolean] Currently has no effect.
      #
      # @param tags [Array<String>] Labels for filtering usage in the dashboard.
      #
      # @param timeout_opts [ContextDev::Models::WebSearchParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      # @param zdr [Symbol, ContextDev::Models::WebSearchParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::WebSearchResponse]
      #
      # @see ContextDev::Models::WebSearchParams
      def search(params)
        parsed, options = ContextDev::WebSearchParams.dump_request(params)
        @client.request(
          method: :post,
          path: "web/search",
          body: parsed,
          model: ContextDev::Models::WebSearchResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebWebCrawlMdParams} for more details.
      #
      # Crawl a website and return page content as Markdown. Use a batch for crawls
      # beyond 500 pages.
      #
      # @overload web_crawl_md(url:, country: nil, exclude_selectors: nil, follow_subdomains: nil, include_frames: nil, include_images: nil, include_links: nil, include_selectors: nil, max_age_ms: nil, max_depth: nil, max_pages: nil, pdf: nil, settle_animations: nil, shorten_base64_images: nil, stop_after_ms: nil, tags: nil, timeout_opts: nil, url_regex: nil, use_main_content_only: nil, wait_for_ms: nil, zdr: nil, request_options: {})
      #
      # @param url [String] Start URL, including `http://` or `https://`.
      #
      # @param country [Symbol, ContextDev::Models::WebWebCrawlMdParams::Country] Fetch from this country (ISO 3166-1 alpha-2).
      #
      # @param exclude_selectors [Array<String>] Remove matching elements after inclusions. Exclusions take precedence.
      #
      # @param follow_subdomains [Boolean] When true, follow links on subdomains of the starting URL's domain (e.g. docs.ex
      #
      # @param include_frames [Boolean] When true, the contents of iframes are rendered to Markdown for each crawled pag
      #
      # @param include_images [Boolean] Include image references in the Markdown output
      #
      # @param include_links [Boolean] Preserve hyperlinks in the Markdown output
      #
      # @param include_selectors [Array<String>] Keep matching HTML subtrees before converting each page to Markdown.
      #
      # @param max_age_ms [Integer] Maximum cache age in milliseconds. Defaults to 1 day; `0` fetches fresh.
      #
      # @param max_depth [Integer] Maximum link depth from the starting URL (0 = only the starting page)
      #
      # @param max_pages [Integer] Maximum pages to crawl.
      #
      # @param pdf [ContextDev::Models::WebWebCrawlMdParams::Pdf] PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
      #
      # @param settle_animations [Boolean] Wait briefly for CSS animations and transitions to settle before reading each pa
      #
      # @param shorten_base64_images [Boolean] Truncate base64-encoded image data in the Markdown output
      #
      # @param stop_after_ms [Integer] Soft crawl deadline in milliseconds. Returns pages collected before the next dea
      #
      # @param tags [Array<String>] Labels for filtering usage in the dashboard.
      #
      # @param timeout_opts [ContextDev::Models::WebWebCrawlMdParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      # @param url_regex [String] Regex pattern. Only URLs matching this pattern will be followed and scraped. An
      #
      # @param use_main_content_only [Boolean] Extract only the main content, stripping headers, footers, sidebars, and navigat
      #
      # @param wait_for_ms [Integer] Browser wait time in milliseconds after initial page load for each crawled page.
      #
      # @param zdr [Symbol, ContextDev::Models::WebWebCrawlMdParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
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

      # @api private
      #
      # @param client [ContextDev::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
