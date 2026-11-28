# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#submit
    class BatchSubmitResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute id
      #   Unique ID of the batch. Pass it to `GET /batch/{batch_id}` to track progress.
      #
      #   @return [String]
      required :id, String

      # @!attribute cache_metadata
      #   Cache status of this response.
      #
      #   @return [ContextDev::Models::BatchSubmitResponse::CacheMetadata]
      required :cache_metadata, -> { ContextDev::Models::BatchSubmitResponse::CacheMetadata }

      # @!attribute crawl
      #   Crawl settings as submitted.
      #
      #   @return [ContextDev::Models::CrawlControls, nil]
      required :crawl, -> { ContextDev::CrawlControls }, nil?: true

      # @!attribute created_at
      #   When the batch was created.
      #
      #   @return [String]
      required :created_at, String

      # @!attribute credits
      #   Credits reserved for the batch.
      #
      #   @return [ContextDev::Models::BatchSubmitResponse::Credits]
      required :credits, -> { ContextDev::Models::BatchSubmitResponse::Credits }

      # @!attribute formats
      #   Formats requested for each page, as submitted in `input.data.formats`.
      #
      #   @return [ContextDev::Models::BatchSubmitResponse::Formats]
      required :formats, -> { ContextDev::Models::BatchSubmitResponse::Formats }

      # @!attribute input
      #   Page counts from your submission.
      #
      #   @return [ContextDev::Models::Intake]
      required :input, -> { ContextDev::Intake }

      # @!attribute invalid_urls
      #   URLs rejected from your list, up to the first 100.
      #
      #   @return [Array<ContextDev::Models::BatchSubmitResponse::InvalidURL>]
      required :invalid_urls,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchSubmitResponse::InvalidURL] }

      # @!attribute mode
      #   `scrape` for a URL list, `crawl` for a site crawl.
      #
      #   @return [Symbol, ContextDev::Models::BatchSubmitResponse::Mode]
      required :mode, enum: -> { ContextDev::Models::BatchSubmitResponse::Mode }

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute status
      #   Current state. `pending` batches are being validated or are waiting for a slot
      #   under your plan's concurrent batch limit, `queued` batches are ready to start,
      #   and `running` batches are scraping. `completed`, `cancelled`, and `failed` are
      #   final.
      #
      #   @return [Symbol, ContextDev::Models::BatchSubmitResponse::Status]
      required :status, enum: -> { ContextDev::Models::BatchSubmitResponse::Status }

      # @!attribute tags
      #   Tags set when the batch was submitted.
      #
      #   @return [Array<String>]
      required :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::BatchSubmitResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BatchSubmitResponse::KeyMetadata }

      # @!attribute webhook_secret
      #   Secret for verifying `X-Context-Signature` on this batch's webhooks. Returned
      #   only here and only when you set a webhook, so store it.
      #
      #   @return [String, nil]
      optional :webhook_secret, String

      # @!method initialize(id:, cache_metadata:, crawl:, created_at:, credits:, formats:, input:, invalid_urls:, mode:, request_id:, status:, tags:, key_metadata: nil, webhook_secret: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchSubmitResponse} for more details.
      #
      #   @param id [String] Unique ID of the batch. Pass it to `GET /batch/{batch_id}` to track progress.
      #
      #   @param cache_metadata [ContextDev::Models::BatchSubmitResponse::CacheMetadata] Cache status of this response.
      #
      #   @param crawl [ContextDev::Models::CrawlControls, nil] Crawl settings as submitted.
      #
      #   @param created_at [String] When the batch was created.
      #
      #   @param credits [ContextDev::Models::BatchSubmitResponse::Credits] Credits reserved for the batch.
      #
      #   @param formats [ContextDev::Models::BatchSubmitResponse::Formats] Formats requested for each page, as submitted in `input.data.formats`.
      #
      #   @param input [ContextDev::Models::Intake] Page counts from your submission.
      #
      #   @param invalid_urls [Array<ContextDev::Models::BatchSubmitResponse::InvalidURL>] URLs rejected from your list, up to the first 100.
      #
      #   @param mode [Symbol, ContextDev::Models::BatchSubmitResponse::Mode] `scrape` for a URL list, `crawl` for a site crawl.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param status [Symbol, ContextDev::Models::BatchSubmitResponse::Status] Current state. `pending` batches are being validated or are waiting for a slot u
      #
      #   @param tags [Array<String>] Tags set when the batch was submitted.
      #
      #   @param key_metadata [ContextDev::Models::BatchSubmitResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param webhook_secret [String] Secret for verifying `X-Context-Signature` on this batch's webhooks. Returned on

      # @see ContextDev::Models::BatchSubmitResponse#cache_metadata
      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute age_ms
        #   Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
        #
        #   @return [Integer]
        required :age_ms, Integer

        # @!attribute status
        #   `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
        #   retention bypassed the cache.
        #
        #   @return [Symbol, ContextDev::Models::BatchSubmitResponse::CacheMetadata::Status]
        required :status, enum: -> { ContextDev::Models::BatchSubmitResponse::CacheMetadata::Status }

        # @!method initialize(age_ms:, status:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::BatchSubmitResponse::CacheMetadata} for more details.
        #
        #   Cache status of this response.
        #
        #   @param age_ms [Integer] Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
        #
        #   @param status [Symbol, ContextDev::Models::BatchSubmitResponse::CacheMetadata::Status] `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data re

        # `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
        # retention bypassed the cache.
        #
        # @see ContextDev::Models::BatchSubmitResponse::CacheMetadata#status
        module Status
          extend ContextDev::Internal::Type::Enum

          HIT = :hit
          MISS = :miss
          ZDR = :zdr

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::BatchSubmitResponse#credits
      class Credits < ContextDev::Internal::Type::BaseModel
        # @!attribute reserved
        #   Credits reserved after validation, before scraping starts. `0` while `pending`.
        #
        #   @return [Integer]
        required :reserved, Integer

        # @!method initialize(reserved:)
        #   Credits reserved for the batch.
        #
        #   @param reserved [Integer] Credits reserved after validation, before scraping starts. `0` while `pending`.
      end

      # @see ContextDev::Models::BatchSubmitResponse#formats
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
        #   {ContextDev::Models::BatchSubmitResponse::Formats} for more details.
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
      # @see ContextDev::Models::BatchSubmitResponse#mode
      module Mode
        extend ContextDev::Internal::Type::Enum

        SCRAPE = :scrape
        CRAWL = :crawl

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Current state. `pending` batches are being validated or are waiting for a slot
      # under your plan's concurrent batch limit, `queued` batches are ready to start,
      # and `running` batches are scraping. `completed`, `cancelled`, and `failed` are
      # final.
      #
      # @see ContextDev::Models::BatchSubmitResponse#status
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

      # @see ContextDev::Models::BatchSubmitResponse#key_metadata
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
