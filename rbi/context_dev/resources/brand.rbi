# typed: strong

module ContextDev
  module Resources
    class Brand
      # Retrieve logos, backdrops, colors, industry, description, and more. Provide
      # exactly one lookup identifier in the request body: a domain, company name, email
      # address, stock ticker, or transaction descriptor.
      sig do
        params(
          body:
            T.any(
              ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::OrHash,
              ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::OrHash,
              ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::OrHash,
              ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::OrHash,
              ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::OrHash
            ),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BrandRetrieveResponse)
      end
      def retrieve(
        # Exactly one of domain, name, email, ticker, or transaction_info must be
        # provided.
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
          max_age_ms: Integer,
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
