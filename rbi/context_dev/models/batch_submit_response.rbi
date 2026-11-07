# typed: strong

module ContextDev
  module Models
    class BatchSubmitResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::BatchSubmitResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Batch ID. Poll GET /batch/{batch_id} with it.
      sig { returns(String) }
      attr_accessor :id

      # Whether this response came from cache.
      sig { returns(ContextDev::Models::BatchSubmitResponse::CacheMetadata) }
      attr_reader :cache_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::BatchSubmitResponse::CacheMetadata::OrHash
        ).void
      end
      attr_writer :cache_metadata

      # Crawl settings as submitted.
      sig { returns(T.nilable(ContextDev::CrawlControls)) }
      attr_reader :crawl

      sig { params(crawl: T.nilable(ContextDev::CrawlControls::OrHash)).void }
      attr_writer :crawl

      # When the batch was created.
      sig { returns(String) }
      attr_accessor :created_at

      # Credits are reserved after background validation, before scraping starts.
      sig { returns(ContextDev::Models::BatchSubmitResponse::Credits) }
      attr_reader :credits

      sig do
        params(
          credits: ContextDev::Models::BatchSubmitResponse::Credits::OrHash
        ).void
      end
      attr_writer :credits

      # Outputs requested for each page. Matches input.data.formats on submission.
      sig { returns(ContextDev::Models::BatchSubmitResponse::Formats) }
      attr_reader :formats

      sig do
        params(
          formats: ContextDev::Models::BatchSubmitResponse::Formats::OrHash
        ).void
      end
      attr_writer :formats

      # What the submission accepted.
      sig { returns(ContextDev::Intake) }
      attr_reader :input

      sig { params(input: ContextDev::Intake::OrHash).void }
      attr_writer :input

      # Rejected URLs (first 100).
      sig do
        returns(T::Array[ContextDev::Models::BatchSubmitResponse::InvalidURL])
      end
      attr_accessor :invalid_urls

      # How pages will be selected.
      sig do
        returns(ContextDev::Models::BatchSubmitResponse::Mode::TaggedSymbol)
      end
      attr_accessor :mode

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Current state. `pending` means waiting for execution capacity or background
      # validation. Capacity-limited batches remain pending until a slot opens.
      # `completed`, `cancelled`, and `failed` are final.
      sig do
        returns(ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol)
      end
      attr_accessor :status

      # Tags stored on the batch.
      sig { returns(T::Array[String]) }
      attr_accessor :tags

      # Credits this request used and your remaining balance.
      sig do
        returns(T.nilable(ContextDev::Models::BatchSubmitResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::BatchSubmitResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # Secret for verifying `X-Context-Signature`. Only submit returns it, so store it.
      sig { returns(T.nilable(String)) }
      attr_reader :webhook_secret

      sig { params(webhook_secret: String).void }
      attr_writer :webhook_secret

      sig do
        params(
          id: String,
          cache_metadata:
            ContextDev::Models::BatchSubmitResponse::CacheMetadata::OrHash,
          crawl: T.nilable(ContextDev::CrawlControls::OrHash),
          created_at: String,
          credits: ContextDev::Models::BatchSubmitResponse::Credits::OrHash,
          formats: ContextDev::Models::BatchSubmitResponse::Formats::OrHash,
          input: ContextDev::Intake::OrHash,
          invalid_urls:
            T::Array[
              ContextDev::Models::BatchSubmitResponse::InvalidURL::OrHash
            ],
          mode: ContextDev::Models::BatchSubmitResponse::Mode::OrSymbol,
          request_id: String,
          status: ContextDev::Models::BatchSubmitResponse::Status::OrSymbol,
          tags: T::Array[String],
          key_metadata:
            ContextDev::Models::BatchSubmitResponse::KeyMetadata::OrHash,
          webhook_secret: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Batch ID. Poll GET /batch/{batch_id} with it.
        id:,
        # Whether this response came from cache.
        cache_metadata:,
        # Crawl settings as submitted.
        crawl:,
        # When the batch was created.
        created_at:,
        # Credits are reserved after background validation, before scraping starts.
        credits:,
        # Outputs requested for each page. Matches input.data.formats on submission.
        formats:,
        # What the submission accepted.
        input:,
        # Rejected URLs (first 100).
        invalid_urls:,
        # How pages will be selected.
        mode:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Current state. `pending` means waiting for execution capacity or background
        # validation. Capacity-limited batches remain pending until a slot opens.
        # `completed`, `cancelled`, and `failed` are final.
        status:,
        # Tags stored on the batch.
        tags:,
        # Credits this request used and your remaining balance.
        key_metadata: nil,
        # Secret for verifying `X-Context-Signature`. Only submit returns it, so store it.
        webhook_secret: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            cache_metadata:
              ContextDev::Models::BatchSubmitResponse::CacheMetadata,
            crawl: T.nilable(ContextDev::CrawlControls),
            created_at: String,
            credits: ContextDev::Models::BatchSubmitResponse::Credits,
            formats: ContextDev::Models::BatchSubmitResponse::Formats,
            input: ContextDev::Intake,
            invalid_urls:
              T::Array[ContextDev::Models::BatchSubmitResponse::InvalidURL],
            mode: ContextDev::Models::BatchSubmitResponse::Mode::TaggedSymbol,
            request_id: String,
            status:
              ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol,
            tags: T::Array[String],
            key_metadata: ContextDev::Models::BatchSubmitResponse::KeyMetadata,
            webhook_secret: String
          }
        )
      end
      def to_hash
      end

      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchSubmitResponse::CacheMetadata,
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
            ContextDev::Models::BatchSubmitResponse::CacheMetadata::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Whether this response came from cache.
        sig do
          params(
            age_ms: Integer,
            status:
              ContextDev::Models::BatchSubmitResponse::CacheMetadata::Status::OrSymbol
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
                ContextDev::Models::BatchSubmitResponse::CacheMetadata::Status::TaggedSymbol
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
                ContextDev::Models::BatchSubmitResponse::CacheMetadata::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HIT =
            T.let(
              :hit,
              ContextDev::Models::BatchSubmitResponse::CacheMetadata::Status::TaggedSymbol
            )
          MISS =
            T.let(
              :miss,
              ContextDev::Models::BatchSubmitResponse::CacheMetadata::Status::TaggedSymbol
            )
          ZDR =
            T.let(
              :zdr,
              ContextDev::Models::BatchSubmitResponse::CacheMetadata::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::BatchSubmitResponse::CacheMetadata::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Credits < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchSubmitResponse::Credits,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits reserved by background preparation. Zero while pending.
        sig { returns(Integer) }
        attr_accessor :reserved

        # Credits are reserved after background validation, before scraping starts.
        sig { params(reserved: Integer).returns(T.attached_class) }
        def self.new(
          # Credits reserved by background preparation. Zero while pending.
          reserved:
        )
        end

        sig { override.returns({ reserved: Integer }) }
        def to_hash
        end
      end

      class Formats < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchSubmitResponse::Formats,
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

        # An object matching `jsonParams.schema`, extracted from the page text and its
        # embedded data (JSON-LD, meta tags, framework state).
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :json

        sig { params(json: T::Boolean).void }
        attr_writer :json

        # Page content as Markdown.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :markdown

        sig { params(markdown: T::Boolean).void }
        attr_writer :markdown

        # Fields extracted with custom rules or a prebuilt parser, returned as `parsed`.
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

        # Outputs requested for each page. Matches input.data.formats on submission.
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
          # An object matching `jsonParams.schema`, extracted from the page text and its
          # embedded data (JSON-LD, meta tags, framework state).
          json: nil,
          # Page content as Markdown.
          markdown: nil,
          # Fields extracted with custom rules or a prebuilt parser, returned as `parsed`.
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

      class InvalidURL < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchSubmitResponse::InvalidURL,
              ContextDev::Internal::AnyHash
            )
          end

        # Why it was rejected.
        sig { returns(String) }
        attr_accessor :reason

        # Rejected URL.
        sig { returns(String) }
        attr_accessor :url

        sig { params(reason: String, url: String).returns(T.attached_class) }
        def self.new(
          # Why it was rejected.
          reason:,
          # Rejected URL.
          url:
        )
        end

        sig { override.returns({ reason: String, url: String }) }
        def to_hash
        end
      end

      # How pages will be selected.
      module Mode
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::BatchSubmitResponse::Mode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SCRAPE =
          T.let(
            :scrape,
            ContextDev::Models::BatchSubmitResponse::Mode::TaggedSymbol
          )
        CRAWL =
          T.let(
            :crawl,
            ContextDev::Models::BatchSubmitResponse::Mode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchSubmitResponse::Mode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Current state. `pending` means waiting for execution capacity or background
      # validation. Capacity-limited batches remain pending until a slot opens.
      # `completed`, `cancelled`, and `failed` are final.
      module Status
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::BatchSubmitResponse::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING =
          T.let(
            :pending,
            ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol
          )
        QUEUED =
          T.let(
            :queued,
            ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol
          )
        RUNNING =
          T.let(
            :running,
            ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol
          )
        CANCELLING =
          T.let(
            :cancelling,
            ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol
          )
        COMPLETED =
          T.let(
            :completed,
            ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol
          )
        CANCELLED =
          T.let(
            :cancelled,
            ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol
          )
        FAILED =
          T.let(
            :failed,
            ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol
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
              ContextDev::Models::BatchSubmitResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits remaining for your organization.
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
