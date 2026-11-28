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
      #   Query for the `highlights` output. Required when `formats.highlights` is `true`,
      #   and allowed only then.
      #
      #   @return [ContextDev::Models::WebScrapeParams::HighlightsParams, nil]
      optional :highlights_params,
               -> { ContextDev::WebScrapeParams::HighlightsParams },
               api_name: :highlightsParams

      # @!attribute image_params
      #   Options for the `images` output. Requires `formats.images: true`.
      #
      #   @return [ContextDev::Models::WebScrapeParams::ImageParams, nil]
      optional :image_params, -> { ContextDev::WebScrapeParams::ImageParams }, api_name: :imageParams

      # @!attribute json_params
      #   Schema and instructions for the `json` output. Required when `formats.json` is
      #   `true`, and allowed only then.
      #
      #   @return [ContextDev::Models::WebScrapeParams::JsonParams, nil]
      optional :json_params, -> { ContextDev::WebScrapeParams::JsonParams }, api_name: :jsonParams

      # @!attribute markdown_params
      #   Options for the `markdown` output. Requires `formats.markdown: true`.
      #
      #   @return [ContextDev::Models::WebScrapeParams::MarkdownParams, nil]
      optional :markdown_params, -> { ContextDev::WebScrapeParams::MarkdownParams }, api_name: :markdownParams

      # @!attribute max_age_ms
      #   Maximum age of a cached result, in milliseconds. `0` always fetches fresh.
      #   Defaults to 3 days (259200000 ms). Maximum: 1 year (31536000000 ms).
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer, api_name: :maxAgeMs

      # @!attribute parse_params
      #   Custom rules or a prebuilt parser for the `parsed` output. Required when
      #   `formats.parse` is `true`, and allowed only then.
      #
      #   @return [ContextDev::Models::WebScrapeParams::ParseParams::CustomParser, ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser, nil]
      optional :parse_params, union: -> { ContextDev::WebScrapeParams::ParseParams }, api_name: :parseParams

      # @!attribute policies
      #   Access policy IDs to apply; each URL must pass all of them. Requires access
      #   policies enabled for your organization; otherwise returns
      #   `ACCESS_POLICIES_NOT_ENABLED`.
      #
      #   @return [Array<String>, nil]
      optional :policies, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute product_params
      #   Options for the `product` output. Requires `formats.product: true`.
      #
      #   @return [ContextDev::Models::WebScrapeParams::ProductParams, nil]
      optional :product_params, -> { ContextDev::WebScrapeParams::ProductParams }, api_name: :productParams

      # @!attribute screenshot_params
      #   Options for the `screenshot` output. Requires `formats.screenshot: true`.
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
      #   Labels for this request. Filter usage and request logs by them in the dashboard
      #   or with `GET /org/logs`.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Request deadline and what to return when it passes.
      #
      #   @return [ContextDev::Models::WebScrapeParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::WebScrapeParams::TimeoutOpts }, api_name: :timeoutOpts

      # @!attribute zdr
      #   `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      #   your organization has ZDR.
      #
      #   @return [Symbol, ContextDev::Models::WebScrapeParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebScrapeParams::Zdr }

      # @!method initialize(formats:, url:, highlights_params: nil, image_params: nil, json_params: nil, markdown_params: nil, max_age_ms: nil, parse_params: nil, policies: nil, product_params: nil, screenshot_params: nil, shared_params: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebScrapeParams} for more details.
      #
      #   @param formats [ContextDev::Models::WebScrapeParams::Formats] Outputs to return. Set at least one to `true`.
      #
      #   @param url [String] Public HTTP or HTTPS URL to scrape.
      #
      #   @param highlights_params [ContextDev::Models::WebScrapeParams::HighlightsParams] Query for the `highlights` output. Required when `formats.highlights` is `true`,
      #
      #   @param image_params [ContextDev::Models::WebScrapeParams::ImageParams] Options for the `images` output. Requires `formats.images: true`.
      #
      #   @param json_params [ContextDev::Models::WebScrapeParams::JsonParams] Schema and instructions for the `json` output. Required when `formats.json` is `
      #
      #   @param markdown_params [ContextDev::Models::WebScrapeParams::MarkdownParams] Options for the `markdown` output. Requires `formats.markdown: true`.
      #
      #   @param max_age_ms [Integer] Maximum age of a cached result, in milliseconds. `0` always fetches fresh. Defau
      #
      #   @param parse_params [ContextDev::Models::WebScrapeParams::ParseParams::CustomParser, ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser] Custom rules or a prebuilt parser for the `parsed` output. Required when `format
      #
      #   @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
      #
      #   @param product_params [ContextDev::Models::WebScrapeParams::ProductParams] Options for the `product` output. Requires `formats.product: true`.
      #
      #   @param screenshot_params [ContextDev::Models::WebScrapeParams::ScreenshotParams] Options for the `screenshot` output. Requires `formats.screenshot: true`.
      #
      #   @param shared_params [ContextDev::Models::WebScrapeParams::SharedParams] Browser and content settings shared by all outputs.
      #
      #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
      #
      #   @param timeout_opts [ContextDev::Models::WebScrapeParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      #   @param zdr [Symbol, ContextDev::Models::WebScrapeParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      class Formats < ContextDev::Internal::Type::BaseModel
        # @!attribute bytes
        #   Return the original HTTP response body.
        #
        #   @return [Boolean, nil]
        optional :bytes, ContextDev::Internal::Type::Boolean

        # @!attribute highlights
        #   Return Markdown excerpts relevant to `highlightsParams.query`.
        #
        #   @return [Boolean, nil]
        optional :highlights, ContextDev::Internal::Type::Boolean

        # @!attribute html
        #   Return the rendered HTML.
        #
        #   @return [Boolean, nil]
        optional :html, ContextDev::Internal::Type::Boolean

        # @!attribute images
        #   Return the images found on the page.
        #
        #   @return [Boolean, nil]
        optional :images, ContextDev::Internal::Type::Boolean

        # @!attribute json
        #   Return an object matching `jsonParams.schema`, extracted from the page text and
        #   embedded data such as JSON-LD, meta tags, and framework state.
        #
        #   @return [Boolean, nil]
        optional :json, ContextDev::Internal::Type::Boolean

        # @!attribute markdown
        #   Return the page content, or a video transcript, as Markdown.
        #
        #   @return [Boolean, nil]
        optional :markdown, ContextDev::Internal::Type::Boolean

        # @!attribute parse
        #   Return fields extracted with custom rules or a prebuilt parser, as `parsed`.
        #
        #   @return [Boolean, nil]
        optional :parse, ContextDev::Internal::Type::Boolean

        # @!attribute product
        #   Return product details such as name, price, and availability.
        #
        #   @return [Boolean, nil]
        optional :product, ContextDev::Internal::Type::Boolean

        # @!attribute screenshot
        #   Return a screenshot of the page.
        #
        #   @return [Boolean, nil]
        optional :screenshot, ContextDev::Internal::Type::Boolean

        # @!method initialize(bytes: nil, highlights: nil, html: nil, images: nil, json: nil, markdown: nil, parse: nil, product: nil, screenshot: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeParams::Formats} for more details.
        #
        #   Outputs to return. Set at least one to `true`.
        #
        #   @param bytes [Boolean] Return the original HTTP response body.
        #
        #   @param highlights [Boolean] Return Markdown excerpts relevant to `highlightsParams.query`.
        #
        #   @param html [Boolean] Return the rendered HTML.
        #
        #   @param images [Boolean] Return the images found on the page.
        #
        #   @param json [Boolean] Return an object matching `jsonParams.schema`, extracted from the page text and
        #
        #   @param markdown [Boolean] Return the page content, or a video transcript, as Markdown.
        #
        #   @param parse [Boolean] Return fields extracted with custom rules or a prebuilt parser, as `parsed`.
        #
        #   @param product [Boolean] Return product details such as name, price, and availability.
        #
        #   @param screenshot [Boolean] Return a screenshot of the page.
      end

      class HighlightsParams < ContextDev::Internal::Type::BaseModel
        # @!attribute query
        #   Question or topic to find relevant passages for.
        #
        #   @return [String]
        required :query, String

        # @!attribute max_characters
        #   Maximum combined length of the returned passages, in characters.
        #
        #   @return [Integer, nil]
        optional :max_characters, Integer, api_name: :maxCharacters

        # @!method initialize(query:, max_characters: nil)
        #   Query for the `highlights` output. Required when `formats.highlights` is `true`,
        #   and allowed only then.
        #
        #   @param query [String] Question or topic to find relevant passages for.
        #
        #   @param max_characters [Integer] Maximum combined length of the returned passages, in characters.
      end

      class ImageParams < ContextDev::Internal::Type::BaseModel
        # @!attribute dedupe
        #   Set to `visual` to drop visually duplicate images, keeping the largest copy.
        #
        #   @return [Symbol, ContextDev::Models::WebScrapeParams::ImageParams::Dedupe, nil]
        optional :dedupe, enum: -> { ContextDev::WebScrapeParams::ImageParams::Dedupe }

        # @!attribute enrich
        #   Extra data to add to each image: `dimensions` adds `width` and `height`,
        #   `classification` adds `classification`, and `file` adds a hosted `fileUrl`.
        #
        #   @return [Array<Symbol, ContextDev::Models::WebScrapeParams::ImageParams::Enrich>, nil]
        optional :enrich,
                 -> { ContextDev::Internal::Type::ArrayOf[enum: ContextDev::WebScrapeParams::ImageParams::Enrich] }

        # @!method initialize(dedupe: nil, enrich: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeParams::ImageParams} for more details.
        #
        #   Options for the `images` output. Requires `formats.images: true`.
        #
        #   @param dedupe [Symbol, ContextDev::Models::WebScrapeParams::ImageParams::Dedupe] Set to `visual` to drop visually duplicate images, keeping the largest copy.
        #
        #   @param enrich [Array<Symbol, ContextDev::Models::WebScrapeParams::ImageParams::Enrich>] Extra data to add to each image: `dimensions` adds `width` and `height`, `classi

        # Set to `visual` to drop visually duplicate images, keeping the largest copy.
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
        #   JSON Schema for the object to extract, not an example object. Must describe a
        #   top-level object, up to 50 KB. Make fields optional or nullable when the page
        #   may not state them.
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
        #   Schema and instructions for the `json` output. Required when `formats.json` is
        #   `true`, and allowed only then.
        #
        #   @param schema [Hash{Symbol=>Object}] JSON Schema for the object to extract, not an example object. Must describe a to
        #
        #   @param instructions [String] Extra guidance, such as which facts to prefer or how to read a field.
      end

      class MarkdownParams < ContextDev::Internal::Type::BaseModel
        # @!attribute include_images
        #   Include image references in the Markdown (`html-conversion` only).
        #
        #   @return [Boolean, nil]
        optional :include_images, ContextDev::Internal::Type::Boolean, api_name: :includeImages

        # @!attribute include_links
        #   Keep link URLs in the Markdown (`html-conversion` only).
        #
        #   @return [Boolean, nil]
        optional :include_links, ContextDev::Internal::Type::Boolean, api_name: :includeLinks

        # @!attribute inline_images
        #   How to write base64 images when `includeImages` is `true`: `placeholder`
        #   shortens the data, `preserve` keeps it in full (`html-conversion` only).
        #
        #   @return [Symbol, ContextDev::Models::WebScrapeParams::MarkdownParams::InlineImages, nil]
        optional :inline_images,
                 enum: -> { ContextDev::WebScrapeParams::MarkdownParams::InlineImages },
                 api_name: :inlineImages

        # @!attribute source_preference
        #   Markdown sources in order of preference: `html-conversion` converts the page
        #   HTML, `markdown-direct` uses Markdown the site publishes.
        #
        #   @return [Array<Symbol, ContextDev::Models::WebScrapeParams::MarkdownParams::SourcePreference>, nil]
        optional :source_preference,
                 -> {
                   ContextDev::Internal::Type::ArrayOf[enum: ContextDev::WebScrapeParams::MarkdownParams::SourcePreference]
                 },
                 api_name: :sourcePreference

        # @!method initialize(include_images: nil, include_links: nil, inline_images: nil, source_preference: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeParams::MarkdownParams} for more details.
        #
        #   Options for the `markdown` output. Requires `formats.markdown: true`.
        #
        #   @param include_images [Boolean] Include image references in the Markdown (`html-conversion` only).
        #
        #   @param include_links [Boolean] Keep link URLs in the Markdown (`html-conversion` only).
        #
        #   @param inline_images [Symbol, ContextDev::Models::WebScrapeParams::MarkdownParams::InlineImages] How to write base64 images when `includeImages` is `true`: `placeholder` shorten
        #
        #   @param source_preference [Array<Symbol, ContextDev::Models::WebScrapeParams::MarkdownParams::SourcePreference>] Markdown sources in order of preference: `html-conversion` converts the page HTM

        # How to write base64 images when `includeImages` is `true`: `placeholder`
        # shortens the data, `preserve` keeps it in full (`html-conversion` only).
        #
        # @see ContextDev::Models::WebScrapeParams::MarkdownParams#inline_images
        module InlineImages
          extend ContextDev::Internal::Type::Enum

          PLACEHOLDER = :placeholder
          PRESERVE = :preserve

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        module SourcePreference
          extend ContextDev::Internal::Type::Enum

          HTML_CONVERSION = :"html-conversion"
          MARKDOWN_DIRECT = :"markdown-direct"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # Custom rules or a prebuilt parser for the `parsed` output. Required when
      # `formats.parse` is `true`, and allowed only then.
      module ParseParams
        extend ContextDev::Internal::Type::Union

        variant -> { ContextDev::WebScrapeParams::ParseParams::CustomParser }

        variant -> { ContextDev::WebScrapeParams::ParseParams::PrebuiltParser }

        class CustomParser < ContextDev::Internal::Type::BaseModel
          # @!attribute rules
          #   Output field names mapped to a CSS selector (such as `h1` or `a@href`) or a rule
          #   object. Up to 100 fields, nested up to 5 levels.
          #
          #   @return [Hash{Symbol=>String, ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1}]
          required :rules,
                   -> { ContextDev::Internal::Type::HashOf[union: ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule] }

          # @!attribute type
          #   Extract fields with custom CSS rules. The default when `type` is omitted.
          #
          #   @return [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Type, nil]
          optional :type, enum: -> { ContextDev::WebScrapeParams::ParseParams::CustomParser::Type }

          # @!method initialize(rules:, type: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::WebScrapeParams::ParseParams::CustomParser} for more
          #   details.
          #
          #   @param rules [Hash{Symbol=>String, ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1}] Output field names mapped to a CSS selector (such as `h1` or `a@href`) or a rule
          #
          #   @param type [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Type] Extract fields with custom CSS rules. The default when `type` is omitted.

          module Rule
            extend ContextDev::Internal::Type::Union

            variant String

            variant -> { ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1 }

            class UnionMember1 < ContextDev::Internal::Type::BaseModel
              # @!attribute selector
              #   CSS selector to match within the current page or parent rule.
              #
              #   @return [String]
              required :selector, String

              # @!attribute output
              #   What to return: `text`, `html`, an attribute such as `@href`, or nested field
              #   rules. Defaults to `text`.
              #
              #   @return [Symbol, String, Object, ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Output, nil]
              optional :output,
                       union: -> { ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Output }

              # @!attribute type
              #   Return the first match with `item` or all matches with `list`.
              #
              #   @return [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Type, nil]
              optional :type,
                       enum: -> { ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Type }

              # @!method initialize(selector:, output: nil, type: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1}
              #   for more details.
              #
              #   @param selector [String] CSS selector to match within the current page or parent rule.
              #
              #   @param output [Symbol, String, Object, ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Output] What to return: `text`, `html`, an attribute such as `@href`, or nested field ru
              #
              #   @param type [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Type] Return the first match with `item` or all matches with `list`.

              # What to return: `text`, `html`, an attribute such as `@href`, or nested field
              # rules. Defaults to `text`.
              #
              # @see ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1#output
              module Output
                extend ContextDev::Internal::Type::Union

                variant const: -> { ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Output::TEXT }

                variant const: -> { ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Output::HTML }

                variant String

                variant ContextDev::Internal::Type::Unknown

                # @!method self.variants
                #   @return [Array(Symbol, String, Object)]

                define_sorbet_constant!(:Variants) do
                  T.type_alias do
                    T.any(
                      ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Output::TaggedSymbol,
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
              # @see ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1#type
              module Type
                extend ContextDev::Internal::Type::Enum

                ITEM = :item
                LIST = :list

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @!method self.variants
            #   @return [Array(String, ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1)]
          end

          # Extract fields with custom CSS rules. The default when `type` is omitted.
          #
          # @see ContextDev::Models::WebScrapeParams::ParseParams::CustomParser#type
          module Type
            extend ContextDev::Internal::Type::Enum

            CUSTOM = :custom

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class PrebuiltParser < ContextDev::Internal::Type::BaseModel
          # @!attribute parser
          #   Prebuilt parser to run. Each one accepts specific URLs and returns its result in
          #   `parsed.data`. `emails`, `phone-numbers`, and `links` read the rendered page and
          #   respect content filters; the others read their source directly, independently of
          #   content filters and other outputs.
          #
          #   - `google-maps`: Google Maps place, search, and internal data URLs. Returns
          #     businesses in `data.results`; a search URL returns up to 200 places. Results
          #     use the country set in the URL, or the US when none is set, and come back with
          #     English labels.
          #   - `google-maps-reviews`: Google Maps place, search, and `?cid=` URLs, plus
          #     `search.google.com/local/reviews` URLs, so the `google_maps_url` and
          #     `google_reviews_url` fields of `google-maps` results work as input. Returns
          #     the reviews of the place in `data.reviews` (`rating`, `date`, `isoDate`,
          #     `snippet`, `translatedSnippet`, `likes`, `user`, `media`, `response`, `link`,
          #     `id`, `language`, guided ratings in `details`, and `user.isLocalGuide`), plus
          #     the place `featureId`, `cid`, and `sort` in `data`. `sort` and `limit` set the
          #     order and count; `oldest` is exact. An unknown place returns no reviews.
          #   - `google-play`: Play Store app details URLs
          #     (`play.google.com/store/apps/details?id=…`). Returns one app in `data`:
          #     details, developer contact, ratings, price, permissions, data safety, the
          #     storefront country the record describes, and `is_available` (whether the app
          #     is offered there). Ratings are counted per storefront, so `rating`,
          #     `rating_count`, and `rating_histogram` are `null` where nobody rated the app.
          #     The language and storefront country set in the URL apply (default English and
          #     the US); without a storefront country, an app not offered in the US is read
          #     from the country of its developer.
          #   - `google-play-reviews`: Same URLs as `google-play`. Returns up to the 200
          #     newest reviews in the language set in the URL, with developer replies, in
          #     `data.reviews`; an app with fewer such reviews returns them all.
          #   - `app-store`: App Store app URLs (`apps.apple.com/us/app/…/id…`). Returns one
          #     app in `data`: details, developer, ratings, price, version, and screenshots.
          #     The country in the path sets the storefront (default `us`).
          #   - `app-store-reviews`: Same URLs as `app-store`. Returns up to the 500 newest
          #     reviews in `data.reviews`.
          #   - `g2-reviews`: G2 product URLs (`g2.com/products/…`), following renamed
          #     products. Returns the 25 most recently published reviews in `data.reviews`
          #     (rating, title, likes, dislikes, `problems_solved`, reviewer role, company
          #     size, and industry), plus `data.product`. Keeps star-rating filters from the
          #     URL (`filters[nps_score][]=1` to `5`) and ignores other filters, sort orders,
          #     and pages.
          #   - `instagram-profile`: Public profile URLs (`instagram.com/{username}`). Returns
          #     one profile in `data`: bio, links, follower and post counts, category,
          #     business address, `similar_accounts`, and `latest_posts` (up to the 12 posts
          #     at the top of the profile, newest first). Instagram lists pinned posts first,
          #     so posts with `is_pinned: true` can be older. When Instagram shows only a
          #     rounded post count (such as 32K), `post_count` is that rounded number and
          #     `is_post_count_rounded` is `true`.
          #   - `instagram-post`: Post and reel URLs (`/p/…`, `/reel/…`). Returns one post in
          #     `data`: caption, hashtags, mentions, like, comment, and view counts
          #     (`like_count` and `view_count` are `null` when the owner hides them), media
          #     URLs, tagged users, collaborators, location, and about the top 14 comments in
          #     `data.comments`.
          #   - `instagram-feed`: Hashtag and keyword URLs (`/explore/tags/…`, `/popular/…`)
          #     return the top posts; location URLs (`/explore/locations/{id}/…`) return
          #     recent posts. Posts are in `data.posts`; keyword posts carry only the
          #     shortcode, owner, thumbnail, and views, plus the caption when Instagram shows
          #     it. All three Instagram parsers read public data without signing in, so
          #     private accounts return no posts and follower lists are unavailable.
          #   - `tiktok-profile`: Public profile URLs (`tiktok.com/@{username}`). Returns one
          #     profile in `data`: nickname, bio, bio link, follower, following, like, and
          #     video counts, verified, private, and business flags, and business category.
          #     Does not list videos.
          #   - `tiktok-video`: Video and photo post URLs (`/@{username}/video/{id}`,
          #     `/@{username}/photo/{id}`). Returns one post in `data`: caption, hashtags,
          #     mentions, author, view, like, comment, share, save, and repost counts,
          #     duration, thumbnail, a `video_url` that downloads without cookies,
          #     `image_urls` for photo posts, music, location, and ad, paid-partnership, and
          #     AI-generated flags.
          #   - `tiktok-feed`: Returns videos in the `tiktok-video` shape in `data.videos`:
          #     the latest 15 from a profile URL, the top 30 from a hashtag URL
          #     (`/tag/{name}`), or the top 12 from a search URL (`/search?q={query}`).
          #   - `tiktok-comments`: Video and photo post URLs. Returns the first 20 comments in
          #     `data.comments`: text, `posted_at`, like and reply counts, whether the author
          #     liked it, and the commenter.
          #   - `tiktok-followers`, `tiktok-following`: Profile URLs. Return up to 30 accounts
          #     in `data.users`, in the `tiktok-profile` shape.
          #   - `tiktok-user-search`: User search URLs (`/search/user?q={query}`). Returns the
          #     top 10 accounts in `data.users`: `id`, `username`, `nickname`, `biography`,
          #     `avatar_url`, `sec_uid`, `follower_count`, `like_count`, and `is_verified`.
          #     The TikTok parsers accept `tiktok.com`, `www.tiktok.com`, and `m.tiktok.com`
          #     URLs, not short links (`vm.tiktok.com`, `vt.tiktok.com`, `tiktok.com/t/…`).
          #   - `reddit-post`: Post URLs (`reddit.com/r/{subreddit}/comments/{id}`,
          #     `reddit.com/comments/{id}`, `redd.it/{id}`). Returns the post in `data.post`:
          #     title, body as Markdown, type (`text`, `link`, `image`, `gallery`, or
          #     `video`), `link_url`, subreddit, author, flairs, score, `upvote_ratio`,
          #     comment and crosspost counts, NSFW, spoiler, locked, stickied, and archived
          #     flags, images (every gallery image in order), and video (an MP4 `url` plus an
          #     `hls_url` that carries the audio). `data.comments` holds the comment tree;
          #     each comment has `id`, `author`, `body` (Markdown), `score`, `posted_at`,
          #     `depth`, `parent_id`, `url`, `is_submitter`, `is_deleted`, and its `replies`.
          #     `limit` caps the total number of comments (default 100), filled shallowest
          #     first so whole conversations are kept, and `data.has_more_comments` says
          #     whether the thread has more. The `sort` in the URL (`best`, `top`, `new`,
          #     `controversial`, `old`, `qa`) orders the comments.
          #   - `reddit-search`: Search URLs (`reddit.com/search?q={query}`, or
          #     `reddit.com/r/{subreddit}/search?q={query}` to search one subreddit). With
          #     `type=link` or no `type`, returns posts in the `reddit-post` shape in
          #     `data.posts`, ordered by the `sort` in the URL (`relevance`, `hot`, `top`,
          #     `new`, `comments`) within its `t` time range (`hour`, `day`, `week`, `month`,
          #     `year`, `all`). `type=sr` returns communities in `data.communities` (name,
          #     title, description, sidebar, `subscriber_count`, `created_at`, type, NSFW and
          #     quarantine flags, language, category, icon and banner URLs, and allowed post
          #     types). `type=user` returns accounts in `data.users` (username,
          #     `display_name`, bio, `created_at`, post and comment karma, avatar and banner
          #     URLs, and verified, employee, moderator, premium, and NSFW flags). `limit`
          #     caps the number of results (default 100), in the order Reddit returns them,
          #     and `data.has_more` says whether Reddit has more.
          #   - `reddit-subreddit`: Subreddit URLs (`reddit.com/r/{subreddit}`, optionally
          #     followed by `/hot`, `/new`, `/top`, `/rising`, or `/controversial`, with `t`
          #     setting the time range of `top` and `controversial`, default `day`). Returns
          #     `data.subreddit` in the community shape of `reddit-search`, `data.rules`
          #     (`name`, `description`, `applies_to`, `violation_reason`, `created_at`), and
          #     `data.posts` in the `reddit-post` shape, ordered like the tab (default `hot`)
          #     with stickied posts flagged. `r/all` and `r/popular` return posts with `null`
          #     `subreddit` and `rules`. `limit` caps the posts (default 100) and
          #     `data.has_more` says whether Reddit has more. Private and quarantined
          #     subreddits return `WEBSITE_ACCESS_ERROR`.
          #   - `reddit-user`: Profile URLs (`reddit.com/user/{username}` or
          #     `reddit.com/u/{username}`, optionally followed by `/overview`, `/submitted`,
          #     or `/comments`, with `sort` set to `new`, `hot`, `top`, or `controversial` and
          #     `t` setting the time range of `top` and `controversial`, default `all`).
          #     Returns `data.user` (`id`, `username`, `display_name`, bio, `created_at`,
          #     total, post, comment, awardee, and awarder karma, avatar and banner URLs, and
          #     verified, suspended, employee, moderator, premium, and NSFW flags),
          #     `data.trophies` (`name`, `description`, `icon_url`, `granted_at`, `url`),
          #     `data.moderated_communities` (`name`, `title`, `url`, `subscriber_count`,
          #     `icon_url`, `is_nsfw`), `data.posts` in the `reddit-post` shape, and
          #     `data.comments`, each with `id`, `author`, `body` (Markdown), `score`,
          #     `posted_at`, `edited_at`, `url`, `subreddit`, `parent_id` (`null` for a
          #     top-level comment), `is_submitter`, `is_stickied`, `distinguished`,
          #     `award_count`, and the post it was left on (`id`, `title`, `url`, `author`,
          #     `is_nsfw`). The overview tab returns both posts and comments; `submitted`
          #     returns `null` comments and `comments` returns `null` posts. `limit` caps
          #     posts and comments together (default 100) and `data.has_more` says whether
          #     Reddit has more. Users who hide their activity return empty lists, and
          #     suspended accounts return their profile with `null` posts and comments.
          #   - `yelp-search`: Yelp search URLs with `find_desc` and `find_loc`; `start` sets
          #     the result offset. Returns up to 20 ranked organic businesses in
          #     `data.businesses`, with `total` and `pagination`.
          #   - `yelp-reviews`: Yelp business URLs (`yelp.com/biz/{alias}`); optional `start`
          #     sets the offset. Returns up to 20 of the latest public reviews, always newest
          #     first, in `data.reviews`, with business details and `pagination.next_offset`.
          #     Each review has rating, full text, `updated_at`, and author (`id` from the
          #     reviewer profile URL, `url` linking to that profile, `name`, `location`, and
          #     `review_count`); owner replies and photos are not included. Unsupported sort
          #     and review filters are rejected; tracking parameters are ignored.
          #   - `tripadvisor-reviews`: Tripadvisor hotel, restaurant, and attraction review
          #     URLs (`tripadvisor.com/Hotel_Review-g{geo}-d{id}-Reviews-….html`, on any
          #     Tripadvisor country domain); `-or{N}-` in the path sets the offset. Returns 20
          #     reviews in `data.reviews` in the order Tripadvisor shows them, with
          #     `data.location` (`id`, `name`, `type`, `url`, `review_count`) and
          #     `pagination.next_offset`. Each review has `id`, `url`, `title`, full text,
          #     `rating`, `language`, `published_at`, `visit_month`, `helpful_votes`,
          #     `subratings`, `photo_urls`, `owner_response` (`text`, `published_at`,
          #     `author_name`), and `author` (`id`, `username`, `name`, `url`,
          #     `contribution_count`). An unknown location returns no reviews.
          #   - `car-rental-availability`: avis.com and budget.com vehicle-availability search
          #     URLs. Returns every vehicle with pay-now and pay-later prices in
          #     `data.vehicles`.
          #   - `car-rental-locations`: avis.com and budget.com `/locations?keyword=` URLs.
          #     Returns rental branches with codes, addresses, coordinates, and hours in
          #     `data.locations`.
          #   - `emails`: Any page. Returns its email addresses in `data.emails`
          #     (`[{ email }]`), read from `mailto:` links, Cloudflare-protected addresses,
          #     and visible text.
          #   - `phone-numbers`: Any page. Returns its valid phone numbers in E.164 format in
          #     `data.phone_numbers` (`[{ phone }]`), read from `tel:` links and visible text.
          #     Numbers without a country code are read for the country of the site TLD (US by
          #     default).
          #   - `links`: Any page. Returns its unique HTTP and HTTPS links as absolute URLs in
          #     `data.links` (`[{ url, text }]`). `text` falls back to `aria-label` or image
          #     alt text and is `null` when a link has none.
          #
          #   @return [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser::Parser]
          required :parser, enum: -> { ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser }

          # @!attribute type
          #   Use a prebuilt parser instead of custom rules.
          #
          #   @return [Symbol, :prebuilt]
          required :type, const: :prebuilt

          # @!attribute limit
          #   Maximum number of reviews (`google-maps-reviews`, default 100), comments
          #   (`reddit-post`, default 100), or results (`reddit-search`, `reddit-subreddit`,
          #   and `reddit-user`, default 100) to return. Only these parsers accept it.
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute sort
          #   Order of `data.reviews` for `google-maps-reviews`. `newest`, `relevant`,
          #   `highest`, and `lowest` use the same orders as Google Maps; `oldest` returns the
          #   earliest reviews first.
          #
          #   @return [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser::Sort, nil]
          optional :sort, enum: -> { ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Sort }

          # @!method initialize(parser:, limit: nil, sort: nil, type: :prebuilt)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser} for more
          #   details.
          #
          #   @param parser [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser::Parser] Prebuilt parser to run. Each one accepts specific URLs and returns its result in
          #
          #   @param limit [Integer] Maximum number of reviews (`google-maps-reviews`, default 100), comments (`reddi
          #
          #   @param sort [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser::Sort] Order of `data.reviews` for `google-maps-reviews`. `newest`, `relevant`, `highes
          #
          #   @param type [Symbol, :prebuilt] Use a prebuilt parser instead of custom rules.

          # Prebuilt parser to run. Each one accepts specific URLs and returns its result in
          # `parsed.data`. `emails`, `phone-numbers`, and `links` read the rendered page and
          # respect content filters; the others read their source directly, independently of
          # content filters and other outputs.
          #
          # - `google-maps`: Google Maps place, search, and internal data URLs. Returns
          #   businesses in `data.results`; a search URL returns up to 200 places. Results
          #   use the country set in the URL, or the US when none is set, and come back with
          #   English labels.
          # - `google-maps-reviews`: Google Maps place, search, and `?cid=` URLs, plus
          #   `search.google.com/local/reviews` URLs, so the `google_maps_url` and
          #   `google_reviews_url` fields of `google-maps` results work as input. Returns
          #   the reviews of the place in `data.reviews` (`rating`, `date`, `isoDate`,
          #   `snippet`, `translatedSnippet`, `likes`, `user`, `media`, `response`, `link`,
          #   `id`, `language`, guided ratings in `details`, and `user.isLocalGuide`), plus
          #   the place `featureId`, `cid`, and `sort` in `data`. `sort` and `limit` set the
          #   order and count; `oldest` is exact. An unknown place returns no reviews.
          # - `google-play`: Play Store app details URLs
          #   (`play.google.com/store/apps/details?id=…`). Returns one app in `data`:
          #   details, developer contact, ratings, price, permissions, data safety, the
          #   storefront country the record describes, and `is_available` (whether the app
          #   is offered there). Ratings are counted per storefront, so `rating`,
          #   `rating_count`, and `rating_histogram` are `null` where nobody rated the app.
          #   The language and storefront country set in the URL apply (default English and
          #   the US); without a storefront country, an app not offered in the US is read
          #   from the country of its developer.
          # - `google-play-reviews`: Same URLs as `google-play`. Returns up to the 200
          #   newest reviews in the language set in the URL, with developer replies, in
          #   `data.reviews`; an app with fewer such reviews returns them all.
          # - `app-store`: App Store app URLs (`apps.apple.com/us/app/…/id…`). Returns one
          #   app in `data`: details, developer, ratings, price, version, and screenshots.
          #   The country in the path sets the storefront (default `us`).
          # - `app-store-reviews`: Same URLs as `app-store`. Returns up to the 500 newest
          #   reviews in `data.reviews`.
          # - `g2-reviews`: G2 product URLs (`g2.com/products/…`), following renamed
          #   products. Returns the 25 most recently published reviews in `data.reviews`
          #   (rating, title, likes, dislikes, `problems_solved`, reviewer role, company
          #   size, and industry), plus `data.product`. Keeps star-rating filters from the
          #   URL (`filters[nps_score][]=1` to `5`) and ignores other filters, sort orders,
          #   and pages.
          # - `instagram-profile`: Public profile URLs (`instagram.com/{username}`). Returns
          #   one profile in `data`: bio, links, follower and post counts, category,
          #   business address, `similar_accounts`, and `latest_posts` (up to the 12 posts
          #   at the top of the profile, newest first). Instagram lists pinned posts first,
          #   so posts with `is_pinned: true` can be older. When Instagram shows only a
          #   rounded post count (such as 32K), `post_count` is that rounded number and
          #   `is_post_count_rounded` is `true`.
          # - `instagram-post`: Post and reel URLs (`/p/…`, `/reel/…`). Returns one post in
          #   `data`: caption, hashtags, mentions, like, comment, and view counts
          #   (`like_count` and `view_count` are `null` when the owner hides them), media
          #   URLs, tagged users, collaborators, location, and about the top 14 comments in
          #   `data.comments`.
          # - `instagram-feed`: Hashtag and keyword URLs (`/explore/tags/…`, `/popular/…`)
          #   return the top posts; location URLs (`/explore/locations/{id}/…`) return
          #   recent posts. Posts are in `data.posts`; keyword posts carry only the
          #   shortcode, owner, thumbnail, and views, plus the caption when Instagram shows
          #   it. All three Instagram parsers read public data without signing in, so
          #   private accounts return no posts and follower lists are unavailable.
          # - `tiktok-profile`: Public profile URLs (`tiktok.com/@{username}`). Returns one
          #   profile in `data`: nickname, bio, bio link, follower, following, like, and
          #   video counts, verified, private, and business flags, and business category.
          #   Does not list videos.
          # - `tiktok-video`: Video and photo post URLs (`/@{username}/video/{id}`,
          #   `/@{username}/photo/{id}`). Returns one post in `data`: caption, hashtags,
          #   mentions, author, view, like, comment, share, save, and repost counts,
          #   duration, thumbnail, a `video_url` that downloads without cookies,
          #   `image_urls` for photo posts, music, location, and ad, paid-partnership, and
          #   AI-generated flags.
          # - `tiktok-feed`: Returns videos in the `tiktok-video` shape in `data.videos`:
          #   the latest 15 from a profile URL, the top 30 from a hashtag URL
          #   (`/tag/{name}`), or the top 12 from a search URL (`/search?q={query}`).
          # - `tiktok-comments`: Video and photo post URLs. Returns the first 20 comments in
          #   `data.comments`: text, `posted_at`, like and reply counts, whether the author
          #   liked it, and the commenter.
          # - `tiktok-followers`, `tiktok-following`: Profile URLs. Return up to 30 accounts
          #   in `data.users`, in the `tiktok-profile` shape.
          # - `tiktok-user-search`: User search URLs (`/search/user?q={query}`). Returns the
          #   top 10 accounts in `data.users`: `id`, `username`, `nickname`, `biography`,
          #   `avatar_url`, `sec_uid`, `follower_count`, `like_count`, and `is_verified`.
          #   The TikTok parsers accept `tiktok.com`, `www.tiktok.com`, and `m.tiktok.com`
          #   URLs, not short links (`vm.tiktok.com`, `vt.tiktok.com`, `tiktok.com/t/…`).
          # - `reddit-post`: Post URLs (`reddit.com/r/{subreddit}/comments/{id}`,
          #   `reddit.com/comments/{id}`, `redd.it/{id}`). Returns the post in `data.post`:
          #   title, body as Markdown, type (`text`, `link`, `image`, `gallery`, or
          #   `video`), `link_url`, subreddit, author, flairs, score, `upvote_ratio`,
          #   comment and crosspost counts, NSFW, spoiler, locked, stickied, and archived
          #   flags, images (every gallery image in order), and video (an MP4 `url` plus an
          #   `hls_url` that carries the audio). `data.comments` holds the comment tree;
          #   each comment has `id`, `author`, `body` (Markdown), `score`, `posted_at`,
          #   `depth`, `parent_id`, `url`, `is_submitter`, `is_deleted`, and its `replies`.
          #   `limit` caps the total number of comments (default 100), filled shallowest
          #   first so whole conversations are kept, and `data.has_more_comments` says
          #   whether the thread has more. The `sort` in the URL (`best`, `top`, `new`,
          #   `controversial`, `old`, `qa`) orders the comments.
          # - `reddit-search`: Search URLs (`reddit.com/search?q={query}`, or
          #   `reddit.com/r/{subreddit}/search?q={query}` to search one subreddit). With
          #   `type=link` or no `type`, returns posts in the `reddit-post` shape in
          #   `data.posts`, ordered by the `sort` in the URL (`relevance`, `hot`, `top`,
          #   `new`, `comments`) within its `t` time range (`hour`, `day`, `week`, `month`,
          #   `year`, `all`). `type=sr` returns communities in `data.communities` (name,
          #   title, description, sidebar, `subscriber_count`, `created_at`, type, NSFW and
          #   quarantine flags, language, category, icon and banner URLs, and allowed post
          #   types). `type=user` returns accounts in `data.users` (username,
          #   `display_name`, bio, `created_at`, post and comment karma, avatar and banner
          #   URLs, and verified, employee, moderator, premium, and NSFW flags). `limit`
          #   caps the number of results (default 100), in the order Reddit returns them,
          #   and `data.has_more` says whether Reddit has more.
          # - `reddit-subreddit`: Subreddit URLs (`reddit.com/r/{subreddit}`, optionally
          #   followed by `/hot`, `/new`, `/top`, `/rising`, or `/controversial`, with `t`
          #   setting the time range of `top` and `controversial`, default `day`). Returns
          #   `data.subreddit` in the community shape of `reddit-search`, `data.rules`
          #   (`name`, `description`, `applies_to`, `violation_reason`, `created_at`), and
          #   `data.posts` in the `reddit-post` shape, ordered like the tab (default `hot`)
          #   with stickied posts flagged. `r/all` and `r/popular` return posts with `null`
          #   `subreddit` and `rules`. `limit` caps the posts (default 100) and
          #   `data.has_more` says whether Reddit has more. Private and quarantined
          #   subreddits return `WEBSITE_ACCESS_ERROR`.
          # - `reddit-user`: Profile URLs (`reddit.com/user/{username}` or
          #   `reddit.com/u/{username}`, optionally followed by `/overview`, `/submitted`,
          #   or `/comments`, with `sort` set to `new`, `hot`, `top`, or `controversial` and
          #   `t` setting the time range of `top` and `controversial`, default `all`).
          #   Returns `data.user` (`id`, `username`, `display_name`, bio, `created_at`,
          #   total, post, comment, awardee, and awarder karma, avatar and banner URLs, and
          #   verified, suspended, employee, moderator, premium, and NSFW flags),
          #   `data.trophies` (`name`, `description`, `icon_url`, `granted_at`, `url`),
          #   `data.moderated_communities` (`name`, `title`, `url`, `subscriber_count`,
          #   `icon_url`, `is_nsfw`), `data.posts` in the `reddit-post` shape, and
          #   `data.comments`, each with `id`, `author`, `body` (Markdown), `score`,
          #   `posted_at`, `edited_at`, `url`, `subreddit`, `parent_id` (`null` for a
          #   top-level comment), `is_submitter`, `is_stickied`, `distinguished`,
          #   `award_count`, and the post it was left on (`id`, `title`, `url`, `author`,
          #   `is_nsfw`). The overview tab returns both posts and comments; `submitted`
          #   returns `null` comments and `comments` returns `null` posts. `limit` caps
          #   posts and comments together (default 100) and `data.has_more` says whether
          #   Reddit has more. Users who hide their activity return empty lists, and
          #   suspended accounts return their profile with `null` posts and comments.
          # - `yelp-search`: Yelp search URLs with `find_desc` and `find_loc`; `start` sets
          #   the result offset. Returns up to 20 ranked organic businesses in
          #   `data.businesses`, with `total` and `pagination`.
          # - `yelp-reviews`: Yelp business URLs (`yelp.com/biz/{alias}`); optional `start`
          #   sets the offset. Returns up to 20 of the latest public reviews, always newest
          #   first, in `data.reviews`, with business details and `pagination.next_offset`.
          #   Each review has rating, full text, `updated_at`, and author (`id` from the
          #   reviewer profile URL, `url` linking to that profile, `name`, `location`, and
          #   `review_count`); owner replies and photos are not included. Unsupported sort
          #   and review filters are rejected; tracking parameters are ignored.
          # - `tripadvisor-reviews`: Tripadvisor hotel, restaurant, and attraction review
          #   URLs (`tripadvisor.com/Hotel_Review-g{geo}-d{id}-Reviews-….html`, on any
          #   Tripadvisor country domain); `-or{N}-` in the path sets the offset. Returns 20
          #   reviews in `data.reviews` in the order Tripadvisor shows them, with
          #   `data.location` (`id`, `name`, `type`, `url`, `review_count`) and
          #   `pagination.next_offset`. Each review has `id`, `url`, `title`, full text,
          #   `rating`, `language`, `published_at`, `visit_month`, `helpful_votes`,
          #   `subratings`, `photo_urls`, `owner_response` (`text`, `published_at`,
          #   `author_name`), and `author` (`id`, `username`, `name`, `url`,
          #   `contribution_count`). An unknown location returns no reviews.
          # - `car-rental-availability`: avis.com and budget.com vehicle-availability search
          #   URLs. Returns every vehicle with pay-now and pay-later prices in
          #   `data.vehicles`.
          # - `car-rental-locations`: avis.com and budget.com `/locations?keyword=` URLs.
          #   Returns rental branches with codes, addresses, coordinates, and hours in
          #   `data.locations`.
          # - `emails`: Any page. Returns its email addresses in `data.emails`
          #   (`[{ email }]`), read from `mailto:` links, Cloudflare-protected addresses,
          #   and visible text.
          # - `phone-numbers`: Any page. Returns its valid phone numbers in E.164 format in
          #   `data.phone_numbers` (`[{ phone }]`), read from `tel:` links and visible text.
          #   Numbers without a country code are read for the country of the site TLD (US by
          #   default).
          # - `links`: Any page. Returns its unique HTTP and HTTPS links as absolute URLs in
          #   `data.links` (`[{ url, text }]`). `text` falls back to `aria-label` or image
          #   alt text and is `null` when a link has none.
          #
          # @see ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser#parser
          module Parser
            extend ContextDev::Internal::Type::Enum

            GOOGLE_MAPS = :"google-maps"
            GOOGLE_MAPS_REVIEWS = :"google-maps-reviews"
            GOOGLE_PLAY = :"google-play"
            GOOGLE_PLAY_REVIEWS = :"google-play-reviews"
            APP_STORE = :"app-store"
            APP_STORE_REVIEWS = :"app-store-reviews"
            G2_REVIEWS = :"g2-reviews"
            INSTAGRAM_PROFILE = :"instagram-profile"
            INSTAGRAM_POST = :"instagram-post"
            INSTAGRAM_FEED = :"instagram-feed"
            TIKTOK_PROFILE = :"tiktok-profile"
            TIKTOK_VIDEO = :"tiktok-video"
            TIKTOK_FEED = :"tiktok-feed"
            TIKTOK_COMMENTS = :"tiktok-comments"
            TIKTOK_FOLLOWERS = :"tiktok-followers"
            TIKTOK_FOLLOWING = :"tiktok-following"
            TIKTOK_USER_SEARCH = :"tiktok-user-search"
            REDDIT_POST = :"reddit-post"
            REDDIT_SEARCH = :"reddit-search"
            REDDIT_SUBREDDIT = :"reddit-subreddit"
            REDDIT_USER = :"reddit-user"
            YELP_SEARCH = :"yelp-search"
            YELP_REVIEWS = :"yelp-reviews"
            TRIPADVISOR_REVIEWS = :"tripadvisor-reviews"
            CAR_RENTAL_AVAILABILITY = :"car-rental-availability"
            CAR_RENTAL_LOCATIONS = :"car-rental-locations"
            EMAILS = :emails
            PHONE_NUMBERS = :"phone-numbers"
            LINKS = :links

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Order of `data.reviews` for `google-maps-reviews`. `newest`, `relevant`,
          # `highest`, and `lowest` use the same orders as Google Maps; `oldest` returns the
          # earliest reviews first.
          #
          # @see ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser#sort
          module Sort
            extend ContextDev::Internal::Type::Enum

            NEWEST = :newest
            OLDEST = :oldest
            RELEVANT = :relevant
            HIGHEST = :highest
            LOWEST = :lowest

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::WebScrapeParams::ParseParams::CustomParser, ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser)]
      end

      class ProductParams < ContextDev::Internal::Type::BaseModel
        # @!attribute dedupe_images
        #   Drop visually duplicate product images, keeping the largest copy.
        #
        #   @return [Boolean, nil]
        optional :dedupe_images, ContextDev::Internal::Type::Boolean, api_name: :dedupeImages

        # @!attribute use_ai_fallback
        #   @deprecated
        #
        #   Ignored. The AI fallback runs automatically.
        #
        #   @return [Boolean, nil]
        optional :use_ai_fallback, ContextDev::Internal::Type::Boolean, api_name: :useAIFallback

        # @!method initialize(dedupe_images: nil, use_ai_fallback: nil)
        #   Options for the `product` output. Requires `formats.product: true`.
        #
        #   @param dedupe_images [Boolean] Drop visually duplicate product images, keeping the largest copy.
        #
        #   @param use_ai_fallback [Boolean] Ignored. The AI fallback runs automatically.
      end

      class ScreenshotParams < ContextDev::Internal::Type::BaseModel
        # @!attribute area
        #   What to capture: `viewport`, `fullPage`, one element, or a rectangle. Up to 40
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
        #   Options for the `screenshot` output. Requires `formats.screenshot: true`.
        #
        #   @param area [Symbol, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Page, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Element, ContextDev::Models::WebScrapeParams::ScreenshotParams::Area::Rectangle] What to capture: `viewport`, `fullPage`, one element, or a rectangle. Up to 40 m
        #
        #   @param format_ [Symbol, ContextDev::Models::WebScrapeParams::ScreenshotParams::Format] Image format for the screenshot.

        # What to capture: `viewport`, `fullPage`, one element, or a rectangle. Up to 40
        # megapixels.
        #
        # @see ContextDev::Models::WebScrapeParams::ScreenshotParams#area
        module Area
          extend ContextDev::Internal::Type::Union

          variant enum: -> { ContextDev::WebScrapeParams::ScreenshotParams::Area::Page }

          variant -> { ContextDev::WebScrapeParams::ScreenshotParams::Area::Element }

          # Rectangle to capture, in pixels from the document origin.
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
            #   Rectangle to capture, in pixels from the document origin.
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
        #   Browser steps to run in order before capture. Requires a paid plan. Skips the
        #   cache.
        #
        #   @return [Array<ContextDev::Models::WebScrapeParams::SharedParams::Action::Perform, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll, ContextDev::Models::WebScrapeParams::SharedParams::Action::Wait, ContextDev::Models::WebScrapeParams::SharedParams::Action::WaitFor>, nil]
        optional :actions,
                 -> { ContextDev::Internal::Type::ArrayOf[union: ContextDev::WebScrapeParams::SharedParams::Action] }

        # @!attribute country
        #   Country to fetch from, as an ISO 3166-1 alpha-2 code such as `US`.
        #   Case-insensitive.
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
        #   Which iframes to inline in HTML and text outputs. Screenshots always show
        #   visible frames. `auto` inlines only iframes that hold page content, such as
        #   same-site documents, framesets, job boards, forms, and embedded documents, and
        #   skips ads and widgets. `true` inlines every iframe; `false` inlines none.
        #
        #   @return [Boolean, Symbol, ContextDev::Models::WebScrapeParams::SharedParams::IncludeFrames, nil]
        optional :include_frames,
                 union: -> { ContextDev::WebScrapeParams::SharedParams::IncludeFrames },
                 api_name: :includeFrames

        # @!attribute include_selectors
        #   Keep only elements matching these CSS selectors.
        #
        #   @return [Array<String>, nil]
        optional :include_selectors, ContextDev::Internal::Type::ArrayOf[String], api_name: :includeSelectors

        # @!attribute main_content_only
        #   Keep only the main content, without navigation, headers, footers, or sidebars.
        #   Does not affect `screenshot`, `bytes`, or `product`.
        #
        #   @return [Boolean, nil]
        optional :main_content_only, ContextDev::Internal::Type::Boolean, api_name: :mainContentOnly

        # @!attribute parsers
        #   Options for parsing documents such as PDFs.
        #
        #   @return [ContextDev::Models::WebScrapeParams::SharedParams::Parsers, nil]
        optional :parsers, -> { ContextDev::WebScrapeParams::SharedParams::Parsers }

        # @!attribute profile
        #   Scrape as a signed-in user. Create a profile with `type: "new"` and your
        #   credentials, then reuse it with `type: "existing"`. Requires a paid plan and an
        #   HTTPS URL. Profiles keep their session between requests, skip the cache, and
        #   cannot be combined with ZDR, custom headers, `formats.bytes`, or prebuilt
        #   parsers other than `emails`, `phone-numbers`, and `links`.
        #
        #   @return [ContextDev::Models::WebScrapeParams::SharedParams::Profile::Existing, ContextDev::Models::WebScrapeParams::SharedParams::Profile::New, nil]
        optional :profile, union: -> { ContextDev::WebScrapeParams::SharedParams::Profile }

        # @!attribute settle_animations
        #   Wait for CSS animations to finish before capture. Defaults to `true` when
        #   `formats.screenshot` is `true`.
        #
        #   @return [Boolean, nil]
        optional :settle_animations, ContextDev::Internal::Type::Boolean, api_name: :settleAnimations

        # @!attribute theme
        #   Emulate a light or dark color scheme.
        #
        #   @return [Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Theme, nil]
        optional :theme, enum: -> { ContextDev::WebScrapeParams::SharedParams::Theme }

        # @!attribute viewport
        #   Browser viewport in pixels. Defaults to 1920 × 1080. If you pass `viewport`, a
        #   missing `width` defaults to 1440 and a missing `height` to 900.
        #
        #   @return [ContextDev::Models::WebScrapeParams::SharedParams::Viewport, nil]
        optional :viewport, -> { ContextDev::WebScrapeParams::SharedParams::Viewport }

        # @!attribute wait_for
        #   Time to wait after actions, in milliseconds, or a CSS selector to wait for.
        #   Defaults to 500 ms, or 2000 ms when `includeFrames` is `true` or the URL ends in
        #   `.xml`.
        #
        #   @return [Integer, String, nil]
        optional :wait_for,
                 union: -> {
                   ContextDev::WebScrapeParams::SharedParams::WaitFor
                 },
                 api_name: :waitFor

        # @!method initialize(actions: nil, country: nil, dismiss_cookies: nil, dismiss_popups: nil, exclude_selectors: nil, headers: nil, include_frames: nil, include_selectors: nil, main_content_only: nil, parsers: nil, profile: nil, settle_animations: nil, theme: nil, viewport: nil, wait_for: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeParams::SharedParams} for more details.
        #
        #   Browser and content settings shared by all outputs.
        #
        #   @param actions [Array<ContextDev::Models::WebScrapeParams::SharedParams::Action::Perform, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll, ContextDev::Models::WebScrapeParams::SharedParams::Action::Wait, ContextDev::Models::WebScrapeParams::SharedParams::Action::WaitFor>] Browser steps to run in order before capture. Requires a paid plan. Skips the ca
        #
        #   @param country [String] Country to fetch from, as an ISO 3166-1 alpha-2 code such as `US`. Case-insensit
        #
        #   @param dismiss_cookies [Boolean] Accept cookie banners before actions and capture.
        #
        #   @param dismiss_popups [Boolean] Close other popups before actions and capture.
        #
        #   @param exclude_selectors [Array<String>] Remove elements matching these CSS selectors. Overrides `includeSelectors`.
        #
        #   @param headers [Hash{Symbol=>String}] HTTP headers to send to the target site. Requests with headers skip the cache.
        #
        #   @param include_frames [Boolean, Symbol, ContextDev::Models::WebScrapeParams::SharedParams::IncludeFrames] Which iframes to inline in HTML and text outputs. Screenshots always show visibl
        #
        #   @param include_selectors [Array<String>] Keep only elements matching these CSS selectors.
        #
        #   @param main_content_only [Boolean] Keep only the main content, without navigation, headers, footers, or sidebars. D
        #
        #   @param parsers [ContextDev::Models::WebScrapeParams::SharedParams::Parsers] Options for parsing documents such as PDFs.
        #
        #   @param profile [ContextDev::Models::WebScrapeParams::SharedParams::Profile::Existing, ContextDev::Models::WebScrapeParams::SharedParams::Profile::New] Scrape as a signed-in user. Create a profile with `type: "new"` and your credent
        #
        #   @param settle_animations [Boolean] Wait for CSS animations to finish before capture. Defaults to `true` when `forma
        #
        #   @param theme [Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Theme] Emulate a light or dark color scheme.
        #
        #   @param viewport [ContextDev::Models::WebScrapeParams::SharedParams::Viewport] Browser viewport in pixels. Defaults to 1920 × 1080. If you pass `viewport`, a m
        #
        #   @param wait_for [Integer, String] Time to wait after actions, in milliseconds, or a CSS selector to wait for. Defa

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
            #   Follow a plain-language instruction.
            #
            #   @return [Symbol, :perform]
            required :type, const: :perform

            # @!method initialize(action:, type: :perform)
            #   @param action [String] One browser instruction, such as clicking a button or entering text.
            #
            #   @param type [Symbol, :perform] Follow a plain-language instruction.
          end

          class Scroll < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #   Scroll the page or a container.
            #
            #   @return [Symbol, :scroll]
            required :type, const: :scroll

            # @!attribute amount
            #   Distance per scroll step: a number of pixels, one `viewport`, or `max` to reach
            #   the end.
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
            #   CSS selector of the container to scroll. Omit to scroll the page.
            #
            #   @return [String, nil]
            optional :selector, String

            # @!method initialize(amount: nil, direction: nil, max_scrolls: nil, selector: nil, type: :scroll)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll} for more
            #   details.
            #
            #   @param amount [Integer, Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll::Amount] Distance per scroll step: a number of pixels, one `viewport`, or `max` to reach
            #
            #   @param direction [Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll::Direction] Direction to scroll.
            #
            #   @param max_scrolls [Integer] Maximum number of scroll steps for this action.
            #
            #   @param selector [String] CSS selector of the container to scroll. Omit to scroll the page.
            #
            #   @param type [Symbol, :scroll] Scroll the page or a container.

            # Distance per scroll step: a number of pixels, one `viewport`, or `max` to reach
            # the end.
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
            #   How long to pause before the next action, in milliseconds.
            #
            #   @return [Integer]
            required :milliseconds, Integer

            # @!attribute type
            #   Pause for a fixed time.
            #
            #   @return [Symbol, :wait]
            required :type, const: :wait

            # @!method initialize(milliseconds:, type: :wait)
            #   @param milliseconds [Integer] How long to pause before the next action, in milliseconds.
            #
            #   @param type [Symbol, :wait] Pause for a fixed time.
          end

          class WaitFor < ContextDev::Internal::Type::BaseModel
            # @!attribute selector
            #   CSS selector to wait for before continuing.
            #
            #   @return [String]
            required :selector, String

            # @!attribute type
            #   Wait for an element matching `selector`.
            #
            #   @return [Symbol, :waitFor]
            required :type, const: :waitFor

            # @!method initialize(selector:, type: :waitFor)
            #   @param selector [String] CSS selector to wait for before continuing.
            #
            #   @param type [Symbol, :waitFor] Wait for an element matching `selector`.
          end

          # @!method self.variants
          #   @return [Array(ContextDev::Models::WebScrapeParams::SharedParams::Action::Perform, ContextDev::Models::WebScrapeParams::SharedParams::Action::Scroll, ContextDev::Models::WebScrapeParams::SharedParams::Action::Wait, ContextDev::Models::WebScrapeParams::SharedParams::Action::WaitFor)]
        end

        # Which iframes to inline in HTML and text outputs. Screenshots always show
        # visible frames. `auto` inlines only iframes that hold page content, such as
        # same-site documents, framesets, job boards, forms, and embedded documents, and
        # skips ads and widgets. `true` inlines every iframe; `false` inlines none.
        #
        # @see ContextDev::Models::WebScrapeParams::SharedParams#include_frames
        module IncludeFrames
          extend ContextDev::Internal::Type::Union

          variant ContextDev::Internal::Type::Boolean

          variant const: -> { ContextDev::Models::WebScrapeParams::SharedParams::IncludeFrames::AUTO }

          # @!method self.variants
          #   @return [Array(Boolean, Symbol)]

          define_sorbet_constant!(:Variants) do
            T.type_alias { T.any(T::Boolean, ContextDev::WebScrapeParams::SharedParams::IncludeFrames::TaggedSymbol) }
          end

          # @!group

          AUTO = :auto

          # @!endgroup
        end

        # @see ContextDev::Models::WebScrapeParams::SharedParams#parsers
        class Parsers < ContextDev::Internal::Type::BaseModel
          # @!attribute pdf
          #   Page range, OCR, and page markers for PDFs.
          #
          #   @return [ContextDev::Models::WebScrapeParams::SharedParams::Parsers::Pdf, nil]
          optional :pdf, -> { ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf }

          # @!method initialize(pdf: nil)
          #   Options for parsing documents such as PDFs.
          #
          #   @param pdf [ContextDev::Models::WebScrapeParams::SharedParams::Parsers::Pdf] Page range, OCR, and page markers for PDFs.

          # @see ContextDev::Models::WebScrapeParams::SharedParams::Parsers#pdf
          class Pdf < ContextDev::Internal::Type::BaseModel
            # @!attribute end_page
            #   Last page to parse. Defaults to the last page. Must be at least `startPage`.
            #
            #   @return [Integer, nil]
            optional :end_page, Integer, api_name: :endPage

            # @!attribute include_numbered_pages
            #   Start each PDF page in the Markdown with a `<!-- page N -->` line, where `N` is
            #   the original 1-based page number. These responses are never served from cache.
            #
            #   @return [Boolean, nil]
            optional :include_numbered_pages,
                     ContextDev::Internal::Type::Boolean,
                     api_name: :includeNumberedPages

            # @!attribute ocr
            #   Set to `auto` to read scanned pages with OCR. Adds 1 credit per page read.
            #
            #   @return [Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr, nil]
            optional :ocr, enum: -> { ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr }

            # @!attribute start_page
            #   First page to parse, starting at 1.
            #
            #   @return [Integer, nil]
            optional :start_page, Integer, api_name: :startPage

            # @!method initialize(end_page: nil, include_numbered_pages: nil, ocr: nil, start_page: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::WebScrapeParams::SharedParams::Parsers::Pdf} for more
            #   details.
            #
            #   Page range, OCR, and page markers for PDFs.
            #
            #   @param end_page [Integer] Last page to parse. Defaults to the last page. Must be at least `startPage`.
            #
            #   @param include_numbered_pages [Boolean] Start each PDF page in the Markdown with a `<!-- page N -->` line, where `N` is
            #
            #   @param ocr [Symbol, ContextDev::Models::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr] Set to `auto` to read scanned pages with OCR. Adds 1 credit per page read.
            #
            #   @param start_page [Integer] First page to parse, starting at 1.

            # Set to `auto` to read scanned pages with OCR. Adds 1 credit per page read.
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

        # Scrape as a signed-in user. Create a profile with `type: "new"` and your
        # credentials, then reuse it with `type: "existing"`. Requires a paid plan and an
        # HTTPS URL. Profiles keep their session between requests, skip the cache, and
        # cannot be combined with ZDR, custom headers, `formats.bytes`, or prebuilt
        # parsers other than `emails`, `phone-numbers`, and `links`.
        #
        # @see ContextDev::Models::WebScrapeParams::SharedParams#profile
        module Profile
          extend ContextDev::Internal::Type::Union

          discriminator :type

          variant :existing, -> { ContextDev::WebScrapeParams::SharedParams::Profile::Existing }

          variant :new, -> { ContextDev::WebScrapeParams::SharedParams::Profile::New }

          class Existing < ContextDev::Internal::Type::BaseModel
            # @!attribute profile_id
            #   ID of the browser profile, from `profile.id` in an earlier scrape response.
            #
            #   @return [String]
            required :profile_id, String, api_name: :profileId

            # @!attribute type
            #   Reuse a saved browser profile.
            #
            #   @return [Symbol, :existing]
            required :type, const: :existing

            # @!method initialize(profile_id:, type: :existing)
            #   @param profile_id [String] ID of the browser profile, from `profile.id` in an earlier scrape response.
            #
            #   @param type [Symbol, :existing] Reuse a saved browser profile.
          end

          class New < ContextDev::Internal::Type::BaseModel
            # @!attribute identifier
            #   Username or email address for the website.
            #
            #   @return [String]
            required :identifier, String

            # @!attribute type
            #   Sign in and save a new browser profile.
            #
            #   @return [Symbol, :new]
            required :type, const: :new

            # @!attribute description
            #   Label for the profile, shown by `GET /org/browser/profiles`.
            #
            #   @return [String, nil]
            optional :description, String

            request_only do
              # @!attribute password
              #   Password for the website. Used to sign in and never stored.
              #
              #   @return [String]
              required :password, String
            end

            # @!method initialize(identifier:, password:, description: nil, type: :new)
            #   @param identifier [String] Username or email address for the website.
            #
            #   @param password [String] Password for the website. Used to sign in and never stored.
            #
            #   @param description [String] Label for the profile, shown by `GET /org/browser/profiles`.
            #
            #   @param type [Symbol, :new] Sign in and save a new browser profile.
          end

          # @!method self.variants
          #   @return [Array(ContextDev::Models::WebScrapeParams::SharedParams::Profile::Existing, ContextDev::Models::WebScrapeParams::SharedParams::Profile::New)]
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
          #   Browser viewport in pixels. Defaults to 1920 × 1080. If you pass `viewport`, a
          #   missing `width` defaults to 1440 and a missing `height` to 900.
          #
          #   @param height [Integer] Browser viewport height in pixels.
          #
          #   @param width [Integer] Browser viewport width in pixels.
        end

        # Time to wait after actions, in milliseconds, or a CSS selector to wait for.
        # Defaults to 500 ms, or 2000 ms when `includeFrames` is `true` or the URL ends in
        # `.xml`.
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
        #   `fail` returns 408 at the deadline. `return-partial` returns the results
        #   collected so far and marks the response as partial. `return-partial` requires at
        #   least 5000 ms. On `POST /web/scrape`, an output that is not ready in time fails
        #   with `REQUEST_TIMEOUT` inside a 200 response under either behavior; 408 means
        #   the whole request could not respond by the deadline.
        #
        #   @return [Symbol, ContextDev::Models::WebScrapeParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::WebScrapeParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScrapeParams::TimeoutOpts} for more details.
        #
        #   Request deadline and what to return when it passes.
        #
        #   @param milliseconds [Integer] Deadline in milliseconds.
        #
        #   @param behavior [Symbol, ContextDev::Models::WebScrapeParams::TimeoutOpts::Behavior] `fail` returns 408 at the deadline. `return-partial` returns the results collect

        # `fail` returns 408 at the deadline. `return-partial` returns the results
        # collected so far and marks the response as partial. `return-partial` requires at
        # least 5000 ms. On `POST /web/scrape`, an output that is not ready in time fails
        # with `REQUEST_TIMEOUT` inside a 200 response under either behavior; 408 means
        # the whole request could not respond by the deadline.
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

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
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
