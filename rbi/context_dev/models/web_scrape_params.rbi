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

      # Outputs to return. Enable at least one; omitted formats are false.
      sig { returns(ContextDev::WebScrapeParams::Formats) }
      attr_reader :formats

      sig { params(formats: ContextDev::WebScrapeParams::Formats::OrHash).void }
      attr_writer :formats

      # The URL to scrape.
      sig { returns(String) }
      attr_accessor :url

      # Image options. Requires formats.images: true.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::ImageParams)) }
      attr_reader :image_params

      sig do
        params(
          image_params: ContextDev::WebScrapeParams::ImageParams::OrHash
        ).void
      end
      attr_writer :image_params

      # Markdown options. Requires formats.markdown: true.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::MarkdownParams)) }
      attr_reader :markdown_params

      sig do
        params(
          markdown_params: ContextDev::WebScrapeParams::MarkdownParams::OrHash
        ).void
      end
      attr_writer :markdown_params

      # Maximum age of each cached output. Defaults to 1 day; 0 fetches fresh and
      # updates the requested outputs. Compatible outputs are shared with the individual
      # scrape endpoints. Image results with hosted files refresh after 23 hours; other
      # outputs retain their own freshness.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_age_ms

      sig { params(max_age_ms: Integer).void }
      attr_writer :max_age_ms

      # Required when formats.parse is true.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::ParseParams)) }
      attr_reader :parse_params

      sig do
        params(
          parse_params: ContextDev::WebScrapeParams::ParseParams::OrHash
        ).void
      end
      attr_writer :parse_params

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

      # Shared browser and content settings. Content filters leave screenshots and
      # original bytes unchanged.
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

      # Total deadline, including navigation, actions, waiting, and all outputs.
      # Defaults to 60000 milliseconds with behavior fail. Use return-partial to capture
      # the current page state and return captured images if image processing cannot
      # finish before the deadline; these responses set isPartial and are not cached.
      # Every requested format must still be available. Fixed waits must fit before a
      # response reserve of up to 5000 milliseconds (at most one quarter of the timeout)
      # when using return-partial.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::TimeoutOpts)) }
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts: ContextDev::WebScrapeParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      # Zero data retention. Bypasses caches and uploads; excludes request/response
      # content and tags from logs. Must be enabled for your organization.
      sig { returns(T.nilable(ContextDev::WebScrapeParams::Zdr::OrSymbol)) }
      attr_reader :zdr

      sig { params(zdr: ContextDev::WebScrapeParams::Zdr::OrSymbol).void }
      attr_writer :zdr

      sig do
        params(
          formats: ContextDev::WebScrapeParams::Formats::OrHash,
          url: String,
          image_params: ContextDev::WebScrapeParams::ImageParams::OrHash,
          markdown_params: ContextDev::WebScrapeParams::MarkdownParams::OrHash,
          max_age_ms: Integer,
          parse_params: ContextDev::WebScrapeParams::ParseParams::OrHash,
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
        # Outputs to return. Enable at least one; omitted formats are false.
        formats:,
        # The URL to scrape.
        url:,
        # Image options. Requires formats.images: true.
        image_params: nil,
        # Markdown options. Requires formats.markdown: true.
        markdown_params: nil,
        # Maximum age of each cached output. Defaults to 1 day; 0 fetches fresh and
        # updates the requested outputs. Compatible outputs are shared with the individual
        # scrape endpoints. Image results with hosted files refresh after 23 hours; other
        # outputs retain their own freshness.
        max_age_ms: nil,
        # Required when formats.parse is true.
        parse_params: nil,
        # Screenshot options. Requires formats.screenshot: true.
        screenshot_params: nil,
        # Shared browser and content settings. Content filters leave screenshots and
        # original bytes unchanged.
        shared_params: nil,
        # Labels for tracking request usage. Not retained when zdr is enabled.
        tags: nil,
        # Total deadline, including navigation, actions, waiting, and all outputs.
        # Defaults to 60000 milliseconds with behavior fail. Use return-partial to capture
        # the current page state and return captured images if image processing cannot
        # finish before the deadline; these responses set isPartial and are not cached.
        # Every requested format must still be available. Fixed waits must fit before a
        # response reserve of up to 5000 milliseconds (at most one quarter of the timeout)
        # when using return-partial.
        timeout_opts: nil,
        # Zero data retention. Bypasses caches and uploads; excludes request/response
        # content and tags from logs. Must be enabled for your organization.
        zdr: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            formats: ContextDev::WebScrapeParams::Formats,
            url: String,
            image_params: ContextDev::WebScrapeParams::ImageParams,
            markdown_params: ContextDev::WebScrapeParams::MarkdownParams,
            max_age_ms: Integer,
            parse_params: ContextDev::WebScrapeParams::ParseParams,
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

        # Page content as Markdown.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :markdown

        sig { params(markdown: T::Boolean).void }
        attr_writer :markdown

        # Fields selected by parseParams.rules.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :parse

        sig { params(parse: T::Boolean).void }
        attr_writer :parse

        # An inline image of the page.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :screenshot

        sig { params(screenshot: T::Boolean).void }
        attr_writer :screenshot

        # Outputs to return. Enable at least one; omitted formats are false.
        sig do
          params(
            bytes: T::Boolean,
            html: T::Boolean,
            images: T::Boolean,
            markdown: T::Boolean,
            parse: T::Boolean,
            screenshot: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # The original HTTP response body.
          bytes: nil,
          # Rendered HTML.
          html: nil,
          # Images found on the page.
          images: nil,
          # Page content as Markdown.
          markdown: nil,
          # Fields selected by parseParams.rules.
          parse: nil,
          # An inline image of the page.
          screenshot: nil
        )
        end

        sig do
          override.returns(
            {
              bytes: T::Boolean,
              html: T::Boolean,
              images: T::Boolean,
              markdown: T::Boolean,
              parse: T::Boolean,
              screenshot: T::Boolean
            }
          )
        end
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

        # For visual duplicates, keep the largest image.
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

        # Add dimensions, a visual category, or a hosted file URL. Each image has a
        # maximum processing time of 30000 milliseconds, bounded by the remaining request
        # deadline.
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
          # For visual duplicates, keep the largest image.
          dedupe: nil,
          # Add dimensions, a visual category, or a hosted file URL. Each image has a
          # maximum processing time of 30000 milliseconds, bounded by the remaining request
          # deadline.
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

        # For visual duplicates, keep the largest image.
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

      class MarkdownParams < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebScrapeParams::MarkdownParams,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_images

        sig { params(include_images: T::Boolean).void }
        attr_writer :include_images

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_links

        sig { params(include_links: T::Boolean).void }
        attr_writer :include_links

        # Base64 images use placeholders by default. Requires includeImages: true.
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

        # Markdown options. Requires formats.markdown: true.
        sig do
          params(
            include_images: T::Boolean,
            include_links: T::Boolean,
            inline_images:
              ContextDev::WebScrapeParams::MarkdownParams::InlineImages::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          include_images: nil,
          include_links: nil,
          # Base64 images use placeholders by default. Requires includeImages: true.
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

        # Base64 images use placeholders by default. Requires includeImages: true.
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

        # Map field names to CSS selectors or rules. Missing items return null; missing
        # lists return [].
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

        # Required when formats.parse is true.
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
          # Map field names to CSS selectors or rules. Missing items return null; missing
          # lists return [].
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

            sig { returns(String) }
            attr_accessor :selector

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
            def self.new(selector:, output: nil, type: nil)
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

      class ScreenshotParams < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebScrapeParams::ScreenshotParams,
              ContextDev::Internal::AnyHash
            )
          end

        # Viewport, full page, one visible element, or a rectangle. Maximum 40 megapixels.
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
          # Viewport, full page, one visible element, or a rectangle. Maximum 40 megapixels.
          area: nil,
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

        # Viewport, full page, one visible element, or a rectangle. Maximum 40 megapixels.
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

            # Must match one visible element.
            sig { returns(String) }
            attr_accessor :selector

            sig { params(selector: String).returns(T.attached_class) }
            def self.new(
              # Must match one visible element.
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

            sig { returns(Integer) }
            attr_accessor :height

            sig { returns(Integer) }
            attr_accessor :width

            sig { returns(Integer) }
            attr_accessor :x

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
            def self.new(height:, width:, x:, y_:)
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

        # Run in order before capture. A failed action fails the request. Bypasses
        # caching.
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

        # Supported two-letter country code, case-insensitive. Applies to every output,
        # including image downloads.
        sig { returns(T.nilable(String)) }
        attr_reader :country

        sig { params(country: String).void }
        attr_writer :country

        # Dismiss cookie banners by accepting cookies before actions.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :dismiss_cookies

        sig { params(dismiss_cookies: T::Boolean).void }
        attr_writer :dismiss_cookies

        # Dismiss other popups before actions.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :dismiss_popups

        sig { params(dismiss_popups: T::Boolean).void }
        attr_writer :dismiss_popups

        # Remove matching content. Exclusions win.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :exclude_selectors

        sig { params(exclude_selectors: T::Array[String]).void }
        attr_writer :exclude_selectors

        # Headers for the target origin. Requests with custom headers bypass caching.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :headers

        sig { params(headers: T::Hash[Symbol, String]).void }
        attr_writer :headers

        # Include iframe content in extraction. Screenshots show visible frames
        # regardless.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_frames

        sig { params(include_frames: T::Boolean).void }
        attr_writer :include_frames

        # Keep matching content after mainContentOnly.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :include_selectors

        sig { params(include_selectors: T::Array[String]).void }
        attr_writer :include_selectors

        # Keep only main content in HTML, Markdown, images, and parsed fields.
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

        # Settle animations before capture. Defaults to true with screenshots, otherwise
        # false.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :settle_animations

        sig { params(settle_animations: T::Boolean).void }
        attr_writer :settle_animations

        # Override the browser color scheme.
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

        # Browser dimensions in pixels.
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

        # After actions, wait this many milliseconds or until a CSS selector is visible.
        # Defaults to 500 ms, or 2000 ms with frames or an XML URL. Set 0 to skip.
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

        # Shared browser and content settings. Content filters leave screenshots and
        # original bytes unchanged.
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
          # Run in order before capture. A failed action fails the request. Bypasses
          # caching.
          actions: nil,
          # Supported two-letter country code, case-insensitive. Applies to every output,
          # including image downloads.
          country: nil,
          # Dismiss cookie banners by accepting cookies before actions.
          dismiss_cookies: nil,
          # Dismiss other popups before actions.
          dismiss_popups: nil,
          # Remove matching content. Exclusions win.
          exclude_selectors: nil,
          # Headers for the target origin. Requests with custom headers bypass caching.
          headers: nil,
          # Include iframe content in extraction. Screenshots show visible frames
          # regardless.
          include_frames: nil,
          # Keep matching content after mainContentOnly.
          include_selectors: nil,
          # Keep only main content in HTML, Markdown, images, and parsed fields.
          main_content_only: nil,
          # Document parsing options.
          parsers: nil,
          # Settle animations before capture. Defaults to true with screenshots, otherwise
          # false.
          settle_animations: nil,
          # Override the browser color scheme.
          theme: nil,
          # Browser dimensions in pixels.
          viewport: nil,
          # After actions, wait this many milliseconds or until a CSS selector is visible.
          # Defaults to 500 ms, or 2000 ms with frames or an XML URL. Set 0 to skip.
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

            sig { returns(String) }
            attr_accessor :action

            sig { returns(Symbol) }
            attr_accessor :type

            sig do
              params(action: String, type: Symbol).returns(T.attached_class)
            end
            def self.new(action:, type: :perform)
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

            sig { returns(Symbol) }
            attr_accessor :type

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
              amount: nil,
              direction: nil,
              max_scrolls: nil,
              # Scroll this container. Omit to scroll the page.
              selector: nil,
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

            sig { returns(Integer) }
            attr_accessor :milliseconds

            sig { returns(Symbol) }
            attr_accessor :type

            sig do
              params(milliseconds: Integer, type: Symbol).returns(
                T.attached_class
              )
            end
            def self.new(milliseconds:, type: :wait)
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

            sig { returns(String) }
            attr_accessor :selector

            sig { returns(Symbol) }
            attr_accessor :type

            sig do
              params(selector: String, type: Symbol).returns(T.attached_class)
            end
            def self.new(selector:, type: :waitFor)
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

          # PDF text options for HTML, Markdown, and parsed fields.
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
            # PDF text options for HTML, Markdown, and parsed fields.
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

            # Last page to parse. Must be at least startPage.
            sig { returns(T.nilable(Integer)) }
            attr_reader :end_page

            sig { params(end_page: Integer).void }
            attr_writer :end_page

            # Read text from scanned pages.
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

            # PDF text options for HTML, Markdown, and parsed fields.
            sig do
              params(
                end_page: Integer,
                ocr:
                  ContextDev::WebScrapeParams::SharedParams::Parsers::Pdf::Ocr::OrSymbol,
                start_page: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              # Last page to parse. Must be at least startPage.
              end_page: nil,
              # Read text from scanned pages.
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

            # Read text from scanned pages.
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

        # Override the browser color scheme.
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

          sig { returns(T.nilable(Integer)) }
          attr_reader :height

          sig { params(height: Integer).void }
          attr_writer :height

          sig { returns(T.nilable(Integer)) }
          attr_reader :width

          sig { params(width: Integer).void }
          attr_writer :width

          # Browser dimensions in pixels.
          sig do
            params(height: Integer, width: Integer).returns(T.attached_class)
          end
          def self.new(height: nil, width: nil)
          end

          sig { override.returns({ height: Integer, width: Integer }) }
          def to_hash
          end
        end

        # After actions, wait this many milliseconds or until a CSS selector is visible.
        # Defaults to 500 ms, or 2000 ms with frames or an XML URL. Set 0 to skip.
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

        # Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        sig { returns(Integer) }
        attr_accessor :milliseconds

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results. "return-partial" requires milliseconds of at
        # least 5000.
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

        # Total deadline, including navigation, actions, waiting, and all outputs.
        # Defaults to 60000 milliseconds with behavior fail. Use return-partial to capture
        # the current page state and return captured images if image processing cannot
        # finish before the deadline; these responses set isPartial and are not cached.
        # Every requested format must still be available. Fixed waits must fit before a
        # response reserve of up to 5000 milliseconds (at most one quarter of the timeout)
        # when using return-partial.
        sig do
          params(
            milliseconds: Integer,
            behavior:
              ContextDev::WebScrapeParams::TimeoutOpts::Behavior::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Request deadline in milliseconds. Maximum: 300000 (5 minutes).
          milliseconds:,
          # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
          # credits. "return-partial" returns usable results collected so far; if none are
          # available, the request still fails without charging credits. Partial results are
          # not cached as complete results. "return-partial" requires milliseconds of at
          # least 5000.
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

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results. "return-partial" requires milliseconds of at
        # least 5000.
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

      # Zero data retention. Bypasses caches and uploads; excludes request/response
      # content and tags from logs. Must be enabled for your organization.
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
