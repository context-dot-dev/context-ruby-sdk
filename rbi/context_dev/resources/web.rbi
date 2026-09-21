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

      # Crawl a website, use the provided JSON Schema and instructions to prioritize
      # relevant internal links, and extract structured data from the selected pages.
      sig do
        params(
          schema: T::Hash[Symbol, T.anything],
          url: String,
          actions:
            T::Array[
              T.any(
                ContextDev::WebExtractParams::Action::Wait::OrHash,
                ContextDev::WebExtractParams::Action::Perform::OrHash,
                ContextDev::WebExtractParams::Action::Scroll::OrHash
              )
            ],
          fact_check: T::Boolean,
          follow_subdomains: T::Boolean,
          include_frames: T::Boolean,
          instructions: String,
          max_age_ms: Integer,
          max_depth: Integer,
          max_pages: Integer,
          pdf: ContextDev::WebExtractParams::Pdf::OrHash,
          settle_animations: T::Boolean,
          stop_after_ms: Integer,
          tags: T::Array[String],
          timeout_opts: ContextDev::WebExtractParams::TimeoutOpts::OrHash,
          wait_for_ms: Integer,
          zdr: ContextDev::WebExtractParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebExtractResponse)
      end
      def extract(
        # JSON Schema for the returned data object. Image fields such as `image_urls` or
        # `product_photos` automatically make page image references available to
        # extraction, so product data and photos can be returned in one call. TypeScript
        # Zod users can pass a JSON Schema generated from a Zod object; Python users can
        # pass the equivalent JSON Schema object.
        schema:,
        # The starting website URL to crawl and extract from. Must include http:// or
        # https://.
        url:,
        # Optional browser actions executed in order on the requested page after it loads,
        # before links are discovered or additional pages are crawled. Requires a paid
        # plan. When actions are provided and stopAfterMs is omitted, the crawl budget
        # defaults to 110000 ms.
        actions: nil,
        # When true, every returned value must be grounded in facts stated on the page;
        # fields that cannot be supported by the page are returned as null/empty. When
        # false (default), the model may make reasonable inferences and derivations from
        # the page content (e.g. ideal customer, competitor analysis, recommendations)
        # while keeping verifiable specifics (names, quotes, URLs, dates, metrics)
        # faithful to the source.
        fact_check: nil,
        # When true, follow links on subdomains of the starting URL's domain.
        follow_subdomains: nil,
        # When true, iframe contents are included in Markdown before extraction.
        include_frames: nil,
        # Optional extraction guidance, such as which facts to prioritize or how to
        # interpret fields in the schema.
        instructions: nil,
        # Return cached scrape results if a prior scrape for the same parameters is
        # younger than this many milliseconds. Defaults to 7 days (604800000 ms).
        max_age_ms: nil,
        # Optional maximum link depth from the starting URL (0 = only the starting page).
        # If omitted, there is no crawl depth limit.
        max_depth: nil,
        # Maximum number of pages to analyze for extraction. Hard cap: 50. Defaults to 5.
        max_pages: nil,
        pdf: nil,
        # When true, waits briefly for CSS and transition animations to settle before
        # extracting each crawled page. Defaults to false. This adds a bit of latency in
        # exchange for more stable output on animated pages.
        settle_animations: nil,
        # Soft time budget for the crawl in milliseconds. Min: 10000 (10s). Max: 110000
        # (110s). Defaults to 80000 (80s), or 110000 (110s) when browser actions are
        # provided.
        stop_after_ms: nil,
        # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # Optional browser wait time in milliseconds after initial page load for each
        # crawled page.
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

      # Scrape font information from a website including font families, usage
      # statistics, fallbacks, and element/word counts.
      sig do
        params(
          direct_url: String,
          domain: String,
          max_age_ms: T.nilable(Integer),
          tags: T::Array[String],
          timeout_opts: ContextDev::WebExtractFontsParams::TimeoutOpts::OrHash,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebExtractFontsResponse)
      end
      def extract_fonts(
        # A specific URL to fetch fonts from directly, bypassing domain resolution (e.g.,
        # 'https://example.com/design-system'). When provided, fonts are extracted from
        # this exact URL. You must provide either 'domain' or 'directUrl', but not both.
        direct_url: nil,
        # Domain name to extract fonts from (e.g., 'example.com', 'google.com'). The
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

      # Downloads a resource and returns its bytes as base64. Without waitForMs, returns
      # the original HTTP response without image conversion, text extraction, or
      # character-encoding changes. HTTP compression is decoded before base64 encoding.
      # Supply waitForMs to render HTML with JavaScript in the browser and return the
      # resulting HTML as UTF-8 bytes after the wait. Non-HTML resources, including
      # images and PDFs, keep their original bytes and do not incur a browser wait.
      # Follows public redirects and retries failed downloads through ISP and
      # residential proxies, with a direct fallback. When country is specified, only a
      # residential proxy in that country is used. Supply headers such as Referer for
      # images that require a referring page. Cached results are reused according to
      # maxAgeMs (default: 1 day; maximum: 30 days). Set maxAgeMs=0 to fetch fresh and
      # refresh the cache. Cache identity includes the exact URL, country, waitForMs,
      # and normalized outbound headers. Credential-bearing headers and zero data
      # retention bypass cache reads and writes. cache_metadata reports hit, miss, or
      # zdr and the cached result age in milliseconds. Maximum decoded resource size: 20
      # MiB (20971520 bytes), before base64 encoding. Successful requests cost 1 credit;
      # errors are not billed.
      sig do
        params(
          url: String,
          country: ContextDev::WebWebScrapeBytesParams::Country::OrSymbol,
          headers: T::Hash[Symbol, String],
          max_age_ms: T.nilable(Integer),
          tags: T::Array[String],
          timeout_opts:
            ContextDev::WebWebScrapeBytesParams::TimeoutOpts::OrHash,
          wait_for_ms: T.nilable(Integer),
          zdr: ContextDev::WebWebScrapeBytesParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebScrapeBytesResponse)
      end
      def web_scrape_bytes(
        # Full HTTP(S) URL of the resource to download, such as an image, PDF, or page.
        url:,
        # Fetch the target page through a residential proxy in this country (ISO 3166-1
        # alpha-2).
        country: nil,
        # Optional outbound HTTP headers, such as Referer, Cookie, or Authorization. Send
        # as a JSON object or deep-object query params such as
        # headers[Referer]=https://example.com/. Host, Content-Length, and hop-by-hop
        # transport headers are rejected. Authorization and cookies are removed when a
        # redirect changes origin. Credential-bearing headers bypass cache reads and
        # writes; other headers are included in the cache key.
        headers: nil,
        # Return a cached result if a prior scrape for the same parameters exists and is
        # younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
        # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
        max_age_ms: nil,
        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # Optional browser wait time after initial page load, in milliseconds (0–30000; 0
        # uses 500). When supplied, HTML is rendered with JavaScript and returned as UTF-8
        # bytes. Other resources keep their original bytes without a browser wait. Omit to
        # download the original HTTP response. When combined with timeoutOpts,
        # timeoutOpts.milliseconds must be at least waitForMs + 10000 ms; a shorter
        # deadline is rejected with 400 TIMEOUT_TOO_SHORT_FOR_WAIT.
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

      # Scrapes the given URL and returns the HTML content of the page. Optional
      # extractRules return deterministic structured data in extracted using CSS
      # selectors, attributes, lists, and nested rules, without an LLM or additional
      # credits. Rules run on the returned HTML after selector and main-content
      # filtering. Send extractRules as a JSON-encoded query parameter. The base request
      # costs 1 credit; requests with browser actions cost 2 credits. A request that
      # hits its timeoutOpts.milliseconds deadline fails with 408 and is not billed,
      # unless timeoutOpts.behavior=return-partial is set — then the page as rendered so
      # far is returned with `finalDOMState: "still-loading"` and billed at the base
      # cost of 1 credit.
      sig do
        params(
          url: String,
          actions:
            T.nilable(
              T::Array[
                T.any(
                  ContextDev::WebWebScrapeHTMLParams::Action::Wait::OrHash,
                  ContextDev::WebWebScrapeHTMLParams::Action::Perform::OrHash,
                  ContextDev::WebWebScrapeHTMLParams::Action::Scroll::OrHash
                )
              ]
            ),
          country: ContextDev::WebWebScrapeHTMLParams::Country::OrSymbol,
          exclude_selectors: T.nilable(T::Array[String]),
          extract_rules:
            T::Hash[
              Symbol,
              T.any(
                String,
                ContextDev::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::OrHash
              )
            ],
          headers: T::Hash[Symbol, String],
          include_frames: T::Boolean,
          include_selectors: T.nilable(T::Array[String]),
          max_age_ms: T.nilable(Integer),
          pdf: ContextDev::WebWebScrapeHTMLParams::Pdf::OrHash,
          settle_animations: T::Boolean,
          tags: T::Array[String],
          timeout_opts: ContextDev::WebWebScrapeHTMLParams::TimeoutOpts::OrHash,
          use_main_content_only: T::Boolean,
          wait_for_ms: T.nilable(Integer),
          zdr: ContextDev::WebWebScrapeHTMLParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebScrapeHTMLResponse)
      end
      def web_scrape_html(
        # Full URL to scrape (must include http:// or https:// protocol)
        url:,
        # Optional browser actions executed in array order after the page loads and before
        # content is captured. Requires a paid plan. Send a JSON array in the query
        # parameter. Maximum: 5 actions.
        actions: nil,
        # Fetch the target page through a residential proxy in this country (ISO 3166-1
        # alpha-2).
        country: nil,
        # CSS selectors to remove from the result. Applied after includeSelectors.
        # Exclusion takes precedence: an element matching both is removed. Examples:
        # "nav", "footer", ".ad-banner", "[aria-hidden=true]".
        exclude_selectors: nil,
        # Optional CSS extraction rules applied to the returned HTML after selector and
        # main-content filtering. Use selector strings ("h1", "a@href") or objects with
        # selector, type (item or list), and output (text, html, @attribute, or nested
        # rules). Text whitespace is normalized; html includes the matched element;
        # attributes are returned as written. Missing items are null and missing lists are
        # empty. CSS only; XPath is not supported. Maximum: 100 fields across 5 levels.
        # Send a JSON-encoded string in the extractRules query parameter.
        extract_rules: nil,
        # Optional outbound HTTP headers forwarded only to the target URL, sent as
        # deep-object query params such as headers[X-Custom]=value. When provided, caching
        # is bypassed: the result is neither read from nor written to cache.
        headers: nil,
        # When true, iframes are rendered inline into the returned HTML.
        include_frames: nil,
        # CSS selectors. When provided, only matching subtrees (and their descendants) are
        # kept and everything else is dropped. When omitted, the entire document is kept.
        # Examples: "article.main", "#content", "[role=main]".
        include_selectors: nil,
        # Return a cached result if a prior scrape for the same parameters exists and is
        # younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
        # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
        max_age_ms: nil,
        # PDF parsing controls. Use start/end to limit text extraction and embedded-image
        # detection/OCR to an inclusive 1-based page range.
        pdf: nil,
        # When true, waits briefly for CSS and transition animations to settle before
        # extracting HTML. Defaults to false. This adds a bit of latency in exchange for
        # more stable output on animated pages.
        settle_animations: nil,
        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # When true, return only the page's main content in the HTML response, excluding
        # headers, footers, sidebars, and navigation when detectable.
        use_main_content_only: nil,
        # Optional browser wait time in milliseconds after initial page load. Min: 0. Max:
        # 30000 (30 seconds). When combined with timeoutOpts, timeoutOpts.milliseconds
        # must be at least waitForMs + 10000 ms; a shorter deadline is rejected with 400
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

      # Extract image assets from a web page, including standard URLs, inline SVGs, data
      # URIs, responsive image sources, metadata, CSS backgrounds, video posters, and
      # embeds. The base request costs 1 credit, or 2 credits with browser actions. When
      # enrichment is enabled, the entire call costs 5 credits, including requests that
      # also use actions.
      sig do
        params(
          url: String,
          actions:
            T.nilable(
              T::Array[
                T.any(
                  ContextDev::WebWebScrapeImagesParams::Action::Wait::OrHash,
                  ContextDev::WebWebScrapeImagesParams::Action::Perform::OrHash,
                  ContextDev::WebWebScrapeImagesParams::Action::Scroll::OrHash
                )
              ]
            ),
          country: ContextDev::WebWebScrapeImagesParams::Country::OrSymbol,
          dedupe: T::Boolean,
          enrichment:
            T.nilable(ContextDev::WebWebScrapeImagesParams::Enrichment::OrHash),
          headers: T::Hash[Symbol, String],
          max_age_ms: T.nilable(Integer),
          tags: T::Array[String],
          timeout_opts:
            ContextDev::WebWebScrapeImagesParams::TimeoutOpts::OrHash,
          wait_for_ms: T.nilable(Integer),
          zdr: ContextDev::WebWebScrapeImagesParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebScrapeImagesResponse)
      end
      def web_scrape_images(
        # Page URL to inspect. Must include http:// or https://.
        url:,
        # Optional browser actions executed in array order after the page loads and before
        # content is captured. Requires a paid plan. Send a JSON array in the query
        # parameter. Maximum: 5 actions.
        actions: nil,
        # Fetch the target page through a residential proxy in this country (ISO 3166-1
        # alpha-2).
        country: nil,
        # When true, visually duplicate images are removed: every image is loaded and
        # perceptually hashed, and only the highest-resolution copy of each duplicate
        # group is kept. Images that cannot be downloaded or hashed are kept. Default:
        # false.
        dedupe: nil,
        # Optional per-image processing, sent as deep-object query params such as
        # enrichment[resolution]=true.
        enrichment: nil,
        # Optional outbound HTTP headers forwarded only to the target URL, sent as
        # deep-object query params such as headers[X-Custom]=value. When provided, caching
        # is bypassed: the result is neither read from nor written to cache.
        headers: nil,
        # Reuse a cached result this many milliseconds old or newer. Default: 86400000 (1
        # day). Set to 0 to bypass cache. Maximum: 2592000000 (30 days).
        max_age_ms: nil,
        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # Optional browser wait time in milliseconds after initial page load before
        # collecting images. Min: 0. Max: 30000 (30 seconds). When combined with
        # timeoutOpts, timeoutOpts.milliseconds must be at least waitForMs + 10000 ms; a
        # shorter deadline is rejected with 400 TIMEOUT_TOO_SHORT_FOR_WAIT.
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

      # Scrapes the given URL into LLM usable Markdown. Inspect key_metadata on JSON
      # responses from a recognized API key; use error_code to distinguish stable
      # failure categories.
      #
      # ### YouTube
      #
      # YouTube URLs return the video or channel itself rather than the surrounding
      # player and navigation chrome. A URL addressing a single video (`/watch`,
      # `youtu.be`, `/shorts`, `/embed`, `/live`) returns its title, channel, duration,
      # view count, keywords, full description, and the transcript when the video has
      # captions that can be retrieved; videos without captions return everything except
      # the transcript. A channel URL (`/channel/UC…`, `/@handle`, `/c/…`, `/user/…`)
      # returns its name, handle, subscriber count, video count, and full description.
      # When `includeImages=true`, video responses also include the thumbnail and
      # channel responses include the avatar. Costs the same as any other scrape.
      #
      # ### Billing & errors
      #
      # | HTTP status | Billed?                                   | Meaning                                                                                                                                                                                                                                                                                                       |
      # | ----------- | ----------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
      # | 200         | Yes — 1 credit, or 2 credits with actions | Successful scrape, including a zero-length result when includeSelectors matched nothing. A partial result (`finalDOMState: "still-loading"`, only with timeoutOpts.behavior=return-partial) is billed at the base 1 credit with no OCR or actions surcharge                                                   |
      # | 400         | No                                        | Invalid input, skipped PDF, or the page could not be scraped. error_code WEBSITE_BLOCKED specifically means the site answered with an anti-bot challenge, CAPTCHA wall, or login shell instead of the page (even when the site returned HTTP 200) — retrying later or from another country sometimes succeeds |
      # | 401 / 403   | No                                        | Invalid/disabled key, insufficient permissions, or credits exhausted; inspect error_code                                                                                                                                                                                                                      |
      # | 404         | Yes — 1 credit, or 2 credits with actions | Target page returned or fingerprinted as not found                                                                                                                                                                                                                                                            |
      # | 408         | No                                        | Request timed out. With timeoutOpts.behavior=return-partial this only happens when nothing usable had rendered by the deadline                                                                                                                                                                                |
      # | 413         | No                                        | Target content exceeds the maximum supported size (20 MB)                                                                                                                                                                                                                                                     |
      # | 415         | No                                        | Unsupported content type                                                                                                                                                                                                                                                                                      |
      # | 429         | No                                        | Per-minute rate limit exceeded; honor Retry-After                                                                                                                                                                                                                                                             |
      # | 500         | No                                        | Internal error                                                                                                                                                                                                                                                                                                |
      sig do
        params(
          url: String,
          actions:
            T.nilable(
              T::Array[
                T.any(
                  ContextDev::WebWebScrapeMdParams::Action::Wait::OrHash,
                  ContextDev::WebWebScrapeMdParams::Action::Perform::OrHash,
                  ContextDev::WebWebScrapeMdParams::Action::Scroll::OrHash
                )
              ]
            ),
          country: ContextDev::WebWebScrapeMdParams::Country::OrSymbol,
          exclude_selectors: T.nilable(T::Array[String]),
          headers: T::Hash[Symbol, String],
          include_frames: T::Boolean,
          include_html: T::Boolean,
          include_images: T::Boolean,
          include_links: T::Boolean,
          include_selectors: T.nilable(T::Array[String]),
          max_age_ms: T.nilable(Integer),
          pdf: ContextDev::WebWebScrapeMdParams::Pdf::OrHash,
          settle_animations: T::Boolean,
          shorten_base64_images: T::Boolean,
          tags: T::Array[String],
          timeout_opts: ContextDev::WebWebScrapeMdParams::TimeoutOpts::OrHash,
          use_main_content_only: T::Boolean,
          wait_for_ms: T.nilable(Integer),
          zdr: ContextDev::WebWebScrapeMdParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebScrapeMdResponse)
      end
      def web_scrape_md(
        # Full URL to scrape into LLM usable Markdown (must include http:// or https://
        # protocol)
        url:,
        # Optional browser actions executed in array order after the page loads and before
        # content is captured. Requires a paid plan. Send a JSON array in the query
        # parameter. Maximum: 5 actions.
        actions: nil,
        # Fetch the target page through a residential proxy in this country (ISO 3166-1
        # alpha-2).
        country: nil,
        # CSS selectors to remove before conversion to Markdown. Applied after
        # includeSelectors. Exclusion takes precedence: an element matching both is
        # removed. Examples: "nav", "footer", ".ad-banner", "[aria-hidden=true]".
        exclude_selectors: nil,
        # Optional outbound HTTP headers forwarded only to the target URL, sent as
        # deep-object query params such as headers[X-Custom]=value. When provided, caching
        # is bypassed: the result is neither read from nor written to cache.
        headers: nil,
        # When true, the contents of iframes are rendered to Markdown.
        include_frames: nil,
        # When true, the response also includes an `html` field with the page HTML the
        # Markdown was converted from — the same body the Scrape HTML endpoint returns for
        # the equivalent request.
        include_html: nil,
        # Include image references in Markdown output
        include_images: nil,
        # Preserve hyperlinks in Markdown output
        include_links: nil,
        # CSS selectors. When provided, only matching HTML subtrees (and their
        # descendants) are kept before conversion to Markdown. When omitted, the entire
        # document is kept. Examples: "article.main", "#content", "[role=main]".
        include_selectors: nil,
        # Return a cached result if a prior scrape for the same parameters exists and is
        # younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
        # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
        max_age_ms: nil,
        # PDF parsing controls. Use start/end to limit text extraction and embedded-image
        # detection/OCR to an inclusive 1-based page range.
        pdf: nil,
        # When true, waits briefly for CSS and transition animations to settle before
        # converting to Markdown. Defaults to false. This adds a bit of latency in
        # exchange for more stable output on animated pages.
        settle_animations: nil,
        # Shorten base64-encoded image data in the Markdown output
        shorten_base64_images: nil,
        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # Extract only the main content of the page, excluding headers, footers, sidebars,
        # and navigation
        use_main_content_only: nil,
        # Optional browser wait time in milliseconds after initial page load before
        # converting the page to Markdown. Min: 0. Max: 30000 (30 seconds). When combined
        # with timeoutOpts, timeoutOpts.milliseconds must be at least waitForMs + 10000
        # ms; a shorter deadline is rejected with 400 TIMEOUT_TOO_SHORT_FOR_WAIT.
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

      # Capture the given HTTP or HTTPS URL with configurable viewport, full-page
      # capture, wait time, popup handling, theme, scroll offset, cache age, country,
      # and request timeout. Defaults to a 1920x1080 viewport, a 3-second wait, and a
      # cache age of 1 day. With timeoutOpts.behavior=return-partial, a screenshot of
      # the page rendered so far may be returned; inspect finalDOMState to identify an
      # incomplete render. Successful requests cost 1 credit; errors are not billed.
      sig do
        params(
          url: String,
          clear_popups: T::Boolean,
          color_scheme:
            ContextDev::WebWebScrapeScreenshotParams::ColorScheme::OrSymbol,
          country: ContextDev::WebWebScrapeScreenshotParams::Country::OrSymbol,
          full_screenshot:
            ContextDev::WebWebScrapeScreenshotParams::FullScreenshot::OrSymbol,
          handle_cookie_popup: T::Boolean,
          headers: T::Hash[Symbol, String],
          max_age_ms: T.nilable(Integer),
          scroll_offset: T.nilable(Integer),
          tags: T::Array[String],
          timeout_opts:
            ContextDev::WebWebScrapeScreenshotParams::TimeoutOpts::OrHash,
          viewport: ContextDev::WebWebScrapeScreenshotParams::Viewport::OrHash,
          wait_for_ms: T.nilable(Integer),
          zdr: ContextDev::WebWebScrapeScreenshotParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebScrapeScreenshotResponse)
      end
      def web_scrape_screenshot(
        url:,
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

      # Crawl an entire website's sitemap and return all discovered page URLs. Set
      # `includeSubdomains=true` to also discover public pages and sitemaps on child
      # hosts such as `docs.example.com` or `brand.example.com`. Pass `search` to have
      # the discovered URLs filtered down to the pages about a phrase (for example
      # `pricing and plans` or `api authentication docs`), most relevant first — a
      # searched crawl scans the whole sitemap and costs 2 credits instead of 1.
      sig do
        params(
          domain: String,
          headers: T::Hash[Symbol, String],
          include_subdomains: T::Boolean,
          max_links: Integer,
          search: String,
          sitemap_url: String,
          tags: T::Array[String],
          timeout_opts:
            ContextDev::WebWebScrapeSitemapParams::TimeoutOpts::OrHash,
          url_regex: String,
          zdr: ContextDev::WebWebScrapeSitemapParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebScrapeSitemapResponse)
      end
      def web_scrape_sitemap(
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

      # @api private
      sig { params(client: ContextDev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
