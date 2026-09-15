# typed: strong

module ContextDev
  module Resources
    class Utility
      # Signal that you may fetch data soon to improve latency. The type field selects
      # what to prefetch ('brand' queues a brand data fetch, 'styleguide' queues a
      # styleguide extraction) and identifier carries exactly one lookup key: a domain,
      # or an email whose domain is extracted and validated (free email providers and
      # disposable email addresses are not allowed).
      sig do
        params(
          identifier:
            T.any(
              ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier::OrHash,
              ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier::OrHash
            ),
          type: ContextDev::UtilityPrefetchParams::Type::OrSymbol,
          tags: T::Array[String],
          timeout_opts: ContextDev::UtilityPrefetchParams::TimeoutOpts::OrHash,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::UtilityPrefetchResponse)
      end
      def prefetch(
        # Identifier of the target to prefetch. Provide exactly one of domain or email.
        identifier:,
        # What to prefetch: 'brand' warms the brand data cache, 'styleguide' warms the
        # styleguide cache.
        type:,
        # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
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
