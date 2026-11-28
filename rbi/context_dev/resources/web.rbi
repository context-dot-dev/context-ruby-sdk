# typed: strong

module ContextDev
  module Resources
    class Web
      # Research a task across the live web and Context.dev's company and people data,
      # and get the answer in the JSON shape you provide, with the URLs it used. `fast`
      # (10 credits) suits short lookups; `ultra` (100 credits, the default) reads more
      # sources for deeper research.
      sig do
        params(
          task: String,
          controls: ContextDev::WebAnswersParams::Controls::OrHash,
          json_format: T::Hash[Symbol, T.anything],
          mode: ContextDev::WebAnswersParams::Mode::OrSymbol,
          policies: T::Array[String],
          tags: T::Array[String],
          timeout_opts: ContextDev::WebAnswersParams::TimeoutOpts::OrHash,
          zdr: ContextDev::WebAnswersParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebAnswersResponse)
      end
      def answers(
        # What to research, in plain language, up to 2000 characters. Include domains or
        # URLs to focus the research.
        task:,
        # Limit which sites the research can search, read, and cite.
        controls: nil,
        # Example of the answer object to return, not a JSON Schema. Up to 8 levels deep,
        # 500 values, and 16,000 characters. Values that cannot be found come back as
        # `null`. Defaults to `{ "result": "" }`.
        json_format: nil,
        # `fast` prioritizes speed and adds extra verification for people and companies;
        # `ultra` searches and reads more sources for deeper research. Defaults to
        # `ultra`.
        mode: nil,
        # Access policy IDs to apply; each URL must pass all of them. Requires access
        # policies enabled for your organization; otherwise returns
        # `ACCESS_POLICIES_NOT_ENABLED`.
        policies: nil,
        # Labels for this request. Filter usage and request logs by them in the dashboard
        # or with `GET /org/logs`.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      # Find a company's direct competitors from its website and web search results.
      # Each competitor comes with a confidence level and the search results behind it.
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
        # Company domain, such as `stripe.com`. Full URLs are reduced to their domain.
        domain:,
        # Exact number of direct competitors to return.
        num_competitors: nil,
        # Comma-separated labels for this request, such as `production,team-alpha`. Filter
        # usage and request logs by them.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      # Extract a website's design system: colors, typography, spacing, shadows, button
      # and card styles, and downloadable font files. Every component style includes
      # ready-to-use CSS.
      sig do
        params(
          color_scheme:
            ContextDev::WebExtractStyleguideParams::ColorScheme::OrSymbol,
          direct_url: String,
          domain: String,
          max_age_ms: T.nilable(Integer),
          policies: T::Array[String],
          tags: T::Array[String],
          timeout_opts:
            ContextDev::WebExtractStyleguideParams::TimeoutOpts::OrHash,
          zdr: ContextDev::WebExtractStyleguideParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebExtractStyleguideResponse)
      end
      def extract_styleguide(
        # Emulate a light or dark color scheme. Each scheme is cached separately.
        color_scheme: nil,
        # Exact page URL to analyze. Provide either `domain` or `directUrl`, not both.
        direct_url: nil,
        # Domain to analyze, such as `stripe.com`. Provide either `domain` or `directUrl`,
        # not both.
        domain: nil,
        # Maximum age of a cached result, in milliseconds. `0` always fetches fresh.
        # Defaults to 90 days (7776000000 ms). Values above 1 year (31536000000 ms) are
        # capped at 1 year.
        max_age_ms: nil,
        # Comma-separated access policy IDs to apply; each URL must pass all of them.
        # Requires access policies enabled for your organization; otherwise returns
        # `ACCESS_POLICIES_NOT_ENABLED`.
        policies: nil,
        # Comma-separated labels for this request, such as `production,team-alpha`. Filter
        # usage and request logs by them.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # `enabled` turns off request logs and traces and keeps request and response
        # content out of usage logs. Brand data and hosted assets may still be stored.
        # Returns 403 `ZDR_NOT_ENABLED` unless your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      # Map up to 100,000 URLs on a domain, with titles, descriptions, keywords, and
      # language when available. Filter with regex patterns, or rank by topic with
      # `search` for 1 extra credit. Newly discovered URLs can lack metadata.
      sig do
        params(
          domain: String,
          exclude_url_regex: String,
          headers: T::Hash[Symbol, String],
          include_subdomains: T::Boolean,
          max_links: Integer,
          policies: T::Array[String],
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
        # Domain to map, such as `stripe.com`.
        domain:,
        # Leave out URLs matching this regex, even when they match `urlRegex`.
        exclude_url_regex: nil,
        # HTTP headers to send to the target site. Requests with headers skip the cache.
        headers: nil,
        # Include URLs on subdomains.
        include_subdomains: nil,
        # Maximum number of URLs to return.
        max_links: nil,
        # Comma-separated access policy IDs to apply; each URL must pass all of them.
        # Requires access policies enabled for your organization; otherwise returns
        # `ACCESS_POLICIES_NOT_ENABLED`.
        policies: nil,
        # Filter URLs by a topic or phrase, most relevant first.
        search: nil,
        # Fetch this sitemap instead of discovering sitemaps. Must belong to the domain or
        # a subdomain.
        sitemap_url: nil,
        # Comma-separated labels for this request, such as `production,team-alpha`. Filter
        # usage and request logs by them.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # Only return URLs matching this regex. Only matches count toward `maxLinks`.
        url_regex: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      # Turn any URL into Markdown, HTML, a screenshot, images, raw bytes, parsed
      # fields, product data, highlights, or schema-matched JSON in one request. Choose
      # the outputs in `formats`; each one succeeds or fails on its own. Handles PDF,
      # Word, Excel, PowerPoint, and 40 other file formats.
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
          parse_params:
            T.any(
              ContextDev::WebScrapeParams::ParseParams::CustomParser::OrHash,
              ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::OrHash
            ),
          policies: T::Array[String],
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
        # Query for the `highlights` output. Required when `formats.highlights` is `true`,
        # and allowed only then.
        highlights_params: nil,
        # Options for the `images` output. Requires `formats.images: true`.
        image_params: nil,
        # Schema and instructions for the `json` output. Required when `formats.json` is
        # `true`, and allowed only then.
        json_params: nil,
        # Options for the `markdown` output. Requires `formats.markdown: true`.
        markdown_params: nil,
        # Maximum age of a cached result, in milliseconds. `0` always fetches fresh.
        # Defaults to 3 days (259200000 ms). Maximum: 1 year (31536000000 ms).
        max_age_ms: nil,
        # Custom rules or a prebuilt parser for the `parsed` output. Required when
        # `formats.parse` is `true`, and allowed only then.
        parse_params: nil,
        # Access policy IDs to apply; each URL must pass all of them. Requires access
        # policies enabled for your organization; otherwise returns
        # `ACCESS_POLICIES_NOT_ENABLED`.
        policies: nil,
        # Options for the `product` output. Requires `formats.product: true`.
        product_params: nil,
        # Options for the `screenshot` output. Requires `formats.screenshot: true`.
        screenshot_params: nil,
        # Browser and content settings shared by all outputs.
        shared_params: nil,
        # Labels for this request. Filter usage and request logs by them in the dashboard
        # or with `GET /org/logs`.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      # Capture a screenshot of a website's home page, a page type such as pricing, or
      # an exact URL. Returns the visible viewport, a scroll slice, or the full page.
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
        # Dismiss cookie banners and close other popups and overlays before capture.
        clear_popups: nil,
        # Emulate a light or dark color scheme.
        color_scheme: nil,
        # Country to fetch from, as an ISO 3166-1 alpha-2 code.
        country: nil,
        # Exact URL to capture, such as `https://example.com/pricing`. Provide either
        # `domain` or `directUrl`, not both.
        direct_url: nil,
        # Domain to capture, such as `stripe.com`. Provide either `domain` or `directUrl`,
        # not both.
        domain: nil,
        # Capture the full scrollable page instead of only the viewport.
        full_screenshot: nil,
        # Dismiss cookie consent banners before capture.
        handle_cookie_popup: nil,
        # HTTP headers to send to the target origin, such as
        # `headers[Authorization]=Bearer token`. Requests with headers skip the cache and
        # return the image as a data URL.
        headers: nil,
        # Maximum age of a cached result, in milliseconds. `0` always fetches fresh.
        # Defaults to 1 day (86400000 ms). Maximum: 30 days (2592000000 ms).
        max_age_ms: nil,
        # Capture this type of page instead of the home page. Context.dev finds it among
        # the domain's links, in 30 languages. Only with `domain`.
        page: nil,
        # Return the viewport-sized slice of the full page that starts this many pixels
        # from the top. Step by the viewport height, such as `0`, `1080`, `2160`, to walk
        # a long page. The last slice can be shorter. Overrides `fullScreenshot`.
        scroll_offset: nil,
        # Comma-separated labels for this request, such as `production,team-alpha`. Filter
        # usage and request logs by them.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # Browser viewport size in pixels.
        viewport: nil,
        # Time to wait after the page loads before capturing, in milliseconds. `0` waits
        # 500 ms. `timeoutOpts.milliseconds` must be at least `waitForMs` plus 10000 ms,
        # or the request fails with `TIMEOUT_TOO_SHORT_FOR_WAIT`.
        wait_for_ms: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      # Search the web and get ranked results, with optional page Markdown or
      # query-relevant passages for each one. Supports search operators and filters for
      # domain, freshness, country, and language.
      sig do
        params(
          query: String,
          country: ContextDev::WebSearchParams::Country::OrSymbol,
          description_max_characters: T.nilable(Integer),
          exclude_domains: T::Array[String],
          freshness: ContextDev::WebSearchParams::Freshness::OrSymbol,
          highlights_options:
            T.nilable(ContextDev::WebSearchParams::HighlightsOptions::OrHash),
          include_domains: T::Array[String],
          languages:
            T.any(
              ContextDev::WebSearchParams::Languages::OrSymbol,
              T::Array[
                ContextDev::WebSearchParams::Languages::UnionMember1::OrSymbol
              ]
            ),
          markdown_options:
            T.nilable(ContextDev::WebSearchParams::MarkdownOptions::OrHash),
          num_results: Integer,
          policies: T::Array[String],
          tags: T::Array[String],
          timeout_opts: ContextDev::WebSearchParams::TimeoutOpts::OrHash,
          zdr: ContextDev::WebSearchParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebSearchResponse)
      end
      def search(
        # Search query. Accepts natural language and search operators such as `site:`,
        # `-site:`, `inurl:`, `intitle:`, quoted phrases, and `OR`.
        query:,
        # Localize results to this country, as an ISO 3166-1 alpha-2 code such as `us` or
        # `de`.
        country: nil,
        # Maximum length of each result's `description`, in characters.
        description_max_characters: nil,
        # Leave out results from these domains, such as `pinterest.com`.
        exclude_domains: nil,
        # Restrict results to content published within this window.
        freshness: nil,
        # Return passages from each result page that are relevant to the query. Pages are
        # read with the `markdownOptions` settings.
        highlights_options: nil,
        # Only return results from these domains, such as `arxiv.org`.
        include_domains: nil,
        # Languages to return results in, as BCP 47 codes such as `en` or `de`, or `all`
        # for any language.
        languages: nil,
        # Scrape each result page to Markdown. Set `enabled` to `true` to turn it on.
        markdown_options: nil,
        # Number of results to return.
        num_results: nil,
        # Access policy IDs to apply; each URL must pass all of them. Requires access
        # policies enabled for your organization; otherwise returns
        # `ACCESS_POLICIES_NOT_ENABLED`.
        policies: nil,
        # Labels for this request. Filter usage and request logs by them in the dashboard
        # or with `GET /org/logs`.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      # Crawl up to 500 pages from a start URL and get each page back as Markdown with
      # metadata. Control scope with depth limits, regex patterns, and subdomain rules.
      # For larger crawls, use a batch.
      sig do
        params(
          url: String,
          country: ContextDev::WebWebCrawlMdParams::Country::OrSymbol,
          exclude_selectors: T.nilable(T::Array[String]),
          exclude_url_regex: String,
          follow_subdomains: T::Boolean,
          include_frames:
            T.any(
              T::Boolean,
              ContextDev::WebWebCrawlMdParams::IncludeFrames::OrSymbol
            ),
          include_images: T::Boolean,
          include_links: T::Boolean,
          include_selectors: T.nilable(T::Array[String]),
          max_age_ms: T.nilable(Integer),
          max_depth: Integer,
          max_pages: Integer,
          pdf: ContextDev::WebWebCrawlMdParams::Pdf::OrHash,
          policies: T::Array[String],
          settle_animations: T::Boolean,
          shorten_base64_images: T::Boolean,
          source_preference:
            T::Array[
              ContextDev::WebWebCrawlMdParams::SourcePreference::OrSymbol
            ],
          stop_after_ms: Integer,
          tags: T::Array[String],
          timeout_opts: ContextDev::WebWebCrawlMdParams::TimeoutOpts::OrHash,
          url_regex: String,
          use_main_content_only: T::Boolean,
          wait_for_ms: T.nilable(Integer),
          zdr: ContextDev::WebWebCrawlMdParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebCrawlMdResponse)
      end
      def web_crawl_md(
        # Start URL, including `http://` or `https://`.
        url:,
        # Country to fetch from, as an ISO 3166-1 alpha-2 code.
        country: nil,
        # Remove elements matching these CSS selectors. Overrides `includeSelectors`.
        exclude_selectors: nil,
        # Never follow or scrape URLs matching this regex, even when they match
        # `urlRegex`. The start URL is always scraped.
        exclude_url_regex: nil,
        # Follow links to subdomains of the start URL's domain, such as `docs.example.com`
        # from `example.com`. `www` and the apex domain always count as the same site.
        follow_subdomains: nil,
        # Which iframe contents to include in each page's Markdown. `auto` inlines only
        # iframes that hold page content, such as same-site documents, framesets, job
        # boards, forms, and embedded documents, and skips ads and widgets. `true` inlines
        # every iframe; `false` inlines none.
        include_frames: nil,
        # Include image references in the Markdown (`html-conversion` only).
        include_images: nil,
        # Keep link URLs in the Markdown (`html-conversion` only).
        include_links: nil,
        # Keep only elements matching these CSS selectors.
        include_selectors: nil,
        # Maximum age of a cached result, in milliseconds. `0` always fetches fresh.
        # Defaults to 1 day (86400000 ms). Maximum: 30 days (2592000000 ms).
        max_age_ms: nil,
        # Maximum link depth from the start URL. `0` crawls only the start URL. Omit for
        # no depth limit.
        max_depth: nil,
        # Maximum number of pages to crawl.
        max_pages: nil,
        # Whether to parse PDFs and which pages to read.
        pdf: nil,
        # Access policy IDs to apply; each URL must pass all of them. Requires access
        # policies enabled for your organization; otherwise returns
        # `ACCESS_POLICIES_NOT_ENABLED`.
        policies: nil,
        # Wait briefly for CSS animations and transitions to settle before reading each
        # page.
        settle_animations: nil,
        # Shorten inline base64 image data (`html-conversion` only).
        shorten_base64_images: nil,
        # Markdown sources in order of preference: `html-conversion` converts the page
        # HTML, `markdown-direct` uses Markdown the site publishes.
        source_preference: nil,
        # Soft time budget for the crawl, in milliseconds. When it runs out, the crawl
        # returns the pages collected so far. Larger values are capped at 110 seconds.
        stop_after_ms: nil,
        # Labels for this request. Filter usage and request logs by them in the dashboard
        # or with `GET /org/logs`.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # Only follow and scrape URLs matching this regex. A prefix pattern of the form
        # `^<start URL>` also follows a redirect of the start page.
        url_regex: nil,
        # Keep only the main content, without navigation, headers, footers, or sidebars.
        use_main_content_only: nil,
        # Time to wait after each page loads before reading it, in milliseconds. `0` waits
        # 500 ms. `timeoutOpts.milliseconds` must be at least `waitForMs` plus 10000 ms,
        # or the request fails with `TIMEOUT_TOO_SHORT_FOR_WAIT`.
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
