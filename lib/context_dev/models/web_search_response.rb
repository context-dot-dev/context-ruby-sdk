# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#search
    class WebSearchResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute query
      #   Echo of the original query (useful when fanout was enabled).
      #
      #   @return [String]
      required :query, String

      # @!attribute results
      #
      #   @return [Array<ContextDev::Models::WebSearchResponse::Result>]
      required :results,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebSearchResponse::Result] }

      # @!attribute key_metadata
      #   Metadata about the API key used for the request. Included in every response
      #   whenever a valid API key is provided, even when the response status is not 200.
      #
      #   @return [ContextDev::Models::WebSearchResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebSearchResponse::KeyMetadata }

      # @!method initialize(query:, results:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebSearchResponse} for more details.
      #
      #   @param query [String] Echo of the original query (useful when fanout was enabled).
      #
      #   @param results [Array<ContextDev::Models::WebSearchResponse::Result>]
      #
      #   @param key_metadata [ContextDev::Models::WebSearchResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when

      class Result < ContextDev::Internal::Type::BaseModel
        # @!attribute description
        #   Snippet excerpt from the page.
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
        #   @param description [String] Snippet excerpt from the page.
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

          # @!method initialize(code:, markdown:)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::WebSearchResponse::Result::Markdown} for more details.
          #
          #   Markdown scrape status and content for this result.
          #
          #   @param code [Symbol, ContextDev::Models::WebSearchResponse::Result::Markdown::Code] Per-result scrape outcome. Inspect this before reading `markdown`.
          #
          #   @param markdown [String, nil] GFM Markdown of the page. Null unless markdownOptions.enabled is true and scrapi

          # Per-result scrape outcome. Inspect this before reading `markdown`.
          #
          # @see ContextDev::Models::WebSearchResponse::Result::Markdown#code
          module Code
            extend ContextDev::Internal::Type::Enum

            SUCCESS = :SUCCESS
            NOT_REQUESTED = :NOT_REQUESTED
            TIMEOUT = :TIMEOUT
            WEBSITE_ACCESS_ERROR = :WEBSITE_ACCESS_ERROR
            ERROR = :ERROR

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
        #   The number of credits consumed by this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   The number of credits remaining for your organization after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Metadata about the API key used for the request. Included in every response
        #   whenever a valid API key is provided, even when the response status is not 200.
        #
        #   @param credits_consumed [Integer] The number of credits consumed by this request.
        #
        #   @param credits_remaining [Integer] The number of credits remaining for your organization after this request.
      end
    end
  end
end
