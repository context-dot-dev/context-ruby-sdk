# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#scrape
    class WebScrapeParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute formats
      #   Outputs to return. Set at least one to `true`.
      #
      #   @return [ContextDev::Models::WebScrapeParams::Formats]
      required :formats, -> { ContextDev::WebScrapeParams::Formats }

      # @!attribute url
      #   Public HTTP or HTTPS URL to scrape.
      #
      #   @return [String]
      required :url, String

      # @!attribute highlights_params
      #   Requires `formats.highlights: true`; required when it is set.
      #
      #   @return [ContextDev::Models::WebScrapeParams::HighlightsParams, nil]
      optional :highlights_params,
               -> { ContextDev::WebScrapeParams::HighlightsParams },
               api_name: :highlightsParams

      # @!attribute image_params
      #   Image options. Requires formats.images: true.
      #
      #   @return [ContextDev::Models::WebScrapeParams::ImageParams, nil]
      optional :image_params, -> { ContextDev::WebScrapeParams::ImageParams }, api_name: :imageParams

      # @!attribute json_params
      #   Requires `formats.json: true`; required when it is set.
      #
      #   @return [ContextDev::Models::WebScrapeParams::JsonParams, nil]
      optional :json_params, -> { ContextDev::WebScrapeParams::JsonParams }, api_name: :jsonParams

      # @!attribute markdown_params
      #   Markdown options. Requires `formats.markdown`.
      #
      #   @return [ContextDev::Models::WebScrapeParams::MarkdownParams, nil]
      optional :markdown_params, -> { ContextDev::WebScrapeParams::MarkdownParams }, api_name: :markdownParams

      # @!attribute max_age_ms
      #   Maximum age of a cached output, in milliseconds. `0` fetches fresh. Defaults to
      #   3 days (259200000 ms). Maximum: 1 year (31536000000 ms).
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer, api_name: :maxAgeMs

      # @!attribute parse_params
      #   Requires `formats.parse: true`; required when it is set.
      #
      #   @return [ContextDev::Models::WebScrapeParams::ParseParams, nil]
      optional :parse_params, -> { ContextDev::WebScrapeParams::ParseParams }, api_name: :parseParams

      # @!attribute product_params
      #   Product options. Requires formats.product: true.
      #
      #   @return [ContextDev::Models::WebScrapeParams::ProductParams, nil]
      optional :product_params, -> { ContextDev::WebScrapeParams::ProductParams }, api_name: :productParams

      # @!attribute screenshot_params
      #   Screenshot options. Requires formats.screenshot: true.
      #
      #   @return [ContextDev::Models::WebScrapeParams::ScreenshotParams, nil]
      optional :screenshot_params,
               -> { ContextDev::WebScrapeParams::ScreenshotParams },
               api_name: :screenshotParams

      # @!attribute shared_params
      #   Browser and content settings shared by all outputs.
      #
      #   @return [ContextDev::Models::WebScrapeParams::SharedParams, nil]
      optional :shared_params, -> { ContextDev::WebScrapeParams::SharedParams }, api_name: :sharedParams

      # @!attribute tags
      #   Labels for tracking request usage. Not retained when zdr is enabled.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Deadline for the whole request. Defaults to 90000 ms with `fail`. Fixed waits
      #   must end before it.
      #
      #   @return [ContextDev::Models::WebScrapeParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::WebScrapeParams::TimeoutOpts }, api_name: :timeoutOpts

      # @!attribute zdr
      #   `enabled` turns on zero data retention. Your organization must have ZDR enabled.
      #
      #   @return [Symbol, ContextDev::Models::WebScrapeParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebScrapeParams::Zdr }

      # @!method initialize(formats:, url:, highlights_params: nil, image_params: nil, json_params: nil, markdown_params: nil, max_age_ms: nil, parse_params: nil, product_params: nil, screenshot_params: nil, shared_params: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebScrapeParams} for more details.
      #
      #   @param formats [ContextDev::Models::WebScrapeParams::Formats] Outputs to return. Set at least one to `true`.
      #
      #   @param url [String] Public HTTP or HTTPS URL to scrape.
      #
      #   @param highlights_params [ContextDev::Models::WebScrapeParams::HighlightsParams] Requires `formats.highlights: true`; required when it is set.
      #
      #   @param image_params [ContextDev::Models::WebScrapeParams::ImageParams] Image options. Requires formats.images: true.
      #
      #   @param json_params [ContextDev::Models::WebScrapeParams::JsonParams] Requires `formats.json: true`; required when it is set.
      #
      #   @param markdown_params [ContextDev::Models::WebScrapeParams::MarkdownParams] Markdown options. Requires `formats.markdown`.
      #
      #   @param max_age_ms [Integer] Maximum age of a cached output, in milliseconds. `0` fetches fresh. Defaults to
      #
      #   @param parse_params [ContextDev::Models::WebScrapeParams::ParseParams] Requires `formats.parse: true`; required when it is set.
      #
      #   @param product_params [ContextDev::Models::WebScrapeParams::ProductParams] Product options. Requires formats.product: true.
      #
      #   @param screenshot_params [ContextDev::Models::WebScrapeParams::ScreenshotParams] Screenshot options. Requires formats.screenshot: true.
      #
      #   @param shared_params [ContextDev::Models::WebScrapeParams::SharedParams] Browser and content settings shared by all outputs.
      #
      #   @param tags [Array<String>] Labels for tracking request usage. Not retained when zdr is enabled.
      #
      #   @param timeout_opts [ContextDev::Models::WebScrapeParams::TimeoutOpts] Deadline for the whole request. Defaults to 90000 ms with `fail`. Fixed waits mu
      #
      #   @param zdr [Symbol, ContextDev::Models::WebScrapeParams::Zdr] `enabled` turns on zero data retention. Your organization must have ZDR enabled.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      class Formats < ContextDev::Internal::Type::BaseModel
        # @!attribute bytes
        #   The original HTTP response body.
        #
        #   @return [Boolean, nil]
        optional :bytes, ContextDev::Internal::Type::Boolean

        # @!attribute highlights
        #   Markdown excerpts relevant to `highlightsParams.query`.
        #
        #   @return [Boolean, nil]
        optional :highlights, ContextDev::Internal::Type::Boolean

        # @!attribute html
        #   Rendered HTML.
        #
        #   @return [Boolean, nil]
        optional :html, ContextDev::Internal::Type::Boolean

        # @!attribute images
        #   Images found on the page.
        #
        #   @return [Boolean, nil]
        optional :images, ContextDev::Internal::Type::Boolean

        # @!attribute json
        #   An object matching `jsonParams.schema`, extracted from the page.
        #
        #   @return [Boolean, nil]
        optional :json, ContextDev::Internal::Type::Boolean

        # @!attribute markdown
        #   Page content as Markdown.
        #
        #   @return [Boolean, nil]
        optional :markdown, ContextDev::Internal::Type::Boolean

        # @!attribute parse
        #   Fields extracted with `parseParams.rules`, returned as `parsed`.
        #
        #   @return [Boolean, nil]
        optional :parse, ContextDev::Internal::Type::Boolean

        # @!attribute product
        #   Product details such as name, price, and availability.
        #
        #   @return [Boolean, nil]
        optional :product, ContextDev::Internal::Type::Boolean

        # @!attribute screenshot
        #   A screenshot of the page.
        #
        #   @return [Boolean, nil]
        optional :screenshot, ContextDev::Internal::Type::Boolean

        # @!method initialize(bytes: nil, highlights: nil, html: nil, images: nil, json: nil, markdown: nil, parse: nil, product: nil, screenshot: nil)
        #   Outputs to return. Set at least one to `true`.
        #
        #   @param bytes [Boolean] The original HTTP response body.
        #
        #   @param highlights [Boolean] Markdown excerpts relevant to `highlightsParams.query`.
        #
        #   @param html [Boolean] Rendered HTML.
        #
        #   @param images [Boolean] Images found on the page.
        #
        #   @param json [Boolean] An object matching `jsonParams.schema`, extracted from the page.
        #
        #   @param markdown [Boolean] Page content as Markdown.
        #
        #   @param parse [Boolean] Fields extracted with `parseParams.rules`, returned as `parsed`.
        #
        #   @param product [Boolean] Product details such as name, price, and availability.
        #
        #   @param screenshot [Boolean] A screenshot of the page.
      end

      class HighlightsParams < ContextDev::Internal::Type::BaseModel
        # @!attribute query
        #   The question or topic to find passages for.
        #
        #   @return [String]
        required :query, String

        # @!attribute max_characters
        #   Maximum combined length of returned passages.
        #
        #   @return [Integer, nil]
        optional :max_characters, Integer, api_name: :maxCharacters

        # @!method initialize(query:, max_characters: nil)
        #   Requires `formats.highlights: true`; required when it is set.
        #
        #   @param query [String] The question or topic to find passages for.
        #
        #   @param max_characters [Integer] Maximum combined length of returned passages.
      end

      class ImageParams < ContextDev::Internal::Type::BaseModel
        # @!attribute dedupe
        #   Set `visual` to drop visual duplicates, keeping the largest copy.
        #
        #   @return [Symbol, ContextDev::Models::WebScrapeParams::ImageParams::Dedupe, nil]
        optional :dedupe, enum: -> { ContextDev::WebScrapeParams::ImageParams::Dedupe }

        # @!attribute enrich
        #   Extra data per image: `dimensions`, `classification`, or a hosted `file` URL.
        #
        #   @return [Array<Symbol, ContextDev::Models::WebScrapeParams::ImageParams::Enrich>, nil]
        optional :enrich,
                 -> { ContextDev::Internal::Type::ArrayOf[enum: ContextDev::WebScrapeParams::ImageParams::Enrich] }

        # @!method initialize(dedupe: nil, enrich: nil)
        #   Image options. Requires formats.images: true.
        #
        #   @param dedupe [Symbol, ContextDev::Models::WebScrapeParams::ImageParams::Dedupe] Set `visual` to drop visual duplicates, keeping the largest copy.
        #
        #   @param enrich [Array<Symbol, ContextDev::Models::WebScrapeParams::ImageParams::Enrich>] Extra data per image: `dimensions`, `classification`, or a hosted `file` URL.

        # Set `visual` to drop visual duplicates, keeping the largest copy.
        #
        # @see ContextDev::Models::WebScrapeParams::ImageParams#dedupe
        module Dedupe
          extend ContextDev::Internal::Type::Enum

          NONE = :none
          VISUAL = :visual

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        module Enrich
          extend ContextDev::Internal::Type::Enum

          DIMENSIONS = :dimensions
          CLASSIFICATION = :classification
          FILE = :file

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class JsonParams < ContextDev::Internal::Type::BaseModel
        # @!attribute schema
        #   JSON Schema (not an example object) for a top-level object, up to 50 KB. Use
        #   optional or nullable fields for missing facts.
        #
        #   @return [Hash{Symbol=>Object}]
        required :schema, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

        # @!attribute instructions
        #   Extra guidance, such as which facts to prefer or how to read a field.
        #
        #   @return [String, nil]
        optional :instructions, String

        # @!method initialize(schema:, instructions: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeParams::JsonParams} for more details.
        #
        #   Requires `formats.json: true`; required when it is set.
        #
        #   @param schema [Hash{Symbol=>Object}] JSON Schema (not an example object) for a top-level object, up to 50 KB. Use opt
        #
        #   @param instructions [String] Extra guidance, such as which facts to prefer or how to read a field.
      end

      class MarkdownParams < ContextDev::Internal::Type::BaseModel
        # @!attribute include_images
        #   Include images in the Markdown using image syntax with URLs and alt text.
        #
        #   @return [Boolean, nil]
        optional :include_images, ContextDev::Internal::Type::Boolean, api_name: :includeImages

        # @!attribute include_links
        #   Keep link URLs in the Markdown. Set false to return link text without URLs.
        #
        #   @return [Boolean, nil]
        optional :include_links, ContextDev::Internal::Type::Boolean, api_name: :includeLinks

        # @!attribute inline_images
        #   How base64 images appear: `placeholder` (default) or `preserve`. Requires
        #   `includeImages`.
        #
        #   @return [Symbol, ContextDev::Models::WebScrapeParams::MarkdownParams::InlineImages, nil]
        optional :inline_images,
                 enum: -> { ContextDev::WebScrapeParams::MarkdownParams::InlineImages },
                 api_name: :inlineImages

        # @!method initialize(include_images: nil, include_links: nil, inline_images: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeParams::MarkdownParams} for more details.
        #
        #   Markdown options. Requires `formats.markdown`.
        #
        #   @param include_images [Boolean] Include images in the Markdown using image syntax with URLs and alt text.
        #
        #   @param include_links [Boolean] Keep link URLs in the Markdown. Set false to return link text without URLs.
        #
        #   @param inline_images [Symbol, ContextDev::Models::WebScrapeParams::MarkdownParams::InlineImages] How base64 images appear: `placeholder` (default) or `preserve`. Requires `inclu

        # How base64 images appear: `placeholder` (default) or `preserve`. Requires
        # `includeImages`.
        #
        # @see ContextDev::Models::WebScrapeParams::MarkdownParams#inline_images
        module InlineImages
          extend ContextDev::Internal::Type::Enum

          PLACEHOLDER = :placeholder
          PRESERVE = :preserve

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class ParseParams < ContextDev::Internal::Type::BaseModel
        # @!attribute rules
        #   Field names mapped to CSS selectors (`h1`, `a@href`) or rule objects. Max 100
        #   fields, 5 levels.
        #
        #   @return [Hash{Symbol=>String, ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1}]
        required :rules,
                 -> { ContextDev::Internal::Type::HashOf[union: ContextDev::WebScrapeParams::ParseParams::Rule] }

        # @!method initialize(rules:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeParams::ParseParams} for more details.
        #
        #   Requires `formats.parse: true`; required when it is set.
        #
        #   @param rules [Hash{Symbol=>String, ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1}] Field names mapped to CSS selectors (`h1`, `a@href`) or rule objects. Max 100 fi

        module Rule
          extend ContextDev::Internal::Type::Union

          variant String

          variant -> { ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1 }

          class UnionMember1 < ContextDev::Internal::Type::BaseModel
            # @!attribute selector
            #   CSS selector to match within the current page or parent rule.
            #
            #   @return [String]
            required :selector, String

            # @!attribute output
            #   Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
            #   to text.
            #
            #   @return [Symbol, String, Object, ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1::Output, nil]
            optional :output, union: -> { ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Output }

            # @!attribute type
            #   Return the first match with `item` or all matches with `list`.
            #
            #   @return [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1::Type, nil]
            optional :type, enum: -> { ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Type }

            # @!method initialize(selector:, output: nil, type: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1} for more
            #   details.
            #
            #   @param selector [String] CSS selector to match within the current page or parent rule.
            #
            #   @param output [Symbol, String, Object, ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1::Output] Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
            #
            #   @param type [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1::Type] Return the first match with `item` or all matches with `list`.

            # Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
            # to text.
            #
            # @see ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1#output
            module Output
              extend ContextDev::Internal::Type::Union

              variant const: -> { ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1::Output::TEXT }

              variant const: -> { ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1::Output::HTML }

              variant String

              variant ContextDev::Internal::Type::Unknown

              # @!method self.variants
              #   @return [Array(Symbol, String, Object)]

              define_sorbet_constant!(:Variants) do
                T.type_alias do
                  T.any(
                    ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Output::TaggedSymbol,
                    String,
                    T.anything
                  )
                end
              end

              # @!group

              TEXT = :text
              HTML = :html

              # @!endgroup
            end

            # Return the first match with `item` or all matches with `list`.
            #
            # @see ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1#type
            module Type
              extend ContextDev::Internal::Type::Enum

              ITEM = :item
              LIST = :list

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @!method self.variants
          #   @return [Array(String, ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1)]
        end
      end

      class ProductParams < ContextDev::Internal::Type::BaseModel
        # @!attribute use_ai_fallback
        #   Use an AI model when the page has no structured product data.
        #
        #   @return [Boolean, nil]
        optional :use_ai_fallback, ContextDev::Internal::Type::Boolean, api_name: :useAIFallback

        # @!method initialize(use_ai_fallback: nil)
        #   Product options. Requires formats.product: true.
        #
        #   @param use_ai_fallback [Boolean] Use an AI model when the page has no structured product data.
      end

      class ScreenshotParams < ContextDev::Internal::Type::BaseModel
        # @!attribute area
        #   What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40
        #   megapixels.
        #
        #   @return [Symbol, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Page, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Element, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Rectangle, nil]
        optional :area, union: -> { ContextDev::WebScrapeParams::ScreenshotParams::Area }

        # @!attribute format_
        #   Image format for the screenshot.
        #
        #   @return [Symbol, ContextDev::Models::WebScrapeParams::ScreenshotParams::Format, nil]
        optional :format_,
                 enum: -> {
                   ContextDev::WebScrapeParams::ScreenshotParams::Format
                 },
                 api_name: :format

        # @!method initialize(area: nil, format_: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeParams::ScreenshotParams} for more details.
        #
        #   Screenshot options. Requires formats.screenshot: true.
        #
        #   @param area [Symbol, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Page, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Element, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Rectangle] What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40 meg
        #
        #   @param format_ [Symbol, ContextDev::Models::WebScrapeParams::ScreenshotParams::Format] Image format for the screenshot.

        # What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40
        # megapixels.
        #
        # @see ContextDev::Models::WebScrapeParams::ScreenshotParams#area
        module Area
          extend ContextDev::Internal::Type::Union

          variant enum: -> { ContextDev::WebScrapeParams::ScreenshotParams::Area::Page }

          variant -> { ContextDev::WebScrapeParams::ScreenshotParams::Area::Element }

          # Pixels from the document origin.
          variant -> { ContextDev::WebScrapeParams::ScreenshotParams::Area::Rectangle }

          module Page
            extend ContextDev::Internal::Type::Enum

            VIEWPORT = :viewport
            FULL_PAGE = :fullPage

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class Element < ContextDev::Internal::Type::BaseModel
            # @!attribute selector
            #   CSS selector matching exactly one visible element.
            #
            #   @return [String]
            required :selector, String

            # @!method initialize(selector:)
            #   @param selector [String] CSS selector matching exactly one visible element.
          end

          class Rectangle < ContextDev::Internal::Type::BaseModel
            # @!attribute height
            #   Height of the capture in pixels.
            #
            #   @return [Integer]
            required :height, Integer

            # @!attribute width
            #   Width of the capture in pixels.
            #
            #   @return [Integer]
            required :width, Integer

            # @!attribute x
            #   Left edge of the capture, in pixels from the document origin.
            #
            #   @return [Integer]
            required :x, Integer

            # @!attribute y_
            #   Top edge of the capture, in pixels from the document origin.
            #
            #   @return [Integer]
            required :y_, Integer, api_name: :y

            # @!method initialize(height:, width:, x:, y_:)
            #   Pixels from the document origin.
            #
            #   @param height [Integer] Height of the capture in pixels.
            #
            #   @param width [Integer] Width of the capture in pixels.
            #
            #   @param x [Integer] Left edge of the capture, in pixels from the document origin.
            #
            #   @param y_ [Integer] Top edge of the capture, in pixels from the document origin.
          end

          # @!method self.variants
          #   @return [Array(Symbol, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Page, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Element, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Rectangle)]
        end

        # Image format for the screenshot.
        #
        # @see ContextDev::Models::WebScrapeParams::ScreenshotParams#format_
        module Format
          extend ContextDev::Internal::Type::Enum

          PNG = :png
          JPEG = :jpeg
          WEBP = :webp

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class SharedParams < ContextDev::Internal::Type::BaseModel
        # @!attribute actions
        #   Browser steps run in order before capture. Requires a paid plan. Skips the
        #   cache.
        #
        #   @return [Array<ContextDev::Models::WebScrapeParams::SharedParams::Action::Perform, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll, ContextDev::Models::WebScrapeParams::SharedParams::Action::Wait, ContextDev::Models::WebScrapeParams::SharedParams::Action::WaitFor>, nil]
        optional :actions,
                 -> { ContextDev::Internal::Type::ArrayOf[union: ContextDev::WebScrapeParams::SharedParams::Action] }

        # @!attribute country
        #   Proxy country as a two-letter code, such as `US`. Case-insensitive.
        #
        #   @return [String, nil]
        optional :country, String

        # @!attribute dismiss_cookies
        #   Accept cookie banners before actions and capture.
        #
        #   @return [Boolean, nil]
        optional :dismiss_cookies, ContextDev::Internal::Type::Boolean, api_name: :dismissCookies

        # @!attribute dismiss_popups
        #   Close other popups before actions and capture.
        #
        #   @return [Boolean, nil]
        optional :dismiss_popups, ContextDev::Internal::Type::Boolean, api_name: :dismissPopups

        # @!attribute exclude_selectors
        #   Remove elements matching these CSS selectors. Overrides `includeSelectors`.
        #
        #   @return [Array<String>, nil]
        optional :exclude_selectors, ContextDev::Internal::Type::ArrayOf[String], api_name: :excludeSelectors

        # @!attribute headers
        #   HTTP headers to send to the target site. Requests with headers skip the cache.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :headers, ContextDev::Internal::Type::HashOf[String]

        # @!attribute include_frames
        #   Include iframe content in HTML and text outputs. Screenshots always show visible
        #   frames.
        #
        #   @return [Boolean, nil]
        optional :include_frames, ContextDev::Internal::Type::Boolean, api_name: :includeFrames

        # @!attribute include_selectors
        #   Keep only elements matching these CSS selectors.
        #
        #   @return [Array<String>, nil]
        optional :include_selectors, ContextDev::Internal::Type::ArrayOf[String], api_name: :includeSelectors

        # @!attribute main_content_only
        #   Keep only the main content. Doesn't affect `screenshot`, `bytes`, or `product`.
        #
        #   @return [Boolean, nil]
        optional :main_content_only, ContextDev::Internal::Type::Boolean, api_name: :mainContentOnly

        # @!attribute parsers
        #   Document parsing options.
        #
        #   @return [ContextDev::Models::WebScrapeParams::SharedParams::Parsers, nil]
        optional :parsers, -> { ContextDev::WebScrapeParams::SharedParams::Parsers }

        # @!attribute settle_animations
        #   Wait for CSS animations to finish before capture. Defaults to `true` when
        #   `screenshot` is requested.
        #
        #   @return [Boolean, nil]
        optional :settle_animations, ContextDev::Internal::Type::Boolean, api_name: :settleAnimations

        # @!attribute theme
        #   Emulate a light or dark color scheme.
        #
        #   @return [Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Theme, nil]
        optional :theme, enum: -> { ContextDev::WebScrapeParams::SharedParams::Theme }

        # @!attribute viewport
        #   Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
        #   default to 1440 × 900.
        #
        #   @return [ContextDev::Models::WebScrapeParams::SharedParams::Viewport, nil]
        optional :viewport, -> { ContextDev::WebScrapeParams::SharedParams::Viewport }

        # @!attribute wait_for
        #   Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500
        #   (2000 with frames or XML).
        #
        #   @return [Integer, String, nil]
        optional :wait_for,
                 union: -> {
                   ContextDev::WebScrapeParams::SharedParams::WaitFor
                 },
                 api_name: :waitFor

        # @!method initialize(actions: nil, country: nil, dismiss_cookies: nil, dismiss_popups: nil, exclude_selectors: nil, headers: nil, include_frames: nil, include_selectors: nil, main_content_only: nil, parsers: nil, settle_animations: nil, theme: nil, viewport: nil, wait_for: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeParams::SharedParams} for more details.
        #
        #   Browser and content settings shared by all outputs.
        #
        #   @param actions [Array<ContextDev::Models::WebScrapeParams::SharedParams::Action::Perform, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll, ContextDev::Models::WebScrapeParams::SharedParams::Action::Wait, ContextDev::Models::WebScrapeParams::SharedParams::Action::WaitFor>] Browser steps run in order before capture. Requires a paid plan. Skips the cache
        #
        #   @param country [String] Proxy country as a two-letter code, such as `US`. Case-insensitive.
        #
        #   @param dismiss_cookies [Boolean] Accept cookie banners before actions and capture.
        #
        #   @param dismiss_popups [Boolean] Close other popups before actions and capture.
        #
        #   @param exclude_selectors [Array<String>] Remove elements matching these CSS selectors. Overrides `includeSelectors`.
        #
        #   @param headers [Hash{Symbol=>String}] HTTP headers to send to the target site. Requests with headers skip the cache.
        #
        #   @param include_frames [Boolean] Include iframe content in HTML and text outputs. Screenshots always show visible
        #
        #   @param include_selectors [Array<String>] Keep only elements matching these CSS selectors.
        #
        #   @param main_content_only [Boolean] Keep only the main content. Doesn't affect `screenshot`, `bytes`, or `product`.
        #
        #   @param parsers [ContextDev::Models::WebScrapeParams::SharedParams::Parsers] Document parsing options.
        #
        #   @param settle_animations [Boolean] Wait for CSS animations to finish before capture. Defaults to `true` when `scree
        #
        #   @param theme [Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Theme] Emulate a light or dark color scheme.
        #
        #   @param viewport [ContextDev::Models::WebScrapeParams::SharedParams::Viewport] Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
        #
        #   @param wait_for [Integer, String] Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500 (200

        module Action
          extend ContextDev::Internal::Type::Union

          discriminator :type

          variant :perform, -> { ContextDev::WebScrapeParams::SharedParams::Action::Perform }

          variant :scroll, -> { ContextDev::WebScrapeParams::SharedParams::Action::Scroll }

          variant :wait, -> { ContextDev::WebScrapeParams::SharedParams::Action::Wait }

          variant :waitFor, -> { ContextDev::WebScrapeParams::SharedParams::Action::WaitFor }

          class Perform < ContextDev::Internal::Type::BaseModel
            # @!attribute action
            #   One browser instruction, such as clicking a button or entering text.
            #
            #   @return [String]
            required :action, String

            # @!attribute type
            #   Use `perform` for a plain-language browser instruction.
            #
            #   @return [Symbol, :perform]
            required :type, const: :perform

            # @!method initialize(action:, type: :perform)
            #   @param action [String] One browser instruction, such as clicking a button or entering text.
            #
            #   @param type [Symbol, :perform] Use `perform` for a plain-language browser instruction.
          end

          class Scroll < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #   Use `scroll` to move through the page or a container.
            #
            #   @return [Symbol, :scroll]
            required :type, const: :scroll

            # @!attribute amount
            #   Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
            #
            #   @return [Integer, Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll::Amount, nil]
            optional :amount, union: -> { ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Amount }

            # @!attribute direction
            #   Direction to scroll.
            #
            #   @return [Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll::Direction, nil]
            optional :direction, enum: -> { ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Direction }

            # @!attribute max_scrolls
            #   Maximum number of scroll steps for this action.
            #
            #   @return [Integer, nil]
            optional :max_scrolls, Integer, api_name: :maxScrolls

            # @!attribute selector
            #   Scroll this container. Omit to scroll the page.
            #
            #   @return [String, nil]
            optional :selector, String

            # @!method initialize(amount: nil, direction: nil, max_scrolls: nil, selector: nil, type: :scroll)
            #   @param amount [Integer, Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll::Amount] Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
            #
            #   @param direction [Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll::Direction] Direction to scroll.
            #
            #   @param max_scrolls [Integer] Maximum number of scroll steps for this action.
            #
            #   @param selector [String] Scroll this container. Omit to scroll the page.
            #
            #   @param type [Symbol, :scroll] Use `scroll` to move through the page or a container.

            # Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
            #
            # @see ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll#amount
            module Amount
              extend ContextDev::Internal::Type::Union

              variant Integer

              variant const: -> { ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll::Amount::VIEWPORT }

              variant const: -> { ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll::Amount::MAX }

              # @!method self.variants
              #   @return [Array(Integer, Symbol)]

              define_sorbet_constant!(:Variants) do
                T.type_alias { T.any(Integer, ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Amount::TaggedSymbol) }
              end

              # @!group

              VIEWPORT = :viewport
              MAX = :max

              # @!endgroup
            end

            # Direction to scroll.
            #
            # @see ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll#direction
            module Direction
              extend ContextDev::Internal::Type::Enum

              DOWN = :down
              UP = :up
              LEFT = :left
              RIGHT = :right

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class Wait < ContextDev::Internal::Type::BaseModel
            # @!attribute milliseconds
            #   Time to pause in milliseconds before the next action.
            #
            #   @return [Integer]
            required :milliseconds, Integer

            # @!attribute type
            #   Use `wait` to pause for a fixed duration.
            #
            #   @return [Symbol, :wait]
            required :type, const: :wait

            # @!method initialize(milliseconds:, type: :wait)
            #   @param milliseconds [Integer] Time to pause in milliseconds before the next action.
            #
            #   @param type [Symbol, :wait] Use `wait` to pause for a fixed duration.
          end

          class WaitFor < ContextDev::Internal::Type::BaseModel
            # @!attribute selector
            #   CSS selector to wait for before continuing.
            #
            #   @return [String]
            required :selector, String

            # @!attribute type
            #   Use `waitFor` to wait for a matching element.
            #
            #   @return [Symbol, :waitFor]
            required :type, const: :waitFor

            # @!method initialize(selector:, type: :waitFor)
            #   @param selector [String] CSS selector to wait for before continuing.
            #
            #   @param type [Symbol, :waitFor] Use `waitFor` to wait for a matching element.
          end

          # @!method self.variants
          #   @return [Array(ContextDev::Models::WebScrapeParams::SharedParams::Action::Perform, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll, ContextDev::Models::WebScrapeParams::SharedParams::Action::Wait, ContextDev::Models::WebScrapeParams::SharedParams::Action::WaitFor)]
        end

        # @see ContextDev::Models::WebScrapeParams::SharedParams#parsers
        class Parsers < ContextDev::Internal::Type::BaseModel
          # @!attribute pdf
          #   PDF page range and OCR.
          #
          #   @return [ContextDev::Models::WebScrapeParams::SharedParams::Parsers::Pdf, nil]
          optional :pdf, -> { ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf }

          # @!method initialize(pdf: nil)
          #   Document parsing options.
          #
          #   @param pdf [ContextDev::Models::WebScrapeParams::SharedParams::Parsers::Pdf] PDF page range and OCR.

          # @see ContextDev::Models::WebScrapeParams::SharedParams::Parsers#pdf
          class Pdf < ContextDev::Internal::Type::BaseModel
            # @!attribute end_page
            #   Last page to parse. Must be at least `startPage`.
            #
            #   @return [Integer, nil]
            optional :end_page, Integer, api_name: :endPage

            # @!attribute ocr
            #   Set `auto` to read scanned pages with OCR.
            #
            #   @return [Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr, nil]
            optional :ocr, enum: -> { ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr }

            # @!attribute start_page
            #   First page to parse, starting at 1.
            #
            #   @return [Integer, nil]
            optional :start_page, Integer, api_name: :startPage

            # @!method initialize(end_page: nil, ocr: nil, start_page: nil)
            #   PDF page range and OCR.
            #
            #   @param end_page [Integer] Last page to parse. Must be at least `startPage`.
            #
            #   @param ocr [Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr] Set `auto` to read scanned pages with OCR.
            #
            #   @param start_page [Integer] First page to parse, starting at 1.

            # Set `auto` to read scanned pages with OCR.
            #
            # @see ContextDev::Models::WebScrapeParams::SharedParams::Parsers::Pdf#ocr
            module Ocr
              extend ContextDev::Internal::Type::Enum

              OFF = :off
              AUTO = :auto

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end

        # Emulate a light or dark color scheme.
        #
        # @see ContextDev::Models::WebScrapeParams::SharedParams#theme
        module Theme
          extend ContextDev::Internal::Type::Enum

          LIGHT = :light
          DARK = :dark

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::WebScrapeParams::SharedParams#viewport
        class Viewport < ContextDev::Internal::Type::BaseModel
          # @!attribute height
          #   Browser viewport height in pixels.
          #
          #   @return [Integer, nil]
          optional :height, Integer

          # @!attribute width
          #   Browser viewport width in pixels.
          #
          #   @return [Integer, nil]
          optional :width, Integer

          # @!method initialize(height: nil, width: nil)
          #   Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
          #   default to 1440 × 900.
          #
          #   @param height [Integer] Browser viewport height in pixels.
          #
          #   @param width [Integer] Browser viewport width in pixels.
        end

        # Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500
        # (2000 with frames or XML).
        #
        # @see ContextDev::Models::WebScrapeParams::SharedParams#wait_for
        module WaitFor
          extend ContextDev::Internal::Type::Union

          variant Integer

          variant String

          # @!method self.variants
          #   @return [Array(Integer, String)]
        end
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        # @!attribute milliseconds
        #   Deadline in milliseconds.
        #
        #   @return [Integer]
        required :milliseconds, Integer

        # @!attribute behavior
        #   "fail" returns 408 at the deadline. "return-partial" returns available results;
        #   inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
        #
        #   @return [Symbol, ContextDev::Models::WebScrapeParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::WebScrapeParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeParams::TimeoutOpts} for more details.
        #
        #   Deadline for the whole request. Defaults to 90000 ms with `fail`. Fixed waits
        #   must end before it.
        #
        #   @param milliseconds [Integer] Deadline in milliseconds.
        #
        #   @param behavior [Symbol, ContextDev::Models::WebScrapeParams::TimeoutOpts::Behavior] "fail" returns 408 at the deadline. "return-partial" returns available results;

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
        #
        # @see ContextDev::Models::WebScrapeParams::TimeoutOpts#behavior
        module Behavior
          extend ContextDev::Internal::Type::Enum

          FAIL = :fail
          RETURN_PARTIAL = :"return-partial"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # `enabled` turns on zero data retention. Your organization must have ZDR enabled.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        ENABLED = :enabled
        DISABLED = :disabled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
