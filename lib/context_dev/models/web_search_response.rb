# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#search
    class WebSearchResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute cache_metadata
      #   Whether this response came from cache.
      #
      #   @return [ContextDev::Models::WebSearchResponse::CacheMetadata]
      required :cache_metadata, -> { ContextDev::Models::WebSearchResponse::CacheMetadata }

      # @!attribute query
      #   Echo of the original query (useful when fanout was enabled).
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
      #   True when timeoutOpts.behavior=return-partial returned the usable results
      #   collected before the deadline. Partial collections are not cached as complete
      #   results.
      #
      #   @return [Boolean, nil]
      optional :partial, ContextDev::Internal::Type::Boolean

      # @!method initialize(cache_metadata:, query:, request_id:, results:, key_metadata: nil, partial: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebSearchResponse} for more details.
      #
      #   @param cache_metadata [ContextDev::Models::WebSearchResponse::CacheMetadata] Whether this response came from cache.
      #
      #   @param query [String] Echo of the original query (useful when fanout was enabled).
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param results [Array<ContextDev::Models::WebSearchResponse::Result>]
      #
      #   @param key_metadata [ContextDev::Models::WebSearchResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param partial [Boolean] True when timeoutOpts.behavior=return-partial returned the usable results collec

      # @see ContextDev::Models::WebSearchResponse#cache_metadata
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
        #   @return [Symbol, ContextDev::Models::WebSearchResponse::CacheMetadata::Status]
        required :status, enum: -> { ContextDev::Models::WebSearchResponse::CacheMetadata::Status }

        # @!method initialize(age_ms:, status:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebSearchResponse::CacheMetadata} for more details.
        #
        #   Whether this response came from cache.
        #
        #   @param age_ms [Integer] Age of the cached data in milliseconds. Zero for miss and zdr responses.
        #
        #   @param status [Symbol, ContextDev::Models::WebSearchResponse::CacheMetadata::Status] Whether the response was served from cache, required fresh work, or honored zero

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
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
        #   Snippet excerpt from the page. Empty string when the search provider does not
        #   supply a snippet.
        #
        #   @return [String]
        required :description, String

        # @!attribute markdown
        #   Markdown scrape status and content for this result.
        #
        #   @return [ContextDev::Models::WebSearchResponse::Result::Markdown]
        required :markdown, -> { ContextDev::Models::WebSearchResponse::Result::Markdown }

        # @!attribute relevance
        #   Relevance to the original query.
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

        # @!method initialize(description:, markdown:, relevance:, title:, url:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebSearchResponse::Result} for more details.
        #
        #   @param description [String] Snippet excerpt from the page. Empty string when the search provider does not su
        #
        #   @param markdown [ContextDev::Models::WebSearchResponse::Result::Markdown] Markdown scrape status and content for this result.
        #
        #   @param relevance [Symbol, ContextDev::Models::WebSearchResponse::Result::Relevance] Relevance to the original query.
        #
        #   @param title [String] Page title.
        #
        #   @param url [String] Canonical result URL.

        # @see ContextDev::Models::WebSearchResponse::Result#markdown
        class Markdown < ContextDev::Internal::Type::BaseModel
          # @!attribute code
          #   Per-result scrape outcome. Inspect this before reading `markdown`.
          #
          #   @return [Symbol, ContextDev::Models::WebSearchResponse::Result::Markdown::Code]
          required :code, enum: -> { ContextDev::Models::WebSearchResponse::Result::Markdown::Code }

          # @!attribute markdown
          #   GFM Markdown of the page. Null unless markdownOptions.enabled is true and
          #   scraping succeeded.
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

          # @!method initialize(code:, markdown:, final_dom_state: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::WebSearchResponse::Result::Markdown} for more details.
          #
          #   Markdown scrape status and content for this result.
          #
          #   @param code [Symbol, ContextDev::Models::WebSearchResponse::Result::Markdown::Code] Per-result scrape outcome. Inspect this before reading `markdown`.
          #
          #   @param markdown [String, nil] GFM Markdown of the page. Null unless markdownOptions.enabled is true and scrapi
          #
          #   @param final_dom_state [Symbol, ContextDev::Models::WebSearchResponse::Result::Markdown::FinalDomState] `loaded`, or `still-loading` when capture ended before the page finished loading

          # Per-result scrape outcome. Inspect this before reading `markdown`.
          #
          # @see ContextDev::Models::WebSearchResponse::Result::Markdown#code
          module Code
            extend ContextDev::Internal::Type::Enum

            SUCCESS = :SUCCESS
            NOT_REQUESTED = :NOT_REQUESTED
            TIMEOUT = :TIMEOUT
            CONTENT_TOO_LARGE = :CONTENT_TOO_LARGE
            WEBSITE_ACCESS_ERROR = :WEBSITE_ACCESS_ERROR
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

        # Relevance to the original query.
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
