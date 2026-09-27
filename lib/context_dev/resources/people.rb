# frozen_string_literal: true

module ContextDev
  module Resources
    class People
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::PersonEnrichParams} for more details.
      #
      # Find a person from identity clues and return their profile with a match score.
      # Requires a paid plan; free or disposable email addresses return 422.
      #
      # @overload enrich(company: nil, education: nil, email: nil, location: nil, name: nil, social_urls: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #
      # @param company [ContextDev::Models::PersonEnrichParams::Company] Company context to help identify the person. Provide a name or domain.
      #
      # @param education [Array<ContextDev::Models::PersonEnrichParams::Education>] Education history to help distinguish people with similar names.
      #
      # @param email [String] Email address of the person to find.
      #
      # @param location [ContextDev::Models::PersonEnrichParams::Location] Location context to help identify the person. Provide a city, region, or country
      #
      # @param name [ContextDev::Models::PersonEnrichParams::Name] Person name. Without an email or person-profile URL, provide both first and last
      #
      # @param social_urls [Array<String>] Public profile URLs for the person. A person-profile URL can identify the person
      #
      # @param tags [Array<String>] Labels for filtering usage in the dashboard.
      #
      # @param timeout_opts [ContextDev::Models::PersonEnrichParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      # @param zdr [Symbol, ContextDev::Models::PersonEnrichParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
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
