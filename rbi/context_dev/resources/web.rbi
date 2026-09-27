# typed: strong

module ContextDev
  module Resources
    class Web
      # Research the web and return a sourced answer in your JSON shape. Choose `fast`
      # for a short task or `ultra` for deeper research.
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
        # Research task. Name a domain to have it read before searching.
        task:,
        # Example answer object, not JSON Schema. Up to 8 levels, 500 values, and 16000
        # characters; unknowns may be null.
        json_format: nil,
        # `fast` for short tasks; `ultra` for deeper research (default).
        mode: nil,
        # Labels for filtering usage in the dashboard.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
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
        # Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      # Extract colors, typography, spacing, and component styles from a website.
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
        # Exact URL to inspect. Provide either `domain` or `directUrl`, not both.
        direct_url: nil,
        # Domain name to extract styleguide from (e.g., 'example.com', 'google.com'). The
        # domain will be automatically normalized and validated. You must provide either
        # 'domain' or 'directUrl', but not both.
        domain: nil,
        # Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1
        # year. `0` refreshes.
        max_age_ms: nil,
        # Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      # Discover a site's URLs, with page titles, descriptions, keywords, and language
      # when available. Metadata can be missing on newly discovered URLs.
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
        # Domain to map, e.g. `stripe.com`.
        domain:,
        # HTTP headers for the target origin. Non-empty headers bypass caching.
        headers: nil,
        # Include URLs on subdomains.
        include_subdomains: nil,
        # Maximum number of URLs to return.
        max_links: nil,
        # Filter URLs by a topic or phrase, most relevant first.
        search: nil,
        # Fetch this sitemap instead of discovering sitemaps. Must belong to the domain or
        # a subdomain.
        sitemap_url: nil,
        # Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # Optional RE2-compatible regex pattern. Only URLs matching this pattern are
        # returned and counted against maxLinks.
        url_regex: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      # Scrape anything from a URL on the internet. Returns the outputs you enable in
      # formats. Handles PDFs, DOCX, PPT, XLSX, and 40 other file formats.
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
        # Outputs to return. Set at least one to `true`.
        formats:,
        # Public HTTP or HTTPS URL to scrape.
        url:,
        # Required when `formats.highlights` is `true`.
        highlights_params: nil,
        # Image options. Requires formats.images: true.
        image_params: nil,
        # Required when formats.json is true.
        json_params: nil,
        # Markdown options. Requires `formats.markdown`.
        markdown_params: nil,
        # Maximum age of a cached output, in milliseconds. `0` fetches fresh. Defaults to
        # 3 days (259200000 ms). Maximum: 1 year (31536000000 ms).
        max_age_ms: nil,
        # Required when formats.parse is true.
        parse_params: nil,
        # Product options. Requires formats.product: true.
        product_params: nil,
        # Screenshot options. Requires formats.screenshot: true.
        screenshot_params: nil,
        # Browser and content settings shared by all outputs.
        shared_params: nil,
        # Labels for tracking request usage. Not retained when zdr is enabled.
        tags: nil,
        # Deadline for the whole request. Defaults to 60000 ms with `fail`. Fixed waits
        # must end before it.
        timeout_opts: nil,
        # `enabled` turns on zero data retention. Your organization must have ZDR enabled.
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
        # Fetch from this country (ISO 3166-1 alpha-2).
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
        # Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # Optional browser viewport dimensions for the screenshot. Defaults to 1920x1080.
        viewport: nil,
        # Optional browser wait time in milliseconds after initial page load before taking
        # the screenshot. Min: 0. Max: 30000 (30 seconds). Defaults to 3000 ms when
        # omitted. When combined with timeoutOpts, timeoutOpts.milliseconds must be at
        # least waitForMs + 10000 ms; a shorter deadline is rejected with 400
        # TIMEOUT_TOO_SHORT_FOR_WAIT.
        wait_for_ms: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      # Search the web and optionally return page content with each result.
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
        # Currently has no effect.
        query_fanout: nil,
        # Labels for filtering usage in the dashboard.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      # Crawl a website and return page content as Markdown. Use a batch for crawls
      # beyond 500 pages.
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
        # Start URL, including `http://` or `https://`.
        url:,
        # Fetch from this country (ISO 3166-1 alpha-2).
        country: nil,
        # Remove matching elements after inclusions. Exclusions take precedence.
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
        # Keep matching HTML subtrees before converting each page to Markdown.
        include_selectors: nil,
        # Maximum cache age in milliseconds. Defaults to 1 day; `0` fetches fresh.
        max_age_ms: nil,
        # Maximum link depth from the starting URL (0 = only the starting page)
        max_depth: nil,
        # Maximum pages to crawl.
        max_pages: nil,
        # PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
        pdf: nil,
        # Wait briefly for CSS animations and transitions to settle before reading each
        # page.
        settle_animations: nil,
        # Truncate base64-encoded image data in the Markdown output
        shorten_base64_images: nil,
        # Soft crawl deadline in milliseconds. Returns pages collected before the next
        # deadline check.
        stop_after_ms: nil,
        # Labels for filtering usage in the dashboard.
        tags: nil,
        # Request deadline and what to return when it passes.
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
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
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
