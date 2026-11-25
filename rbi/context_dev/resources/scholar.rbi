# typed: strong

module ContextDev
  module Resources
    # Search full-text academic papers from arXiv and Europe PMC.
    class Scholar
      # Search full-text papers from arXiv and Europe PMC. Returns up to 250 relevant
      # papers with matching passages and full-text links.
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
        # A topic or question. Append one arxiv:, pmcid:, pmid:, or doi: ID to search
        # within an indexed paper.
        query:,
        # Use next_cursor to fetch the next page.
        cursor: nil,
        # Filter by publication date.
        filter_by: nil,
        # Papers per page.
        limit: nil,
        # Order the top 250 matches. date_desc puts newest first, with undated papers
        # last.
        sort: nil,
        # Labels for filtering usage in the dashboard.
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
