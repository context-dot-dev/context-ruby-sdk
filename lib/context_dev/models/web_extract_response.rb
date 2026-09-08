# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#extract
    class WebExtractResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute cache_metadata
      #   Cache outcome for this response. Composite responses are hits only when every
      #   cache-controlled fetch contributing to the output was a hit; age_ms is the
      #   oldest contributing hit.
      #
      #   @return [ContextDev::Models::WebExtractResponse::CacheMetadata]
      required :cache_metadata, -> { ContextDev::Models::WebExtractResponse::CacheMetadata }

      # @!attribute data
      #   Extracted data matching the request schema
      #
      #   @return [Hash{Symbol=>Object}]
      required :data, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

      # @!attribute metadata
      #
      #   @return [ContextDev::Models::WebExtractResponse::Metadata]
      required :metadata, -> { ContextDev::Models::WebExtractResponse::Metadata }

      # @!attribute status
      #   Status of the response, e.g., 'ok'
      #
      #   @return [String]
      required :status, String

      # @!attribute url
      #   The starting URL that was analyzed
      #
      #   @return [String]
      required :url, String

      # @!attribute urls_analyzed
      #   List of URLs whose Markdown was used for extraction
      #
      #   @return [Array<String>]
      required :urls_analyzed, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute key_metadata
      #   Credit usage, included whenever a valid API key is provided.
      #
      #   @return [ContextDev::Models::WebExtractResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebExtractResponse::KeyMetadata }

      # @!method initialize(cache_metadata:, data:, metadata:, status:, url:, urls_analyzed:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebExtractResponse} for more details.
      #
      #   @param cache_metadata [ContextDev::Models::WebExtractResponse::CacheMetadata] Cache outcome for this response. Composite responses are hits only when every ca
      #
      #   @param data [Hash{Symbol=>Object}] Extracted data matching the request schema
      #
      #   @param metadata [ContextDev::Models::WebExtractResponse::Metadata]
      #
      #   @param status [String] Status of the response, e.g., 'ok'
      #
      #   @param url [String] The starting URL that was analyzed
      #
      #   @param urls_analyzed [Array<String>] List of URLs whose Markdown was used for extraction
      #
      #   @param key_metadata [ContextDev::Models::WebExtractResponse::KeyMetadata] Credit usage, included whenever a valid API key is provided.

      # @see ContextDev::Models::WebExtractResponse#cache_metadata
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
        #   @return [Symbol, ContextDev::Models::WebExtractResponse::CacheMetadata::Status]
        required :status, enum: -> { ContextDev::Models::WebExtractResponse::CacheMetadata::Status }

        # @!method initialize(age_ms:, status:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebExtractResponse::CacheMetadata} for more details.
        #
        #   Cache outcome for this response. Composite responses are hits only when every
        #   cache-controlled fetch contributing to the output was a hit; age_ms is the
        #   oldest contributing hit.
        #
        #   @param age_ms [Integer] Age of the cached data in milliseconds. Zero for miss and zdr responses.
        #
        #   @param status [Symbol, ContextDev::Models::WebExtractResponse::CacheMetadata::Status] Whether the response was served from cache, required fresh work, or honored zero

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        #
        # @see ContextDev::Models::WebExtractResponse::CacheMetadata#status
        module Status
          extend ContextDev::Internal::Type::Enum

          HIT = :hit
          MISS = :miss
          ZDR = :zdr

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::WebExtractResponse#metadata
      class Metadata < ContextDev::Internal::Type::BaseModel
        # @!attribute max_crawl_depth
        #
        #   @return [Integer]
        required :max_crawl_depth, Integer, api_name: :maxCrawlDepth

        # @!attribute num_blocked
        #   Number of crawled pages excluded because they were anti-bot challenges, error
        #   pages, or parked-domain placeholders.
        #
        #   @return [Integer]
        required :num_blocked, Integer, api_name: :numBlocked

        # @!attribute num_failed
        #
        #   @return [Integer]
        required :num_failed, Integer, api_name: :numFailed

        # @!attribute num_skipped
        #
        #   @return [Integer]
        required :num_skipped, Integer, api_name: :numSkipped

        # @!attribute num_succeeded
        #
        #   @return [Integer]
        required :num_succeeded, Integer, api_name: :numSucceeded

        # @!attribute num_urls
        #
        #   @return [Integer]
        required :num_urls, Integer, api_name: :numUrls

        # @!attribute actions_applied
        #   One verified outcome per requested browser action, in request order.
        #
        #   @return [Array<ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied>, nil]
        optional :actions_applied,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied] },
                 api_name: :actionsApplied

        # @!method initialize(max_crawl_depth:, num_blocked:, num_failed:, num_skipped:, num_succeeded:, num_urls:, actions_applied: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebExtractResponse::Metadata} for more details.
        #
        #   @param max_crawl_depth [Integer]
        #
        #   @param num_blocked [Integer] Number of crawled pages excluded because they were anti-bot challenges, error pa
        #
        #   @param num_failed [Integer]
        #
        #   @param num_skipped [Integer]
        #
        #   @param num_succeeded [Integer]
        #
        #   @param num_urls [Integer]
        #
        #   @param actions_applied [Array<ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied>] One verified outcome per requested browser action, in request order.

        class ActionsApplied < ContextDev::Internal::Type::BaseModel
          # @!attribute instruction
          #
          #   @return [String]
          required :instruction, String

          # @!attribute status
          #   Applied means the requested page state was visibly verified. Failed means it was
          #   not verified. Skipped means it was not attempted.
          #
          #   @return [Symbol, ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied::Status]
          required :status, enum: -> { ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied::Status }

          # @!attribute completion_evidence
          #   Visible page evidence used to verify an applied action.
          #
          #   @return [String, nil]
          optional :completion_evidence, String, api_name: :completionEvidence

          # @!attribute duration_ms
          #
          #   @return [Float, nil]
          optional :duration_ms, Float, api_name: :durationMs

          # @!attribute error
          #
          #   @return [String, nil]
          optional :error, String

          # @!attribute method_
          #
          #   @return [String, nil]
          optional :method_, String, api_name: :method

          # @!attribute target_description
          #
          #   @return [String, nil]
          optional :target_description, String, api_name: :targetDescription

          # @!method initialize(instruction:, status:, completion_evidence: nil, duration_ms: nil, error: nil, method_: nil, target_description: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied} for more
          #   details.
          #
          #   @param instruction [String]
          #
          #   @param status [Symbol, ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied::Status] Applied means the requested page state was visibly verified. Failed means it was
          #
          #   @param completion_evidence [String] Visible page evidence used to verify an applied action.
          #
          #   @param duration_ms [Float]
          #
          #   @param error [String]
          #
          #   @param method_ [String]
          #
          #   @param target_description [String]

          # Applied means the requested page state was visibly verified. Failed means it was
          # not verified. Skipped means it was not attempted.
          #
          # @see ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied#status
          module Status
            extend ContextDev::Internal::Type::Enum

            APPLIED = :applied
            FAILED = :failed
            SKIPPED = :skipped

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # @see ContextDev::Models::WebExtractResponse#key_metadata
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
        #   Credit usage, included whenever a valid API key is provided.
        #
        #   @param credits_consumed [Integer] Credits used by this request.
        #
        #   @param credits_remaining [Integer] Credits remaining for your organization.
      end
    end
  end
end
