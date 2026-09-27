# frozen_string_literal: true

module ContextDev
  module Resources
    class Utility
      # Queue brand or styleguide data so a later lookup can return sooner.
      #
      # @overload prefetch(identifier:, type:, tags: nil, timeout_opts: nil, request_options: {})
      #
      # @param identifier [ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier, ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier] Identifier of the target to prefetch. Provide exactly one of domain or email.
      #
      # @param type [Symbol, ContextDev::Models::UtilityPrefetchParams::Type] Data to prefetch.
      #
      # @param tags [Array<String>] Labels for filtering usage in the dashboard.
      #
      # @param timeout_opts [ContextDev::Models::UtilityPrefetchParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::UtilityPrefetchResponse]
      #
      # @see ContextDev::Models::UtilityPrefetchParams
      def prefetch(params)
        parsed, options = ContextDev::UtilityPrefetchParams.dump_request(params)
        @client.request(
          method: :post,
          path: "utility/prefetch",
          body: parsed,
          model: ContextDev::Models::UtilityPrefetchResponse,
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
