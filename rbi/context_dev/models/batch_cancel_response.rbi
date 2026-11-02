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

      # Batch ID.
      sig { returns(String) }
      attr_accessor :id

      # Crawl settings as submitted.
      sig { returns(T.nilable(ContextDev::CrawlControls)) }
      attr_reader :crawl

      sig { params(crawl: T.nilable(ContextDev::CrawlControls::OrHash)).void }
      attr_writer :crawl

      # What this batch cost so far.
      sig { returns(ContextDev::Models::BatchCancelResponse::Credits) }
      attr_reader :credits

      sig do
        params(
          credits: ContextDev::Models::BatchCancelResponse::Credits::OrHash
        ).void
      end
      attr_writer :credits

      # Outputs requested for each page. Matches input.data.formats on submission.
      sig { returns(ContextDev::Models::BatchCancelResponse::Formats) }
      attr_reader :formats

      sig do
        params(
          formats: ContextDev::Models::BatchCancelResponse::Formats::OrHash
        ).void
      end
      attr_writer :formats

      # What the submission accepted.
      sig { returns(ContextDev::Intake) }
      attr_reader :input

      sig { params(input: ContextDev::Intake::OrHash).void }
      attr_writer :input

      # How pages were selected.
      sig do
        returns(ContextDev::Models::BatchCancelResponse::Mode::TaggedSymbol)
      end
      attr_accessor :mode

      # Page failures so far, grouped by error code and sorted by count.
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

      # Always `cancelling`. Work already in flight finishes; the batch reaches
      # `cancelled` shortly after.
      sig do
        returns(ContextDev::Models::BatchCancelResponse::Status::TaggedSymbol)
      end
      attr_accessor :status

      # Tags stored on the batch at submission.
      sig { returns(T::Array[String]) }
      attr_accessor :tags

      # Batch timestamps.
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
        # Batch ID.
        id:,
        # Crawl settings as submitted.
        crawl:,
        # What this batch cost so far.
        credits:,
        # Outputs requested for each page. Matches input.data.formats on submission.
        formats:,
        # What the submission accepted.
        input:,
        # How pages were selected.
        mode:,
        # Page failures so far, grouped by error code and sorted by count.
        page_errors:,
        # How far the batch got before cancellation.
        progress:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Always `cancelling`. Work already in flight finishes; the batch reaches
        # `cancelled` shortly after.
        status:,
        # Tags stored on the batch at submission.
        tags:,
        # Batch timestamps.
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

        # Credits held at submission; unused credits are refunded when the batch settles.
        sig { returns(Integer) }
        attr_accessor :reserved

        # What this batch cost so far.
        sig { params(reserved: Integer).returns(T.attached_class) }
        def self.new(
          # Credits held at submission; unused credits are refunded when the batch settles.
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

      # How pages were selected.
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

        # Pages that could not be scraped before the request landed.
        sig { returns(Integer) }
        attr_accessor :failed

        # Pages that will be skipped.
        sig { returns(Integer) }
        attr_accessor :pending

        # Pages scraped successfully before the request landed.
        sig { returns(Integer) }
        attr_accessor :succeeded

        # How far the batch got before cancellation.
        sig do
          params(failed: Integer, pending: Integer, succeeded: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Pages that could not be scraped before the request landed.
          failed:,
          # Pages that will be skipped.
          pending:,
          # Pages scraped successfully before the request landed.
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

      # Always `cancelling`. Work already in flight finishes; the batch reaches
      # `cancelled` shortly after.
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

        # When processing started. Null if it was cancelled while still queued.
        sig { returns(T.nilable(String)) }
        attr_accessor :started_at

        # Batch timestamps.
        sig do
          params(created_at: String, started_at: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # When the batch was created.
          created_at:,
          # When processing started. Null if it was cancelled while still queued.
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
