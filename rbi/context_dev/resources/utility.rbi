# typed: strong

module ContextDev
  module Resources
    # Prefetch brand and styleguide data so later lookups return sooner.
    class Utility
      # Start fetching a domain's brand or styleguide data in the background so a later
      # lookup returns faster. Accepts a domain or a work email.
      sig do
        params(
          identifier:
            T.any(
              ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier::OrHash,
              ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier::OrHash
            ),
          type: ContextDev::UtilityPrefetchParams::Type::OrSymbol,
          policies: T::Array[String],
          tags: T::Array[String],
          timeout_opts: ContextDev::UtilityPrefetchParams::TimeoutOpts::OrHash,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::UtilityPrefetchResponse)
      end
      def prefetch(
        # Domain or work email to prefetch. Provide exactly one.
        identifier:,
        # Data to prefetch.
        type:,
        # Access policy IDs to apply; each URL must pass all of them. Requires access
        # policies enabled for your organization; otherwise returns
        # `ACCESS_POLICIES_NOT_ENABLED`.
        policies: nil,
        # Labels for this request. Filter usage and request logs by them in the dashboard
        # or with `GET /org/logs`.
        tags: nil,
        # Request deadline. The request fails with 408 when it passes.
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
