# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#web_scrape_images
    class WebWebScrapeImagesResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute images
      #   Images found on the page.
      #
      #   @return [Array<ContextDev::Models::WebWebScrapeImagesResponse::Image>]
      required :images,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebWebScrapeImagesResponse::Image] }

      # @!attribute success
      #   Always true on success.
      #
      #   @return [Boolean, ContextDev::Models::WebWebScrapeImagesResponse::Success]
      required :success, enum: -> { ContextDev::Models::WebWebScrapeImagesResponse::Success }

      # @!attribute url
      #   Page URL that was scraped.
      #
      #   @return [String]
      required :url, String

      # @!method initialize(images:, success:, url:)
      #   @param images [Array<ContextDev::Models::WebWebScrapeImagesResponse::Image>] Images found on the page.
      #
      #   @param success [Boolean, ContextDev::Models::WebWebScrapeImagesResponse::Success] Always true on success.
      #
      #   @param url [String] Page URL that was scraped.

      class Image < ContextDev::Internal::Type::BaseModel
        # @!attribute alt
        #   Image alt text, or null when unavailable.
        #
        #   @return [String, nil]
        required :alt, String, nil?: true

        # @!attribute element
        #   Where the image was found.
        #
        #   @return [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::Image::Element]
        required :element, enum: -> { ContextDev::Models::WebWebScrapeImagesResponse::Image::Element }

        # @!attribute src
        #   Original image value: URL, inline SVG or HTML, or base64 data URI.
        #
        #   @return [String]
        required :src, String

        # @!attribute type
        #   Format of src.
        #
        #   @return [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::Image::Type]
        required :type, enum: -> { ContextDev::Models::WebWebScrapeImagesResponse::Image::Type }

        # @!attribute enrichment
        #   Requested metadata for images that could be processed.
        #
        #   @return [ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment, nil]
        optional :enrichment, -> { ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment }

        # @!method initialize(alt:, element:, src:, type:, enrichment: nil)
        #   @param alt [String, nil] Image alt text, or null when unavailable.
        #
        #   @param element [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::Image::Element] Where the image was found.
        #
        #   @param src [String] Original image value: URL, inline SVG or HTML, or base64 data URI.
        #
        #   @param type [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::Image::Type] Format of src.
        #
        #   @param enrichment [ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment] Requested metadata for images that could be processed.

        # Where the image was found.
        #
        # @see ContextDev::Models::WebWebScrapeImagesResponse::Image#element
        module Element
          extend ContextDev::Internal::Type::Enum

          IMG = :img
          SVG = :svg
          LINK = :link
          SOURCE = :source
          VIDEO = :video
          CSS = :css
          OBJECT = :object
          META = :meta
          BACKGROUND = :background

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Format of src.
        #
        # @see ContextDev::Models::WebWebScrapeImagesResponse::Image#type
        module Type
          extend ContextDev::Internal::Type::Enum

          URL = :url
          HTML = :html
          BASE64 = :base64

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::WebWebScrapeImagesResponse::Image#enrichment
        class Enrichment < ContextDev::Internal::Type::BaseModel
          # @!attribute height
          #   Image height in pixels, when measured.
          #
          #   @return [Integer, nil]
          optional :height, Integer

          # @!attribute mimetype
          #   Detected MIME type, when hosted.
          #
          #   @return [String, nil]
          optional :mimetype, String

          # @!attribute type
          #   Visual asset category, when classified.
          #
          #   @return [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type, nil]
          optional :type, enum: -> { ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type }

          # @!attribute url
          #   Brand.dev CDN URL, when hosted.
          #
          #   @return [String, nil]
          optional :url, String

          # @!attribute width
          #   Image width in pixels, when measured.
          #
          #   @return [Integer, nil]
          optional :width, Integer

          # @!method initialize(height: nil, mimetype: nil, type: nil, url: nil, width: nil)
          #   Requested metadata for images that could be processed.
          #
          #   @param height [Integer] Image height in pixels, when measured.
          #
          #   @param mimetype [String] Detected MIME type, when hosted.
          #
          #   @param type [Symbol, ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type] Visual asset category, when classified.
          #
          #   @param url [String] Brand.dev CDN URL, when hosted.
          #
          #   @param width [Integer] Image width in pixels, when measured.

          # Visual asset category, when classified.
          #
          # @see ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment#type
          module Type
            extend ContextDev::Internal::Type::Enum

            PHOTOGRAPHY = :photography
            ILLUSTRATION = :illustration
            LOGO = :logo
            WORDMARK = :wordmark
            ICON = :icon
            PATTERN = :pattern
            GRAPHIC = :graphic
            OTHER = :other

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # Always true on success.
      #
      # @see ContextDev::Models::WebWebScrapeImagesResponse#success
      module Success
        extend ContextDev::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
