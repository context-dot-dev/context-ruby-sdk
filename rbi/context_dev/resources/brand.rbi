# typed: strong

module ContextDev
  module Resources
    # Retrieve a brand's logos, colors, company details, and social links, or find
    # brands by name or domain.
    class Brand
      # Look up a brand by domain, company name, work email, stock ticker, page URL, or
      # card transaction descriptor. Returns logos, colors, backdrops, description,
      # industries, address, stock listing, and social links. A `by_direct_url` lookup
      # reads only that page.
      sig do
        params(
          body:
            T.any(
              ContextDev::BrandRetrieveParams::Body::ByDomain::OrHash,
              ContextDev::BrandRetrieveParams::Body::ByName::OrHash,
              ContextDev::BrandRetrieveParams::Body::ByEmail::OrHash,
              ContextDev::BrandRetrieveParams::Body::ByTicker::OrHash,
              ContextDev::BrandRetrieveParams::Body::ByDirectURL::OrHash,
              ContextDev::BrandRetrieveParams::Body::ByTransaction::OrHash
            ),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BrandRetrieveResponse)
      end
      def retrieve(
        # Brand lookup. Set `type` to choose how to identify the brand.
        body:,
        request_options: {}
      )
      end

      # Autocomplete brand names and domains as a user types, with up to 10 brands
      # ranked by popularity and a ready-to-use logo URL for each. Filter by country and
      # primary language. Pass a returned `domain` to `POST /brand/retrieve` for the
      # full brand profile.
      sig do
        params(
          query: String,
          autocomplete: T::Boolean,
          country: ContextDev::BrandSearchParams::Country::OrSymbol,
          language: ContextDev::BrandSearchParams::Language::OrSymbol,
          query_by: T::Array[ContextDev::BrandSearchParams::QueryBy::OrSymbol],
          tags: T::Array[String],
          typo_tolerance: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BrandSearchResponse)
      end
      def search(
        # Search term, matched against the fields in `queryBy`, such as `nike`,
        # `nike.com`, or `nik`.
        query:,
        # Match the search term as a prefix, so `nik` matches Nike while the user is still
        # typing. Set to `false` to match whole words only.
        autocomplete: nil,
        # Only return brands in this country, as an uppercase ISO 3166-1 alpha-2 code such
        # as `US` or `GB`.
        country: nil,
        # Only return brands with this primary language, such as `english` or `french`.
        language: nil,
        # Fields to match the search term against: `name`, `domain`, or both. Send a
        # comma-separated list or repeat the parameter.
        query_by: nil,
        # Comma-separated labels for this request, such as `production,team-alpha`. Filter
        # usage and request logs by them.
        tags: nil,
        # Maximum number of typos to tolerate when matching. `0` requires exact spelling.
        typo_tolerance: nil,
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
