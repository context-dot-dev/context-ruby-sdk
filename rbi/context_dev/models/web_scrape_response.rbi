# typed: strong

module ContextDev
  module Models
    class WebScrapeResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebScrapeResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Original HTTP response body. Waiting, actions, and content filters never change
      # it.
      sig { returns(ContextDev::Models::WebScrapeResponse::Bytes) }
      attr_reader :bytes

      sig do
        params(bytes: ContextDev::Models::WebScrapeResponse::Bytes::OrHash).void
      end
      attr_writer :bytes

      # Cache outcome for this response. Composite responses are hits only when every
      # cache-controlled fetch contributing to the output was a hit; age_ms is the
      # oldest contributing hit.
      sig { returns(ContextDev::Models::WebScrapeResponse::CacheMetadata) }
      attr_reader :cache_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebScrapeResponse::CacheMetadata::OrHash
        ).void
      end
      attr_writer :cache_metadata

      # Relevant Markdown excerpts for your question or topic, in page order. Headings
      # in square brackets supply necessary context; ellipses mark omitted portions.
      # Empty when the page has no text.
      sig { returns(ContextDev::Models::WebScrapeResponse::Highlights) }
      attr_reader :highlights

      sig do
        params(
          highlights: ContextDev::Models::WebScrapeResponse::Highlights::OrHash
        ).void
      end
      attr_writer :highlights

      # Rendered HTML after content filters.
      sig { returns(ContextDev::Models::WebScrapeResponse::HTML) }
      attr_reader :html

      sig do
        params(html: ContextDev::Models::WebScrapeResponse::HTML::OrHash).void
      end
      attr_writer :html

      # Images after content filters. Empty when none are found.
      sig { returns(ContextDev::Models::WebScrapeResponse::Images) }
      attr_reader :images

      sig do
        params(
          images: ContextDev::Models::WebScrapeResponse::Images::OrHash
        ).void
      end
      attr_writer :images

      # Page data extracted using your schema.
      sig { returns(ContextDev::Models::WebScrapeResponse::Json) }
      attr_reader :json

      sig do
        params(json: ContextDev::Models::WebScrapeResponse::Json::OrHash).void
      end
      attr_writer :json

      # Markdown after content filters.
      sig { returns(ContextDev::Models::WebScrapeResponse::Markdown) }
      attr_reader :markdown

      sig do
        params(
          markdown: ContextDev::Models::WebScrapeResponse::Markdown::OrHash
        ).void
      end
      attr_writer :markdown

      # Page details, when available.
      sig { returns(ContextDev::Models::WebScrapeResponse::Metadata) }
      attr_reader :metadata

      sig do
        params(
          metadata: ContextDev::Models::WebScrapeResponse::Metadata::OrHash
        ).void
      end
      attr_writer :metadata

      # Fields produced by parseParams.rules, after shared content filters.
      sig { returns(ContextDev::Models::WebScrapeResponse::Parsed) }
      attr_reader :parsed

      sig do
        params(
          parsed: ContextDev::Models::WebScrapeResponse::Parsed::OrHash
        ).void
      end
      attr_writer :parsed

      # Product details found on the page.
      sig { returns(ContextDev::Models::WebScrapeResponse::Product) }
      attr_reader :product

      sig do
        params(
          product: ContextDev::Models::WebScrapeResponse::Product::OrHash
        ).void
      end
      attr_writer :product

      # Unique id of this API call, also sent in the X-Request-Id response header. Quote
      # it when contacting support about a failed request.
      sig { returns(String) }
      attr_accessor :request_id

      # An image data URL. Use directly as an image src.
      sig { returns(ContextDev::Models::WebScrapeResponse::Screenshot) }
      attr_reader :screenshot

      sig do
        params(
          screenshot: ContextDev::Models::WebScrapeResponse::Screenshot::OrHash
        ).void
      end
      attr_writer :screenshot

      # Final URL after redirects and browser actions.
      sig { returns(String) }
      attr_accessor :url

      # Present when a requested output fails, capture returns a page that is still
      # loading, images return before processing finishes, or the optional product AI
      # fallback fails or is cut short. Check each output's success field for its
      # result. Valid captured pieces may be cached independently; failed retrievals and
      # incomplete captures are not cached.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::WebScrapeResponse::IsPartial::TaggedBoolean
          )
        )
      end
      attr_reader :is_partial

      sig do
        params(
          is_partial:
            ContextDev::Models::WebScrapeResponse::IsPartial::OrBoolean
        ).void
      end
      attr_writer :is_partial

      # Credit usage, included whenever a valid API key is provided.
      sig do
        returns(T.nilable(ContextDev::Models::WebScrapeResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::WebScrapeResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          bytes: ContextDev::Models::WebScrapeResponse::Bytes::OrHash,
          cache_metadata:
            ContextDev::Models::WebScrapeResponse::CacheMetadata::OrHash,
          highlights: ContextDev::Models::WebScrapeResponse::Highlights::OrHash,
          html: ContextDev::Models::WebScrapeResponse::HTML::OrHash,
          images: ContextDev::Models::WebScrapeResponse::Images::OrHash,
          json: ContextDev::Models::WebScrapeResponse::Json::OrHash,
          markdown: ContextDev::Models::WebScrapeResponse::Markdown::OrHash,
          metadata: ContextDev::Models::WebScrapeResponse::Metadata::OrHash,
          parsed: ContextDev::Models::WebScrapeResponse::Parsed::OrHash,
          product: ContextDev::Models::WebScrapeResponse::Product::OrHash,
          request_id: String,
          screenshot: ContextDev::Models::WebScrapeResponse::Screenshot::OrHash,
          url: String,
          is_partial:
            ContextDev::Models::WebScrapeResponse::IsPartial::OrBoolean,
          key_metadata:
            ContextDev::Models::WebScrapeResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Original HTTP response body. Waiting, actions, and content filters never change
        # it.
        bytes:,
        # Cache outcome for this response. Composite responses are hits only when every
        # cache-controlled fetch contributing to the output was a hit; age_ms is the
        # oldest contributing hit.
        cache_metadata:,
        # Relevant Markdown excerpts for your question or topic, in page order. Headings
        # in square brackets supply necessary context; ellipses mark omitted portions.
        # Empty when the page has no text.
        highlights:,
        # Rendered HTML after content filters.
        html:,
        # Images after content filters. Empty when none are found.
        images:,
        # Page data extracted using your schema.
        json:,
        # Markdown after content filters.
        markdown:,
        # Page details, when available.
        metadata:,
        # Fields produced by parseParams.rules, after shared content filters.
        parsed:,
        # Product details found on the page.
        product:,
        # Unique id of this API call, also sent in the X-Request-Id response header. Quote
        # it when contacting support about a failed request.
        request_id:,
        # An image data URL. Use directly as an image src.
        screenshot:,
        # Final URL after redirects and browser actions.
        url:,
        # Present when a requested output fails, capture returns a page that is still
        # loading, images return before processing finishes, or the optional product AI
        # fallback fails or is cut short. Check each output's success field for its
        # result. Valid captured pieces may be cached independently; failed retrievals and
        # incomplete captures are not cached.
        is_partial: nil,
        # Credit usage, included whenever a valid API key is provided.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            bytes: ContextDev::Models::WebScrapeResponse::Bytes,
            cache_metadata:
              ContextDev::Models::WebScrapeResponse::CacheMetadata,
            highlights: ContextDev::Models::WebScrapeResponse::Highlights,
            html: ContextDev::Models::WebScrapeResponse::HTML,
            images: ContextDev::Models::WebScrapeResponse::Images,
            json: ContextDev::Models::WebScrapeResponse::Json,
            markdown: ContextDev::Models::WebScrapeResponse::Markdown,
            metadata: ContextDev::Models::WebScrapeResponse::Metadata,
            parsed: ContextDev::Models::WebScrapeResponse::Parsed,
            product: ContextDev::Models::WebScrapeResponse::Product,
            request_id: String,
            screenshot: ContextDev::Models::WebScrapeResponse::Screenshot,
            url: String,
            is_partial:
              ContextDev::Models::WebScrapeResponse::IsPartial::TaggedBoolean,
            key_metadata: ContextDev::Models::WebScrapeResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class Bytes < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebScrapeResponse::Bytes,
              ContextDev::Internal::AnyHash
            )
          end

        sig do
          returns(T.nilable(ContextDev::Models::WebScrapeResponse::Bytes::Data))
        end
        attr_reader :data

        sig do
          params(
            data:
              T.nilable(
                ContextDev::Models::WebScrapeResponse::Bytes::Data::OrHash
              )
          ).void
        end
        attr_writer :data

        sig { returns(T::Boolean) }
        attr_accessor :requested

        # True when retrieved, false when retrieval failed, and null when not requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # Original HTTP response body. Waiting, actions, and content filters never change
        # it.
        sig do
          params(
            data:
              T.nilable(
                ContextDev::Models::WebScrapeResponse::Bytes::Data::OrHash
              ),
            requested: T::Boolean,
            success: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          requested:,
          # True when retrieved, false when retrieval failed, and null when not requested.
          success:
        )
        end

        sig do
          override.returns(
            {
              data:
                T.nilable(ContextDev::Models::WebScrapeResponse::Bytes::Data),
              requested: T::Boolean,
              success: T.nilable(T::Boolean)
            }
          )
        end
        def to_hash
        end

        class Data < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebScrapeResponse::Bytes::Data,
                ContextDev::Internal::AnyHash
              )
            end

          # Original response body as base64, after HTTP decompression. Maximum decoded
          # size: 20 MiB.
          sig { returns(String) }
          attr_accessor :base64

          sig { returns(String) }
          attr_accessor :content_type

          sig do
            params(base64: String, content_type: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # Original response body as base64, after HTTP decompression. Maximum decoded
            # size: 20 MiB.
            base64:,
            content_type:
          )
          end

          sig { override.returns({ base64: String, content_type: String }) }
          def to_hash
          end
        end
      end

      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebScrapeResponse::CacheMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Age of the cached data in milliseconds. Zero for miss and zdr responses.
        sig { returns(Integer) }
        attr_accessor :age_ms

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        sig do
          returns(
            ContextDev::Models::WebScrapeResponse::CacheMetadata::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Cache outcome for this response. Composite responses are hits only when every
        # cache-controlled fetch contributing to the output was a hit; age_ms is the
        # oldest contributing hit.
        sig do
          params(
            age_ms: Integer,
            status:
              ContextDev::Models::WebScrapeResponse::CacheMetadata::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Age of the cached data in milliseconds. Zero for miss and zdr responses.
          age_ms:,
          # Whether the response was served from cache, required fresh work, or honored
          # zero-data-retention cache bypass.
          status:
        )
        end

        sig do
          override.returns(
            {
              age_ms: Integer,
              status:
                ContextDev::Models::WebScrapeResponse::CacheMetadata::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        module Status
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::WebScrapeResponse::CacheMetadata::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HIT =
            T.let(
              :hit,
              ContextDev::Models::WebScrapeResponse::CacheMetadata::Status::TaggedSymbol
            )
          MISS =
            T.let(
              :miss,
              ContextDev::Models::WebScrapeResponse::CacheMetadata::Status::TaggedSymbol
            )
          ZDR =
            T.let(
              :zdr,
              ContextDev::Models::WebScrapeResponse::CacheMetadata::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebScrapeResponse::CacheMetadata::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Highlights < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebScrapeResponse::Highlights,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :data

        sig { returns(T::Boolean) }
        attr_accessor :requested

        # True when retrieved, false when retrieval failed, and null when not requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # Relevant Markdown excerpts for your question or topic, in page order. Headings
        # in square brackets supply necessary context; ellipses mark omitted portions.
        # Empty when the page has no text.
        sig do
          params(
            data: T.nilable(T::Array[String]),
            requested: T::Boolean,
            success: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          requested:,
          # True when retrieved, false when retrieval failed, and null when not requested.
          success:
        )
        end

        sig do
          override.returns(
            {
              data: T.nilable(T::Array[String]),
              requested: T::Boolean,
              success: T.nilable(T::Boolean)
            }
          )
        end
        def to_hash
        end
      end

      class HTML < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebScrapeResponse::HTML,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_accessor :data

        sig { returns(T::Boolean) }
        attr_accessor :requested

        # True when retrieved, false when retrieval failed, and null when not requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # Rendered HTML after content filters.
        sig do
          params(
            data: T.nilable(String),
            requested: T::Boolean,
            success: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          requested:,
          # True when retrieved, false when retrieval failed, and null when not requested.
          success:
        )
        end

        sig do
          override.returns(
            {
              data: T.nilable(String),
              requested: T::Boolean,
              success: T.nilable(T::Boolean)
            }
          )
        end
        def to_hash
        end
      end

      class Images < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebScrapeResponse::Images,
              ContextDev::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              T::Array[ContextDev::Models::WebScrapeResponse::Images::Data]
            )
          )
        end
        attr_accessor :data

        sig { returns(T::Boolean) }
        attr_accessor :requested

        # True when retrieved, false when retrieval failed, and null when not requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # Images after content filters. Empty when none are found.
        sig do
          params(
            data:
              T.nilable(
                T::Array[
                  ContextDev::Models::WebScrapeResponse::Images::Data::OrHash
                ]
              ),
            requested: T::Boolean,
            success: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          requested:,
          # True when retrieved, false when retrieval failed, and null when not requested.
          success:
        )
        end

        sig do
          override.returns(
            {
              data:
                T.nilable(
                  T::Array[ContextDev::Models::WebScrapeResponse::Images::Data]
                ),
              requested: T::Boolean,
              success: T.nilable(T::Boolean)
            }
          )
        end
        def to_hash
        end

        class Data < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebScrapeResponse::Images::Data,
                ContextDev::Internal::AnyHash
              )
            end

          # Alt text, if present.
          sig { returns(T.nilable(String)) }
          attr_accessor :alt

          # Image URL, or a data URI for inline images.
          sig { returns(String) }
          attr_accessor :url

          sig do
            returns(
              T.nilable(
                ContextDev::Models::WebScrapeResponse::Images::Data::Classification::TaggedSymbol
              )
            )
          end
          attr_reader :classification

          sig do
            params(
              classification:
                ContextDev::Models::WebScrapeResponse::Images::Data::Classification::OrSymbol
            ).void
          end
          attr_writer :classification

          # Hosted copy when file enrichment is requested and zdr is disabled. Valid for 24
          # hours from the original capture.
          sig { returns(T.nilable(String)) }
          attr_reader :file_url

          sig { params(file_url: String).void }
          attr_writer :file_url

          sig { returns(T.nilable(Integer)) }
          attr_reader :height

          sig { params(height: Integer).void }
          attr_writer :height

          sig { returns(T.nilable(Integer)) }
          attr_reader :width

          sig { params(width: Integer).void }
          attr_writer :width

          sig do
            params(
              alt: T.nilable(String),
              url: String,
              classification:
                ContextDev::Models::WebScrapeResponse::Images::Data::Classification::OrSymbol,
              file_url: String,
              height: Integer,
              width: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Alt text, if present.
            alt:,
            # Image URL, or a data URI for inline images.
            url:,
            classification: nil,
            # Hosted copy when file enrichment is requested and zdr is disabled. Valid for 24
            # hours from the original capture.
            file_url: nil,
            height: nil,
            width: nil
          )
          end

          sig do
            override.returns(
              {
                alt: T.nilable(String),
                url: String,
                classification:
                  ContextDev::Models::WebScrapeResponse::Images::Data::Classification::TaggedSymbol,
                file_url: String,
                height: Integer,
                width: Integer
              }
            )
          end
          def to_hash
          end

          module Classification
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::Models::WebScrapeResponse::Images::Data::Classification
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PHOTOGRAPHY =
              T.let(
                :photography,
                ContextDev::Models::WebScrapeResponse::Images::Data::Classification::TaggedSymbol
              )
            ILLUSTRATION =
              T.let(
                :illustration,
                ContextDev::Models::WebScrapeResponse::Images::Data::Classification::TaggedSymbol
              )
            LOGO =
              T.let(
                :logo,
                ContextDev::Models::WebScrapeResponse::Images::Data::Classification::TaggedSymbol
              )
            WORDMARK =
              T.let(
                :wordmark,
                ContextDev::Models::WebScrapeResponse::Images::Data::Classification::TaggedSymbol
              )
            ICON =
              T.let(
                :icon,
                ContextDev::Models::WebScrapeResponse::Images::Data::Classification::TaggedSymbol
              )
            PATTERN =
              T.let(
                :pattern,
                ContextDev::Models::WebScrapeResponse::Images::Data::Classification::TaggedSymbol
              )
            GRAPHIC =
              T.let(
                :graphic,
                ContextDev::Models::WebScrapeResponse::Images::Data::Classification::TaggedSymbol
              )
            OTHER =
              T.let(
                :other,
                ContextDev::Models::WebScrapeResponse::Images::Data::Classification::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::WebScrapeResponse::Images::Data::Classification::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      class Json < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebScrapeResponse::Json,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :data

        sig { returns(T::Boolean) }
        attr_accessor :requested

        # True when retrieved, false when retrieval failed, and null when not requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # Page data extracted using your schema.
        sig do
          params(
            data: T.nilable(T::Hash[Symbol, T.anything]),
            requested: T::Boolean,
            success: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          requested:,
          # True when retrieved, false when retrieval failed, and null when not requested.
          success:
        )
        end

        sig do
          override.returns(
            {
              data: T.nilable(T::Hash[Symbol, T.anything]),
              requested: T::Boolean,
              success: T.nilable(T::Boolean)
            }
          )
        end
        def to_hash
        end
      end

      class Markdown < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebScrapeResponse::Markdown,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_accessor :data

        sig { returns(T::Boolean) }
        attr_accessor :requested

        # True when retrieved, false when retrieval failed, and null when not requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # Markdown after content filters.
        sig do
          params(
            data: T.nilable(String),
            requested: T::Boolean,
            success: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          requested:,
          # True when retrieved, false when retrieval failed, and null when not requested.
          success:
        )
        end

        sig do
          override.returns(
            {
              data: T.nilable(String),
              requested: T::Boolean,
              success: T.nilable(T::Boolean)
            }
          )
        end
        def to_hash
        end
      end

      class Metadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebScrapeResponse::Metadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Additional non-social meta tags not promoted to top-level metadata fields.
        sig do
          returns(
            T.nilable(
              T::Hash[
                Symbol,
                ContextDev::Models::WebScrapeResponse::Metadata::AdditionalMeta::Variants
              ]
            )
          )
        end
        attr_reader :additional_meta

        sig do
          params(
            additional_meta:
              T::Hash[
                Symbol,
                ContextDev::Models::WebScrapeResponse::Metadata::AdditionalMeta::Variants
              ]
          ).void
        end
        attr_writer :additional_meta

        # Resolved alternate links from link rel=alternate tags.
        sig do
          returns(
            T.nilable(
              T::Array[
                ContextDev::Models::WebScrapeResponse::Metadata::Alternate
              ]
            )
          )
        end
        attr_reader :alternates

        sig do
          params(
            alternates:
              T::Array[
                ContextDev::Models::WebScrapeResponse::Metadata::Alternate::OrHash
              ]
          ).void
        end
        attr_writer :alternates

        # Author metadata, when present.
        sig { returns(T.nilable(String)) }
        attr_reader :author

        sig { params(author: String).void }
        attr_writer :author

        # Resolved canonical URL, when present.
        sig { returns(T.nilable(String)) }
        attr_reader :canonical_url

        sig { params(canonical_url: String).void }
        attr_writer :canonical_url

        # Best description extracted from standard, Open Graph, or Twitter metadata.
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # Resolved favicon URL, when present.
        sig { returns(T.nilable(String)) }
        attr_reader :favicon

        sig { params(favicon: String).void }
        attr_writer :favicon

        # Page headings (h1–h6) in document order, extracted from the unfiltered document.
        # Capped at the first 500 headings. Omitted when the page has none.
        sig do
          returns(
            T.nilable(
              T::Array[ContextDev::Models::WebScrapeResponse::Metadata::Heading]
            )
          )
        end
        attr_reader :headings

        sig do
          params(
            headings:
              T::Array[
                ContextDev::Models::WebScrapeResponse::Metadata::Heading::OrHash
              ]
          ).void
        end
        attr_writer :headings

        # Primary resolved preview image from Open Graph, Twitter, or image metadata.
        sig { returns(T.nilable(String)) }
        attr_reader :image

        sig { params(image: String).void }
        attr_writer :image

        # JSON-LD structured data blocks parsed from the page.
        sig { returns(T.nilable(T::Array[T::Hash[Symbol, T.anything]])) }
        attr_reader :json_ld

        sig { params(json_ld: T::Array[T::Hash[Symbol, T.anything]]).void }
        attr_writer :json_ld

        # Keywords extracted from the page's keywords meta tag.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :keywords

        sig { params(keywords: T::Array[String]).void }
        attr_writer :keywords

        # Language extracted from html lang or language meta tags.
        sig { returns(T.nilable(String)) }
        attr_reader :language

        sig { params(language: String).void }
        attr_writer :language

        # Modified timestamp/date from page metadata, when present.
        sig { returns(T.nilable(String)) }
        attr_reader :modified_time

        sig { params(modified_time: String).void }
        attr_writer :modified_time

        # Open Graph metadata with the og: prefix removed and keys camel-cased.
        sig do
          returns(
            T.nilable(
              T::Hash[
                Symbol,
                ContextDev::Models::WebScrapeResponse::Metadata::OpenGraph::Variants
              ]
            )
          )
        end
        attr_reader :open_graph

        sig do
          params(
            open_graph:
              T::Hash[
                Symbol,
                ContextDev::Models::WebScrapeResponse::Metadata::OpenGraph::Variants
              ]
          ).void
        end
        attr_writer :open_graph

        # Published timestamp/date from page metadata, when present.
        sig { returns(T.nilable(String)) }
        attr_reader :published_time

        sig { params(published_time: String).void }
        attr_writer :published_time

        # Robots meta directive, when present.
        sig { returns(T.nilable(String)) }
        attr_reader :robots

        sig { params(robots: String).void }
        attr_writer :robots

        # Site or application name from page metadata.
        sig { returns(T.nilable(String)) }
        attr_reader :site_name

        sig { params(site_name: String).void }
        attr_writer :site_name

        # Best title extracted from the page.
        sig { returns(T.nilable(String)) }
        attr_reader :title

        sig { params(title: String).void }
        attr_writer :title

        # Twitter card metadata with the twitter: prefix removed and keys camel-cased.
        sig do
          returns(
            T.nilable(
              T::Hash[
                Symbol,
                ContextDev::Models::WebScrapeResponse::Metadata::Twitter::Variants
              ]
            )
          )
        end
        attr_reader :twitter

        sig do
          params(
            twitter:
              T::Hash[
                Symbol,
                ContextDev::Models::WebScrapeResponse::Metadata::Twitter::Variants
              ]
          ).void
        end
        attr_writer :twitter

        # Page details, when available.
        sig do
          params(
            additional_meta:
              T::Hash[
                Symbol,
                ContextDev::Models::WebScrapeResponse::Metadata::AdditionalMeta::Variants
              ],
            alternates:
              T::Array[
                ContextDev::Models::WebScrapeResponse::Metadata::Alternate::OrHash
              ],
            author: String,
            canonical_url: String,
            description: String,
            favicon: String,
            headings:
              T::Array[
                ContextDev::Models::WebScrapeResponse::Metadata::Heading::OrHash
              ],
            image: String,
            json_ld: T::Array[T::Hash[Symbol, T.anything]],
            keywords: T::Array[String],
            language: String,
            modified_time: String,
            open_graph:
              T::Hash[
                Symbol,
                ContextDev::Models::WebScrapeResponse::Metadata::OpenGraph::Variants
              ],
            published_time: String,
            robots: String,
            site_name: String,
            title: String,
            twitter:
              T::Hash[
                Symbol,
                ContextDev::Models::WebScrapeResponse::Metadata::Twitter::Variants
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Additional non-social meta tags not promoted to top-level metadata fields.
          additional_meta: nil,
          # Resolved alternate links from link rel=alternate tags.
          alternates: nil,
          # Author metadata, when present.
          author: nil,
          # Resolved canonical URL, when present.
          canonical_url: nil,
          # Best description extracted from standard, Open Graph, or Twitter metadata.
          description: nil,
          # Resolved favicon URL, when present.
          favicon: nil,
          # Page headings (h1–h6) in document order, extracted from the unfiltered document.
          # Capped at the first 500 headings. Omitted when the page has none.
          headings: nil,
          # Primary resolved preview image from Open Graph, Twitter, or image metadata.
          image: nil,
          # JSON-LD structured data blocks parsed from the page.
          json_ld: nil,
          # Keywords extracted from the page's keywords meta tag.
          keywords: nil,
          # Language extracted from html lang or language meta tags.
          language: nil,
          # Modified timestamp/date from page metadata, when present.
          modified_time: nil,
          # Open Graph metadata with the og: prefix removed and keys camel-cased.
          open_graph: nil,
          # Published timestamp/date from page metadata, when present.
          published_time: nil,
          # Robots meta directive, when present.
          robots: nil,
          # Site or application name from page metadata.
          site_name: nil,
          # Best title extracted from the page.
          title: nil,
          # Twitter card metadata with the twitter: prefix removed and keys camel-cased.
          twitter: nil
        )
        end

        sig do
          override.returns(
            {
              additional_meta:
                T::Hash[
                  Symbol,
                  ContextDev::Models::WebScrapeResponse::Metadata::AdditionalMeta::Variants
                ],
              alternates:
                T::Array[
                  ContextDev::Models::WebScrapeResponse::Metadata::Alternate
                ],
              author: String,
              canonical_url: String,
              description: String,
              favicon: String,
              headings:
                T::Array[
                  ContextDev::Models::WebScrapeResponse::Metadata::Heading
                ],
              image: String,
              json_ld: T::Array[T::Hash[Symbol, T.anything]],
              keywords: T::Array[String],
              language: String,
              modified_time: String,
              open_graph:
                T::Hash[
                  Symbol,
                  ContextDev::Models::WebScrapeResponse::Metadata::OpenGraph::Variants
                ],
              published_time: String,
              robots: String,
              site_name: String,
              title: String,
              twitter:
                T::Hash[
                  Symbol,
                  ContextDev::Models::WebScrapeResponse::Metadata::Twitter::Variants
                ]
            }
          )
        end
        def to_hash
        end

        module AdditionalMeta
          extend ContextDev::Internal::Type::Union

          Variants = T.type_alias { T.any(String, T::Array[String]) }

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebScrapeResponse::Metadata::AdditionalMeta::Variants
              ]
            )
          end
          def self.variants
          end

          StringArray =
            T.let(
              ContextDev::Internal::Type::ArrayOf[String],
              ContextDev::Internal::Type::Converter
            )
        end

        class Alternate < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebScrapeResponse::Metadata::Alternate,
                ContextDev::Internal::AnyHash
              )
            end

          # Resolved alternate URL.
          sig { returns(String) }
          attr_accessor :href

          # Language or locale for the alternate URL, when present.
          sig { returns(T.nilable(String)) }
          attr_reader :hreflang

          sig { params(hreflang: String).void }
          attr_writer :hreflang

          # Alternate resource title, when present.
          sig { returns(T.nilable(String)) }
          attr_reader :title

          sig { params(title: String).void }
          attr_writer :title

          # Alternate resource MIME type, when present.
          sig { returns(T.nilable(String)) }
          attr_reader :type

          sig { params(type: String).void }
          attr_writer :type

          sig do
            params(
              href: String,
              hreflang: String,
              title: String,
              type: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Resolved alternate URL.
            href:,
            # Language or locale for the alternate URL, when present.
            hreflang: nil,
            # Alternate resource title, when present.
            title: nil,
            # Alternate resource MIME type, when present.
            type: nil
          )
          end

          sig do
            override.returns(
              { href: String, hreflang: String, title: String, type: String }
            )
          end
          def to_hash
          end
        end

        class Heading < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebScrapeResponse::Metadata::Heading,
                ContextDev::Internal::AnyHash
              )
            end

          # Heading level, 1–6 (from h1–h6).
          sig { returns(Integer) }
          attr_accessor :level

          # Heading text with whitespace collapsed, truncated to 1000 characters.
          sig { returns(String) }
          attr_accessor :text

          sig { params(level: Integer, text: String).returns(T.attached_class) }
          def self.new(
            # Heading level, 1–6 (from h1–h6).
            level:,
            # Heading text with whitespace collapsed, truncated to 1000 characters.
            text:
          )
          end

          sig { override.returns({ level: Integer, text: String }) }
          def to_hash
          end
        end

        module OpenGraph
          extend ContextDev::Internal::Type::Union

          Variants = T.type_alias { T.any(String, T::Array[String]) }

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebScrapeResponse::Metadata::OpenGraph::Variants
              ]
            )
          end
          def self.variants
          end

          StringArray =
            T.let(
              ContextDev::Internal::Type::ArrayOf[String],
              ContextDev::Internal::Type::Converter
            )
        end

        module Twitter
          extend ContextDev::Internal::Type::Union

          Variants = T.type_alias { T.any(String, T::Array[String]) }

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebScrapeResponse::Metadata::Twitter::Variants
              ]
            )
          end
          def self.variants
          end

          StringArray =
            T.let(
              ContextDev::Internal::Type::ArrayOf[String],
              ContextDev::Internal::Type::Converter
            )
        end
      end

      class Parsed < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebScrapeResponse::Parsed,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :data

        sig { returns(T::Boolean) }
        attr_accessor :requested

        # True when retrieved, false when retrieval failed, and null when not requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # Fields produced by parseParams.rules, after shared content filters.
        sig do
          params(
            data: T.nilable(T::Hash[Symbol, T.anything]),
            requested: T::Boolean,
            success: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          requested:,
          # True when retrieved, false when retrieval failed, and null when not requested.
          success:
        )
        end

        sig do
          override.returns(
            {
              data: T.nilable(T::Hash[Symbol, T.anything]),
              requested: T::Boolean,
              success: T.nilable(T::Boolean)
            }
          )
        end
        def to_hash
        end
      end

      class Product < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebScrapeResponse::Product,
              ContextDev::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(ContextDev::Models::WebScrapeResponse::Product::Data)
          )
        end
        attr_reader :data

        sig do
          params(
            data:
              T.nilable(
                ContextDev::Models::WebScrapeResponse::Product::Data::OrHash
              )
          ).void
        end
        attr_writer :data

        sig { returns(T::Boolean) }
        attr_accessor :requested

        # True when retrieved, false when retrieval failed, and null when not requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # Product details found on the page.
        sig do
          params(
            data:
              T.nilable(
                ContextDev::Models::WebScrapeResponse::Product::Data::OrHash
              ),
            requested: T::Boolean,
            success: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          requested:,
          # True when retrieved, false when retrieval failed, and null when not requested.
          success:
        )
        end

        sig do
          override.returns(
            {
              data:
                T.nilable(ContextDev::Models::WebScrapeResponse::Product::Data),
              requested: T::Boolean,
              success: T.nilable(T::Boolean)
            }
          )
        end
        def to_hash
        end

        class Data < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebScrapeResponse::Product::Data,
                ContextDev::Internal::AnyHash
              )
            end

          # Whether the page is a product detail page.
          sig { returns(T::Boolean) }
          attr_accessor :is_product_page

          # The extracted product, or null when the page is not a product detail page.
          sig do
            returns(
              T.nilable(
                ContextDev::Models::WebScrapeResponse::Product::Data::Product
              )
            )
          end
          attr_reader :product

          sig do
            params(
              product:
                T.nilable(
                  ContextDev::Models::WebScrapeResponse::Product::Data::Product::OrHash
                )
            ).void
          end
          attr_writer :product

          sig do
            params(
              is_product_page: T::Boolean,
              product:
                T.nilable(
                  ContextDev::Models::WebScrapeResponse::Product::Data::Product::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether the page is a product detail page.
            is_product_page:,
            # The extracted product, or null when the page is not a product detail page.
            product:
          )
          end

          sig do
            override.returns(
              {
                is_product_page: T::Boolean,
                product:
                  T.nilable(
                    ContextDev::Models::WebScrapeResponse::Product::Data::Product
                  )
              }
            )
          end
          def to_hash
          end

          class Product < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::WebScrapeResponse::Product::Data::Product,
                  ContextDev::Internal::AnyHash
                )
              end

            # Stock or ordering availability.
            sig do
              returns(
                T.nilable(
                  ContextDev::Models::WebScrapeResponse::Product::Data::Product::Availability::TaggedSymbol
                )
              )
            end
            attr_accessor :availability

            # Brand or vendor.
            sig { returns(T.nilable(String)) }
            attr_accessor :brand

            # Product category.
            sig { returns(T.nilable(String)) }
            attr_accessor :category

            # ISO 4217 currency code.
            sig { returns(T.nilable(String)) }
            attr_accessor :currency

            # Product description.
            sig { returns(T.nilable(String)) }
            attr_accessor :description

            # Product dimensions as shown on the page.
            sig { returns(T::Array[String]) }
            attr_accessor :dimensions

            # Key features and specifications.
            sig { returns(T::Array[String]) }
            attr_accessor :features

            # Product image URLs, main image first.
            sig { returns(T::Array[String]) }
            attr_accessor :images

            # Main product image URL.
            sig { returns(T.nilable(String)) }
            attr_accessor :image_url

            # Product name.
            sig { returns(String) }
            attr_accessor :name

            # Current price.
            sig { returns(T.nilable(Float)) }
            attr_accessor :price

            # List price before any discount.
            sig { returns(T.nilable(Float)) }
            attr_accessor :regular_price

            # Product identifier such as a SKU or model number.
            sig { returns(T.nilable(String)) }
            attr_accessor :sku

            # Product tags.
            sig { returns(T::Array[String]) }
            attr_accessor :tags

            # Intended audience.
            sig { returns(T::Array[String]) }
            attr_accessor :target_audience

            # Product variations, such as different colors or sizes, with their attributes and
            # images. Empty if none are found. May not include every variation offered by the
            # store.
            sig do
              returns(
                T::Array[
                  ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant
                ]
              )
            end
            attr_accessor :variants

            # The extracted product, or null when the page is not a product detail page.
            sig do
              params(
                availability:
                  T.nilable(
                    ContextDev::Models::WebScrapeResponse::Product::Data::Product::Availability::OrSymbol
                  ),
                brand: T.nilable(String),
                category: T.nilable(String),
                currency: T.nilable(String),
                description: T.nilable(String),
                dimensions: T::Array[String],
                features: T::Array[String],
                images: T::Array[String],
                image_url: T.nilable(String),
                name: String,
                price: T.nilable(Float),
                regular_price: T.nilable(Float),
                sku: T.nilable(String),
                tags: T::Array[String],
                target_audience: T::Array[String],
                variants:
                  T::Array[
                    ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant::OrHash
                  ]
              ).returns(T.attached_class)
            end
            def self.new(
              # Stock or ordering availability.
              availability:,
              # Brand or vendor.
              brand:,
              # Product category.
              category:,
              # ISO 4217 currency code.
              currency:,
              # Product description.
              description:,
              # Product dimensions as shown on the page.
              dimensions:,
              # Key features and specifications.
              features:,
              # Product image URLs, main image first.
              images:,
              # Main product image URL.
              image_url:,
              # Product name.
              name:,
              # Current price.
              price:,
              # List price before any discount.
              regular_price:,
              # Product identifier such as a SKU or model number.
              sku:,
              # Product tags.
              tags:,
              # Intended audience.
              target_audience:,
              # Product variations, such as different colors or sizes, with their attributes and
              # images. Empty if none are found. May not include every variation offered by the
              # store.
              variants:
            )
            end

            sig do
              override.returns(
                {
                  availability:
                    T.nilable(
                      ContextDev::Models::WebScrapeResponse::Product::Data::Product::Availability::TaggedSymbol
                    ),
                  brand: T.nilable(String),
                  category: T.nilable(String),
                  currency: T.nilable(String),
                  description: T.nilable(String),
                  dimensions: T::Array[String],
                  features: T::Array[String],
                  images: T::Array[String],
                  image_url: T.nilable(String),
                  name: String,
                  price: T.nilable(Float),
                  regular_price: T.nilable(Float),
                  sku: T.nilable(String),
                  tags: T::Array[String],
                  target_audience: T::Array[String],
                  variants:
                    T::Array[
                      ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant
                    ]
                }
              )
            end
            def to_hash
            end

            # Stock or ordering availability.
            module Availability
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::Models::WebScrapeResponse::Product::Data::Product::Availability
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              IN_STOCK =
                T.let(
                  :in_stock,
                  ContextDev::Models::WebScrapeResponse::Product::Data::Product::Availability::TaggedSymbol
                )
              OUT_OF_STOCK =
                T.let(
                  :out_of_stock,
                  ContextDev::Models::WebScrapeResponse::Product::Data::Product::Availability::TaggedSymbol
                )
              LIMITED_AVAILABILITY =
                T.let(
                  :limited_availability,
                  ContextDev::Models::WebScrapeResponse::Product::Data::Product::Availability::TaggedSymbol
                )
              PREORDER =
                T.let(
                  :preorder,
                  ContextDev::Models::WebScrapeResponse::Product::Data::Product::Availability::TaggedSymbol
                )
              BACKORDER =
                T.let(
                  :backorder,
                  ContextDev::Models::WebScrapeResponse::Product::Data::Product::Availability::TaggedSymbol
                )
              MADE_TO_ORDER =
                T.let(
                  :made_to_order,
                  ContextDev::Models::WebScrapeResponse::Product::Data::Product::Availability::TaggedSymbol
                )
              DISCONTINUED =
                T.let(
                  :discontinued,
                  ContextDev::Models::WebScrapeResponse::Product::Data::Product::Availability::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::WebScrapeResponse::Product::Data::Product::Availability::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Variant < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Explicit variant attributes such as color, size, material, pattern and
              # properties declared by page.
              sig { returns(T::Hash[Symbol, String]) }
              attr_accessor :attributes

              # Original source image URLs explicitly attached to this variant.
              sig { returns(T::Array[String]) }
              attr_accessor :images

              sig { returns(T.nilable(String)) }
              attr_accessor :sku

              # Variant or offer URL when provided by the source. May be shared by variants.
              sig { returns(T.nilable(String)) }
              attr_accessor :url

              sig do
                params(
                  attributes: T::Hash[Symbol, String],
                  images: T::Array[String],
                  sku: T.nilable(String),
                  url: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                # Explicit variant attributes such as color, size, material, pattern and
                # properties declared by page.
                attributes:,
                # Original source image URLs explicitly attached to this variant.
                images:,
                sku:,
                # Variant or offer URL when provided by the source. May be shared by variants.
                url:
              )
              end

              sig do
                override.returns(
                  {
                    attributes: T::Hash[Symbol, String],
                    images: T::Array[String],
                    sku: T.nilable(String),
                    url: T.nilable(String)
                  }
                )
              end
              def to_hash
              end
            end
          end
        end
      end

      class Screenshot < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebScrapeResponse::Screenshot,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_accessor :data

        sig { returns(T::Boolean) }
        attr_accessor :requested

        # True when retrieved, false when retrieval failed, and null when not requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # An image data URL. Use directly as an image src.
        sig do
          params(
            data: T.nilable(String),
            requested: T::Boolean,
            success: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          requested:,
          # True when retrieved, false when retrieval failed, and null when not requested.
          success:
        )
        end

        sig do
          override.returns(
            {
              data: T.nilable(String),
              requested: T::Boolean,
              success: T.nilable(T::Boolean)
            }
          )
        end
        def to_hash
        end
      end

      # Present when a requested output fails, capture returns a page that is still
      # loading, images return before processing finishes, or the optional product AI
      # fallback fails or is cut short. Check each output's success field for its
      # result. Valid captured pieces may be cached independently; failed retrievals and
      # incomplete captures are not cached.
      module IsPartial
        extend ContextDev::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, ContextDev::Models::WebScrapeResponse::IsPartial)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            ContextDev::Models::WebScrapeResponse::IsPartial::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebScrapeResponse::IsPartial::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebScrapeResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits used by this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits remaining for your organization.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Credit usage, included whenever a valid API key is provided.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Credits used by this request.
          credits_consumed:,
          # Credits remaining for your organization.
          credits_remaining:
        )
        end

        sig do
          override.returns(
            { credits_consumed: Integer, credits_remaining: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
