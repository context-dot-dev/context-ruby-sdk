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

      # The crawl controls as submitted, so the limits requested can be compared against
      # what the crawl reached.
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

      # What each page is returned as.
      sig do
        returns(ContextDev::Models::BatchCancelResponse::Format::TaggedSymbol)
      end
      attr_accessor :format_

      # What submission took in, and what it charged for.
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

      # Always `cancelling`. Work already in flight finishes; the batch reaches
      # `cancelled` shortly after.
      sig do
        returns(ContextDev::Models::BatchCancelResponse::Status::TaggedSymbol)
      end
      attr_accessor :status

      # Tags stored on the batch at submission.
      sig { returns(T::Array[String]) }
      attr_accessor :tags

      # There is no finish time yet — the batch is still winding down.
      sig { returns(ContextDev::Models::BatchCancelResponse::Timing) }
      attr_reader :timing

      sig do
        params(
          timing: ContextDev::Models::BatchCancelResponse::Timing::OrHash
        ).void
      end
      attr_writer :timing

      # API key usage for this request.
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
          format_: ContextDev::Models::BatchCancelResponse::Format::OrSymbol,
          input: ContextDev::Intake::OrHash,
          mode: ContextDev::Models::BatchCancelResponse::Mode::OrSymbol,
          page_errors: T::Array[ContextDev::PageErrorCount::OrHash],
          progress: ContextDev::Models::BatchCancelResponse::Progress::OrHash,
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
        # The crawl controls as submitted, so the limits requested can be compared against
        # what the crawl reached.
        crawl:,
        # What this batch cost so far.
        credits:,
        # What each page is returned as.
        format_:,
        # What submission took in, and what it charged for.
        input:,
        # How pages were selected.
        mode:,
        # Page failures so far, grouped by error code and sorted by count.
        page_errors:,
        # How far the batch got before cancellation.
        progress:,
        # Always `cancelling`. Work already in flight finishes; the batch reaches
        # `cancelled` shortly after.
        status:,
        # Tags stored on the batch at submission.
        tags:,
        # There is no finish time yet — the batch is still winding down.
        timing:,
        # API key usage for this request.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            crawl: T.nilable(ContextDev::CrawlControls),
            credits: ContextDev::Models::BatchCancelResponse::Credits,
            format_:
              ContextDev::Models::BatchCancelResponse::Format::TaggedSymbol,
            input: ContextDev::Intake,
            mode: ContextDev::Models::BatchCancelResponse::Mode::TaggedSymbol,
            page_errors: T::Array[ContextDev::PageErrorCount],
            progress: ContextDev::Models::BatchCancelResponse::Progress,
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

        # Credits debited at submission. The unspent remainder is refunded once the batch
        # settles — read `credits.refunded` from GET /batch/{batch_id} then.
        sig { returns(Integer) }
        attr_accessor :reserved

        # What this batch cost so far.
        sig { params(reserved: Integer).returns(T.attached_class) }
        def self.new(
          # Credits debited at submission. The unspent remainder is refunded once the batch
          # settles — read `credits.refunded` from GET /batch/{batch_id} then.
          reserved:
        )
        end

        sig { override.returns({ reserved: Integer }) }
        def to_hash
        end
      end

      # What each page is returned as.
      module Format
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::BatchCancelResponse::Format)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MARKDOWN =
          T.let(
            :markdown,
            ContextDev::Models::BatchCancelResponse::Format::TaggedSymbol
          )
        HTML =
          T.let(
            :html,
            ContextDev::Models::BatchCancelResponse::Format::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchCancelResponse::Format::TaggedSymbol
            ]
          )
        end
        def self.values
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

        # Reserved pages that will now be skipped, and refunded when the batch settles.
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
          # Reserved pages that will now be skipped, and refunded when the batch settles.
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

        # There is no finish time yet — the batch is still winding down.
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

        # The number of credits consumed by this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # The number of credits remaining for your organization after this request.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # API key usage for this request.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # The number of credits consumed by this request.
          credits_consumed:,
          # The number of credits remaining for your organization after this request.
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
