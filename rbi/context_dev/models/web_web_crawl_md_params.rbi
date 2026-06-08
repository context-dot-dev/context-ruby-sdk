# typed: strong

module ContextDev
  module Models
    class WebWebCrawlMdParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::WebWebCrawlMdParams, ContextDev::Internal::AnyHash)
        end

      # The starting URL for the crawl (must include http:// or https:// protocol)
      sig { returns(String) }
      attr_accessor :url

      # CSS selectors to remove before each crawled page is converted to Markdown.
      # Applied after includeSelectors. Exclusion takes precedence: an element matching
      # both is removed. Examples: "nav", "footer", ".ad-banner", "[aria-hidden=true]".
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :exclude_selectors

      sig { params(exclude_selectors: T::Array[String]).void }
      attr_writer :exclude_selectors

      # When true, follow links on subdomains of the starting URL's domain (e.g.
      # docs.example.com when starting from example.com). www and apex are always
      # treated as equivalent.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :follow_subdomains

      sig { params(follow_subdomains: T::Boolean).void }
      attr_writer :follow_subdomains

      # When true, the contents of iframes are rendered to Markdown for each crawled
      # page.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_frames

      sig { params(include_frames: T::Boolean).void }
      attr_writer :include_frames

      # Include image references in the Markdown output
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_images

      sig { params(include_images: T::Boolean).void }
      attr_writer :include_images

      # Preserve hyperlinks in the Markdown output
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_links

      sig { params(include_links: T::Boolean).void }
      attr_writer :include_links

      # CSS selectors. When provided, only matching HTML subtrees (and their
      # descendants) are kept before each crawled page is converted to Markdown. When
      # omitted, the entire document is kept. Examples: "article.main", "#content",
      # "[role=main]".
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :include_selectors

      sig { params(include_selectors: T::Array[String]).void }
      attr_writer :include_selectors

      # Return a cached result if a prior scrape for the same parameters exists and is
      # younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
      # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_age_ms

      sig { params(max_age_ms: Integer).void }
      attr_writer :max_age_ms

      # Maximum link depth from the starting URL (0 = only the starting page)
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_depth

      sig { params(max_depth: Integer).void }
      attr_writer :max_depth

      # Maximum number of pages to crawl. Hard cap: 500.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_pages

      sig { params(max_pages: Integer).void }
      attr_writer :max_pages

      # PDF parsing controls. Use start/end to limit text extraction and OCR to an
      # inclusive 1-based page range.
      sig { returns(T.nilable(ContextDev::WebWebCrawlMdParams::Pdf)) }
      attr_reader :pdf

      sig { params(pdf: ContextDev::WebWebCrawlMdParams::Pdf::OrHash).void }
      attr_writer :pdf

      # Truncate base64-encoded image data in the Markdown output
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :shorten_base64_images

      sig { params(shorten_base64_images: T::Boolean).void }
      attr_writer :shorten_base64_images

      # Soft time budget for the crawl in milliseconds. After each scrape, the crawler
      # checks the elapsed time and, if exceeded, returns the pages collected so far
      # instead of continuing. Min: 10000 (10s). Max: 110000 (110s). Default: 80000
      # (80s).
      sig { returns(T.nilable(Integer)) }
      attr_reader :stop_after_ms

      sig { params(stop_after_ms: Integer).void }
      attr_writer :stop_after_ms

      # Optional timeout in milliseconds for the request. If the request takes longer
      # than this value, it will be aborted with a 408 status code. Maximum allowed
      # value is 300000ms (5 minutes).
      sig { returns(T.nilable(Integer)) }
      attr_reader :timeout_ms

      sig { params(timeout_ms: Integer).void }
      attr_writer :timeout_ms

      # Regex pattern. Only URLs matching this pattern will be followed and scraped.
      sig { returns(T.nilable(String)) }
      attr_reader :url_regex

      sig { params(url_regex: String).void }
      attr_writer :url_regex

      # Extract only the main content, stripping headers, footers, sidebars, and
      # navigation
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :use_main_content_only

      sig { params(use_main_content_only: T::Boolean).void }
      attr_writer :use_main_content_only

      # Optional browser wait time in milliseconds after initial page load for each
      # crawled page. Min: 0. Max: 30000 (30 seconds).
      sig { returns(T.nilable(Integer)) }
      attr_reader :wait_for_ms

      sig { params(wait_for_ms: Integer).void }
      attr_writer :wait_for_ms

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
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
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
            pdf: ContextDev::WebWebCrawlMdParams::Pdf,
            shorten_base64_images: T::Boolean,
            stop_after_ms: Integer,
            timeout_ms: Integer,
            url_regex: String,
            use_main_content_only: T::Boolean,
            wait_for_ms: Integer,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Pdf < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebWebCrawlMdParams::Pdf,
              ContextDev::Internal::AnyHash
            )
          end

        # Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
        # Must be greater than or equal to start when both are provided.
        sig { returns(T.nilable(Integer)) }
        attr_reader :end_

        sig { params(end_: Integer).void }
        attr_writer :end_

        # When true, PDF pages are fetched and parsed. When false, PDF pages are skipped
        # entirely (not included in results and not counted as failures).
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :should_parse

        sig { params(should_parse: T::Boolean).void }
        attr_writer :should_parse

        # First 1-based PDF page to parse. When omitted, parsing starts at the first page.
        sig { returns(T.nilable(Integer)) }
        attr_reader :start

        sig { params(start: Integer).void }
        attr_writer :start

        # PDF parsing controls. Use start/end to limit text extraction and OCR to an
        # inclusive 1-based page range.
        sig do
          params(
            end_: Integer,
            should_parse: T::Boolean,
            start: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
          # Must be greater than or equal to start when both are provided.
          end_: nil,
          # When true, PDF pages are fetched and parsed. When false, PDF pages are skipped
          # entirely (not included in results and not counted as failures).
          should_parse: nil,
          # First 1-based PDF page to parse. When omitted, parsing starts at the first page.
          start: nil
        )
        end

        sig do
          override.returns(
            { end_: Integer, should_parse: T::Boolean, start: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
