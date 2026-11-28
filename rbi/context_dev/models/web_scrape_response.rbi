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

      # The original HTTP response body, unchanged by waits, actions, and filters.
      sig { returns(ContextDev::Models::WebScrapeResponse::Bytes) }
      attr_reader :bytes

      sig do
        params(bytes: ContextDev::Models::WebScrapeResponse::Bytes::OrHash).void
      end
      attr_writer :bytes

      # Cache status of this response.
      sig { returns(ContextDev::Models::WebScrapeResponse::CacheMetadata) }
      attr_reader :cache_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebScrapeResponse::CacheMetadata::OrHash
        ).void
      end
      attr_writer :cache_metadata

      # Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks
      # omitted text.
      sig { returns(ContextDev::Models::WebScrapeResponse::Highlights) }
      attr_reader :highlights

      sig do
        params(
          highlights: ContextDev::Models::WebScrapeResponse::Highlights::OrHash
        ).void
      end
      attr_writer :highlights

      # Rendered HTML of the page, after content filters.
      sig { returns(ContextDev::Models::WebScrapeResponse::HTML) }
      attr_reader :html

      sig do
        params(html: ContextDev::Models::WebScrapeResponse::HTML::OrHash).void
      end
      attr_writer :html

      # Images found on the page, after content filters. `[]` when there are none.
      sig { returns(ContextDev::Models::WebScrapeResponse::Images) }
      attr_reader :images

      sig do
        params(
          images: ContextDev::Models::WebScrapeResponse::Images::OrHash
        ).void
      end
      attr_writer :images

      # Object matching `jsonParams.schema`.
      sig { returns(ContextDev::Models::WebScrapeResponse::Json) }
      attr_reader :json

      sig do
        params(json: ContextDev::Models::WebScrapeResponse::Json::OrHash).void
      end
      attr_writer :json

      # Page content as Markdown, after content filters.
      sig { returns(ContextDev::Models::WebScrapeResponse::Markdown) }
      attr_reader :markdown

      sig do
        params(
          markdown: ContextDev::Models::WebScrapeResponse::Markdown::OrHash
        ).void
      end
      attr_writer :markdown

      # Page metadata. Fields are omitted when not found.
      sig { returns(ContextDev::Models::WebScrapeResponse::Metadata) }
      attr_reader :metadata

      sig do
        params(
          metadata: ContextDev::Models::WebScrapeResponse::Metadata::OrHash
        ).void
      end
      attr_writer :metadata

      # Fields extracted by `parseParams`. Custom rules return each field after content
      # filters, with `null` when nothing matches (`[]` for `list` rules). Prebuilt
      # parsers return the record or lists described under `parseParams.parser`.
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

      # Browser profile used for this scrape. `null` when no profile was requested.
      sig { returns(T.nilable(ContextDev::Models::WebScrapeResponse::Profile)) }
      attr_reader :profile

      sig do
        params(
          profile:
            T.nilable(ContextDev::Models::WebScrapeResponse::Profile::OrHash)
        ).void
      end
      attr_writer :profile

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Screenshot as a base64 image data URL.
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

      # `true` when at least one requested output succeeded but others failed or are
      # incomplete. Absent otherwise.
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

      # Credits this request used and your remaining balance.
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
          profile:
            T.nilable(ContextDev::Models::WebScrapeResponse::Profile::OrHash),
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
        # The original HTTP response body, unchanged by waits, actions, and filters.
        bytes:,
        # Cache status of this response.
        cache_metadata:,
        # Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks
        # omitted text.
        highlights:,
        # Rendered HTML of the page, after content filters.
        html:,
        # Images found on the page, after content filters. `[]` when there are none.
        images:,
        # Object matching `jsonParams.schema`.
        json:,
        # Page content as Markdown, after content filters.
        markdown:,
        # Page metadata. Fields are omitted when not found.
        metadata:,
        # Fields extracted by `parseParams`. Custom rules return each field after content
        # filters, with `null` when nothing matches (`[]` for `list` rules). Prebuilt
        # parsers return the record or lists described under `parseParams.parser`.
        parsed:,
        # Product details found on the page.
        product:,
        # Browser profile used for this scrape. `null` when no profile was requested.
        profile:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Screenshot as a base64 image data URL.
        screenshot:,
        # Final URL after redirects and browser actions.
        url:,
        # `true` when at least one requested output succeeded but others failed or are
        # incomplete. Absent otherwise.
        is_partial: nil,
        # Credits this request used and your remaining balance.
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
            profile: T.nilable(ContextDev::Models::WebScrapeResponse::Profile),
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

        # Whether you requested this output in `formats`.
        sig { returns(T::Boolean) }
        attr_accessor :requested

        # `true` when the output succeeded, `false` when it failed, `null` when it was not
        # requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # Machine-readable error code. Present only when `success` is `false`.
        sig { returns(T.nilable(String)) }
        attr_reader :error_code

        sig { params(error_code: String).void }
        attr_writer :error_code

        # Human-readable explanation of the error and how to resolve it.
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # The original HTTP response body, unchanged by waits, actions, and filters.
        sig do
          params(
            data:
              T.nilable(
                ContextDev::Models::WebScrapeResponse::Bytes::Data::OrHash
              ),
            requested: T::Boolean,
            success: T.nilable(T::Boolean),
            error_code: String,
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          # Whether you requested this output in `formats`.
          requested:,
          # `true` when the output succeeded, `false` when it failed, `null` when it was not
          # requested.
          success:,
          # Machine-readable error code. Present only when `success` is `false`.
          error_code: nil,
          # Human-readable explanation of the error and how to resolve it.
          message: nil
        )
        end

        sig do
          override.returns(
            {
              data:
                T.nilable(ContextDev::Models::WebScrapeResponse::Bytes::Data),
              requested: T::Boolean,
              success: T.nilable(T::Boolean),
              error_code: String,
              message: String
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

          # Response body as base64, after HTTP decompression. Up to 50 MiB decoded.
          sig { returns(String) }
          attr_accessor :base64

          # `Content-Type` of the response.
          sig { returns(String) }
          attr_accessor :content_type

          sig do
            params(base64: String, content_type: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # Response body as base64, after HTTP decompression. Up to 50 MiB decoded.
            base64:,
            # `Content-Type` of the response.
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

        # Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
        sig { returns(Integer) }
        attr_accessor :age_ms

        # `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
        # retention bypassed the cache.
        sig do
          returns(
            ContextDev::Models::WebScrapeResponse::CacheMetadata::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Cache status of this response.
        sig do
          params(
            age_ms: Integer,
            status:
              ContextDev::Models::WebScrapeResponse::CacheMetadata::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
          age_ms:,
          # `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
          # retention bypassed the cache.
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

        # `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
        # retention bypassed the cache.
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

        # Whether you requested this output in `formats`.
        sig { returns(T::Boolean) }
        attr_accessor :requested

        # `true` when the output succeeded, `false` when it failed, `null` when it was not
        # requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # Machine-readable error code. Present only when `success` is `false`.
        sig { returns(T.nilable(String)) }
        attr_reader :error_code

        sig { params(error_code: String).void }
        attr_writer :error_code

        # Human-readable explanation of the error and how to resolve it.
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks
        # omitted text.
        sig do
          params(
            data: T.nilable(T::Array[String]),
            requested: T::Boolean,
            success: T.nilable(T::Boolean),
            error_code: String,
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          # Whether you requested this output in `formats`.
          requested:,
          # `true` when the output succeeded, `false` when it failed, `null` when it was not
          # requested.
          success:,
          # Machine-readable error code. Present only when `success` is `false`.
          error_code: nil,
          # Human-readable explanation of the error and how to resolve it.
          message: nil
        )
        end

        sig do
          override.returns(
            {
              data: T.nilable(T::Array[String]),
              requested: T::Boolean,
              success: T.nilable(T::Boolean),
              error_code: String,
              message: String
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

        # Whether you requested this output in `formats`.
        sig { returns(T::Boolean) }
        attr_accessor :requested

        # `true` when the output succeeded, `false` when it failed, `null` when it was not
        # requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # Machine-readable error code. Present only when `success` is `false`.
        sig { returns(T.nilable(String)) }
        attr_reader :error_code

        sig { params(error_code: String).void }
        attr_writer :error_code

        # Human-readable explanation of the error and how to resolve it.
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Rendered HTML of the page, after content filters.
        sig do
          params(
            data: T.nilable(String),
            requested: T::Boolean,
            success: T.nilable(T::Boolean),
            error_code: String,
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          # Whether you requested this output in `formats`.
          requested:,
          # `true` when the output succeeded, `false` when it failed, `null` when it was not
          # requested.
          success:,
          # Machine-readable error code. Present only when `success` is `false`.
          error_code: nil,
          # Human-readable explanation of the error and how to resolve it.
          message: nil
        )
        end

        sig do
          override.returns(
            {
              data: T.nilable(String),
              requested: T::Boolean,
              success: T.nilable(T::Boolean),
              error_code: String,
              message: String
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

        # Whether you requested this output in `formats`.
        sig { returns(T::Boolean) }
        attr_accessor :requested

        # `true` when the output succeeded, `false` when it failed, `null` when it was not
        # requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # Machine-readable error code. Present only when `success` is `false`.
        sig { returns(T.nilable(String)) }
        attr_reader :error_code

        sig { params(error_code: String).void }
        attr_writer :error_code

        # Human-readable explanation of the error and how to resolve it.
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Images found on the page, after content filters. `[]` when there are none.
        sig do
          params(
            data:
              T.nilable(
                T::Array[
                  ContextDev::Models::WebScrapeResponse::Images::Data::OrHash
                ]
              ),
            requested: T::Boolean,
            success: T.nilable(T::Boolean),
            error_code: String,
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          # Whether you requested this output in `formats`.
          requested:,
          # `true` when the output succeeded, `false` when it failed, `null` when it was not
          # requested.
          success:,
          # Machine-readable error code. Present only when `success` is `false`.
          error_code: nil,
          # Human-readable explanation of the error and how to resolve it.
          message: nil
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
              success: T.nilable(T::Boolean),
              error_code: String,
              message: String
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

          # Alt text. `null` when the image has none.
          sig { returns(T.nilable(String)) }
          attr_accessor :alt

          # Image URL, or a data URI for inline images.
          sig { returns(String) }
          attr_accessor :url

          # What the image shows, such as a photo, logo, or icon. Requires `classification`
          # enrichment.
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

          # Hosted copy of the image, valid for 24 hours after capture. Requires `file`
          # enrichment; not returned with ZDR.
          sig { returns(T.nilable(String)) }
          attr_reader :file_url

          sig { params(file_url: String).void }
          attr_writer :file_url

          # Image height in pixels. Requires `dimensions` enrichment.
          sig { returns(T.nilable(Integer)) }
          attr_reader :height

          sig { params(height: Integer).void }
          attr_writer :height

          # Image width in pixels. Requires `dimensions` enrichment.
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
            # Alt text. `null` when the image has none.
            alt:,
            # Image URL, or a data URI for inline images.
            url:,
            # What the image shows, such as a photo, logo, or icon. Requires `classification`
            # enrichment.
            classification: nil,
            # Hosted copy of the image, valid for 24 hours after capture. Requires `file`
            # enrichment; not returned with ZDR.
            file_url: nil,
            # Image height in pixels. Requires `dimensions` enrichment.
            height: nil,
            # Image width in pixels. Requires `dimensions` enrichment.
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

          # What the image shows, such as a photo, logo, or icon. Requires `classification`
          # enrichment.
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

        # Whether you requested this output in `formats`.
        sig { returns(T::Boolean) }
        attr_accessor :requested

        # `true` when the output succeeded, `false` when it failed, `null` when it was not
        # requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # Machine-readable error code. Present only when `success` is `false`.
        sig { returns(T.nilable(String)) }
        attr_reader :error_code

        sig { params(error_code: String).void }
        attr_writer :error_code

        # `true` when the page was too long to read in full, so values that appear only in
        # the unread part may be missing.
        sig do
          returns(
            T.nilable(
              ContextDev::Models::WebScrapeResponse::Json::IsTruncated::TaggedBoolean
            )
          )
        end
        attr_reader :is_truncated

        sig do
          params(
            is_truncated:
              ContextDev::Models::WebScrapeResponse::Json::IsTruncated::OrBoolean
          ).void
        end
        attr_writer :is_truncated

        # Human-readable explanation of the error and how to resolve it.
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Object matching `jsonParams.schema`.
        sig do
          params(
            data: T.nilable(T::Hash[Symbol, T.anything]),
            requested: T::Boolean,
            success: T.nilable(T::Boolean),
            error_code: String,
            is_truncated:
              ContextDev::Models::WebScrapeResponse::Json::IsTruncated::OrBoolean,
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          # Whether you requested this output in `formats`.
          requested:,
          # `true` when the output succeeded, `false` when it failed, `null` when it was not
          # requested.
          success:,
          # Machine-readable error code. Present only when `success` is `false`.
          error_code: nil,
          # `true` when the page was too long to read in full, so values that appear only in
          # the unread part may be missing.
          is_truncated: nil,
          # Human-readable explanation of the error and how to resolve it.
          message: nil
        )
        end

        sig do
          override.returns(
            {
              data: T.nilable(T::Hash[Symbol, T.anything]),
              requested: T::Boolean,
              success: T.nilable(T::Boolean),
              error_code: String,
              is_truncated:
                ContextDev::Models::WebScrapeResponse::Json::IsTruncated::TaggedBoolean,
              message: String
            }
          )
        end
        def to_hash
        end

        # `true` when the page was too long to read in full, so values that appear only in
        # the unread part may be missing.
        module IsTruncated
          extend ContextDev::Internal::Type::Enum

          TaggedBoolean =
            T.type_alias do
              T.all(
                T::Boolean,
                ContextDev::Models::WebScrapeResponse::Json::IsTruncated
              )
            end
          OrBoolean = T.type_alias { T::Boolean }

          TRUE =
            T.let(
              true,
              ContextDev::Models::WebScrapeResponse::Json::IsTruncated::TaggedBoolean
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebScrapeResponse::Json::IsTruncated::TaggedBoolean
              ]
            )
          end
          def self.values
          end
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

        # Whether you requested this output in `formats`.
        sig { returns(T::Boolean) }
        attr_accessor :requested

        # `true` when the output succeeded, `false` when it failed, `null` when it was not
        # requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # Machine-readable error code. Present only when `success` is `false`.
        sig { returns(T.nilable(String)) }
        attr_reader :error_code

        sig { params(error_code: String).void }
        attr_writer :error_code

        # Human-readable explanation of the error and how to resolve it.
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Page content as Markdown, after content filters.
        sig do
          params(
            data: T.nilable(String),
            requested: T::Boolean,
            success: T.nilable(T::Boolean),
            error_code: String,
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          # Whether you requested this output in `formats`.
          requested:,
          # `true` when the output succeeded, `false` when it failed, `null` when it was not
          # requested.
          success:,
          # Machine-readable error code. Present only when `success` is `false`.
          error_code: nil,
          # Human-readable explanation of the error and how to resolve it.
          message: nil
        )
        end

        sig do
          override.returns(
            {
              data: T.nilable(String),
              requested: T::Boolean,
              success: T.nilable(T::Boolean),
              error_code: String,
              message: String
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

        # Other non-social meta tags that don't have their own field.
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

        # Alternate links from `link rel="alternate"` tags, as absolute URLs.
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

        # Author, when present.
        sig { returns(T.nilable(String)) }
        attr_reader :author

        sig { params(author: String).void }
        attr_writer :author

        # Absolute canonical URL, when present.
        sig { returns(T.nilable(String)) }
        attr_reader :canonical_url

        sig { params(canonical_url: String).void }
        attr_writer :canonical_url

        # Best available description, from standard, Open Graph, or Twitter meta tags.
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # Absolute favicon URL, when present.
        sig { returns(T.nilable(String)) }
        attr_reader :favicon

        sig { params(favicon: String).void }
        attr_writer :favicon

        # Headings (`h1` to `h6`) in document order, from the full page before any
        # filtering. Up to 500. Omitted when the page has none.
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

        # Main preview image URL, from Open Graph, Twitter, or image meta tags.
        sig { returns(T.nilable(String)) }
        attr_reader :image

        sig { params(image: String).void }
        attr_writer :image

        # JSON-LD structured data blocks parsed from the page.
        sig { returns(T.nilable(T::Array[T::Hash[Symbol, T.anything]])) }
        attr_reader :json_ld

        sig { params(json_ld: T::Array[T::Hash[Symbol, T.anything]]).void }
        attr_writer :json_ld

        # Keywords from the page's `keywords` meta tag.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :keywords

        sig { params(keywords: T::Array[String]).void }
        attr_writer :keywords

        # Page language, from the `html` `lang` attribute or language meta tags.
        sig { returns(T.nilable(String)) }
        attr_reader :language

        sig { params(language: String).void }
        attr_writer :language

        # Last-modified date or timestamp from page metadata, when present.
        sig { returns(T.nilable(String)) }
        attr_reader :modified_time

        sig { params(modified_time: String).void }
        attr_writer :modified_time

        # Open Graph tags, with the `og:` prefix removed and keys in camelCase.
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

        # Publish date or timestamp from page metadata, when present.
        sig { returns(T.nilable(String)) }
        attr_reader :published_time

        sig { params(published_time: String).void }
        attr_writer :published_time

        # `robots` meta directive, when present.
        sig { returns(T.nilable(String)) }
        attr_reader :robots

        sig { params(robots: String).void }
        attr_writer :robots

        # Site or app name from page metadata.
        sig { returns(T.nilable(String)) }
        attr_reader :site_name

        sig { params(site_name: String).void }
        attr_writer :site_name

        # Best available page title.
        sig { returns(T.nilable(String)) }
        attr_reader :title

        sig { params(title: String).void }
        attr_writer :title

        # Twitter card tags, with the `twitter:` prefix removed and keys in camelCase.
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

        # Page metadata. Fields are omitted when not found.
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
          # Other non-social meta tags that don't have their own field.
          additional_meta: nil,
          # Alternate links from `link rel="alternate"` tags, as absolute URLs.
          alternates: nil,
          # Author, when present.
          author: nil,
          # Absolute canonical URL, when present.
          canonical_url: nil,
          # Best available description, from standard, Open Graph, or Twitter meta tags.
          description: nil,
          # Absolute favicon URL, when present.
          favicon: nil,
          # Headings (`h1` to `h6`) in document order, from the full page before any
          # filtering. Up to 500. Omitted when the page has none.
          headings: nil,
          # Main preview image URL, from Open Graph, Twitter, or image meta tags.
          image: nil,
          # JSON-LD structured data blocks parsed from the page.
          json_ld: nil,
          # Keywords from the page's `keywords` meta tag.
          keywords: nil,
          # Page language, from the `html` `lang` attribute or language meta tags.
          language: nil,
          # Last-modified date or timestamp from page metadata, when present.
          modified_time: nil,
          # Open Graph tags, with the `og:` prefix removed and keys in camelCase.
          open_graph: nil,
          # Publish date or timestamp from page metadata, when present.
          published_time: nil,
          # `robots` meta directive, when present.
          robots: nil,
          # Site or app name from page metadata.
          site_name: nil,
          # Best available page title.
          title: nil,
          # Twitter card tags, with the `twitter:` prefix removed and keys in camelCase.
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

          # Absolute URL of the alternate version.
          sig { returns(String) }
          attr_accessor :href

          # Language or locale of the alternate version, when present.
          sig { returns(T.nilable(String)) }
          attr_reader :hreflang

          sig { params(hreflang: String).void }
          attr_writer :hreflang

          # Title of the alternate version, when present.
          sig { returns(T.nilable(String)) }
          attr_reader :title

          sig { params(title: String).void }
          attr_writer :title

          # MIME type of the alternate version, when present.
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
            # Absolute URL of the alternate version.
            href:,
            # Language or locale of the alternate version, when present.
            hreflang: nil,
            # Title of the alternate version, when present.
            title: nil,
            # MIME type of the alternate version, when present.
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

          # Heading level, from 1 (`h1`) to 6 (`h6`).
          sig { returns(Integer) }
          attr_accessor :level

          # Heading text with whitespace collapsed, truncated to 1000 characters.
          sig { returns(String) }
          attr_accessor :text

          sig { params(level: Integer, text: String).returns(T.attached_class) }
          def self.new(
            # Heading level, from 1 (`h1`) to 6 (`h6`).
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

        # Whether you requested this output in `formats`.
        sig { returns(T::Boolean) }
        attr_accessor :requested

        # `true` when the output succeeded, `false` when it failed, `null` when it was not
        # requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # Prebuilt parser that ran, or `custom` for custom rules or when `parse` was not
        # requested.
        sig do
          returns(
            ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Machine-readable error code. Present only when `success` is `false`.
        sig { returns(T.nilable(String)) }
        attr_reader :error_code

        sig { params(error_code: String).void }
        attr_writer :error_code

        # Human-readable explanation of the error and how to resolve it.
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Fields extracted by `parseParams`. Custom rules return each field after content
        # filters, with `null` when nothing matches (`[]` for `list` rules). Prebuilt
        # parsers return the record or lists described under `parseParams.parser`.
        sig do
          params(
            data: T.nilable(T::Hash[Symbol, T.anything]),
            requested: T::Boolean,
            success: T.nilable(T::Boolean),
            type: ContextDev::Models::WebScrapeResponse::Parsed::Type::OrSymbol,
            error_code: String,
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          # Whether you requested this output in `formats`.
          requested:,
          # `true` when the output succeeded, `false` when it failed, `null` when it was not
          # requested.
          success:,
          # Prebuilt parser that ran, or `custom` for custom rules or when `parse` was not
          # requested.
          type:,
          # Machine-readable error code. Present only when `success` is `false`.
          error_code: nil,
          # Human-readable explanation of the error and how to resolve it.
          message: nil
        )
        end

        sig do
          override.returns(
            {
              data: T.nilable(T::Hash[Symbol, T.anything]),
              requested: T::Boolean,
              success: T.nilable(T::Boolean),
              type:
                ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol,
              error_code: String,
              message: String
            }
          )
        end
        def to_hash
        end

        # Prebuilt parser that ran, or `custom` for custom rules or when `parse` was not
        # requested.
        module Type
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::Models::WebScrapeResponse::Parsed::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CUSTOM =
            T.let(
              :custom,
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          GOOGLE_MAPS =
            T.let(
              :"google-maps",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          GOOGLE_MAPS_REVIEWS =
            T.let(
              :"google-maps-reviews",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          GOOGLE_PLAY =
            T.let(
              :"google-play",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          GOOGLE_PLAY_REVIEWS =
            T.let(
              :"google-play-reviews",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          APP_STORE =
            T.let(
              :"app-store",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          APP_STORE_REVIEWS =
            T.let(
              :"app-store-reviews",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          G2_REVIEWS =
            T.let(
              :"g2-reviews",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          INSTAGRAM_PROFILE =
            T.let(
              :"instagram-profile",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          INSTAGRAM_POST =
            T.let(
              :"instagram-post",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          INSTAGRAM_FEED =
            T.let(
              :"instagram-feed",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          TIKTOK_PROFILE =
            T.let(
              :"tiktok-profile",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          TIKTOK_VIDEO =
            T.let(
              :"tiktok-video",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          TIKTOK_FEED =
            T.let(
              :"tiktok-feed",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          TIKTOK_COMMENTS =
            T.let(
              :"tiktok-comments",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          TIKTOK_FOLLOWERS =
            T.let(
              :"tiktok-followers",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          TIKTOK_FOLLOWING =
            T.let(
              :"tiktok-following",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          TIKTOK_USER_SEARCH =
            T.let(
              :"tiktok-user-search",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          REDDIT_POST =
            T.let(
              :"reddit-post",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          REDDIT_SEARCH =
            T.let(
              :"reddit-search",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          REDDIT_SUBREDDIT =
            T.let(
              :"reddit-subreddit",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          REDDIT_USER =
            T.let(
              :"reddit-user",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          YELP_SEARCH =
            T.let(
              :"yelp-search",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          YELP_REVIEWS =
            T.let(
              :"yelp-reviews",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          TRIPADVISOR_REVIEWS =
            T.let(
              :"tripadvisor-reviews",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          CAR_RENTAL_AVAILABILITY =
            T.let(
              :"car-rental-availability",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          CAR_RENTAL_LOCATIONS =
            T.let(
              :"car-rental-locations",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          EMAILS =
            T.let(
              :emails,
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          PHONE_NUMBERS =
            T.let(
              :"phone-numbers",
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )
          LINKS =
            T.let(
              :links,
              ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebScrapeResponse::Parsed::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
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

        # Whether you requested this output in `formats`.
        sig { returns(T::Boolean) }
        attr_accessor :requested

        # `true` when the output succeeded, `false` when it failed, `null` when it was not
        # requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # Machine-readable error code. Present only when `success` is `false`.
        sig { returns(T.nilable(String)) }
        attr_reader :error_code

        sig { params(error_code: String).void }
        attr_writer :error_code

        # Human-readable explanation of the error and how to resolve it.
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Product details found on the page.
        sig do
          params(
            data:
              T.nilable(
                ContextDev::Models::WebScrapeResponse::Product::Data::OrHash
              ),
            requested: T::Boolean,
            success: T.nilable(T::Boolean),
            error_code: String,
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          # Whether you requested this output in `formats`.
          requested:,
          # `true` when the output succeeded, `false` when it failed, `null` when it was not
          # requested.
          success:,
          # Machine-readable error code. Present only when `success` is `false`.
          error_code: nil,
          # Human-readable explanation of the error and how to resolve it.
          message: nil
        )
        end

        sig do
          override.returns(
            {
              data:
                T.nilable(ContextDev::Models::WebScrapeResponse::Product::Data),
              requested: T::Boolean,
              success: T.nilable(T::Boolean),
              error_code: String,
              message: String
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

          # The extracted product. `null` when the page is not a product detail page.
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
            # The extracted product. `null` when the page is not a product detail page.
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

            # ISO 4217 currency code of `price`.
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

            # Product variants, such as colors or sizes, with their attributes and images.
            # `[]` when none are found. May not include every variant the store offers.
            sig do
              returns(
                T::Array[
                  ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant
                ]
              )
            end
            attr_accessor :variants

            # The extracted product. `null` when the page is not a product detail page.
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
              # ISO 4217 currency code of `price`.
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
              # Product variants, such as colors or sizes, with their attributes and images.
              # `[]` when none are found. May not include every variant the store offers.
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

              # Attributes that define this variant, such as color, size, material, or pattern,
              # as stated on the page.
              sig { returns(T::Hash[Symbol, String]) }
              attr_accessor :attributes

              # Image URLs the source attaches to this variant.
              sig { returns(T::Array[String]) }
              attr_accessor :images

              # SKU of this variant. `null` when the source does not state one.
              sig { returns(T.nilable(String)) }
              attr_accessor :sku

              # URL of this variant or offer, when the source provides one. Several variants can
              # share a URL.
              sig { returns(T.nilable(String)) }
              attr_accessor :url

              # Stock or ordering availability of this variant.
              sig do
                returns(
                  T.nilable(
                    ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant::Availability::TaggedSymbol
                  )
                )
              end
              attr_accessor :availability

              # Currency code of `price`, such as `USD` or `EUR`, when stated.
              sig { returns(T.nilable(String)) }
              attr_accessor :currency

              # Price of this variant, when the source states one per variant.
              sig { returns(T.nilable(Float)) }
              attr_accessor :price

              sig do
                params(
                  attributes: T::Hash[Symbol, String],
                  images: T::Array[String],
                  sku: T.nilable(String),
                  url: T.nilable(String),
                  availability:
                    T.nilable(
                      ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant::Availability::OrSymbol
                    ),
                  currency: T.nilable(String),
                  price: T.nilable(Float)
                ).returns(T.attached_class)
              end
              def self.new(
                # Attributes that define this variant, such as color, size, material, or pattern,
                # as stated on the page.
                attributes:,
                # Image URLs the source attaches to this variant.
                images:,
                # SKU of this variant. `null` when the source does not state one.
                sku:,
                # URL of this variant or offer, when the source provides one. Several variants can
                # share a URL.
                url:,
                # Stock or ordering availability of this variant.
                availability: nil,
                # Currency code of `price`, such as `USD` or `EUR`, when stated.
                currency: nil,
                # Price of this variant, when the source states one per variant.
                price: nil
              )
              end

              sig do
                override.returns(
                  {
                    attributes: T::Hash[Symbol, String],
                    images: T::Array[String],
                    sku: T.nilable(String),
                    url: T.nilable(String),
                    availability:
                      T.nilable(
                        ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant::Availability::TaggedSymbol
                      ),
                    currency: T.nilable(String),
                    price: T.nilable(Float)
                  }
                )
              end
              def to_hash
              end

              # Stock or ordering availability of this variant.
              module Availability
                extend ContextDev::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant::Availability
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                IN_STOCK =
                  T.let(
                    :in_stock,
                    ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant::Availability::TaggedSymbol
                  )
                OUT_OF_STOCK =
                  T.let(
                    :out_of_stock,
                    ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant::Availability::TaggedSymbol
                  )
                LIMITED_AVAILABILITY =
                  T.let(
                    :limited_availability,
                    ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant::Availability::TaggedSymbol
                  )
                PREORDER =
                  T.let(
                    :preorder,
                    ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant::Availability::TaggedSymbol
                  )
                BACKORDER =
                  T.let(
                    :backorder,
                    ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant::Availability::TaggedSymbol
                  )
                MADE_TO_ORDER =
                  T.let(
                    :made_to_order,
                    ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant::Availability::TaggedSymbol
                  )
                DISCONTINUED =
                  T.let(
                    :discontinued,
                    ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant::Availability::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::Models::WebScrapeResponse::Product::Data::Product::Variant::Availability::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end
          end
        end
      end

      class Profile < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebScrapeResponse::Profile,
              ContextDev::Internal::AnyHash
            )
          end

        # ID of the browser profile. After creating a profile, save it and pass it as
        # `sharedParams.profile.profileId` with `type: "existing"`.
        sig { returns(String) }
        attr_accessor :id

        # Browser profile used for this scrape. `null` when no profile was requested.
        sig { params(id: String).returns(T.attached_class) }
        def self.new(
          # ID of the browser profile. After creating a profile, save it and pass it as
          # `sharedParams.profile.profileId` with `type: "existing"`.
          id:
        )
        end

        sig { override.returns({ id: String }) }
        def to_hash
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

        # Whether you requested this output in `formats`.
        sig { returns(T::Boolean) }
        attr_accessor :requested

        # `true` when the output succeeded, `false` when it failed, `null` when it was not
        # requested.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :success

        # Machine-readable error code. Present only when `success` is `false`.
        sig { returns(T.nilable(String)) }
        attr_reader :error_code

        sig { params(error_code: String).void }
        attr_writer :error_code

        # Human-readable explanation of the error and how to resolve it.
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Screenshot as a base64 image data URL.
        sig do
          params(
            data: T.nilable(String),
            requested: T::Boolean,
            success: T.nilable(T::Boolean),
            error_code: String,
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          # Whether you requested this output in `formats`.
          requested:,
          # `true` when the output succeeded, `false` when it failed, `null` when it was not
          # requested.
          success:,
          # Machine-readable error code. Present only when `success` is `false`.
          error_code: nil,
          # Human-readable explanation of the error and how to resolve it.
          message: nil
        )
        end

        sig do
          override.returns(
            {
              data: T.nilable(String),
              requested: T::Boolean,
              success: T.nilable(T::Boolean),
              error_code: String,
              message: String
            }
          )
        end
        def to_hash
        end
      end

      # `true` when at least one requested output succeeded but others failed or are
      # incomplete. Absent otherwise.
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

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits your organization has left after this request.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Credits this request used and your remaining balance.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Credits charged for this request.
          credits_consumed:,
          # Credits your organization has left after this request.
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
