# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#list
    class BatchListResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

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
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::BatchListResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BatchListResponse::KeyMetadata }

      # @!attribute next_cursor
      #   Cursor for the next page.
      #
      #   @return [String, nil]
      optional :next_cursor, String, nil?: true

      # @!method initialize(request_id:, data: nil, has_more: nil, key_metadata: nil, next_cursor: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchListResponse} for more details.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param data [Array<ContextDev::Models::BatchListResponse::Data>] Batches on this page.
      #
      #   @param has_more [Boolean] Whether another page is available.
      #
      #   @param key_metadata [ContextDev::Models::BatchListResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param next_cursor [String, nil] Cursor for the next page.

      class Data < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #   Batch ID.
        #
        #   @return [String]
        required :id, String

        # @!attribute crawl
        #   Crawl settings as submitted.
        #
        #   @return [ContextDev::Models::CrawlControls, nil]
        required :crawl, -> { ContextDev::CrawlControls }, nil?: true

        # @!attribute credits
        #   Batch credit usage and settlement.
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
        #   What the submission accepted.
        #
        #   @return [ContextDev::Models::Intake]
        required :input, -> { ContextDev::Intake }

        # @!attribute mode
        #   `scrape` (URL list) or `crawl`.
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
        #   Result download links; null until the batch finishes. Files are deleted 180 days
        #   after the batch finishes.
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
        #   @param id [String] Batch ID.
        #
        #   @param crawl [ContextDev::Models::CrawlControls, nil] Crawl settings as submitted.
        #
        #   @param credits [ContextDev::Models::BatchListResponse::Data::Credits] Batch credit usage and settlement.
        #
        #   @param failure [ContextDev::Models::Failure, nil] A failure of the batch as a whole, distinct from the per-page failures in
        #   `page\_
        #
        #   @param format_ [Symbol, ContextDev::Models::BatchListResponse::Data::Format] What each page is returned as. Matches `input.data.format` on the submit request
        #
        #   @param input [ContextDev::Models::Intake] What the submission accepted.
        #
        #   @param mode [Symbol, ContextDev::Models::BatchListResponse::Data::Mode] `scrape` (URL list) or `crawl`.
        #
        #   @param page_errors [Array<ContextDev::Models::PageErrorCount>] Individual page failures grouped by error code, sorted by count. Unrelated to `f
        #
        #   @param progress [ContextDev::Models::BatchListResponse::Data::Progress] Pages attempted so far. Use `status` to check completion.
        #
        #   @param results [ContextDev::Models::BatchListResponse::Data::Results, nil] Result download links; null until the batch finishes. Files are deleted 180 days
        #
        #   @param status [Symbol, ContextDev::Models::BatchListResponse::Data::Status] Current state. `completed`, `cancelled`, and `failed` are final.
        #
        #   @param tags [Array<String>] Tags stored on the batch at submission.
        #
        #   @param timing [ContextDev::Models::BatchListResponse::Data::Timing]

        # @see ContextDev::Models::BatchListResponse::Data#credits
        class Credits < ContextDev::Internal::Type::BaseModel
          # @!attribute net
          #   `reserved` minus `refunded` plus `ocr_charged`.
          #
          #   @return [Integer]
          required :net, Integer

          # @!attribute ocr_charged
          #   OCR usage charged when the batch settles.
          #
          #   @return [Integer]
          required :ocr_charged, Integer

          # @!attribute refunded
          #   Credits returned for unsuccessful pages when the batch settles.
          #
          #   @return [Integer]
          required :refunded, Integer

          # @!attribute reserved
          #   Credits held when the batch was accepted.
          #
          #   @return [Integer]
          required :reserved, Integer

          # @!method initialize(net:, ocr_charged:, refunded:, reserved:)
          #   Batch credit usage and settlement.
          #
          #   @param net [Integer] `reserved` minus `refunded` plus `ocr_charged`.
          #
          #   @param ocr_charged [Integer] OCR usage charged when the batch settles.
          #
          #   @param refunded [Integer] Credits returned for unsuccessful pages when the batch settles.
          #
          #   @param reserved [Integer] Credits held when the batch was accepted.
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

        # `scrape` (URL list) or `crawl`.
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
          #   Accepted pages not yet attempted. Unused crawl capacity is excluded after
          #   completion.
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
          #   @param pending [Integer] Accepted pages not yet attempted. Unused crawl capacity is excluded after comple
          #
          #   @param succeeded [Integer] Pages scraped successfully.
        end

        # @see ContextDev::Models::BatchListResponse::Data#results
        class Results < ContextDev::Internal::Type::BaseModel
          # @!attribute expires_at
          #   When these links expire (24 hours after this response).
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
          #   Result download links; null until the batch finishes. Files are deleted 180 days
          #   after the batch finishes.
          #
          #   @param expires_at [String] When these links expire (24 hours after this response).
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
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits remaining for your organization.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits remaining for your organization.
      end
    end
  end
end
