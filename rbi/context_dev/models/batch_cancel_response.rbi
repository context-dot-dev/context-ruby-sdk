# typed: strong

module ContextDev
  module Models
    class BatchCancelResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::BatchCancelResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Unique ID of the batch.
      sig { returns(String) }
      attr_accessor :id

      # Crawl settings as submitted.
      sig { returns(T.nilable(ContextDev::CrawlControls)) }
      attr_reader :crawl

      sig { params(crawl: T.nilable(ContextDev::CrawlControls::OrHash)).void }
      attr_writer :crawl

      # Credits reserved for the batch.
      sig { returns(ContextDev::Models::BatchCancelResponse::Credits) }
      attr_reader :credits

      sig do
        params(
          credits: ContextDev::Models::BatchCancelResponse::Credits::OrHash
        ).void
      end
      attr_writer :credits

      # Formats requested for each page, as submitted in `input.data.formats`.
      sig { returns(ContextDev::Models::BatchCancelResponse::Formats) }
      attr_reader :formats

      sig do
        params(
          formats: ContextDev::Models::BatchCancelResponse::Formats::OrHash
        ).void
      end
      attr_writer :formats

      # Page counts from your submission.
      sig { returns(ContextDev::Intake) }
      attr_reader :input

      sig { params(input: ContextDev::Intake::OrHash).void }
      attr_writer :input

      # `scrape` for a URL list, `crawl` for a site crawl.
      sig do
        returns(ContextDev::Models::BatchCancelResponse::Mode::TaggedSymbol)
      end
      attr_accessor :mode

      # Page failures so far, grouped by error code, most common first.
      sig { returns(T::Array[ContextDev::PageErrorCount]) }
      attr_accessor :page_errors

      # How far the batch got before cancellation.
      sig { returns(ContextDev::Models::BatchCancelResponse::Progress) }
      attr_reader :progress

      sig do
        params(
          progress: ContextDev::Models::BatchCancelResponse::Progress::OrHash
        ).void
      end
      attr_writer :progress

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Always `cancelling`. Pages in progress finish, then the batch becomes
      # `cancelled`.
      sig do
        returns(ContextDev::Models::BatchCancelResponse::Status::TaggedSymbol)
      end
      attr_accessor :status

      # Tags set when the batch was submitted.
      sig { returns(T::Array[String]) }
      attr_accessor :tags

      # When the batch was created and started.
      sig { returns(ContextDev::Models::BatchCancelResponse::Timing) }
      attr_reader :timing

      sig do
        params(
          timing: ContextDev::Models::BatchCancelResponse::Timing::OrHash
        ).void
      end
      attr_writer :timing

      # Credits this request used and your remaining balance.
      sig do
        returns(T.nilable(ContextDev::Models::BatchCancelResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::BatchCancelResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          id: String,
          crawl: T.nilable(ContextDev::CrawlControls::OrHash),
          credits: ContextDev::Models::BatchCancelResponse::Credits::OrHash,
          formats: ContextDev::Models::BatchCancelResponse::Formats::OrHash,
          input: ContextDev::Intake::OrHash,
          mode: ContextDev::Models::BatchCancelResponse::Mode::OrSymbol,
          page_errors: T::Array[ContextDev::PageErrorCount::OrHash],
          progress: ContextDev::Models::BatchCancelResponse::Progress::OrHash,
          request_id: String,
          status: ContextDev::Models::BatchCancelResponse::Status::OrSymbol,
          tags: T::Array[String],
          timing: ContextDev::Models::BatchCancelResponse::Timing::OrHash,
          key_metadata:
            ContextDev::Models::BatchCancelResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique ID of the batch.
        id:,
        # Crawl settings as submitted.
        crawl:,
        # Credits reserved for the batch.
        credits:,
        # Formats requested for each page, as submitted in `input.data.formats`.
        formats:,
        # Page counts from your submission.
        input:,
        # `scrape` for a URL list, `crawl` for a site crawl.
        mode:,
        # Page failures so far, grouped by error code, most common first.
        page_errors:,
        # How far the batch got before cancellation.
        progress:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Always `cancelling`. Pages in progress finish, then the batch becomes
        # `cancelled`.
        status:,
        # Tags set when the batch was submitted.
        tags:,
        # When the batch was created and started.
        timing:,
        # Credits this request used and your remaining balance.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            crawl: T.nilable(ContextDev::CrawlControls),
            credits: ContextDev::Models::BatchCancelResponse::Credits,
            formats: ContextDev::Models::BatchCancelResponse::Formats,
            input: ContextDev::Intake,
            mode: ContextDev::Models::BatchCancelResponse::Mode::TaggedSymbol,
            page_errors: T::Array[ContextDev::PageErrorCount],
            progress: ContextDev::Models::BatchCancelResponse::Progress,
            request_id: String,
            status:
              ContextDev::Models::BatchCancelResponse::Status::TaggedSymbol,
            tags: T::Array[String],
            timing: ContextDev::Models::BatchCancelResponse::Timing,
            key_metadata: ContextDev::Models::BatchCancelResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class Credits < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchCancelResponse::Credits,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits reserved for the batch. Unused credits are refunded once it reaches
        # `cancelled`.
        sig { returns(Integer) }
        attr_accessor :reserved

        # Credits reserved for the batch.
        sig { params(reserved: Integer).returns(T.attached_class) }
        def self.new(
          # Credits reserved for the batch. Unused credits are refunded once it reaches
          # `cancelled`.
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
              ContextDev::Models::BatchCancelResponse::Formats,
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

      # `scrape` for a URL list, `crawl` for a site crawl.
      module Mode
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::BatchCancelResponse::Mode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SCRAPE =
          T.let(
            :scrape,
            ContextDev::Models::BatchCancelResponse::Mode::TaggedSymbol
          )
        CRAWL =
          T.let(
            :crawl,
            ContextDev::Models::BatchCancelResponse::Mode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchCancelResponse::Mode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Progress < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchCancelResponse::Progress,
              ContextDev::Internal::AnyHash
            )
          end

        # Pages that could not be scraped before cancellation.
        sig { returns(Integer) }
        attr_accessor :failed

        # Pages not yet attempted, which will be skipped.
        sig { returns(Integer) }
        attr_accessor :pending

        # Pages scraped successfully before cancellation.
        sig { returns(Integer) }
        attr_accessor :succeeded

        # How far the batch got before cancellation.
        sig do
          params(failed: Integer, pending: Integer, succeeded: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Pages that could not be scraped before cancellation.
          failed:,
          # Pages not yet attempted, which will be skipped.
          pending:,
          # Pages scraped successfully before cancellation.
          succeeded:
        )
        end

        sig do
          override.returns(
            { failed: Integer, pending: Integer, succeeded: Integer }
          )
        end
        def to_hash
        end
      end

      # Always `cancelling`. Pages in progress finish, then the batch becomes
      # `cancelled`.
      module Status
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::BatchCancelResponse::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CANCELLING =
          T.let(
            :cancelling,
            ContextDev::Models::BatchCancelResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchCancelResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Timing < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchCancelResponse::Timing,
              ContextDev::Internal::AnyHash
            )
          end

        # When the batch was created.
        sig { returns(String) }
        attr_accessor :created_at

        # When scraping started. `null` if the batch was cancelled before it started.
        sig { returns(T.nilable(String)) }
        attr_accessor :started_at

        # When the batch was created and started.
        sig do
          params(created_at: String, started_at: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # When the batch was created.
          created_at:,
          # When scraping started. `null` if the batch was cancelled before it started.
          started_at:
        )
        end

        sig do
          override.returns(
            { created_at: String, started_at: T.nilable(String) }
          )
        end
        def to_hash
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchCancelResponse::KeyMetadata,
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
