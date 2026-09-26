# frozen_string_literal: true

module ContextDev
  module Resources
    class Web
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebAnswersParams} for more details.
      #
      # Researches the live web and returns a sourced answer in your requested JSON
      # shape. Select fast for a smaller research budget at 10 credits or ultra for
      # deeper reasoning at 100 credits. Defaults to ultra. Fast research is limited to
      # 30 seconds and ultra to 50 seconds; timeoutOpts.milliseconds can shorten either
      # deadline.
      #
      # @overload answers(task:, json_format: nil, mode: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #
      # @param task [String] What to research and answer, in plain language. Naming a domain in the task (for
      #
      # @param json_format [Hash{Symbol=>Object}] An example object with placeholder values (for example {"pricing_page_url": "",
      #
      # @param mode [Symbol, ContextDev::Models::WebAnswersParams::Mode] Research level: fast uses a smaller model and research budget for 10 credits; ul
      #
      # @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      # @param timeout_opts [ContextDev::Models::WebAnswersParams::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout
      #
      # @param zdr [Symbol, ContextDev::Models::WebAnswersParams::Zdr] Set to enabled to bypass shared caches and omit request and response content fro
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
      # @param tags [Array<String>] Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50 charac
      #
      # @param timeout_opts [ContextDev::Models::WebExtractCompetitorsParams::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout
      #
      # @param zdr [Symbol, ContextDev::Models::WebExtractCompetitorsParams::Zdr] Set to enabled to bypass shared caches and omit request and response content fro
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
      # Extract a comprehensive design system from a website including colors,
      # typography, spacing, shadows, and UI components.
      #
      # @overload extract_styleguide(color_scheme: nil, direct_url: nil, domain: nil, max_age_ms: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #
      # @param color_scheme [Symbol, ContextDev::Models::WebExtractStyleguideParams::ColorScheme] Optional browser color scheme to emulate for websites that respond to prefers-co
      #
      # @param direct_url [String] A specific URL to fetch the styleguide from directly, bypassing domain resolutio
      #
      # @param domain [String] Domain name to extract styleguide from (e.g., 'example.com', 'google.com'). The
      #
      # @param max_age_ms [Integer, nil] Maximum age in milliseconds for cached brand data before the API performs a hard
      #
      # @param tags [Array<String>] Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50 charac
      #
      # @param timeout_opts [ContextDev::Models::WebExtractStyleguideParams::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout
      #
      # @param zdr [Symbol, ContextDev::Models::WebExtractStyleguideParams::Zdr] Set to enabled to bypass shared caches and omit request and response content fro
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
      # Discovers URLs using the same sitemap crawl, filters, and limits as
      # /web/scrape/sitemap. Each URL includes its available title, description,
      # keywords, and language. URLs without stored enrichment are returned immediately
      # with only the URL and queued for background HTML scraping, so later requests can
      # include their metadata. Responses are never cached as a whole; every request
      # reads the current per-URL enrichment. Zero data retention and credential-bearing
      # discovery requests return URLs without reading or storing shared enrichment or
      # queuing background scrapes. Costs 1 credit, or 2 credits with search.
      #
      # @overload map_urls(domain:, headers: nil, include_subdomains: nil, max_links: nil, search: nil, sitemap_url: nil, tags: nil, timeout_opts: nil, url_regex: nil, zdr: nil, request_options: {})
      #
      # @param domain [String] Domain to build a sitemap for
      #
      # @param headers [Hash{Symbol=>String}] Optional outbound HTTP headers forwarded only to the target URL, sent as deep-ob
      #
      # @param include_subdomains [Boolean] When true, discover and include public pages and sitemaps on subdomains of the r
      #
      # @param max_links [Integer] Maximum number of links to return from the sitemap crawl. Defaults to 10,000. Mi
      #
      # @param search [String] Optional search phrase. When provided, the crawled sitemap is filtered to the pa
      #
      # @param sitemap_url [String] Optional explicit sitemap URL. When provided, exactly this sitemap is crawled in
      #
      # @param tags [Array<String>] Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50 charac
      #
      # @param timeout_opts [ContextDev::Models::WebMapURLsParams::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout
      #
      # @param url_regex [String] Optional RE2-compatible regex pattern. Only URLs matching this pattern are retur
      #
      # @param zdr [Symbol, ContextDev::Models::WebMapURLsParams::Zdr] Set to enabled to bypass shared caches and omit request and response content fro
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
      # Reuse cached outputs independently and capture missing formats in one page
      # visit. Each cache key includes only the settings that affect that output. HTML
      # is shared with Markdown, parsed fields, product data, highlights, and JSON
      # extraction. Cached outputs can come from different visits within maxAgeMs; use 0
      # for a fresh capture. HTML-only requests use the existing fast acquisition path.
      # Highlights return Markdown excerpts most relevant to highlightsParams.query.
      # Requests with at least one successful output cost one base credit, including
      # cache hits, or two with browser actions. All-failed responses are unbilled
      # except missing pages, which retain the base price and the one-credit product
      # charge when product was requested. Highlights add 3 credits when passages are
      # returned. JSON extraction runs an LLM over nonempty page Markdown and adds four
      # credits only when its result is returned successfully. PDF OCR adds one credit
      # per recovered page on fresh extraction. Product adds one credit when its
      # successful result is returned, plus six if that result used the specialized
      # model. Original response bytes and screenshots are limited to 20 MiB each,
      # screenshots to 40 megapixels, and the combined response to 60 MiB. An oversized
      # output has success: false and data: null. If the combined response exceeds its
      # limit, the largest outputs are marked failed until the remaining outputs fit.
      # Valid captured pieces may still be cached when omitted to meet the response size
      # limit.
      #
      # @overload scrape(formats:, url:, highlights_params: nil, image_params: nil, json_params: nil, markdown_params: nil, max_age_ms: nil, parse_params: nil, product_params: nil, screenshot_params: nil, shared_params: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #
      # @param formats [ContextDev::Models::WebScrapeParams::Formats] Outputs to return. Enable at least one; omitted formats are false.
      #
      # @param url [String] The URL to scrape.
      #
      # @param highlights_params [ContextDev::Models::WebScrapeParams::HighlightsParams] Highlight options. Requires formats.highlights: true.
      #
      # @param image_params [ContextDev::Models::WebScrapeParams::ImageParams] Image options. Requires formats.images: true.
      #
      # @param json_params [ContextDev::Models::WebScrapeParams::JsonParams] Required when formats.json is true.
      #
      # @param markdown_params [ContextDev::Models::WebScrapeParams::MarkdownParams] Markdown options. Requires formats.markdown: true.
      #
      # @param max_age_ms [Integer] Maximum age of each cached output. Defaults to 1 day; 0 fetches fresh and update
      #
      # @param parse_params [ContextDev::Models::WebScrapeParams::ParseParams] Required when formats.parse is true.
      #
      # @param product_params [ContextDev::Models::WebScrapeParams::ProductParams] Product options. Requires formats.product: true.
      #
      # @param screenshot_params [ContextDev::Models::WebScrapeParams::ScreenshotParams] Screenshot options. Requires formats.screenshot: true.
      #
      # @param shared_params [ContextDev::Models::WebScrapeParams::SharedParams] Shared browser and content settings. Content filters leave screenshots and origi
      #
      # @param tags [Array<String>] Labels for tracking request usage. Not retained when zdr is enabled.
      #
      # @param timeout_opts [ContextDev::Models::WebScrapeParams::TimeoutOpts] Total deadline, including navigation, actions, waiting, and all outputs. Default
      #
      # @param zdr [Symbol, ContextDev::Models::WebScrapeParams::Zdr] Zero data retention. Bypasses caches and uploads; excludes request/response cont
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
      # @param country [Symbol, ContextDev::Models::WebScreenshotParams::Country] Fetch the target page through a residential proxy in this country (ISO 3166-1 al
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
      # @param tags [Array<String>] Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50 charac
      #
      # @param timeout_opts [ContextDev::Models::WebScreenshotParams::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout
      #
      # @param viewport [ContextDev::Models::WebScreenshotParams::Viewport] Optional browser viewport dimensions for the screenshot. Defaults to 1920x1080.
      #
      # @param wait_for_ms [Integer, nil] Optional browser wait time in milliseconds after initial page load before taking
      #
      # @param zdr [Symbol, ContextDev::Models::WebScreenshotParams::Zdr] Set to enabled to bypass shared caches and omit request and response content fro
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
      # Search the web and optionally scrape each result to Markdown in one round-trip.
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
      # @param query_fanout [Boolean] Expand the query into multiple parallel variants for broader recall.
      #
      # @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      # @param timeout_opts [ContextDev::Models::WebSearchParams::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout
      #
      # @param zdr [Symbol, ContextDev::Models::WebSearchParams::Zdr] Set to enabled to bypass shared caches and omit request and response content fro
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
      # Performs a crawl starting from a given URL, extracts page content as Markdown,
      # and returns results for all crawled pages.
      #
      # @overload web_crawl_md(url:, country: nil, exclude_selectors: nil, follow_subdomains: nil, include_frames: nil, include_images: nil, include_links: nil, include_selectors: nil, max_age_ms: nil, max_depth: nil, max_pages: nil, pdf: nil, settle_animations: nil, shorten_base64_images: nil, stop_after_ms: nil, tags: nil, timeout_opts: nil, url_regex: nil, use_main_content_only: nil, wait_for_ms: nil, zdr: nil, request_options: {})
      #
      # @param url [String] The starting URL for the crawl (must include http:// or https:// protocol)
      #
      # @param country [Symbol, ContextDev::Models::WebWebCrawlMdParams::Country] Fetch the target page through a residential proxy in this country (ISO 3166-1 al
      #
      # @param exclude_selectors [Array<String>] CSS selectors to remove before each crawled page is converted to Markdown. Appli
      #
      # @param follow_subdomains [Boolean] When true, follow links on subdomains of the starting URL's domain (e.g. docs.ex
      #
      # @param include_frames [Boolean] When true, the contents of iframes are rendered to Markdown for each crawled pag
      #
      # @param include_images [Boolean] Include image references in the Markdown output
      #
      # @param include_links [Boolean] Preserve hyperlinks in the Markdown output
      #
      # @param include_selectors [Array<String>] CSS selectors. When provided, only matching HTML subtrees (and their descendants
      #
      # @param max_age_ms [Integer] Return a cached result if a prior scrape for the same parameters exists and is y
      #
      # @param max_depth [Integer] Maximum link depth from the starting URL (0 = only the starting page)
      #
      # @param max_pages [Integer] Maximum number of pages to crawl. Hard cap: 500.
      #
      # @param pdf [ContextDev::Models::WebWebCrawlMdParams::Pdf] PDF parsing controls. Use start/end to limit text extraction and embedded-image
      #
      # @param settle_animations [Boolean] When true, waits briefly for CSS and transition animations to settle before extr
      #
      # @param shorten_base64_images [Boolean] Truncate base64-encoded image data in the Markdown output
      #
      # @param stop_after_ms [Integer] Soft time budget for the crawl in milliseconds. After each scrape, the crawler c
      #
      # @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      # @param timeout_opts [ContextDev::Models::WebWebCrawlMdParams::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout
      #
      # @param url_regex [String] Regex pattern. Only URLs matching this pattern will be followed and scraped. An
      #
      # @param use_main_content_only [Boolean] Extract only the main content, stripping headers, footers, sidebars, and navigat
      #
      # @param wait_for_ms [Integer] Browser wait time in milliseconds after initial page load for each crawled page.
      #
      # @param zdr [Symbol, ContextDev::Models::WebWebCrawlMdParams::Zdr] Set to enabled to bypass shared caches and omit request and response content fro
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
