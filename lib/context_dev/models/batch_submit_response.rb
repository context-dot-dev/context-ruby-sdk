# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#submit
    class BatchSubmitResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute id
      #   Batch ID. Poll GET /batch/{batch_id} with it.
      #
      #   @return [String]
      required :id, String

      # @!attribute cache_metadata
      #   Cache outcome for this response. Composite responses are hits only when every
      #   cache-controlled fetch contributing to the output was a hit; age_ms is the
      #   oldest contributing hit.
      #
      #   @return [ContextDev::Models::BatchSubmitResponse::CacheMetadata]
      required :cache_metadata, -> { ContextDev::Models::BatchSubmitResponse::CacheMetadata }

      # @!attribute crawl
      #   The crawl controls as submitted, so the limits requested can be compared against
      #   what the crawl reached.
      #
      #   @return [ContextDev::Models::CrawlControls, nil]
      required :crawl, -> { ContextDev::CrawlControls }, nil?: true

      # @!attribute created_at
      #   When the batch was created.
      #
      #   @return [String]
      required :created_at, String

      # @!attribute credits
      #   What accepting this batch cost.
      #
      #   @return [ContextDev::Models::BatchSubmitResponse::Credits]
      required :credits, -> { ContextDev::Models::BatchSubmitResponse::Credits }

      # @!attribute format_
      #   What each page will be returned as.
      #
      #   @return [Symbol, ContextDev::Models::BatchSubmitResponse::Format]
      required :format_, enum: -> { ContextDev::Models::BatchSubmitResponse::Format }, api_name: :format

      # @!attribute input
      #   What submission took in, and what it charged for.
      #
      #   @return [ContextDev::Models::Intake]
      required :input, -> { ContextDev::Intake }

      # @!attribute invalid_urls
      #   Rejected URLs, up to 100. These are not charged.
      #
      #   @return [Array<ContextDev::Models::BatchSubmitResponse::InvalidURL>]
      required :invalid_urls,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchSubmitResponse::InvalidURL] }

      # @!attribute mode
      #   How pages will be selected.
      #
      #   @return [Symbol, ContextDev::Models::BatchSubmitResponse::Mode]
      required :mode, enum: -> { ContextDev::Models::BatchSubmitResponse::Mode }

      # @!attribute status
      #   Always `queued`. An accepted batch has not started yet.
      #
      #   @return [Symbol, ContextDev::Models::BatchSubmitResponse::Status]
      required :status, enum: -> { ContextDev::Models::BatchSubmitResponse::Status }

      # @!attribute tags
      #   Tags stored on the batch.
      #
      #   @return [Array<String>]
      required :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute key_metadata
      #   API key usage for this request.
      #
      #   @return [ContextDev::Models::BatchSubmitResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BatchSubmitResponse::KeyMetadata }

      # @!attribute webhook_secret
      #   Signing secret for the completion webhook, returned only here and never again.
      #   Store it now; it is not repeated by GET /batch/{batch_id}.
      #
      #   @return [String, nil]
      optional :webhook_secret, String

      # @!method initialize(id:, cache_metadata:, crawl:, created_at:, credits:, format_:, input:, invalid_urls:, mode:, status:, tags:, key_metadata: nil, webhook_secret: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchSubmitResponse} for more details.
      #
      #   @param id [String] Batch ID. Poll GET /batch/{batch_id} with it.
      #
      #   @param cache_metadata [ContextDev::Models::BatchSubmitResponse::CacheMetadata] Cache outcome for this response. Composite responses are hits only when every ca
      #
      #   @param crawl [ContextDev::Models::CrawlControls, nil] The crawl controls as submitted, so the limits requested can be compared against
      #
      #   @param created_at [String] When the batch was created.
      #
      #   @param credits [ContextDev::Models::BatchSubmitResponse::Credits] What accepting this batch cost.
      #
      #   @param format_ [Symbol, ContextDev::Models::BatchSubmitResponse::Format] What each page will be returned as.
      #
      #   @param input [ContextDev::Models::Intake] What submission took in, and what it charged for.
      #
      #   @param invalid_urls [Array<ContextDev::Models::BatchSubmitResponse::InvalidURL>] Rejected URLs, up to 100. These are not charged.
      #
      #   @param mode [Symbol, ContextDev::Models::BatchSubmitResponse::Mode] How pages will be selected.
      #
      #   @param status [Symbol, ContextDev::Models::BatchSubmitResponse::Status] Always `queued`. An accepted batch has not started yet.
      #
      #   @param tags [Array<String>] Tags stored on the batch.
      #
      #   @param key_metadata [ContextDev::Models::BatchSubmitResponse::KeyMetadata] API key usage for this request.
      #
      #   @param webhook_secret [String] Signing secret for the completion webhook, returned only here and never again. S

      # @see ContextDev::Models::BatchSubmitResponse#cache_metadata
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
        #   @return [Symbol, ContextDev::Models::BatchSubmitResponse::CacheMetadata::Status]
        required :status, enum: -> { ContextDev::Models::BatchSubmitResponse::CacheMetadata::Status }

        # @!method initialize(age_ms:, status:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::BatchSubmitResponse::CacheMetadata} for more details.
        #
        #   Cache outcome for this response. Composite responses are hits only when every
        #   cache-controlled fetch contributing to the output was a hit; age_ms is the
        #   oldest contributing hit.
        #
        #   @param age_ms [Integer] Age of the cached data in milliseconds. Zero for miss and zdr responses.
        #
        #   @param status [Symbol, ContextDev::Models::BatchSubmitResponse::CacheMetadata::Status] Whether the response was served from cache, required fresh work, or honored zero

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
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
        #   Credits just debited from your balance. Whatever the batch does not spend is
        #   refunded when it settles.
        #
        #   @return [Integer]
        required :reserved, Integer

        # @!method initialize(reserved:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::BatchSubmitResponse::Credits} for more details.
        #
        #   What accepting this batch cost.
        #
        #   @param reserved [Integer] Credits just debited from your balance. Whatever the batch does not spend is ref
      end

      # What each page will be returned as.
      #
      # @see ContextDev::Models::BatchSubmitResponse#format_
      module Format
        extend ContextDev::Internal::Type::Enum

        MARKDOWN = :markdown
        HTML = :html

        # @!method self.values
        #   @return [Array<Symbol>]
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

      # How pages will be selected.
      #
      # @see ContextDev::Models::BatchSubmitResponse#mode
      module Mode
        extend ContextDev::Internal::Type::Enum

        SCRAPE = :scrape
        CRAWL = :crawl

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Always `queued`. An accepted batch has not started yet.
      #
      # @see ContextDev::Models::BatchSubmitResponse#status
      module Status
        extend ContextDev::Internal::Type::Enum

        QUEUED = :queued

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::BatchSubmitResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits used by this request.
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
        #   @param credits_consumed [Integer] Credits used by this request.
        #
        #   @param credits_remaining [Integer] Credits remaining for your organization.
      end
    end
  end
end
