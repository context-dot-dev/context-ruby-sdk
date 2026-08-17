# frozen_string_literal: true

module ContextDev
  module Resources
    class Utility
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::UtilityPrefetchParams} for more details.
      #
      # Signal that you may fetch data soon to improve latency. The type field selects
      # what to prefetch ('brand' queues a brand data fetch, 'styleguide' queues a
      # styleguide extraction) and identifier carries exactly one lookup key: a domain,
      # or an email whose domain is extracted and validated (free email providers and
      # disposable email addresses are not allowed).
      #
      # @overload prefetch(identifier:, type:, tags: nil, timeout_ms: nil, request_options: {})
      #
      # @param identifier [ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier, ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier] Identifier of the target to prefetch. Provide exactly one of domain or email.
      #
      # @param type [Symbol, ContextDev::Models::UtilityPrefetchParams::Type] What to prefetch: 'brand' warms the brand data cache, 'styleguide' warms the sty
      #
      # @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
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
