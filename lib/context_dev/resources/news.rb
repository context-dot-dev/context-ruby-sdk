# frozen_string_literal: true

module ContextDev
  module Resources
    # Search live and historical news about a company.
    class News
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::NewsSearchParams} for more details.
      #
      # Find company news by name, domain, ticker, or ISIN. Filter articles and continue
      # through results with a cursor.
      #
      # @overload search(search_by:, cursor: nil, filter_by: nil, limit: nil, sort_by: nil, tags: nil, request_options: {})
      #
      # @param search_by [ContextDev::Models::NewsSearchParams::SearchBy] What to search for.
      #
      # @param cursor [String, nil] Opaque next_cursor from the previous response, or null for the first page.
      #
      # @param filter_by [ContextDev::Models::NewsSearchParams::FilterBy] Optional result filters. Use at most one of sourceDomain, sourceCountry, article
      #
      # @param limit [Integer] Maximum results to return. Defaults to 10.
      #
      # @param sort_by [ContextDev::Models::NewsSearchParams::SortBy] Result ordering. Defaults to newest.
      #
      # @param tags [Array<String>] Labels for filtering usage in the dashboard.
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
