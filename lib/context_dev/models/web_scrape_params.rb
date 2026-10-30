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
      #   @return [ContextDev::Models::WebScrapeParams::ParseParams::CustomParser, ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser, nil]
      optional :parse_params, union: -> { ContextDev::WebScrapeParams::ParseParams }, api_name: :parseParams

      # @!attribute policies
      #   Access policy IDs to apply. A URL must pass every policy.
      #
      #   @return [Array<String>, nil]
      optional :policies, ContextDev::Internal::Type::ArrayOf[String]

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
      #   Labels for filtering usage in the dashboard.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Request deadline and what to return when it passes.
      #
      #   @return [ContextDev::Models::WebScrapeParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::WebScrapeParams::TimeoutOpts }, api_name: :timeoutOpts

      # @!attribute zdr
      #   `enabled` turns on zero data retention. Your organization must have ZDR enabled.
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
      #   @param parse_params [ContextDev::Models::WebScrapeParams::ParseParams::CustomParser, ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser] Requires `formats.parse: true`; required when it is set.
      #
      #   @param policies [Array<String>] Access policy IDs to apply. A URL must pass every policy.
      #
      #   @param product_params [ContextDev::Models::WebScrapeParams::ProductParams] Product options. Requires formats.product: true.
      #
      #   @param screenshot_params [ContextDev::Models::WebScrapeParams::ScreenshotParams] Screenshot options. Requires formats.screenshot: true.
      #
      #   @param shared_params [ContextDev::Models::WebScrapeParams::SharedParams] Browser and content settings shared by all outputs.
      #
      #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
      #
      #   @param timeout_opts [ContextDev::Models::WebScrapeParams::TimeoutOpts] Request deadline and what to return when it passes.
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
        #   Fields extracted with custom rules or a prebuilt parser, returned as `parsed`.
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
        #   @param parse [Boolean] Fields extracted with custom rules or a prebuilt parser, returned as `parsed`.
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
        #   Include images in the Markdown (`html-conversion` only).
        #
        #   @return [Boolean, nil]
        optional :include_images, ContextDev::Internal::Type::Boolean, api_name: :includeImages

        # @!attribute include_links
        #   Keep link URLs in the Markdown (`html-conversion` only).
        #
        #   @return [Boolean, nil]
        optional :include_links, ContextDev::Internal::Type::Boolean, api_name: :includeLinks

        # @!attribute inline_images
        #   How base64 images appear when `includeImages` is set (`html-conversion` only).
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
        #   Markdown options. Requires `formats.markdown`.
        #
        #   @param include_images [Boolean] Include images in the Markdown (`html-conversion` only).
        #
        #   @param include_links [Boolean] Keep link URLs in the Markdown (`html-conversion` only).
        #
        #   @param inline_images [Symbol, ContextDev::Models::WebScrapeParams::MarkdownParams::InlineImages] How base64 images appear when `includeImages` is set (`html-conversion` only).
        #
        #   @param source_preference [Array<Symbol, ContextDev::Models::WebScrapeParams::MarkdownParams::SourcePreference>] Markdown sources in order of preference: `html-conversion` converts the page HTM

        # How base64 images appear when `includeImages` is set (`html-conversion` only).
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

      # Requires `formats.parse: true`; required when it is set.
      module ParseParams
        extend ContextDev::Internal::Type::Union

        variant -> { ContextDev::WebScrapeParams::ParseParams::CustomParser }

        variant -> { ContextDev::WebScrapeParams::ParseParams::PrebuiltParser }

        class CustomParser < ContextDev::Internal::Type::BaseModel
          # @!attribute rules
          #   Field names mapped to CSS selectors (`h1`, `a@href`) or rule objects. Max 100
          #   fields, 5 levels.
          #
          #   @return [Hash{Symbol=>String, ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1}]
          required :rules,
                   -> { ContextDev::Internal::Type::HashOf[union: ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule] }

          # @!attribute type
          #   Extract fields using custom CSS rules. This is the default when type is omitted.
          #
          #   @return [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Type, nil]
          optional :type, enum: -> { ContextDev::WebScrapeParams::ParseParams::CustomParser::Type }

          # @!method initialize(rules:, type: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::WebScrapeParams::ParseParams::CustomParser} for more
          #   details.
          #
          #   @param rules [Hash{Symbol=>String, ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1}] Field names mapped to CSS selectors (`h1`, `a@href`) or rule objects. Max 100 fi
          #
          #   @param type [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Type] Extract fields using custom CSS rules. This is the default when type is omitted.

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
              #   Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
              #   to text.
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
              #   @param output [Symbol, String, Object, ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Output] Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
              #
              #   @param type [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Type] Return the first match with `item` or all matches with `list`.

              # Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
              # to text.
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

          # Extract fields using custom CSS rules. This is the default when type is omitted.
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
          #   google-maps parses Google Maps business data into data.results. Accepts Maps
          #   place, search, and internal data URLs. Uses a US exit and English labels
          #   regardless of hl or Accept-Language. google-maps-reviews returns the reviews of
          #   a place in data.reviews, in the same shape as the Serper reviews API (rating,
          #   date, isoDate, snippet, translatedSnippet, likes, user, media, response, link,
          #   id), plus language, guided ratings in details, and user.isLocalGuide; data also
          #   carries the place featureId, cid, and sort. sort and limit pick the order and
          #   count, and oldest is exact. It accepts Maps place, search, and ?cid= URLs, plus
          #   search.google.com/local/reviews URLs, so the google_maps_url and
          #   google_reviews_url fields of google-maps results work as input. An unknown place
          #   returns no reviews. google-play parses a Play Store app into data: details,
          #   developer contact, ratings, price, permissions, and data safety.
          #   google-play-reviews returns the 200 newest reviews of the app, with developer
          #   replies, in data.reviews. Both Play parsers accept app details URLs
          #   (play.google.com/store/apps/details?id=…); hl and gl set the language and
          #   storefront, defaulting to en and us. app-store parses an App Store app into
          #   data: details, developer, ratings, price, version, and screenshots.
          #   app-store-reviews returns up to the 500 newest reviews in data.reviews. Both App
          #   Store parsers accept app URLs (apps.apple.com/us/app/…/id…); the country in the
          #   path sets the storefront, defaulting to us. g2-reviews returns the 25 most
          #   recently published reviews of a G2 product in data.reviews (rating, title,
          #   likes, dislikes, problems_solved, reviewer role, company size, and industry),
          #   plus data.product. It accepts G2 product URLs (g2.com/products/…), follows
          #   renamed products, and keeps star-rating filters from the URL
          #   (filters[nps_score][]=1 to 5); other filters, sort orders, and pages are
          #   ignored. instagram-profile parses a public profile (instagram.com/{username})
          #   into data: bio, links, follower and post counts, category, business address,
          #   similar_accounts, and latest_posts (up to the 12 posts at the top of the
          #   profile, newest first). Instagram lists pinned posts there ahead of newer ones,
          #   so posts with is_pinned true can be older; when Instagram shows only a rounded
          #   post count (32K), post_count is that rounded number and is_post_count_rounded is
          #   true. instagram-post parses a post or reel (/p/…, /reel/…) into data: caption,
          #   hashtags, mentions, like, comment, and view counts (like_count and view_count
          #   are null when the owner hides them), media URLs, tagged users, collaborators,
          #   location, and the top ~14 comments in data.comments. instagram-feed returns the
          #   top posts for a hashtag or keyword (/explore/tags/…, /popular/…) or the recent
          #   posts at a location (/explore/locations/{id}/…) in data.posts; keyword posts
          #   carry only the shortcode, owner, thumbnail, and views, plus the caption when
          #   Instagram shows it. All three Instagram parsers read public data without logging
          #   in, so private accounts return no posts and follower lists are unavailable.
          #   tiktok-profile parses a public profile (tiktok.com/@{username}) into data:
          #   nickname, bio, bio link, follower, following, like, and video counts, verified,
          #   private, and business flags, and business category; it does not list videos.
          #   tiktok-video parses a video or photo post (/@{username}/video/{id} or
          #   /@{username}/photo/{id}) into data: caption, hashtags, mentions, author, view,
          #   like, comment, share, save, and repost counts, duration, thumbnail, a video_url
          #   that downloads without cookies, image_urls for photo posts, music, location, and
          #   ad, paid-partnership, and AI-generated flags. tiktok-feed returns videos in the
          #   tiktok-video shape as data.videos: the latest 15 from a profile URL, the top 30
          #   from a hashtag URL (/tag/{name}), or the top 12 from a search URL
          #   (/search?q={query}). tiktok-comments returns the first 20 comments of a video or
          #   photo post as data.comments: text, posted_at, like and reply counts, whether the
          #   author liked it, and the commenter. tiktok-followers and tiktok-following return
          #   up to 30 accounts of a profile as data.users, in the tiktok-profile shape.
          #   tiktok-user-search returns the top 10 accounts for a user search URL
          #   (/search/user?q={query}) as data.users: id, username, nickname, biography,
          #   avatar_url, sec_uid, follower_count, like_count, and is_verified. The TikTok
          #   parsers accept tiktok.com, www.tiktok.com, and m.tiktok.com URLs but not short
          #   links (vm.tiktok.com, vt.tiktok.com, tiktok.com/t/…). yelp-search accepts Yelp
          #   search URLs with find_desc and find_loc, reads start as the result offset, and
          #   returns up to 20 ranked organic businesses in data.businesses with total and
          #   pagination. yelp-reviews accepts a Yelp business URL (yelp.com/biz/{alias}),
          #   uses optional start for the offset, and always sorts newest first; unsupported
          #   sort and review filters are rejected, while tracking params are ignored. It
          #   returns up to 20 latest public reviews in data.reviews with business details and
          #   pagination.next_offset. Each review has rating, full text, updated_at, and
          #   author; owner replies and photos are not included. emails accepts any page and
          #   returns its email addresses as data.emails ([{ email }]), read from mailto
          #   links, Cloudflare-protected addresses, and visible text. phone-numbers accepts
          #   any page and returns its valid phone numbers in E.164 as data.phone_numbers ([{
          #   phone }]), read from tel links and visible text; numbers without a country code
          #   are read for the country of the site TLD, defaulting to US. links accepts any
          #   page and returns its unique http(s) links as data.links ([{ url, text }]), with
          #   absolute URLs; text falls back to aria-label or image alt and is null when a
          #   link has none. The emails parser reads the rendered page and respects content
          #   filters; the other prebuilt parsers read their data independently of DOM
          #   filters.
          #
          #   @return [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser::Parser]
          required :parser, enum: -> { ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser }

          # @!attribute type
          #   Use a prebuilt parser instead of custom rules.
          #
          #   @return [Symbol, :prebuilt]
          required :type, const: :prebuilt

          # @!attribute limit
          #   google-maps-reviews only. Maximum number of reviews to return. Defaults to 100;
          #   maximum 1000.
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute sort
          #   google-maps-reviews only. Order of data.reviews. newest, relevant, highest, and
          #   lowest follow Google; oldest returns the earliest reviews first, which Google
          #   itself does not offer.
          #
          #   @return [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser::Sort, nil]
          optional :sort, enum: -> { ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Sort }

          # @!method initialize(parser:, limit: nil, sort: nil, type: :prebuilt)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser} for more
          #   details.
          #
          #   @param parser [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser::Parser] google-maps parses Google Maps business data into data.results. Accepts Maps pla
          #
          #   @param limit [Integer] google-maps-reviews only. Maximum number of reviews to return. Defaults to 100;
          #
          #   @param sort [Symbol, ContextDev::Models::WebScrapeParams::ParseParams::PrebuiltParser::Sort] google-maps-reviews only. Order of data.reviews. newest, relevant, highest, and
          #
          #   @param type [Symbol, :prebuilt] Use a prebuilt parser instead of custom rules.

          # google-maps parses Google Maps business data into data.results. Accepts Maps
          # place, search, and internal data URLs. Uses a US exit and English labels
          # regardless of hl or Accept-Language. google-maps-reviews returns the reviews of
          # a place in data.reviews, in the same shape as the Serper reviews API (rating,
          # date, isoDate, snippet, translatedSnippet, likes, user, media, response, link,
          # id), plus language, guided ratings in details, and user.isLocalGuide; data also
          # carries the place featureId, cid, and sort. sort and limit pick the order and
          # count, and oldest is exact. It accepts Maps place, search, and ?cid= URLs, plus
          # search.google.com/local/reviews URLs, so the google_maps_url and
          # google_reviews_url fields of google-maps results work as input. An unknown place
          # returns no reviews. google-play parses a Play Store app into data: details,
          # developer contact, ratings, price, permissions, and data safety.
          # google-play-reviews returns the 200 newest reviews of the app, with developer
          # replies, in data.reviews. Both Play parsers accept app details URLs
          # (play.google.com/store/apps/details?id=…); hl and gl set the language and
          # storefront, defaulting to en and us. app-store parses an App Store app into
          # data: details, developer, ratings, price, version, and screenshots.
          # app-store-reviews returns up to the 500 newest reviews in data.reviews. Both App
          # Store parsers accept app URLs (apps.apple.com/us/app/…/id…); the country in the
          # path sets the storefront, defaulting to us. g2-reviews returns the 25 most
          # recently published reviews of a G2 product in data.reviews (rating, title,
          # likes, dislikes, problems_solved, reviewer role, company size, and industry),
          # plus data.product. It accepts G2 product URLs (g2.com/products/…), follows
          # renamed products, and keeps star-rating filters from the URL
          # (filters[nps_score][]=1 to 5); other filters, sort orders, and pages are
          # ignored. instagram-profile parses a public profile (instagram.com/{username})
          # into data: bio, links, follower and post counts, category, business address,
          # similar_accounts, and latest_posts (up to the 12 posts at the top of the
          # profile, newest first). Instagram lists pinned posts there ahead of newer ones,
          # so posts with is_pinned true can be older; when Instagram shows only a rounded
          # post count (32K), post_count is that rounded number and is_post_count_rounded is
          # true. instagram-post parses a post or reel (/p/…, /reel/…) into data: caption,
          # hashtags, mentions, like, comment, and view counts (like_count and view_count
          # are null when the owner hides them), media URLs, tagged users, collaborators,
          # location, and the top ~14 comments in data.comments. instagram-feed returns the
          # top posts for a hashtag or keyword (/explore/tags/…, /popular/…) or the recent
          # posts at a location (/explore/locations/{id}/…) in data.posts; keyword posts
          # carry only the shortcode, owner, thumbnail, and views, plus the caption when
          # Instagram shows it. All three Instagram parsers read public data without logging
          # in, so private accounts return no posts and follower lists are unavailable.
          # tiktok-profile parses a public profile (tiktok.com/@{username}) into data:
          # nickname, bio, bio link, follower, following, like, and video counts, verified,
          # private, and business flags, and business category; it does not list videos.
          # tiktok-video parses a video or photo post (/@{username}/video/{id} or
          # /@{username}/photo/{id}) into data: caption, hashtags, mentions, author, view,
          # like, comment, share, save, and repost counts, duration, thumbnail, a video_url
          # that downloads without cookies, image_urls for photo posts, music, location, and
          # ad, paid-partnership, and AI-generated flags. tiktok-feed returns videos in the
          # tiktok-video shape as data.videos: the latest 15 from a profile URL, the top 30
          # from a hashtag URL (/tag/{name}), or the top 12 from a search URL
          # (/search?q={query}). tiktok-comments returns the first 20 comments of a video or
          # photo post as data.comments: text, posted_at, like and reply counts, whether the
          # author liked it, and the commenter. tiktok-followers and tiktok-following return
          # up to 30 accounts of a profile as data.users, in the tiktok-profile shape.
          # tiktok-user-search returns the top 10 accounts for a user search URL
          # (/search/user?q={query}) as data.users: id, username, nickname, biography,
          # avatar_url, sec_uid, follower_count, like_count, and is_verified. The TikTok
          # parsers accept tiktok.com, www.tiktok.com, and m.tiktok.com URLs but not short
          # links (vm.tiktok.com, vt.tiktok.com, tiktok.com/t/…). yelp-search accepts Yelp
          # search URLs with find_desc and find_loc, reads start as the result offset, and
          # returns up to 20 ranked organic businesses in data.businesses with total and
          # pagination. yelp-reviews accepts a Yelp business URL (yelp.com/biz/{alias}),
          # uses optional start for the offset, and always sorts newest first; unsupported
          # sort and review filters are rejected, while tracking params are ignored. It
          # returns up to 20 latest public reviews in data.reviews with business details and
          # pagination.next_offset. Each review has rating, full text, updated_at, and
          # author; owner replies and photos are not included. emails accepts any page and
          # returns its email addresses as data.emails ([{ email }]), read from mailto
          # links, Cloudflare-protected addresses, and visible text. phone-numbers accepts
          # any page and returns its valid phone numbers in E.164 as data.phone_numbers ([{
          # phone }]), read from tel links and visible text; numbers without a country code
          # are read for the country of the site TLD, defaulting to US. links accepts any
          # page and returns its unique http(s) links as data.links ([{ url, text }]), with
          # absolute URLs; text falls back to aria-label or image alt and is null when a
          # link has none. The emails parser reads the rendered page and respects content
          # filters; the other prebuilt parsers read their data independently of DOM
          # filters.
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
            YELP_SEARCH = :"yelp-search"
            YELP_REVIEWS = :"yelp-reviews"
            EMAILS = :emails
            PHONE_NUMBERS = :"phone-numbers"
            LINKS = :links

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # google-maps-reviews only. Order of data.reviews. newest, relevant, highest, and
          # lowest follow Google; oldest returns the earliest reviews first, which Google
          # itself does not offer.
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
        #   Product options. Requires formats.product: true.
        #
        #   @param dedupe_images [Boolean] Drop visually duplicate product images, keeping the largest copy.
        #
        #   @param use_ai_fallback [Boolean] Ignored. The AI fallback runs automatically.
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

        # @!attribute profile
        #   Create or reuse an authenticated browser profile. Requires a paid plan and an
        #   HTTPS target. Profiles persist session state, bypass shared caches, and cannot
        #   be combined with ZDR, custom headers, raw bytes, or prebuilt parsers.
        #
        #   @return [ContextDev::Models::WebScrapeParams::SharedParams::Profile::Existing, ContextDev::Models::WebScrapeParams::SharedParams::Profile::New, nil]
        optional :profile, union: -> { ContextDev::WebScrapeParams::SharedParams::Profile }

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

        # @!method initialize(actions: nil, country: nil, dismiss_cookies: nil, dismiss_popups: nil, exclude_selectors: nil, headers: nil, include_frames: nil, include_selectors: nil, main_content_only: nil, parsers: nil, profile: nil, settle_animations: nil, theme: nil, viewport: nil, wait_for: nil)
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
        #   @param profile [ContextDev::Models::WebScrapeParams::SharedParams::Profile::Existing, ContextDev::Models::WebScrapeParams::SharedParams::Profile::New] Create or reuse an authenticated browser profile. Requires a paid plan and an HT
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

            # @!attribute include_numbered_pages
            #   Start each page in the Markdown with a `<!-- page N -->` line using its original
            #   1-based page number; these responses are never served from cache.
            #
            #   @return [Boolean, nil]
            optional :include_numbered_pages,
                     ContextDev::Internal::Type::Boolean,
                     api_name: :includeNumberedPages

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

            # @!method initialize(end_page: nil, include_numbered_pages: nil, ocr: nil, start_page: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::WebScrapeParams::SharedParams::Parsers::Pdf} for more
            #   details.
            #
            #   PDF page range and OCR.
            #
            #   @param end_page [Integer] Last page to parse. Must be at least `startPage`.
            #
            #   @param include_numbered_pages [Boolean] Start each page in the Markdown with a `<!-- page N -->` line using its original
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

        # Create or reuse an authenticated browser profile. Requires a paid plan and an
        # HTTPS target. Profiles persist session state, bypass shared caches, and cannot
        # be combined with ZDR, custom headers, raw bytes, or prebuilt parsers.
        #
        # @see ContextDev::Models::WebScrapeParams::SharedParams#profile
        module Profile
          extend ContextDev::Internal::Type::Union

          discriminator :type

          variant :existing, -> { ContextDev::WebScrapeParams::SharedParams::Profile::Existing }

          variant :new, -> { ContextDev::WebScrapeParams::SharedParams::Profile::New }

          class Existing < ContextDev::Internal::Type::BaseModel
            # @!attribute profile_id
            #   The ID returned in profile.id by an earlier scrape.
            #
            #   @return [String]
            required :profile_id, String, api_name: :profileId

            # @!attribute type
            #   Reuse a saved browser profile.
            #
            #   @return [Symbol, :existing]
            required :type, const: :existing

            # @!method initialize(profile_id:, type: :existing)
            #   @param profile_id [String] The ID returned in profile.id by an earlier scrape.
            #
            #   @param type [Symbol, :existing] Reuse a saved browser profile.
          end

          class New < ContextDev::Internal::Type::BaseModel
            # @!attribute identifier
            #   Username or email for the target website.
            #
            #   @return [String]
            required :identifier, String

            # @!attribute type
            #   Sign in and create a browser profile.
            #
            #   @return [Symbol, :new]
            required :type, const: :new

            # @!attribute description
            #   Optional label shown when listing profiles with `GET /org/browser/profiles`.
            #
            #   @return [String, nil]
            optional :description, String

            request_only do
              # @!attribute password
              #   Password used to sign in. It is never stored in the profile.
              #
              #   @return [String]
              required :password, String
            end

            # @!method initialize(identifier:, password:, description: nil, type: :new)
            #   @param identifier [String] Username or email for the target website.
            #
            #   @param password [String] Password used to sign in. It is never stored in the profile.
            #
            #   @param description [String] Optional label shown when listing profiles with `GET /org/browser/profiles`.
            #
            #   @param type [Symbol, :new] Sign in and create a browser profile.
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
        #   Request deadline and what to return when it passes.
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
