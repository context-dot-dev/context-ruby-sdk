# typed: strong

module ContextDev
  module Resources
    class Web
      # Capture a screenshot of a website. Supports both viewport (standard browser
      # view) and full-page screenshots. Can also screenshot specific page types (login,
      # pricing, etc.) by using heuristics to find the appropriate URL. Either 'domain'
      # or 'directUrl' must be provided as a query parameter, but not both. Returns a
      # URL to the uploaded screenshot image hosted on our CDN.
      sig do
        params(
          direct_url: String,
          domain: String,
          full_screenshot:
            ContextDev::WebScreenshotParams::FullScreenshot::OrSymbol,
          page: ContextDev::WebScreenshotParams::Page::OrSymbol,
          prioritize: ContextDev::WebScreenshotParams::Prioritize::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebScreenshotResponse)
      end
      def screenshot(
        # A specific URL to screenshot directly, bypassing domain resolution (e.g.,
        # 'https://example.com/pricing'). When provided, the screenshot is taken of this
        # exact URL.
        direct_url: nil,
        # Domain name to take screenshot of (e.g., 'example.com', 'google.com'). The
        # domain will be automatically normalized and validated.
        domain: nil,
        # Optional parameter to determine screenshot type. If 'true', takes a full page
        # screenshot capturing all content. If 'false' or not provided, takes a viewport
        # screenshot (standard browser view).
        full_screenshot: nil,
        # Optional parameter to specify which page type to screenshot. If provided, the
        # system will scrape the domain's links and use heuristics to find the most
        # appropriate URL for the specified page type (30 supported languages). If not
        # provided, screenshots the main domain landing page. Only applicable when using
        # 'domain', not 'directUrl'.
        page: nil,
        # Optional parameter to prioritize screenshot capture. If 'speed', optimizes for
        # faster capture with basic quality. If 'quality', optimizes for higher quality
        # with longer wait times. Defaults to 'quality' if not provided.
        prioritize: nil,
        request_options: {}
      )
      end

      # Performs a crawl starting from a given URL, extracts page content as Markdown,
      # and returns results for all crawled pages. Only follows links within the same
      # domain as the starting URL. Costs 1 credit per successful page crawled.
      sig do
        params(
          url: String,
          follow_subdomains: T::Boolean,
          include_images: T::Boolean,
          include_links: T::Boolean,
          max_depth: Integer,
          max_pages: Integer,
          shorten_base64_images: T::Boolean,
          url_regex: String,
          use_main_content_only: T::Boolean,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebCrawlMdResponse)
      end
      def web_crawl_md(
        # The starting URL for the crawl (must include http:// or https:// protocol)
        url:,
        # When true, follow links on subdomains of the starting URL's domain (e.g.
        # docs.example.com when starting from example.com). www and apex are always
        # treated as equivalent.
        follow_subdomains: nil,
        # Include image references in the Markdown output
        include_images: nil,
        # Preserve hyperlinks in the Markdown output
        include_links: nil,
        # Maximum link depth from the starting URL (0 = only the starting page)
        max_depth: nil,
        # Maximum number of pages to crawl. Hard cap: 500.
        max_pages: nil,
        # Truncate base64-encoded image data in the Markdown output
        shorten_base64_images: nil,
        # Regex pattern. Only URLs matching this pattern will be followed and scraped.
        url_regex: nil,
        # Extract only the main content, stripping headers, footers, sidebars, and
        # navigation
        use_main_content_only: nil,
        request_options: {}
      )
      end

      # Scrapes the given URL and returns the raw HTML content of the page.
      sig do
        params(
          url: String,
          max_age_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebScrapeHTMLResponse)
      end
      def web_scrape_html(
        # Full URL to scrape (must include http:// or https:// protocol)
        url:,
        # Return a cached result if a prior scrape for the same parameters exists and is
        # younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
        # omitted. Set to 0 to always scrape fresh.
        max_age_ms: nil,
        request_options: {}
      )
      end

      # Scrapes all images from the given URL. Extracts images from img, svg,
      # picture/source, link, and video elements including inline SVGs, base64 data
      # URIs, and standard URLs.
      sig do
        params(
          url: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebScrapeImagesResponse)
      end
      def web_scrape_images(
        # Full URL to scrape images from (must include http:// or https:// protocol)
        url:,
        request_options: {}
      )
      end

      # Scrapes the given URL, converts the HTML content to Markdown, and returns the
      # result.
      sig do
        params(
          url: String,
          include_images: T::Boolean,
          include_links: T::Boolean,
          max_age_ms: Integer,
          shorten_base64_images: T::Boolean,
          use_main_content_only: T::Boolean,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebScrapeMdResponse)
      end
      def web_scrape_md(
        # Full URL to scrape and convert to markdown (must include http:// or https://
        # protocol)
        url:,
        # Include image references in Markdown output
        include_images: nil,
        # Preserve hyperlinks in Markdown output
        include_links: nil,
        # Return a cached result if a prior scrape for the same parameters exists and is
        # younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
        # omitted. Set to 0 to always scrape fresh.
        max_age_ms: nil,
        # Shorten base64-encoded image data in the Markdown output
        shorten_base64_images: nil,
        # Extract only the main content of the page, excluding headers, footers, sidebars,
        # and navigation
        use_main_content_only: nil,
        request_options: {}
      )
      end

      # Crawls the sitemap of the given domain and returns all discovered page URLs.
      # Supports sitemap index files (recursive), parallel fetching with concurrency
      # control, deduplication, and filters out non-page resources (images, PDFs, etc.).
      sig do
        params(
          domain: String,
          max_links: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebScrapeSitemapResponse)
      end
      def web_scrape_sitemap(
        # Domain name to crawl sitemaps for (e.g., 'example.com'). The domain will be
        # automatically normalized and validated.
        domain:,
        # Maximum number of links to return from the sitemap crawl. Defaults to 10,000.
        # Minimum is 1, maximum is 100,000.
        max_links: nil,
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
