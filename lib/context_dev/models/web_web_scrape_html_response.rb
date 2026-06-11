# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#web_scrape_html
    class WebWebScrapeHTMLResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute html
      #   The scraped content of the page. For normal pages this is the raw HTML. When the
      #   page is a sitemap or feed served behind an XSL stylesheet (which browsers render
      #   into HTML), this is the underlying XML instead — see the `type` field.
      #
      #   @return [String]
      required :html, String

      # @!attribute success
      #   Indicates success
      #
      #   @return [Boolean, ContextDev::Models::WebWebScrapeHTMLResponse::Success]
      required :success, enum: -> { ContextDev::Models::WebWebScrapeHTMLResponse::Success }

      # @!attribute type
      #   Detected content type of the returned `html` field. Sitemaps and feeds are
      #   surfaced as `xml`; ordinary pages are `html`.
      #
      #   @return [Symbol, ContextDev::Models::WebWebScrapeHTMLResponse::Type]
      required :type, enum: -> { ContextDev::Models::WebWebScrapeHTMLResponse::Type }

      # @!attribute url
      #   The URL that was scraped
      #
      #   @return [String]
      required :url, String

      # @!attribute key_metadata
      #   Metadata about the API key used for the request. Included in every response
      #   whenever a valid API key is provided, even when the response status is not 200.
      #
      #   @return [ContextDev::Models::WebWebScrapeHTMLResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebWebScrapeHTMLResponse::KeyMetadata }

      # @!method initialize(html:, success:, type:, url:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebScrapeHTMLResponse} for more details.
      #
      #   @param html [String] The scraped content of the page. For normal pages this is the raw HTML. When the
      #
      #   @param success [Boolean, ContextDev::Models::WebWebScrapeHTMLResponse::Success] Indicates success
      #
      #   @param type [Symbol, ContextDev::Models::WebWebScrapeHTMLResponse::Type] Detected content type of the returned `html` field. Sitemaps and feeds are surfa
      #
      #   @param url [String] The URL that was scraped
      #
      #   @param key_metadata [ContextDev::Models::WebWebScrapeHTMLResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when

      # Indicates success
      #
      # @see ContextDev::Models::WebWebScrapeHTMLResponse#success
      module Success
        extend ContextDev::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # Detected content type of the returned `html` field. Sitemaps and feeds are
      # surfaced as `xml`; ordinary pages are `html`.
      #
      # @see ContextDev::Models::WebWebScrapeHTMLResponse#type
      module Type
        extend ContextDev::Internal::Type::Enum

        HTML = :html
        XML = :xml
        JSON = :json
        TEXT = :text
        CSV = :csv
        MARKDOWN = :markdown
        SVG = :svg
        PDF = :pdf

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::WebWebScrapeHTMLResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   The number of credits consumed by this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   The number of credits remaining for your organization after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Metadata about the API key used for the request. Included in every response
        #   whenever a valid API key is provided, even when the response status is not 200.
        #
        #   @param credits_consumed [Integer] The number of credits consumed by this request.
        #
        #   @param credits_remaining [Integer] The number of credits remaining for your organization after this request.
      end
    end
  end
end
