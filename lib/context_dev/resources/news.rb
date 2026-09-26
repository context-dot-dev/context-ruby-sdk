# frozen_string_literal: true

module ContextDev
  module Resources
    # Search live first-party RSS and free historical news data by company identity.
    class News
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::NewsSearchParams} for more details.
      #
      # Searches live and historical company news for one company, identified in
      # searchBy by name, domain, ticker (optionally disambiguated by exchange), or
      # ISIN. Results can be filtered by one of publisher domain, publisher country,
      # article language, or article type, optionally combined with a published-at date
      # range, and include stable story IDs, source metadata, verified entity relevance,
      # and cursor pagination.
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
      # @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
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
