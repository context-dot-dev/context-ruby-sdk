# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#retrieve
    class BatchRetrieveResponse < ContextDev::Internal::Type::BaseModel
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
      #   Credits reserved, refunded, and charged for the batch.
      #
      #   @return [ContextDev::Models::BatchRetrieveResponse::Credits]
      required :credits, -> { ContextDev::Models::BatchRetrieveResponse::Credits }

      # @!attribute failure
      #   Why the batch as a whole failed. Individual page failures are counted in
      #   `page_errors`.
      #
      #   @return [ContextDev::Models::Failure, nil]
      required :failure, -> { ContextDev::Failure }, nil?: true

      # @!attribute formats
      #   Formats requested for each page, as submitted in `input.data.formats`.
      #
      #   @return [ContextDev::Models::BatchRetrieveResponse::Formats]
      required :formats, -> { ContextDev::Models::BatchRetrieveResponse::Formats }

      # @!attribute input
      #   Page counts from your submission.
      #
      #   @return [ContextDev::Models::Intake]
      required :input, -> { ContextDev::Intake }

      # @!attribute invalid_urls
      #   URLs rejected from your list, up to the first 100.
      #
      #   @return [Array<ContextDev::Models::BatchRetrieveResponse::InvalidURL>]
      required :invalid_urls,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchRetrieveResponse::InvalidURL] }

      # @!attribute mode
      #   `scrape` for a URL list, `crawl` for a site crawl.
      #
      #   @return [Symbol, ContextDev::Models::BatchRetrieveResponse::Mode]
      required :mode, enum: -> { ContextDev::Models::BatchRetrieveResponse::Mode }

      # @!attribute page_errors
      #   Page failures grouped by error code, most common first. For the batch itself
      #   failing, see `failure`.
      #
      #   @return [Array<ContextDev::Models::PageErrorCount>]
      required :page_errors, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::PageErrorCount] }

      # @!attribute progress
      #   Page counts so far. Check `status` to know when the batch is done.
      #
      #   @return [ContextDev::Models::BatchRetrieveResponse::Progress]
      required :progress, -> { ContextDev::Models::BatchRetrieveResponse::Progress }

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute results
      #   Links to download the results. `null` until the batch finishes; the files are
      #   deleted 180 days after that.
      #
      #   @return [ContextDev::Models::BatchRetrieveResponse::Results, nil]
      required :results, -> { ContextDev::Models::BatchRetrieveResponse::Results }, nil?: true

      # @!attribute status
      #   Current state. `pending` batches are being validated or are waiting for a slot
      #   under your plan's concurrent batch limit, `queued` batches are ready to start,
      #   and `running` batches are scraping. `completed`, `cancelled`, and `failed` are
      #   final.
      #
      #   @return [Symbol, ContextDev::Models::BatchRetrieveResponse::Status]
      required :status, enum: -> { ContextDev::Models::BatchRetrieveResponse::Status }

      # @!attribute tags
      #   Tags set when the batch was submitted.
      #
      #   @return [Array<String>]
      required :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timing
      #   When the batch was created, started, and finished.
      #
      #   @return [ContextDev::Models::BatchRetrieveResponse::Timing]
      required :timing, -> { ContextDev::Models::BatchRetrieveResponse::Timing }

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::BatchRetrieveResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BatchRetrieveResponse::KeyMetadata }

      # @!attribute policies
      #   Access policy IDs applied to every page.
      #
      #   @return [Array<String>, nil]
      optional :policies, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute webhook_delivery_id
      #   ID of the batch's final-status webhook delivery, for
      #   `GET /webhooks/deliveries/{delivery_id}`. Omitted until a delivery exists.
      #
      #   @return [String, nil]
      optional :webhook_delivery_id, String

      # @!method initialize(id:, crawl:, credits:, failure:, formats:, input:, invalid_urls:, mode:, page_errors:, progress:, request_id:, results:, status:, tags:, timing:, key_metadata: nil, policies: nil, webhook_delivery_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchRetrieveResponse} for more details.
      #
      #   @param id [String] Unique ID of the batch.
      #
      #   @param crawl [ContextDev::Models::CrawlControls, nil] Crawl settings as submitted.
      #
      #   @param credits [ContextDev::Models::BatchRetrieveResponse::Credits] Credits reserved, refunded, and charged for the batch.
      #
      #   @param failure [ContextDev::Models::Failure, nil] Why the batch as a whole failed. Individual page failures are counted in `page_e
      #
      #   @param formats [ContextDev::Models::BatchRetrieveResponse::Formats] Formats requested for each page, as submitted in `input.data.formats`.
      #
      #   @param input [ContextDev::Models::Intake] Page counts from your submission.
      #
      #   @param invalid_urls [Array<ContextDev::Models::BatchRetrieveResponse::InvalidURL>] URLs rejected from your list, up to the first 100.
      #
      #   @param mode [Symbol, ContextDev::Models::BatchRetrieveResponse::Mode] `scrape` for a URL list, `crawl` for a site crawl.
      #
      #   @param page_errors [Array<ContextDev::Models::PageErrorCount>] Page failures grouped by error code, most common first. For the batch itself fai
      #
      #   @param progress [ContextDev::Models::BatchRetrieveResponse::Progress] Page counts so far. Check `status` to know when the batch is done.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param results [ContextDev::Models::BatchRetrieveResponse::Results, nil] Links to download the results. `null` until the batch finishes; the files are de
      #
      #   @param status [Symbol, ContextDev::Models::BatchRetrieveResponse::Status] Current state. `pending` batches are being validated or are waiting for a slot u
      #
      #   @param tags [Array<String>] Tags set when the batch was submitted.
      #
      #   @param timing [ContextDev::Models::BatchRetrieveResponse::Timing] When the batch was created, started, and finished.
      #
      #   @param key_metadata [ContextDev::Models::BatchRetrieveResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param policies [Array<String>] Access policy IDs applied to every page.
      #
      #   @param webhook_delivery_id [String] ID of the batch's final-status webhook delivery, for `GET /webhooks/deliveries/{

      # @see ContextDev::Models::BatchRetrieveResponse#credits
      class Credits < ContextDev::Internal::Type::BaseModel
        # @!attribute net
        #   `reserved` minus `refunded` plus `ocr_charged`.
        #
        #   @return [Integer]
        required :net, Integer

        # @!attribute ocr_charged
        #   Credits charged for OCR when the batch finishes.
        #
        #   @return [Integer]
        required :ocr_charged, Integer

        # @!attribute refunded
        #   Credits returned when the batch finishes, such as for failed or unattempted
        #   pages.
        #
        #   @return [Integer]
        required :refunded, Integer

        # @!attribute reserved
        #   Credits reserved before scraping starts. `0` while `pending`.
        #
        #   @return [Integer]
        required :reserved, Integer

        # @!method initialize(net:, ocr_charged:, refunded:, reserved:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::BatchRetrieveResponse::Credits} for more details.
        #
        #   Credits reserved, refunded, and charged for the batch.
        #
        #   @param net [Integer] `reserved` minus `refunded` plus `ocr_charged`.
        #
        #   @param ocr_charged [Integer] Credits charged for OCR when the batch finishes.
        #
        #   @param refunded [Integer] Credits returned when the batch finishes, such as for failed or unattempted page
        #
        #   @param reserved [Integer] Credits reserved before scraping starts. `0` while `pending`.
      end

      # @see ContextDev::Models::BatchRetrieveResponse#formats
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
        #   {ContextDev::Models::BatchRetrieveResponse::Formats} for more details.
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

      # `scrape` for a URL list, `crawl` for a site crawl.
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
        #   Accepted pages not yet attempted. A link-following crawl reports `0` once it
        #   finishes, since its unused page budget is not counted.
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
        #   Page counts so far. Check `status` to know when the batch is done.
        #
        #   @param failed [Integer] Pages that could not be scraped.
        #
        #   @param pending [Integer] Accepted pages not yet attempted. A link-following crawl reports `0` once it fin
        #
        #   @param succeeded [Integer] Pages scraped successfully.
      end

      # @see ContextDev::Models::BatchRetrieveResponse#results
      class Results < ContextDev::Internal::Type::BaseModel
        # @!attribute expires_at
        #   When these links expire, 24 hours after this response. Retrieve the batch again
        #   for fresh links.
        #
        #   @return [String]
        required :expires_at, String

        # @!attribute files
        #   Result files, in no particular order.
        #
        #   @return [Array<ContextDev::Models::BatchRetrieveResponse::Results::File>]
        required :files,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchRetrieveResponse::Results::File] }

        # @!method initialize(expires_at:, files:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::BatchRetrieveResponse::Results} for more details.
        #
        #   Links to download the results. `null` until the batch finishes; the files are
        #   deleted 180 days after that.
        #
        #   @param expires_at [String] When these links expire, 24 hours after this response. Retrieve the batch again
        #
        #   @param files [Array<ContextDev::Models::BatchRetrieveResponse::Results::File>] Result files, in no particular order.

        class File < ContextDev::Internal::Type::BaseModel
          # @!attribute bytes
          #   Compressed file size in bytes.
          #
          #   @return [Integer]
          required :bytes, Integer

          # @!attribute items
          #   Number of result records in this file.
          #
          #   @return [Integer]
          required :items, Integer

          # @!attribute url
          #   Temporary download URL for a gzipped NDJSON file of result records.
          #
          #   @return [String]
          required :url, String

          # @!method initialize(bytes:, items:, url:)
          #   @param bytes [Integer] Compressed file size in bytes.
          #
          #   @param items [Integer] Number of result records in this file.
          #
          #   @param url [String] Temporary download URL for a gzipped NDJSON file of result records.
        end
      end

      # Current state. `pending` batches are being validated or are waiting for a slot
      # under your plan's concurrent batch limit, `queued` batches are ready to start,
      # and `running` batches are scraping. `completed`, `cancelled`, and `failed` are
      # final.
      #
      # @see ContextDev::Models::BatchRetrieveResponse#status
      module Status
        extend ContextDev::Internal::Type::Enum

        PENDING = :pending
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
        #   When the batch reached a final status. `null` until then.
        #
        #   @return [String, nil]
        required :completed_at, String, nil?: true

        # @!attribute created_at
        #   When the batch was created.
        #
        #   @return [String]
        required :created_at, String

        # @!attribute started_at
        #   When scraping started. `null` until the batch is `running`.
        #
        #   @return [String, nil]
        required :started_at, String, nil?: true

        # @!method initialize(completed_at:, created_at:, started_at:)
        #   When the batch was created, started, and finished.
        #
        #   @param completed_at [String, nil] When the batch reached a final status. `null` until then.
        #
        #   @param created_at [String] When the batch was created.
        #
        #   @param started_at [String, nil] When scraping started. `null` until the batch is `running`.
      end

      # @see ContextDev::Models::BatchRetrieveResponse#key_metadata
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
