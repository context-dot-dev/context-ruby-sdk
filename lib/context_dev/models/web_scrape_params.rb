# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#scrape
    class WebScrapeParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute formats
      #   Outputs to return. Enable at least one; omitted formats are false.
      #
      #   @return [ContextDev::Models::WebScrapeParams::Formats]
      required :formats, -> { ContextDev::WebScrapeParams::Formats }

      # @!attribute url
      #   The URL to scrape.
      #
      #   @return [String]
      required :url, String

      # @!attribute highlights_params
      #   Highlight options. Requires formats.highlights: true.
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
      #   Required when formats.json is true.
      #
      #   @return [ContextDev::Models::WebScrapeParams::JsonParams, nil]
      optional :json_params, -> { ContextDev::WebScrapeParams::JsonParams }, api_name: :jsonParams

      # @!attribute markdown_params
      #   Markdown options. Requires formats.markdown: true.
      #
      #   @return [ContextDev::Models::WebScrapeParams::MarkdownParams, nil]
      optional :markdown_params, -> { ContextDev::WebScrapeParams::MarkdownParams }, api_name: :markdownParams

      # @!attribute max_age_ms
      #   Maximum age of each cached output. Defaults to 1 day; 0 fetches fresh and
      #   updates the requested outputs. Compatible outputs are shared with the individual
      #   scrape endpoints. Image results with hosted files refresh after 23 hours; other
      #   outputs retain their own freshness.
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer, api_name: :maxAgeMs

      # @!attribute parse_params
      #   Required when formats.parse is true.
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
      #   Shared browser and content settings. Content filters leave screenshots and
      #   original bytes unchanged.
      #
      #   @return [ContextDev::Models::WebScrapeParams::SharedParams, nil]
      optional :shared_params, -> { ContextDev::WebScrapeParams::SharedParams }, api_name: :sharedParams

      # @!attribute tags
      #   Labels for tracking request usage. Not retained when zdr is enabled.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Total deadline, including navigation, actions, waiting, and all outputs.
      #   Defaults to 60000 milliseconds with behavior fail. Use return-partial to capture
      #   the current page state and return captured images if image processing cannot
      #   finish before the deadline; these responses set isPartial and are not cached.
      #   Every requested format must still be available. Fixed waits must fit before a
      #   response reserve of up to 5000 milliseconds (at most one quarter of the timeout)
      #   when using return-partial.
      #
      #   @return [ContextDev::Models::WebScrapeParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::WebScrapeParams::TimeoutOpts }, api_name: :timeoutOpts

      # @!attribute zdr
      #   Zero data retention. Bypasses caches and uploads; excludes request/response
      #   content and tags from logs. Must be enabled for your organization.
      #
      #   @return [Symbol, ContextDev::Models::WebScrapeParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebScrapeParams::Zdr }

      # @!method initialize(formats:, url:, highlights_params: nil, image_params: nil, json_params: nil, markdown_params: nil, max_age_ms: nil, parse_params: nil, product_params: nil, screenshot_params: nil, shared_params: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebScrapeParams} for more details.
      #
      #   @param formats [ContextDev::Models::WebScrapeParams::Formats] Outputs to return. Enable at least one; omitted formats are false.
      #
      #   @param url [String] The URL to scrape.
      #
      #   @param highlights_params [ContextDev::Models::WebScrapeParams::HighlightsParams] Highlight options. Requires formats.highlights: true.
      #
      #   @param image_params [ContextDev::Models::WebScrapeParams::ImageParams] Image options. Requires formats.images: true.
      #
      #   @param json_params [ContextDev::Models::WebScrapeParams::JsonParams] Required when formats.json is true.
      #
      #   @param markdown_params [ContextDev::Models::WebScrapeParams::MarkdownParams] Markdown options. Requires formats.markdown: true.
      #
      #   @param max_age_ms [Integer] Maximum age of each cached output. Defaults to 1 day; 0 fetches fresh and update
      #
      #   @param parse_params [ContextDev::Models::WebScrapeParams::ParseParams] Required when formats.parse is true.
      #
      #   @param product_params [ContextDev::Models::WebScrapeParams::ProductParams] Product options. Requires formats.product: true.
      #
      #   @param screenshot_params [ContextDev::Models::WebScrapeParams::ScreenshotParams] Screenshot options. Requires formats.screenshot: true.
      #
      #   @param shared_params [ContextDev::Models::WebScrapeParams::SharedParams] Shared browser and content settings. Content filters leave screenshots and origi
      #
      #   @param tags [Array<String>] Labels for tracking request usage. Not retained when zdr is enabled.
      #
      #   @param timeout_opts [ContextDev::Models::WebScrapeParams::TimeoutOpts] Total deadline, including navigation, actions, waiting, and all outputs. Default
      #
      #   @param zdr [Symbol, ContextDev::Models::WebScrapeParams::Zdr] Zero data retention. Bypasses caches and uploads; excludes request/response cont
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      class Formats < ContextDev::Internal::Type::BaseModel
        # @!attribute bytes
        #   The original HTTP response body.
        #
        #   @return [Boolean, nil]
        optional :bytes, ContextDev::Internal::Type::Boolean

        # @!attribute highlights
        #   Relevant passages for your question or topic, with headings included when needed
        #   for context. Adds 3 credits.
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
        #   Page data extracted using your schema. Adds 4 credits.
        #
        #   @return [Boolean, nil]
        optional :json, ContextDev::Internal::Type::Boolean

        # @!attribute markdown
        #   Page content as Markdown.
        #
        #   @return [Boolean, nil]
        optional :markdown, ContextDev::Internal::Type::Boolean

        # @!attribute parse
        #   Fields selected by parseParams.rules.
        #
        #   @return [Boolean, nil]
        optional :parse, ContextDev::Internal::Type::Boolean

        # @!attribute product
        #   Product details such as name, price, and availability. Adds 1 credit.
        #
        #   @return [Boolean, nil]
        optional :product, ContextDev::Internal::Type::Boolean

        # @!attribute screenshot
        #   An inline image of the page.
        #
        #   @return [Boolean, nil]
        optional :screenshot, ContextDev::Internal::Type::Boolean

        # @!method initialize(bytes: nil, highlights: nil, html: nil, images: nil, json: nil, markdown: nil, parse: nil, product: nil, screenshot: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeParams::Formats} for more details.
        #
        #   Outputs to return. Enable at least one; omitted formats are false.
        #
        #   @param bytes [Boolean] The original HTTP response body.
        #
        #   @param highlights [Boolean] Relevant passages for your question or topic, with headings included when needed
        #
        #   @param html [Boolean] Rendered HTML.
        #
        #   @param images [Boolean] Images found on the page.
        #
        #   @param json [Boolean] Page data extracted using your schema. Adds 4 credits.
        #
        #   @param markdown [Boolean] Page content as Markdown.
        #
        #   @param parse [Boolean] Fields selected by parseParams.rules.
        #
        #   @param product [Boolean] Product details such as name, price, and availability. Adds 1 credit.
        #
        #   @param screenshot [Boolean] An inline image of the page.
      end

      class HighlightsParams < ContextDev::Internal::Type::BaseModel
        # @!attribute query
        #   The question or topic to find passages for.
        #
        #   @return [String]
        required :query, String

        # @!attribute max_characters
        #   Maximum combined length of the returned passages, in characters.
        #
        #   @return [Integer, nil]
        optional :max_characters, Integer, api_name: :maxCharacters

        # @!method initialize(query:, max_characters: nil)
        #   Highlight options. Requires formats.highlights: true.
        #
        #   @param query [String] The question or topic to find passages for.
        #
        #   @param max_characters [Integer] Maximum combined length of the returned passages, in characters.
      end

      class ImageParams < ContextDev::Internal::Type::BaseModel
        # @!attribute dedupe
        #   For visual duplicates, keep the largest image.
        #
        #   @return [Symbol, ContextDev::Models::WebScrapeParams::ImageParams::Dedupe, nil]
        optional :dedupe, enum: -> { ContextDev::WebScrapeParams::ImageParams::Dedupe }

        # @!attribute enrich
        #   Add dimensions, a visual category, or a hosted file URL. Each image has a
        #   maximum processing time of 30000 milliseconds, bounded by the remaining request
        #   deadline.
        #
        #   @return [Array<Symbol, ContextDev::Models::WebScrapeParams::ImageParams::Enrich>, nil]
        optional :enrich,
                 -> { ContextDev::Internal::Type::ArrayOf[enum: ContextDev::WebScrapeParams::ImageParams::Enrich] }

        # @!method initialize(dedupe: nil, enrich: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeParams::ImageParams} for more details.
        #
        #   Image options. Requires formats.images: true.
        #
        #   @param dedupe [Symbol, ContextDev::Models::WebScrapeParams::ImageParams::Dedupe] For visual duplicates, keep the largest image.
        #
        #   @param enrich [Array<Symbol, ContextDev::Models::WebScrapeParams::ImageParams::Enrich>] Add dimensions, a visual category, or a hosted file URL. Each image has a maximu

        # For visual duplicates, keep the largest image.
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
        #   JSON Schema for the returned object. Must describe a top-level object; at most
        #   50 KB serialized. Optional fields the page does not state are omitted, or null
        #   when their type allows null, while required non-nullable fields always receive a
        #   best-effort value, so prefer nullable or optional fields for data a page may
        #   omit. Zod users can pass the output of z.toJSONSchema().
        #
        #   @return [Hash{Symbol=>Object}]
        required :schema, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

        # @!attribute instructions
        #   Optional guidance on which facts to prioritize or how to interpret schema
        #   fields.
        #
        #   @return [String, nil]
        optional :instructions, String

        # @!method initialize(schema:, instructions: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeParams::JsonParams} for more details.
        #
        #   Required when formats.json is true.
        #
        #   @param schema [Hash{Symbol=>Object}] JSON Schema for the returned object. Must describe a top-level object; at most 5
        #
        #   @param instructions [String] Optional guidance on which facts to prioritize or how to interpret schema fields
      end

      class MarkdownParams < ContextDev::Internal::Type::BaseModel
        # @!attribute include_images
        #
        #   @return [Boolean, nil]
        optional :include_images, ContextDev::Internal::Type::Boolean, api_name: :includeImages

        # @!attribute include_links
        #
        #   @return [Boolean, nil]
        optional :include_links, ContextDev::Internal::Type::Boolean, api_name: :includeLinks

        # @!attribute inline_images
        #   Base64 images use placeholders by default. Requires includeImages: true.
        #
        #   @return [Symbol, ContextDev::Models::WebScrapeParams::MarkdownParams::InlineImages, nil]
        optional :inline_images,
                 enum: -> { ContextDev::WebScrapeParams::MarkdownParams::InlineImages },
                 api_name: :inlineImages

        # @!method initialize(include_images: nil, include_links: nil, inline_images: nil)
        #   Markdown options. Requires formats.markdown: true.
        #
        #   @param include_images [Boolean]
        #
        #   @param include_links [Boolean]
        #
        #   @param inline_images [Symbol, ContextDev::Models::WebScrapeParams::MarkdownParams::InlineImages] Base64 images use placeholders by default. Requires includeImages: true.

        # Base64 images use placeholders by default. Requires includeImages: true.
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
        #   Map field names to CSS selectors or rules. Missing items return null; missing
        #   lists return [].
        #
        #   @return [Hash{Symbol=>String, ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1}]
        required :rules,
                 -> { ContextDev::Internal::Type::HashOf[union: ContextDev::WebScrapeParams::ParseParams::Rule] }

        # @!method initialize(rules:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeParams::ParseParams} for more details.
        #
        #   Required when formats.parse is true.
        #
        #   @param rules [Hash{Symbol=>String, ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1}] Map field names to CSS selectors or rules. Missing items return null; missing li

        module Rule
          extend ContextDev::Internal::Type::Union

          variant String

          variant -> { ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1 }

          class UnionMember1 < ContextDev::Internal::Type::BaseModel
            # @!attribute selector
            #
            #   @return [String]
            required :selector, String

            # @!attribute output
            #
            #   @return [Symbol, String, Object, ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1::Output, nil]
            optional :output, union: -> { ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Output }

            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1::Type, nil]
            optional :type, enum: -> { ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Type }

            # @!method initialize(selector:, output: nil, type: nil)
            #   @param selector [String]
            #   @param output [Symbol, String, Object, ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1::Output]
            #   @param type [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::Rule::UnionMember1::Type]

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
        #   Extract the product with a specialized model when the page has no structured
        #   product data. Adds six credits when the model returns a verdict. If the fallback
        #   fails, returns a partial response with the deterministic result and no fallback
        #   charge. Request deadlines and client disconnects still apply.
        #
        #   @return [Boolean, nil]
        optional :use_ai_fallback, ContextDev::Internal::Type::Boolean, api_name: :useAIFallback

        # @!method initialize(use_ai_fallback: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeParams::ProductParams} for more details.
        #
        #   Product options. Requires formats.product: true.
        #
        #   @param use_ai_fallback [Boolean] Extract the product with a specialized model when the page has no structured pro
      end

      class ScreenshotParams < ContextDev::Internal::Type::BaseModel
        # @!attribute area
        #   Viewport, full page, one visible element, or a rectangle. Maximum 40 megapixels.
        #
        #   @return [Symbol, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Page, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Element, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Rectangle, nil]
        optional :area, union: -> { ContextDev::WebScrapeParams::ScreenshotParams::Area }

        # @!attribute format_
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
        #   @param area [Symbol, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Page, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Element, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Rectangle] Viewport, full page, one visible element, or a rectangle. Maximum 40 megapixels.
        #
        #   @param format_ [Symbol, ContextDev::Models::WebScrapeParams::ScreenshotParams::Format]

        # Viewport, full page, one visible element, or a rectangle. Maximum 40 megapixels.
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
            #   Must match one visible element.
            #
            #   @return [String]
            required :selector, String

            # @!method initialize(selector:)
            #   @param selector [String] Must match one visible element.
          end

          class Rectangle < ContextDev::Internal::Type::BaseModel
            # @!attribute height
            #
            #   @return [Integer]
            required :height, Integer

            # @!attribute width
            #
            #   @return [Integer]
            required :width, Integer

            # @!attribute x
            #
            #   @return [Integer]
            required :x, Integer

            # @!attribute y_
            #
            #   @return [Integer]
            required :y_, Integer, api_name: :y

            # @!method initialize(height:, width:, x:, y_:)
            #   Pixels from the document origin.
            #
            #   @param height [Integer]
            #   @param width [Integer]
            #   @param x [Integer]
            #   @param y_ [Integer]
          end

          # @!method self.variants
          #   @return [Array(Symbol, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Page, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Element, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Rectangle)]
        end

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
        #   Run in order before capture. A failed action fails the request. Bypasses
        #   caching.
        #
        #   @return [Array<ContextDev::Models::WebScrapeParams::SharedParams::Action::Perform, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll, ContextDev::Models::WebScrapeParams::SharedParams::Action::Wait, ContextDev::Models::WebScrapeParams::SharedParams::Action::WaitFor>, nil]
        optional :actions,
                 -> { ContextDev::Internal::Type::ArrayOf[union: ContextDev::WebScrapeParams::SharedParams::Action] }

        # @!attribute country
        #   Supported two-letter country code, case-insensitive. Applies to every output,
        #   including image downloads.
        #
        #   @return [String, nil]
        optional :country, String

        # @!attribute dismiss_cookies
        #   Dismiss cookie banners by accepting cookies before actions.
        #
        #   @return [Boolean, nil]
        optional :dismiss_cookies, ContextDev::Internal::Type::Boolean, api_name: :dismissCookies

        # @!attribute dismiss_popups
        #   Dismiss other popups before actions.
        #
        #   @return [Boolean, nil]
        optional :dismiss_popups, ContextDev::Internal::Type::Boolean, api_name: :dismissPopups

        # @!attribute exclude_selectors
        #   Remove matching content. Exclusions win.
        #
        #   @return [Array<String>, nil]
        optional :exclude_selectors, ContextDev::Internal::Type::ArrayOf[String], api_name: :excludeSelectors

        # @!attribute headers
        #   Headers for the target origin. Requests with custom headers bypass caching.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :headers, ContextDev::Internal::Type::HashOf[String]

        # @!attribute include_frames
        #   Include iframe content in extraction. Screenshots show visible frames
        #   regardless.
        #
        #   @return [Boolean, nil]
        optional :include_frames, ContextDev::Internal::Type::Boolean, api_name: :includeFrames

        # @!attribute include_selectors
        #   Keep matching content after mainContentOnly.
        #
        #   @return [Array<String>, nil]
        optional :include_selectors, ContextDev::Internal::Type::ArrayOf[String], api_name: :includeSelectors

        # @!attribute main_content_only
        #   Keep only main content in HTML, Markdown, images, and parsed fields.
        #
        #   @return [Boolean, nil]
        optional :main_content_only, ContextDev::Internal::Type::Boolean, api_name: :mainContentOnly

        # @!attribute parsers
        #   Document parsing options.
        #
        #   @return [ContextDev::Models::WebScrapeParams::SharedParams::Parsers, nil]
        optional :parsers, -> { ContextDev::WebScrapeParams::SharedParams::Parsers }

        # @!attribute settle_animations
        #   Settle animations before capture. Defaults to true with screenshots, otherwise
        #   false.
        #
        #   @return [Boolean, nil]
        optional :settle_animations, ContextDev::Internal::Type::Boolean, api_name: :settleAnimations

        # @!attribute theme
        #   Override the browser color scheme.
        #
        #   @return [Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Theme, nil]
        optional :theme, enum: -> { ContextDev::WebScrapeParams::SharedParams::Theme }

        # @!attribute viewport
        #   Browser dimensions in pixels.
        #
        #   @return [ContextDev::Models::WebScrapeParams::SharedParams::Viewport, nil]
        optional :viewport, -> { ContextDev::WebScrapeParams::SharedParams::Viewport }

        # @!attribute wait_for
        #   After actions, wait this many milliseconds or until a CSS selector is visible.
        #   Defaults to 500 ms, or 2000 ms with frames or an XML URL. Set 0 to skip.
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
        #   Shared browser and content settings. Content filters leave screenshots and
        #   original bytes unchanged.
        #
        #   @param actions [Array<ContextDev::Models::WebScrapeParams::SharedParams::Action::Perform, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll, ContextDev::Models::WebScrapeParams::SharedParams::Action::Wait, ContextDev::Models::WebScrapeParams::SharedParams::Action::WaitFor>] Run in order before capture. A failed action fails the request. Bypasses caching
        #
        #   @param country [String] Supported two-letter country code, case-insensitive. Applies to every output, in
        #
        #   @param dismiss_cookies [Boolean] Dismiss cookie banners by accepting cookies before actions.
        #
        #   @param dismiss_popups [Boolean] Dismiss other popups before actions.
        #
        #   @param exclude_selectors [Array<String>] Remove matching content. Exclusions win.
        #
        #   @param headers [Hash{Symbol=>String}] Headers for the target origin. Requests with custom headers bypass caching.
        #
        #   @param include_frames [Boolean] Include iframe content in extraction. Screenshots show visible frames regardless
        #
        #   @param include_selectors [Array<String>] Keep matching content after mainContentOnly.
        #
        #   @param main_content_only [Boolean] Keep only main content in HTML, Markdown, images, and parsed fields.
        #
        #   @param parsers [ContextDev::Models::WebScrapeParams::SharedParams::Parsers] Document parsing options.
        #
        #   @param settle_animations [Boolean] Settle animations before capture. Defaults to true with screenshots, otherwise f
        #
        #   @param theme [Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Theme] Override the browser color scheme.
        #
        #   @param viewport [ContextDev::Models::WebScrapeParams::SharedParams::Viewport] Browser dimensions in pixels.
        #
        #   @param wait_for [Integer, String] After actions, wait this many milliseconds or until a CSS selector is visible. D

        module Action
          extend ContextDev::Internal::Type::Union

          discriminator :type

          variant :perform, -> { ContextDev::WebScrapeParams::SharedParams::Action::Perform }

          variant :scroll, -> { ContextDev::WebScrapeParams::SharedParams::Action::Scroll }

          variant :wait, -> { ContextDev::WebScrapeParams::SharedParams::Action::Wait }

          variant :waitFor, -> { ContextDev::WebScrapeParams::SharedParams::Action::WaitFor }

          class Perform < ContextDev::Internal::Type::BaseModel
            # @!attribute action
            #
            #   @return [String]
            required :action, String

            # @!attribute type
            #
            #   @return [Symbol, :perform]
            required :type, const: :perform

            # @!method initialize(action:, type: :perform)
            #   @param action [String]
            #   @param type [Symbol, :perform]
          end

          class Scroll < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :scroll]
            required :type, const: :scroll

            # @!attribute amount
            #
            #   @return [Integer, Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll::Amount, nil]
            optional :amount, union: -> { ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Amount }

            # @!attribute direction
            #
            #   @return [Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll::Direction, nil]
            optional :direction, enum: -> { ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Direction }

            # @!attribute max_scrolls
            #
            #   @return [Integer, nil]
            optional :max_scrolls, Integer, api_name: :maxScrolls

            # @!attribute selector
            #   Scroll this container. Omit to scroll the page.
            #
            #   @return [String, nil]
            optional :selector, String

            # @!method initialize(amount: nil, direction: nil, max_scrolls: nil, selector: nil, type: :scroll)
            #   @param amount [Integer, Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll::Amount]
            #
            #   @param direction [Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll::Direction]
            #
            #   @param max_scrolls [Integer]
            #
            #   @param selector [String] Scroll this container. Omit to scroll the page.
            #
            #   @param type [Symbol, :scroll]

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
            #
            #   @return [Integer]
            required :milliseconds, Integer

            # @!attribute type
            #
            #   @return [Symbol, :wait]
            required :type, const: :wait

            # @!method initialize(milliseconds:, type: :wait)
            #   @param milliseconds [Integer]
            #   @param type [Symbol, :wait]
          end

          class WaitFor < ContextDev::Internal::Type::BaseModel
            # @!attribute selector
            #
            #   @return [String]
            required :selector, String

            # @!attribute type
            #
            #   @return [Symbol, :waitFor]
            required :type, const: :waitFor

            # @!method initialize(selector:, type: :waitFor)
            #   @param selector [String]
            #   @param type [Symbol, :waitFor]
          end

          # @!method self.variants
          #   @return [Array(ContextDev::Models::WebScrapeParams::SharedParams::Action::Perform, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll, ContextDev::Models::WebScrapeParams::SharedParams::Action::Wait, ContextDev::Models::WebScrapeParams::SharedParams::Action::WaitFor)]
        end

        # @see ContextDev::Models::WebScrapeParams::SharedParams#parsers
        class Parsers < ContextDev::Internal::Type::BaseModel
          # @!attribute pdf
          #   PDF text options for HTML, Markdown, and parsed fields.
          #
          #   @return [ContextDev::Models::WebScrapeParams::SharedParams::Parsers::Pdf, nil]
          optional :pdf, -> { ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf }

          # @!method initialize(pdf: nil)
          #   Document parsing options.
          #
          #   @param pdf [ContextDev::Models::WebScrapeParams::SharedParams::Parsers::Pdf] PDF text options for HTML, Markdown, and parsed fields.

          # @see ContextDev::Models::WebScrapeParams::SharedParams::Parsers#pdf
          class Pdf < ContextDev::Internal::Type::BaseModel
            # @!attribute end_page
            #   Last page to parse. Must be at least startPage.
            #
            #   @return [Integer, nil]
            optional :end_page, Integer, api_name: :endPage

            # @!attribute ocr
            #   Read text from scanned pages.
            #
            #   @return [Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr, nil]
            optional :ocr, enum: -> { ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr }

            # @!attribute start_page
            #   First page to parse, starting at 1.
            #
            #   @return [Integer, nil]
            optional :start_page, Integer, api_name: :startPage

            # @!method initialize(end_page: nil, ocr: nil, start_page: nil)
            #   PDF text options for HTML, Markdown, and parsed fields.
            #
            #   @param end_page [Integer] Last page to parse. Must be at least startPage.
            #
            #   @param ocr [Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr] Read text from scanned pages.
            #
            #   @param start_page [Integer] First page to parse, starting at 1.

            # Read text from scanned pages.
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

        # Override the browser color scheme.
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
          #
          #   @return [Integer, nil]
          optional :height, Integer

          # @!attribute width
          #
          #   @return [Integer, nil]
          optional :width, Integer

          # @!method initialize(height: nil, width: nil)
          #   Browser dimensions in pixels.
          #
          #   @param height [Integer]
          #   @param width [Integer]
        end

        # After actions, wait this many milliseconds or until a CSS selector is visible.
        # Defaults to 500 ms, or 2000 ms with frames or an XML URL. Set 0 to skip.
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
        #   Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        #
        #   @return [Integer]
        required :milliseconds, Integer

        # @!attribute behavior
        #   What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        #   credits. "return-partial" returns usable results collected so far; if none are
        #   available, the request still fails without charging credits. Partial results are
        #   not cached as complete results. "return-partial" requires milliseconds of at
        #   least 5000.
        #
        #   @return [Symbol, ContextDev::Models::WebScrapeParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::WebScrapeParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeParams::TimeoutOpts} for more details.
        #
        #   Total deadline, including navigation, actions, waiting, and all outputs.
        #   Defaults to 60000 milliseconds with behavior fail. Use return-partial to capture
        #   the current page state and return captured images if image processing cannot
        #   finish before the deadline; these responses set isPartial and are not cached.
        #   Every requested format must still be available. Fixed waits must fit before a
        #   response reserve of up to 5000 milliseconds (at most one quarter of the timeout)
        #   when using return-partial.
        #
        #   @param milliseconds [Integer] Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        #
        #   @param behavior [Symbol, ContextDev::Models::WebScrapeParams::TimeoutOpts::Behavior] What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results. "return-partial" requires milliseconds of at
        # least 5000.
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

      # Zero data retention. Bypasses caches and uploads; excludes request/response
      # content and tags from logs. Must be enabled for your organization.
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
