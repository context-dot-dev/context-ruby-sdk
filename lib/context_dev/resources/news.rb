# frozen_string_literal: true

module ContextDev
  module Resources
    # Search live and historical news by company or with a natural-language query.
    class News
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::NewsSearchParams} for more details.
      #
      # Find news about a company by name, domain, ticker, or ISIN, or search all news
      # with a natural-language query. Each article includes its publisher, type of
      # coverage, and, for company searches, whether the company is the main subject.
      # Narrow results by publisher, country, language, article type, or publish date.
      #
      # @overload search(search_by:, cursor: nil, filter_by: nil, limit: nil, policies: nil, sort_by: nil, tags: nil, request_options: {})
      #
      # @param search_by [ContextDev::Models::NewsSearchParams::SearchBy::NaturalLanguage, ContextDev::Models::NewsSearchParams::SearchBy::Entity] What to search for: news about a specific company, or a natural-language query a
      #
      # @param cursor [String, nil] Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      # @param filter_by [ContextDev::Models::NewsSearchParams::FilterBy] Filters for the results. Use at most one of `sourceDomain`, `sourceCountry`, `ar
      #
      # @param limit [Integer] Maximum number of articles to return per page.
      #
      # @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
      #
      # @param sort_by [ContextDev::Models::NewsSearchParams::SortBy] How to order results. Company searches default to `newest`; natural-language sea
      #
      # @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::NewsSearchResponse]
      #
      # @see ContextDev::Models::NewsSearchParams
      def search(params)
        parsed, options = ContextDev::NewsSearchParams.dump_request(params)
        @client.request(
          method: :post,
          path: "news/search",
          body: parsed,
          model: ContextDev::Models::NewsSearchResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [ContextDev::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
