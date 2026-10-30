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
      #   Result records on this page.
      #
      #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok, ContextDev::Models::BatchGetResultsResponse::Data::Error>, nil]
      optional :data,
               -> { ContextDev::Internal::Type::ArrayOf[union: ContextDev::Models::BatchGetResultsResponse::Data] }

      # @!attribute has_more
      #   Whether another page is available.
      #
      #   @return [Boolean, nil]
      optional :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::BatchGetResultsResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BatchGetResultsResponse::KeyMetadata }

      # @!attribute next_cursor
      #   Cursor for the next page.
      #
      #   @return [String, nil]
      optional :next_cursor, String, nil?: true

      # @!method initialize(request_id:, data: nil, has_more: nil, key_metadata: nil, next_cursor: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchGetResultsResponse} for more details.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param data [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok, ContextDev::Models::BatchGetResultsResponse::Data::Error>] Result records on this page.
      #
      #   @param has_more [Boolean] Whether another page is available.
      #
      #   @param key_metadata [ContextDev::Models::BatchGetResultsResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param next_cursor [String, nil] Cursor for the next page.

      # One scrape outcome. result uses the single Scrape Anything response schema;
      # itemId and meta identify your input.
      module Data
        extend ContextDev::Internal::Type::Union

        discriminator :status

        # At least one requested output succeeded. Check result.isPartial and each output success for incomplete results.
        variant :ok, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok }

        # A page the batch could not fetch.
        variant :error, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error }

        class Ok < ContextDev::Internal::Type::BaseModel
          # @!attribute credits_used
          #   Credits charged for this page, including OCR. Cached outputs use the same
          #   pricing as POST /web/scrape.
          #
          #   @return [Integer]
          required :credits_used, Integer

          # @!attribute result
          #   The same response as POST /web/scrape, including per-format success, failure,
          #   and partial results.
          #
          #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result]
          required :result, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result }

          # @!attribute status
          #
          #   @return [Symbol, :ok]
          required :status, const: :ok

          # @!attribute url
          #   URL as submitted, or as discovered by the crawl.
          #
          #   @return [String]
          required :url, String

          # @!attribute item_id
          #   Your `itemId` from submission.
          #
          #   @return [String, nil]
          optional :item_id, String, api_name: :itemId

          # @!attribute meta
          #   Caller-supplied metadata echoed from submission.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :meta, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

          # @!attribute ocr_pages
          #   PDF pages recovered by OCR. Omitted when OCR did not run.
          #
          #   @return [Integer, nil]
          optional :ocr_pages, Integer

          # @!method initialize(credits_used:, result:, url:, item_id: nil, meta: nil, ocr_pages: nil, status: :ok)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok} for more details.
          #
          #   At least one requested output succeeded. Check result.isPartial and each output
          #   success for incomplete results.
          #
          #   @param credits_used [Integer] Credits charged for this page, including OCR. Cached outputs use the same pricin
          #
          #   @param result [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result] The same response as POST /web/scrape, including per-format success, failure, an
          #
          #   @param url [String] URL as submitted, or as discovered by the crawl.
          #
          #   @param item_id [String] Your `itemId` from submission.
          #
          #   @param meta [Hash{Symbol=>Object}] Caller-supplied metadata echoed from submission.
          #
          #   @param ocr_pages [Integer] PDF pages recovered by OCR. Omitted when OCR did not run.
          #
          #   @param status [Symbol, :ok]

          # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok#result
          class Result < ContextDev::Internal::Type::BaseModel
            # @!attribute bytes
            #   The original HTTP response body, unchanged by waits, actions, and filters.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes]
            required :bytes, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes }

            # @!attribute cache_metadata
            #   Whether this response came from cache.
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
            #   Rendered HTML after content filters.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::HTML]
            required :html, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::HTML }

            # @!attribute images
            #   Images after content filters. `[]` when none are found.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images]
            required :images, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images }

            # @!attribute json
            #   Object matching `jsonParams.schema`.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json]
            required :json, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json }

            # @!attribute markdown
            #   Markdown after content filters.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Markdown]
            required :markdown, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Markdown }

            # @!attribute metadata
            #   Page metadata. Fields are omitted when not found.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata]
            required :metadata, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata }

            # @!attribute parsed
            #   Custom rules return fields after content filters; unmatched fields are null ([]
            #   for lists). The google-maps parser returns business records in data.results,
            #   google-maps-reviews returns data.reviews, and the google-play parser returns one
            #   app record as data, google-play-reviews returns data.reviews, app-store and
            #   app-store-reviews do the same for the App Store, g2-reviews returns data.reviews
            #   for a G2 product, instagram-profile and instagram-post return one record as
            #   data, instagram-feed returns data.posts, tiktok-profile and tiktok-video return
            #   one record as data, tiktok-feed returns data.videos, tiktok-comments returns
            #   data.comments, tiktok-followers, tiktok-following, and tiktok-user-search return
            #   data.users, yelp-search returns up to 20 ranked organic businesses in
            #   data.businesses, plus total and pagination, from a Yelp search URL; yelp-reviews
            #   returns up to 20 latest public reviews in data.reviews, with business details
            #   and next_offset, from a Yelp business URL; emails, phone-numbers, and links
            #   return data.emails, data.phone_numbers, and data.links from the rendered page;
            #   the store, Maps, G2, Instagram, and TikTok parsers read their data directly,
            #   independently of DOM filters and other outputs.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed]
            required :parsed, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed }

            # @!attribute product
            #   Product details found on the page.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product]
            required :product, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product }

            # @!attribute profile
            #   Authenticated browser profile used for this scrape, or null when no profile was
            #   requested. New and existing profile requests both return the profile ID.
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
            #   True when at least one requested output succeeds but the response has failed or
            #   incomplete outputs. Absent when all requested outputs fail.
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
            #   The same response as POST /web/scrape, including per-format success, failure,
            #   and partial results.
            #
            #   @param bytes [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes] The original HTTP response body, unchanged by waits, actions, and filters.
            #
            #   @param cache_metadata [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata] Whether this response came from cache.
            #
            #   @param highlights [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Highlights] Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks om
            #
            #   @param html [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::HTML] Rendered HTML after content filters.
            #
            #   @param images [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images] Images after content filters. `[]` when none are found.
            #
            #   @param json [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json] Object matching `jsonParams.schema`.
            #
            #   @param markdown [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Markdown] Markdown after content filters.
            #
            #   @param metadata [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata] Page metadata. Fields are omitted when not found.
            #
            #   @param parsed [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed] Custom rules return fields after content filters; unmatched fields are null ([]
            #
            #   @param product [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product] Product details found on the page.
            #
            #   @param profile [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Profile, nil] Authenticated browser profile used for this scrape, or null when no profile was
            #
            #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
            #
            #   @param screenshot [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Screenshot] Screenshot as a base64 image data URL.
            #
            #   @param url [String] Final URL after redirects and browser actions.
            #
            #   @param is_partial [Boolean, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::IsPartial] True when at least one requested output succeeds but the response has failed or
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
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Explanation of the failure and possible next steps.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   The original HTTP response body, unchanged by waits, actions, and filters.
              #
              #   @param data [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes::Data, nil]
              #
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param message [String] Explanation of the failure and possible next steps.

              # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes#data
              class Data < ContextDev::Internal::Type::BaseModel
                # @!attribute base64
                #   Body as base64, after HTTP decompression. Up to 50 MiB decoded.
                #
                #   @return [String]
                required :base64, String

                # @!attribute content_type
                #
                #   @return [String]
                required :content_type, String, api_name: :contentType

                # @!method initialize(base64:, content_type:)
                #   @param base64 [String] Body as base64, after HTTP decompression. Up to 50 MiB decoded.
                #
                #   @param content_type [String]
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#cache_metadata
            class CacheMetadata < ContextDev::Internal::Type::BaseModel
              # @!attribute age_ms
              #   Age of the cached data in milliseconds. Zero for miss and zdr responses.
              #
              #   @return [Integer]
              required :age_ms, Integer

              # @!attribute status
              #   Whether the response was served from cache, required fresh work, or honored
              #   zero-data-retention cache bypass.
              #
              #   @return [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata::Status]
              required :status,
                       enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata::Status }

              # @!method initialize(age_ms:, status:)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata}
              #   for more details.
              #
              #   Whether this response came from cache.
              #
              #   @param age_ms [Integer] Age of the cached data in milliseconds. Zero for miss and zdr responses.
              #
              #   @param status [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata::Status] Whether the response was served from cache, required fresh work, or honored zero

              # Whether the response was served from cache, required fresh work, or honored
              # zero-data-retention cache bypass.
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
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Explanation of the failure and possible next steps.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks
              #   omitted text.
              #
              #   @param data [Array<String>, nil]
              #
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param message [String] Explanation of the failure and possible next steps.
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#html
            class HTML < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [String, nil]
              required :data, String, nil?: true

              # @!attribute requested
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Explanation of the failure and possible next steps.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Rendered HTML after content filters.
              #
              #   @param data [String, nil]
              #
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param message [String] Explanation of the failure and possible next steps.
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
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Explanation of the failure and possible next steps.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Images after content filters. `[]` when none are found.
              #
              #   @param data [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data>, nil]
              #
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param message [String] Explanation of the failure and possible next steps.

              class Data < ContextDev::Internal::Type::BaseModel
                # @!attribute alt
                #   Alt text, if present.
                #
                #   @return [String, nil]
                required :alt, String, nil?: true

                # @!attribute url
                #   Image URL, or a data URI for inline images.
                #
                #   @return [String]
                required :url, String

                # @!attribute classification
                #
                #   @return [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification, nil]
                optional :classification,
                         enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification }

                # @!attribute file_url
                #   Hosted image URL, valid for 24 hours after capture. Requires `file` enrichment
                #   and ZDR disabled.
                #
                #   @return [String, nil]
                optional :file_url, String, api_name: :fileUrl

                # @!attribute height
                #
                #   @return [Integer, nil]
                optional :height, Integer

                # @!attribute width
                #
                #   @return [Integer, nil]
                optional :width, Integer

                # @!method initialize(alt:, url:, classification: nil, file_url: nil, height: nil, width: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data}
                #   for more details.
                #
                #   @param alt [String, nil] Alt text, if present.
                #
                #   @param url [String] Image URL, or a data URI for inline images.
                #
                #   @param classification [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification]
                #
                #   @param file_url [String] Hosted image URL, valid for 24 hours after capture. Requires `file` enrichment a
                #
                #   @param height [Integer]
                #
                #   @param width [Integer]

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
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute is_truncated
              #   True when the page was too long to read in full, so values found only in the
              #   unread parts may be missing.
              #
              #   @return [Boolean, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json::IsTruncated, nil]
              optional :is_truncated,
                       enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json::IsTruncated },
                       api_name: :isTruncated

              # @!attribute message
              #   Explanation of the failure and possible next steps.
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
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param is_truncated [Boolean, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json::IsTruncated] True when the page was too long to read in full, so values found only in the unr
              #
              #   @param message [String] Explanation of the failure and possible next steps.

              # True when the page was too long to read in full, so values found only in the
              # unread parts may be missing.
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
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Explanation of the failure and possible next steps.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Markdown after content filters.
              #
              #   @param data [String, nil]
              #
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param message [String] Explanation of the failure and possible next steps.
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#metadata
            class Metadata < ContextDev::Internal::Type::BaseModel
              # @!attribute additional_meta
              #   Additional non-social meta tags not promoted to top-level metadata fields.
              #
              #   @return [Hash{Symbol=>String, Array<String>}, nil]
              optional :additional_meta,
                       -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::AdditionalMeta] },
                       api_name: :additionalMeta

              # @!attribute alternates
              #   Resolved alternate links from link rel=alternate tags.
              #
              #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Alternate>, nil]
              optional :alternates,
                       -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Alternate] }

              # @!attribute author
              #   Author metadata, when present.
              #
              #   @return [String, nil]
              optional :author, String

              # @!attribute canonical_url
              #   Resolved canonical URL, when present.
              #
              #   @return [String, nil]
              optional :canonical_url, String, api_name: :canonicalUrl

              # @!attribute description
              #   Best description extracted from standard, Open Graph, or Twitter metadata.
              #
              #   @return [String, nil]
              optional :description, String

              # @!attribute favicon
              #   Resolved favicon URL, when present.
              #
              #   @return [String, nil]
              optional :favicon, String

              # @!attribute headings
              #   Up to 500 h1–h6 headings in document order, before content filtering.
              #
              #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Heading>, nil]
              optional :headings,
                       -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Heading] }

              # @!attribute image
              #   Primary resolved preview image from Open Graph, Twitter, or image metadata.
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
              #   Keywords extracted from the page's keywords meta tag.
              #
              #   @return [Array<String>, nil]
              optional :keywords, ContextDev::Internal::Type::ArrayOf[String]

              # @!attribute language
              #   Language extracted from html lang or language meta tags.
              #
              #   @return [String, nil]
              optional :language, String

              # @!attribute modified_time
              #   Modified timestamp/date from page metadata, when present.
              #
              #   @return [String, nil]
              optional :modified_time, String, api_name: :modifiedTime

              # @!attribute open_graph
              #   Open Graph metadata with the og: prefix removed and keys camel-cased.
              #
              #   @return [Hash{Symbol=>String, Array<String>}, nil]
              optional :open_graph,
                       -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::OpenGraph] },
                       api_name: :openGraph

              # @!attribute published_time
              #   Published timestamp/date from page metadata, when present.
              #
              #   @return [String, nil]
              optional :published_time, String, api_name: :publishedTime

              # @!attribute robots
              #   Robots meta directive, when present.
              #
              #   @return [String, nil]
              optional :robots, String

              # @!attribute site_name
              #   Site or application name from page metadata.
              #
              #   @return [String, nil]
              optional :site_name, String, api_name: :siteName

              # @!attribute title
              #   Best title extracted from the page.
              #
              #   @return [String, nil]
              optional :title, String

              # @!attribute twitter
              #   Twitter card metadata with the twitter: prefix removed and keys camel-cased.
              #
              #   @return [Hash{Symbol=>String, Array<String>}, nil]
              optional :twitter,
                       -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Twitter] }

              # @!method initialize(additional_meta: nil, alternates: nil, author: nil, canonical_url: nil, description: nil, favicon: nil, headings: nil, image: nil, json_ld: nil, keywords: nil, language: nil, modified_time: nil, open_graph: nil, published_time: nil, robots: nil, site_name: nil, title: nil, twitter: nil)
              #   Page metadata. Fields are omitted when not found.
              #
              #   @param additional_meta [Hash{Symbol=>String, Array<String>}] Additional non-social meta tags not promoted to top-level metadata fields.
              #
              #   @param alternates [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Alternate>] Resolved alternate links from link rel=alternate tags.
              #
              #   @param author [String] Author metadata, when present.
              #
              #   @param canonical_url [String] Resolved canonical URL, when present.
              #
              #   @param description [String] Best description extracted from standard, Open Graph, or Twitter metadata.
              #
              #   @param favicon [String] Resolved favicon URL, when present.
              #
              #   @param headings [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Heading>] Up to 500 h1–h6 headings in document order, before content filtering.
              #
              #   @param image [String] Primary resolved preview image from Open Graph, Twitter, or image metadata.
              #
              #   @param json_ld [Array<Hash{Symbol=>Object}>] JSON-LD structured data blocks parsed from the page.
              #
              #   @param keywords [Array<String>] Keywords extracted from the page's keywords meta tag.
              #
              #   @param language [String] Language extracted from html lang or language meta tags.
              #
              #   @param modified_time [String] Modified timestamp/date from page metadata, when present.
              #
              #   @param open_graph [Hash{Symbol=>String, Array<String>}] Open Graph metadata with the og: prefix removed and keys camel-cased.
              #
              #   @param published_time [String] Published timestamp/date from page metadata, when present.
              #
              #   @param robots [String] Robots meta directive, when present.
              #
              #   @param site_name [String] Site or application name from page metadata.
              #
              #   @param title [String] Best title extracted from the page.
              #
              #   @param twitter [Hash{Symbol=>String, Array<String>}] Twitter card metadata with the twitter: prefix removed and keys camel-cased.

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
                #   Resolved alternate URL.
                #
                #   @return [String]
                required :href, String

                # @!attribute hreflang
                #   Language or locale for the alternate URL, when present.
                #
                #   @return [String, nil]
                optional :hreflang, String

                # @!attribute title
                #   Alternate resource title, when present.
                #
                #   @return [String, nil]
                optional :title, String

                # @!attribute type
                #   Alternate resource MIME type, when present.
                #
                #   @return [String, nil]
                optional :type, String

                # @!method initialize(href:, hreflang: nil, title: nil, type: nil)
                #   @param href [String] Resolved alternate URL.
                #
                #   @param hreflang [String] Language or locale for the alternate URL, when present.
                #
                #   @param title [String] Alternate resource title, when present.
                #
                #   @param type [String] Alternate resource MIME type, when present.
              end

              class Heading < ContextDev::Internal::Type::BaseModel
                # @!attribute level
                #   Heading level, 1–6 (from h1–h6).
                #
                #   @return [Integer]
                required :level, Integer

                # @!attribute text
                #   Heading text with whitespace collapsed, truncated to 1000 characters.
                #
                #   @return [String]
                required :text, String

                # @!method initialize(level:, text:)
                #   @param level [Integer] Heading level, 1–6 (from h1–h6).
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
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute type
              #   The selected prebuilt parser name, or custom when type is omitted, custom rules
              #   are used, or parsing is not requested.
              #
              #   @return [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type]
              required :type, enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type }

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Explanation of the failure and possible next steps.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, type:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed} for more
              #   details.
              #
              #   Custom rules return fields after content filters; unmatched fields are null ([]
              #   for lists). The google-maps parser returns business records in data.results,
              #   google-maps-reviews returns data.reviews, and the google-play parser returns one
              #   app record as data, google-play-reviews returns data.reviews, app-store and
              #   app-store-reviews do the same for the App Store, g2-reviews returns data.reviews
              #   for a G2 product, instagram-profile and instagram-post return one record as
              #   data, instagram-feed returns data.posts, tiktok-profile and tiktok-video return
              #   one record as data, tiktok-feed returns data.videos, tiktok-comments returns
              #   data.comments, tiktok-followers, tiktok-following, and tiktok-user-search return
              #   data.users, yelp-search returns up to 20 ranked organic businesses in
              #   data.businesses, plus total and pagination, from a Yelp search URL; yelp-reviews
              #   returns up to 20 latest public reviews in data.reviews, with business details
              #   and next_offset, from a Yelp business URL; emails, phone-numbers, and links
              #   return data.emails, data.phone_numbers, and data.links from the rendered page;
              #   the store, Maps, G2, Instagram, and TikTok parsers read their data directly,
              #   independently of DOM filters and other outputs.
              #
              #   @param data [Hash{Symbol=>Object}, nil]
              #
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param type [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type] The selected prebuilt parser name, or custom when type is omitted, custom rules
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param message [String] Explanation of the failure and possible next steps.

              # The selected prebuilt parser name, or custom when type is omitted, custom rules
              # are used, or parsing is not requested.
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
                YELP_SEARCH = :"yelp-search"
                YELP_REVIEWS = :"yelp-reviews"
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
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Explanation of the failure and possible next steps.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Product details found on the page.
              #
              #   @param data [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data, nil]
              #
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param message [String] Explanation of the failure and possible next steps.

              # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product#data
              class Data < ContextDev::Internal::Type::BaseModel
                # @!attribute is_product_page
                #   Whether the page is a product detail page.
                #
                #   @return [Boolean]
                required :is_product_page, ContextDev::Internal::Type::Boolean, api_name: :isProductPage

                # @!attribute product
                #   The extracted product, or null when the page is not a product detail page.
                #
                #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product, nil]
                required :product,
                         -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product },
                         nil?: true

                # @!method initialize(is_product_page:, product:)
                #   @param is_product_page [Boolean] Whether the page is a product detail page.
                #
                #   @param product [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product, nil] The extracted product, or null when the page is not a product detail page.

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
                  #   ISO 4217 currency code.
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
                  #   Product variations, such as different colors or sizes, with their attributes and
                  #   images. Empty if none are found. May not include every variation offered by the
                  #   store.
                  #
                  #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Variant>]
                  required :variants,
                           -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Variant] }

                  # @!method initialize(availability:, brand:, category:, currency:, description:, dimensions:, features:, images:, image_url:, name:, price:, regular_price:, sku:, tags:, target_audience:, variants:)
                  #   Some parameter documentations has been truncated, see
                  #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product}
                  #   for more details.
                  #
                  #   The extracted product, or null when the page is not a product detail page.
                  #
                  #   @param availability [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Availability, nil] Stock or ordering availability.
                  #
                  #   @param brand [String, nil] Brand or vendor.
                  #
                  #   @param category [String, nil] Product category.
                  #
                  #   @param currency [String, nil] ISO 4217 currency code.
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
                  #   @param variants [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Variant>] Product variations, such as different colors or sizes, with their attributes and

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
                    #   Explicit variant attributes such as color, size, material, pattern and
                    #   properties declared by page.
                    #
                    #   @return [Hash{Symbol=>String}]
                    required :attributes, ContextDev::Internal::Type::HashOf[String]

                    # @!attribute images
                    #   Original source image URLs explicitly attached to this variant.
                    #
                    #   @return [Array<String>]
                    required :images, ContextDev::Internal::Type::ArrayOf[String]

                    # @!attribute sku
                    #
                    #   @return [String, nil]
                    required :sku, String, nil?: true

                    # @!attribute url
                    #   Variant or offer URL when provided by the source. May be shared by variants.
                    #
                    #   @return [String, nil]
                    required :url, String, nil?: true

                    # @!method initialize(attributes:, images:, sku:, url:)
                    #   Some parameter documentations has been truncated, see
                    #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Variant}
                    #   for more details.
                    #
                    #   @param attributes [Hash{Symbol=>String}] Explicit variant attributes such as color, size, material, pattern and propertie
                    #
                    #   @param images [Array<String>] Original source image URLs explicitly attached to this variant.
                    #
                    #   @param sku [String, nil]
                    #
                    #   @param url [String, nil] Variant or offer URL when provided by the source. May be shared by variants.
                  end
                end
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#profile
            class Profile < ContextDev::Internal::Type::BaseModel
              # @!attribute id
              #   Save this ID after creating a profile, then reuse it as
              #   sharedParams.profile.profileId with type "existing".
              #
              #   @return [String]
              required :id, String

              # @!method initialize(id:)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Profile} for
              #   more details.
              #
              #   Authenticated browser profile used for this scrape, or null when no profile was
              #   requested. New and existing profile requests both return the profile ID.
              #
              #   @param id [String] Save this ID after creating a profile, then reuse it as sharedParams.profile.pro
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result#screenshot
            class Screenshot < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [String, nil]
              required :data, String, nil?: true

              # @!attribute requested
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Explanation of the failure and possible next steps.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Screenshot as a base64 image data URL.
              #
              #   @param data [String, nil]
              #
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param message [String] Explanation of the failure and possible next steps.
            end

            # True when at least one requested output succeeds but the response has failed or
            # incomplete outputs. Absent when all requested outputs fail.
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

        class Error < ContextDev::Internal::Type::BaseModel
          # @!attribute error_code
          #   Why the page failed.
          #
          #   @return [String]
          required :error_code, String

          # @!attribute message
          #   Human-readable failure detail.
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
          #   Credits charged for this page, including OCR. Cached outputs use the same
          #   pricing as POST /web/scrape.
          #
          #   @return [Integer, nil]
          optional :credits_used, Integer

          # @!attribute item_id
          #   Your `itemId` from submission.
          #
          #   @return [String, nil]
          optional :item_id, String, api_name: :itemId

          # @!attribute meta
          #   Caller-supplied metadata echoed from submission.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :meta, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

          # @!attribute ocr_pages
          #   PDF pages recovered by OCR. Omitted when OCR did not run.
          #
          #   @return [Integer, nil]
          optional :ocr_pages, Integer

          # @!attribute result
          #   Per-format failures when scraping returned a structured response. Omitted for
          #   errors that prevent scraping.
          #
          #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result, nil]
          optional :result, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result }

          # @!method initialize(error_code:, message:, url:, credits_used: nil, item_id: nil, meta: nil, ocr_pages: nil, result: nil, status: :error)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BatchGetResultsResponse::Data::Error} for more details.
          #
          #   A page the batch could not fetch.
          #
          #   @param error_code [String] Why the page failed.
          #
          #   @param message [String] Human-readable failure detail.
          #
          #   @param url [String] URL as submitted, or as discovered by the crawl.
          #
          #   @param credits_used [Integer] Credits charged for this page, including OCR. Cached outputs use the same pricin
          #
          #   @param item_id [String] Your `itemId` from submission.
          #
          #   @param meta [Hash{Symbol=>Object}] Caller-supplied metadata echoed from submission.
          #
          #   @param ocr_pages [Integer] PDF pages recovered by OCR. Omitted when OCR did not run.
          #
          #   @param result [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result] Per-format failures when scraping returned a structured response. Omitted for er
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
            #   Whether this response came from cache.
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
            #   Rendered HTML after content filters.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::HTML]
            required :html, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::HTML }

            # @!attribute images
            #   Images after content filters. `[]` when none are found.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images]
            required :images, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images }

            # @!attribute json
            #   Object matching `jsonParams.schema`.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json]
            required :json, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json }

            # @!attribute markdown
            #   Markdown after content filters.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Markdown]
            required :markdown, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Markdown }

            # @!attribute metadata
            #   Page metadata. Fields are omitted when not found.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata]
            required :metadata, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata }

            # @!attribute parsed
            #   Custom rules return fields after content filters; unmatched fields are null ([]
            #   for lists). The google-maps parser returns business records in data.results,
            #   google-maps-reviews returns data.reviews, and the google-play parser returns one
            #   app record as data, google-play-reviews returns data.reviews, app-store and
            #   app-store-reviews do the same for the App Store, g2-reviews returns data.reviews
            #   for a G2 product, instagram-profile and instagram-post return one record as
            #   data, instagram-feed returns data.posts, tiktok-profile and tiktok-video return
            #   one record as data, tiktok-feed returns data.videos, tiktok-comments returns
            #   data.comments, tiktok-followers, tiktok-following, and tiktok-user-search return
            #   data.users, yelp-search returns up to 20 ranked organic businesses in
            #   data.businesses, plus total and pagination, from a Yelp search URL; yelp-reviews
            #   returns up to 20 latest public reviews in data.reviews, with business details
            #   and next_offset, from a Yelp business URL; emails, phone-numbers, and links
            #   return data.emails, data.phone_numbers, and data.links from the rendered page;
            #   the store, Maps, G2, Instagram, and TikTok parsers read their data directly,
            #   independently of DOM filters and other outputs.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed]
            required :parsed, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed }

            # @!attribute product
            #   Product details found on the page.
            #
            #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product]
            required :product, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product }

            # @!attribute profile
            #   Authenticated browser profile used for this scrape, or null when no profile was
            #   requested. New and existing profile requests both return the profile ID.
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
            #   True when at least one requested output succeeds but the response has failed or
            #   incomplete outputs. Absent when all requested outputs fail.
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
            #   Per-format failures when scraping returned a structured response. Omitted for
            #   errors that prevent scraping.
            #
            #   @param bytes [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes] The original HTTP response body, unchanged by waits, actions, and filters.
            #
            #   @param cache_metadata [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata] Whether this response came from cache.
            #
            #   @param highlights [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Highlights] Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks om
            #
            #   @param html [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::HTML] Rendered HTML after content filters.
            #
            #   @param images [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images] Images after content filters. `[]` when none are found.
            #
            #   @param json [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json] Object matching `jsonParams.schema`.
            #
            #   @param markdown [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Markdown] Markdown after content filters.
            #
            #   @param metadata [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata] Page metadata. Fields are omitted when not found.
            #
            #   @param parsed [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed] Custom rules return fields after content filters; unmatched fields are null ([]
            #
            #   @param product [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product] Product details found on the page.
            #
            #   @param profile [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Profile, nil] Authenticated browser profile used for this scrape, or null when no profile was
            #
            #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
            #
            #   @param screenshot [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Screenshot] Screenshot as a base64 image data URL.
            #
            #   @param url [String] Final URL after redirects and browser actions.
            #
            #   @param is_partial [Boolean, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::IsPartial] True when at least one requested output succeeds but the response has failed or
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
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Explanation of the failure and possible next steps.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   The original HTTP response body, unchanged by waits, actions, and filters.
              #
              #   @param data [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes::Data, nil]
              #
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param message [String] Explanation of the failure and possible next steps.

              # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes#data
              class Data < ContextDev::Internal::Type::BaseModel
                # @!attribute base64
                #   Body as base64, after HTTP decompression. Up to 50 MiB decoded.
                #
                #   @return [String]
                required :base64, String

                # @!attribute content_type
                #
                #   @return [String]
                required :content_type, String, api_name: :contentType

                # @!method initialize(base64:, content_type:)
                #   @param base64 [String] Body as base64, after HTTP decompression. Up to 50 MiB decoded.
                #
                #   @param content_type [String]
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#cache_metadata
            class CacheMetadata < ContextDev::Internal::Type::BaseModel
              # @!attribute age_ms
              #   Age of the cached data in milliseconds. Zero for miss and zdr responses.
              #
              #   @return [Integer]
              required :age_ms, Integer

              # @!attribute status
              #   Whether the response was served from cache, required fresh work, or honored
              #   zero-data-retention cache bypass.
              #
              #   @return [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata::Status]
              required :status,
                       enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata::Status }

              # @!method initialize(age_ms:, status:)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata}
              #   for more details.
              #
              #   Whether this response came from cache.
              #
              #   @param age_ms [Integer] Age of the cached data in milliseconds. Zero for miss and zdr responses.
              #
              #   @param status [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata::Status] Whether the response was served from cache, required fresh work, or honored zero

              # Whether the response was served from cache, required fresh work, or honored
              # zero-data-retention cache bypass.
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
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Explanation of the failure and possible next steps.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks
              #   omitted text.
              #
              #   @param data [Array<String>, nil]
              #
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param message [String] Explanation of the failure and possible next steps.
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#html
            class HTML < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [String, nil]
              required :data, String, nil?: true

              # @!attribute requested
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Explanation of the failure and possible next steps.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Rendered HTML after content filters.
              #
              #   @param data [String, nil]
              #
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param message [String] Explanation of the failure and possible next steps.
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
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Explanation of the failure and possible next steps.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Images after content filters. `[]` when none are found.
              #
              #   @param data [Array<ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data>, nil]
              #
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param message [String] Explanation of the failure and possible next steps.

              class Data < ContextDev::Internal::Type::BaseModel
                # @!attribute alt
                #   Alt text, if present.
                #
                #   @return [String, nil]
                required :alt, String, nil?: true

                # @!attribute url
                #   Image URL, or a data URI for inline images.
                #
                #   @return [String]
                required :url, String

                # @!attribute classification
                #
                #   @return [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification, nil]
                optional :classification,
                         enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification }

                # @!attribute file_url
                #   Hosted image URL, valid for 24 hours after capture. Requires `file` enrichment
                #   and ZDR disabled.
                #
                #   @return [String, nil]
                optional :file_url, String, api_name: :fileUrl

                # @!attribute height
                #
                #   @return [Integer, nil]
                optional :height, Integer

                # @!attribute width
                #
                #   @return [Integer, nil]
                optional :width, Integer

                # @!method initialize(alt:, url:, classification: nil, file_url: nil, height: nil, width: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data}
                #   for more details.
                #
                #   @param alt [String, nil] Alt text, if present.
                #
                #   @param url [String] Image URL, or a data URI for inline images.
                #
                #   @param classification [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification]
                #
                #   @param file_url [String] Hosted image URL, valid for 24 hours after capture. Requires `file` enrichment a
                #
                #   @param height [Integer]
                #
                #   @param width [Integer]

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
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute is_truncated
              #   True when the page was too long to read in full, so values found only in the
              #   unread parts may be missing.
              #
              #   @return [Boolean, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json::IsTruncated, nil]
              optional :is_truncated,
                       enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json::IsTruncated },
                       api_name: :isTruncated

              # @!attribute message
              #   Explanation of the failure and possible next steps.
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
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param is_truncated [Boolean, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json::IsTruncated] True when the page was too long to read in full, so values found only in the unr
              #
              #   @param message [String] Explanation of the failure and possible next steps.

              # True when the page was too long to read in full, so values found only in the
              # unread parts may be missing.
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
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Explanation of the failure and possible next steps.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Markdown after content filters.
              #
              #   @param data [String, nil]
              #
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param message [String] Explanation of the failure and possible next steps.
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#metadata
            class Metadata < ContextDev::Internal::Type::BaseModel
              # @!attribute additional_meta
              #   Additional non-social meta tags not promoted to top-level metadata fields.
              #
              #   @return [Hash{Symbol=>String, Array<String>}, nil]
              optional :additional_meta,
                       -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::AdditionalMeta] },
                       api_name: :additionalMeta

              # @!attribute alternates
              #   Resolved alternate links from link rel=alternate tags.
              #
              #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Alternate>, nil]
              optional :alternates,
                       -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Alternate] }

              # @!attribute author
              #   Author metadata, when present.
              #
              #   @return [String, nil]
              optional :author, String

              # @!attribute canonical_url
              #   Resolved canonical URL, when present.
              #
              #   @return [String, nil]
              optional :canonical_url, String, api_name: :canonicalUrl

              # @!attribute description
              #   Best description extracted from standard, Open Graph, or Twitter metadata.
              #
              #   @return [String, nil]
              optional :description, String

              # @!attribute favicon
              #   Resolved favicon URL, when present.
              #
              #   @return [String, nil]
              optional :favicon, String

              # @!attribute headings
              #   Up to 500 h1–h6 headings in document order, before content filtering.
              #
              #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Heading>, nil]
              optional :headings,
                       -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Heading] }

              # @!attribute image
              #   Primary resolved preview image from Open Graph, Twitter, or image metadata.
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
              #   Keywords extracted from the page's keywords meta tag.
              #
              #   @return [Array<String>, nil]
              optional :keywords, ContextDev::Internal::Type::ArrayOf[String]

              # @!attribute language
              #   Language extracted from html lang or language meta tags.
              #
              #   @return [String, nil]
              optional :language, String

              # @!attribute modified_time
              #   Modified timestamp/date from page metadata, when present.
              #
              #   @return [String, nil]
              optional :modified_time, String, api_name: :modifiedTime

              # @!attribute open_graph
              #   Open Graph metadata with the og: prefix removed and keys camel-cased.
              #
              #   @return [Hash{Symbol=>String, Array<String>}, nil]
              optional :open_graph,
                       -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::OpenGraph] },
                       api_name: :openGraph

              # @!attribute published_time
              #   Published timestamp/date from page metadata, when present.
              #
              #   @return [String, nil]
              optional :published_time, String, api_name: :publishedTime

              # @!attribute robots
              #   Robots meta directive, when present.
              #
              #   @return [String, nil]
              optional :robots, String

              # @!attribute site_name
              #   Site or application name from page metadata.
              #
              #   @return [String, nil]
              optional :site_name, String, api_name: :siteName

              # @!attribute title
              #   Best title extracted from the page.
              #
              #   @return [String, nil]
              optional :title, String

              # @!attribute twitter
              #   Twitter card metadata with the twitter: prefix removed and keys camel-cased.
              #
              #   @return [Hash{Symbol=>String, Array<String>}, nil]
              optional :twitter,
                       -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Twitter] }

              # @!method initialize(additional_meta: nil, alternates: nil, author: nil, canonical_url: nil, description: nil, favicon: nil, headings: nil, image: nil, json_ld: nil, keywords: nil, language: nil, modified_time: nil, open_graph: nil, published_time: nil, robots: nil, site_name: nil, title: nil, twitter: nil)
              #   Page metadata. Fields are omitted when not found.
              #
              #   @param additional_meta [Hash{Symbol=>String, Array<String>}] Additional non-social meta tags not promoted to top-level metadata fields.
              #
              #   @param alternates [Array<ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Alternate>] Resolved alternate links from link rel=alternate tags.
              #
              #   @param author [String] Author metadata, when present.
              #
              #   @param canonical_url [String] Resolved canonical URL, when present.
              #
              #   @param description [String] Best description extracted from standard, Open Graph, or Twitter metadata.
              #
              #   @param favicon [String] Resolved favicon URL, when present.
              #
              #   @param headings [Array<ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Heading>] Up to 500 h1–h6 headings in document order, before content filtering.
              #
              #   @param image [String] Primary resolved preview image from Open Graph, Twitter, or image metadata.
              #
              #   @param json_ld [Array<Hash{Symbol=>Object}>] JSON-LD structured data blocks parsed from the page.
              #
              #   @param keywords [Array<String>] Keywords extracted from the page's keywords meta tag.
              #
              #   @param language [String] Language extracted from html lang or language meta tags.
              #
              #   @param modified_time [String] Modified timestamp/date from page metadata, when present.
              #
              #   @param open_graph [Hash{Symbol=>String, Array<String>}] Open Graph metadata with the og: prefix removed and keys camel-cased.
              #
              #   @param published_time [String] Published timestamp/date from page metadata, when present.
              #
              #   @param robots [String] Robots meta directive, when present.
              #
              #   @param site_name [String] Site or application name from page metadata.
              #
              #   @param title [String] Best title extracted from the page.
              #
              #   @param twitter [Hash{Symbol=>String, Array<String>}] Twitter card metadata with the twitter: prefix removed and keys camel-cased.

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
                #   Resolved alternate URL.
                #
                #   @return [String]
                required :href, String

                # @!attribute hreflang
                #   Language or locale for the alternate URL, when present.
                #
                #   @return [String, nil]
                optional :hreflang, String

                # @!attribute title
                #   Alternate resource title, when present.
                #
                #   @return [String, nil]
                optional :title, String

                # @!attribute type
                #   Alternate resource MIME type, when present.
                #
                #   @return [String, nil]
                optional :type, String

                # @!method initialize(href:, hreflang: nil, title: nil, type: nil)
                #   @param href [String] Resolved alternate URL.
                #
                #   @param hreflang [String] Language or locale for the alternate URL, when present.
                #
                #   @param title [String] Alternate resource title, when present.
                #
                #   @param type [String] Alternate resource MIME type, when present.
              end

              class Heading < ContextDev::Internal::Type::BaseModel
                # @!attribute level
                #   Heading level, 1–6 (from h1–h6).
                #
                #   @return [Integer]
                required :level, Integer

                # @!attribute text
                #   Heading text with whitespace collapsed, truncated to 1000 characters.
                #
                #   @return [String]
                required :text, String

                # @!method initialize(level:, text:)
                #   @param level [Integer] Heading level, 1–6 (from h1–h6).
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
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute type
              #   The selected prebuilt parser name, or custom when type is omitted, custom rules
              #   are used, or parsing is not requested.
              #
              #   @return [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type]
              required :type,
                       enum: -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type }

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Explanation of the failure and possible next steps.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, type:, error_code: nil, message: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed} for
              #   more details.
              #
              #   Custom rules return fields after content filters; unmatched fields are null ([]
              #   for lists). The google-maps parser returns business records in data.results,
              #   google-maps-reviews returns data.reviews, and the google-play parser returns one
              #   app record as data, google-play-reviews returns data.reviews, app-store and
              #   app-store-reviews do the same for the App Store, g2-reviews returns data.reviews
              #   for a G2 product, instagram-profile and instagram-post return one record as
              #   data, instagram-feed returns data.posts, tiktok-profile and tiktok-video return
              #   one record as data, tiktok-feed returns data.videos, tiktok-comments returns
              #   data.comments, tiktok-followers, tiktok-following, and tiktok-user-search return
              #   data.users, yelp-search returns up to 20 ranked organic businesses in
              #   data.businesses, plus total and pagination, from a Yelp search URL; yelp-reviews
              #   returns up to 20 latest public reviews in data.reviews, with business details
              #   and next_offset, from a Yelp business URL; emails, phone-numbers, and links
              #   return data.emails, data.phone_numbers, and data.links from the rendered page;
              #   the store, Maps, G2, Instagram, and TikTok parsers read their data directly,
              #   independently of DOM filters and other outputs.
              #
              #   @param data [Hash{Symbol=>Object}, nil]
              #
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param type [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type] The selected prebuilt parser name, or custom when type is omitted, custom rules
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param message [String] Explanation of the failure and possible next steps.

              # The selected prebuilt parser name, or custom when type is omitted, custom rules
              # are used, or parsing is not requested.
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
                YELP_SEARCH = :"yelp-search"
                YELP_REVIEWS = :"yelp-reviews"
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
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Explanation of the failure and possible next steps.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Product details found on the page.
              #
              #   @param data [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data, nil]
              #
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param message [String] Explanation of the failure and possible next steps.

              # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product#data
              class Data < ContextDev::Internal::Type::BaseModel
                # @!attribute is_product_page
                #   Whether the page is a product detail page.
                #
                #   @return [Boolean]
                required :is_product_page, ContextDev::Internal::Type::Boolean, api_name: :isProductPage

                # @!attribute product
                #   The extracted product, or null when the page is not a product detail page.
                #
                #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product, nil]
                required :product,
                         -> { ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product },
                         nil?: true

                # @!method initialize(is_product_page:, product:)
                #   @param is_product_page [Boolean] Whether the page is a product detail page.
                #
                #   @param product [ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product, nil] The extracted product, or null when the page is not a product detail page.

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
                  #   ISO 4217 currency code.
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
                  #   Product variations, such as different colors or sizes, with their attributes and
                  #   images. Empty if none are found. May not include every variation offered by the
                  #   store.
                  #
                  #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Variant>]
                  required :variants,
                           -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Variant] }

                  # @!method initialize(availability:, brand:, category:, currency:, description:, dimensions:, features:, images:, image_url:, name:, price:, regular_price:, sku:, tags:, target_audience:, variants:)
                  #   Some parameter documentations has been truncated, see
                  #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product}
                  #   for more details.
                  #
                  #   The extracted product, or null when the page is not a product detail page.
                  #
                  #   @param availability [Symbol, ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Availability, nil] Stock or ordering availability.
                  #
                  #   @param brand [String, nil] Brand or vendor.
                  #
                  #   @param category [String, nil] Product category.
                  #
                  #   @param currency [String, nil] ISO 4217 currency code.
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
                  #   @param variants [Array<ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Variant>] Product variations, such as different colors or sizes, with their attributes and

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
                    #   Explicit variant attributes such as color, size, material, pattern and
                    #   properties declared by page.
                    #
                    #   @return [Hash{Symbol=>String}]
                    required :attributes, ContextDev::Internal::Type::HashOf[String]

                    # @!attribute images
                    #   Original source image URLs explicitly attached to this variant.
                    #
                    #   @return [Array<String>]
                    required :images, ContextDev::Internal::Type::ArrayOf[String]

                    # @!attribute sku
                    #
                    #   @return [String, nil]
                    required :sku, String, nil?: true

                    # @!attribute url
                    #   Variant or offer URL when provided by the source. May be shared by variants.
                    #
                    #   @return [String, nil]
                    required :url, String, nil?: true

                    # @!method initialize(attributes:, images:, sku:, url:)
                    #   Some parameter documentations has been truncated, see
                    #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Variant}
                    #   for more details.
                    #
                    #   @param attributes [Hash{Symbol=>String}] Explicit variant attributes such as color, size, material, pattern and propertie
                    #
                    #   @param images [Array<String>] Original source image URLs explicitly attached to this variant.
                    #
                    #   @param sku [String, nil]
                    #
                    #   @param url [String, nil] Variant or offer URL when provided by the source. May be shared by variants.
                  end
                end
              end
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#profile
            class Profile < ContextDev::Internal::Type::BaseModel
              # @!attribute id
              #   Save this ID after creating a profile, then reuse it as
              #   sharedParams.profile.profileId with type "existing".
              #
              #   @return [String]
              required :id, String

              # @!method initialize(id:)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Profile} for
              #   more details.
              #
              #   Authenticated browser profile used for this scrape, or null when no profile was
              #   requested. New and existing profile requests both return the profile ID.
              #
              #   @param id [String] Save this ID after creating a profile, then reuse it as sharedParams.profile.pro
            end

            # @see ContextDev::Models::BatchGetResultsResponse::Data::Error::Result#screenshot
            class Screenshot < ContextDev::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [String, nil]
              required :data, String, nil?: true

              # @!attribute requested
              #
              #   @return [Boolean]
              required :requested, ContextDev::Internal::Type::Boolean

              # @!attribute success
              #   `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @return [Boolean, nil]
              required :success, ContextDev::Internal::Type::Boolean, nil?: true

              # @!attribute error_code
              #   Why the output failed. Present only when `success` is `false`.
              #
              #   @return [String, nil]
              optional :error_code, String

              # @!attribute message
              #   Explanation of the failure and possible next steps.
              #
              #   @return [String, nil]
              optional :message, String

              # @!method initialize(data:, requested:, success:, error_code: nil, message: nil)
              #   Screenshot as a base64 image data URL.
              #
              #   @param data [String, nil]
              #
              #   @param requested [Boolean]
              #
              #   @param success [Boolean, nil] `true` if returned, `false` if it failed, `null` if not requested.
              #
              #   @param error_code [String] Why the output failed. Present only when `success` is `false`.
              #
              #   @param message [String] Explanation of the failure and possible next steps.
            end

            # True when at least one requested output succeeds but the response has failed or
            # incomplete outputs. Absent when all requested outputs fail.
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
