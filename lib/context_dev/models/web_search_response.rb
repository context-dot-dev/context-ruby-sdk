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

      # @!method initialize(query:, results:)
      #   @param query [String] Echo of the original query (useful when fanout was enabled).
      #
      #   @param results [Array<ContextDev::Models::WebSearchResponse::Result>]

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
        #   Model-judged relevance to the original query.
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
        #   @param relevance [Symbol, ContextDev::Models::WebSearchResponse::Result::Relevance] Model-judged relevance to the original query.
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

        # Model-judged relevance to the original query.
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
    end
  end
end
