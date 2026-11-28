# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#cancel
    class BatchCancelResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute id
      #   Unique ID of the batch.
      #
      #   @return [String]
      required :id, String

      # @!attribute crawl
      #   Crawl settings as submitted.
      #
      #   @return [ContextDev::Models::CrawlControls, nil]
      required :crawl, -> { ContextDev::CrawlControls }, nil?: true

      # @!attribute credits
      #   Credits reserved for the batch.
      #
      #   @return [ContextDev::Models::BatchCancelResponse::Credits]
      required :credits, -> { ContextDev::Models::BatchCancelResponse::Credits }

      # @!attribute formats
      #   Formats requested for each page, as submitted in `input.data.formats`.
      #
      #   @return [ContextDev::Models::BatchCancelResponse::Formats]
      required :formats, -> { ContextDev::Models::BatchCancelResponse::Formats }

      # @!attribute input
      #   Page counts from your submission.
      #
      #   @return [ContextDev::Models::Intake]
      required :input, -> { ContextDev::Intake }

      # @!attribute mode
      #   `scrape` for a URL list, `crawl` for a site crawl.
      #
      #   @return [Symbol, ContextDev::Models::BatchCancelResponse::Mode]
      required :mode, enum: -> { ContextDev::Models::BatchCancelResponse::Mode }

      # @!attribute page_errors
      #   Page failures so far, grouped by error code, most common first.
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
      #   Always `cancelling`. Pages in progress finish, then the batch becomes
      #   `cancelled`.
      #
      #   @return [Symbol, ContextDev::Models::BatchCancelResponse::Status]
      required :status, enum: -> { ContextDev::Models::BatchCancelResponse::Status }

      # @!attribute tags
      #   Tags set when the batch was submitted.
      #
      #   @return [Array<String>]
      required :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timing
      #   When the batch was created and started.
      #
      #   @return [ContextDev::Models::BatchCancelResponse::Timing]
      required :timing, -> { ContextDev::Models::BatchCancelResponse::Timing }

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::BatchCancelResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BatchCancelResponse::KeyMetadata }

      # @!method initialize(id:, crawl:, credits:, formats:, input:, mode:, page_errors:, progress:, request_id:, status:, tags:, timing:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchCancelResponse} for more details.
      #
      #   @param id [String] Unique ID of the batch.
      #
      #   @param crawl [ContextDev::Models::CrawlControls, nil] Crawl settings as submitted.
      #
      #   @param credits [ContextDev::Models::BatchCancelResponse::Credits] Credits reserved for the batch.
      #
      #   @param formats [ContextDev::Models::BatchCancelResponse::Formats] Formats requested for each page, as submitted in `input.data.formats`.
      #
      #   @param input [ContextDev::Models::Intake] Page counts from your submission.
      #
      #   @param mode [Symbol, ContextDev::Models::BatchCancelResponse::Mode] `scrape` for a URL list, `crawl` for a site crawl.
      #
      #   @param page_errors [Array<ContextDev::Models::PageErrorCount>] Page failures so far, grouped by error code, most common first.
      #
      #   @param progress [ContextDev::Models::BatchCancelResponse::Progress] How far the batch got before cancellation.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param status [Symbol, ContextDev::Models::BatchCancelResponse::Status] Always `cancelling`. Pages in progress finish, then the batch becomes `cancelled
      #
      #   @param tags [Array<String>] Tags set when the batch was submitted.
      #
      #   @param timing [ContextDev::Models::BatchCancelResponse::Timing] When the batch was created and started.
      #
      #   @param key_metadata [ContextDev::Models::BatchCancelResponse::KeyMetadata] Credits this request used and your remaining balance.

      # @see ContextDev::Models::BatchCancelResponse#credits
      class Credits < ContextDev::Internal::Type::BaseModel
        # @!attribute reserved
        #   Credits reserved for the batch. Unused credits are refunded once it reaches
        #   `cancelled`.
        #
        #   @return [Integer]
        required :reserved, Integer

        # @!method initialize(reserved:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::BatchCancelResponse::Credits} for more details.
        #
        #   Credits reserved for the batch.
        #
        #   @param reserved [Integer] Credits reserved for the batch. Unused credits are refunded once it reaches `can
      end

      # @see ContextDev::Models::BatchCancelResponse#formats
      class Formats < ContextDev::Internal::Type::BaseModel
        # @!attribute bytes
        #   Return the original HTTP response body.
        #
        #   @return [Boolean, nil]
        optional :bytes, ContextDev::Internal::Type::Boolean

        # @!attribute highlights
        #   Return Markdown excerpts relevant to `highlightsParams.query`.
        #
        #   @return [Boolean, nil]
        optional :highlights, ContextDev::Internal::Type::Boolean

        # @!attribute html
        #   Return the rendered HTML.
        #
        #   @return [Boolean, nil]
        optional :html, ContextDev::Internal::Type::Boolean

        # @!attribute images
        #   Return the images found on the page.
        #
        #   @return [Boolean, nil]
        optional :images, ContextDev::Internal::Type::Boolean

        # @!attribute json
        #   Return an object matching `jsonParams.schema`, extracted from the page text and
        #   embedded data such as JSON-LD, meta tags, and framework state.
        #
        #   @return [Boolean, nil]
        optional :json, ContextDev::Internal::Type::Boolean

        # @!attribute markdown
        #   Return the page content, or a video transcript, as Markdown.
        #
        #   @return [Boolean, nil]
        optional :markdown, ContextDev::Internal::Type::Boolean

        # @!attribute parse
        #   Return fields extracted with custom rules or a prebuilt parser, as `parsed`.
        #
        #   @return [Boolean, nil]
        optional :parse, ContextDev::Internal::Type::Boolean

        # @!attribute product
        #   Return product details such as name, price, and availability.
        #
        #   @return [Boolean, nil]
        optional :product, ContextDev::Internal::Type::Boolean

        # @!attribute screenshot
        #   Return a screenshot of the page.
        #
        #   @return [Boolean, nil]
        optional :screenshot, ContextDev::Internal::Type::Boolean

        # @!method initialize(bytes: nil, highlights: nil, html: nil, images: nil, json: nil, markdown: nil, parse: nil, product: nil, screenshot: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::BatchCancelResponse::Formats} for more details.
        #
        #   Formats requested for each page, as submitted in `input.data.formats`.
        #
        #   @param bytes [Boolean] Return the original HTTP response body.
        #
        #   @param highlights [Boolean] Return Markdown excerpts relevant to `highlightsParams.query`.
        #
        #   @param html [Boolean] Return the rendered HTML.
        #
        #   @param images [Boolean] Return the images found on the page.
        #
        #   @param json [Boolean] Return an object matching `jsonParams.schema`, extracted from the page text and
        #
        #   @param markdown [Boolean] Return the page content, or a video transcript, as Markdown.
        #
        #   @param parse [Boolean] Return fields extracted with custom rules or a prebuilt parser, as `parsed`.
        #
        #   @param product [Boolean] Return product details such as name, price, and availability.
        #
        #   @param screenshot [Boolean] Return a screenshot of the page.
      end

      # `scrape` for a URL list, `crawl` for a site crawl.
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
        #   Pages that could not be scraped before cancellation.
        #
        #   @return [Integer]
        required :failed, Integer

        # @!attribute pending
        #   Pages not yet attempted, which will be skipped.
        #
        #   @return [Integer]
        required :pending, Integer

        # @!attribute succeeded
        #   Pages scraped successfully before cancellation.
        #
        #   @return [Integer]
        required :succeeded, Integer

        # @!method initialize(failed:, pending:, succeeded:)
        #   How far the batch got before cancellation.
        #
        #   @param failed [Integer] Pages that could not be scraped before cancellation.
        #
        #   @param pending [Integer] Pages not yet attempted, which will be skipped.
        #
        #   @param succeeded [Integer] Pages scraped successfully before cancellation.
      end

      # Always `cancelling`. Pages in progress finish, then the batch becomes
      # `cancelled`.
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
        #   When scraping started. `null` if the batch was cancelled before it started.
        #
        #   @return [String, nil]
        required :started_at, String, nil?: true

        # @!method initialize(created_at:, started_at:)
        #   When the batch was created and started.
        #
        #   @param created_at [String] When the batch was created.
        #
        #   @param started_at [String, nil] When scraping started. `null` if the batch was cancelled before it started.
      end

      # @see ContextDev::Models::BatchCancelResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits your organization has left after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits your organization has left after this request.
      end
    end
  end
end
