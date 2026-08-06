# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#list
    class BatchListResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #   Batches on this page.
      #
      #   @return [Array<ContextDev::Models::BatchListResponse::Data>, nil]
      optional :data, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchListResponse::Data] }

      # @!attribute has_more
      #   Whether another page is available.
      #
      #   @return [Boolean, nil]
      optional :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute key_metadata
      #   Metadata about the API key used for the request. Included in every response
      #   whenever a valid API key is provided, even when the response status is not 200.
      #
      #   @return [ContextDev::Models::BatchListResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BatchListResponse::KeyMetadata }

      # @!attribute next_cursor
      #   Cursor for the next page.
      #
      #   @return [String, nil]
      optional :next_cursor, String, nil?: true

      # @!method initialize(data: nil, has_more: nil, key_metadata: nil, next_cursor: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchListResponse} for more details.
      #
      #   @param data [Array<ContextDev::Models::BatchListResponse::Data>] Batches on this page.
      #
      #   @param has_more [Boolean] Whether another page is available.
      #
      #   @param key_metadata [ContextDev::Models::BatchListResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when
      #
      #   @param next_cursor [String, nil] Cursor for the next page.

      class Data < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #   Batch ID used to retrieve or cancel the job.
        #
        #   @return [String]
        required :id, String

        # @!attribute crawl
        #   The crawl controls as submitted, so the limits requested can be compared against
        #   what the crawl reached.
        #
        #   @return [ContextDev::Models::CrawlControls, nil]
        required :crawl, -> { ContextDev::CrawlControls }, nil?: true

        # @!attribute credits
        #   What this batch has done to your credit balance.
        #
        #   @return [ContextDev::Models::BatchListResponse::Data::Credits]
        required :credits, -> { ContextDev::Models::BatchListResponse::Data::Credits }

        # @!attribute failure
        #   A failure of the batch as a whole, distinct from the per-page failures in
        #   `page_errors`.
        #
        #   @return [ContextDev::Models::Failure, nil]
        required :failure, -> { ContextDev::Failure }, nil?: true

        # @!attribute format_
        #   What each page is returned as. Matches `input.data.format` on the submit
        #   request.
        #
        #   @return [Symbol, ContextDev::Models::BatchListResponse::Data::Format]
        required :format_, enum: -> { ContextDev::Models::BatchListResponse::Data::Format }, api_name: :format

        # @!attribute input
        #   What submission took in, and what it charged for.
        #
        #   @return [ContextDev::Models::Intake]
        required :input, -> { ContextDev::Intake }

        # @!attribute mode
        #   How pages were selected. Matches `input.mode` on the submit request.
        #
        #   @return [Symbol, ContextDev::Models::BatchListResponse::Data::Mode]
        required :mode, enum: -> { ContextDev::Models::BatchListResponse::Data::Mode }

        # @!attribute page_errors
        #   Individual page failures grouped by error code, sorted by count. Unrelated to
        #   `failure`, which is the batch itself failing.
        #
        #   @return [Array<ContextDev::Models::PageErrorCount>]
        required :page_errors, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::PageErrorCount] }

        # @!attribute progress
        #   Pages attempted so far. Use `status` to check completion.
        #
        #   @return [ContextDev::Models::BatchListResponse::Data::Progress]
        required :progress, -> { ContextDev::Models::BatchListResponse::Data::Progress }

        # @!attribute results
        #   Download links, available once the batch reaches a final status and null before
        #   then. GET /batch/{batch_id}/results serves the same records as paginated JSON.
        #
        #   @return [ContextDev::Models::BatchListResponse::Data::Results, nil]
        required :results, -> { ContextDev::Models::BatchListResponse::Data::Results }, nil?: true

        # @!attribute status
        #   Current state. `completed`, `cancelled`, and `failed` are final.
        #
        #   @return [Symbol, ContextDev::Models::BatchListResponse::Data::Status]
        required :status, enum: -> { ContextDev::Models::BatchListResponse::Data::Status }

        # @!attribute tags
        #   Tags stored on the batch at submission.
        #
        #   @return [Array<String>]
        required :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute timing
        #
        #   @return [ContextDev::Models::BatchListResponse::Data::Timing]
        required :timing, -> { ContextDev::Models::BatchListResponse::Data::Timing }

        # @!method initialize(id:, crawl:, credits:, failure:, format_:, input:, mode:, page_errors:, progress:, results:, status:, tags:, timing:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::BatchListResponse::Data} for more details.
        #
        #   An asynchronous web scraping job.
        #
        #   @param id [String] Batch ID used to retrieve or cancel the job.
        #
        #   @param crawl [ContextDev::Models::CrawlControls, nil] The crawl controls as submitted, so the limits requested can be compared against
        #
        #   @param credits [ContextDev::Models::BatchListResponse::Data::Credits] What this batch has done to your credit balance.
        #
        #   @param failure [ContextDev::Models::Failure, nil] A failure of the batch as a whole, distinct from the per-page failures in
        #   `page\_
        #
        #   @param format_ [Symbol, ContextDev::Models::BatchListResponse::Data::Format] What each page is returned as. Matches `input.data.format` on the submit request
        #
        #   @param input [ContextDev::Models::Intake] What submission took in, and what it charged for.
        #
        #   @param mode [Symbol, ContextDev::Models::BatchListResponse::Data::Mode] How pages were selected. Matches `input.mode` on the submit request.
        #
        #   @param page_errors [Array<ContextDev::Models::PageErrorCount>] Individual page failures grouped by error code, sorted by count. Unrelated to `f
        #
        #   @param progress [ContextDev::Models::BatchListResponse::Data::Progress] Pages attempted so far. Use `status` to check completion.
        #
        #   @param results [ContextDev::Models::BatchListResponse::Data::Results, nil] Download links, available once the batch reaches a final status and null before
        #
        #   @param status [Symbol, ContextDev::Models::BatchListResponse::Data::Status] Current state. `completed`, `cancelled`, and `failed` are final.
        #
        #   @param tags [Array<String>] Tags stored on the batch at submission.
        #
        #   @param timing [ContextDev::Models::BatchListResponse::Data::Timing]

        # @see ContextDev::Models::BatchListResponse::Data#credits
        class Credits < ContextDev::Internal::Type::BaseModel
          # @!attribute net
          #   `reserved` minus `refunded` plus `ocr_charged` — what the batch has cost so far.
          #   Equal to `reserved` until the batch settles.
          #
          #   @return [Integer]
          required :net, Integer

          # @!attribute ocr_charged
          #   Credits charged for PDF pages recovered by OCR (pdf.ocr=true), 1 per recovered
          #   page, on top of `reserved`. Stays 0 until the batch settles.
          #
          #   @return [Integer]
          required :ocr_charged, Integer

          # @!attribute refunded
          #   Credits returned for pages that did not succeed. Stays 0 until the batch reaches
          #   a final status, then settles in one movement.
          #
          #   @return [Integer]
          required :refunded, Integer

          # @!attribute reserved
          #   Credits debited from your balance the moment the batch was accepted. This is a
          #   charge, not a forecast — the whole amount leaves the balance up front.
          #
          #   @return [Integer]
          required :reserved, Integer

          # @!method initialize(net:, ocr_charged:, refunded:, reserved:)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BatchListResponse::Data::Credits} for more details.
          #
          #   What this batch has done to your credit balance.
          #
          #   @param net [Integer] `reserved` minus `refunded` plus `ocr_charged` — what the batch has cost so far.
          #
          #   @param ocr_charged [Integer] Credits charged for PDF pages recovered by OCR (pdf.ocr=true), 1 per recovered p
          #
          #   @param refunded [Integer] Credits returned for pages that did not succeed. Stays 0 until the batch reaches
          #
          #   @param reserved [Integer] Credits debited from your balance the moment the batch was accepted. This is a c
        end

        # What each page is returned as. Matches `input.data.format` on the submit
        # request.
        #
        # @see ContextDev::Models::BatchListResponse::Data#format_
        module Format
          extend ContextDev::Internal::Type::Enum

          MARKDOWN = :markdown
          HTML = :html

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # How pages were selected. Matches `input.mode` on the submit request.
        #
        # @see ContextDev::Models::BatchListResponse::Data#mode
        module Mode
          extend ContextDev::Internal::Type::Enum

          SCRAPE = :scrape
          CRAWL = :crawl

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::BatchListResponse::Data#progress
        class Progress < ContextDev::Internal::Type::BaseModel
          # @!attribute failed
          #   Pages that could not be scraped.
          #
          #   @return [Integer]
          required :failed, Integer

          # @!attribute pending
          #   Reserved pages not yet attempted. A cancelled batch keeps reporting the URLs it
          #   never reached; a crawl whose `input.reserved_is_ceiling` is true reports 0 once
          #   final, because its unspent budget was never real pages.
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
          #   {ContextDev::Models::BatchListResponse::Data::Progress} for more details.
          #
          #   Pages attempted so far. Use `status` to check completion.
          #
          #   @param failed [Integer] Pages that could not be scraped.
          #
          #   @param pending [Integer] Reserved pages not yet attempted. A cancelled batch keeps reporting the URLs it
          #
          #   @param succeeded [Integer] Pages scraped successfully.
        end

        # @see ContextDev::Models::BatchListResponse::Data#results
        class Results < ContextDev::Internal::Type::BaseModel
          # @!attribute expires_at
          #   When the download URLs expire.
          #
          #   @return [String]
          required :expires_at, String

          # @!attribute files
          #   Result files. Order is not guaranteed.
          #
          #   @return [Array<ContextDev::Models::BatchListResponse::Data::Results::File>]
          required :files,
                   -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchListResponse::Data::Results::File] }

          # @!method initialize(expires_at:, files:)
          #   Download links, available once the batch reaches a final status and null before
          #   then. GET /batch/{batch_id}/results serves the same records as paginated JSON.
          #
          #   @param expires_at [String] When the download URLs expire.
          #
          #   @param files [Array<ContextDev::Models::BatchListResponse::Data::Results::File>] Result files. Order is not guaranteed.

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
        # @see ContextDev::Models::BatchListResponse::Data#status
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

        # @see ContextDev::Models::BatchListResponse::Data#timing
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
      end

      # @see ContextDev::Models::BatchListResponse#key_metadata
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
        #   Metadata about the API key used for the request. Included in every response
        #   whenever a valid API key is provided, even when the response status is not 200.
        #
        #   @param credits_consumed [Integer] The number of credits consumed by this request.
        #
        #   @param credits_remaining [Integer] The number of credits remaining for your organization after this request.
      end
    end
  end
end
