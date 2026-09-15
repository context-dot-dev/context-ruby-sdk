# frozen_string_literal: true

module ContextDev
  module Resources
    class People
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::PersonEnrichParams} for more details.
      #
      # Finds and normalizes the best available person candidate from additive identity
      # clues, then assigns an identity match score from 0 to 100. Available on all paid
      # plans. Successful requests cost 20 credits. Disposable and free email addresses
      # (like gmail.com, yahoo.com) will throw a 422 error.
      #
      # @overload enrich(company: nil, education: nil, email: nil, location: nil, name: nil, social_urls: nil, tags: nil, timeout_opts: nil, request_options: {})
      #
      # @param company [ContextDev::Models::PersonEnrichParams::Company]
      #
      # @param education [Array<ContextDev::Models::PersonEnrichParams::Education>]
      #
      # @param email [String]
      #
      # @param location [ContextDev::Models::PersonEnrichParams::Location]
      #
      # @param name [ContextDev::Models::PersonEnrichParams::Name]
      #
      # @param social_urls [Array<String>]
      #
      # @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      # @param timeout_opts [ContextDev::Models::PersonEnrichParams::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::PersonEnrichResponse]
      #
      # @see ContextDev::Models::PersonEnrichParams
      def enrich(params = {})
        parsed, options = ContextDev::PersonEnrichParams.dump_request(params)
        @client.request(
          method: :post,
          path: "people/enrich",
          body: parsed,
          model: ContextDev::Models::PersonEnrichResponse,
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
