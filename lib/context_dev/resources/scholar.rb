# frozen_string_literal: true

module ContextDev
  module Resources
    # Search full-text academic papers from arXiv and Europe PMC.
    class Scholar
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::ScholarSearchParams} for more details.
      #
      # Search the full text of papers from arXiv and Europe PMC by topic or question.
      # Each result includes the matching passage and a direct link to the full text.
      # Page through up to 250 matches, ranked by relevance or newest first.
      #
      # @overload search(query:, cursor: nil, filter_by: nil, limit: nil, sort: nil, tags: nil, request_options: {})
      #
      # @param query [String] Topic or question to search for. Append one `arxiv:`, `pmcid:`, `pmid:`, or `doi
      #
      # @param cursor [String, nil] Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      # @param filter_by [ContextDev::Models::ScholarSearchParams::FilterBy] Filter by publication date.
      #
      # @param limit [Integer] Maximum number of papers to return per page.
      #
      # @param sort [Symbol, ContextDev::Models::ScholarSearchParams::Sort] `relevance` puts the closest matches first; `date_desc` puts the newest papers f
      #
      # @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
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
