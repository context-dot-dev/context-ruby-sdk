# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Brand#web_scrape_images
    class BrandWebScrapeImagesResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute images
      #   Array of scraped images
      #
      #   @return [Array<ContextDev::Models::BrandWebScrapeImagesResponse::Image>]
      required :images,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandWebScrapeImagesResponse::Image] }

      # @!attribute success
      #   Indicates success
      #
      #   @return [Boolean, ContextDev::Models::BrandWebScrapeImagesResponse::Success]
      required :success, enum: -> { ContextDev::Models::BrandWebScrapeImagesResponse::Success }

      # @!attribute url
      #   The URL that was scraped
      #
      #   @return [String]
      required :url, String

      # @!method initialize(images:, success:, url:)
      #   @param images [Array<ContextDev::Models::BrandWebScrapeImagesResponse::Image>] Array of scraped images
      #
      #   @param success [Boolean, ContextDev::Models::BrandWebScrapeImagesResponse::Success] Indicates success
      #
      #   @param url [String] The URL that was scraped

      class Image < ContextDev::Internal::Type::BaseModel
        # @!attribute alt
        #   Alt text of the image, or null if not present
        #
        #   @return [String, nil]
        required :alt, String, nil?: true

        # @!attribute element
        #   The HTML element the image was found in
        #
        #   @return [Symbol, ContextDev::Models::BrandWebScrapeImagesResponse::Image::Element]
        required :element, enum: -> { ContextDev::Models::BrandWebScrapeImagesResponse::Image::Element }

        # @!attribute src
        #   The image source - can be a URL, inline HTML (for SVGs), or a base64 data URI
        #
        #   @return [String]
        required :src, String

        # @!attribute type
        #   The type/format of the src value
        #
        #   @return [Symbol, ContextDev::Models::BrandWebScrapeImagesResponse::Image::Type]
        required :type, enum: -> { ContextDev::Models::BrandWebScrapeImagesResponse::Image::Type }

        # @!method initialize(alt:, element:, src:, type:)
        #   @param alt [String, nil] Alt text of the image, or null if not present
        #
        #   @param element [Symbol, ContextDev::Models::BrandWebScrapeImagesResponse::Image::Element] The HTML element the image was found in
        #
        #   @param src [String] The image source - can be a URL, inline HTML (for SVGs), or a base64 data URI
        #
        #   @param type [Symbol, ContextDev::Models::BrandWebScrapeImagesResponse::Image::Type] The type/format of the src value

        # The HTML element the image was found in
        #
        # @see ContextDev::Models::BrandWebScrapeImagesResponse::Image#element
        module Element
          extend ContextDev::Internal::Type::Enum

          IMG = :img
          SVG = :svg
          LINK = :link
          SOURCE = :source
          VIDEO = :video

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The type/format of the src value
        #
        # @see ContextDev::Models::BrandWebScrapeImagesResponse::Image#type
        module Type
          extend ContextDev::Internal::Type::Enum

          URL = :url
          HTML = :html
          BASE64 = :base64

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # Indicates success
      #
      # @see ContextDev::Models::BrandWebScrapeImagesResponse#success
      module Success
        extend ContextDev::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
