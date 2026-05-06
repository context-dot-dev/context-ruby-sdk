# typed: strong

module ContextDev
  module Models
    class WebWebScrapeImagesResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebWebScrapeImagesResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Images found on the page.
      sig do
        returns(T::Array[ContextDev::Models::WebWebScrapeImagesResponse::Image])
      end
      attr_accessor :images

      # Always true on success.
      sig do
        returns(
          ContextDev::Models::WebWebScrapeImagesResponse::Success::TaggedBoolean
        )
      end
      attr_accessor :success

      # Page URL that was scraped.
      sig { returns(String) }
      attr_accessor :url

      sig do
        params(
          images:
            T::Array[
              ContextDev::Models::WebWebScrapeImagesResponse::Image::OrHash
            ],
          success:
            ContextDev::Models::WebWebScrapeImagesResponse::Success::OrBoolean,
          url: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Images found on the page.
        images:,
        # Always true on success.
        success:,
        # Page URL that was scraped.
        url:
      )
      end

      sig do
        override.returns(
          {
            images:
              T::Array[ContextDev::Models::WebWebScrapeImagesResponse::Image],
            success:
              ContextDev::Models::WebWebScrapeImagesResponse::Success::TaggedBoolean,
            url: String
          }
        )
      end
      def to_hash
      end

      class Image < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebWebScrapeImagesResponse::Image,
              ContextDev::Internal::AnyHash
            )
          end

        # Image alt text, or null when unavailable.
        sig { returns(T.nilable(String)) }
        attr_accessor :alt

        # Where the image was found.
        sig do
          returns(
            ContextDev::Models::WebWebScrapeImagesResponse::Image::Element::TaggedSymbol
          )
        end
        attr_accessor :element

        # Original image value: URL, inline SVG or HTML, or base64 data URI.
        sig { returns(String) }
        attr_accessor :src

        # Format of src.
        sig do
          returns(
            ContextDev::Models::WebWebScrapeImagesResponse::Image::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Requested metadata for images that could be processed.
        sig do
          returns(
            T.nilable(
              ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment
            )
          )
        end
        attr_reader :enrichment

        sig do
          params(
            enrichment:
              ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::OrHash
          ).void
        end
        attr_writer :enrichment

        sig do
          params(
            alt: T.nilable(String),
            element:
              ContextDev::Models::WebWebScrapeImagesResponse::Image::Element::OrSymbol,
            src: String,
            type:
              ContextDev::Models::WebWebScrapeImagesResponse::Image::Type::OrSymbol,
            enrichment:
              ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Image alt text, or null when unavailable.
          alt:,
          # Where the image was found.
          element:,
          # Original image value: URL, inline SVG or HTML, or base64 data URI.
          src:,
          # Format of src.
          type:,
          # Requested metadata for images that could be processed.
          enrichment: nil
        )
        end

        sig do
          override.returns(
            {
              alt: T.nilable(String),
              element:
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Element::TaggedSymbol,
              src: String,
              type:
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Type::TaggedSymbol,
              enrichment:
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment
            }
          )
        end
        def to_hash
        end

        # Where the image was found.
        module Element
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Element
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IMG =
            T.let(
              :img,
              ContextDev::Models::WebWebScrapeImagesResponse::Image::Element::TaggedSymbol
            )
          SVG =
            T.let(
              :svg,
              ContextDev::Models::WebWebScrapeImagesResponse::Image::Element::TaggedSymbol
            )
          LINK =
            T.let(
              :link,
              ContextDev::Models::WebWebScrapeImagesResponse::Image::Element::TaggedSymbol
            )
          SOURCE =
            T.let(
              :source,
              ContextDev::Models::WebWebScrapeImagesResponse::Image::Element::TaggedSymbol
            )
          VIDEO =
            T.let(
              :video,
              ContextDev::Models::WebWebScrapeImagesResponse::Image::Element::TaggedSymbol
            )
          CSS =
            T.let(
              :css,
              ContextDev::Models::WebWebScrapeImagesResponse::Image::Element::TaggedSymbol
            )
          OBJECT =
            T.let(
              :object,
              ContextDev::Models::WebWebScrapeImagesResponse::Image::Element::TaggedSymbol
            )
          META =
            T.let(
              :meta,
              ContextDev::Models::WebWebScrapeImagesResponse::Image::Element::TaggedSymbol
            )
          BACKGROUND =
            T.let(
              :background,
              ContextDev::Models::WebWebScrapeImagesResponse::Image::Element::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Element::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Format of src.
        module Type
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          URL =
            T.let(
              :url,
              ContextDev::Models::WebWebScrapeImagesResponse::Image::Type::TaggedSymbol
            )
          HTML =
            T.let(
              :html,
              ContextDev::Models::WebWebScrapeImagesResponse::Image::Type::TaggedSymbol
            )
          BASE64 =
            T.let(
              :base64,
              ContextDev::Models::WebWebScrapeImagesResponse::Image::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Enrichment < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment,
                ContextDev::Internal::AnyHash
              )
            end

          # Image height in pixels, when measured.
          sig { returns(T.nilable(Integer)) }
          attr_reader :height

          sig { params(height: Integer).void }
          attr_writer :height

          # Detected MIME type, when hosted.
          sig { returns(T.nilable(String)) }
          attr_reader :mimetype

          sig { params(mimetype: String).void }
          attr_writer :mimetype

          # Visual asset category, when classified.
          sig do
            returns(
              T.nilable(
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type::TaggedSymbol
              )
            )
          end
          attr_reader :type

          sig do
            params(
              type:
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type::OrSymbol
            ).void
          end
          attr_writer :type

          # Brand.dev CDN URL, when hosted.
          sig { returns(T.nilable(String)) }
          attr_reader :url

          sig { params(url: String).void }
          attr_writer :url

          # Image width in pixels, when measured.
          sig { returns(T.nilable(Integer)) }
          attr_reader :width

          sig { params(width: Integer).void }
          attr_writer :width

          # Requested metadata for images that could be processed.
          sig do
            params(
              height: Integer,
              mimetype: String,
              type:
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type::OrSymbol,
              url: String,
              width: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Image height in pixels, when measured.
            height: nil,
            # Detected MIME type, when hosted.
            mimetype: nil,
            # Visual asset category, when classified.
            type: nil,
            # Brand.dev CDN URL, when hosted.
            url: nil,
            # Image width in pixels, when measured.
            width: nil
          )
          end

          sig do
            override.returns(
              {
                height: Integer,
                mimetype: String,
                type:
                  ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type::TaggedSymbol,
                url: String,
                width: Integer
              }
            )
          end
          def to_hash
          end

          # Visual asset category, when classified.
          module Type
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PHOTOGRAPHY =
              T.let(
                :photography,
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type::TaggedSymbol
              )
            ILLUSTRATION =
              T.let(
                :illustration,
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type::TaggedSymbol
              )
            LOGO =
              T.let(
                :logo,
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type::TaggedSymbol
              )
            WORDMARK =
              T.let(
                :wordmark,
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type::TaggedSymbol
              )
            ICON =
              T.let(
                :icon,
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type::TaggedSymbol
              )
            PATTERN =
              T.let(
                :pattern,
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type::TaggedSymbol
              )
            GRAPHIC =
              T.let(
                :graphic,
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type::TaggedSymbol
              )
            OTHER =
              T.let(
                :other,
                ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::WebWebScrapeImagesResponse::Image::Enrichment::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      # Always true on success.
      module Success
        extend ContextDev::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(
              T::Boolean,
              ContextDev::Models::WebWebScrapeImagesResponse::Success
            )
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            ContextDev::Models::WebWebScrapeImagesResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebWebScrapeImagesResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
