# frozen_string_literal: true

module ContextDev
  module Resources
    class Web
      # Scrapes the given URL and returns the raw HTML content of the page. Uses
      # automatic proxy escalation to handle blocked sites.
      #
      # @overload web_scrape_html(url:, request_options: {})
      #
      # @param url [String] Full URL to scrape (must include http:// or https:// protocol)
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
          query: query,
          model: ContextDev::Models::WebWebScrapeHTMLResponse,
          options: options
        )
      end

      # Scrapes all images from the given URL. Extracts images from img, svg,
      # picture/source, link, and video elements including inline SVGs, base64 data
      # URIs, and standard URLs.
      #
      # @overload web_scrape_images(url:, request_options: {})
      #
      # @param url [String] Full URL to scrape images from (must include http:// or https:// protocol)
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
          query: query,
          model: ContextDev::Models::WebWebScrapeImagesResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebWebScrapeMdParams} for more details.
      #
      # Scrapes the given URL, converts the HTML content to GitHub Flavored Markdown
      # (GFM), and returns the result. Uses automatic proxy escalation to handle blocked
      # sites.
      #
      # @overload web_scrape_md(url:, include_images: nil, include_links: nil, shorten_base64_images: nil, request_options: {})
      #
      # @param url [String] Full URL to scrape and convert to markdown (must include http:// or https:// pro
      #
      # @param include_images [Boolean] Include image references in Markdown output
      #
      # @param include_links [Boolean] Preserve hyperlinks in Markdown output
      #
      # @param shorten_base64_images [Boolean] Shorten base64-encoded image data in the Markdown output
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
            include_images: "includeImages",
            include_links: "includeLinks",
            shorten_base64_images: "shortenBase64Images"
          ),
          model: ContextDev::Models::WebWebScrapeMdResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::WebWebScrapeSitemapParams} for more details.
      #
      # Crawls the sitemap of the given domain and returns all discovered page URLs.
      # Supports sitemap index files (recursive), parallel fetching with concurrency
      # control, deduplication, and filters out non-page resources (images, PDFs, etc.).
      #
      # @overload web_scrape_sitemap(domain:, request_options: {})
      #
      # @param domain [String] Domain name to crawl sitemaps for (e.g., 'example.com'). The domain will be auto
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
          query: query,
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
