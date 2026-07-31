# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#retrieve
    class BatchRetrieveResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute id
      #   Batch ID used to retrieve or cancel the job.
      #
      #   @return [String]
      required :id, String

      # @!attribute credits
      #   Reserved and used credits.
      #
      #   @return [ContextDev::Models::BatchRetrieveResponse::Credits]
      required :credits, -> { ContextDev::Models::BatchRetrieveResponse::Credits }

      # @!attribute error
      #   Why the batch failed.
      #
      #   @return [ContextDev::Models::Error, nil]
      required :error, -> { ContextDev::Error }, nil?: true

      # @!attribute errors
      #   Page failures grouped by error code.
      #
      #   @return [Array<ContextDev::Models::ErrorCount>]
      required :errors, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::ErrorCount] }

      # @!attribute input
      #   Submission counts.
      #
      #   @return [ContextDev::Models::BatchRetrieveResponse::Input]
      required :input, -> { ContextDev::Models::BatchRetrieveResponse::Input }

      # @!attribute invalid_urls
      #   Rejected URLs, up to 100. These are not charged.
      #
      #   @return [Array<ContextDev::Models::BatchRetrieveResponse::InvalidURL>]
      required :invalid_urls,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchRetrieveResponse::InvalidURL] }

      # @!attribute mode
      #   How pages are selected.
      #
      #   @return [Symbol, ContextDev::Models::BatchRetrieveResponse::Mode]
      required :mode, enum: -> { ContextDev::Models::BatchRetrieveResponse::Mode }

      # @!attribute progress
      #   Current processing counts. Use `status` to check completion.
      #
      #   @return [ContextDev::Models::BatchRetrieveResponse::Progress]
      required :progress, -> { ContextDev::Models::BatchRetrieveResponse::Progress }

      # @!attribute results
      #   Download links available when the batch finishes. GET /batch/{batch_id}/results
      #   serves the same records as paginated JSON.
      #
      #   @return [ContextDev::Models::BatchRetrieveResponse::Results, nil]
      required :results, -> { ContextDev::Models::BatchRetrieveResponse::Results }, nil?: true

      # @!attribute status
      #   Current state. `completed`, `cancelled`, and `failed` are final.
      #
      #   @return [Symbol, ContextDev::Models::BatchRetrieveResponse::Status]
      required :status, enum: -> { ContextDev::Models::BatchRetrieveResponse::Status }

      # @!attribute tags
      #   Tags stored on the batch at submission.
      #
      #   @return [Array<String>]
      required :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timing
      #
      #   @return [ContextDev::Models::BatchRetrieveResponse::Timing]
      required :timing, -> { ContextDev::Models::BatchRetrieveResponse::Timing }

      # @!attribute type
      #   Output format.
      #
      #   @return [Symbol, ContextDev::Models::BatchRetrieveResponse::Type]
      required :type, enum: -> { ContextDev::Models::BatchRetrieveResponse::Type }

      # @!attribute key_metadata
      #   API key usage for this request.
      #
      #   @return [ContextDev::Models::BatchRetrieveResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BatchRetrieveResponse::KeyMetadata }

      # @!attribute webhook_secret
      #   Webhook signing secret. Also returned by GET /batch/{batch_id}.
      #
      #   @return [String, nil]
      optional :webhook_secret, String

      # @!method initialize(id:, credits:, error:, errors:, input:, invalid_urls:, mode:, progress:, results:, status:, tags:, timing:, type:, key_metadata: nil, webhook_secret: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchRetrieveResponse} for more details.
      #
      #   @param id [String] Batch ID used to retrieve or cancel the job.
      #
      #   @param credits [ContextDev::Models::BatchRetrieveResponse::Credits] Reserved and used credits.
      #
      #   @param error [ContextDev::Models::Error, nil] Why the batch failed.
      #
      #   @param errors [Array<ContextDev::Models::ErrorCount>] Page failures grouped by error code.
      #
      #   @param input [ContextDev::Models::BatchRetrieveResponse::Input] Submission counts.
      #
      #   @param invalid_urls [Array<ContextDev::Models::BatchRetrieveResponse::InvalidURL>] Rejected URLs, up to 100. These are not charged.
      #
      #   @param mode [Symbol, ContextDev::Models::BatchRetrieveResponse::Mode] How pages are selected.
      #
      #   @param progress [ContextDev::Models::BatchRetrieveResponse::Progress] Current processing counts. Use `status` to check completion.
      #
      #   @param results [ContextDev::Models::BatchRetrieveResponse::Results, nil] Download links available when the batch finishes. GET /batch/{batch_id}/results
      #
      #   @param status [Symbol, ContextDev::Models::BatchRetrieveResponse::Status] Current state. `completed`, `cancelled`, and `failed` are final.
      #
      #   @param tags [Array<String>] Tags stored on the batch at submission.
      #
      #   @param timing [ContextDev::Models::BatchRetrieveResponse::Timing]
      #
      #   @param type [Symbol, ContextDev::Models::BatchRetrieveResponse::Type] Output format.
      #
      #   @param key_metadata [ContextDev::Models::BatchRetrieveResponse::KeyMetadata] API key usage for this request.
      #
      #   @param webhook_secret [String] Webhook signing secret. Also returned by GET /batch/{batch_id}.

      # @see ContextDev::Models::BatchRetrieveResponse#credits
      class Credits < ContextDev::Internal::Type::BaseModel
        # @!attribute charged
        #   Credits used by successful pages.
        #
        #   @return [Integer]
        required :charged, Integer

        # @!attribute estimated
        #   Credits reserved when the batch was accepted.
        #
        #   @return [Integer]
        required :estimated, Integer

        # @!method initialize(charged:, estimated:)
        #   Reserved and used credits.
        #
        #   @param charged [Integer] Credits used by successful pages.
        #
        #   @param estimated [Integer] Credits reserved when the batch was accepted.
      end

      # @see ContextDev::Models::BatchRetrieveResponse#input
      class Input < ContextDev::Internal::Type::BaseModel
        # @!attribute accepted
        #   Pages accepted, or the crawl page limit. Credits are reserved for this count.
        #
        #   @return [Integer]
        required :accepted, Integer

        # @!attribute duplicates
        #   Duplicate URL and `itemId` pairs skipped. Always 0 for crawls.
        #
        #   @return [Integer]
        required :duplicates, Integer

        # @!attribute invalid
        #   Pages rejected during validation.
        #
        #   @return [Integer]
        required :invalid, Integer

        # @!attribute submitted
        #   Pages submitted before validation. For a crawl, the page limit.
        #
        #   @return [Integer]
        required :submitted, Integer

        # @!method initialize(accepted:, duplicates:, invalid:, submitted:)
        #   Submission counts.
        #
        #   @param accepted [Integer] Pages accepted, or the crawl page limit. Credits are reserved for this count.
        #
        #   @param duplicates [Integer] Duplicate URL and `itemId` pairs skipped. Always 0 for crawls.
        #
        #   @param invalid [Integer] Pages rejected during validation.
        #
        #   @param submitted [Integer] Pages submitted before validation. For a crawl, the page limit.
      end

      class InvalidURL < ContextDev::Internal::Type::BaseModel
        # @!attribute reason
        #   Why it was rejected.
        #
        #   @return [String]
        required :reason, String

        # @!attribute url
        #   Rejected URL.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(reason:, url:)
        #   @param reason [String] Why it was rejected.
        #
        #   @param url [String] Rejected URL.
      end

      # How pages are selected.
      #
      # @see ContextDev::Models::BatchRetrieveResponse#mode
      module Mode
        extend ContextDev::Internal::Type::Enum

        SCRAPE = :scrape
        CRAWL = :crawl

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::BatchRetrieveResponse#progress
      class Progress < ContextDev::Internal::Type::BaseModel
        # @!attribute failed
        #   Pages that could not be scraped.
        #
        #   @return [Integer]
        required :failed, Integer

        # @!attribute pending
        #   Accepted pages not yet attempted. Always 0 once the batch completes; a crawl can
        #   finish under its page limit when the site has no more reachable pages.
        #
        #   @return [Integer]
        required :pending, Integer

        # @!attribute succeeded
        #   Pages scraped successfully.
        #
        #   @return [Integer]
        required :succeeded, Integer

        # @!method initialize(failed:, pending:, succeeded:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::BatchRetrieveResponse::Progress} for more details.
        #
        #   Current processing counts. Use `status` to check completion.
        #
        #   @param failed [Integer] Pages that could not be scraped.
        #
        #   @param pending [Integer] Accepted pages not yet attempted. Always 0 once the batch completes; a crawl can
        #
        #   @param succeeded [Integer] Pages scraped successfully.
      end

      # @see ContextDev::Models::BatchRetrieveResponse#results
      class Results < ContextDev::Internal::Type::BaseModel
        # @!attribute expires_at
        #   When the download URLs expire.
        #
        #   @return [String]
        required :expires_at, String

        # @!attribute files
        #   Result files. Order is not guaranteed.
        #
        #   @return [Array<ContextDev::Models::BatchRetrieveResponse::Results::File>]
        required :files,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchRetrieveResponse::Results::File] }

        # @!method initialize(expires_at:, files:)
        #   Download links available when the batch finishes. GET /batch/{batch_id}/results
        #   serves the same records as paginated JSON.
        #
        #   @param expires_at [String] When the download URLs expire.
        #
        #   @param files [Array<ContextDev::Models::BatchRetrieveResponse::Results::File>] Result files. Order is not guaranteed.

        class File < ContextDev::Internal::Type::BaseModel
          # @!attribute bytes
          #   Compressed file size in bytes.
          #
          #   @return [Integer]
          required :bytes, Integer

          # @!attribute items
          #   Results in this file.
          #
          #   @return [Integer]
          required :items, Integer

          # @!attribute url
          #   Temporary URL for a gzipped NDJSON file.
          #
          #   @return [String]
          required :url, String

          # @!method initialize(bytes:, items:, url:)
          #   @param bytes [Integer] Compressed file size in bytes.
          #
          #   @param items [Integer] Results in this file.
          #
          #   @param url [String] Temporary URL for a gzipped NDJSON file.
        end
      end

      # Current state. `completed`, `cancelled`, and `failed` are final.
      #
      # @see ContextDev::Models::BatchRetrieveResponse#status
      module Status
        extend ContextDev::Internal::Type::Enum

        QUEUED = :queued
        RUNNING = :running
        CANCELLING = :cancelling
        COMPLETED = :completed
        CANCELLED = :cancelled
        FAILED = :failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::BatchRetrieveResponse#timing
      class Timing < ContextDev::Internal::Type::BaseModel
        # @!attribute completed_at
        #   When processing finished. Null while active.
        #
        #   @return [String, nil]
        required :completed_at, String, nil?: true

        # @!attribute created_at
        #   When the batch was created.
        #
        #   @return [String]
        required :created_at, String

        # @!attribute started_at
        #   When processing started. Null while queued.
        #
        #   @return [String, nil]
        required :started_at, String, nil?: true

        # @!method initialize(completed_at:, created_at:, started_at:)
        #   @param completed_at [String, nil] When processing finished. Null while active.
        #
        #   @param created_at [String] When the batch was created.
        #
        #   @param started_at [String, nil] When processing started. Null while queued.
      end

      # Output format.
      #
      # @see ContextDev::Models::BatchRetrieveResponse#type
      module Type
        extend ContextDev::Internal::Type::Enum

        MARKDOWN = :markdown
        HTML = :html

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::BatchRetrieveResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   The number of credits consumed by this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   The number of credits remaining for your organization after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   API key usage for this request.
        #
        #   @param credits_consumed [Integer] The number of credits consumed by this request.
        #
        #   @param credits_remaining [Integer] The number of credits remaining for your organization after this request.
      end
    end
  end
end
