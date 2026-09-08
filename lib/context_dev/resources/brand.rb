# frozen_string_literal: true

module ContextDev
  module Resources
    class Brand
      # Retrieve logos, backdrops, colors, industry, description, and more. Provide
      # exactly one lookup identifier in the request body: a domain, company name, email
      # address, stock ticker, transaction descriptor, or direct URL. Note:
      # `by_direct_url` fetches brand data only from the provided URL — not from the
      # entire internet.
      #
      # @overload retrieve(body:, request_options: {})
      #
      # @param body [ContextDev::Models::BrandRetrieveParams::Body::ByDomain, ContextDev::Models::BrandRetrieveParams::Body::ByName, ContextDev::Models::BrandRetrieveParams::Body::ByEmail, ContextDev::Models::BrandRetrieveParams::Body::ByTicker, ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction] Exactly one lookup type must be provided.
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
      # {ContextDev::Models::BrandRetrieveSimplifiedParams} for more details.
      #
      # Returns a simplified version of brand data containing only essential
      # information: domain, title, colors, logos, and backdrops. Optimized for faster
      # responses and reduced data transfer.
      #
      # @overload retrieve_simplified(domain:, max_age_ms: nil, tags: nil, theme: nil, timeout_ms: nil, request_options: {})
      #
      # @param domain [String] Domain name to retrieve simplified brand data for
      #
      # @param max_age_ms [Integer, nil] Maximum age in milliseconds for cached brand data before the API performs a hard
      #
      # @param tags [Array<String>] Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50 charac
      #
      # @param theme [Symbol, ContextDev::Models::BrandRetrieveSimplifiedParams::Theme] Optional theme preference used when selecting brand assets.
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandRetrieveSimplifiedResponse]
      #
      # @see ContextDev::Models::BrandRetrieveSimplifiedParams
      def retrieve_simplified(params)
        parsed, options = ContextDev::BrandRetrieveSimplifiedParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "brand/retrieve-simplified",
          query: query.transform_keys(max_age_ms: "maxAgeMs", timeout_ms: "timeoutMS"),
          model: ContextDev::Models::BrandRetrieveSimplifiedResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandSearchParams} for more details.
      #
      # Search indexed brands by name or domain
      #
      # @overload search(query:, autocomplete: nil, query_by: nil, tags: nil, typo_tolerance: nil, request_options: {})
      #
      # @param query [String] Search term, matched against the fields selected by queryBy (e.g. 'nike', 'nike.
      #
      # @param autocomplete [Boolean] Whether the search term matches by prefix, so partial words match as they are ty
      #
      # @param query_by [Array<Symbol, ContextDev::Models::BrandSearchParams::QueryBy>] Fields to match the search term against, as a comma-separated list or repeated p
      #
      # @param tags [Array<String>] Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50 charac
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
