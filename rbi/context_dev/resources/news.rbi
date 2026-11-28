# typed: strong

module ContextDev
  module Resources
    # Search live and historical news by company or with a natural-language query.
    class News
      # Find news about a company by name, domain, ticker, or ISIN, or search all news
      # with a natural-language query. Each article includes its publisher, type of
      # coverage, and, for company searches, whether the company is the main subject.
      # Narrow results by publisher, country, language, article type, or publish date.
      sig do
        params(
          search_by:
            T.any(
              ContextDev::NewsSearchParams::SearchBy::NaturalLanguage::OrHash,
              ContextDev::NewsSearchParams::SearchBy::Entity::OrHash
            ),
          cursor: T.nilable(String),
          filter_by: ContextDev::NewsSearchParams::FilterBy::OrHash,
          limit: Integer,
          policies: T::Array[String],
          sort_by: ContextDev::NewsSearchParams::SortBy::OrHash,
          tags: T::Array[String],
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::NewsSearchResponse)
      end
      def search(
        # What to search for: news about a specific company, or a natural-language query
        # across all news.
        search_by:,
        # Cursor from the previous page's `next_cursor`. Omit for the first page.
        cursor: nil,
        # Filters for the results. Use at most one of `sourceDomain`, `sourceCountry`,
        # `articleLanguage`, or `articleType`, optionally combined with `date`.
        filter_by: nil,
        # Maximum number of articles to return per page.
        limit: nil,
        # Access policy IDs to apply; each URL must pass all of them. Requires access
        # policies enabled for your organization; otherwise returns
        # `ACCESS_POLICIES_NOT_ENABLED`.
        policies: nil,
        # How to order results. Company searches default to `newest`; natural-language
        # searches always use `relevance`.
        sort_by: nil,
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
