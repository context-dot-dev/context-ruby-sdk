# frozen_string_literal: true

module ContextDev
  module Resources
    class Brand
      # Retrieve logos, colors, company details, and social links using one lookup
      # identifier. A direct URL limits extraction to that page.
      #
      # @overload retrieve(body:, request_options: {})
      #
      # @param body [ContextDev::Models::BrandRetrieveParams::Body::ByDomain, ContextDev::Models::BrandRetrieveParams::Body::ByName, ContextDev::Models::BrandRetrieveParams::Body::ByEmail, ContextDev::Models::BrandRetrieveParams::Body::ByTicker, ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction] One lookup, chosen by `type`.
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
      # Find up to 10 brands by name or domain, ordered by popularity. Use the returned
      # domain to retrieve a full brand profile.
      #
      # @overload search(query:, autocomplete: nil, query_by: nil, tags: nil, typo_tolerance: nil, request_options: {})
      #
      # @param query [String] Search term, matched against the fields selected by queryBy (e.g. 'nike', 'nike.
      #
      # @param autocomplete [Boolean] Whether the search term matches by prefix, so partial words match as they are ty
      #
      # @param query_by [Array<Symbol, ContextDev::Models::BrandSearchParams::QueryBy>] Fields to match the search term against, as a comma-separated list or repeated p
      #
      # @param tags [Array<String>] Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      #
      # @param typo_tolerance [Integer] Maximum number of typos tolerated when matching, from 0 to 2. Defaults to 0 (no
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
