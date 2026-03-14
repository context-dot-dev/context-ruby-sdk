# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Brand#web_scrape_html
    class BrandWebScrapeHTMLResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute html
      #   Raw HTML content of the page
      #
      #   @return [String]
      required :html, String

      # @!attribute success
      #   Indicates success
      #
      #   @return [Boolean, ContextDev::Models::BrandWebScrapeHTMLResponse::Success]
      required :success, enum: -> { ContextDev::Models::BrandWebScrapeHTMLResponse::Success }

      # @!attribute url
      #   The URL that was scraped
      #
      #   @return [String]
      required :url, String

      # @!method initialize(html:, success:, url:)
      #   @param html [String] Raw HTML content of the page
      #
      #   @param success [Boolean, ContextDev::Models::BrandWebScrapeHTMLResponse::Success] Indicates success
      #
      #   @param url [String] The URL that was scraped

      # Indicates success
      #
      # @see ContextDev::Models::BrandWebScrapeHTMLResponse#success
      module Success
        extend ContextDev::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
