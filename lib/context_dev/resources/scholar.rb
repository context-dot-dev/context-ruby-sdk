# frozen_string_literal: true

module ContextDev
  module Resources
    # Search full-text academic papers from arXiv and Europe PMC.
    class Scholar
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::ScholarSearchParams} for more details.
      #
      # Search full-text papers from arXiv and Europe PMC. Returns up to 250 relevant
      # papers with matching passages and full-text links.
      #
      # @overload search(query:, cursor: nil, filter_by: nil, limit: nil, sort: nil, tags: nil, request_options: {})
      #
      # @param query [String] A topic or question. Append one arxiv:, pmcid:, pmid:, or doi: ID to search with
      #
      # @param cursor [String, nil] Use next_cursor to fetch the next page.
      #
      # @param filter_by [ContextDev::Models::ScholarSearchParams::FilterBy] Filter by publication date.
      #
      # @param limit [Integer] Papers per page.
      #
      # @param sort [Symbol, ContextDev::Models::ScholarSearchParams::Sort] Order the top 250 matches. date_desc puts newest first, with undated papers last
      #
      # @param tags [Array<String>] Labels for filtering usage in the dashboard.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::ScholarSearchResponse]
      #
      # @see ContextDev::Models::ScholarSearchParams
      def search(params)
        parsed, options = ContextDev::ScholarSearchParams.dump_request(params)
        @client.request(
          method: :post,
          path: "scholar/search",
          body: parsed,
          model: ContextDev::Models::ScholarSearchResponse,
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
