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

      # Returns a simplified version of brand data containing only essential
      # information: domain, title, colors, logos, and backdrops. Optimized for faster
      # responses and reduced data transfer.
      sig do
        params(
          domain: String,
          max_age_ms: T.nilable(Integer),
          tags: T::Array[String],
          theme: ContextDev::BrandRetrieveSimplifiedParams::Theme::OrSymbol,
          timeout_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BrandRetrieveSimplifiedResponse)
      end
      def retrieve_simplified(
        # Domain name to retrieve simplified brand data for
        domain:,
        # Maximum age in milliseconds for cached brand data before the API performs a hard
        # refresh. Defaults to 3 months (7776000000 ms). Values below 1 day (86400000 ms)
        # are clamped to 1 day; values above 1 year (31536000000 ms) are clamped to 1
        # year.
        max_age_ms: nil,
        # Optional comma-separated caller-defined tags for tracking this request. Tags are
        # recorded on the request's usage log and can be used to filter usage on the
        # dashboard usage page. Up to 20 tags, each 1-50 characters.
        tags: nil,
        # Optional theme preference used when selecting brand assets.
        theme: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
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
