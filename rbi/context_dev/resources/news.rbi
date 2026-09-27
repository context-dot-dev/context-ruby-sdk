# typed: strong

module ContextDev
  module Resources
    # Search live and historical news about a company.
    class News
      # Find company news by name, domain, ticker, or ISIN. Filter articles and continue
      # through results with a cursor.
      sig do
        params(
          search_by: ContextDev::NewsSearchParams::SearchBy::OrHash,
          cursor: T.nilable(String),
          filter_by: ContextDev::NewsSearchParams::FilterBy::OrHash,
          limit: Integer,
          sort_by: ContextDev::NewsSearchParams::SortBy::OrHash,
          tags: T::Array[String],
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::NewsSearchResponse)
      end
      def search(
        # What to search for.
        search_by:,
        # Opaque next_cursor from the previous response, or null for the first page.
        cursor: nil,
        # Optional result filters. Use at most one of sourceDomain, sourceCountry,
        # articleLanguage, or articleType. A date range may accompany that category;
        # date.from must not exceed date.to.
        filter_by: nil,
        # Maximum results to return. Defaults to 10.
        limit: nil,
        # Result ordering. Defaults to newest.
        sort_by: nil,
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
