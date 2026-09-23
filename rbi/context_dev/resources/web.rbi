# typed: strong

module ContextDev
  module Resources
    class Web
      # Researches the live web and returns a sourced answer in your requested JSON
      # shape. Select fast for a smaller research budget at 10 credits or ultra for
      # deeper reasoning at 100 credits. Defaults to ultra. Fast research is limited to
      # 30 seconds and ultra to 50 seconds; timeoutOpts.milliseconds can shorten either
      # deadline.
      sig do
        params(
          task: String,
          json_format: T::Hash[Symbol, T.anything],
          mode: ContextDev::WebAnswersParams::Mode::OrSymbol,
          tags: T::Array[String],
          timeout_opts: ContextDev::WebAnswersParams::TimeoutOpts::OrHash,
          zdr: ContextDev::WebAnswersParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebAnswersResponse)
      end
      def answers(
        # What to research and answer, in plain language. Naming a domain in the task (for
        # example "pricing on context.dev") makes the agent read that site before it
        # searches.
        task:,
        # An example object with placeholder values (for example {"pricing_page_url": "",
        # "plans": [{"name": "", "price": 0}]}). Object keys and value types are
        # preserved; unknown values may be null. Empty arrays accept any JSON items.
        # Defaults to {"result": ""}. Maximum 8 levels, 500 values, and 16000 characters.
        json_format: nil,
        # Research level: fast uses a smaller model and research budget for 10 credits;
        # ultra uses deeper reasoning and research for 100 credits. Defaults to ultra.
        # Only successful requests consume credits.
        mode: nil,
        # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # Set to enabled to bypass shared caches and omit request and response content
        # from retained usage logs. Asset uploads are skipped, so hosted image URLs are
        # omitted. Requires zero data retention to be enabled for your organization
        # (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
        # Successful ZDR responses include X-Context-ZDR: true.
        zdr: nil,
        request_options: {}
      )
      end

      # Analyze a company's landing page and web search evidence to return direct
      # competitors for the same product or market.
      sig do
        params(
          domain: String,
          num_competitors: Integer,
          tags: T::Array[String],
          timeout_opts:
            ContextDev::WebExtractCompetitorsParams::TimeoutOpts::OrHash,
          zdr: ContextDev::WebExtractCompetitorsParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebExtractCompetitorsResponse)
      end
      def extract_competitors(
        # Company domain to analyze, such as `stripe.com`. Full http(s) URLs are accepted
        # and normalized to their domain.
        domain:,
        # Exact number of direct competitors to return. Defaults to 5.
        num_competitors: nil,
        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # Set to enabled to bypass shared caches and omit request and response content
        # from retained usage logs. Asset uploads are skipped, so hosted image URLs are
        # omitted. Requires zero data retention to be enabled for your organization
        # (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
        # Successful ZDR responses include X-Context-ZDR: true.
        zdr: nil,
        request_options: {}
      )
      end

      # Extract a comprehensive design system from a website including colors,
      # typography, spacing, shadows, and UI components.
      sig do
        params(
          color_scheme:
            ContextDev::WebExtractStyleguideParams::ColorScheme::OrSymbol,
          direct_url: String,
          domain: String,
          max_age_ms: T.nilable(Integer),
          tags: T::Array[String],
          timeout_opts:
            ContextDev::WebExtractStyleguideParams::TimeoutOpts::OrHash,
          zdr: ContextDev::WebExtractStyleguideParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebExtractStyleguideResponse)
      end
      def extract_styleguide(
        # Optional browser color scheme to emulate for websites that respond to
        # prefers-color-scheme. This value is part of the styleguide cache key.
        color_scheme: nil,
        # A specific URL to fetch the styleguide from directly, bypassing domain
        # resolution (e.g., 'https://example.com/design-system'). When provided, the
        # styleguide is extracted from this exact URL. You must provide either 'domain' or
        # 'directUrl', but not both.
        direct_url: nil,
        # Domain name to extract styleguide from (e.g., 'example.com', 'google.com'). The
        # domain will be automatically normalized and validated. You must provide either
        # 'domain' or 'directUrl', but not both.
        domain: nil,
        # Maximum age in milliseconds for cached brand data before the API performs a hard
        # refresh. Defaults to 3 months (7776000000 ms). Set to 0 to always perform a hard
        # refresh. Negative values are clamped to 0; values above 1 year (31536000000 ms)
        # are clamped to 1 year.
        max_age_ms: nil,
        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # Set to enabled to bypass shared caches and omit request and response content
        # from retained usage logs. Asset uploads are skipped, so hosted image URLs are
        # omitted. Requires zero data retention to be enabled for your organization
        # (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
        # Successful ZDR responses include X-Context-ZDR: true.
        zdr: nil,
        request_options: {}
      )
      end

      # Discovers URLs using the same sitemap crawl, filters, and limits as
      # /web/scrape/sitemap. Each URL includes its available title, description,
      # keywords, and language. URLs without stored enrichment are returned immediately
      # with only the URL and queued for background HTML scraping, so later requests can
      # include their metadata. Responses are never cached as a whole; every request
      # reads the current per-URL enrichment. Zero data retention and credential-bearing
      # discovery requests return URLs without reading or storing shared enrichment or
      # queuing background scrapes. Costs 1 credit, or 2 credits with search.
      sig do
        params(
          domain: String,
          headers: T::Hash[Symbol, String],
          include_subdomains: T::Boolean,
          max_links: Integer,
          search: String,
          sitemap_url: String,
          tags: T::Array[String],
          timeout_opts: ContextDev::WebMapURLsParams::TimeoutOpts::OrHash,
          url_regex: String,
          zdr: ContextDev::WebMapURLsParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebMapURLsResponse)
      end
      def map_urls(
        # Domain to build a sitemap for
        domain:,
        # Optional outbound HTTP headers forwarded only to the target URL, sent as
        # deep-object query params such as headers[X-Custom]=value. When provided, caching
        # is bypassed: the result is neither read from nor written to cache.
        headers: nil,
        # When true, discover and include public pages and sitemaps on subdomains of the
        # requested domain. Defaults to false.
        include_subdomains: nil,
        # Maximum number of links to return from the sitemap crawl. Defaults to 10,000.
        # Minimum is 1, maximum is 100,000.
        max_links: nil,
        # Optional search phrase. When provided, the crawled sitemap is filtered to the
        # pages whose URLs are about that phrase, most relevant first, and the request
        # costs 2 credits instead of 1.
        search: nil,
        # Optional explicit sitemap URL. When provided, exactly this sitemap is crawled
        # instead of discovering the domain's sitemaps.
        sitemap_url: nil,
        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # Optional RE2-compatible regex pattern. Only URLs matching this pattern are
        # returned and counted against maxLinks.
        url_regex: nil,
        # Set to enabled to bypass shared caches and omit request and response content
        # from retained usage logs. Asset uploads are skipped, so hosted image URLs are
        # omitted. Requires zero data retention to be enabled for your organization
        # (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
        # Successful ZDR responses include X-Context-ZDR: true.
        zdr: nil,
        request_options: {}
      )
      end

      # Reuse cached outputs independently and capture missing formats in one page
      # visit. Each cache key includes only the settings that affect that output. HTML
      # is shared with Markdown, parsed fields, product data, highlights, and JSON
      # extraction. Cached outputs can come from different visits within maxAgeMs; use 0
      # for a fresh capture. HTML-only requests use the existing fast acquisition path.
      # Highlights return the plain-text passages most relevant to
      # highlightsParams.query. One credit per request, including cache hits and missing
      # pages, or two with browser actions; highlights add 3 credits when passages are
      # returned; JSON extraction adds four credits and runs an LLM over the page
      # Markdown on every request that has text to extract; PDF OCR adds one credit per
      # recovered page on fresh extraction; the product output adds one credit, plus six
      # more when the specialized model is used. Original response bytes and screenshots
      # are limited to 20 MiB each, screenshots to 40 megapixels, and the combined
      # browser capture to 60 MiB.
      sig do
        params(
          formats: ContextDev::WebScrapeParams::Formats::OrHash,
          url: String,
          highlights_params:
            ContextDev::WebScrapeParams::HighlightsParams::OrHash,
          image_params: ContextDev::WebScrapeParams::ImageParams::OrHash,
          json_params: ContextDev::WebScrapeParams::JsonParams::OrHash,
          markdown_params: ContextDev::WebScrapeParams::MarkdownParams::OrHash,
          max_age_ms: Integer,
          parse_params: ContextDev::WebScrapeParams::ParseParams::OrHash,
          product_params: ContextDev::WebScrapeParams::ProductParams::OrHash,
          screenshot_params:
            ContextDev::WebScrapeParams::ScreenshotParams::OrHash,
          shared_params: ContextDev::WebScrapeParams::SharedParams::OrHash,
          tags: T::Array[String],
          timeout_opts: ContextDev::WebScrapeParams::TimeoutOpts::OrHash,
          zdr: ContextDev::WebScrapeParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebScrapeResponse)
      end
      def scrape(
        # Outputs to return. Enable at least one; omitted formats are false.
        formats:,
        # The URL to scrape.
        url:,
        # Highlight options. Requires formats.highlights: true.
        highlights_params: nil,
        # Image options. Requires formats.images: true.
        image_params: nil,
        # Required when formats.json is true.
        json_params: nil,
        # Markdown options. Requires formats.markdown: true.
        markdown_params: nil,
        # Maximum age of each cached output. Defaults to 1 day; 0 fetches fresh and
        # updates the requested outputs. Compatible outputs are shared with the individual
        # scrape endpoints. Image results with hosted files refresh after 23 hours; other
        # outputs retain their own freshness.
        max_age_ms: nil,
        # Required when formats.parse is true.
        parse_params: nil,
        # Product options. Requires formats.product: true.
        product_params: nil,
        # Screenshot options. Requires formats.screenshot: true.
        screenshot_params: nil,
        # Shared browser and content settings. Content filters leave screenshots and
        # original bytes unchanged.
        shared_params: nil,
        # Labels for tracking request usage. Not retained when zdr is enabled.
        tags: nil,
        # Total deadline, including navigation, actions, waiting, and all outputs.
        # Defaults to 60000 milliseconds with behavior fail. Use return-partial to capture
        # the current page state and return captured images if image processing cannot
        # finish before the deadline; these responses set isPartial and are not cached.
        # Every requested format must still be available. Fixed waits must fit before a
        # response reserve of up to 5000 milliseconds (at most one quarter of the timeout)
        # when using return-partial.
        timeout_opts: nil,
        # Zero data retention. Bypasses caches and uploads; excludes request/response
        # content and tags from logs. Must be enabled for your organization.
        zdr: nil,
        request_options: {}
      )
      end

      # Capture a screenshot of a website.
      sig do
        params(
          clear_popups: T::Boolean,
          color_scheme: ContextDev::WebScreenshotParams::ColorScheme::OrSymbol,
          country: ContextDev::WebScreenshotParams::Country::OrSymbol,
          direct_url: String,
          domain: String,
          full_screenshot:
            ContextDev::WebScreenshotParams::FullScreenshot::OrSymbol,
          handle_cookie_popup: T::Boolean,
          headers: T::Hash[Symbol, String],
          max_age_ms: T.nilable(Integer),
          page: ContextDev::WebScreenshotParams::Page::OrSymbol,
          scroll_offset: T.nilable(Integer),
          tags: T::Array[String],
          timeout_opts: ContextDev::WebScreenshotParams::TimeoutOpts::OrHash,
          viewport: ContextDev::WebScreenshotParams::Viewport::OrHash,
          wait_for_ms: T.nilable(Integer),
          zdr: ContextDev::WebScreenshotParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebScreenshotResponse)
      end
      def screenshot(
        # Optional parameter for comprehensive popup cleanup. If 'true', the browser
        # dismisses detected cookie/consent UI and clears other detected obstructive
        # popups and overlays before capture. If 'false' or not provided, this parameter
        # requests no cleanup; handleCookiePopup can still request cookie/consent handling
        # independently.
        clear_popups: nil,
        # Optional parameter to choose the site's visual theme in the screenshot. Use
        # 'light' or 'dark' when the site offers both appearances.
        color_scheme: nil,
        # Fetch the target page through a residential proxy in this country (ISO 3166-1
        # alpha-2).
        country: nil,
        # A specific URL to screenshot directly, bypassing domain resolution (e.g.,
        # 'https://example.com/pricing'). When provided, the screenshot is taken of this
        # exact URL. You must provide either 'domain' or 'directUrl', but not both.
        direct_url: nil,
        # Domain name to take screenshot of (e.g., 'example.com', 'google.com'). The
        # domain will be automatically normalized and validated. You must provide either
        # 'domain' or 'directUrl', but not both.
        domain: nil,
        # Optional parameter to determine screenshot type. If 'true', takes a full page
        # screenshot capturing all content. If 'false' or not provided, takes a viewport
        # screenshot (standard browser view).
        full_screenshot: nil,
        # Optional parameter to control cookie/consent popup handling. If 'true', we
        # dismiss cookie banner before capture. If 'false' or not provided, captures the
        # page without that step.
        handle_cookie_popup: nil,
        # Optional outbound HTTP headers, using the same JSON object or deep-object query
        # format as other scrape endpoints (for example headers[Authorization]=Bearer
        # token). Headers are scoped to the target origin during capture. For domain/page
        # requests, discovery receives no custom headers and only pages on the resolved
        # origin are eligible. Non-empty headers bypass screenshot caching and return an
        # in-memory data URL; no screenshot is uploaded. Empty objects behave like omitted
        # headers.
        headers: nil,
        # Return a cached screenshot if a prior screenshot for the same parameters exists
        # and is younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
        # omitted. Max is 30 days (2592000000 ms). Set to 0 to always capture fresh.
        max_age_ms: nil,
        # Optional parameter to specify which page type to screenshot. If provided, the
        # system will scrape the domain's links and use heuristics to find the most
        # appropriate URL for the specified page type (30 supported languages). If not
        # provided, screenshots the main domain landing page. Only applicable when using
        # 'domain', not 'directUrl'.
        page: nil,
        # Optional vertical scroll offset in pixels for capturing a long page in
        # viewport-sized chunks. When provided, the full page is captured once and the
        # returned image is the viewport-sized slice that begins at this Y offset (e.g.
        # request scrollOffset=0, then 1080, then 2160 to walk a 1920x1080 landing page
        # top to bottom). The final slice may be shorter than the viewport height. Takes
        # precedence over fullScreenshot. Max: 100000.
        scroll_offset: nil,
        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # Optional browser viewport dimensions for the screenshot. Defaults to 1920x1080.
        viewport: nil,
        # Optional browser wait time in milliseconds after initial page load before taking
        # the screenshot. Min: 0. Max: 30000 (30 seconds). Defaults to 3000 ms when
        # omitted. When combined with timeoutOpts, timeoutOpts.milliseconds must be at
        # least waitForMs + 10000 ms; a shorter deadline is rejected with 400
        # TIMEOUT_TOO_SHORT_FOR_WAIT.
        wait_for_ms: nil,
        # Set to enabled to bypass shared caches and omit request and response content
        # from retained usage logs. Asset uploads are skipped, so hosted image URLs are
        # omitted. Requires zero data retention to be enabled for your organization
        # (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
        # Successful ZDR responses include X-Context-ZDR: true.
        zdr: nil,
        request_options: {}
      )
      end

      # Search the web and optionally scrape each result to Markdown in one round-trip.
      sig do
        params(
          query: String,
          country: ContextDev::WebSearchParams::Country::OrSymbol,
          exclude_domains: T::Array[String],
          freshness: ContextDev::WebSearchParams::Freshness::OrSymbol,
          include_domains: T::Array[String],
          markdown_options:
            ContextDev::WebSearchParams::MarkdownOptions::OrHash,
          num_results: Integer,
          query_fanout: T::Boolean,
          tags: T::Array[String],
          timeout_opts: ContextDev::WebSearchParams::TimeoutOpts::OrHash,
          zdr: ContextDev::WebSearchParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebSearchResponse)
      end
      def search(
        # Search query. Accepts natural language as well as Google-style search operators
        # such as `site:`, `-site:`, `inurl:`, `intitle:`, quoted phrases, and `OR`.
        query:,
        # Two-letter ISO 3166-1 alpha-2 country code to localize results to a specific
        # country (maps to Google's `gl` parameter). Example: "us", "gb", "de".
        country: nil,
        # Blocklist — drop results from these domains. Example: ["pinterest.com",
        # "reddit.com"].
        exclude_domains: nil,
        # Restrict results to content published within this window.
        freshness: nil,
        # Allowlist — only return results from these domains. Example: ["arxiv.org",
        # "github.com"].
        include_domains: nil,
        # Inline Markdown scraping for each result. Set `enabled: true` to activate.
        markdown_options: nil,
        # Number of results to request and return (10–100). Defaults to 10.
        num_results: nil,
        # Expand the query into multiple parallel variants for broader recall.
        query_fanout: nil,
        # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # Set to enabled to bypass shared caches and omit request and response content
        # from retained usage logs. Asset uploads are skipped, so hosted image URLs are
        # omitted. Requires zero data retention to be enabled for your organization
        # (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
        # Successful ZDR responses include X-Context-ZDR: true.
        zdr: nil,
        request_options: {}
      )
      end

      # Performs a crawl starting from a given URL, extracts page content as Markdown,
      # and returns results for all crawled pages.
      sig do
        params(
          url: String,
          country: ContextDev::WebWebCrawlMdParams::Country::OrSymbol,
          exclude_selectors: T::Array[String],
          follow_subdomains: T::Boolean,
          include_frames: T::Boolean,
          include_images: T::Boolean,
          include_links: T::Boolean,
          include_selectors: T::Array[String],
          max_age_ms: Integer,
          max_depth: Integer,
          max_pages: Integer,
          pdf: ContextDev::WebWebCrawlMdParams::Pdf::OrHash,
          settle_animations: T::Boolean,
          shorten_base64_images: T::Boolean,
          stop_after_ms: Integer,
          tags: T::Array[String],
          timeout_opts: ContextDev::WebWebCrawlMdParams::TimeoutOpts::OrHash,
          url_regex: String,
          use_main_content_only: T::Boolean,
          wait_for_ms: Integer,
          zdr: ContextDev::WebWebCrawlMdParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebCrawlMdResponse)
      end
      def web_crawl_md(
        # The starting URL for the crawl (must include http:// or https:// protocol)
        url:,
        # Fetch the target page through a residential proxy in this country (ISO 3166-1
        # alpha-2).
        country: nil,
        # CSS selectors to remove before each crawled page is converted to Markdown.
        # Applied after includeSelectors. Exclusion takes precedence: an element matching
        # both is removed. Examples: "nav", "footer", ".ad-banner", "[aria-hidden=true]".
        exclude_selectors: nil,
        # When true, follow links on subdomains of the starting URL's domain (e.g.
        # docs.example.com when starting from example.com). www and apex are always
        # treated as equivalent.
        follow_subdomains: nil,
        # When true, the contents of iframes are rendered to Markdown for each crawled
        # page.
        include_frames: nil,
        # Include image references in the Markdown output
        include_images: nil,
        # Preserve hyperlinks in the Markdown output
        include_links: nil,
        # CSS selectors. When provided, only matching HTML subtrees (and their
        # descendants) are kept before each crawled page is converted to Markdown. When
        # omitted, the entire document is kept. Examples: "article.main", "#content",
        # "[role=main]".
        include_selectors: nil,
        # Return a cached result if a prior scrape for the same parameters exists and is
        # younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
        # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
        max_age_ms: nil,
        # Maximum link depth from the starting URL (0 = only the starting page)
        max_depth: nil,
        # Maximum number of pages to crawl. Hard cap: 500.
        max_pages: nil,
        # PDF parsing controls. Use start/end to limit text extraction and embedded-image
        # detection/OCR to an inclusive 1-based page range.
        pdf: nil,
        # When true, waits briefly for CSS and transition animations to settle before
        # extracting each crawled page. Defaults to false. This adds a bit of latency in
        # exchange for more stable output on animated pages.
        settle_animations: nil,
        # Truncate base64-encoded image data in the Markdown output
        shorten_base64_images: nil,
        # Soft time budget for the crawl in milliseconds. After each scrape, the crawler
        # checks the elapsed time and, if exceeded, returns the pages collected so far
        # instead of continuing. Min: 10000 (10s). Max: 110000 (110s). Default: 80000
        # (80s).
        stop_after_ms: nil,
        # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # Regex pattern. Only URLs matching this pattern will be followed and scraped. An
        # automatic prefix scope in the form ^<starting URL> follows a redirect of the
        # starting page.
        url_regex: nil,
        # Extract only the main content, stripping headers, footers, sidebars, and
        # navigation
        use_main_content_only: nil,
        # Browser wait time in milliseconds after initial page load for each crawled page.
        # Defaults to 3500 (3.5 seconds). Min: 0. Max: 30000 (30 seconds).
        wait_for_ms: nil,
        # Set to enabled to bypass shared caches and omit request and response content
        # from retained usage logs. Requires zero data retention to be enabled for your
        # organization (contact support@context.dev), otherwise the request fails with
        # ZDR_NOT_ENABLED. Successful ZDR responses include X-Context-ZDR: true.
        zdr: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: ContextDev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
