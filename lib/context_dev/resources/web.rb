# frozen_string_literal: true

module ContextDev
  module Resources
    class Web
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebExtractParams} for more details.
      #
      # Crawl a website, use the provided JSON Schema and instructions to prioritize
      # relevant internal links, and extract structured data from the selected pages.
      #
      # @overload extract(schema:, url:, fact_check: nil, follow_subdomains: nil, include_frames: nil, instructions: nil, max_age_ms: nil, max_depth: nil, max_pages: nil, pdf: nil, stop_after_ms: nil, tags: nil, timeout_ms: nil, wait_for_ms: nil, request_options: {})
      #
      # @param schema [Hash{Symbol=>Object}] JSON Schema for the returned data object. TypeScript Zod users can pass a JSON S
      #
      # @param url [String] The starting website URL to crawl and extract from. Must include http:// or http
      #
      # @param fact_check [Boolean] When true, every returned value must be grounded in facts stated on the page; fi
      #
      # @param follow_subdomains [Boolean] When true, follow links on subdomains of the starting URL's domain.
      #
      # @param include_frames [Boolean] When true, iframe contents are included in Markdown before extraction.
      #
      # @param instructions [String] Optional extraction guidance, such as which facts to prioritize or how to interp
      #
      # @param max_age_ms [Integer] Return cached scrape results if a prior scrape for the same parameters is younge
      #
      # @param max_depth [Integer] Optional maximum link depth from the starting URL (0 = only the starting page).
      #
      # @param max_pages [Integer] Maximum number of pages to analyze for extraction. Hard cap: 50. Defaults to 5.
      #
      # @param pdf [ContextDev::Models::WebExtractParams::Pdf]
      #
      # @param stop_after_ms [Integer] Soft time budget for the crawl in milliseconds. Min: 10000 (10s). Max: 110000 (1
      #
      # @param tags [Array<String>] Optional caller-defined tags for tracking this request. Tags are recorded on the
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param wait_for_ms [Integer] Optional browser wait time in milliseconds after initial page load for each craw
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::WebExtractResponse]
      #
      # @see ContextDev::Models::WebExtractParams
      def extract(params)
        parsed, options = ContextDev::WebExtractParams.dump_request(params)
        @client.request(
          method: :post,
          path: "web/extract",
          body: parsed,
          model: ContextDev::Models::WebExtractResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebExtractCompetitorsParams} for more details.
      #
      # Analyze a company's landing page and web search evidence to return direct
      # competitors for the same product or market.
      #
      # @overload extract_competitors(domain:, num_competitors: nil, tags: nil, timeout_ms: nil, request_options: {})
      #
      # @param domain [String] Company domain to analyze, such as `stripe.com`. Full http(s) URLs are accepted
      #
      # @param num_competitors [Integer] Exact number of direct competitors to return. Defaults to 5.
      #
      # @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
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
          query: query.transform_keys(num_competitors: "numCompetitors", timeout_ms: "timeoutMS"),
          model: ContextDev::Models::WebExtractCompetitorsResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebExtractFontsParams} for more details.
      #
      # Scrape font information from a website including font families, usage
      # statistics, fallbacks, and element/word counts.
      #
      # @overload extract_fonts(direct_url: nil, domain: nil, max_age_ms: nil, tags: nil, timeout_ms: nil, request_options: {})
      #
      # @param direct_url [String] A specific URL to fetch fonts from directly, bypassing domain resolution (e.g.,
      #
      # @param domain [String] Domain name to extract fonts from (e.g., 'example.com', 'google.com'). The domai
      #
      # @param max_age_ms [Integer] Maximum age in milliseconds for cached data before the API performs a hard refre
      #
      # @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
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
          query: query.transform_keys(
            direct_url: "directUrl",
            max_age_ms: "maxAgeMs",
            timeout_ms: "timeoutMS"
          ),
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
      # @overload extract_styleguide(color_scheme: nil, direct_url: nil, domain: nil, max_age_ms: nil, tags: nil, timeout_ms: nil, request_options: {})
      #
      # @param color_scheme [Symbol, ContextDev::Models::WebExtractStyleguideParams::ColorScheme] Optional browser color scheme to emulate for websites that respond to prefers-co
      #
      # @param direct_url [String] A specific URL to fetch the styleguide from directly, bypassing domain resolutio
      #
      # @param domain [String] Domain name to extract styleguide from (e.g., 'example.com', 'google.com'). The
      #
      # @param max_age_ms [Integer] Maximum age in milliseconds for cached data before the API performs a hard refre
      #
      # @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
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
          query: query.transform_keys(
            color_scheme: "colorScheme",
            direct_url: "directUrl",
            max_age_ms: "maxAgeMs",
            timeout_ms: "timeoutMS"
          ),
          model: ContextDev::Models::WebExtractStyleguideResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebScreenshotParams} for more details.
      #
      # Capture a screenshot of a website.
      #
      # @overload screenshot(color_scheme: nil, country: nil, direct_url: nil, domain: nil, full_screenshot: nil, handle_cookie_popup: nil, max_age_ms: nil, page: nil, scroll_offset: nil, tags: nil, timeout_ms: nil, viewport: nil, wait_for_ms: nil, request_options: {})
      #
      # @param color_scheme [Symbol, ContextDev::Models::WebScreenshotParams::ColorScheme] Optional parameter to choose the site's visual theme in the screenshot. Use 'lig
      #
      # @param country [Symbol, ContextDev::Models::WebScreenshotParams::Country] Two-letter ISO 3166-1 alpha-2 country code for the website request location. Whe
      #
      # @param direct_url [String] A specific URL to screenshot directly, bypassing domain resolution (e.g., 'https
      #
      # @param domain [String] Domain name to take screenshot of (e.g., 'example.com', 'google.com'). The domai
      #
      # @param full_screenshot [Symbol, ContextDev::Models::WebScreenshotParams::FullScreenshot] Optional parameter to determine screenshot type. If 'true', takes a full page sc
      #
      # @param handle_cookie_popup [Symbol, ContextDev::Models::WebScreenshotParams::HandleCookiePopup] Optional parameter to control cookie/consent popup handling. If 'true', we dismi
      #
      # @param max_age_ms [Integer] Return a cached screenshot if a prior screenshot for the same parameters exists
      #
      # @param page [Symbol, ContextDev::Models::WebScreenshotParams::Page] Optional parameter to specify which page type to screenshot. If provided, the sy
      #
      # @param scroll_offset [Integer] Optional vertical scroll offset in pixels for capturing a long page in viewport-
      #
      # @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
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
            color_scheme: "colorScheme",
            direct_url: "directUrl",
            full_screenshot: "fullScreenshot",
            handle_cookie_popup: "handleCookiePopup",
            max_age_ms: "maxAgeMs",
            scroll_offset: "scrollOffset",
            timeout_ms: "timeoutMS",
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
      # @overload search(query:, country: nil, exclude_domains: nil, freshness: nil, include_domains: nil, markdown_options: nil, num_results: nil, query_fanout: nil, tags: nil, timeout_ms: nil, request_options: {})
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
      # @param tags [Array<String>] Optional caller-defined tags for tracking this request. Tags are recorded on the
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
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
      # @overload web_crawl_md(url:, country: nil, exclude_selectors: nil, follow_subdomains: nil, include_frames: nil, include_images: nil, include_links: nil, include_selectors: nil, max_age_ms: nil, max_depth: nil, max_pages: nil, pdf: nil, settle_animations: nil, shorten_base64_images: nil, stop_after_ms: nil, tags: nil, timeout_ms: nil, url_regex: nil, use_main_content_only: nil, wait_for_ms: nil, request_options: {})
      #
      # @param url [String] The starting URL for the crawl (must include http:// or https:// protocol)
      #
      # @param country [Symbol, ContextDev::Models::WebWebCrawlMdParams::Country] Two-letter ISO 3166-1 alpha-2 country code identifying a supported Context.dev r
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
      # @param tags [Array<String>] Optional caller-defined tags for tracking this request. Tags are recorded on the
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
      # @overload web_scrape_html(url:, country: nil, exclude_selectors: nil, headers: nil, include_frames: nil, include_selectors: nil, max_age_ms: nil, pdf: nil, settle_animations: nil, tags: nil, timeout_ms: nil, use_main_content_only: nil, wait_for_ms: nil, request_options: {})
      #
      # @param url [String] Full URL to scrape (must include http:// or https:// protocol)
      #
      # @param country [Symbol, ContextDev::Models::WebWebScrapeHTMLParams::Country] Two-letter ISO 3166-1 alpha-2 country code for the website request location. Whe
      #
      # @param exclude_selectors [Array<String>] CSS selectors to remove from the result. Applied after includeSelectors. Exclusi
      #
      # @param headers [Hash{Symbol=>String}] Optional outbound HTTP headers forwarded only to the target URL, sent as deep-ob
      #
      # @param include_frames [Boolean] When true, iframes are rendered inline into the returned HTML.
      #
      # @param include_selectors [Array<String>] CSS selectors. When provided, only matching subtrees (and their descendants) are
      #
      # @param max_age_ms [Integer] Return a cached result if a prior scrape for the same parameters exists and is y
      #
      # @param pdf [ContextDev::Models::WebWebScrapeHTMLParams::Pdf] PDF parsing controls. Use start/end to limit text extraction and embedded-image
      #
      # @param settle_animations [Boolean] When true, waits briefly for CSS and transition animations to settle before extr
      #
      # @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param use_main_content_only [Boolean] When true, return only the page's main content in the HTML response, excluding h
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
            exclude_selectors: "excludeSelectors",
            include_frames: "includeFrames",
            include_selectors: "includeSelectors",
            max_age_ms: "maxAgeMs",
            settle_animations: "settleAnimations",
            timeout_ms: "timeoutMS",
            use_main_content_only: "useMainContentOnly",
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
      # embeds. The base request costs 1 credit. When enrichment is enabled, the entire
      # call costs 5 credits.
      #
      # @overload web_scrape_images(url:, dedupe: nil, enrichment: nil, headers: nil, max_age_ms: nil, tags: nil, timeout_ms: nil, wait_for_ms: nil, request_options: {})
      #
      # @param url [String] Page URL to inspect. Must include http:// or https://.
      #
      # @param dedupe [Boolean] When true, visually duplicate images are removed: every image is loaded and perc
      #
      # @param enrichment [ContextDev::Models::WebWebScrapeImagesParams::Enrichment] Optional per-image processing, sent as deep-object query params such as enrichme
      #
      # @param headers [Hash{Symbol=>String}] Optional outbound HTTP headers forwarded only to the target URL, sent as deep-ob
      #
      # @param max_age_ms [Integer] Reuse a cached result this many milliseconds old or newer. Default: 86400000 (1
      #
      # @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
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
      # Scrapes the given URL into LLM usable Markdown. Inspect key_metadata on JSON
      # responses from a recognized API key; use error_code to distinguish stable
      # failure categories.
      #
      # ### Billing & errors
      #
      # | HTTP status | Billed?        | Meaning                                                                                  |
      # | ----------- | -------------- | ---------------------------------------------------------------------------------------- |
      # | 200         | Yes — 1 credit | Successful scrape, including a zero-length result when includeSelectors matched nothing  |
      # | 400         | No             | Invalid input, skipped PDF, or the page could not be scraped                             |
      # | 401 / 403   | No             | Invalid/disabled key, insufficient permissions, or credits exhausted; inspect error_code |
      # | 404         | No             | Target page returned or fingerprinted as not found                                       |
      # | 408         | No             | Request timed out                                                                        |
      # | 415         | No             | Unsupported content type                                                                 |
      # | 429         | No             | Per-minute rate limit exceeded; honor Retry-After                                        |
      # | 500         | No             | Internal error                                                                           |
      #
      # @overload web_scrape_md(url:, country: nil, exclude_selectors: nil, headers: nil, include_frames: nil, include_images: nil, include_links: nil, include_selectors: nil, max_age_ms: nil, pdf: nil, settle_animations: nil, shorten_base64_images: nil, tags: nil, timeout_ms: nil, use_main_content_only: nil, wait_for_ms: nil, request_options: {})
      #
      # @param url [String] Full URL to scrape into LLM usable Markdown (must include http:// or https:// pr
      #
      # @param country [Symbol, ContextDev::Models::WebWebScrapeMdParams::Country] Two-letter ISO 3166-1 alpha-2 country code for the website request location. Whe
      #
      # @param exclude_selectors [Array<String>] CSS selectors to remove before conversion to Markdown. Applied after includeSele
      #
      # @param headers [Hash{Symbol=>String}] Optional outbound HTTP headers forwarded only to the target URL, sent as deep-ob
      #
      # @param include_frames [Boolean] When true, the contents of iframes are rendered to Markdown.
      #
      # @param include_images [Boolean] Include image references in Markdown output
      #
      # @param include_links [Boolean] Preserve hyperlinks in Markdown output
      #
      # @param include_selectors [Array<String>] CSS selectors. When provided, only matching HTML subtrees (and their descendants
      #
      # @param max_age_ms [Integer] Return a cached result if a prior scrape for the same parameters exists and is y
      #
      # @param pdf [ContextDev::Models::WebWebScrapeMdParams::Pdf] PDF parsing controls. Use start/end to limit text extraction and embedded-image
      #
      # @param settle_animations [Boolean] When true, waits briefly for CSS and transition animations to settle before conv
      #
      # @param shorten_base64_images [Boolean] Shorten base64-encoded image data in the Markdown output
      #
      # @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
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
            exclude_selectors: "excludeSelectors",
            include_frames: "includeFrames",
            include_images: "includeImages",
            include_links: "includeLinks",
            include_selectors: "includeSelectors",
            max_age_ms: "maxAgeMs",
            settle_animations: "settleAnimations",
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
      # @overload web_scrape_sitemap(domain:, headers: nil, max_links: nil, tags: nil, timeout_ms: nil, url_regex: nil, request_options: {})
      #
      # @param domain [String] Domain to build a sitemap for
      #
      # @param headers [Hash{Symbol=>String}] Optional outbound HTTP headers forwarded only to the target URL, sent as deep-ob
      #
      # @param max_links [Integer] Maximum number of links to return from the sitemap crawl. Defaults to 10,000. Mi
      #
      # @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
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
