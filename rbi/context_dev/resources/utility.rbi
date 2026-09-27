# typed: strong

module ContextDev
  module Resources
    class Utility
      # Queue brand or styleguide data so a later lookup can return sooner.
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
        # Data to prefetch.
        type:,
        # Labels for filtering usage in the dashboard.
        tags: nil,
        # Request deadline and what to return when it passes.
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
