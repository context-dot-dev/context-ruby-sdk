# frozen_string_literal: true

module ContextDev
  module Resources
    # Retrieve a brand's logos, colors, company details, and social links, or find
    # brands by name or domain.
    class Brand
      # Look up a brand by domain, company name, work email, stock ticker, page URL, or
      # card transaction descriptor. Returns logos, colors, backdrops, description,
      # industries, address, stock listing, and social links. A `by_direct_url` lookup
      # reads only that page.
      #
      # @overload retrieve(body:, request_options: {})
      #
      # @param body [ContextDev::Models::BrandRetrieveParams::Body::ByDomain, ContextDev::Models::BrandRetrieveParams::Body::ByName, ContextDev::Models::BrandRetrieveParams::Body::ByEmail, ContextDev::Models::BrandRetrieveParams::Body::ByTicker, ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction] Brand lookup. Set `type` to choose how to identify the brand.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandRetrieveResponse]
      #
      # @see ContextDev::Models::BrandRetrieveParams
      def retrieve(params)
        parsed, options = ContextDev::BrandRetrieveParams.dump_request(params)
        @client.request(
          method: :post,
          path: "brand/retrieve",
          body: parsed[:body],
          model: ContextDev::Models::BrandRetrieveResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandSearchParams} for more details.
      #
      # Autocomplete brand names and domains as a user types, with up to 10 brands
      # ranked by popularity and a ready-to-use logo URL for each. Filter by country and
      # primary language. Pass a returned `domain` to `POST /brand/retrieve` for the
      # full brand profile.
      #
      # @overload search(query:, autocomplete: nil, country: nil, language: nil, query_by: nil, tags: nil, typo_tolerance: nil, request_options: {})
      #
      # @param query [String] Search term, matched against the fields in `queryBy`, such as `nike`, `nike.com`
      #
      # @param autocomplete [Boolean] Match the search term as a prefix, so `nik` matches Nike while the user is still
      #
      # @param country [Symbol, ContextDev::Models::BrandSearchParams::Country] Only return brands in this country, as an uppercase ISO 3166-1 alpha-2 code such
      #
      # @param language [Symbol, ContextDev::Models::BrandSearchParams::Language] Only return brands with this primary language, such as `english` or `french`.
      #
      # @param query_by [Array<Symbol, ContextDev::Models::BrandSearchParams::QueryBy>] Fields to match the search term against: `name`, `domain`, or both. Send a comma
      #
      # @param tags [Array<String>] Comma-separated labels for this request, such as `production,team-alpha`. Filter
      #
      # @param typo_tolerance [Integer] Maximum number of typos to tolerate when matching. `0` requires exact spelling.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandSearchResponse]
      #
      # @see ContextDev::Models::BrandSearchParams
      def search(params)
        parsed, options = ContextDev::BrandSearchParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "brand/search",
          query: query.transform_keys(query_by: "queryBy", typo_tolerance: "typoTolerance"),
          model: ContextDev::Models::BrandSearchResponse,
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
