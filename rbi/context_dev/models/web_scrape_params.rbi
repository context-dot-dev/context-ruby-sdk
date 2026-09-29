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

      # Requires `formats.highlights: true`; required when it is set.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::HighlightsParams)) }
      attr_reader :highlights_params

      sig do
        params(
          highlights_params:
            ContextDev::WebScrapeParams::HighlightsParams::OrHash
        ).void
      end
      attr_writer :highlights_params

      # Image options. Requires formats.images: true.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::ImageParams)) }
      attr_reader :image_params

      sig do
        params(
          image_params: ContextDev::WebScrapeParams::ImageParams::OrHash
        ).void
      end
      attr_writer :image_params

      # Requires `formats.json: true`; required when it is set.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::JsonParams)) }
      attr_reader :json_params

      sig do
        params(
          json_params: ContextDev::WebScrapeParams::JsonParams::OrHash
        ).void
      end
      attr_writer :json_params

      # Markdown options. Requires `formats.markdown`.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::MarkdownParams)) }
      attr_reader :markdown_params

      sig do
        params(
          markdown_params: ContextDev::WebScrapeParams::MarkdownParams::OrHash
        ).void
      end
      attr_writer :markdown_params

      # Maximum age of a cached output, in milliseconds. `0` fetches fresh. Defaults to
      # 3 days (259200000 ms). Maximum: 1 year (31536000000 ms).
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_age_ms

      sig { params(max_age_ms: Integer).void }
      attr_writer :max_age_ms

      # Requires `formats.parse: true`; required when it is set.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::ParseParams)) }
      attr_reader :parse_params

      sig do
        params(
          parse_params: ContextDev::WebScrapeParams::ParseParams::OrHash
        ).void
      end
      attr_writer :parse_params

      # Product options. Requires formats.product: true.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::ProductParams)) }
      attr_reader :product_params

      sig do
        params(
          product_params: ContextDev::WebScrapeParams::ProductParams::OrHash
        ).void
      end
      attr_writer :product_params

      # Screenshot options. Requires formats.screenshot: true.
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

      # Labels for tracking request usage. Not retained when zdr is enabled.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Deadline for the whole request. Defaults to 90000 ms with `fail`. Fixed waits
      # must end before it.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::TimeoutOpts)) }
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts: ContextDev::WebScrapeParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      # `enabled` turns on zero data retention. Your organization must have ZDR enabled.
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
          parse_params: ContextDev::WebScrapeParams::ParseParams::OrHash,
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
        # Requires `formats.highlights: true`; required when it is set.
        highlights_params: nil,
        # Image options. Requires formats.images: true.
        image_params: nil,
        # Requires `formats.json: true`; required when it is set.
        json_params: nil,
        # Markdown options. Requires `formats.markdown`.
        markdown_params: nil,
        # Maximum age of a cached output, in milliseconds. `0` fetches fresh. Defaults to
        # 3 days (259200000 ms). Maximum: 1 year (31536000000 ms).
        max_age_ms: nil,
        # Requires `formats.parse: true`; required when it is set.
        parse_params: nil,
        # Product options. Requires formats.product: true.
        product_params: nil,
        # Screenshot options. Requires formats.screenshot: true.
        screenshot_params: nil,
        # Browser and content settings shared by all outputs.
        shared_params: nil,
        # Labels for tracking request usage. Not retained when zdr is enabled.
        tags: nil,
        # Deadline for the whole request. Defaults to 90000 ms with `fail`. Fixed waits
        # must end before it.
        timeout_opts: nil,
        # `enabled` turns on zero data retention. Your organization must have ZDR enabled.
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
            parse_params: ContextDev::WebScrapeParams::ParseParams,
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

        # The original HTTP response body.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :bytes

        sig { params(bytes: T::Boolean).void }
        attr_writer :bytes

        # Markdown excerpts relevant to `highlightsParams.query`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :highlights

        sig { params(highlights: T::Boolean).void }
        attr_writer :highlights

        # Rendered HTML.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :html

        sig { params(html: T::Boolean).void }
        attr_writer :html

        # Images found on the page.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :images

        sig { params(images: T::Boolean).void }
        attr_writer :images

        # An object matching `jsonParams.schema`, extracted from the page.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :json

        sig { params(json: T::Boolean).void }
        attr_writer :json

        # Page content as Markdown.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :markdown

        sig { params(markdown: T::Boolean).void }
        attr_writer :markdown

        # Fields extracted with `parseParams.rules`, returned as `parsed`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :parse

        sig { params(parse: T::Boolean).void }
        attr_writer :parse

        # Product details such as name, price, and availability.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :product

        sig { params(product: T::Boolean).void }
        attr_writer :product

        # A screenshot of the page.
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
          # The original HTTP response body.
          bytes: nil,
          # Markdown excerpts relevant to `highlightsParams.query`.
          highlights: nil,
          # Rendered HTML.
          html: nil,
          # Images found on the page.
          images: nil,
          # An object matching `jsonParams.schema`, extracted from the page.
          json: nil,
          # Page content as Markdown.
          markdown: nil,
          # Fields extracted with `parseParams.rules`, returned as `parsed`.
          parse: nil,
          # Product details such as name, price, and availability.
          product: nil,
          # A screenshot of the page.
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

        # The question or topic to find passages for.
        sig { returns(String) }
        attr_accessor :query

        # Maximum combined length of returned passages.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_characters

        sig { params(max_characters: Integer).void }
        attr_writer :max_characters

        # Requires `formats.highlights: true`; required when it is set.
        sig do
          params(query: String, max_characters: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # The question or topic to find passages for.
          query:,
          # Maximum combined length of returned passages.
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

        # Set `visual` to drop visual duplicates, keeping the largest copy.
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

        # Extra data per image: `dimensions`, `classification`, or a hosted `file` URL.
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

        # Image options. Requires formats.images: true.
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
          # Set `visual` to drop visual duplicates, keeping the largest copy.
          dedupe: nil,
          # Extra data per image: `dimensions`, `classification`, or a hosted `file` URL.
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

        # Set `visual` to drop visual duplicates, keeping the largest copy.
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

        # JSON Schema (not an example object) for a top-level object, up to 50 KB. Use
        # optional or nullable fields for missing facts.
        sig { returns(T::Hash[Symbol, T.anything]) }
        attr_accessor :schema

        # Extra guidance, such as which facts to prefer or how to read a field.
        sig { returns(T.nilable(String)) }
        attr_reader :instructions

        sig { params(instructions: String).void }
        attr_writer :instructions

        # Requires `formats.json: true`; required when it is set.
        sig do
          params(
            schema: T::Hash[Symbol, T.anything],
            instructions: String
          ).returns(T.attached_class)
        end
        def self.new(
          # JSON Schema (not an example object) for a top-level object, up to 50 KB. Use
          # optional or nullable fields for missing facts.
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

        # Include images in the Markdown using image syntax with URLs and alt text.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_images

        sig { params(include_images: T::Boolean).void }
        attr_writer :include_images

        # Keep link URLs in the Markdown. Set false to return link text without URLs.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_links

        sig { params(include_links: T::Boolean).void }
        attr_writer :include_links

        # How base64 images appear: `placeholder` (default) or `preserve`. Requires
        # `includeImages`.
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

        # Markdown options. Requires `formats.markdown`.
        sig do
          params(
            include_images: T::Boolean,
            include_links: T::Boolean,
            inline_images:
              ContextDev::WebScrapeParams::MarkdownParams::InlineImages::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Include images in the Markdown using image syntax with URLs and alt text.
          include_images: nil,
          # Keep link URLs in the Markdown. Set false to return link text without URLs.
          include_links: nil,
          # How base64 images appear: `placeholder` (default) or `preserve`. Requires
          # `includeImages`.
          inline_images: nil
        )
        end

        sig do
          override.returns(
            {
              include_images: T::Boolean,
              include_links: T::Boolean,
              inline_images:
                ContextDev::WebScrapeParams::MarkdownParams::InlineImages::OrSymbol
            }
          )
        end
        def to_hash
        end

        # How base64 images appear: `placeholder` (default) or `preserve`. Requires
        # `includeImages`.
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
      end

      class ParseParams < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebScrapeParams::ParseParams,
              ContextDev::Internal::AnyHash
            )
          end

        # Field names mapped to CSS selectors (`h1`, `a@href`) or rule objects. Max 100
        # fields, 5 levels.
        sig do
          returns(
            T::Hash[
              Symbol,
              T.any(
                String,
                ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1
              )
            ]
          )
        end
        attr_accessor :rules

        # Requires `formats.parse: true`; required when it is set.
        sig do
          params(
            rules:
              T::Hash[
                Symbol,
                T.any(
                  String,
                  ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::OrHash
                )
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Field names mapped to CSS selectors (`h1`, `a@href`) or rule objects. Max 100
          # fields, 5 levels.
          rules:
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
                    ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1
                  )
                ]
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
                ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1
              )
            end

          class UnionMember1 < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1,
                  ContextDev::Internal::AnyHash
                )
              end

            # CSS selector to match within the current page or parent rule.
            sig { returns(String) }
            attr_accessor :selector

            # Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
            # to text.
            sig do
              returns(
                T.nilable(
                  T.any(
                    ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Output::OrSymbol,
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
                    ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Output::OrSymbol,
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
                  ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Type::OrSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Type::OrSymbol
              ).void
            end
            attr_writer :type

            sig do
              params(
                selector: String,
                output:
                  T.any(
                    ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Output::OrSymbol,
                    String,
                    T.anything
                  ),
                type:
                  ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # CSS selector to match within the current page or parent rule.
              selector:,
              # Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
              # to text.
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
                      ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Output::OrSymbol,
                      String,
                      T.anything
                    ),
                  type:
                    ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Type::OrSymbol
                }
              )
            end
            def to_hash
            end

            # Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
            # to text.
            module Output
              extend ContextDev::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Output::TaggedSymbol,
                    String,
                    T.anything
                  )
                end

              sig do
                override.returns(
                  T::Array[
                    ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Output::Variants
                  ]
                )
              end
              def self.variants
              end

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Output
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              TEXT =
                T.let(
                  :text,
                  ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Output::TaggedSymbol
                )
              HTML =
                T.let(
                  :html,
                  ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Output::TaggedSymbol
                )
            end

            # Return the first match with `item` or all matches with `list`.
            module Type
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ITEM =
                T.let(
                  :item,
                  ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Type::TaggedSymbol
                )
              LIST =
                T.let(
                  :list,
                  ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::WebScrapeParams::ParseParams::Rule::UnionMember1::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          sig do
            override.returns(
              T::Array[ContextDev::WebScrapeParams::ParseParams::Rule::Variants]
            )
          end
          def self.variants
          end
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

        # Use an AI model when the page has no structured product data.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :use_ai_fallback

        sig { params(use_ai_fallback: T::Boolean).void }
        attr_writer :use_ai_fallback

        # Product options. Requires formats.product: true.
        sig { params(use_ai_fallback: T::Boolean).returns(T.attached_class) }
        def self.new(
          # Use an AI model when the page has no structured product data.
          use_ai_fallback: nil
        )
        end

        sig { override.returns({ use_ai_fallback: T::Boolean }) }
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

        # What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40
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

        # Screenshot options. Requires formats.screenshot: true.
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
          # What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40
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

        # What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40
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

            # Pixels from the document origin.
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

        # Browser steps run in order before capture. Requires a paid plan. Skips the
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

        # Proxy country as a two-letter code, such as `US`. Case-insensitive.
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

        # Include iframe content in HTML and text outputs. Screenshots always show visible
        # frames.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_frames

        sig { params(include_frames: T::Boolean).void }
        attr_writer :include_frames

        # Keep only elements matching these CSS selectors.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :include_selectors

        sig { params(include_selectors: T::Array[String]).void }
        attr_writer :include_selectors

        # Keep only the main content. Doesn't affect `screenshot`, `bytes`, or `product`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :main_content_only

        sig { params(main_content_only: T::Boolean).void }
        attr_writer :main_content_only

        # Document parsing options.
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

        # Wait for CSS animations to finish before capture. Defaults to `true` when
        # `screenshot` is requested.
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

        # Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
        # default to 1440 × 900.
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

        # Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500
        # (2000 with frames or XML).
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
            include_frames: T::Boolean,
            include_selectors: T::Array[String],
            main_content_only: T::Boolean,
            parsers: ContextDev::WebScrapeParams::SharedParams::Parsers::OrHash,
            settle_animations: T::Boolean,
            theme: ContextDev::WebScrapeParams::SharedParams::Theme::OrSymbol,
            viewport:
              ContextDev::WebScrapeParams::SharedParams::Viewport::OrHash,
            wait_for:
              ContextDev::WebScrapeParams::SharedParams::WaitFor::Variants
          ).returns(T.attached_class)
        end
        def self.new(
          # Browser steps run in order before capture. Requires a paid plan. Skips the
          # cache.
          actions: nil,
          # Proxy country as a two-letter code, such as `US`. Case-insensitive.
          country: nil,
          # Accept cookie banners before actions and capture.
          dismiss_cookies: nil,
          # Close other popups before actions and capture.
          dismiss_popups: nil,
          # Remove elements matching these CSS selectors. Overrides `includeSelectors`.
          exclude_selectors: nil,
          # HTTP headers to send to the target site. Requests with headers skip the cache.
          headers: nil,
          # Include iframe content in HTML and text outputs. Screenshots always show visible
          # frames.
          include_frames: nil,
          # Keep only elements matching these CSS selectors.
          include_selectors: nil,
          # Keep only the main content. Doesn't affect `screenshot`, `bytes`, or `product`.
          main_content_only: nil,
          # Document parsing options.
          parsers: nil,
          # Wait for CSS animations to finish before capture. Defaults to `true` when
          # `screenshot` is requested.
          settle_animations: nil,
          # Emulate a light or dark color scheme.
          theme: nil,
          # Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
          # default to 1440 × 900.
          viewport: nil,
          # Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500
          # (2000 with frames or XML).
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
              include_frames: T::Boolean,
              include_selectors: T::Array[String],
              main_content_only: T::Boolean,
              parsers: ContextDev::WebScrapeParams::SharedParams::Parsers,
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

            # Use `perform` for a plain-language browser instruction.
            sig { returns(Symbol) }
            attr_accessor :type

            sig do
              params(action: String, type: Symbol).returns(T.attached_class)
            end
            def self.new(
              # One browser instruction, such as clicking a button or entering text.
              action:,
              # Use `perform` for a plain-language browser instruction.
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

            # Use `scroll` to move through the page or a container.
            sig { returns(Symbol) }
            attr_accessor :type

            # Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
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

            # Scroll this container. Omit to scroll the page.
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
              # Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
              amount: nil,
              # Direction to scroll.
              direction: nil,
              # Maximum number of scroll steps for this action.
              max_scrolls: nil,
              # Scroll this container. Omit to scroll the page.
              selector: nil,
              # Use `scroll` to move through the page or a container.
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

            # Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
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

            # Time to pause in milliseconds before the next action.
            sig { returns(Integer) }
            attr_accessor :milliseconds

            # Use `wait` to pause for a fixed duration.
            sig { returns(Symbol) }
            attr_accessor :type

            sig do
              params(milliseconds: Integer, type: Symbol).returns(
                T.attached_class
              )
            end
            def self.new(
              # Time to pause in milliseconds before the next action.
              milliseconds:,
              # Use `wait` to pause for a fixed duration.
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

            # Use `waitFor` to wait for a matching element.
            sig { returns(Symbol) }
            attr_accessor :type

            sig do
              params(selector: String, type: Symbol).returns(T.attached_class)
            end
            def self.new(
              # CSS selector to wait for before continuing.
              selector:,
              # Use `waitFor` to wait for a matching element.
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

        class Parsers < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::WebScrapeParams::SharedParams::Parsers,
                ContextDev::Internal::AnyHash
              )
            end

          # PDF page range and OCR.
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

          # Document parsing options.
          sig do
            params(
              pdf:
                ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # PDF page range and OCR.
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

            # Last page to parse. Must be at least `startPage`.
            sig { returns(T.nilable(Integer)) }
            attr_reader :end_page

            sig { params(end_page: Integer).void }
            attr_writer :end_page

            # Set `auto` to read scanned pages with OCR.
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

            # PDF page range and OCR.
            sig do
              params(
                end_page: Integer,
                ocr:
                  ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr::OrSymbol,
                start_page: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              # Last page to parse. Must be at least `startPage`.
              end_page: nil,
              # Set `auto` to read scanned pages with OCR.
              ocr: nil,
              # First page to parse, starting at 1.
              start_page: nil
            )
            end

            sig do
              override.returns(
                {
                  end_page: Integer,
                  ocr:
                    ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr::OrSymbol,
                  start_page: Integer
                }
              )
            end
            def to_hash
            end

            # Set `auto` to read scanned pages with OCR.
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

          # Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
          # default to 1440 × 900.
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

        # Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500
        # (2000 with frames or XML).
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

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
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

        # Deadline for the whole request. Defaults to 90000 ms with `fail`. Fixed waits
        # must end before it.
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
          # "fail" returns 408 at the deadline. "return-partial" returns available results;
          # inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
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

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
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

      # `enabled` turns on zero data retention. Your organization must have ZDR enabled.
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
