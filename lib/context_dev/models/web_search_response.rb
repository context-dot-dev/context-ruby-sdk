# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#search
    class WebSearchResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute cache_metadata
      #   Cache status of this response.
      #
      #   @return [ContextDev::Models::WebSearchResponse::CacheMetadata]
      required :cache_metadata, -> { ContextDev::Models::WebSearchResponse::CacheMetadata }

      # @!attribute query
      #   The query you sent.
      #
      #   @return [String]
      required :query, String

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute results
      #
      #   @return [Array<ContextDev::Models::WebSearchResponse::Result>]
      required :results,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebSearchResponse::Result] }

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::WebSearchResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebSearchResponse::KeyMetadata }

      # @!attribute partial
      #   `true` when the deadline passed with `timeoutOpts.behavior` set to
      #   `return-partial`. Only results finished in time are included. Partial results
      #   are not cached.
      #
      #   @return [Boolean, nil]
      optional :partial, ContextDev::Internal::Type::Boolean

      # @!method initialize(cache_metadata:, query:, request_id:, results:, key_metadata: nil, partial: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebSearchResponse} for more details.
      #
      #   @param cache_metadata [ContextDev::Models::WebSearchResponse::CacheMetadata] Cache status of this response.
      #
      #   @param query [String] The query you sent.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param results [Array<ContextDev::Models::WebSearchResponse::Result>]
      #
      #   @param key_metadata [ContextDev::Models::WebSearchResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param partial [Boolean] `true` when the deadline passed with `timeoutOpts.behavior` set to `return-parti

      # @see ContextDev::Models::WebSearchResponse#cache_metadata
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
        #   @return [Symbol, ContextDev::Models::WebSearchResponse::CacheMetadata::Status]
        required :status, enum: -> { ContextDev::Models::WebSearchResponse::CacheMetadata::Status }

        # @!method initialize(age_ms:, status:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebSearchResponse::CacheMetadata} for more details.
        #
        #   Cache status of this response.
        #
        #   @param age_ms [Integer] Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
        #
        #   @param status [Symbol, ContextDev::Models::WebSearchResponse::CacheMetadata::Status] `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data re

        # `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
        # retention bypassed the cache.
        #
        # @see ContextDev::Models::WebSearchResponse::CacheMetadata#status
        module Status
          extend ContextDev::Internal::Type::Enum

          HIT = :hit
          MISS = :miss
          ZDR = :zdr

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Result < ContextDev::Internal::Type::BaseModel
        # @!attribute description
        #   Snippet from the page. Empty string when no snippet is available.
        #
        #   @return [String]
        required :description, String

        # @!attribute highlights
        #   Highlights status and passages for this result.
        #
        #   @return [ContextDev::Models::WebSearchResponse::Result::Highlights]
        required :highlights, -> { ContextDev::Models::WebSearchResponse::Result::Highlights }

        # @!attribute markdown
        #   Markdown scrape status and content for this result.
        #
        #   @return [ContextDev::Models::WebSearchResponse::Result::Markdown]
        required :markdown, -> { ContextDev::Models::WebSearchResponse::Result::Markdown }

        # @!attribute relevance
        #   How relevant the result is to the query.
        #
        #   @return [Symbol, ContextDev::Models::WebSearchResponse::Result::Relevance]
        required :relevance, enum: -> { ContextDev::Models::WebSearchResponse::Result::Relevance }

        # @!attribute title
        #   Page title.
        #
        #   @return [String]
        required :title, String

        # @!attribute url
        #   Canonical result URL.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(description:, highlights:, markdown:, relevance:, title:, url:)
        #   @param description [String] Snippet from the page. Empty string when no snippet is available.
        #
        #   @param highlights [ContextDev::Models::WebSearchResponse::Result::Highlights] Highlights status and passages for this result.
        #
        #   @param markdown [ContextDev::Models::WebSearchResponse::Result::Markdown] Markdown scrape status and content for this result.
        #
        #   @param relevance [Symbol, ContextDev::Models::WebSearchResponse::Result::Relevance] How relevant the result is to the query.
        #
        #   @param title [String] Page title.
        #
        #   @param url [String] Canonical result URL.

        # @see ContextDev::Models::WebSearchResponse::Result#highlights
        class Highlights < ContextDev::Internal::Type::BaseModel
          # @!attribute code
          #   Highlights outcome for this result. Check it before reading `highlights`.
          #
          #   @return [Symbol, ContextDev::Models::WebSearchResponse::Result::Highlights::Code]
          required :code, enum: -> { ContextDev::Models::WebSearchResponse::Result::Highlights::Code }

          # @!attribute highlights
          #   Passages relevant to the query, in page order. `null` unless
          #   `highlightsOptions.enabled` is `true` and the page was read.
          #
          #   @return [Array<String>, nil]
          required :highlights, ContextDev::Internal::Type::ArrayOf[String], nil?: true

          # @!attribute message
          #   Why this output is missing. Present only when `code` is a failure.
          #
          #   @return [String, nil]
          optional :message, String

          # @!method initialize(code:, highlights:, message: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::WebSearchResponse::Result::Highlights} for more details.
          #
          #   Highlights status and passages for this result.
          #
          #   @param code [Symbol, ContextDev::Models::WebSearchResponse::Result::Highlights::Code] Highlights outcome for this result. Check it before reading `highlights`.
          #
          #   @param highlights [Array<String>, nil] Passages relevant to the query, in page order. `null` unless `highlightsOptions.
          #
          #   @param message [String] Why this output is missing. Present only when `code` is a failure.

          # Highlights outcome for this result. Check it before reading `highlights`.
          #
          # @see ContextDev::Models::WebSearchResponse::Result::Highlights#code
          module Code
            extend ContextDev::Internal::Type::Enum

            SUCCESS = :SUCCESS
            NOT_REQUESTED = :NOT_REQUESTED
            TIMEOUT = :TIMEOUT
            CONTENT_TOO_LARGE = :CONTENT_TOO_LARGE
            WEBSITE_ACCESS_ERROR = :WEBSITE_ACCESS_ERROR
            WEBSITE_BLOCKED = :WEBSITE_BLOCKED
            WEBSITE_NOT_FOUND = :WEBSITE_NOT_FOUND
            ERROR = :ERROR

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see ContextDev::Models::WebSearchResponse::Result#markdown
        class Markdown < ContextDev::Internal::Type::BaseModel
          # @!attribute code
          #   Scrape outcome for this result. Check it before reading `markdown`.
          #
          #   @return [Symbol, ContextDev::Models::WebSearchResponse::Result::Markdown::Code]
          required :code, enum: -> { ContextDev::Models::WebSearchResponse::Result::Markdown::Code }

          # @!attribute markdown
          #   Page content as GitHub-flavored Markdown. `null` unless
          #   `markdownOptions.enabled` is `true` and the scrape succeeded.
          #
          #   @return [String, nil]
          required :markdown, String, nil?: true

          # @!attribute final_dom_state
          #   `loaded`, or `still-loading` when capture ended before the page finished
          #   loading.
          #
          #   @return [Symbol, ContextDev::Models::WebSearchResponse::Result::Markdown::FinalDomState, nil]
          optional :final_dom_state,
                   enum: -> { ContextDev::Models::WebSearchResponse::Result::Markdown::FinalDomState },
                   api_name: :finalDOMState

          # @!attribute message
          #   Why this output is missing. Present only when `code` is a failure.
          #
          #   @return [String, nil]
          optional :message, String

          # @!method initialize(code:, markdown:, final_dom_state: nil, message: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::WebSearchResponse::Result::Markdown} for more details.
          #
          #   Markdown scrape status and content for this result.
          #
          #   @param code [Symbol, ContextDev::Models::WebSearchResponse::Result::Markdown::Code] Scrape outcome for this result. Check it before reading `markdown`.
          #
          #   @param markdown [String, nil] Page content as GitHub-flavored Markdown. `null` unless `markdownOptions.enabled
          #
          #   @param final_dom_state [Symbol, ContextDev::Models::WebSearchResponse::Result::Markdown::FinalDomState] `loaded`, or `still-loading` when capture ended before the page finished loading
          #
          #   @param message [String] Why this output is missing. Present only when `code` is a failure.

          # Scrape outcome for this result. Check it before reading `markdown`.
          #
          # @see ContextDev::Models::WebSearchResponse::Result::Markdown#code
          module Code
            extend ContextDev::Internal::Type::Enum

            SUCCESS = :SUCCESS
            NOT_REQUESTED = :NOT_REQUESTED
            TIMEOUT = :TIMEOUT
            CONTENT_TOO_LARGE = :CONTENT_TOO_LARGE
            WEBSITE_ACCESS_ERROR = :WEBSITE_ACCESS_ERROR
            WEBSITE_BLOCKED = :WEBSITE_BLOCKED
            WEBSITE_NOT_FOUND = :WEBSITE_NOT_FOUND
            ERROR = :ERROR

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # `loaded`, or `still-loading` when capture ended before the page finished
          # loading.
          #
          # @see ContextDev::Models::WebSearchResponse::Result::Markdown#final_dom_state
          module FinalDomState
            extend ContextDev::Internal::Type::Enum

            LOADED = :loaded
            STILL_LOADING = :"still-loading"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # How relevant the result is to the query.
        #
        # @see ContextDev::Models::WebSearchResponse::Result#relevance
        module Relevance
          extend ContextDev::Internal::Type::Enum

          HIGH = :high
          MEDIUM = :medium
          LOW = :low

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::WebSearchResponse#key_metadata
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
