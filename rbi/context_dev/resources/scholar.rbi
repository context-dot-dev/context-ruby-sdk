# typed: strong

module ContextDev
  module Resources
    # Search full-text academic papers from arXiv and Europe PMC.
    class Scholar
      # Search the full text of papers from arXiv and Europe PMC by topic or question.
      # Each result includes the matching passage and a direct link to the full text.
      # Page through up to 250 matches, ranked by relevance or newest first.
      sig do
        params(
          query: String,
          cursor: T.nilable(String),
          filter_by: ContextDev::ScholarSearchParams::FilterBy::OrHash,
          limit: Integer,
          sort: ContextDev::ScholarSearchParams::Sort::OrSymbol,
          tags: T::Array[String],
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::ScholarSearchResponse)
      end
      def search(
        # Topic or question to search for. Append one `arxiv:`, `pmcid:`, `pmid:`, or
        # `doi:` ID to search within that paper, such as `protein folding pmid:34265844`,
        # or send the ID on its own.
        query:,
        # Cursor from the previous page's `next_cursor`. Omit for the first page.
        cursor: nil,
        # Filter by publication date.
        filter_by: nil,
        # Maximum number of papers to return per page.
        limit: nil,
        # `relevance` puts the closest matches first; `date_desc` puts the newest papers
        # first, with undated papers last. Both orders apply to the top 250 matches.
        sort: nil,
        # Labels for this request. Filter usage and request logs by them in the dashboard
        # or with `GET /org/logs`.
        tags: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: ContextDev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
