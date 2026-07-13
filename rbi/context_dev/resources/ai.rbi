# typed: strong

module ContextDev
  module Resources
    class AI
      # Given a single URL, determines if it is a product page and extracts the product
      # information.
      sig do
        params(
          url: String,
          max_age_ms: Integer,
          tags: T::Array[String],
          timeout_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::AIExtractProductResponse)
      end
      def extract_product(
        # The product page URL to extract product data from.
        url:,
        # Return a cached result if a prior scrape for the same parameters exists and is
        # younger than this many milliseconds. Defaults to 7 days (604800000 ms) when
        # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
        max_age_ms: nil,
        # Optional caller-defined tags for tracking this request. Tags are recorded on the
        # request's usage log and can be used to filter usage on the dashboard usage page.
        # Up to 20 tags, each 1-50 characters.
        tags: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        request_options: {}
      )
      end

      # Extract product information from a brand's website. We will analyze the website
      # and return a list of products with details such as name, description, image,
      # pricing, features, and more.
      sig do
        params(
          body:
            T.any(
              ContextDev::AIExtractProductsParams::Body::ByDomain::OrHash,
              ContextDev::AIExtractProductsParams::Body::ByDirectURL::OrHash
            ),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::AIExtractProductsResponse)
      end
      def extract_products(body:, request_options: {})
      end

      # @api private
      sig { params(client: ContextDev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
