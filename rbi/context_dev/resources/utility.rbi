# typed: strong

module ContextDev
  module Resources
    class Utility
      # Signal that you may fetch brand data soon to improve latency. The type field
      # selects what to prefetch (currently only 'brand') and identifier carries exactly
      # one lookup key: a domain, or an email whose domain is extracted and validated
      # (free email providers and disposable email addresses are not allowed).
      sig do
        params(
          identifier:
            T.any(
              ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier::OrHash,
              ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier::OrHash
            ),
          type: ContextDev::UtilityPrefetchParams::Type::OrSymbol,
          tags: T::Array[String],
          timeout_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::UtilityPrefetchResponse)
      end
      def prefetch(
        # Identifier of the brand to prefetch. Provide exactly one of domain or email.
        identifier:,
        # What to prefetch. Currently only 'brand' is supported.
        type:,
        # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
        tags: nil,
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
