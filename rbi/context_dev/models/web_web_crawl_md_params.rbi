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

      # When true, follow links on subdomains of the starting URL's domain (e.g.
      # docs.example.com when starting from example.com). www and apex are always
      # treated as equivalent.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :follow_subdomains

      sig { params(follow_subdomains: T::Boolean).void }
      attr_writer :follow_subdomains

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

      # Truncate base64-encoded image data in the Markdown output
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :shorten_base64_images

      sig { params(shorten_base64_images: T::Boolean).void }
      attr_writer :shorten_base64_images

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
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            url: String,
            follow_subdomains: T::Boolean,
            include_images: T::Boolean,
            include_links: T::Boolean,
            max_depth: Integer,
            max_pages: Integer,
            shorten_base64_images: T::Boolean,
            url_regex: String,
            use_main_content_only: T::Boolean,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
