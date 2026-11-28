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

      # Unique ID of the batch. Pass it to `GET /batch/{batch_id}` to track progress.
      sig { returns(String) }
      attr_accessor :id

      # Cache status of this response.
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

      # Credits reserved for the batch.
      sig { returns(ContextDev::Models::BatchSubmitResponse::Credits) }
      attr_reader :credits

      sig do
        params(
          credits: ContextDev::Models::BatchSubmitResponse::Credits::OrHash
        ).void
      end
      attr_writer :credits

      # Formats requested for each page, as submitted in `input.data.formats`.
      sig { returns(ContextDev::Models::BatchSubmitResponse::Formats) }
      attr_reader :formats

      sig do
        params(
          formats: ContextDev::Models::BatchSubmitResponse::Formats::OrHash
        ).void
      end
      attr_writer :formats

      # Page counts from your submission.
      sig { returns(ContextDev::Intake) }
      attr_reader :input

      sig { params(input: ContextDev::Intake::OrHash).void }
      attr_writer :input

      # URLs rejected from your list, up to the first 100.
      sig do
        returns(T::Array[ContextDev::Models::BatchSubmitResponse::InvalidURL])
      end
      attr_accessor :invalid_urls

      # `scrape` for a URL list, `crawl` for a site crawl.
      sig do
        returns(ContextDev::Models::BatchSubmitResponse::Mode::TaggedSymbol)
      end
      attr_accessor :mode

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Current state. `pending` batches are being validated or are waiting for a slot
      # under your plan's concurrent batch limit, `queued` batches are ready to start,
      # and `running` batches are scraping. `completed`, `cancelled`, and `failed` are
      # final.
      sig do
        returns(ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol)
      end
      attr_accessor :status

      # Tags set when the batch was submitted.
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

      # Secret for verifying `X-Context-Signature` on this batch's webhooks. Returned
      # only here and only when you set a webhook, so store it.
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
        # Unique ID of the batch. Pass it to `GET /batch/{batch_id}` to track progress.
        id:,
        # Cache status of this response.
        cache_metadata:,
        # Crawl settings as submitted.
        crawl:,
        # When the batch was created.
        created_at:,
        # Credits reserved for the batch.
        credits:,
        # Formats requested for each page, as submitted in `input.data.formats`.
        formats:,
        # Page counts from your submission.
        input:,
        # URLs rejected from your list, up to the first 100.
        invalid_urls:,
        # `scrape` for a URL list, `crawl` for a site crawl.
        mode:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Current state. `pending` batches are being validated or are waiting for a slot
        # under your plan's concurrent batch limit, `queued` batches are ready to start,
        # and `running` batches are scraping. `completed`, `cancelled`, and `failed` are
        # final.
        status:,
        # Tags set when the batch was submitted.
        tags:,
        # Credits this request used and your remaining balance.
        key_metadata: nil,
        # Secret for verifying `X-Context-Signature` on this batch's webhooks. Returned
        # only here and only when you set a webhook, so store it.
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

        # Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
        sig { returns(Integer) }
        attr_accessor :age_ms

        # `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
        # retention bypassed the cache.
        sig do
          returns(
            ContextDev::Models::BatchSubmitResponse::CacheMetadata::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Cache status of this response.
        sig do
          params(
            age_ms: Integer,
            status:
              ContextDev::Models::BatchSubmitResponse::CacheMetadata::Status::OrSymbol
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
                ContextDev::Models::BatchSubmitResponse::CacheMetadata::Status::TaggedSymbol
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

        # Credits reserved after validation, before scraping starts. `0` while `pending`.
        sig { returns(Integer) }
        attr_accessor :reserved

        # Credits reserved for the batch.
        sig { params(reserved: Integer).returns(T.attached_class) }
        def self.new(
          # Credits reserved after validation, before scraping starts. `0` while `pending`.
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

        # Formats requested for each page, as submitted in `input.data.formats`.
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

      # `scrape` for a URL list, `crawl` for a site crawl.
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

      # Current state. `pending` batches are being validated or are waiting for a slot
      # under your plan's concurrent batch limit, `queued` batches are ready to start,
      # and `running` batches are scraping. `completed`, `cancelled`, and `failed` are
      # final.
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
