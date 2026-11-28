# frozen_string_literal: true

module ContextDev
  module Resources
    # Prefetch brand and styleguide data so later lookups return sooner.
    class Utility
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::UtilityPrefetchParams} for more details.
      #
      # Start fetching a domain's brand or styleguide data in the background so a later
      # lookup returns faster. Accepts a domain or a work email.
      #
      # @overload prefetch(identifier:, type:, policies: nil, tags: nil, timeout_opts: nil, request_options: {})
      #
      # @param identifier [ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier, ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier] Domain or work email to prefetch. Provide exactly one.
      #
      # @param type [Symbol, ContextDev::Models::UtilityPrefetchParams::Type] Data to prefetch.
      #
      # @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
      #
      # @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
      #
      # @param timeout_opts [ContextDev::Models::UtilityPrefetchParams::TimeoutOpts] Request deadline. The request fails with 408 when it passes.
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
