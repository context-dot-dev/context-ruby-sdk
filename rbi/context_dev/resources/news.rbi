# typed: strong

module ContextDev
  module Resources
    # Search live first-party RSS and free historical news data by company identity.
    class News
      # Searches live and historical company news for one company, identified in
      # searchBy by name, domain, ticker (optionally disambiguated by exchange), or
      # ISIN. Results can be filtered by one of publisher domain, publisher country,
      # article language, or article type, optionally combined with a published-at date
      # range, and include stable story IDs, source metadata, verified entity relevance,
      # and cursor pagination.
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
        # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
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
