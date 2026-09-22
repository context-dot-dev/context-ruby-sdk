# typed: strong

module ContextDev
  module Resources
    class Brand
      # Retrieve logos, backdrops, colors, industry, description, and more. Provide
      # exactly one lookup identifier in the request body: a domain, company name, email
      # address, stock ticker, transaction descriptor, or direct URL. Note:
      # `by_direct_url` fetches brand data only from the provided URL — not from the
      # entire internet.
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
        # Exactly one lookup type must be provided.
        body:,
        request_options: {}
      )
      end

      # Search indexed brands by name or domain
      sig do
        params(
          query: String,
          autocomplete: T::Boolean,
          query_by: T::Array[ContextDev::BrandSearchParams::QueryBy::OrSymbol],
          tags: T::Array[String],
          typo_tolerance: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BrandSearchResponse)
      end
      def search(
        # Search term, matched against the fields selected by queryBy (e.g. 'nike',
        # 'nike.com', 'nik').
        query:,
        # Whether the search term matches by prefix, so partial words match as they are
        # typed (e.g. 'nik' matches Nike). Set to false to match whole words only.
        autocomplete: nil,
        # Fields to match the search term against, as a comma-separated list or repeated
        # parameter: 'name', 'domain', or both. Defaults to both.
        query_by: nil,
        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        tags: nil,
        # Maximum number of typos tolerated when matching, from 0 to 2. Defaults to 0 (no
        # typo tolerance).
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
