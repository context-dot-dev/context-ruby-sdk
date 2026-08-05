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
      # @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
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
      # Search brands by name or domain and get back up to 10 lightweight matches
      # (domain, name, logo), most popular first: by Tranco rank, then market cap for
      # brands outside the Tranco list, with text relevance breaking ties. Matching is
      # prefix-based with no typo tolerance, so it is suited to autocomplete. Only
      # brands already in the Context.dev index are returned — use /brand/retrieve to
      # fetch (and index) a specific domain. Free on Pro and Scale plans; costs 1 credit
      # per request on the Free and Starter plans.
      #
      # @overload search(query:, tags: nil, request_options: {})
      #
      # @param query [String] Search term, matched against brand names and domains by prefix (e.g. 'nike', 'ni
      #
      # @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
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
          query: query,
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
