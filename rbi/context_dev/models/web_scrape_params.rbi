# typed: strong

module ContextDev
  module Models
    class WebScrapeParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::WebScrapeParams, ContextDev::Internal::AnyHash)
        end

      # Outputs to return. Set at least one to `true`.
      sig { returns(ContextDev::WebScrapeParams::Formats) }
      attr_reader :formats

      sig { params(formats: ContextDev::WebScrapeParams::Formats::OrHash).void }
      attr_writer :formats

      # Public HTTP or HTTPS URL to scrape.
      sig { returns(String) }
      attr_accessor :url

      # Query for the `highlights` output. Required when `formats.highlights` is `true`,
      # and allowed only then.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::HighlightsParams)) }
      attr_reader :highlights_params

      sig do
        params(
          highlights_params:
            ContextDev::WebScrapeParams::HighlightsParams::OrHash
        ).void
      end
      attr_writer :highlights_params

      # Options for the `images` output. Requires `formats.images: true`.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::ImageParams)) }
      attr_reader :image_params

      sig do
        params(
          image_params: ContextDev::WebScrapeParams::ImageParams::OrHash
        ).void
      end
      attr_writer :image_params

      # Schema and instructions for the `json` output. Required when `formats.json` is
      # `true`, and allowed only then.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::JsonParams)) }
      attr_reader :json_params

      sig do
        params(
          json_params: ContextDev::WebScrapeParams::JsonParams::OrHash
        ).void
      end
      attr_writer :json_params

      # Options for the `markdown` output. Requires `formats.markdown: true`.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::MarkdownParams)) }
      attr_reader :markdown_params

      sig do
        params(
          markdown_params: ContextDev::WebScrapeParams::MarkdownParams::OrHash
        ).void
      end
      attr_writer :markdown_params

      # Maximum age of a cached result, in milliseconds. `0` always fetches fresh.
      # Defaults to 3 days (259200000 ms). Maximum: 1 year (31536000000 ms).
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_age_ms

      sig { params(max_age_ms: Integer).void }
      attr_writer :max_age_ms

      # Custom rules or a prebuilt parser for the `parsed` output. Required when
      # `formats.parse` is `true`, and allowed only then.
      sig do
        returns(
          T.nilable(
            T.any(
              ContextDev::WebScrapeParams::ParseParams::CustomParser,
              ContextDev::WebScrapeParams::ParseParams::PrebuiltParser
            )
          )
        )
      end
      attr_reader :parse_params

      sig do
        params(
          parse_params:
            T.any(
              ContextDev::WebScrapeParams::ParseParams::CustomParser::OrHash,
              ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::OrHash
            )
        ).void
      end
      attr_writer :parse_params

      # Access policy IDs to apply; each URL must pass all of them. Requires access
      # policies enabled for your organization; otherwise returns
      # `ACCESS_POLICIES_NOT_ENABLED`.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :policies

      sig { params(policies: T::Array[String]).void }
      attr_writer :policies

      # Options for the `product` output. Requires `formats.product: true`.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::ProductParams)) }
      attr_reader :product_params

      sig do
        params(
          product_params: ContextDev::WebScrapeParams::ProductParams::OrHash
        ).void
      end
      attr_writer :product_params

      # Options for the `screenshot` output. Requires `formats.screenshot: true`.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::ScreenshotParams)) }
      attr_reader :screenshot_params

      sig do
        params(
          screenshot_params:
            ContextDev::WebScrapeParams::ScreenshotParams::OrHash
        ).void
      end
      attr_writer :screenshot_params

      # Browser and content settings shared by all outputs.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::SharedParams)) }
      attr_reader :shared_params

      sig do
        params(
          shared_params: ContextDev::WebScrapeParams::SharedParams::OrHash
        ).void
      end
      attr_writer :shared_params

      # Labels for this request. Filter usage and request logs by them in the dashboard
      # or with `GET /org/logs`.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Request deadline and what to return when it passes.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::TimeoutOpts)) }
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts: ContextDev::WebScrapeParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::Zdr::OrSymbol)) }
      attr_reader :zdr

      sig { params(zdr: ContextDev::WebScrapeParams::Zdr::OrSymbol).void }
      attr_writer :zdr

      sig do
        params(
          formats: ContextDev::WebScrapeParams::Formats::OrHash,
          url: String,
          highlights_params:
            ContextDev::WebScrapeParams::HighlightsParams::OrHash,
          image_params: ContextDev::WebScrapeParams::ImageParams::OrHash,
          json_params: ContextDev::WebScrapeParams::JsonParams::OrHash,
          markdown_params: ContextDev::WebScrapeParams::MarkdownParams::OrHash,
          max_age_ms: Integer,
          parse_params:
            T.any(
              ContextDev::WebScrapeParams::ParseParams::CustomParser::OrHash,
              ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::OrHash
            ),
          policies: T::Array[String],
          product_params: ContextDev::WebScrapeParams::ProductParams::OrHash,
          screenshot_params:
            ContextDev::WebScrapeParams::ScreenshotParams::OrHash,
          shared_params: ContextDev::WebScrapeParams::SharedParams::OrHash,
          tags: T::Array[String],
          timeout_opts: ContextDev::WebScrapeParams::TimeoutOpts::OrHash,
          zdr: ContextDev::WebScrapeParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Outputs to return. Set at least one to `true`.
        formats:,
        # Public HTTP or HTTPS URL to scrape.
        url:,
        # Query for the `highlights` output. Required when `formats.highlights` is `true`,
        # and allowed only then.
        highlights_params: nil,
        # Options for the `images` output. Requires `formats.images: true`.
        image_params: nil,
        # Schema and instructions for the `json` output. Required when `formats.json` is
        # `true`, and allowed only then.
        json_params: nil,
        # Options for the `markdown` output. Requires `formats.markdown: true`.
        markdown_params: nil,
        # Maximum age of a cached result, in milliseconds. `0` always fetches fresh.
        # Defaults to 3 days (259200000 ms). Maximum: 1 year (31536000000 ms).
        max_age_ms: nil,
        # Custom rules or a prebuilt parser for the `parsed` output. Required when
        # `formats.parse` is `true`, and allowed only then.
        parse_params: nil,
        # Access policy IDs to apply; each URL must pass all of them. Requires access
        # policies enabled for your organization; otherwise returns
        # `ACCESS_POLICIES_NOT_ENABLED`.
        policies: nil,
        # Options for the `product` output. Requires `formats.product: true`.
        product_params: nil,
        # Options for the `screenshot` output. Requires `formats.screenshot: true`.
        screenshot_params: nil,
        # Browser and content settings shared by all outputs.
        shared_params: nil,
        # Labels for this request. Filter usage and request logs by them in the dashboard
        # or with `GET /org/logs`.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            formats: ContextDev::WebScrapeParams::Formats,
            url: String,
            highlights_params: ContextDev::WebScrapeParams::HighlightsParams,
            image_params: ContextDev::WebScrapeParams::ImageParams,
            json_params: ContextDev::WebScrapeParams::JsonParams,
            markdown_params: ContextDev::WebScrapeParams::MarkdownParams,
            max_age_ms: Integer,
            parse_params:
              T.any(
                ContextDev::WebScrapeParams::ParseParams::CustomParser,
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser
              ),
            policies: T::Array[String],
            product_params: ContextDev::WebScrapeParams::ProductParams,
            screenshot_params: ContextDev::WebScrapeParams::ScreenshotParams,
            shared_params: ContextDev::WebScrapeParams::SharedParams,
            tags: T::Array[String],
            timeout_opts: ContextDev::WebScrapeParams::TimeoutOpts,
            zdr: ContextDev::WebScrapeParams::Zdr::OrSymbol,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Formats < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebScrapeParams::Formats,
              ContextDev::Internal::AnyHash
            )
          end

        # Return the original HTTP response body.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :bytes

        sig { params(bytes: T::Boolean).void }
        attr_writer :bytes

        # Return Markdown excerpts relevant to `highlightsParams.query`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :highlights

        sig { params(highlights: T::Boolean).void }
        attr_writer :highlights

        # Return the rendered HTML.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :html

        sig { params(html: T::Boolean).void }
        attr_writer :html

        # Return the images found on the page.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :images

        sig { params(images: T::Boolean).void }
        attr_writer :images

        # Return an object matching `jsonParams.schema`, extracted from the page text and
        # embedded data such as JSON-LD, meta tags, and framework state.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :json

        sig { params(json: T::Boolean).void }
        attr_writer :json

        # Return the page content, or a video transcript, as Markdown.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :markdown

        sig { params(markdown: T::Boolean).void }
        attr_writer :markdown

        # Return fields extracted with custom rules or a prebuilt parser, as `parsed`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :parse

        sig { params(parse: T::Boolean).void }
        attr_writer :parse

        # Return product details such as name, price, and availability.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :product

        sig { params(product: T::Boolean).void }
        attr_writer :product

        # Return a screenshot of the page.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :screenshot

        sig { params(screenshot: T::Boolean).void }
        attr_writer :screenshot

        # Outputs to return. Set at least one to `true`.
        sig do
          params(
            bytes: T::Boolean,
            highlights: T::Boolean,
            html: T::Boolean,
            images: T::Boolean,
            json: T::Boolean,
            markdown: T::Boolean,
            parse: T::Boolean,
            product: T::Boolean,
            screenshot: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Return the original HTTP response body.
          bytes: nil,
          # Return Markdown excerpts relevant to `highlightsParams.query`.
          highlights: nil,
          # Return the rendered HTML.
          html: nil,
          # Return the images found on the page.
          images: nil,
          # Return an object matching `jsonParams.schema`, extracted from the page text and
          # embedded data such as JSON-LD, meta tags, and framework state.
          json: nil,
          # Return the page content, or a video transcript, as Markdown.
          markdown: nil,
          # Return fields extracted with custom rules or a prebuilt parser, as `parsed`.
          parse: nil,
          # Return product details such as name, price, and availability.
          product: nil,
          # Return a screenshot of the page.
          screenshot: nil
        )
        end

        sig do
          override.returns(
            {
              bytes: T::Boolean,
              highlights: T::Boolean,
              html: T::Boolean,
              images: T::Boolean,
              json: T::Boolean,
              markdown: T::Boolean,
              parse: T::Boolean,
              product: T::Boolean,
              screenshot: T::Boolean
            }
          )
        end
        def to_hash
        end
      end

      class HighlightsParams < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebScrapeParams::HighlightsParams,
              ContextDev::Internal::AnyHash
            )
          end

        # Question or topic to find relevant passages for.
        sig { returns(String) }
        attr_accessor :query

        # Maximum combined length of the returned passages, in characters.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_characters

        sig { params(max_characters: Integer).void }
        attr_writer :max_characters

        # Query for the `highlights` output. Required when `formats.highlights` is `true`,
        # and allowed only then.
        sig do
          params(query: String, max_characters: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Question or topic to find relevant passages for.
          query:,
          # Maximum combined length of the returned passages, in characters.
          max_characters: nil
        )
        end

        sig { override.returns({ query: String, max_characters: Integer }) }
        def to_hash
        end
      end

      class ImageParams < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebScrapeParams::ImageParams,
              ContextDev::Internal::AnyHash
            )
          end

        # Set to `visual` to drop visually duplicate images, keeping the largest copy.
        sig do
          returns(
            T.nilable(
              ContextDev::WebScrapeParams::ImageParams::Dedupe::OrSymbol
            )
          )
        end
        attr_reader :dedupe

        sig do
          params(
            dedupe: ContextDev::WebScrapeParams::ImageParams::Dedupe::OrSymbol
          ).void
        end
        attr_writer :dedupe

        # Extra data to add to each image: `dimensions` adds `width` and `height`,
        # `classification` adds `classification`, and `file` adds a hosted `fileUrl`.
        sig do
          returns(
            T.nilable(
              T::Array[
                ContextDev::WebScrapeParams::ImageParams::Enrich::OrSymbol
              ]
            )
          )
        end
        attr_reader :enrich

        sig do
          params(
            enrich:
              T::Array[
                ContextDev::WebScrapeParams::ImageParams::Enrich::OrSymbol
              ]
          ).void
        end
        attr_writer :enrich

        # Options for the `images` output. Requires `formats.images: true`.
        sig do
          params(
            dedupe: ContextDev::WebScrapeParams::ImageParams::Dedupe::OrSymbol,
            enrich:
              T::Array[
                ContextDev::WebScrapeParams::ImageParams::Enrich::OrSymbol
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Set to `visual` to drop visually duplicate images, keeping the largest copy.
          dedupe: nil,
          # Extra data to add to each image: `dimensions` adds `width` and `height`,
          # `classification` adds `classification`, and `file` adds a hosted `fileUrl`.
          enrich: nil
        )
        end

        sig do
          override.returns(
            {
              dedupe:
                ContextDev::WebScrapeParams::ImageParams::Dedupe::OrSymbol,
              enrich:
                T::Array[
                  ContextDev::WebScrapeParams::ImageParams::Enrich::OrSymbol
                ]
            }
          )
        end
        def to_hash
        end

        # Set to `visual` to drop visually duplicate images, keeping the largest copy.
        module Dedupe
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::WebScrapeParams::ImageParams::Dedupe)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NONE =
            T.let(
              :none,
              ContextDev::WebScrapeParams::ImageParams::Dedupe::TaggedSymbol
            )
          VISUAL =
            T.let(
              :visual,
              ContextDev::WebScrapeParams::ImageParams::Dedupe::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebScrapeParams::ImageParams::Dedupe::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Enrich
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::WebScrapeParams::ImageParams::Enrich)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DIMENSIONS =
            T.let(
              :dimensions,
              ContextDev::WebScrapeParams::ImageParams::Enrich::TaggedSymbol
            )
          CLASSIFICATION =
            T.let(
              :classification,
              ContextDev::WebScrapeParams::ImageParams::Enrich::TaggedSymbol
            )
          FILE =
            T.let(
              :file,
              ContextDev::WebScrapeParams::ImageParams::Enrich::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebScrapeParams::ImageParams::Enrich::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class JsonParams < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebScrapeParams::JsonParams,
              ContextDev::Internal::AnyHash
            )
          end

        # JSON Schema for the object to extract, not an example object. Must describe a
        # top-level object, up to 50 KB. Make fields optional or nullable when the page
        # may not state them.
        sig { returns(T::Hash[Symbol, T.anything]) }
        attr_accessor :schema

        # Extra guidance, such as which facts to prefer or how to read a field.
        sig { returns(T.nilable(String)) }
        attr_reader :instructions

        sig { params(instructions: String).void }
        attr_writer :instructions

        # Schema and instructions for the `json` output. Required when `formats.json` is
        # `true`, and allowed only then.
        sig do
          params(
            schema: T::Hash[Symbol, T.anything],
            instructions: String
          ).returns(T.attached_class)
        end
        def self.new(
          # JSON Schema for the object to extract, not an example object. Must describe a
          # top-level object, up to 50 KB. Make fields optional or nullable when the page
          # may not state them.
          schema:,
          # Extra guidance, such as which facts to prefer or how to read a field.
          instructions: nil
        )
        end

        sig do
          override.returns(
            { schema: T::Hash[Symbol, T.anything], instructions: String }
          )
        end
        def to_hash
        end
      end

      class MarkdownParams < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebScrapeParams::MarkdownParams,
              ContextDev::Internal::AnyHash
            )
          end

        # Include image references in the Markdown (`html-conversion` only).
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_images

        sig { params(include_images: T::Boolean).void }
        attr_writer :include_images

        # Keep link URLs in the Markdown (`html-conversion` only).
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_links

        sig { params(include_links: T::Boolean).void }
        attr_writer :include_links

        # How to write base64 images when `includeImages` is `true`: `placeholder`
        # shortens the data, `preserve` keeps it in full (`html-conversion` only).
        sig do
          returns(
            T.nilable(
              ContextDev::WebScrapeParams::MarkdownParams::InlineImages::OrSymbol
            )
          )
        end
        attr_reader :inline_images

        sig do
          params(
            inline_images:
              ContextDev::WebScrapeParams::MarkdownParams::InlineImages::OrSymbol
          ).void
        end
        attr_writer :inline_images

        # Markdown sources in order of preference: `html-conversion` converts the page
        # HTML, `markdown-direct` uses Markdown the site publishes.
        sig do
          returns(
            T.nilable(
              T::Array[
                ContextDev::WebScrapeParams::MarkdownParams::SourcePreference::OrSymbol
              ]
            )
          )
        end
        attr_reader :source_preference

        sig do
          params(
            source_preference:
              T::Array[
                ContextDev::WebScrapeParams::MarkdownParams::SourcePreference::OrSymbol
              ]
          ).void
        end
        attr_writer :source_preference

        # Options for the `markdown` output. Requires `formats.markdown: true`.
        sig do
          params(
            include_images: T::Boolean,
            include_links: T::Boolean,
            inline_images:
              ContextDev::WebScrapeParams::MarkdownParams::InlineImages::OrSymbol,
            source_preference:
              T::Array[
                ContextDev::WebScrapeParams::MarkdownParams::SourcePreference::OrSymbol
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Include image references in the Markdown (`html-conversion` only).
          include_images: nil,
          # Keep link URLs in the Markdown (`html-conversion` only).
          include_links: nil,
          # How to write base64 images when `includeImages` is `true`: `placeholder`
          # shortens the data, `preserve` keeps it in full (`html-conversion` only).
          inline_images: nil,
          # Markdown sources in order of preference: `html-conversion` converts the page
          # HTML, `markdown-direct` uses Markdown the site publishes.
          source_preference: nil
        )
        end

        sig do
          override.returns(
            {
              include_images: T::Boolean,
              include_links: T::Boolean,
              inline_images:
                ContextDev::WebScrapeParams::MarkdownParams::InlineImages::OrSymbol,
              source_preference:
                T::Array[
                  ContextDev::WebScrapeParams::MarkdownParams::SourcePreference::OrSymbol
                ]
            }
          )
        end
        def to_hash
        end

        # How to write base64 images when `includeImages` is `true`: `placeholder`
        # shortens the data, `preserve` keeps it in full (`html-conversion` only).
        module InlineImages
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::WebScrapeParams::MarkdownParams::InlineImages
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PLACEHOLDER =
            T.let(
              :placeholder,
              ContextDev::WebScrapeParams::MarkdownParams::InlineImages::TaggedSymbol
            )
          PRESERVE =
            T.let(
              :preserve,
              ContextDev::WebScrapeParams::MarkdownParams::InlineImages::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebScrapeParams::MarkdownParams::InlineImages::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module SourcePreference
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::WebScrapeParams::MarkdownParams::SourcePreference
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HTML_CONVERSION =
            T.let(
              :"html-conversion",
              ContextDev::WebScrapeParams::MarkdownParams::SourcePreference::TaggedSymbol
            )
          MARKDOWN_DIRECT =
            T.let(
              :"markdown-direct",
              ContextDev::WebScrapeParams::MarkdownParams::SourcePreference::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebScrapeParams::MarkdownParams::SourcePreference::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Custom rules or a prebuilt parser for the `parsed` output. Required when
      # `formats.parse` is `true`, and allowed only then.
      module ParseParams
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::WebScrapeParams::ParseParams::CustomParser,
              ContextDev::WebScrapeParams::ParseParams::PrebuiltParser
            )
          end

        class CustomParser < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::WebScrapeParams::ParseParams::CustomParser,
                ContextDev::Internal::AnyHash
              )
            end

          # Output field names mapped to a CSS selector (such as `h1` or `a@href`) or a rule
          # object. Up to 100 fields, nested up to 5 levels.
          sig do
            returns(
              T::Hash[
                Symbol,
                T.any(
                  String,
                  ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1
                )
              ]
            )
          end
          attr_accessor :rules

          # Extract fields with custom CSS rules. The default when `type` is omitted.
          sig do
            returns(
              T.nilable(
                ContextDev::WebScrapeParams::ParseParams::CustomParser::Type::OrSymbol
              )
            )
          end
          attr_reader :type

          sig do
            params(
              type:
                ContextDev::WebScrapeParams::ParseParams::CustomParser::Type::OrSymbol
            ).void
          end
          attr_writer :type

          sig do
            params(
              rules:
                T::Hash[
                  Symbol,
                  T.any(
                    String,
                    ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::OrHash
                  )
                ],
              type:
                ContextDev::WebScrapeParams::ParseParams::CustomParser::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Output field names mapped to a CSS selector (such as `h1` or `a@href`) or a rule
            # object. Up to 100 fields, nested up to 5 levels.
            rules:,
            # Extract fields with custom CSS rules. The default when `type` is omitted.
            type: nil
          )
          end

          sig do
            override.returns(
              {
                rules:
                  T::Hash[
                    Symbol,
                    T.any(
                      String,
                      ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1
                    )
                  ],
                type:
                  ContextDev::WebScrapeParams::ParseParams::CustomParser::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Rule
            extend ContextDev::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  String,
                  ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1
                )
              end

            class UnionMember1 < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1,
                    ContextDev::Internal::AnyHash
                  )
                end

              # CSS selector to match within the current page or parent rule.
              sig { returns(String) }
              attr_accessor :selector

              # What to return: `text`, `html`, an attribute such as `@href`, or nested field
              # rules. Defaults to `text`.
              sig do
                returns(
                  T.nilable(
                    T.any(
                      ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Output::OrSymbol,
                      String,
                      T.anything
                    )
                  )
                )
              end
              attr_reader :output

              sig do
                params(
                  output:
                    T.any(
                      ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Output::OrSymbol,
                      String,
                      T.anything
                    )
                ).void
              end
              attr_writer :output

              # Return the first match with `item` or all matches with `list`.
              sig do
                returns(
                  T.nilable(
                    ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Type::OrSymbol
                  )
                )
              end
              attr_reader :type

              sig do
                params(
                  type:
                    ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Type::OrSymbol
                ).void
              end
              attr_writer :type

              sig do
                params(
                  selector: String,
                  output:
                    T.any(
                      ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Output::OrSymbol,
                      String,
                      T.anything
                    ),
                  type:
                    ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Type::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(
                # CSS selector to match within the current page or parent rule.
                selector:,
                # What to return: `text`, `html`, an attribute such as `@href`, or nested field
                # rules. Defaults to `text`.
                output: nil,
                # Return the first match with `item` or all matches with `list`.
                type: nil
              )
              end

              sig do
                override.returns(
                  {
                    selector: String,
                    output:
                      T.any(
                        ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Output::OrSymbol,
                        String,
                        T.anything
                      ),
                    type:
                      ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Type::OrSymbol
                  }
                )
              end
              def to_hash
              end

              # What to return: `text`, `html`, an attribute such as `@href`, or nested field
              # rules. Defaults to `text`.
              module Output
                extend ContextDev::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Output::TaggedSymbol,
                      String,
                      T.anything
                    )
                  end

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Output::Variants
                    ]
                  )
                end
                def self.variants
                end

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Output
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                TEXT =
                  T.let(
                    :text,
                    ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Output::TaggedSymbol
                  )
                HTML =
                  T.let(
                    :html,
                    ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Output::TaggedSymbol
                  )
              end

              # Return the first match with `item` or all matches with `list`.
              module Type
                extend ContextDev::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                ITEM =
                  T.let(
                    :item,
                    ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Type::TaggedSymbol
                  )
                LIST =
                  T.let(
                    :list,
                    ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::UnionMember1::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            sig do
              override.returns(
                T::Array[
                  ContextDev::WebScrapeParams::ParseParams::CustomParser::Rule::Variants
                ]
              )
            end
            def self.variants
            end
          end

          # Extract fields with custom CSS rules. The default when `type` is omitted.
          module Type
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::WebScrapeParams::ParseParams::CustomParser::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CUSTOM =
              T.let(
                :custom,
                ContextDev::WebScrapeParams::ParseParams::CustomParser::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::WebScrapeParams::ParseParams::CustomParser::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class PrebuiltParser < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser,
                ContextDev::Internal::AnyHash
              )
            end

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
          sig do
            returns(
              ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::OrSymbol
            )
          end
          attr_accessor :parser

          # Use a prebuilt parser instead of custom rules.
          sig { returns(Symbol) }
          attr_accessor :type

          # Maximum number of reviews (`google-maps-reviews`, default 100), comments
          # (`reddit-post`, default 100), or results (`reddit-search`, `reddit-subreddit`,
          # and `reddit-user`, default 100) to return. Only these parsers accept it.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Order of `data.reviews` for `google-maps-reviews`. `newest`, `relevant`,
          # `highest`, and `lowest` use the same orders as Google Maps; `oldest` returns the
          # earliest reviews first.
          sig do
            returns(
              T.nilable(
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Sort::OrSymbol
              )
            )
          end
          attr_reader :sort

          sig do
            params(
              sort:
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Sort::OrSymbol
            ).void
          end
          attr_writer :sort

          sig do
            params(
              parser:
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::OrSymbol,
              limit: Integer,
              sort:
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Sort::OrSymbol,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
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
            parser:,
            # Maximum number of reviews (`google-maps-reviews`, default 100), comments
            # (`reddit-post`, default 100), or results (`reddit-search`, `reddit-subreddit`,
            # and `reddit-user`, default 100) to return. Only these parsers accept it.
            limit: nil,
            # Order of `data.reviews` for `google-maps-reviews`. `newest`, `relevant`,
            # `highest`, and `lowest` use the same orders as Google Maps; `oldest` returns the
            # earliest reviews first.
            sort: nil,
            # Use a prebuilt parser instead of custom rules.
            type: :prebuilt
          )
          end

          sig do
            override.returns(
              {
                parser:
                  ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::OrSymbol,
                type: Symbol,
                limit: Integer,
                sort:
                  ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Sort::OrSymbol
              }
            )
          end
          def to_hash
          end

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
          module Parser
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GOOGLE_MAPS =
              T.let(
                :"google-maps",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            GOOGLE_MAPS_REVIEWS =
              T.let(
                :"google-maps-reviews",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            GOOGLE_PLAY =
              T.let(
                :"google-play",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            GOOGLE_PLAY_REVIEWS =
              T.let(
                :"google-play-reviews",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            APP_STORE =
              T.let(
                :"app-store",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            APP_STORE_REVIEWS =
              T.let(
                :"app-store-reviews",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            G2_REVIEWS =
              T.let(
                :"g2-reviews",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            INSTAGRAM_PROFILE =
              T.let(
                :"instagram-profile",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            INSTAGRAM_POST =
              T.let(
                :"instagram-post",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            INSTAGRAM_FEED =
              T.let(
                :"instagram-feed",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            TIKTOK_PROFILE =
              T.let(
                :"tiktok-profile",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            TIKTOK_VIDEO =
              T.let(
                :"tiktok-video",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            TIKTOK_FEED =
              T.let(
                :"tiktok-feed",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            TIKTOK_COMMENTS =
              T.let(
                :"tiktok-comments",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            TIKTOK_FOLLOWERS =
              T.let(
                :"tiktok-followers",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            TIKTOK_FOLLOWING =
              T.let(
                :"tiktok-following",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            TIKTOK_USER_SEARCH =
              T.let(
                :"tiktok-user-search",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            REDDIT_POST =
              T.let(
                :"reddit-post",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            REDDIT_SEARCH =
              T.let(
                :"reddit-search",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            REDDIT_SUBREDDIT =
              T.let(
                :"reddit-subreddit",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            REDDIT_USER =
              T.let(
                :"reddit-user",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            YELP_SEARCH =
              T.let(
                :"yelp-search",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            YELP_REVIEWS =
              T.let(
                :"yelp-reviews",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            TRIPADVISOR_REVIEWS =
              T.let(
                :"tripadvisor-reviews",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            CAR_RENTAL_AVAILABILITY =
              T.let(
                :"car-rental-availability",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            CAR_RENTAL_LOCATIONS =
              T.let(
                :"car-rental-locations",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            EMAILS =
              T.let(
                :emails,
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            PHONE_NUMBERS =
              T.let(
                :"phone-numbers",
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )
            LINKS =
              T.let(
                :links,
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Order of `data.reviews` for `google-maps-reviews`. `newest`, `relevant`,
          # `highest`, and `lowest` use the same orders as Google Maps; `oldest` returns the
          # earliest reviews first.
          module Sort
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Sort
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            NEWEST =
              T.let(
                :newest,
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Sort::TaggedSymbol
              )
            OLDEST =
              T.let(
                :oldest,
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Sort::TaggedSymbol
              )
            RELEVANT =
              T.let(
                :relevant,
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Sort::TaggedSymbol
              )
            HIGHEST =
              T.let(
                :highest,
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Sort::TaggedSymbol
              )
            LOWEST =
              T.let(
                :lowest,
                ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Sort::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::WebScrapeParams::ParseParams::PrebuiltParser::Sort::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[ContextDev::WebScrapeParams::ParseParams::Variants]
          )
        end
        def self.variants
        end
      end

      class ProductParams < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebScrapeParams::ProductParams,
              ContextDev::Internal::AnyHash
            )
          end

        # Drop visually duplicate product images, keeping the largest copy.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :dedupe_images

        sig { params(dedupe_images: T::Boolean).void }
        attr_writer :dedupe_images

        # Ignored. The AI fallback runs automatically.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :use_ai_fallback

        sig { params(use_ai_fallback: T::Boolean).void }
        attr_writer :use_ai_fallback

        # Options for the `product` output. Requires `formats.product: true`.
        sig do
          params(
            dedupe_images: T::Boolean,
            use_ai_fallback: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Drop visually duplicate product images, keeping the largest copy.
          dedupe_images: nil,
          # Ignored. The AI fallback runs automatically.
          use_ai_fallback: nil
        )
        end

        sig do
          override.returns(
            { dedupe_images: T::Boolean, use_ai_fallback: T::Boolean }
          )
        end
        def to_hash
        end
      end

      class ScreenshotParams < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebScrapeParams::ScreenshotParams,
              ContextDev::Internal::AnyHash
            )
          end

        # What to capture: `viewport`, `fullPage`, one element, or a rectangle. Up to 40
        # megapixels.
        sig do
          returns(
            T.nilable(
              T.any(
                ContextDev::WebScrapeParams::ScreenshotParams::Area::Page::OrSymbol,
                ContextDev::WebScrapeParams::ScreenshotParams::Area::Element,
                ContextDev::WebScrapeParams::ScreenshotParams::Area::Rectangle
              )
            )
          )
        end
        attr_reader :area

        sig do
          params(
            area:
              T.any(
                ContextDev::WebScrapeParams::ScreenshotParams::Area::Page::OrSymbol,
                ContextDev::WebScrapeParams::ScreenshotParams::Area::Element::OrHash,
                ContextDev::WebScrapeParams::ScreenshotParams::Area::Rectangle::OrHash
              )
          ).void
        end
        attr_writer :area

        # Image format for the screenshot.
        sig do
          returns(
            T.nilable(
              ContextDev::WebScrapeParams::ScreenshotParams::Format::OrSymbol
            )
          )
        end
        attr_reader :format_

        sig do
          params(
            format_:
              ContextDev::WebScrapeParams::ScreenshotParams::Format::OrSymbol
          ).void
        end
        attr_writer :format_

        # Options for the `screenshot` output. Requires `formats.screenshot: true`.
        sig do
          params(
            area:
              T.any(
                ContextDev::WebScrapeParams::ScreenshotParams::Area::Page::OrSymbol,
                ContextDev::WebScrapeParams::ScreenshotParams::Area::Element::OrHash,
                ContextDev::WebScrapeParams::ScreenshotParams::Area::Rectangle::OrHash
              ),
            format_:
              ContextDev::WebScrapeParams::ScreenshotParams::Format::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # What to capture: `viewport`, `fullPage`, one element, or a rectangle. Up to 40
          # megapixels.
          area: nil,
          # Image format for the screenshot.
          format_: nil
        )
        end

        sig do
          override.returns(
            {
              area:
                T.any(
                  ContextDev::WebScrapeParams::ScreenshotParams::Area::Page::OrSymbol,
                  ContextDev::WebScrapeParams::ScreenshotParams::Area::Element,
                  ContextDev::WebScrapeParams::ScreenshotParams::Area::Rectangle
                ),
              format_:
                ContextDev::WebScrapeParams::ScreenshotParams::Format::OrSymbol
            }
          )
        end
        def to_hash
        end

        # What to capture: `viewport`, `fullPage`, one element, or a rectangle. Up to 40
        # megapixels.
        module Area
          extend ContextDev::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                ContextDev::WebScrapeParams::ScreenshotParams::Area::Page::TaggedSymbol,
                ContextDev::WebScrapeParams::ScreenshotParams::Area::Element,
                ContextDev::WebScrapeParams::ScreenshotParams::Area::Rectangle
              )
            end

          module Page
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::WebScrapeParams::ScreenshotParams::Area::Page
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VIEWPORT =
              T.let(
                :viewport,
                ContextDev::WebScrapeParams::ScreenshotParams::Area::Page::TaggedSymbol
              )
            FULL_PAGE =
              T.let(
                :fullPage,
                ContextDev::WebScrapeParams::ScreenshotParams::Area::Page::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::WebScrapeParams::ScreenshotParams::Area::Page::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Element < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::WebScrapeParams::ScreenshotParams::Area::Element,
                  ContextDev::Internal::AnyHash
                )
              end

            # CSS selector matching exactly one visible element.
            sig { returns(String) }
            attr_accessor :selector

            sig { params(selector: String).returns(T.attached_class) }
            def self.new(
              # CSS selector matching exactly one visible element.
              selector:
            )
            end

            sig { override.returns({ selector: String }) }
            def to_hash
            end
          end

          class Rectangle < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::WebScrapeParams::ScreenshotParams::Area::Rectangle,
                  ContextDev::Internal::AnyHash
                )
              end

            # Height of the capture in pixels.
            sig { returns(Integer) }
            attr_accessor :height

            # Width of the capture in pixels.
            sig { returns(Integer) }
            attr_accessor :width

            # Left edge of the capture, in pixels from the document origin.
            sig { returns(Integer) }
            attr_accessor :x

            # Top edge of the capture, in pixels from the document origin.
            sig { returns(Integer) }
            attr_accessor :y_

            # Rectangle to capture, in pixels from the document origin.
            sig do
              params(
                height: Integer,
                width: Integer,
                x: Integer,
                y_: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              # Height of the capture in pixels.
              height:,
              # Width of the capture in pixels.
              width:,
              # Left edge of the capture, in pixels from the document origin.
              x:,
              # Top edge of the capture, in pixels from the document origin.
              y_:
            )
            end

            sig do
              override.returns(
                { height: Integer, width: Integer, x: Integer, y_: Integer }
              )
            end
            def to_hash
            end
          end

          sig do
            override.returns(
              T::Array[
                ContextDev::WebScrapeParams::ScreenshotParams::Area::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # Image format for the screenshot.
        module Format
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::WebScrapeParams::ScreenshotParams::Format
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PNG =
            T.let(
              :png,
              ContextDev::WebScrapeParams::ScreenshotParams::Format::TaggedSymbol
            )
          JPEG =
            T.let(
              :jpeg,
              ContextDev::WebScrapeParams::ScreenshotParams::Format::TaggedSymbol
            )
          WEBP =
            T.let(
              :webp,
              ContextDev::WebScrapeParams::ScreenshotParams::Format::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebScrapeParams::ScreenshotParams::Format::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class SharedParams < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebScrapeParams::SharedParams,
              ContextDev::Internal::AnyHash
            )
          end

        # Browser steps to run in order before capture. Requires a paid plan. Skips the
        # cache.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.any(
                  ContextDev::WebScrapeParams::SharedParams::Action::Perform,
                  ContextDev::WebScrapeParams::SharedParams::Action::Scroll,
                  ContextDev::WebScrapeParams::SharedParams::Action::Wait,
                  ContextDev::WebScrapeParams::SharedParams::Action::WaitFor
                )
              ]
            )
          )
        end
        attr_reader :actions

        sig do
          params(
            actions:
              T::Array[
                T.any(
                  ContextDev::WebScrapeParams::SharedParams::Action::Perform::OrHash,
                  ContextDev::WebScrapeParams::SharedParams::Action::Scroll::OrHash,
                  ContextDev::WebScrapeParams::SharedParams::Action::Wait::OrHash,
                  ContextDev::WebScrapeParams::SharedParams::Action::WaitFor::OrHash
                )
              ]
          ).void
        end
        attr_writer :actions

        # Country to fetch from, as an ISO 3166-1 alpha-2 code such as `US`.
        # Case-insensitive.
        sig { returns(T.nilable(String)) }
        attr_reader :country

        sig { params(country: String).void }
        attr_writer :country

        # Accept cookie banners before actions and capture.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :dismiss_cookies

        sig { params(dismiss_cookies: T::Boolean).void }
        attr_writer :dismiss_cookies

        # Close other popups before actions and capture.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :dismiss_popups

        sig { params(dismiss_popups: T::Boolean).void }
        attr_writer :dismiss_popups

        # Remove elements matching these CSS selectors. Overrides `includeSelectors`.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :exclude_selectors

        sig { params(exclude_selectors: T::Array[String]).void }
        attr_writer :exclude_selectors

        # HTTP headers to send to the target site. Requests with headers skip the cache.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :headers

        sig { params(headers: T::Hash[Symbol, String]).void }
        attr_writer :headers

        # Which iframes to inline in HTML and text outputs. Screenshots always show
        # visible frames. `auto` inlines only iframes that hold page content, such as
        # same-site documents, framesets, job boards, forms, and embedded documents, and
        # skips ads and widgets. `true` inlines every iframe; `false` inlines none.
        sig do
          returns(
            T.nilable(
              T.any(
                T::Boolean,
                ContextDev::WebScrapeParams::SharedParams::IncludeFrames::OrSymbol
              )
            )
          )
        end
        attr_reader :include_frames

        sig do
          params(
            include_frames:
              T.any(
                T::Boolean,
                ContextDev::WebScrapeParams::SharedParams::IncludeFrames::OrSymbol
              )
          ).void
        end
        attr_writer :include_frames

        # Keep only elements matching these CSS selectors.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :include_selectors

        sig { params(include_selectors: T::Array[String]).void }
        attr_writer :include_selectors

        # Keep only the main content, without navigation, headers, footers, or sidebars.
        # Does not affect `screenshot`, `bytes`, or `product`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :main_content_only

        sig { params(main_content_only: T::Boolean).void }
        attr_writer :main_content_only

        # Options for parsing documents such as PDFs.
        sig do
          returns(T.nilable(ContextDev::WebScrapeParams::SharedParams::Parsers))
        end
        attr_reader :parsers

        sig do
          params(
            parsers: ContextDev::WebScrapeParams::SharedParams::Parsers::OrHash
          ).void
        end
        attr_writer :parsers

        # Scrape as a signed-in user. Create a profile with `type: "new"` and your
        # credentials, then reuse it with `type: "existing"`. Requires a paid plan and an
        # HTTPS URL. Profiles keep their session between requests, skip the cache, and
        # cannot be combined with ZDR, custom headers, `formats.bytes`, or prebuilt
        # parsers other than `emails`, `phone-numbers`, and `links`.
        sig do
          returns(
            T.nilable(
              T.any(
                ContextDev::WebScrapeParams::SharedParams::Profile::Existing,
                ContextDev::WebScrapeParams::SharedParams::Profile::New
              )
            )
          )
        end
        attr_reader :profile

        sig do
          params(
            profile:
              T.any(
                ContextDev::WebScrapeParams::SharedParams::Profile::Existing::OrHash,
                ContextDev::WebScrapeParams::SharedParams::Profile::New::OrHash
              )
          ).void
        end
        attr_writer :profile

        # Wait for CSS animations to finish before capture. Defaults to `true` when
        # `formats.screenshot` is `true`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :settle_animations

        sig { params(settle_animations: T::Boolean).void }
        attr_writer :settle_animations

        # Emulate a light or dark color scheme.
        sig do
          returns(
            T.nilable(
              ContextDev::WebScrapeParams::SharedParams::Theme::OrSymbol
            )
          )
        end
        attr_reader :theme

        sig do
          params(
            theme: ContextDev::WebScrapeParams::SharedParams::Theme::OrSymbol
          ).void
        end
        attr_writer :theme

        # Browser viewport in pixels. Defaults to 1920 × 1080. If you pass `viewport`, a
        # missing `width` defaults to 1440 and a missing `height` to 900.
        sig do
          returns(
            T.nilable(ContextDev::WebScrapeParams::SharedParams::Viewport)
          )
        end
        attr_reader :viewport

        sig do
          params(
            viewport:
              ContextDev::WebScrapeParams::SharedParams::Viewport::OrHash
          ).void
        end
        attr_writer :viewport

        # Time to wait after actions, in milliseconds, or a CSS selector to wait for.
        # Defaults to 500 ms, or 2000 ms when `includeFrames` is `true` or the URL ends in
        # `.xml`.
        sig do
          returns(
            T.nilable(
              ContextDev::WebScrapeParams::SharedParams::WaitFor::Variants
            )
          )
        end
        attr_reader :wait_for

        sig do
          params(
            wait_for:
              ContextDev::WebScrapeParams::SharedParams::WaitFor::Variants
          ).void
        end
        attr_writer :wait_for

        # Browser and content settings shared by all outputs.
        sig do
          params(
            actions:
              T::Array[
                T.any(
                  ContextDev::WebScrapeParams::SharedParams::Action::Perform::OrHash,
                  ContextDev::WebScrapeParams::SharedParams::Action::Scroll::OrHash,
                  ContextDev::WebScrapeParams::SharedParams::Action::Wait::OrHash,
                  ContextDev::WebScrapeParams::SharedParams::Action::WaitFor::OrHash
                )
              ],
            country: String,
            dismiss_cookies: T::Boolean,
            dismiss_popups: T::Boolean,
            exclude_selectors: T::Array[String],
            headers: T::Hash[Symbol, String],
            include_frames:
              T.any(
                T::Boolean,
                ContextDev::WebScrapeParams::SharedParams::IncludeFrames::OrSymbol
              ),
            include_selectors: T::Array[String],
            main_content_only: T::Boolean,
            parsers: ContextDev::WebScrapeParams::SharedParams::Parsers::OrHash,
            profile:
              T.any(
                ContextDev::WebScrapeParams::SharedParams::Profile::Existing::OrHash,
                ContextDev::WebScrapeParams::SharedParams::Profile::New::OrHash
              ),
            settle_animations: T::Boolean,
            theme: ContextDev::WebScrapeParams::SharedParams::Theme::OrSymbol,
            viewport:
              ContextDev::WebScrapeParams::SharedParams::Viewport::OrHash,
            wait_for:
              ContextDev::WebScrapeParams::SharedParams::WaitFor::Variants
          ).returns(T.attached_class)
        end
        def self.new(
          # Browser steps to run in order before capture. Requires a paid plan. Skips the
          # cache.
          actions: nil,
          # Country to fetch from, as an ISO 3166-1 alpha-2 code such as `US`.
          # Case-insensitive.
          country: nil,
          # Accept cookie banners before actions and capture.
          dismiss_cookies: nil,
          # Close other popups before actions and capture.
          dismiss_popups: nil,
          # Remove elements matching these CSS selectors. Overrides `includeSelectors`.
          exclude_selectors: nil,
          # HTTP headers to send to the target site. Requests with headers skip the cache.
          headers: nil,
          # Which iframes to inline in HTML and text outputs. Screenshots always show
          # visible frames. `auto` inlines only iframes that hold page content, such as
          # same-site documents, framesets, job boards, forms, and embedded documents, and
          # skips ads and widgets. `true` inlines every iframe; `false` inlines none.
          include_frames: nil,
          # Keep only elements matching these CSS selectors.
          include_selectors: nil,
          # Keep only the main content, without navigation, headers, footers, or sidebars.
          # Does not affect `screenshot`, `bytes`, or `product`.
          main_content_only: nil,
          # Options for parsing documents such as PDFs.
          parsers: nil,
          # Scrape as a signed-in user. Create a profile with `type: "new"` and your
          # credentials, then reuse it with `type: "existing"`. Requires a paid plan and an
          # HTTPS URL. Profiles keep their session between requests, skip the cache, and
          # cannot be combined with ZDR, custom headers, `formats.bytes`, or prebuilt
          # parsers other than `emails`, `phone-numbers`, and `links`.
          profile: nil,
          # Wait for CSS animations to finish before capture. Defaults to `true` when
          # `formats.screenshot` is `true`.
          settle_animations: nil,
          # Emulate a light or dark color scheme.
          theme: nil,
          # Browser viewport in pixels. Defaults to 1920 × 1080. If you pass `viewport`, a
          # missing `width` defaults to 1440 and a missing `height` to 900.
          viewport: nil,
          # Time to wait after actions, in milliseconds, or a CSS selector to wait for.
          # Defaults to 500 ms, or 2000 ms when `includeFrames` is `true` or the URL ends in
          # `.xml`.
          wait_for: nil
        )
        end

        sig do
          override.returns(
            {
              actions:
                T::Array[
                  T.any(
                    ContextDev::WebScrapeParams::SharedParams::Action::Perform,
                    ContextDev::WebScrapeParams::SharedParams::Action::Scroll,
                    ContextDev::WebScrapeParams::SharedParams::Action::Wait,
                    ContextDev::WebScrapeParams::SharedParams::Action::WaitFor
                  )
                ],
              country: String,
              dismiss_cookies: T::Boolean,
              dismiss_popups: T::Boolean,
              exclude_selectors: T::Array[String],
              headers: T::Hash[Symbol, String],
              include_frames:
                T.any(
                  T::Boolean,
                  ContextDev::WebScrapeParams::SharedParams::IncludeFrames::OrSymbol
                ),
              include_selectors: T::Array[String],
              main_content_only: T::Boolean,
              parsers: ContextDev::WebScrapeParams::SharedParams::Parsers,
              profile:
                T.any(
                  ContextDev::WebScrapeParams::SharedParams::Profile::Existing,
                  ContextDev::WebScrapeParams::SharedParams::Profile::New
                ),
              settle_animations: T::Boolean,
              theme: ContextDev::WebScrapeParams::SharedParams::Theme::OrSymbol,
              viewport: ContextDev::WebScrapeParams::SharedParams::Viewport,
              wait_for:
                ContextDev::WebScrapeParams::SharedParams::WaitFor::Variants
            }
          )
        end
        def to_hash
        end

        module Action
          extend ContextDev::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                ContextDev::WebScrapeParams::SharedParams::Action::Perform,
                ContextDev::WebScrapeParams::SharedParams::Action::Scroll,
                ContextDev::WebScrapeParams::SharedParams::Action::Wait,
                ContextDev::WebScrapeParams::SharedParams::Action::WaitFor
              )
            end

          class Perform < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::WebScrapeParams::SharedParams::Action::Perform,
                  ContextDev::Internal::AnyHash
                )
              end

            # One browser instruction, such as clicking a button or entering text.
            sig { returns(String) }
            attr_accessor :action

            # Follow a plain-language instruction.
            sig { returns(Symbol) }
            attr_accessor :type

            sig do
              params(action: String, type: Symbol).returns(T.attached_class)
            end
            def self.new(
              # One browser instruction, such as clicking a button or entering text.
              action:,
              # Follow a plain-language instruction.
              type: :perform
            )
            end

            sig { override.returns({ action: String, type: Symbol }) }
            def to_hash
            end
          end

          class Scroll < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::WebScrapeParams::SharedParams::Action::Scroll,
                  ContextDev::Internal::AnyHash
                )
              end

            # Scroll the page or a container.
            sig { returns(Symbol) }
            attr_accessor :type

            # Distance per scroll step: a number of pixels, one `viewport`, or `max` to reach
            # the end.
            sig do
              returns(
                T.nilable(
                  T.any(
                    Integer,
                    ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Amount::OrSymbol
                  )
                )
              )
            end
            attr_reader :amount

            sig do
              params(
                amount:
                  T.any(
                    Integer,
                    ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Amount::OrSymbol
                  )
              ).void
            end
            attr_writer :amount

            # Direction to scroll.
            sig do
              returns(
                T.nilable(
                  ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Direction::OrSymbol
                )
              )
            end
            attr_reader :direction

            sig do
              params(
                direction:
                  ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Direction::OrSymbol
              ).void
            end
            attr_writer :direction

            # Maximum number of scroll steps for this action.
            sig { returns(T.nilable(Integer)) }
            attr_reader :max_scrolls

            sig { params(max_scrolls: Integer).void }
            attr_writer :max_scrolls

            # CSS selector of the container to scroll. Omit to scroll the page.
            sig { returns(T.nilable(String)) }
            attr_reader :selector

            sig { params(selector: String).void }
            attr_writer :selector

            sig do
              params(
                amount:
                  T.any(
                    Integer,
                    ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Amount::OrSymbol
                  ),
                direction:
                  ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Direction::OrSymbol,
                max_scrolls: Integer,
                selector: String,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Distance per scroll step: a number of pixels, one `viewport`, or `max` to reach
              # the end.
              amount: nil,
              # Direction to scroll.
              direction: nil,
              # Maximum number of scroll steps for this action.
              max_scrolls: nil,
              # CSS selector of the container to scroll. Omit to scroll the page.
              selector: nil,
              # Scroll the page or a container.
              type: :scroll
            )
            end

            sig do
              override.returns(
                {
                  type: Symbol,
                  amount:
                    T.any(
                      Integer,
                      ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Amount::OrSymbol
                    ),
                  direction:
                    ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Direction::OrSymbol,
                  max_scrolls: Integer,
                  selector: String
                }
              )
            end
            def to_hash
            end

            # Distance per scroll step: a number of pixels, one `viewport`, or `max` to reach
            # the end.
            module Amount
              extend ContextDev::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    Integer,
                    ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Amount::TaggedSymbol
                  )
                end

              sig do
                override.returns(
                  T::Array[
                    ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Amount::Variants
                  ]
                )
              end
              def self.variants
              end

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Amount
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              VIEWPORT =
                T.let(
                  :viewport,
                  ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Amount::TaggedSymbol
                )
              MAX =
                T.let(
                  :max,
                  ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Amount::TaggedSymbol
                )
            end

            # Direction to scroll.
            module Direction
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Direction
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              DOWN =
                T.let(
                  :down,
                  ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Direction::TaggedSymbol
                )
              UP =
                T.let(
                  :up,
                  ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Direction::TaggedSymbol
                )
              LEFT =
                T.let(
                  :left,
                  ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Direction::TaggedSymbol
                )
              RIGHT =
                T.let(
                  :right,
                  ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Direction::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::WebScrapeParams::SharedParams::Action::Scroll::Direction::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Wait < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::WebScrapeParams::SharedParams::Action::Wait,
                  ContextDev::Internal::AnyHash
                )
              end

            # How long to pause before the next action, in milliseconds.
            sig { returns(Integer) }
            attr_accessor :milliseconds

            # Pause for a fixed time.
            sig { returns(Symbol) }
            attr_accessor :type

            sig do
              params(milliseconds: Integer, type: Symbol).returns(
                T.attached_class
              )
            end
            def self.new(
              # How long to pause before the next action, in milliseconds.
              milliseconds:,
              # Pause for a fixed time.
              type: :wait
            )
            end

            sig { override.returns({ milliseconds: Integer, type: Symbol }) }
            def to_hash
            end
          end

          class WaitFor < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::WebScrapeParams::SharedParams::Action::WaitFor,
                  ContextDev::Internal::AnyHash
                )
              end

            # CSS selector to wait for before continuing.
            sig { returns(String) }
            attr_accessor :selector

            # Wait for an element matching `selector`.
            sig { returns(Symbol) }
            attr_accessor :type

            sig do
              params(selector: String, type: Symbol).returns(T.attached_class)
            end
            def self.new(
              # CSS selector to wait for before continuing.
              selector:,
              # Wait for an element matching `selector`.
              type: :waitFor
            )
            end

            sig { override.returns({ selector: String, type: Symbol }) }
            def to_hash
            end
          end

          sig do
            override.returns(
              T::Array[
                ContextDev::WebScrapeParams::SharedParams::Action::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # Which iframes to inline in HTML and text outputs. Screenshots always show
        # visible frames. `auto` inlines only iframes that hold page content, such as
        # same-site documents, framesets, job boards, forms, and embedded documents, and
        # skips ads and widgets. `true` inlines every iframe; `false` inlines none.
        module IncludeFrames
          extend ContextDev::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                T::Boolean,
                ContextDev::WebScrapeParams::SharedParams::IncludeFrames::TaggedSymbol
              )
            end

          sig do
            override.returns(
              T::Array[
                ContextDev::WebScrapeParams::SharedParams::IncludeFrames::Variants
              ]
            )
          end
          def self.variants
          end

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::WebScrapeParams::SharedParams::IncludeFrames
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AUTO =
            T.let(
              :auto,
              ContextDev::WebScrapeParams::SharedParams::IncludeFrames::TaggedSymbol
            )
        end

        class Parsers < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::WebScrapeParams::SharedParams::Parsers,
                ContextDev::Internal::AnyHash
              )
            end

          # Page range, OCR, and page markers for PDFs.
          sig do
            returns(
              T.nilable(ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf)
            )
          end
          attr_reader :pdf

          sig do
            params(
              pdf:
                ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf::OrHash
            ).void
          end
          attr_writer :pdf

          # Options for parsing documents such as PDFs.
          sig do
            params(
              pdf:
                ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Page range, OCR, and page markers for PDFs.
            pdf: nil
          )
          end

          sig do
            override.returns(
              { pdf: ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf }
            )
          end
          def to_hash
          end

          class Pdf < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf,
                  ContextDev::Internal::AnyHash
                )
              end

            # Last page to parse. Defaults to the last page. Must be at least `startPage`.
            sig { returns(T.nilable(Integer)) }
            attr_reader :end_page

            sig { params(end_page: Integer).void }
            attr_writer :end_page

            # Start each PDF page in the Markdown with a `<!-- page N -->` line, where `N` is
            # the original 1-based page number. These responses are never served from cache.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :include_numbered_pages

            sig { params(include_numbered_pages: T::Boolean).void }
            attr_writer :include_numbered_pages

            # Set to `auto` to read scanned pages with OCR. Adds 1 credit per page read.
            sig do
              returns(
                T.nilable(
                  ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr::OrSymbol
                )
              )
            end
            attr_reader :ocr

            sig do
              params(
                ocr:
                  ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr::OrSymbol
              ).void
            end
            attr_writer :ocr

            # First page to parse, starting at 1.
            sig { returns(T.nilable(Integer)) }
            attr_reader :start_page

            sig { params(start_page: Integer).void }
            attr_writer :start_page

            # Page range, OCR, and page markers for PDFs.
            sig do
              params(
                end_page: Integer,
                include_numbered_pages: T::Boolean,
                ocr:
                  ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr::OrSymbol,
                start_page: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              # Last page to parse. Defaults to the last page. Must be at least `startPage`.
              end_page: nil,
              # Start each PDF page in the Markdown with a `<!-- page N -->` line, where `N` is
              # the original 1-based page number. These responses are never served from cache.
              include_numbered_pages: nil,
              # Set to `auto` to read scanned pages with OCR. Adds 1 credit per page read.
              ocr: nil,
              # First page to parse, starting at 1.
              start_page: nil
            )
            end

            sig do
              override.returns(
                {
                  end_page: Integer,
                  include_numbered_pages: T::Boolean,
                  ocr:
                    ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr::OrSymbol,
                  start_page: Integer
                }
              )
            end
            def to_hash
            end

            # Set to `auto` to read scanned pages with OCR. Adds 1 credit per page read.
            module Ocr
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              OFF =
                T.let(
                  :off,
                  ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr::TaggedSymbol
                )
              AUTO =
                T.let(
                  :auto,
                  ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        # Scrape as a signed-in user. Create a profile with `type: "new"` and your
        # credentials, then reuse it with `type: "existing"`. Requires a paid plan and an
        # HTTPS URL. Profiles keep their session between requests, skip the cache, and
        # cannot be combined with ZDR, custom headers, `formats.bytes`, or prebuilt
        # parsers other than `emails`, `phone-numbers`, and `links`.
        module Profile
          extend ContextDev::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                ContextDev::WebScrapeParams::SharedParams::Profile::Existing,
                ContextDev::WebScrapeParams::SharedParams::Profile::New
              )
            end

          class Existing < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::WebScrapeParams::SharedParams::Profile::Existing,
                  ContextDev::Internal::AnyHash
                )
              end

            # ID of the browser profile, from `profile.id` in an earlier scrape response.
            sig { returns(String) }
            attr_accessor :profile_id

            # Reuse a saved browser profile.
            sig { returns(Symbol) }
            attr_accessor :type

            sig do
              params(profile_id: String, type: Symbol).returns(T.attached_class)
            end
            def self.new(
              # ID of the browser profile, from `profile.id` in an earlier scrape response.
              profile_id:,
              # Reuse a saved browser profile.
              type: :existing
            )
            end

            sig { override.returns({ profile_id: String, type: Symbol }) }
            def to_hash
            end
          end

          class New < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::WebScrapeParams::SharedParams::Profile::New,
                  ContextDev::Internal::AnyHash
                )
              end

            # Username or email address for the website.
            sig { returns(String) }
            attr_accessor :identifier

            # Sign in and save a new browser profile.
            sig { returns(Symbol) }
            attr_accessor :type

            # Label for the profile, shown by `GET /org/browser/profiles`.
            sig { returns(T.nilable(String)) }
            attr_reader :description

            sig { params(description: String).void }
            attr_writer :description

            # Password for the website. Used to sign in and never stored.
            sig { returns(String) }
            attr_accessor :password

            sig do
              params(
                identifier: String,
                password: String,
                description: String,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Username or email address for the website.
              identifier:,
              # Password for the website. Used to sign in and never stored.
              password:,
              # Label for the profile, shown by `GET /org/browser/profiles`.
              description: nil,
              # Sign in and save a new browser profile.
              type: :new
            )
            end

            sig do
              override.returns(
                {
                  identifier: String,
                  password: String,
                  type: Symbol,
                  description: String
                }
              )
            end
            def to_hash
            end
          end

          sig do
            override.returns(
              T::Array[
                ContextDev::WebScrapeParams::SharedParams::Profile::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # Emulate a light or dark color scheme.
        module Theme
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::WebScrapeParams::SharedParams::Theme)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LIGHT =
            T.let(
              :light,
              ContextDev::WebScrapeParams::SharedParams::Theme::TaggedSymbol
            )
          DARK =
            T.let(
              :dark,
              ContextDev::WebScrapeParams::SharedParams::Theme::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebScrapeParams::SharedParams::Theme::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Viewport < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::WebScrapeParams::SharedParams::Viewport,
                ContextDev::Internal::AnyHash
              )
            end

          # Browser viewport height in pixels.
          sig { returns(T.nilable(Integer)) }
          attr_reader :height

          sig { params(height: Integer).void }
          attr_writer :height

          # Browser viewport width in pixels.
          sig { returns(T.nilable(Integer)) }
          attr_reader :width

          sig { params(width: Integer).void }
          attr_writer :width

          # Browser viewport in pixels. Defaults to 1920 × 1080. If you pass `viewport`, a
          # missing `width` defaults to 1440 and a missing `height` to 900.
          sig do
            params(height: Integer, width: Integer).returns(T.attached_class)
          end
          def self.new(
            # Browser viewport height in pixels.
            height: nil,
            # Browser viewport width in pixels.
            width: nil
          )
          end

          sig { override.returns({ height: Integer, width: Integer }) }
          def to_hash
          end
        end

        # Time to wait after actions, in milliseconds, or a CSS selector to wait for.
        # Defaults to 500 ms, or 2000 ms when `includeFrames` is `true` or the URL ends in
        # `.xml`.
        module WaitFor
          extend ContextDev::Internal::Type::Union

          Variants = T.type_alias { T.any(Integer, String) }

          sig do
            override.returns(
              T::Array[
                ContextDev::WebScrapeParams::SharedParams::WaitFor::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebScrapeParams::TimeoutOpts,
              ContextDev::Internal::AnyHash
            )
          end

        # Deadline in milliseconds.
        sig { returns(Integer) }
        attr_accessor :milliseconds

        # `fail` returns 408 at the deadline. `return-partial` returns the results
        # collected so far and marks the response as partial. `return-partial` requires at
        # least 5000 ms. On `POST /web/scrape`, an output that is not ready in time fails
        # with `REQUEST_TIMEOUT` inside a 200 response under either behavior; 408 means
        # the whole request could not respond by the deadline.
        sig do
          returns(
            T.nilable(
              ContextDev::WebScrapeParams::TimeoutOpts::Behavior::OrSymbol
            )
          )
        end
        attr_reader :behavior

        sig do
          params(
            behavior:
              ContextDev::WebScrapeParams::TimeoutOpts::Behavior::OrSymbol
          ).void
        end
        attr_writer :behavior

        # Request deadline and what to return when it passes.
        sig do
          params(
            milliseconds: Integer,
            behavior:
              ContextDev::WebScrapeParams::TimeoutOpts::Behavior::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Deadline in milliseconds.
          milliseconds:,
          # `fail` returns 408 at the deadline. `return-partial` returns the results
          # collected so far and marks the response as partial. `return-partial` requires at
          # least 5000 ms. On `POST /web/scrape`, an output that is not ready in time fails
          # with `REQUEST_TIMEOUT` inside a 200 response under either behavior; 408 means
          # the whole request could not respond by the deadline.
          behavior: nil
        )
        end

        sig do
          override.returns(
            {
              milliseconds: Integer,
              behavior:
                ContextDev::WebScrapeParams::TimeoutOpts::Behavior::OrSymbol
            }
          )
        end
        def to_hash
        end

        # `fail` returns 408 at the deadline. `return-partial` returns the results
        # collected so far and marks the response as partial. `return-partial` requires at
        # least 5000 ms. On `POST /web/scrape`, an output that is not ready in time fails
        # with `REQUEST_TIMEOUT` inside a 200 response under either behavior; 408 means
        # the whole request could not respond by the deadline.
        module Behavior
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::WebScrapeParams::TimeoutOpts::Behavior)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAIL =
            T.let(
              :fail,
              ContextDev::WebScrapeParams::TimeoutOpts::Behavior::TaggedSymbol
            )
          RETURN_PARTIAL =
            T.let(
              :"return-partial",
              ContextDev::WebScrapeParams::TimeoutOpts::Behavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebScrapeParams::TimeoutOpts::Behavior::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::WebScrapeParams::Zdr) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(:enabled, ContextDev::WebScrapeParams::Zdr::TaggedSymbol)
        DISABLED =
          T.let(:disabled, ContextDev::WebScrapeParams::Zdr::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::WebScrapeParams::Zdr::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
