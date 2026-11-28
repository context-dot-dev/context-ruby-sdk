# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#get_results
    class BatchGetResultsResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute data
      #   Results on this page.
      #
      #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok, ContextDev::Models::BatchGetResultsResponse::Data::Error>, nil]
      optional :data,
               -> { ContextDev::Internal::Type::ArrayOf[union: ContextDev::Models::BatchGetResultsResponse::Data] }

      # @!attribute has_more
      #   Whether more results are available after this page.
      #
      #   @return [Boolean, nil]
      optional :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::BatchGetResultsResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BatchGetResultsResponse::KeyMetadata }

      # @!attribute next_cursor
      #   Pass as `cursor` to fetch the next page. `null` on the last page.
      #
      #   @return [String, nil]
      optional :next_cursor, String, nil?: true

      # @!method initialize(request_id:, data: nil, has_more: nil, key_metadata: nil, next_cursor: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchGetResultsResponse} for more details.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param data [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok, ContextDev::Models::BatchGetResultsResponse::Data::Error>] Results on this page.
      #
      #   @param has_more [Boolean] Whether more results are available after this page.
      #
      #   @param key_metadata [ContextDev::Models::BatchGetResultsResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param next_cursor [String, nil] Pass as `cursor` to fetch the next page. `null` on the last page.

      # The outcome for one page. `result` has the same shape as a `POST /web/scrape`
      # response, and `itemId` and `meta` echo your input.
      module Data
        extend ContextDev::Internal::Type::Union

        discriminator :status

        # A page where at least one requested format succeeded. Check `result.isPartial` and each format's `success` for incomplete results.
        variant :ok, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok }

        # A page that could not be scraped.
        variant :error, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error }

        class Ok < ContextDev::Internal::Type::BaseModel
          # @!attribute credits_used
          #   Credits charged for this page, including OCR. Cached results are priced the same
          #   as in `POST /web/scrape`.
          #
          #   @return [Integer]
          required :credits_used, Integer

          # @!attribute result
          #   Scrape output, in the same shape as a `POST /web/scrape` response.
          #
          #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result]
          required :result, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result }

          # @!attribute status
          #   The page was scraped.
          #
          #   @return [Symbol, :ok]
          required :status, const: :ok

          # @!attribute url
          #   URL as submitted, or as discovered by the crawl.
          #
          #   @return [String]
          required :url, String

          # @!attribute item_id
          #   The `itemId` you submitted with this URL.
          #
          #   @return [String, nil]
          optional :item_id, String, api_name: :itemId

          # @!attribute meta
          #   The `meta` you submitted with this URL.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :meta, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

          # @!attribute ocr_pages
          #   Number of PDF pages read with OCR. Omitted when OCR did not run.
          #
          #   @return [Integer, nil]
          optional :ocr_pages, Integer

          # @!method initialize(credits_used:, result:, url:, item_id: nil, meta: nil, ocr_pages: nil, status: :ok)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok} for more details.
          #
          #   A page where at least one requested format succeeded. Check `result.isPartial`
          #   and each format's `success` for incomplete results.
          #
          #   @param credits_used [Integer] Credits charged for this page, including OCR. Cached results are priced the same
          #
          #   @param result [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result] Scrape output, in the same shape as a `POST /web/scrape` response.
          #
          #   @param url [String] URL as submitted, or as discovered by the crawl.
          #
          #   @param item_id [String] The `itemId` you submitted with this URL.
          #
          #   @param meta [Hash{Symbol=>Object}] The `meta` you submitted with this URL.
          #
          #   @param ocr_pages [Integer] Number of PDF pages read with OCR. Omitted when OCR did not run.
          #
          #   @param status [Symbol, :ok] The page was scraped.

          # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok#result
          class Result < ContextDev::Internal::Type::BaseModel
            # @!attribute bytes
            #   The original HTTP response body, unchanged by waits, actions, and filters.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes]
            required :bytes, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes }

            # @!attribute cache_metadata
            #   Cache status of this response.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata]
            required :cache_metadata,
                     -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata }

            # @!attribute highlights
            #   Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks
            #   omitted text.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Highlights]
            required :highlights, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Highlights }

            # @!attribute html
            #   Rendered HTML of the page, after content filters.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::HTML]
            required :html, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::HTML }

            # @!attribute images
            #   Images found on the page, after content filters. `[]` when there are none.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images]
            required :images, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images }

            # @!attribute json
            #   Object matching `jsonParams.schema`.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json]
            required :json, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json }

            # @!attribute markdown
            #   Page content as Markdown, after content filters.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Markdown]
            required :markdown, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Markdown }

            # @!attribute metadata
            #   Page metadata. Fields are omitted when not found.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata]
            required :metadata, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata }

            # @!attribute parsed
            #   Fields extracted by `parseParams`. Custom rules return each field after content
            #   filters, with `null` when nothing matches (`[]` for `list` rules). Prebuilt
            #   parsers return the record or lists described under `parseParams.parser`.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed]
            required :parsed, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed }

            # @!attribute product
            #   Product details found on the page.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product]
            required :product, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product }

            # @!attribute profile
            #   Browser profile used for this scrape. `null` when no profile was requested.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Profile, nil]
            required :profile,
                     -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Profile },
                     nil?: true

            # @!attribute request_id
            #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
            #   support.
            #
            #   @return [String]
            required :request_id, String

            # @!attribute screenshot
            #   Screenshot as a base64 image data URL.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Screenshot]
            required :screenshot, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Screenshot }

            # @!attribute url
            #   Final URL after redirects and browser actions.
            #
            #   @return [String]
            required :url, String

            # @!attribute is_partial
            #   `true` when at least one requested output succeeded but others failed or are
            #   incomplete. Absent otherwise.
            #
            #   @return [Boolean, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::IsPartial, nil]
            optional :is_partial,
                     enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::IsPartial },
                     api_name: :isPartial

            # @!attribute key_metadata
            #   Credits this request used and your remaining balance.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::KeyMetadata, nil]
            optional :key_metadata, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::KeyMetadata }

            # @!method initialize(bytes:, cache_metadata:, highlights:, html:, images:, json:, markdown:, metadata:, parsed:, product:, profile:, request_id:, screenshot:, url:, is_partial: nil, key_metadata: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result} for more
            #   details.
            #
            #   Scrape output, in the same shape as a `POST /web/scrape` response.
            #
            #   @param bytes [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes] The original HTTP response body, unchanged by waits, actions, and filters.
            #
            #   @param cache_metadata [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata] Cache status of this response.
            #
            #   @param highlights [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Highlights] Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks om
            #
            #   @param html [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::HTML] Rendered HTML of the page, after content filters.
            #
            #   @param images [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images] Images found on the page, after content filters. `[]` when there are none.
            #
            #   @param json [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json] Object matching `jsonParams.schema`.
            #
            #   @param markdown [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Markdown] Page content as Markdown, after content filters.
            #
            #   @param metadata [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata] Page metadata. Fields are omitted when not found.
            #
            #   @param parsed [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed] Fields extracted by `parseParams`. Custom rules return each field after content
            #
            #   @param product [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product] Product details found on the page.
            #
            #   @param profile [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Profile, nil] Browser profile used for this scrape. `null` when no profile was requested.
            #
            #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
            #
            #   @param screenshot [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Screenshot] Screenshot as a base64 image data URL.
            #
            #   @param url [String] Final URL after redirects and browser actions.
            #
            #   @param is_partial [Boolean, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::IsPartial] `true` when at least one requested output succeeded but others failed or are inc
            #
            #   @param key_metadata [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::KeyMetadata] Credits this request used and your remaining balance.

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#bytes
            class Bytes < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes::Data, nil]
              required :data,
                       -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes::Data },
                       nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes} for more
              #   details.
              #
              #   The original HTTP response body, unchanged by waits, actions, and filters.
              #
              #   @param data [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes::Data, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.

              # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes#data
              class Data < ContextDev::Internal::Type::BaseModel
                # @!attribute base64
                #   Response body as base64, after HTTP decompression. Up to 50 MiB decoded.
                #
                #   @return [String]
                required :base64, String

                # @!attribute content_type
                #   `Content-Type` of the response.
                #
                #   @return [String]
                required :content_type, String, api_name: :contentType

                # @!method initialize(base64:, content_type:)
                #   @param base64 [String] Response body as base64, after HTTP decompression. Up to 50 MiB decoded.
                #
                #   @param content_type [String] `Content-Type` of the response.
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#cache_metadata
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
              #   @return [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata::Status]
              required :status,
                       enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata::Status }

              # @!method initialize(age_ms:, status:)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata}
              #   for more details.
              #
              #   Cache status of this response.
              #
              #   @param age_ms [Integer] Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
              #
              #   @param status [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata::Status] `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data re

              # `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
              # retention bypassed the cache.
              #
              # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata#status
              module Status
                extend ContextDev::Internal::Type::Enum

                HIT = :hit
                MISS = :miss
                ZDR = :zdr

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#highlights
            class Highlights < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [Array<String>, nil]
              required :data, ContextDev::Internal::Type::ArrayOf[String], nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Highlights} for
              #   more details.
              #
              #   Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks
              #   omitted text.
              #
              #   @param data [Array<String>, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#html
            class HTML < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [String, nil]
              required :data, String, nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::HTML} for more
              #   details.
              #
              #   Rendered HTML of the page, after content filters.
              #
              #   @param data [String, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#images
            class Images < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data>, nil]
              required :data,
                       -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data] },
                       nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images} for more
              #   details.
              #
              #   Images found on the page, after content filters. `[]` when there are none.
              #
              #   @param data [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data>, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.

              class Data < ContextDev::Internal::Type::BaseModel
                # @!attribute alt
                #   Alt text. `null` when the image has none.
                #
                #   @return [String, nil]
                required :alt, String, nil?: true

                # @!attribute url
                #   Image URL, or a data URI for inline images.
                #
                #   @return [String]
                required :url, String

                # @!attribute classification
                #   What the image shows, such as a photo, logo, or icon. Requires `classification`
                #   enrichment.
                #
                #   @return [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification, nil]
                optional :classification,
                         enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification }

                # @!attribute file_url
                #   Hosted copy of the image, valid for 24 hours after capture. Requires `file`
                #   enrichment; not returned with ZDR.
                #
                #   @return [String, nil]
                optional :file_url, String, api_name: :fileUrl

                # @!attribute height
                #   Image height in pixels. Requires `dimensions` enrichment.
                #
                #   @return [Integer, nil]
                optional :height, Integer

                # @!attribute width
                #   Image width in pixels. Requires `dimensions` enrichment.
                #
                #   @return [Integer, nil]
                optional :width, Integer

                # @!method initialize(alt:, url:, classification: nil, file_url: nil, height: nil, width: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data}
                #   for more details.
                #
                #   @param alt [String, nil] Alt text. `null` when the image has none.
                #
                #   @param url [String] Image URL, or a data URI for inline images.
                #
                #   @param classification [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification] What the image shows, such as a photo, logo, or icon. Requires `classification`
                #
                #   @param file_url [String] Hosted copy of the image, valid for 24 hours after capture. Requires `file` enri
                #
                #   @param height [Integer] Image height in pixels. Requires `dimensions` enrichment.
                #
                #   @param width [Integer] Image width in pixels. Requires `dimensions` enrichment.

                # What the image shows, such as a photo, logo, or icon. Requires `classification`
                # enrichment.
                #
                # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data#classification
                module Classification
                  extend ContextDev::Internal::Type::Enum

                  PHOTOGRAPHY = :photography
                  ILLUSTRATION = :illustration
                  LOGO = :logo
                  WORDMARK = :wordmark
                  ICON = :icon
                  PATTERN = :pattern
                  GRAPHIC = :graphic
                  OTHER = :other

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#json
            class Json < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [Hash{Symbol=>Object}, nil]
              required :data,
                       ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown],
                       nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute is_truncated
              #   `true` when the page was too long to read in full, so values that appear only in
              #   the unread part may be missing.
              #
              #   @return [Boolean, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json::IsTruncated, nil]
              optional :is_truncated,
                       enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json::IsTruncated },
                       api_name: :isTruncated

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, is_truncated: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json} for more
              #   details.
              #
              #   Object matching `jsonParams.schema`.
              #
              #   @param data [Hash{Symbol=>Object}, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param is_truncated [Boolean, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json::IsTruncated] `true` when the page was too long to read in full, so values that appear only in
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.

              # `true` when the page was too long to read in full, so values that appear only in
              # the unread part may be missing.
              #
              # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json#is_truncated
              module IsTruncated
                extend ContextDev::Internal::Type::Enum

                TRUE = true

                # @!method self.values
                #   @return [Array<Boolean>]
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#markdown
            class Markdown < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [String, nil]
              required :data, String, nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Markdown} for
              #   more details.
              #
              #   Page content as Markdown, after content filters.
              #
              #   @param data [String, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#metadata
            class Metadata < ContextDev::Internal::Type::BaseModel
              # @!attribute additional_meta
              #   Other non-social meta tags that don't have their own field.
              #
              #   @return [Hash{Symbol=>String, Array<String>}, nil]
              optional :additional_meta,
                       -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::AdditionalMeta] },
                       api_name: :additionalMeta

              # @!attribute alternates
              #   Alternate links from `link rel="alternate"` tags, as absolute URLs.
              #
              #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Alternate>, nil]
              optional :alternates,
                       -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Alternate] }

              # @!attribute author
              #   Author, when present.
              #
              #   @return [String, nil]
              optional :author, String

              # @!attribute canonical_url
              #   Absolute canonical URL, when present.
              #
              #   @return [String, nil]
              optional :canonical_url, String, api_name: :canonicalUrl

              # @!attribute description
              #   Best available description, from standard, Open Graph, or Twitter meta tags.
              #
              #   @return [String, nil]
              optional :description, String

              # @!attribute favicon
              #   Absolute favicon URL, when present.
              #
              #   @return [String, nil]
              optional :favicon, String

              # @!attribute headings
              #   Headings (`h1` to `h6`) in document order, from the full page before any
              #   filtering. Up to 500. Omitted when the page has none.
              #
              #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Heading>, nil]
              optional :headings,
                       -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Heading] }

              # @!attribute image
              #   Main preview image URL, from Open Graph, Twitter, or image meta tags.
              #
              #   @return [String, nil]
              optional :image, String

              # @!attribute json_ld
              #   JSON-LD structured data blocks parsed from the page.
              #
              #   @return [Array<Hash{Symbol=>Object}>, nil]
              optional :json_ld,
                       ContextDev::Internal::Type::ArrayOf[ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]],
                       api_name: :jsonLd

              # @!attribute keywords
              #   Keywords from the page's `keywords` meta tag.
              #
              #   @return [Array<String>, nil]
              optional :keywords, ContextDev::Internal::Type::ArrayOf[String]

              # @!attribute language
              #   Page language, from the `html` `lang` attribute or language meta tags.
              #
              #   @return [String, nil]
              optional :language, String

              # @!attribute modified_time
              #   Last-modified date or timestamp from page metadata, when present.
              #
              #   @return [String, nil]
              optional :modified_time, String, api_name: :modifiedTime

              # @!attribute open_graph
              #   Open Graph tags, with the `og:` prefix removed and keys in camelCase.
              #
              #   @return [Hash{Symbol=>String, Array<String>}, nil]
              optional :open_graph,
                       -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::OpenGraph] },
                       api_name: :openGraph

              # @!attribute published_time
              #   Publish date or timestamp from page metadata, when present.
              #
              #   @return [String, nil]
              optional :published_time, String, api_name: :publishedTime

              # @!attribute robots
              #   `robots` meta directive, when present.
              #
              #   @return [String, nil]
              optional :robots, String

              # @!attribute site_name
              #   Site or app name from page metadata.
              #
              #   @return [String, nil]
              optional :site_name, String, api_name: :siteName

              # @!attribute title
              #   Best available page title.
              #
              #   @return [String, nil]
              optional :title, String

              # @!attribute twitter
              #   Twitter card tags, with the `twitter:` prefix removed and keys in camelCase.
              #
              #   @return [Hash{Symbol=>String, Array<String>}, nil]
              optional :twitter,
                       -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Twitter] }

              # @!method initialize(additional_meta: nil, alternates: nil, author: nil, canonical_url: nil, description: nil, favicon: nil, headings: nil, image: nil, json_ld: nil, keywords: nil, language: nil, modified_time: nil, open_graph: nil, published_time: nil, robots: nil, site_name: nil, title: nil, twitter: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata} for
              #   more details.
              #
              #   Page metadata. Fields are omitted when not found.
              #
              #   @param additional_meta [Hash{Symbol=>String, Array<String>}] Other non-social meta tags that don't have their own field.
              #
              #   @param alternates [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Alternate>] Alternate links from `link rel="alternate"` tags, as absolute URLs.
              #
              #   @param author [String] Author, when present.
              #
              #   @param canonical_url [String] Absolute canonical URL, when present.
              #
              #   @param description [String] Best available description, from standard, Open Graph, or Twitter meta tags.
              #
              #   @param favicon [String] Absolute favicon URL, when present.
              #
              #   @param headings [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Heading>] Headings (`h1` to `h6`) in document order, from the full page before any filteri
              #
              #   @param image [String] Main preview image URL, from Open Graph, Twitter, or image meta tags.
              #
              #   @param json_ld [Array<Hash{Symbol=>Object}>] JSON-LD structured data blocks parsed from the page.
              #
              #   @param keywords [Array<String>] Keywords from the page's `keywords` meta tag.
              #
              #   @param language [String] Page language, from the `html` `lang` attribute or language meta tags.
              #
              #   @param modified_time [String] Last-modified date or timestamp from page metadata, when present.
              #
              #   @param open_graph [Hash{Symbol=>String, Array<String>}] Open Graph tags, with the `og:` prefix removed and keys in camelCase.
              #
              #   @param published_time [String] Publish date or timestamp from page metadata, when present.
              #
              #   @param robots [String] `robots` meta directive, when present.
              #
              #   @param site_name [String] Site or app name from page metadata.
              #
              #   @param title [String] Best available page title.
              #
              #   @param twitter [Hash{Symbol=>String, Array<String>}] Twitter card tags, with the `twitter:` prefix removed and keys in camelCase.

              module AdditionalMeta
                extend ContextDev::Internal::Type::Union

                variant String

                variant -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::AdditionalMeta::StringArray }

                # @!method self.variants
                #   @return [Array(String, Array<String>)]

                # @type [ContextDev::Internal::Type::Converter]
                StringArray = ContextDev::Internal::Type::ArrayOf[String]
              end

              class Alternate < ContextDev::Internal::Type::BaseModel
                # @!attribute href
                #   Absolute URL of the alternate version.
                #
                #   @return [String]
                required :href, String

                # @!attribute hreflang
                #   Language or locale of the alternate version, when present.
                #
                #   @return [String, nil]
                optional :hreflang, String

                # @!attribute title
                #   Title of the alternate version, when present.
                #
                #   @return [String, nil]
                optional :title, String

                # @!attribute type
                #   MIME type of the alternate version, when present.
                #
                #   @return [String, nil]
                optional :type, String

                # @!method initialize(href:, hreflang: nil, title: nil, type: nil)
                #   @param href [String] Absolute URL of the alternate version.
                #
                #   @param hreflang [String] Language or locale of the alternate version, when present.
                #
                #   @param title [String] Title of the alternate version, when present.
                #
                #   @param type [String] MIME type of the alternate version, when present.
              end

              class Heading < ContextDev::Internal::Type::BaseModel
                # @!attribute level
                #   Heading level, from 1 (`h1`) to 6 (`h6`).
                #
                #   @return [Integer]
                required :level, Integer

                # @!attribute text
                #   Heading text with whitespace collapsed, truncated to 1000 characters.
                #
                #   @return [String]
                required :text, String

                # @!method initialize(level:, text:)
                #   @param level [Integer] Heading level, from 1 (`h1`) to 6 (`h6`).
                #
                #   @param text [String] Heading text with whitespace collapsed, truncated to 1000 characters.
              end

              module OpenGraph
                extend ContextDev::Internal::Type::Union

                variant String

                variant -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::OpenGraph::StringArray }

                # @!method self.variants
                #   @return [Array(String, Array<String>)]

                # @type [ContextDev::Internal::Type::Converter]
                StringArray = ContextDev::Internal::Type::ArrayOf[String]
              end

              module Twitter
                extend ContextDev::Internal::Type::Union

                variant String

                variant -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Twitter::StringArray }

                # @!method self.variants
                #   @return [Array(String, Array<String>)]

                # @type [ContextDev::Internal::Type::Converter]
                StringArray = ContextDev::Internal::Type::ArrayOf[String]
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#parsed
            class Parsed < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [Hash{Symbol=>Object}, nil]
              required :data,
                       ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown],
                       nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute type
              #   Prebuilt parser that ran, or `custom` for custom rules or when `parse` was not
              #   requested.
              #
              #   @return [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type]
              required :type, enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type }

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, type:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed} for more
              #   details.
              #
              #   Fields extracted by `parseParams`. Custom rules return each field after content
              #   filters, with `null` when nothing matches (`[]` for `list` rules). Prebuilt
              #   parsers return the record or lists described under `parseParams.parser`.
              #
              #   @param data [Hash{Symbol=>Object}, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param type [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type] Prebuilt parser that ran, or `custom` for custom rules or when `parse` was not r
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.

              # Prebuilt parser that ran, or `custom` for custom rules or when `parse` was not
              # requested.
              #
              # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed#type
              module Type
                extend ContextDev::Internal::Type::Enum

                CUSTOM = :custom
                GOOGLE_MAPS = :"google-maps"
                GOOGLE_MAPS_REVIEWS = :"google-maps-reviews"
                GOOGLE_PLAY = :"google-play"
                GOOGLE_PLAY_REVIEWS = :"google-play-reviews"
                APP_STORE = :"app-store"
                APP_STORE_REVIEWS = :"app-store-reviews"
                G2_REVIEWS = :"g2-reviews"
                INSTAGRAM_PROFILE = :"instagram-profile"
                INSTAGRAM_POST = :"instagram-post"
                INSTAGRAM_FEED = :"instagram-feed"
                TIKTOK_PROFILE = :"tiktok-profile"
                TIKTOK_VIDEO = :"tiktok-video"
                TIKTOK_FEED = :"tiktok-feed"
                TIKTOK_COMMENTS = :"tiktok-comments"
                TIKTOK_FOLLOWERS = :"tiktok-followers"
                TIKTOK_FOLLOWING = :"tiktok-following"
                TIKTOK_USER_SEARCH = :"tiktok-user-search"
                REDDIT_POST = :"reddit-post"
                REDDIT_SEARCH = :"reddit-search"
                REDDIT_SUBREDDIT = :"reddit-subreddit"
                REDDIT_USER = :"reddit-user"
                YELP_SEARCH = :"yelp-search"
                YELP_REVIEWS = :"yelp-reviews"
                TRIPADVISOR_REVIEWS = :"tripadvisor-reviews"
                CAR_RENTAL_AVAILABILITY = :"car-rental-availability"
                CAR_RENTAL_LOCATIONS = :"car-rental-locations"
                EMAILS = :emails
                PHONE_NUMBERS = :"phone-numbers"
                LINKS = :links

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#product
            class Product < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data, nil]
              required :data,
                       -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data },
                       nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product} for
              #   more details.
              #
              #   Product details found on the page.
              #
              #   @param data [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.

              # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product#data
              class Data < ContextDev::Internal::Type::BaseModel
                # @!attribute is_product_page
                #   Whether the page is a product detail page.
                #
                #   @return [Boolean]
                required :is_product_page, ContextDev::Internal::Type::Boolean, api_name: :isProductPage

                # @!attribute product
                #   The extracted product. `null` when the page is not a product detail page.
                #
                #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product, nil]
                required :product,
                         -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product },
                         nil?: true

                # @!method initialize(is_product_page:, product:)
                #   @param is_product_page [Boolean] Whether the page is a product detail page.
                #
                #   @param product [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product, nil] The extracted product. `null` when the page is not a product detail page.

                # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data#product
                class Product < ContextDev::Internal::Type::BaseModel
                  # @!attribute availability
                  #   Stock or ordering availability.
                  #
                  #   @return [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Availability, nil]
                  required :availability,
                           enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Availability },
                           nil?: true

                  # @!attribute brand
                  #   Brand or vendor.
                  #
                  #   @return [String, nil]
                  required :brand, String, nil?: true

                  # @!attribute category
                  #   Product category.
                  #
                  #   @return [String, nil]
                  required :category, String, nil?: true

                  # @!attribute currency
                  #   ISO 4217 currency code of `price`.
                  #
                  #   @return [String, nil]
                  required :currency, String, nil?: true

                  # @!attribute description
                  #   Product description.
                  #
                  #   @return [String, nil]
                  required :description, String, nil?: true

                  # @!attribute dimensions
                  #   Product dimensions as shown on the page.
                  #
                  #   @return [Array<String>]
                  required :dimensions, ContextDev::Internal::Type::ArrayOf[String]

                  # @!attribute features
                  #   Key features and specifications.
                  #
                  #   @return [Array<String>]
                  required :features, ContextDev::Internal::Type::ArrayOf[String]

                  # @!attribute images
                  #   Product image URLs, main image first.
                  #
                  #   @return [Array<String>]
                  required :images, ContextDev::Internal::Type::ArrayOf[String]

                  # @!attribute image_url
                  #   Main product image URL.
                  #
                  #   @return [String, nil]
                  required :image_url, String, api_name: :imageUrl, nil?: true

                  # @!attribute name
                  #   Product name.
                  #
                  #   @return [String]
                  required :name, String

                  # @!attribute price
                  #   Current price.
                  #
                  #   @return [Float, nil]
                  required :price, Float, nil?: true

                  # @!attribute regular_price
                  #   List price before any discount.
                  #
                  #   @return [Float, nil]
                  required :regular_price, Float, api_name: :regularPrice, nil?: true

                  # @!attribute sku
                  #   Product identifier such as a SKU or model number.
                  #
                  #   @return [String, nil]
                  required :sku, String, nil?: true

                  # @!attribute tags
                  #   Product tags.
                  #
                  #   @return [Array<String>]
                  required :tags, ContextDev::Internal::Type::ArrayOf[String]

                  # @!attribute target_audience
                  #   Intended audience.
                  #
                  #   @return [Array<String>]
                  required :target_audience,
                           ContextDev::Internal::Type::ArrayOf[String],
                           api_name: :targetAudience

                  # @!attribute variants
                  #   Product variants, such as colors or sizes, with their attributes and images.
                  #   `[]` when none are found. May not include every variant the store offers.
                  #
                  #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Variant>]
                  required :variants,
                           -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Variant] }

                  # @!method initialize(availability:, brand:, category:, currency:, description:, dimensions:, features:, images:, image_url:, name:, price:, regular_price:, sku:, tags:, target_audience:, variants:)
                  #   Some parameter documentations has been truncated, see
                  #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product}
                  #   for more details.
                  #
                  #   The extracted product. `null` when the page is not a product detail page.
                  #
                  #   @param availability [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Availability, nil] Stock or ordering availability.
                  #
                  #   @param brand [String, nil] Brand or vendor.
                  #
                  #   @param category [String, nil] Product category.
                  #
                  #   @param currency [String, nil] ISO 4217 currency code of `price`.
                  #
                  #   @param description [String, nil] Product description.
                  #
                  #   @param dimensions [Array<String>] Product dimensions as shown on the page.
                  #
                  #   @param features [Array<String>] Key features and specifications.
                  #
                  #   @param images [Array<String>] Product image URLs, main image first.
                  #
                  #   @param image_url [String, nil] Main product image URL.
                  #
                  #   @param name [String] Product name.
                  #
                  #   @param price [Float, nil] Current price.
                  #
                  #   @param regular_price [Float, nil] List price before any discount.
                  #
                  #   @param sku [String, nil] Product identifier such as a SKU or model number.
                  #
                  #   @param tags [Array<String>] Product tags.
                  #
                  #   @param target_audience [Array<String>] Intended audience.
                  #
                  #   @param variants [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Variant>] Product variants, such as colors or sizes, with their attributes and images. `[]

                  # Stock or ordering availability.
                  #
                  # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product#availability
                  module Availability
                    extend ContextDev::Internal::Type::Enum

                    IN_STOCK = :in_stock
                    OUT_OF_STOCK = :out_of_stock
                    LIMITED_AVAILABILITY = :limited_availability
                    PREORDER = :preorder
                    BACKORDER = :backorder
                    MADE_TO_ORDER = :made_to_order
                    DISCONTINUED = :discontinued

                    # @!method self.values
                    #   @return [Array<Symbol>]
                  end

                  class Variant < ContextDev::Internal::Type::BaseModel
                    # @!attribute attributes
                    #   Attributes that define this variant, such as color, size, material, or pattern,
                    #   as stated on the page.
                    #
                    #   @return [Hash{Symbol=>String}]
                    required :attributes, ContextDev::Internal::Type::HashOf[String]

                    # @!attribute images
                    #   Image URLs the source attaches to this variant.
                    #
                    #   @return [Array<String>]
                    required :images, ContextDev::Internal::Type::ArrayOf[String]

                    # @!attribute sku
                    #   SKU of this variant. `null` when the source does not state one.
                    #
                    #   @return [String, nil]
                    required :sku, String, nil?: true

                    # @!attribute url
                    #   URL of this variant or offer, when the source provides one. Several variants can
                    #   share a URL.
                    #
                    #   @return [String, nil]
                    required :url, String, nil?: true

                    # @!attribute availability
                    #   Stock or ordering availability of this variant.
                    #
                    #   @return [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Variant::Availability, nil]
                    optional :availability,
                             enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Variant::Availability },
                             nil?: true

                    # @!attribute currency
                    #   Currency code of `price`, such as `USD` or `EUR`, when stated.
                    #
                    #   @return [String, nil]
                    optional :currency, String, nil?: true

                    # @!attribute price
                    #   Price of this variant, when the source states one per variant.
                    #
                    #   @return [Float, nil]
                    optional :price, Float, nil?: true

                    # @!method initialize(attributes:, images:, sku:, url:, availability: nil, currency: nil, price: nil)
                    #   Some parameter documentations has been truncated, see
                    #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Variant}
                    #   for more details.
                    #
                    #   @param attributes [Hash{Symbol=>String}] Attributes that define this variant, such as color, size, material, or pattern,
                    #
                    #   @param images [Array<String>] Image URLs the source attaches to this variant.
                    #
                    #   @param sku [String, nil] SKU of this variant. `null` when the source does not state one.
                    #
                    #   @param url [String, nil] URL of this variant or offer, when the source provides one. Several variants can
                    #
                    #   @param availability [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Variant::Availability, nil] Stock or ordering availability of this variant.
                    #
                    #   @param currency [String, nil] Currency code of `price`, such as `USD` or `EUR`, when stated.
                    #
                    #   @param price [Float, nil] Price of this variant, when the source states one per variant.

                    # Stock or ordering availability of this variant.
                    #
                    # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Variant#availability
                    module Availability
                      extend ContextDev::Internal::Type::Enum

                      IN_STOCK = :in_stock
                      OUT_OF_STOCK = :out_of_stock
                      LIMITED_AVAILABILITY = :limited_availability
                      PREORDER = :preorder
                      BACKORDER = :backorder
                      MADE_TO_ORDER = :made_to_order
                      DISCONTINUED = :discontinued

                      # @!method self.values
                      #   @return [Array<Symbol>]
                    end
                  end
                end
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#profile
            class Profile < ContextDev::Internal::Type::BaseModel
              # @!attribute id
              #   ID of the browser profile. After creating a profile, save it and pass it as
              #   `sharedParams.profile.profileId` with `type: "existing"`.
              #
              #   @return [String]
              required :id, String

              # @!method initialize(id:)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Profile} for
              #   more details.
              #
              #   Browser profile used for this scrape. `null` when no profile was requested.
              #
              #   @param id [String] ID of the browser profile. After creating a profile, save it and pass it as `sha
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#screenshot
            class Screenshot < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [String, nil]
              required :data, String, nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Screenshot} for
              #   more details.
              #
              #   Screenshot as a base64 image data URL.
              #
              #   @param data [String, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.
            end

            # `true` when at least one requested output succeeded but others failed or are
            # incomplete. Absent otherwise.
            #
            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#is_partial
            module IsPartial
              extend ContextDev::Internal::Type::Enum

              TRUE = true

              # @!method self.values
              #   @return [Array<Boolean>]
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#key_metadata
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

        class Error < ContextDev::Internal::Type::BaseModel
          # @!attribute error_code
          #   Machine-readable error code, such as `NOT_FOUND`.
          #
          #   @return [String]
          required :error_code, String

          # @!attribute message
          #   Human-readable explanation of the error.
          #
          #   @return [String]
          required :message, String

          # @!attribute status
          #   The page could not be scraped.
          #
          #   @return [Symbol, :error]
          required :status, const: :error

          # @!attribute url
          #   URL as submitted, or as discovered by the crawl.
          #
          #   @return [String]
          required :url, String

          # @!attribute credits_used
          #   Credits charged for this page, including OCR. Cached results are priced the same
          #   as in `POST /web/scrape`.
          #
          #   @return [Integer, nil]
          optional :credits_used, Integer

          # @!attribute item_id
          #   The `itemId` you submitted with this URL.
          #
          #   @return [String, nil]
          optional :item_id, String, api_name: :itemId

          # @!attribute meta
          #   The `meta` you submitted with this URL.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :meta, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

          # @!attribute ocr_pages
          #   Number of PDF pages read with OCR. Omitted when OCR did not run.
          #
          #   @return [Integer, nil]
          optional :ocr_pages, Integer

          # @!attribute result
          #   Per-format errors, when the scrape returned a response. Omitted when the page
          #   could not be scraped at all.
          #
          #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result, nil]
          optional :result, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result }

          # @!method initialize(error_code:, message:, url:, credits_used: nil, item_id: nil, meta: nil, ocr_pages: nil, result: nil, status: :error)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BatchGetResultsResponse::Data::Error} for more details.
          #
          #   A page that could not be scraped.
          #
          #   @param error_code [String] Machine-readable error code, such as `NOT_FOUND`.
          #
          #   @param message [String] Human-readable explanation of the error.
          #
          #   @param url [String] URL as submitted, or as discovered by the crawl.
          #
          #   @param credits_used [Integer] Credits charged for this page, including OCR. Cached results are priced the same
          #
          #   @param item_id [String] The `itemId` you submitted with this URL.
          #
          #   @param meta [Hash{Symbol=>Object}] The `meta` you submitted with this URL.
          #
          #   @param ocr_pages [Integer] Number of PDF pages read with OCR. Omitted when OCR did not run.
          #
          #   @param result [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result] Per-format errors, when the scrape returned a response. Omitted when the page co
          #
          #   @param status [Symbol, :error] The page could not be scraped.

          # @see ContextDev::Models::BatchGetResultsResponse::Data::Error#result
          class Result < ContextDev::Internal::Type::BaseModel
            # @!attribute bytes
            #   The original HTTP response body, unchanged by waits, actions, and filters.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes]
            required :bytes, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes }

            # @!attribute cache_metadata
            #   Cache status of this response.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata]
            required :cache_metadata,
                     -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata }

            # @!attribute highlights
            #   Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks
            #   omitted text.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Highlights]
            required :highlights, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Highlights }

            # @!attribute html
            #   Rendered HTML of the page, after content filters.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::HTML]
            required :html, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::HTML }

            # @!attribute images
            #   Images found on the page, after content filters. `[]` when there are none.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images]
            required :images, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images }

            # @!attribute json
            #   Object matching `jsonParams.schema`.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json]
            required :json, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json }

            # @!attribute markdown
            #   Page content as Markdown, after content filters.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Markdown]
            required :markdown, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Markdown }

            # @!attribute metadata
            #   Page metadata. Fields are omitted when not found.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata]
            required :metadata, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata }

            # @!attribute parsed
            #   Fields extracted by `parseParams`. Custom rules return each field after content
            #   filters, with `null` when nothing matches (`[]` for `list` rules). Prebuilt
            #   parsers return the record or lists described under `parseParams.parser`.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed]
            required :parsed, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed }

            # @!attribute product
            #   Product details found on the page.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product]
            required :product, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product }

            # @!attribute profile
            #   Browser profile used for this scrape. `null` when no profile was requested.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Profile, nil]
            required :profile,
                     -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Profile },
                     nil?: true

            # @!attribute request_id
            #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
            #   support.
            #
            #   @return [String]
            required :request_id, String

            # @!attribute screenshot
            #   Screenshot as a base64 image data URL.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Screenshot]
            required :screenshot, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Screenshot }

            # @!attribute url
            #   Final URL after redirects and browser actions.
            #
            #   @return [String]
            required :url, String

            # @!attribute is_partial
            #   `true` when at least one requested output succeeded but others failed or are
            #   incomplete. Absent otherwise.
            #
            #   @return [Boolean, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::IsPartial, nil]
            optional :is_partial,
                     enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::IsPartial },
                     api_name: :isPartial

            # @!attribute key_metadata
            #   Credits this request used and your remaining balance.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::KeyMetadata, nil]
            optional :key_metadata,
                     -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::KeyMetadata }

            # @!method initialize(bytes:, cache_metadata:, highlights:, html:, images:, json:, markdown:, metadata:, parsed:, product:, profile:, request_id:, screenshot:, url:, is_partial: nil, key_metadata: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result} for more
            #   details.
            #
            #   Per-format errors, when the scrape returned a response. Omitted when the page
            #   could not be scraped at all.
            #
            #   @param bytes [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes] The original HTTP response body, unchanged by waits, actions, and filters.
            #
            #   @param cache_metadata [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata] Cache status of this response.
            #
            #   @param highlights [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Highlights] Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks om
            #
            #   @param html [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::HTML] Rendered HTML of the page, after content filters.
            #
            #   @param images [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images] Images found on the page, after content filters. `[]` when there are none.
            #
            #   @param json [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json] Object matching `jsonParams.schema`.
            #
            #   @param markdown [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Markdown] Page content as Markdown, after content filters.
            #
            #   @param metadata [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata] Page metadata. Fields are omitted when not found.
            #
            #   @param parsed [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed] Fields extracted by `parseParams`. Custom rules return each field after content
            #
            #   @param product [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product] Product details found on the page.
            #
            #   @param profile [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Profile, nil] Browser profile used for this scrape. `null` when no profile was requested.
            #
            #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
            #
            #   @param screenshot [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Screenshot] Screenshot as a base64 image data URL.
            #
            #   @param url [String] Final URL after redirects and browser actions.
            #
            #   @param is_partial [Boolean, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::IsPartial] `true` when at least one requested output succeeded but others failed or are inc
            #
            #   @param key_metadata [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::KeyMetadata] Credits this request used and your remaining balance.

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#bytes
            class Bytes < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes::Data, nil]
              required :data,
                       -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes::Data },
                       nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes} for
              #   more details.
              #
              #   The original HTTP response body, unchanged by waits, actions, and filters.
              #
              #   @param data [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes::Data, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.

              # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes#data
              class Data < ContextDev::Internal::Type::BaseModel
                # @!attribute base64
                #   Response body as base64, after HTTP decompression. Up to 50 MiB decoded.
                #
                #   @return [String]
                required :base64, String

                # @!attribute content_type
                #   `Content-Type` of the response.
                #
                #   @return [String]
                required :content_type, String, api_name: :contentType

                # @!method initialize(base64:, content_type:)
                #   @param base64 [String] Response body as base64, after HTTP decompression. Up to 50 MiB decoded.
                #
                #   @param content_type [String] `Content-Type` of the response.
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#cache_metadata
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
              #   @return [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata::Status]
              required :status,
                       enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata::Status }

              # @!method initialize(age_ms:, status:)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata}
              #   for more details.
              #
              #   Cache status of this response.
              #
              #   @param age_ms [Integer] Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
              #
              #   @param status [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata::Status] `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data re

              # `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
              # retention bypassed the cache.
              #
              # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata#status
              module Status
                extend ContextDev::Internal::Type::Enum

                HIT = :hit
                MISS = :miss
                ZDR = :zdr

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#highlights
            class Highlights < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [Array<String>, nil]
              required :data, ContextDev::Internal::Type::ArrayOf[String], nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Highlights}
              #   for more details.
              #
              #   Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks
              #   omitted text.
              #
              #   @param data [Array<String>, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#html
            class HTML < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [String, nil]
              required :data, String, nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::HTML} for
              #   more details.
              #
              #   Rendered HTML of the page, after content filters.
              #
              #   @param data [String, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#images
            class Images < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data>, nil]
              required :data,
                       -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data] },
                       nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images} for
              #   more details.
              #
              #   Images found on the page, after content filters. `[]` when there are none.
              #
              #   @param data [Array<ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data>, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.

              class Data < ContextDev::Internal::Type::BaseModel
                # @!attribute alt
                #   Alt text. `null` when the image has none.
                #
                #   @return [String, nil]
                required :alt, String, nil?: true

                # @!attribute url
                #   Image URL, or a data URI for inline images.
                #
                #   @return [String]
                required :url, String

                # @!attribute classification
                #   What the image shows, such as a photo, logo, or icon. Requires `classification`
                #   enrichment.
                #
                #   @return [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification, nil]
                optional :classification,
                         enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification }

                # @!attribute file_url
                #   Hosted copy of the image, valid for 24 hours after capture. Requires `file`
                #   enrichment; not returned with ZDR.
                #
                #   @return [String, nil]
                optional :file_url, String, api_name: :fileUrl

                # @!attribute height
                #   Image height in pixels. Requires `dimensions` enrichment.
                #
                #   @return [Integer, nil]
                optional :height, Integer

                # @!attribute width
                #   Image width in pixels. Requires `dimensions` enrichment.
                #
                #   @return [Integer, nil]
                optional :width, Integer

                # @!method initialize(alt:, url:, classification: nil, file_url: nil, height: nil, width: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data}
                #   for more details.
                #
                #   @param alt [String, nil] Alt text. `null` when the image has none.
                #
                #   @param url [String] Image URL, or a data URI for inline images.
                #
                #   @param classification [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification] What the image shows, such as a photo, logo, or icon. Requires `classification`
                #
                #   @param file_url [String] Hosted copy of the image, valid for 24 hours after capture. Requires `file` enri
                #
                #   @param height [Integer] Image height in pixels. Requires `dimensions` enrichment.
                #
                #   @param width [Integer] Image width in pixels. Requires `dimensions` enrichment.

                # What the image shows, such as a photo, logo, or icon. Requires `classification`
                # enrichment.
                #
                # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data#classification
                module Classification
                  extend ContextDev::Internal::Type::Enum

                  PHOTOGRAPHY = :photography
                  ILLUSTRATION = :illustration
                  LOGO = :logo
                  WORDMARK = :wordmark
                  ICON = :icon
                  PATTERN = :pattern
                  GRAPHIC = :graphic
                  OTHER = :other

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#json
            class Json < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [Hash{Symbol=>Object}, nil]
              required :data,
                       ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown],
                       nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute is_truncated
              #   `true` when the page was too long to read in full, so values that appear only in
              #   the unread part may be missing.
              #
              #   @return [Boolean, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json::IsTruncated, nil]
              optional :is_truncated,
                       enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json::IsTruncated },
                       api_name: :isTruncated

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, is_truncated: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json} for
              #   more details.
              #
              #   Object matching `jsonParams.schema`.
              #
              #   @param data [Hash{Symbol=>Object}, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param is_truncated [Boolean, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json::IsTruncated] `true` when the page was too long to read in full, so values that appear only in
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.

              # `true` when the page was too long to read in full, so values that appear only in
              # the unread part may be missing.
              #
              # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json#is_truncated
              module IsTruncated
                extend ContextDev::Internal::Type::Enum

                TRUE = true

                # @!method self.values
                #   @return [Array<Boolean>]
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#markdown
            class Markdown < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [String, nil]
              required :data, String, nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Markdown} for
              #   more details.
              #
              #   Page content as Markdown, after content filters.
              #
              #   @param data [String, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#metadata
            class Metadata < ContextDev::Internal::Type::BaseModel
              # @!attribute additional_meta
              #   Other non-social meta tags that don't have their own field.
              #
              #   @return [Hash{Symbol=>String, Array<String>}, nil]
              optional :additional_meta,
                       -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::AdditionalMeta] },
                       api_name: :additionalMeta

              # @!attribute alternates
              #   Alternate links from `link rel="alternate"` tags, as absolute URLs.
              #
              #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Alternate>, nil]
              optional :alternates,
                       -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Alternate] }

              # @!attribute author
              #   Author, when present.
              #
              #   @return [String, nil]
              optional :author, String

              # @!attribute canonical_url
              #   Absolute canonical URL, when present.
              #
              #   @return [String, nil]
              optional :canonical_url, String, api_name: :canonicalUrl

              # @!attribute description
              #   Best available description, from standard, Open Graph, or Twitter meta tags.
              #
              #   @return [String, nil]
              optional :description, String

              # @!attribute favicon
              #   Absolute favicon URL, when present.
              #
              #   @return [String, nil]
              optional :favicon, String

              # @!attribute headings
              #   Headings (`h1` to `h6`) in document order, from the full page before any
              #   filtering. Up to 500. Omitted when the page has none.
              #
              #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Heading>, nil]
              optional :headings,
                       -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Heading] }

              # @!attribute image
              #   Main preview image URL, from Open Graph, Twitter, or image meta tags.
              #
              #   @return [String, nil]
              optional :image, String

              # @!attribute json_ld
              #   JSON-LD structured data blocks parsed from the page.
              #
              #   @return [Array<Hash{Symbol=>Object}>, nil]
              optional :json_ld,
                       ContextDev::Internal::Type::ArrayOf[ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]],
                       api_name: :jsonLd

              # @!attribute keywords
              #   Keywords from the page's `keywords` meta tag.
              #
              #   @return [Array<String>, nil]
              optional :keywords, ContextDev::Internal::Type::ArrayOf[String]

              # @!attribute language
              #   Page language, from the `html` `lang` attribute or language meta tags.
              #
              #   @return [String, nil]
              optional :language, String

              # @!attribute modified_time
              #   Last-modified date or timestamp from page metadata, when present.
              #
              #   @return [String, nil]
              optional :modified_time, String, api_name: :modifiedTime

              # @!attribute open_graph
              #   Open Graph tags, with the `og:` prefix removed and keys in camelCase.
              #
              #   @return [Hash{Symbol=>String, Array<String>}, nil]
              optional :open_graph,
                       -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::OpenGraph] },
                       api_name: :openGraph

              # @!attribute published_time
              #   Publish date or timestamp from page metadata, when present.
              #
              #   @return [String, nil]
              optional :published_time, String, api_name: :publishedTime

              # @!attribute robots
              #   `robots` meta directive, when present.
              #
              #   @return [String, nil]
              optional :robots, String

              # @!attribute site_name
              #   Site or app name from page metadata.
              #
              #   @return [String, nil]
              optional :site_name, String, api_name: :siteName

              # @!attribute title
              #   Best available page title.
              #
              #   @return [String, nil]
              optional :title, String

              # @!attribute twitter
              #   Twitter card tags, with the `twitter:` prefix removed and keys in camelCase.
              #
              #   @return [Hash{Symbol=>String, Array<String>}, nil]
              optional :twitter,
                       -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Twitter] }

              # @!method initialize(additional_meta: nil, alternates: nil, author: nil, canonical_url: nil, description: nil, favicon: nil, headings: nil, image: nil, json_ld: nil, keywords: nil, language: nil, modified_time: nil, open_graph: nil, published_time: nil, robots: nil, site_name: nil, title: nil, twitter: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata} for
              #   more details.
              #
              #   Page metadata. Fields are omitted when not found.
              #
              #   @param additional_meta [Hash{Symbol=>String, Array<String>}] Other non-social meta tags that don't have their own field.
              #
              #   @param alternates [Array<ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Alternate>] Alternate links from `link rel="alternate"` tags, as absolute URLs.
              #
              #   @param author [String] Author, when present.
              #
              #   @param canonical_url [String] Absolute canonical URL, when present.
              #
              #   @param description [String] Best available description, from standard, Open Graph, or Twitter meta tags.
              #
              #   @param favicon [String] Absolute favicon URL, when present.
              #
              #   @param headings [Array<ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Heading>] Headings (`h1` to `h6`) in document order, from the full page before any filteri
              #
              #   @param image [String] Main preview image URL, from Open Graph, Twitter, or image meta tags.
              #
              #   @param json_ld [Array<Hash{Symbol=>Object}>] JSON-LD structured data blocks parsed from the page.
              #
              #   @param keywords [Array<String>] Keywords from the page's `keywords` meta tag.
              #
              #   @param language [String] Page language, from the `html` `lang` attribute or language meta tags.
              #
              #   @param modified_time [String] Last-modified date or timestamp from page metadata, when present.
              #
              #   @param open_graph [Hash{Symbol=>String, Array<String>}] Open Graph tags, with the `og:` prefix removed and keys in camelCase.
              #
              #   @param published_time [String] Publish date or timestamp from page metadata, when present.
              #
              #   @param robots [String] `robots` meta directive, when present.
              #
              #   @param site_name [String] Site or app name from page metadata.
              #
              #   @param title [String] Best available page title.
              #
              #   @param twitter [Hash{Symbol=>String, Array<String>}] Twitter card tags, with the `twitter:` prefix removed and keys in camelCase.

              module AdditionalMeta
                extend ContextDev::Internal::Type::Union

                variant String

                variant -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::AdditionalMeta::StringArray }

                # @!method self.variants
                #   @return [Array(String, Array<String>)]

                # @type [ContextDev::Internal::Type::Converter]
                StringArray = ContextDev::Internal::Type::ArrayOf[String]
              end

              class Alternate < ContextDev::Internal::Type::BaseModel
                # @!attribute href
                #   Absolute URL of the alternate version.
                #
                #   @return [String]
                required :href, String

                # @!attribute hreflang
                #   Language or locale of the alternate version, when present.
                #
                #   @return [String, nil]
                optional :hreflang, String

                # @!attribute title
                #   Title of the alternate version, when present.
                #
                #   @return [String, nil]
                optional :title, String

                # @!attribute type
                #   MIME type of the alternate version, when present.
                #
                #   @return [String, nil]
                optional :type, String

                # @!method initialize(href:, hreflang: nil, title: nil, type: nil)
                #   @param href [String] Absolute URL of the alternate version.
                #
                #   @param hreflang [String] Language or locale of the alternate version, when present.
                #
                #   @param title [String] Title of the alternate version, when present.
                #
                #   @param type [String] MIME type of the alternate version, when present.
              end

              class Heading < ContextDev::Internal::Type::BaseModel
                # @!attribute level
                #   Heading level, from 1 (`h1`) to 6 (`h6`).
                #
                #   @return [Integer]
                required :level, Integer

                # @!attribute text
                #   Heading text with whitespace collapsed, truncated to 1000 characters.
                #
                #   @return [String]
                required :text, String

                # @!method initialize(level:, text:)
                #   @param level [Integer] Heading level, from 1 (`h1`) to 6 (`h6`).
                #
                #   @param text [String] Heading text with whitespace collapsed, truncated to 1000 characters.
              end

              module OpenGraph
                extend ContextDev::Internal::Type::Union

                variant String

                variant -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::OpenGraph::StringArray }

                # @!method self.variants
                #   @return [Array(String, Array<String>)]

                # @type [ContextDev::Internal::Type::Converter]
                StringArray = ContextDev::Internal::Type::ArrayOf[String]
              end

              module Twitter
                extend ContextDev::Internal::Type::Union

                variant String

                variant -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Twitter::StringArray }

                # @!method self.variants
                #   @return [Array(String, Array<String>)]

                # @type [ContextDev::Internal::Type::Converter]
                StringArray = ContextDev::Internal::Type::ArrayOf[String]
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#parsed
            class Parsed < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [Hash{Symbol=>Object}, nil]
              required :data,
                       ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown],
                       nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute type
              #   Prebuilt parser that ran, or `custom` for custom rules or when `parse` was not
              #   requested.
              #
              #   @return [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type]
              required :type,
                       enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type }

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, type:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed} for
              #   more details.
              #
              #   Fields extracted by `parseParams`. Custom rules return each field after content
              #   filters, with `null` when nothing matches (`[]` for `list` rules). Prebuilt
              #   parsers return the record or lists described under `parseParams.parser`.
              #
              #   @param data [Hash{Symbol=>Object}, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param type [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type] Prebuilt parser that ran, or `custom` for custom rules or when `parse` was not r
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.

              # Prebuilt parser that ran, or `custom` for custom rules or when `parse` was not
              # requested.
              #
              # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed#type
              module Type
                extend ContextDev::Internal::Type::Enum

                CUSTOM = :custom
                GOOGLE_MAPS = :"google-maps"
                GOOGLE_MAPS_REVIEWS = :"google-maps-reviews"
                GOOGLE_PLAY = :"google-play"
                GOOGLE_PLAY_REVIEWS = :"google-play-reviews"
                APP_STORE = :"app-store"
                APP_STORE_REVIEWS = :"app-store-reviews"
                G2_REVIEWS = :"g2-reviews"
                INSTAGRAM_PROFILE = :"instagram-profile"
                INSTAGRAM_POST = :"instagram-post"
                INSTAGRAM_FEED = :"instagram-feed"
                TIKTOK_PROFILE = :"tiktok-profile"
                TIKTOK_VIDEO = :"tiktok-video"
                TIKTOK_FEED = :"tiktok-feed"
                TIKTOK_COMMENTS = :"tiktok-comments"
                TIKTOK_FOLLOWERS = :"tiktok-followers"
                TIKTOK_FOLLOWING = :"tiktok-following"
                TIKTOK_USER_SEARCH = :"tiktok-user-search"
                REDDIT_POST = :"reddit-post"
                REDDIT_SEARCH = :"reddit-search"
                REDDIT_SUBREDDIT = :"reddit-subreddit"
                REDDIT_USER = :"reddit-user"
                YELP_SEARCH = :"yelp-search"
                YELP_REVIEWS = :"yelp-reviews"
                TRIPADVISOR_REVIEWS = :"tripadvisor-reviews"
                CAR_RENTAL_AVAILABILITY = :"car-rental-availability"
                CAR_RENTAL_LOCATIONS = :"car-rental-locations"
                EMAILS = :emails
                PHONE_NUMBERS = :"phone-numbers"
                LINKS = :links

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#product
            class Product < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data, nil]
              required :data,
                       -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data },
                       nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product} for
              #   more details.
              #
              #   Product details found on the page.
              #
              #   @param data [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.

              # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product#data
              class Data < ContextDev::Internal::Type::BaseModel
                # @!attribute is_product_page
                #   Whether the page is a product detail page.
                #
                #   @return [Boolean]
                required :is_product_page, ContextDev::Internal::Type::Boolean, api_name: :isProductPage

                # @!attribute product
                #   The extracted product. `null` when the page is not a product detail page.
                #
                #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product, nil]
                required :product,
                         -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product },
                         nil?: true

                # @!method initialize(is_product_page:, product:)
                #   @param is_product_page [Boolean] Whether the page is a product detail page.
                #
                #   @param product [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product, nil] The extracted product. `null` when the page is not a product detail page.

                # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data#product
                class Product < ContextDev::Internal::Type::BaseModel
                  # @!attribute availability
                  #   Stock or ordering availability.
                  #
                  #   @return [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Availability, nil]
                  required :availability,
                           enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Availability },
                           nil?: true

                  # @!attribute brand
                  #   Brand or vendor.
                  #
                  #   @return [String, nil]
                  required :brand, String, nil?: true

                  # @!attribute category
                  #   Product category.
                  #
                  #   @return [String, nil]
                  required :category, String, nil?: true

                  # @!attribute currency
                  #   ISO 4217 currency code of `price`.
                  #
                  #   @return [String, nil]
                  required :currency, String, nil?: true

                  # @!attribute description
                  #   Product description.
                  #
                  #   @return [String, nil]
                  required :description, String, nil?: true

                  # @!attribute dimensions
                  #   Product dimensions as shown on the page.
                  #
                  #   @return [Array<String>]
                  required :dimensions, ContextDev::Internal::Type::ArrayOf[String]

                  # @!attribute features
                  #   Key features and specifications.
                  #
                  #   @return [Array<String>]
                  required :features, ContextDev::Internal::Type::ArrayOf[String]

                  # @!attribute images
                  #   Product image URLs, main image first.
                  #
                  #   @return [Array<String>]
                  required :images, ContextDev::Internal::Type::ArrayOf[String]

                  # @!attribute image_url
                  #   Main product image URL.
                  #
                  #   @return [String, nil]
                  required :image_url, String, api_name: :imageUrl, nil?: true

                  # @!attribute name
                  #   Product name.
                  #
                  #   @return [String]
                  required :name, String

                  # @!attribute price
                  #   Current price.
                  #
                  #   @return [Float, nil]
                  required :price, Float, nil?: true

                  # @!attribute regular_price
                  #   List price before any discount.
                  #
                  #   @return [Float, nil]
                  required :regular_price, Float, api_name: :regularPrice, nil?: true

                  # @!attribute sku
                  #   Product identifier such as a SKU or model number.
                  #
                  #   @return [String, nil]
                  required :sku, String, nil?: true

                  # @!attribute tags
                  #   Product tags.
                  #
                  #   @return [Array<String>]
                  required :tags, ContextDev::Internal::Type::ArrayOf[String]

                  # @!attribute target_audience
                  #   Intended audience.
                  #
                  #   @return [Array<String>]
                  required :target_audience,
                           ContextDev::Internal::Type::ArrayOf[String],
                           api_name: :targetAudience

                  # @!attribute variants
                  #   Product variants, such as colors or sizes, with their attributes and images.
                  #   `[]` when none are found. May not include every variant the store offers.
                  #
                  #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Variant>]
                  required :variants,
                           -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Variant] }

                  # @!method initialize(availability:, brand:, category:, currency:, description:, dimensions:, features:, images:, image_url:, name:, price:, regular_price:, sku:, tags:, target_audience:, variants:)
                  #   Some parameter documentations has been truncated, see
                  #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product}
                  #   for more details.
                  #
                  #   The extracted product. `null` when the page is not a product detail page.
                  #
                  #   @param availability [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Availability, nil] Stock or ordering availability.
                  #
                  #   @param brand [String, nil] Brand or vendor.
                  #
                  #   @param category [String, nil] Product category.
                  #
                  #   @param currency [String, nil] ISO 4217 currency code of `price`.
                  #
                  #   @param description [String, nil] Product description.
                  #
                  #   @param dimensions [Array<String>] Product dimensions as shown on the page.
                  #
                  #   @param features [Array<String>] Key features and specifications.
                  #
                  #   @param images [Array<String>] Product image URLs, main image first.
                  #
                  #   @param image_url [String, nil] Main product image URL.
                  #
                  #   @param name [String] Product name.
                  #
                  #   @param price [Float, nil] Current price.
                  #
                  #   @param regular_price [Float, nil] List price before any discount.
                  #
                  #   @param sku [String, nil] Product identifier such as a SKU or model number.
                  #
                  #   @param tags [Array<String>] Product tags.
                  #
                  #   @param target_audience [Array<String>] Intended audience.
                  #
                  #   @param variants [Array<ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Variant>] Product variants, such as colors or sizes, with their attributes and images. `[]

                  # Stock or ordering availability.
                  #
                  # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product#availability
                  module Availability
                    extend ContextDev::Internal::Type::Enum

                    IN_STOCK = :in_stock
                    OUT_OF_STOCK = :out_of_stock
                    LIMITED_AVAILABILITY = :limited_availability
                    PREORDER = :preorder
                    BACKORDER = :backorder
                    MADE_TO_ORDER = :made_to_order
                    DISCONTINUED = :discontinued

                    # @!method self.values
                    #   @return [Array<Symbol>]
                  end

                  class Variant < ContextDev::Internal::Type::BaseModel
                    # @!attribute attributes
                    #   Attributes that define this variant, such as color, size, material, or pattern,
                    #   as stated on the page.
                    #
                    #   @return [Hash{Symbol=>String}]
                    required :attributes, ContextDev::Internal::Type::HashOf[String]

                    # @!attribute images
                    #   Image URLs the source attaches to this variant.
                    #
                    #   @return [Array<String>]
                    required :images, ContextDev::Internal::Type::ArrayOf[String]

                    # @!attribute sku
                    #   SKU of this variant. `null` when the source does not state one.
                    #
                    #   @return [String, nil]
                    required :sku, String, nil?: true

                    # @!attribute url
                    #   URL of this variant or offer, when the source provides one. Several variants can
                    #   share a URL.
                    #
                    #   @return [String, nil]
                    required :url, String, nil?: true

                    # @!attribute availability
                    #   Stock or ordering availability of this variant.
                    #
                    #   @return [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Variant::Availability, nil]
                    optional :availability,
                             enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Variant::Availability },
                             nil?: true

                    # @!attribute currency
                    #   Currency code of `price`, such as `USD` or `EUR`, when stated.
                    #
                    #   @return [String, nil]
                    optional :currency, String, nil?: true

                    # @!attribute price
                    #   Price of this variant, when the source states one per variant.
                    #
                    #   @return [Float, nil]
                    optional :price, Float, nil?: true

                    # @!method initialize(attributes:, images:, sku:, url:, availability: nil, currency: nil, price: nil)
                    #   Some parameter documentations has been truncated, see
                    #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Variant}
                    #   for more details.
                    #
                    #   @param attributes [Hash{Symbol=>String}] Attributes that define this variant, such as color, size, material, or pattern,
                    #
                    #   @param images [Array<String>] Image URLs the source attaches to this variant.
                    #
                    #   @param sku [String, nil] SKU of this variant. `null` when the source does not state one.
                    #
                    #   @param url [String, nil] URL of this variant or offer, when the source provides one. Several variants can
                    #
                    #   @param availability [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Variant::Availability, nil] Stock or ordering availability of this variant.
                    #
                    #   @param currency [String, nil] Currency code of `price`, such as `USD` or `EUR`, when stated.
                    #
                    #   @param price [Float, nil] Price of this variant, when the source states one per variant.

                    # Stock or ordering availability of this variant.
                    #
                    # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Variant#availability
                    module Availability
                      extend ContextDev::Internal::Type::Enum

                      IN_STOCK = :in_stock
                      OUT_OF_STOCK = :out_of_stock
                      LIMITED_AVAILABILITY = :limited_availability
                      PREORDER = :preorder
                      BACKORDER = :backorder
                      MADE_TO_ORDER = :made_to_order
                      DISCONTINUED = :discontinued

                      # @!method self.values
                      #   @return [Array<Symbol>]
                    end
                  end
                end
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#profile
            class Profile < ContextDev::Internal::Type::BaseModel
              # @!attribute id
              #   ID of the browser profile. After creating a profile, save it and pass it as
              #   `sharedParams.profile.profileId` with `type: "existing"`.
              #
              #   @return [String]
              required :id, String

              # @!method initialize(id:)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Profile} for
              #   more details.
              #
              #   Browser profile used for this scrape. `null` when no profile was requested.
              #
              #   @param id [String] ID of the browser profile. After creating a profile, save it and pass it as `sha
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#screenshot
            class Screenshot < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [String, nil]
              required :data, String, nil?: true

              # @!attribute requested
              #   Whether you requested this output in `formats`.
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` when the output succeeded, `false` when it failed, `null` when it was not
              #   requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Machine-readable error code. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Human-readable explanation of the error and how to resolve it.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Screenshot}
              #   for more details.
              #
              #   Screenshot as a base64 image data URL.
              #
              #   @param data [String, nil]
              #
              #   @param requested [Boolean] Whether you requested this output in `formats`.
              #
              #   @param success [Boolean, nil] `true` when the output succeeded, `false` when it failed, `null` when it was not
              #
              #   @param error_code [String] Machine-readable error code. Present only when `success` is `false`.
              #
              #   @param message [String] Human-readable explanation of the error and how to resolve it.
            end

            # `true` when at least one requested output succeeded but others failed or are
            # incomplete. Absent otherwise.
            #
            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#is_partial
            module IsPartial
              extend ContextDev::Internal::Type::Enum

              TRUE = true

              # @!method self.values
              #   @return [Array<Boolean>]
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#key_metadata
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

        # @!method self.variants
        #   @return [Array(ContextDev::Models::BatchGetResultsResponse::Data::Ok, ContextDev::Models::BatchGetResultsResponse::Data::Error)]
      end

      # @see ContextDev::Models::BatchGetResultsResponse#key_metadata
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
