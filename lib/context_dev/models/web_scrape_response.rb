# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#scrape
    class WebScrapeResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute bytes
      #   Original HTTP response body. Waiting, actions, and content filters never change
      #   it.
      #
      #   @return [ContextDev::Models::WebScrapeResponse::Bytes]
      required :bytes, -> { ContextDev::Models::WebScrapeResponse::Bytes }

      # @!attribute cache_metadata
      #   Cache outcome for this response. Composite responses are hits only when every
      #   cache-controlled fetch contributing to the output was a hit; age_ms is the
      #   oldest contributing hit.
      #
      #   @return [ContextDev::Models::WebScrapeResponse::CacheMetadata]
      required :cache_metadata, -> { ContextDev::Models::WebScrapeResponse::CacheMetadata }

      # @!attribute highlights
      #   Relevant passages for your question or topic.
      #
      #   @return [ContextDev::Models::WebScrapeResponse::Highlights]
      required :highlights, -> { ContextDev::Models::WebScrapeResponse::Highlights }

      # @!attribute html
      #   Rendered HTML after content filters.
      #
      #   @return [ContextDev::Models::WebScrapeResponse::HTML]
      required :html, -> { ContextDev::Models::WebScrapeResponse::HTML }

      # @!attribute images
      #   Images after content filters. Empty when none are found.
      #
      #   @return [ContextDev::Models::WebScrapeResponse::Images]
      required :images, -> { ContextDev::Models::WebScrapeResponse::Images }

      # @!attribute json
      #   Page data extracted using your schema.
      #
      #   @return [ContextDev::Models::WebScrapeResponse::Json]
      required :json, -> { ContextDev::Models::WebScrapeResponse::Json }

      # @!attribute markdown
      #   Markdown after content filters.
      #
      #   @return [ContextDev::Models::WebScrapeResponse::Markdown]
      required :markdown, -> { ContextDev::Models::WebScrapeResponse::Markdown }

      # @!attribute metadata
      #   Page details, when available.
      #
      #   @return [ContextDev::Models::WebScrapeResponse::Metadata]
      required :metadata, -> { ContextDev::Models::WebScrapeResponse::Metadata }

      # @!attribute parsed
      #   Fields produced by parseParams.rules, after shared content filters.
      #
      #   @return [ContextDev::Models::WebScrapeResponse::Parsed]
      required :parsed, -> { ContextDev::Models::WebScrapeResponse::Parsed }

      # @!attribute product
      #   Product details found on the page.
      #
      #   @return [ContextDev::Models::WebScrapeResponse::Product]
      required :product, -> { ContextDev::Models::WebScrapeResponse::Product }

      # @!attribute request_id
      #   Unique id of this API call, also sent in the X-Request-Id response header. Quote
      #   it when contacting support about a failed request.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute screenshot
      #   An image data URL. Use directly as an image src.
      #
      #   @return [ContextDev::Models::WebScrapeResponse::Screenshot]
      required :screenshot, -> { ContextDev::Models::WebScrapeResponse::Screenshot }

      # @!attribute url
      #   Final URL after redirects and browser actions.
      #
      #   @return [String]
      required :url, String

      # @!attribute is_partial
      #   Present when return-partial captures a page that is still loading, returns
      #   images before image processing finishes, or cuts product AI extraction short.
      #   Also present if the optional product AI fallback fails. Partial responses are
      #   not cached.
      #
      #   @return [Boolean, ContextDev::Models::WebScrapeResponse::IsPartial, nil]
      optional :is_partial, enum: -> { ContextDev::Models::WebScrapeResponse::IsPartial }, api_name: :isPartial

      # @!attribute key_metadata
      #   Credit usage, included whenever a valid API key is provided.
      #
      #   @return [ContextDev::Models::WebScrapeResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebScrapeResponse::KeyMetadata }

      # @!method initialize(bytes:, cache_metadata:, highlights:, html:, images:, json:, markdown:, metadata:, parsed:, product:, request_id:, screenshot:, url:, is_partial: nil, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebScrapeResponse} for more details.
      #
      #   @param bytes [ContextDev::Models::WebScrapeResponse::Bytes] Original HTTP response body. Waiting, actions, and content filters never change
      #
      #   @param cache_metadata [ContextDev::Models::WebScrapeResponse::CacheMetadata] Cache outcome for this response. Composite responses are hits only when every ca
      #
      #   @param highlights [ContextDev::Models::WebScrapeResponse::Highlights] Relevant passages for your question or topic.
      #
      #   @param html [ContextDev::Models::WebScrapeResponse::HTML] Rendered HTML after content filters.
      #
      #   @param images [ContextDev::Models::WebScrapeResponse::Images] Images after content filters. Empty when none are found.
      #
      #   @param json [ContextDev::Models::WebScrapeResponse::Json] Page data extracted using your schema.
      #
      #   @param markdown [ContextDev::Models::WebScrapeResponse::Markdown] Markdown after content filters.
      #
      #   @param metadata [ContextDev::Models::WebScrapeResponse::Metadata] Page details, when available.
      #
      #   @param parsed [ContextDev::Models::WebScrapeResponse::Parsed] Fields produced by parseParams.rules, after shared content filters.
      #
      #   @param product [ContextDev::Models::WebScrapeResponse::Product] Product details found on the page.
      #
      #   @param request_id [String] Unique id of this API call, also sent in the X-Request-Id response header. Quote
      #
      #   @param screenshot [ContextDev::Models::WebScrapeResponse::Screenshot] An image data URL. Use directly as an image src.
      #
      #   @param url [String] Final URL after redirects and browser actions.
      #
      #   @param is_partial [Boolean, ContextDev::Models::WebScrapeResponse::IsPartial] Present when return-partial captures a page that is still loading, returns image
      #
      #   @param key_metadata [ContextDev::Models::WebScrapeResponse::KeyMetadata] Credit usage, included whenever a valid API key is provided.

      # @see ContextDev::Models::WebScrapeResponse#bytes
      class Bytes < ContextDev::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [ContextDev::Models::WebScrapeResponse::Bytes::Data, nil]
        required :data, -> { ContextDev::Models::WebScrapeResponse::Bytes::Data }, nil?: true

        # @!attribute requested
        #
        #   @return [Boolean]
        required :requested, ContextDev::Internal::Type::Boolean

        # @!method initialize(data:, requested:)
        #   Original HTTP response body. Waiting, actions, and content filters never change
        #   it.
        #
        #   @param data [ContextDev::Models::WebScrapeResponse::Bytes::Data, nil]
        #   @param requested [Boolean]

        # @see ContextDev::Models::WebScrapeResponse::Bytes#data
        class Data < ContextDev::Internal::Type::BaseModel
          # @!attribute base64
          #   Original response body as base64, after HTTP decompression. Maximum decoded
          #   size: 20 MiB.
          #
          #   @return [String]
          required :base64, String

          # @!attribute content_type
          #
          #   @return [String]
          required :content_type, String, api_name: :contentType

          # @!method initialize(base64:, content_type:)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::WebScrapeResponse::Bytes::Data} for more details.
          #
          #   @param base64 [String] Original response body as base64, after HTTP decompression. Maximum decoded size
          #
          #   @param content_type [String]
        end
      end

      # @see ContextDev::Models::WebScrapeResponse#cache_metadata
      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute age_ms
        #   Age of the cached data in milliseconds. Zero for miss and zdr responses.
        #
        #   @return [Integer]
        required :age_ms, Integer

        # @!attribute status
        #   Whether the response was served from cache, required fresh work, or honored
        #   zero-data-retention cache bypass.
        #
        #   @return [Symbol, ContextDev::Models::WebScrapeResponse::CacheMetadata::Status]
        required :status, enum: -> { ContextDev::Models::WebScrapeResponse::CacheMetadata::Status }

        # @!method initialize(age_ms:, status:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeResponse::CacheMetadata} for more details.
        #
        #   Cache outcome for this response. Composite responses are hits only when every
        #   cache-controlled fetch contributing to the output was a hit; age_ms is the
        #   oldest contributing hit.
        #
        #   @param age_ms [Integer] Age of the cached data in milliseconds. Zero for miss and zdr responses.
        #
        #   @param status [Symbol, ContextDev::Models::WebScrapeResponse::CacheMetadata::Status] Whether the response was served from cache, required fresh work, or honored zero

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        #
        # @see ContextDev::Models::WebScrapeResponse::CacheMetadata#status
        module Status
          extend ContextDev::Internal::Type::Enum

          HIT = :hit
          MISS = :miss
          ZDR = :zdr

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::WebScrapeResponse#highlights
      class Highlights < ContextDev::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [Array<String>, nil]
        required :data, ContextDev::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute requested
        #
        #   @return [Boolean]
        required :requested, ContextDev::Internal::Type::Boolean

        # @!method initialize(data:, requested:)
        #   Relevant passages for your question or topic.
        #
        #   @param data [Array<String>, nil]
        #   @param requested [Boolean]
      end

      # @see ContextDev::Models::WebScrapeResponse#html
      class HTML < ContextDev::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [String, nil]
        required :data, String, nil?: true

        # @!attribute requested
        #
        #   @return [Boolean]
        required :requested, ContextDev::Internal::Type::Boolean

        # @!method initialize(data:, requested:)
        #   Rendered HTML after content filters.
        #
        #   @param data [String, nil]
        #   @param requested [Boolean]
      end

      # @see ContextDev::Models::WebScrapeResponse#images
      class Images < ContextDev::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [Array<ContextDev::Models::WebScrapeResponse::Images::Data>, nil]
        required :data,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebScrapeResponse::Images::Data] },
                 nil?: true

        # @!attribute requested
        #
        #   @return [Boolean]
        required :requested, ContextDev::Internal::Type::Boolean

        # @!method initialize(data:, requested:)
        #   Images after content filters. Empty when none are found.
        #
        #   @param data [Array<ContextDev::Models::WebScrapeResponse::Images::Data>, nil]
        #   @param requested [Boolean]

        class Data < ContextDev::Internal::Type::BaseModel
          # @!attribute alt
          #   Alt text, if present.
          #
          #   @return [String, nil]
          required :alt, String, nil?: true

          # @!attribute url
          #   Image URL, or a data URI for inline images.
          #
          #   @return [String]
          required :url, String

          # @!attribute classification
          #
          #   @return [Symbol, ContextDev::Models::WebScrapeResponse::Images::Data::Classification, nil]
          optional :classification, enum: -> { ContextDev::Models::WebScrapeResponse::Images::Data::Classification }

          # @!attribute file_url
          #   Hosted copy when file enrichment is requested and zdr is disabled. Valid for 24
          #   hours from the original capture.
          #
          #   @return [String, nil]
          optional :file_url, String, api_name: :fileUrl

          # @!attribute height
          #
          #   @return [Integer, nil]
          optional :height, Integer

          # @!attribute width
          #
          #   @return [Integer, nil]
          optional :width, Integer

          # @!method initialize(alt:, url:, classification: nil, file_url: nil, height: nil, width: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::WebScrapeResponse::Images::Data} for more details.
          #
          #   @param alt [String, nil] Alt text, if present.
          #
          #   @param url [String] Image URL, or a data URI for inline images.
          #
          #   @param classification [Symbol, ContextDev::Models::WebScrapeResponse::Images::Data::Classification]
          #
          #   @param file_url [String] Hosted copy when file enrichment is requested and zdr is disabled. Valid for 24
          #
          #   @param height [Integer]
          #
          #   @param width [Integer]

          # @see ContextDev::Models::WebScrapeResponse::Images::Data#classification
          module Classification
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

      # @see ContextDev::Models::WebScrapeResponse#json
      class Json < ContextDev::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [Hash{Symbol=>Object}, nil]
        required :data, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown], nil?: true

        # @!attribute requested
        #
        #   @return [Boolean]
        required :requested, ContextDev::Internal::Type::Boolean

        # @!method initialize(data:, requested:)
        #   Page data extracted using your schema.
        #
        #   @param data [Hash{Symbol=>Object}, nil]
        #   @param requested [Boolean]
      end

      # @see ContextDev::Models::WebScrapeResponse#markdown
      class Markdown < ContextDev::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [String, nil]
        required :data, String, nil?: true

        # @!attribute requested
        #
        #   @return [Boolean]
        required :requested, ContextDev::Internal::Type::Boolean

        # @!method initialize(data:, requested:)
        #   Markdown after content filters.
        #
        #   @param data [String, nil]
        #   @param requested [Boolean]
      end

      # @see ContextDev::Models::WebScrapeResponse#metadata
      class Metadata < ContextDev::Internal::Type::BaseModel
        # @!attribute additional_meta
        #   Additional non-social meta tags not promoted to top-level metadata fields.
        #
        #   @return [Hash{Symbol=>String, Array<String>}, nil]
        optional :additional_meta,
                 -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::WebScrapeResponse::Metadata::AdditionalMeta] },
                 api_name: :additionalMeta

        # @!attribute alternates
        #   Resolved alternate links from link rel=alternate tags.
        #
        #   @return [Array<ContextDev::Models::WebScrapeResponse::Metadata::Alternate>, nil]
        optional :alternates,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebScrapeResponse::Metadata::Alternate] }

        # @!attribute author
        #   Author metadata, when present.
        #
        #   @return [String, nil]
        optional :author, String

        # @!attribute canonical_url
        #   Resolved canonical URL, when present.
        #
        #   @return [String, nil]
        optional :canonical_url, String, api_name: :canonicalUrl

        # @!attribute description
        #   Best description extracted from standard, Open Graph, or Twitter metadata.
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute favicon
        #   Resolved favicon URL, when present.
        #
        #   @return [String, nil]
        optional :favicon, String

        # @!attribute headings
        #   Page headings (h1–h6) in document order, extracted from the unfiltered document.
        #   Capped at the first 500 headings. Omitted when the page has none.
        #
        #   @return [Array<ContextDev::Models::WebScrapeResponse::Metadata::Heading>, nil]
        optional :headings,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebScrapeResponse::Metadata::Heading] }

        # @!attribute image
        #   Primary resolved preview image from Open Graph, Twitter, or image metadata.
        #
        #   @return [String, nil]
        optional :image, String

        # @!attribute json_ld
        #   JSON-LD structured data blocks parsed from the page.
        #
        #   @return [Array<Hash{Symbol=>Object}>, nil]
        optional :json_ld,
                 ContextDev::Internal::Type::ArrayOf[ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]],
                 api_name: :jsonLd

        # @!attribute keywords
        #   Keywords extracted from the page's keywords meta tag.
        #
        #   @return [Array<String>, nil]
        optional :keywords, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute language
        #   Language extracted from html lang or language meta tags.
        #
        #   @return [String, nil]
        optional :language, String

        # @!attribute modified_time
        #   Modified timestamp/date from page metadata, when present.
        #
        #   @return [String, nil]
        optional :modified_time, String, api_name: :modifiedTime

        # @!attribute open_graph
        #   Open Graph metadata with the og: prefix removed and keys camel-cased.
        #
        #   @return [Hash{Symbol=>String, Array<String>}, nil]
        optional :open_graph,
                 -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::WebScrapeResponse::Metadata::OpenGraph] },
                 api_name: :openGraph

        # @!attribute published_time
        #   Published timestamp/date from page metadata, when present.
        #
        #   @return [String, nil]
        optional :published_time, String, api_name: :publishedTime

        # @!attribute robots
        #   Robots meta directive, when present.
        #
        #   @return [String, nil]
        optional :robots, String

        # @!attribute site_name
        #   Site or application name from page metadata.
        #
        #   @return [String, nil]
        optional :site_name, String, api_name: :siteName

        # @!attribute title
        #   Best title extracted from the page.
        #
        #   @return [String, nil]
        optional :title, String

        # @!attribute twitter
        #   Twitter card metadata with the twitter: prefix removed and keys camel-cased.
        #
        #   @return [Hash{Symbol=>String, Array<String>}, nil]
        optional :twitter,
                 -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::WebScrapeResponse::Metadata::Twitter] }

        # @!method initialize(additional_meta: nil, alternates: nil, author: nil, canonical_url: nil, description: nil, favicon: nil, headings: nil, image: nil, json_ld: nil, keywords: nil, language: nil, modified_time: nil, open_graph: nil, published_time: nil, robots: nil, site_name: nil, title: nil, twitter: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeResponse::Metadata} for more details.
        #
        #   Page details, when available.
        #
        #   @param additional_meta [Hash{Symbol=>String, Array<String>}] Additional non-social meta tags not promoted to top-level metadata fields.
        #
        #   @param alternates [Array<ContextDev::Models::WebScrapeResponse::Metadata::Alternate>] Resolved alternate links from link rel=alternate tags.
        #
        #   @param author [String] Author metadata, when present.
        #
        #   @param canonical_url [String] Resolved canonical URL, when present.
        #
        #   @param description [String] Best description extracted from standard, Open Graph, or Twitter metadata.
        #
        #   @param favicon [String] Resolved favicon URL, when present.
        #
        #   @param headings [Array<ContextDev::Models::WebScrapeResponse::Metadata::Heading>] Page headings (h1–h6) in document order, extracted from the unfiltered document.
        #
        #   @param image [String] Primary resolved preview image from Open Graph, Twitter, or image metadata.
        #
        #   @param json_ld [Array<Hash{Symbol=>Object}>] JSON-LD structured data blocks parsed from the page.
        #
        #   @param keywords [Array<String>] Keywords extracted from the page's keywords meta tag.
        #
        #   @param language [String] Language extracted from html lang or language meta tags.
        #
        #   @param modified_time [String] Modified timestamp/date from page metadata, when present.
        #
        #   @param open_graph [Hash{Symbol=>String, Array<String>}] Open Graph metadata with the og: prefix removed and keys camel-cased.
        #
        #   @param published_time [String] Published timestamp/date from page metadata, when present.
        #
        #   @param robots [String] Robots meta directive, when present.
        #
        #   @param site_name [String] Site or application name from page metadata.
        #
        #   @param title [String] Best title extracted from the page.
        #
        #   @param twitter [Hash{Symbol=>String, Array<String>}] Twitter card metadata with the twitter: prefix removed and keys camel-cased.

        module AdditionalMeta
          extend ContextDev::Internal::Type::Union

          variant String

          variant -> { ContextDev::Models::WebScrapeResponse::Metadata::AdditionalMeta::StringArray }

          # @!method self.variants
          #   @return [Array(String, Array<String>)]

          # @type [ContextDev::Internal::Type::Converter]
          StringArray = ContextDev::Internal::Type::ArrayOf[String]
        end

        class Alternate < ContextDev::Internal::Type::BaseModel
          # @!attribute href
          #   Resolved alternate URL.
          #
          #   @return [String]
          required :href, String

          # @!attribute hreflang
          #   Language or locale for the alternate URL, when present.
          #
          #   @return [String, nil]
          optional :hreflang, String

          # @!attribute title
          #   Alternate resource title, when present.
          #
          #   @return [String, nil]
          optional :title, String

          # @!attribute type
          #   Alternate resource MIME type, when present.
          #
          #   @return [String, nil]
          optional :type, String

          # @!method initialize(href:, hreflang: nil, title: nil, type: nil)
          #   @param href [String] Resolved alternate URL.
          #
          #   @param hreflang [String] Language or locale for the alternate URL, when present.
          #
          #   @param title [String] Alternate resource title, when present.
          #
          #   @param type [String] Alternate resource MIME type, when present.
        end

        class Heading < ContextDev::Internal::Type::BaseModel
          # @!attribute level
          #   Heading level, 1–6 (from h1–h6).
          #
          #   @return [Integer]
          required :level, Integer

          # @!attribute text
          #   Heading text with whitespace collapsed, truncated to 1000 characters.
          #
          #   @return [String]
          required :text, String

          # @!method initialize(level:, text:)
          #   @param level [Integer] Heading level, 1–6 (from h1–h6).
          #
          #   @param text [String] Heading text with whitespace collapsed, truncated to 1000 characters.
        end

        module OpenGraph
          extend ContextDev::Internal::Type::Union

          variant String

          variant -> { ContextDev::Models::WebScrapeResponse::Metadata::OpenGraph::StringArray }

          # @!method self.variants
          #   @return [Array(String, Array<String>)]

          # @type [ContextDev::Internal::Type::Converter]
          StringArray = ContextDev::Internal::Type::ArrayOf[String]
        end

        module Twitter
          extend ContextDev::Internal::Type::Union

          variant String

          variant -> { ContextDev::Models::WebScrapeResponse::Metadata::Twitter::StringArray }

          # @!method self.variants
          #   @return [Array(String, Array<String>)]

          # @type [ContextDev::Internal::Type::Converter]
          StringArray = ContextDev::Internal::Type::ArrayOf[String]
        end
      end

      # @see ContextDev::Models::WebScrapeResponse#parsed
      class Parsed < ContextDev::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [Hash{Symbol=>Object}, nil]
        required :data, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown], nil?: true

        # @!attribute requested
        #
        #   @return [Boolean]
        required :requested, ContextDev::Internal::Type::Boolean

        # @!method initialize(data:, requested:)
        #   Fields produced by parseParams.rules, after shared content filters.
        #
        #   @param data [Hash{Symbol=>Object}, nil]
        #   @param requested [Boolean]
      end

      # @see ContextDev::Models::WebScrapeResponse#product
      class Product < ContextDev::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [ContextDev::Models::WebScrapeResponse::Product::Data, nil]
        required :data, -> { ContextDev::Models::WebScrapeResponse::Product::Data }, nil?: true

        # @!attribute requested
        #
        #   @return [Boolean]
        required :requested, ContextDev::Internal::Type::Boolean

        # @!method initialize(data:, requested:)
        #   Product details found on the page.
        #
        #   @param data [ContextDev::Models::WebScrapeResponse::Product::Data, nil]
        #   @param requested [Boolean]

        # @see ContextDev::Models::WebScrapeResponse::Product#data
        class Data < ContextDev::Internal::Type::BaseModel
          # @!attribute is_product_page
          #   Whether the page is a product detail page.
          #
          #   @return [Boolean]
          required :is_product_page, ContextDev::Internal::Type::Boolean, api_name: :isProductPage

          # @!attribute product
          #   The extracted product, or null when the page is not a product detail page.
          #
          #   @return [ContextDev::Models::WebScrapeResponse::Product::Data::Product, nil]
          required :product, -> { ContextDev::Models::WebScrapeResponse::Product::Data::Product }, nil?: true

          # @!method initialize(is_product_page:, product:)
          #   @param is_product_page [Boolean] Whether the page is a product detail page.
          #
          #   @param product [ContextDev::Models::WebScrapeResponse::Product::Data::Product, nil] The extracted product, or null when the page is not a product detail page.

          # @see ContextDev::Models::WebScrapeResponse::Product::Data#product
          class Product < ContextDev::Internal::Type::BaseModel
            # @!attribute availability
            #   Stock or ordering availability.
            #
            #   @return [Symbol, ContextDev::Models::WebScrapeResponse::Product::Data::Product::Availability, nil]
            required :availability,
                     enum: -> { ContextDev::Models::WebScrapeResponse::Product::Data::Product::Availability },
                     nil?: true

            # @!attribute brand
            #   Brand or vendor.
            #
            #   @return [String, nil]
            required :brand, String, nil?: true

            # @!attribute category
            #   Product category.
            #
            #   @return [String, nil]
            required :category, String, nil?: true

            # @!attribute currency
            #   ISO 4217 currency code.
            #
            #   @return [String, nil]
            required :currency, String, nil?: true

            # @!attribute description
            #   Product description.
            #
            #   @return [String, nil]
            required :description, String, nil?: true

            # @!attribute dimensions
            #   Product dimensions as shown on the page.
            #
            #   @return [Array<String>]
            required :dimensions, ContextDev::Internal::Type::ArrayOf[String]

            # @!attribute features
            #   Key features and specifications.
            #
            #   @return [Array<String>]
            required :features, ContextDev::Internal::Type::ArrayOf[String]

            # @!attribute images
            #   Product image URLs, main image first.
            #
            #   @return [Array<String>]
            required :images, ContextDev::Internal::Type::ArrayOf[String]

            # @!attribute image_url
            #   Main product image URL.
            #
            #   @return [String, nil]
            required :image_url, String, api_name: :imageUrl, nil?: true

            # @!attribute name
            #   Product name.
            #
            #   @return [String]
            required :name, String

            # @!attribute price
            #   Current price.
            #
            #   @return [Float, nil]
            required :price, Float, nil?: true

            # @!attribute regular_price
            #   List price before any discount.
            #
            #   @return [Float, nil]
            required :regular_price, Float, api_name: :regularPrice, nil?: true

            # @!attribute sku
            #   Product identifier such as a SKU or model number.
            #
            #   @return [String, nil]
            required :sku, String, nil?: true

            # @!attribute tags
            #   Product tags.
            #
            #   @return [Array<String>]
            required :tags, ContextDev::Internal::Type::ArrayOf[String]

            # @!attribute target_audience
            #   Intended audience.
            #
            #   @return [Array<String>]
            required :target_audience, ContextDev::Internal::Type::ArrayOf[String], api_name: :targetAudience

            # @!attribute variants
            #   Product variations, such as different colors or sizes, with their attributes and
            #   images. Empty if none are found. May not include every variation offered by the
            #   store.
            #
            #   @return [Array<ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant>]
            required :variants,
                     -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant] }

            # @!method initialize(availability:, brand:, category:, currency:, description:, dimensions:, features:, images:, image_url:, name:, price:, regular_price:, sku:, tags:, target_audience:, variants:)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::WebScrapeResponse::Product::Data::Product} for more
            #   details.
            #
            #   The extracted product, or null when the page is not a product detail page.
            #
            #   @param availability [Symbol, ContextDev::Models::WebScrapeResponse::Product::Data::Product::Availability, nil] Stock or ordering availability.
            #
            #   @param brand [String, nil] Brand or vendor.
            #
            #   @param category [String, nil] Product category.
            #
            #   @param currency [String, nil] ISO 4217 currency code.
            #
            #   @param description [String, nil] Product description.
            #
            #   @param dimensions [Array<String>] Product dimensions as shown on the page.
            #
            #   @param features [Array<String>] Key features and specifications.
            #
            #   @param images [Array<String>] Product image URLs, main image first.
            #
            #   @param image_url [String, nil] Main product image URL.
            #
            #   @param name [String] Product name.
            #
            #   @param price [Float, nil] Current price.
            #
            #   @param regular_price [Float, nil] List price before any discount.
            #
            #   @param sku [String, nil] Product identifier such as a SKU or model number.
            #
            #   @param tags [Array<String>] Product tags.
            #
            #   @param target_audience [Array<String>] Intended audience.
            #
            #   @param variants [Array<ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant>] Product variations, such as different colors or sizes, with their attributes and

            # Stock or ordering availability.
            #
            # @see ContextDev::Models::WebScrapeResponse::Product::Data::Product#availability
            module Availability
              extend ContextDev::Internal::Type::Enum

              IN_STOCK = :in_stock
              OUT_OF_STOCK = :out_of_stock
              LIMITED_AVAILABILITY = :limited_availability
              PREORDER = :preorder
              BACKORDER = :backorder
              MADE_TO_ORDER = :made_to_order
              DISCONTINUED = :discontinued

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            class Variant < ContextDev::Internal::Type::BaseModel
              # @!attribute attributes
              #   Explicit variant attributes such as color, size, material, pattern and
              #   properties declared by page.
              #
              #   @return [Hash{Symbol=>String}]
              required :attributes, ContextDev::Internal::Type::HashOf[String]

              # @!attribute images
              #   Original source image URLs explicitly attached to this variant.
              #
              #   @return [Array<String>]
              required :images, ContextDev::Internal::Type::ArrayOf[String]

              # @!attribute sku
              #
              #   @return [String, nil]
              required :sku, String, nil?: true

              # @!attribute url
              #   Variant or offer URL when provided by the source. May be shared by variants.
              #
              #   @return [String, nil]
              required :url, String, nil?: true

              # @!method initialize(attributes:, images:, sku:, url:)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant} for
              #   more details.
              #
              #   @param attributes [Hash{Symbol=>String}] Explicit variant attributes such as color, size, material, pattern and propertie
              #
              #   @param images [Array<String>] Original source image URLs explicitly attached to this variant.
              #
              #   @param sku [String, nil]
              #
              #   @param url [String, nil] Variant or offer URL when provided by the source. May be shared by variants.
            end
          end
        end
      end

      # @see ContextDev::Models::WebScrapeResponse#screenshot
      class Screenshot < ContextDev::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [String, nil]
        required :data, String, nil?: true

        # @!attribute requested
        #
        #   @return [Boolean]
        required :requested, ContextDev::Internal::Type::Boolean

        # @!method initialize(data:, requested:)
        #   An image data URL. Use directly as an image src.
        #
        #   @param data [String, nil]
        #   @param requested [Boolean]
      end

      # Present when return-partial captures a page that is still loading, returns
      # images before image processing finishes, or cuts product AI extraction short.
      # Also present if the optional product AI fallback fails. Partial responses are
      # not cached.
      #
      # @see ContextDev::Models::WebScrapeResponse#is_partial
      module IsPartial
        extend ContextDev::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # @see ContextDev::Models::WebScrapeResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits used by this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits remaining for your organization.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credit usage, included whenever a valid API key is provided.
        #
        #   @param credits_consumed [Integer] Credits used by this request.
        #
        #   @param credits_remaining [Integer] Credits remaining for your organization.
      end
    end
  end
end
