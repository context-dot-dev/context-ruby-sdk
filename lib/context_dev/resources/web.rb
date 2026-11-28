# frozen_string_literal: true

module ContextDev
  module Resources
    class Web
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebAnswersParams} for more details.
      #
      # Research a task across the live web and Context.dev's company and people data,
      # and get the answer in the JSON shape you provide, with the URLs it used. `fast`
      # (10 credits) suits short lookups; `ultra` (100 credits, the default) reads more
      # sources for deeper research.
      #
      # @overload answers(task:, controls: nil, json_format: nil, mode: nil, policies: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #
      # @param task [String] What to research, in plain language, up to 2000 characters. Include domains or U
      #
      # @param controls [ContextDev::Models::WebAnswersParams::Controls] Limit which sites the research can search, read, and cite.
      #
      # @param json_format [Hash{Symbol=>Object}] Example of the answer object to return, not a JSON Schema. Up to 8 levels deep,
      #
      # @param mode [Symbol, ContextDev::Models::WebAnswersParams::Mode] `fast` prioritizes speed and adds extra verification for people and companies; `
      #
      # @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
      #
      # @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
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
      # Find a company's direct competitors from its website and web search results.
      # Each competitor comes with a confidence level and the search results behind it.
      #
      # @overload extract_competitors(domain:, num_competitors: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #
      # @param domain [String] Company domain, such as `stripe.com`. Full URLs are reduced to their domain.
      #
      # @param num_competitors [Integer] Exact number of direct competitors to return.
      #
      # @param tags [Array<String>] Comma-separated labels for this request, such as `production,team-alpha`. Filter
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
      # Extract a website's design system: colors, typography, spacing, shadows, button
      # and card styles, and downloadable font files. Every component style includes
      # ready-to-use CSS.
      #
      # @overload extract_styleguide(color_scheme: nil, direct_url: nil, domain: nil, max_age_ms: nil, policies: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #
      # @param color_scheme [Symbol, ContextDev::Models::WebExtractStyleguideParams::ColorScheme] Emulate a light or dark color scheme. Each scheme is cached separately.
      #
      # @param direct_url [String] Exact page URL to analyze. Provide either `domain` or `directUrl`, not both.
      #
      # @param domain [String] Domain to analyze, such as `stripe.com`. Provide either `domain` or `directUrl`,
      #
      # @param max_age_ms [Integer, nil] Maximum age of a cached result, in milliseconds. `0` always fetches fresh. Defau
      #
      # @param policies [Array<String>] Comma-separated access policy IDs to apply; each URL must pass all of them. Requ
      #
      # @param tags [Array<String>] Comma-separated labels for this request, such as `production,team-alpha`. Filter
      #
      # @param timeout_opts [ContextDev::Models::WebExtractStyleguideParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      # @param zdr [Symbol, ContextDev::Models::WebExtractStyleguideParams::Zdr] `enabled` turns off request logs and traces and keeps request and response conte
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
      # Map up to 100,000 URLs on a domain, with titles, descriptions, keywords, and
      # language when available. Filter with regex patterns, or rank by topic with
      # `search` for 1 extra credit. Newly discovered URLs can lack metadata.
      #
      # @overload map_urls(domain:, exclude_url_regex: nil, headers: nil, include_subdomains: nil, max_links: nil, policies: nil, search: nil, sitemap_url: nil, tags: nil, timeout_opts: nil, url_regex: nil, zdr: nil, request_options: {})
      #
      # @param domain [String] Domain to map, such as `stripe.com`.
      #
      # @param exclude_url_regex [String] Leave out URLs matching this regex, even when they match `urlRegex`.
      #
      # @param headers [Hash{Symbol=>String}] HTTP headers to send to the target site. Requests with headers skip the cache.
      #
      # @param include_subdomains [Boolean] Include URLs on subdomains.
      #
      # @param max_links [Integer] Maximum number of URLs to return.
      #
      # @param policies [Array<String>] Comma-separated access policy IDs to apply; each URL must pass all of them. Requ
      #
      # @param search [String] Filter URLs by a topic or phrase, most relevant first.
      #
      # @param sitemap_url [String] Fetch this sitemap instead of discovering sitemaps. Must belong to the domain or
      #
      # @param tags [Array<String>] Comma-separated labels for this request, such as `production,team-alpha`. Filter
      #
      # @param timeout_opts [ContextDev::Models::WebMapURLsParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      # @param url_regex [String] Only return URLs matching this regex. Only matches count toward `maxLinks`.
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
            exclude_url_regex: "excludeUrlRegex",
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
      # Turn any URL into Markdown, HTML, a screenshot, images, raw bytes, parsed
      # fields, product data, highlights, or schema-matched JSON in one request. Choose
      # the outputs in `formats`; each one succeeds or fails on its own. Handles PDF,
      # Word, Excel, PowerPoint, and 40 other file formats.
      #
      # @overload scrape(formats:, url:, highlights_params: nil, image_params: nil, json_params: nil, markdown_params: nil, max_age_ms: nil, parse_params: nil, policies: nil, product_params: nil, screenshot_params: nil, shared_params: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #
      # @param formats [ContextDev::Models::WebScrapeParams::Formats] Outputs to return. Set at least one to `true`.
      #
      # @param url [String] Public HTTP or HTTPS URL to scrape.
      #
      # @param highlights_params [ContextDev::Models::WebScrapeParams::HighlightsParams] Query for the `highlights` output. Required when `formats.highlights` is `true`,
      #
      # @param image_params [ContextDev::Models::WebScrapeParams::ImageParams] Options for the `images` output. Requires `formats.images: true`.
      #
      # @param json_params [ContextDev::Models::WebScrapeParams::JsonParams] Schema and instructions for the `json` output. Required when `formats.json` is `
      #
      # @param markdown_params [ContextDev::Models::WebScrapeParams::MarkdownParams] Options for the `markdown` output. Requires `formats.markdown: true`.
      #
      # @param max_age_ms [Integer] Maximum age of a cached result, in milliseconds. `0` always fetches fresh. Defau
      #
      # @param parse_params [ContextDev::Models::WebScrapeParams::ParseParams::CustomParser, ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser] Custom rules or a prebuilt parser for the `parsed` output. Required when `format
      #
      # @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
      #
      # @param product_params [ContextDev::Models::WebScrapeParams::ProductParams] Options for the `product` output. Requires `formats.product: true`.
      #
      # @param screenshot_params [ContextDev::Models::WebScrapeParams::ScreenshotParams] Options for the `screenshot` output. Requires `formats.screenshot: true`.
      #
      # @param shared_params [ContextDev::Models::WebScrapeParams::SharedParams] Browser and content settings shared by all outputs.
      #
      # @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
      #
      # @param timeout_opts [ContextDev::Models::WebScrapeParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      # @param zdr [Symbol, ContextDev::Models::WebScrapeParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
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
      # Capture a screenshot of a website's home page, a page type such as pricing, or
      # an exact URL. Returns the visible viewport, a scroll slice, or the full page.
      #
      # @overload screenshot(clear_popups: nil, color_scheme: nil, country: nil, direct_url: nil, domain: nil, full_screenshot: nil, handle_cookie_popup: nil, headers: nil, max_age_ms: nil, page: nil, scroll_offset: nil, tags: nil, timeout_opts: nil, viewport: nil, wait_for_ms: nil, zdr: nil, request_options: {})
      #
      # @param clear_popups [Boolean] Dismiss cookie banners and close other popups and overlays before capture.
      #
      # @param color_scheme [Symbol, ContextDev::Models::WebScreenshotParams::ColorScheme] Emulate a light or dark color scheme.
      #
      # @param country [Symbol, ContextDev::Models::WebScreenshotParams::Country] Country to fetch from, as an ISO 3166-1 alpha-2 code.
      #
      # @param direct_url [String] Exact URL to capture, such as `https://example.com/pricing`. Provide either `dom
      #
      # @param domain [String] Domain to capture, such as `stripe.com`. Provide either `domain` or `directUrl`,
      #
      # @param full_screenshot [Symbol, ContextDev::Models::WebScreenshotParams::FullScreenshot] Capture the full scrollable page instead of only the viewport.
      #
      # @param handle_cookie_popup [Boolean] Dismiss cookie consent banners before capture.
      #
      # @param headers [Hash{Symbol=>String}] HTTP headers to send to the target origin, such as `headers[Authorization]=Beare
      #
      # @param max_age_ms [Integer, nil] Maximum age of a cached result, in milliseconds. `0` always fetches fresh. Defau
      #
      # @param page [Symbol, ContextDev::Models::WebScreenshotParams::Page] Capture this type of page instead of the home page. Context.dev finds it among t
      #
      # @param scroll_offset [Integer, nil] Return the viewport-sized slice of the full page that starts this many pixels fr
      #
      # @param tags [Array<String>] Comma-separated labels for this request, such as `production,team-alpha`. Filter
      #
      # @param timeout_opts [ContextDev::Models::WebScreenshotParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      # @param viewport [ContextDev::Models::WebScreenshotParams::Viewport] Browser viewport size in pixels.
      #
      # @param wait_for_ms [Integer, nil] Time to wait after the page loads before capturing, in milliseconds. `0` waits 5
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
      # Search the web and get ranked results, with optional page Markdown or
      # query-relevant passages for each one. Supports search operators and filters for
      # domain, freshness, country, and language.
      #
      # @overload search(query:, country: nil, description_max_characters: nil, exclude_domains: nil, freshness: nil, highlights_options: nil, include_domains: nil, languages: nil, markdown_options: nil, num_results: nil, policies: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #
      # @param query [String] Search query. Accepts natural language and search operators such as `site:`, `-s
      #
      # @param country [Symbol, ContextDev::Models::WebSearchParams::Country] Localize results to this country, as an ISO 3166-1 alpha-2 code such as `us` or
      #
      # @param description_max_characters [Integer, nil] Maximum length of each result's `description`, in characters.
      #
      # @param exclude_domains [Array<String>] Leave out results from these domains, such as `pinterest.com`.
      #
      # @param freshness [Symbol, ContextDev::Models::WebSearchParams::Freshness] Restrict results to content published within this window.
      #
      # @param highlights_options [ContextDev::Models::WebSearchParams::HighlightsOptions, nil] Return passages from each result page that are relevant to the query. Pages are
      #
      # @param include_domains [Array<String>] Only return results from these domains, such as `arxiv.org`.
      #
      # @param languages [Symbol, Array<Symbol, ContextDev::Models::WebSearchParams::Languages::UnionMember1>, ContextDev::Models::WebSearchParams::Languages] Languages to return results in, as BCP 47 codes such as `en` or `de`, or `all` f
      #
      # @param markdown_options [ContextDev::Models::WebSearchParams::MarkdownOptions, nil] Scrape each result page to Markdown. Set `enabled` to `true` to turn it on.
      #
      # @param num_results [Integer] Number of results to return.
      #
      # @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
      #
      # @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
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
      # Crawl up to 500 pages from a start URL and get each page back as Markdown with
      # metadata. Control scope with depth limits, regex patterns, and subdomain rules.
      # For larger crawls, use a batch.
      #
      # @overload web_crawl_md(url:, country: nil, exclude_selectors: nil, exclude_url_regex: nil, follow_subdomains: nil, include_frames: nil, include_images: nil, include_links: nil, include_selectors: nil, max_age_ms: nil, max_depth: nil, max_pages: nil, pdf: nil, policies: nil, settle_animations: nil, shorten_base64_images: nil, source_preference: nil, stop_after_ms: nil, tags: nil, timeout_opts: nil, url_regex: nil, use_main_content_only: nil, wait_for_ms: nil, zdr: nil, request_options: {})
      #
      # @param url [String] Start URL, including `http://` or `https://`.
      #
      # @param country [Symbol, ContextDev::Models::WebWebCrawlMdParams::Country] Country to fetch from, as an ISO 3166-1 alpha-2 code.
      #
      # @param exclude_selectors [Array<String>, nil] Remove elements matching these CSS selectors. Overrides `includeSelectors`.
      #
      # @param exclude_url_regex [String] Never follow or scrape URLs matching this regex, even when they match `urlRegex`
      #
      # @param follow_subdomains [Boolean] Follow links to subdomains of the start URL's domain, such as `docs.example.com`
      #
      # @param include_frames [Boolean, Symbol, ContextDev::Models::WebWebCrawlMdParams::IncludeFrames] Which iframe contents to include in each page's Markdown. `auto` inlines only if
      #
      # @param include_images [Boolean] Include image references in the Markdown (`html-conversion` only).
      #
      # @param include_links [Boolean] Keep link URLs in the Markdown (`html-conversion` only).
      #
      # @param include_selectors [Array<String>, nil] Keep only elements matching these CSS selectors.
      #
      # @param max_age_ms [Integer, nil] Maximum age of a cached result, in milliseconds. `0` always fetches fresh. Defau
      #
      # @param max_depth [Integer] Maximum link depth from the start URL. `0` crawls only the start URL. Omit for n
      #
      # @param max_pages [Integer] Maximum number of pages to crawl.
      #
      # @param pdf [ContextDev::Models::WebWebCrawlMdParams::Pdf] Whether to parse PDFs and which pages to read.
      #
      # @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
      #
      # @param settle_animations [Boolean] Wait briefly for CSS animations and transitions to settle before reading each pa
      #
      # @param shorten_base64_images [Boolean] Shorten inline base64 image data (`html-conversion` only).
      #
      # @param source_preference [Array<Symbol, ContextDev::Models::WebWebCrawlMdParams::SourcePreference>] Markdown sources in order of preference: `html-conversion` converts the page HTM
      #
      # @param stop_after_ms [Integer] Soft time budget for the crawl, in milliseconds. When it runs out, the crawl ret
      #
      # @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
      #
      # @param timeout_opts [ContextDev::Models::WebWebCrawlMdParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      # @param url_regex [String] Only follow and scrape URLs matching this regex. A prefix pattern of the form `^
      #
      # @param use_main_content_only [Boolean] Keep only the main content, without navigation, headers, footers, or sidebars.
      #
      # @param wait_for_ms [Integer, nil] Time to wait after each page loads before reading it, in milliseconds. `0` waits
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
