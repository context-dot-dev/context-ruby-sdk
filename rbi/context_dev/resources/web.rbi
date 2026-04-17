# typed: strong

module ContextDev
  module Resources
    class Web
      # Scrape font information from a website including font families, usage
      # statistics, fallbacks, and element/word counts.
      sig do
        params(
          direct_url: String,
          domain: String,
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
        # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
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

      # Scrapes the given URL into LLM usable Markdown.
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
        # Full URL to scrape into LLM usable Markdown (must include http:// or https://
        # protocol)
        url:,
        # Include image references in Markdown output
        include_images: nil,
        # Preserve hyperlinks in Markdown output
        include_links: nil,
        # Return a cached result if a prior scrape for the same parameters exists and is
        # younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
        # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
        max_age_ms: nil,
        # Shorten base64-encoded image data in the Markdown output
        shorten_base64_images: nil,
        # Extract only the main content of the page, excluding headers, footers, sidebars,
        # and navigation
        use_main_content_only: nil,
        request_options: {}
      )
      end

      # Crawl an entire website's sitemap and return all discovered page URLs
      sig do
        params(
          domain: String,
          max_links: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::WebWebScrapeSitemapResponse)
      end
      def web_scrape_sitemap(
        # Domain to build a sitemap for
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
