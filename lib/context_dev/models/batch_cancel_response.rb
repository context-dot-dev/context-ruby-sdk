# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#cancel
    class BatchCancelResponse < ContextDev::Internal::Type::BaseModel
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
      #   What this batch cost so far.
      #
      #   @return [ContextDev::Models::BatchCancelResponse::Credits]
      required :credits, -> { ContextDev::Models::BatchCancelResponse::Credits }

      # @!attribute format_
      #   What each page is returned as.
      #
      #   @return [Symbol, ContextDev::Models::BatchCancelResponse::Format]
      required :format_, enum: -> { ContextDev::Models::BatchCancelResponse::Format }, api_name: :format

      # @!attribute input
      #   What the submission accepted.
      #
      #   @return [ContextDev::Models::Intake]
      required :input, -> { ContextDev::Intake }

      # @!attribute mode
      #   How pages were selected.
      #
      #   @return [Symbol, ContextDev::Models::BatchCancelResponse::Mode]
      required :mode, enum: -> { ContextDev::Models::BatchCancelResponse::Mode }

      # @!attribute page_errors
      #   Page failures so far, grouped by error code and sorted by count.
      #
      #   @return [Array<ContextDev::Models::PageErrorCount>]
      required :page_errors, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::PageErrorCount] }

      # @!attribute progress
      #   How far the batch got before cancellation.
      #
      #   @return [ContextDev::Models::BatchCancelResponse::Progress]
      required :progress, -> { ContextDev::Models::BatchCancelResponse::Progress }

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute status
      #   Always `cancelling`. Work already in flight finishes; the batch reaches
      #   `cancelled` shortly after.
      #
      #   @return [Symbol, ContextDev::Models::BatchCancelResponse::Status]
      required :status, enum: -> { ContextDev::Models::BatchCancelResponse::Status }

      # @!attribute tags
      #   Tags stored on the batch at submission.
      #
      #   @return [Array<String>]
      required :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timing
      #   Batch timestamps.
      #
      #   @return [ContextDev::Models::BatchCancelResponse::Timing]
      required :timing, -> { ContextDev::Models::BatchCancelResponse::Timing }

      # @!attribute key_metadata
      #   API key usage for this request.
      #
      #   @return [ContextDev::Models::BatchCancelResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BatchCancelResponse::KeyMetadata }

      # @!method initialize(id:, crawl:, credits:, format_:, input:, mode:, page_errors:, progress:, request_id:, status:, tags:, timing:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchCancelResponse} for more details.
      #
      #   @param id [String] Batch ID.
      #
      #   @param crawl [ContextDev::Models::CrawlControls, nil] Crawl settings as submitted.
      #
      #   @param credits [ContextDev::Models::BatchCancelResponse::Credits] What this batch cost so far.
      #
      #   @param format_ [Symbol, ContextDev::Models::BatchCancelResponse::Format] What each page is returned as.
      #
      #   @param input [ContextDev::Models::Intake] What the submission accepted.
      #
      #   @param mode [Symbol, ContextDev::Models::BatchCancelResponse::Mode] How pages were selected.
      #
      #   @param page_errors [Array<ContextDev::Models::PageErrorCount>] Page failures so far, grouped by error code and sorted by count.
      #
      #   @param progress [ContextDev::Models::BatchCancelResponse::Progress] How far the batch got before cancellation.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param status [Symbol, ContextDev::Models::BatchCancelResponse::Status] Always `cancelling`. Work already in flight finishes; the batch reaches `cancell
      #
      #   @param tags [Array<String>] Tags stored on the batch at submission.
      #
      #   @param timing [ContextDev::Models::BatchCancelResponse::Timing] Batch timestamps.
      #
      #   @param key_metadata [ContextDev::Models::BatchCancelResponse::KeyMetadata] API key usage for this request.

      # @see ContextDev::Models::BatchCancelResponse#credits
      class Credits < ContextDev::Internal::Type::BaseModel
        # @!attribute reserved
        #   Credits held at submission; unused credits are refunded when the batch settles.
        #
        #   @return [Integer]
        required :reserved, Integer

        # @!method initialize(reserved:)
        #   What this batch cost so far.
        #
        #   @param reserved [Integer] Credits held at submission; unused credits are refunded when the batch settles.
      end

      # What each page is returned as.
      #
      # @see ContextDev::Models::BatchCancelResponse#format_
      module Format
        extend ContextDev::Internal::Type::Enum

        MARKDOWN = :markdown
        HTML = :html

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # How pages were selected.
      #
      # @see ContextDev::Models::BatchCancelResponse#mode
      module Mode
        extend ContextDev::Internal::Type::Enum

        SCRAPE = :scrape
        CRAWL = :crawl

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::BatchCancelResponse#progress
      class Progress < ContextDev::Internal::Type::BaseModel
        # @!attribute failed
        #   Pages that could not be scraped before the request landed.
        #
        #   @return [Integer]
        required :failed, Integer

        # @!attribute pending
        #   Pages that will be skipped.
        #
        #   @return [Integer]
        required :pending, Integer

        # @!attribute succeeded
        #   Pages scraped successfully before the request landed.
        #
        #   @return [Integer]
        required :succeeded, Integer

        # @!method initialize(failed:, pending:, succeeded:)
        #   How far the batch got before cancellation.
        #
        #   @param failed [Integer] Pages that could not be scraped before the request landed.
        #
        #   @param pending [Integer] Pages that will be skipped.
        #
        #   @param succeeded [Integer] Pages scraped successfully before the request landed.
      end

      # Always `cancelling`. Work already in flight finishes; the batch reaches
      # `cancelled` shortly after.
      #
      # @see ContextDev::Models::BatchCancelResponse#status
      module Status
        extend ContextDev::Internal::Type::Enum

        CANCELLING = :cancelling

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::BatchCancelResponse#timing
      class Timing < ContextDev::Internal::Type::BaseModel
        # @!attribute created_at
        #   When the batch was created.
        #
        #   @return [String]
        required :created_at, String

        # @!attribute started_at
        #   When processing started. Null if it was cancelled while still queued.
        #
        #   @return [String, nil]
        required :started_at, String, nil?: true

        # @!method initialize(created_at:, started_at:)
        #   Batch timestamps.
        #
        #   @param created_at [String] When the batch was created.
        #
        #   @param started_at [String, nil] When processing started. Null if it was cancelled while still queued.
      end

      # @see ContextDev::Models::BatchCancelResponse#key_metadata
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
        #   API key usage for this request.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits remaining for your organization.
      end
    end
  end
end
