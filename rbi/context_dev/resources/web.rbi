# typed: strong

module ContextDev
  module Resources
    class Web
      # Crawl a website, use the provided JSON Schema and instructions to prioritize
      # relevant internal links, and extract structured data from the selected pages.
      sig do
        params(
          schema: T::Hash[Symbol, T.anything],
          url: String,
          fact_check: T::Boolean,
          follow_subdomains: T::Boolean,
          include_frames: T::Boolean,
          instructions: String,
          max_age_ms: Integer,
          pdf: ContextDev::WebExtractParams::Pdf::OrHash,
          stop_after_ms: Integer,
          timeout_ms: Integer,
          wait_for_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebExtractResponse)
      end
      def extract(
        # JSON Schema for the returned data object. TypeScript Zod users can pass a JSON
        # Schema generated from a Zod object; Python users can pass the equivalent JSON
        # Schema object.
        schema:,
        # The starting website URL to crawl and extract from. Must include http:// or
        # https://.
        url:,
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
        pdf: nil,
        # Soft time budget for the crawl in milliseconds. Min: 10000 (10s). Max: 110000
        # (110s). Default: 80000 (80s).
        stop_after_ms: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        # Optional browser wait time in milliseconds after initial page load for each
        # crawled page.
        wait_for_ms: nil,
        request_options: {}
      )
      end

      # Analyze a company's landing page and web search evidence to return direct
      # competitors for the same product or market.
      sig do
        params(
          domain: String,
          num_competitors: Integer,
          timeout_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebExtractCompetitorsResponse)
      end
      def extract_competitors(
        # Company domain to analyze, such as `stripe.com`. Full http(s) URLs are accepted
        # and normalized to their domain.
        domain:,
        # Exact number of direct competitors to return. Defaults to 5.
        num_competitors: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        request_options: {}
      )
      end

      # Scrape font information from a website including font families, usage
      # statistics, fallbacks, and element/word counts.
      sig do
        params(
          direct_url: String,
          domain: String,
          max_age_ms: Integer,
          timeout_ms: Integer,
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
        # Maximum age in milliseconds for cached data before the API performs a hard
        # refresh. Defaults to 3 months (7776000000 ms). Values below 1 day (86400000 ms)
        # are clamped to 1 day; values above 1 year (31536000000 ms) are clamped to 1
        # year.
        max_age_ms: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        request_options: {}
      )
      end

      # Extract a comprehensive design system from a website including colors,
      # typography, spacing, shadows, and UI components.
      sig do
        params(
          direct_url: String,
          domain: String,
          max_age_ms: Integer,
          timeout_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebExtractStyleguideResponse)
      end
      def extract_styleguide(
        # A specific URL to fetch the styleguide from directly, bypassing domain
        # resolution (e.g., 'https://example.com/design-system'). When provided, the
        # styleguide is extracted from this exact URL. You must provide either 'domain' or
        # 'directUrl', but not both.
        direct_url: nil,
        # Domain name to extract styleguide from (e.g., 'example.com', 'google.com'). The
        # domain will be automatically normalized and validated. You must provide either
        # 'domain' or 'directUrl', but not both.
        domain: nil,
        # Maximum age in milliseconds for cached data before the API performs a hard
        # refresh. Defaults to 3 months (7776000000 ms). Values below 1 day (86400000 ms)
        # are clamped to 1 day; values above 1 year (31536000000 ms) are clamped to 1
        # year.
        max_age_ms: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        request_options: {}
      )
      end

      # Capture a screenshot of a website.
      sig do
        params(
          direct_url: String,
          domain: String,
          full_screenshot:
            ContextDev::WebScreenshotParams::FullScreenshot::OrSymbol,
          handle_cookie_popup:
            ContextDev::WebScreenshotParams::HandleCookiePopup::OrSymbol,
          max_age_ms: Integer,
          page: ContextDev::WebScreenshotParams::Page::OrSymbol,
          timeout_ms: Integer,
          viewport: ContextDev::WebScreenshotParams::Viewport::OrHash,
          wait_for_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebScreenshotResponse)
      end
      def screenshot(
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
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        # Optional browser viewport dimensions for the screenshot. Defaults to 1920x1080.
        viewport: nil,
        # Optional browser wait time in milliseconds after initial page load before taking
        # the screenshot. Min: 0. Max: 30000 (30 seconds). Defaults to 3000 ms when
        # omitted.
        wait_for_ms: nil,
        request_options: {}
      )
      end

      # Search the web and optionally scrape each result to Markdown in one round-trip.
      sig do
        params(
          query: String,
          exclude_domains: T::Array[String],
          freshness: ContextDev::WebSearchParams::Freshness::OrSymbol,
          include_domains: T::Array[String],
          markdown_options:
            ContextDev::WebSearchParams::MarkdownOptions::OrHash,
          query_fanout: T::Boolean,
          timeout_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebSearchResponse)
      end
      def search(
        # Natural-language search query.
        query:,
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
        # Expand the query into multiple parallel variants for broader recall.
        query_fanout: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        request_options: {}
      )
      end

      # Performs a crawl starting from a given URL, extracts page content as Markdown,
      # and returns results for all crawled pages.
      sig do
        params(
          url: String,
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
          shorten_base64_images: T::Boolean,
          stop_after_ms: Integer,
          timeout_ms: Integer,
          url_regex: String,
          use_main_content_only: T::Boolean,
          wait_for_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebCrawlMdResponse)
      end
      def web_crawl_md(
        # The starting URL for the crawl (must include http:// or https:// protocol)
        url:,
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
        # PDF parsing controls. Use start/end to limit text extraction and OCR to an
        # inclusive 1-based page range.
        pdf: nil,
        # Truncate base64-encoded image data in the Markdown output
        shorten_base64_images: nil,
        # Soft time budget for the crawl in milliseconds. After each scrape, the crawler
        # checks the elapsed time and, if exceeded, returns the pages collected so far
        # instead of continuing. Min: 10000 (10s). Max: 110000 (110s). Default: 80000
        # (80s).
        stop_after_ms: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        # Regex pattern. Only URLs matching this pattern will be followed and scraped.
        url_regex: nil,
        # Extract only the main content, stripping headers, footers, sidebars, and
        # navigation
        use_main_content_only: nil,
        # Optional browser wait time in milliseconds after initial page load for each
        # crawled page. Min: 0. Max: 30000 (30 seconds).
        wait_for_ms: nil,
        request_options: {}
      )
      end

      # Scrapes the given URL and returns the raw HTML content of the page.
      sig do
        params(
          url: String,
          exclude_selectors: T::Array[String],
          headers: T::Hash[Symbol, String],
          include_frames: T::Boolean,
          include_selectors: T::Array[String],
          max_age_ms: Integer,
          pdf: ContextDev::WebWebScrapeHTMLParams::Pdf::OrHash,
          timeout_ms: Integer,
          wait_for_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebScrapeHTMLResponse)
      end
      def web_scrape_html(
        # Full URL to scrape (must include http:// or https:// protocol)
        url:,
        # CSS selectors to remove from the result. Applied after includeSelectors.
        # Exclusion takes precedence: an element matching both is removed. Examples:
        # "nav", "footer", ".ad-banner", "[aria-hidden=true]".
        exclude_selectors: nil,
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
        # PDF parsing controls. Use start/end to limit text extraction and OCR to an
        # inclusive 1-based page range.
        pdf: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        # Optional browser wait time in milliseconds after initial page load. Min: 0. Max:
        # 30000 (30 seconds).
        wait_for_ms: nil,
        request_options: {}
      )
      end

      # Extract image assets from a web page, including standard URLs, inline SVGs, data
      # URIs, responsive image sources, metadata, CSS backgrounds, video posters, and
      # embeds. The base request costs 1 credit. When enrichment is enabled, the entire
      # call costs 5 credits.
      sig do
        params(
          url: String,
          enrichment: ContextDev::WebWebScrapeImagesParams::Enrichment::OrHash,
          headers: T::Hash[Symbol, String],
          max_age_ms: Integer,
          timeout_ms: Integer,
          wait_for_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebScrapeImagesResponse)
      end
      def web_scrape_images(
        # Page URL to inspect. Must include http:// or https://.
        url:,
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
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        # Optional browser wait time in milliseconds after initial page load before
        # collecting images. Min: 0. Max: 30000 (30 seconds).
        wait_for_ms: nil,
        request_options: {}
      )
      end

      # Scrapes the given URL into LLM usable Markdown.
      sig do
        params(
          url: String,
          exclude_selectors: T::Array[String],
          headers: T::Hash[Symbol, String],
          include_frames: T::Boolean,
          include_images: T::Boolean,
          include_links: T::Boolean,
          include_selectors: T::Array[String],
          max_age_ms: Integer,
          pdf: ContextDev::WebWebScrapeMdParams::Pdf::OrHash,
          shorten_base64_images: T::Boolean,
          timeout_ms: Integer,
          use_main_content_only: T::Boolean,
          wait_for_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebScrapeMdResponse)
      end
      def web_scrape_md(
        # Full URL to scrape into LLM usable Markdown (must include http:// or https://
        # protocol)
        url:,
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
        # PDF parsing controls. Use start/end to limit text extraction and OCR to an
        # inclusive 1-based page range.
        pdf: nil,
        # Shorten base64-encoded image data in the Markdown output
        shorten_base64_images: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        # Extract only the main content of the page, excluding headers, footers, sidebars,
        # and navigation
        use_main_content_only: nil,
        # Optional browser wait time in milliseconds after initial page load before
        # converting the page to Markdown. Min: 0. Max: 30000 (30 seconds).
        wait_for_ms: nil,
        request_options: {}
      )
      end

      # Crawl an entire website's sitemap and return all discovered page URLs.
      sig do
        params(
          domain: String,
          headers: T::Hash[Symbol, String],
          max_links: Integer,
          timeout_ms: Integer,
          url_regex: String,
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
        # Maximum number of links to return from the sitemap crawl. Defaults to 10,000.
        # Minimum is 1, maximum is 100,000.
        max_links: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        # Optional RE2-compatible regex pattern. Only URLs matching this pattern are
        # returned and counted against maxLinks.
        url_regex: nil,
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
