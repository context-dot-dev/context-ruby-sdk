# frozen_string_literal: true

module ContextDev
  module Resources
    class AI
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::AIExtractProductParams} for more details.
      #
      # Given a single URL, determines if it is a product page and extracts the product
      # information.
      #
      # @overload extract_product(url:, max_age_ms: nil, tags: nil, timeout_ms: nil, request_options: {})
      #
      # @param url [String] The product page URL to extract product data from.
      #
      # @param max_age_ms [Integer] Return a cached result if a prior scrape for the same parameters exists and is y
      #
      # @param tags [Array<String>] Optional caller-defined tags for tracking this request. Tags are recorded on the
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::AIExtractProductResponse]
      #
      # @see ContextDev::Models::AIExtractProductParams
      def extract_product(params)
        parsed, options = ContextDev::AIExtractProductParams.dump_request(params)
        @client.request(
          method: :post,
          path: "brand/ai/product",
          body: parsed,
          model: ContextDev::Models::AIExtractProductResponse,
          options: options
        )
      end

      # Extract product information from a brand's website. We will analyze the website
      # and return a list of products with details such as name, description, image,
      # pricing, features, and more.
      #
      # @overload extract_products(body:, request_options: {})
      #
      # @param body [ContextDev::Models::AIExtractProductsParams::Body::ByDomain, ContextDev::Models::AIExtractProductsParams::Body::ByDirectURL]
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::AIExtractProductsResponse]
      #
      # @see ContextDev::Models::AIExtractProductsParams
      def extract_products(params)
        parsed, options = ContextDev::AIExtractProductsParams.dump_request(params)
        @client.request(
          method: :post,
          path: "brand/ai/products",
          body: parsed[:body],
          model: ContextDev::Models::AIExtractProductsResponse,
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
