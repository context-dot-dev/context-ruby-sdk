# frozen_string_literal: true

module ContextDev
  module Resources
    # Enrich a person from identity clues, or find people with a natural-language
    # query.
    class People
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::PersonEnrichParams} for more details.
      #
      # Match a person from a work email, a profile URL, or a name with company,
      # education, or location context, and get their profile with an identity-match
      # score from 0 to 100. The best candidate is returned even when the match is weak,
      # so set a score threshold for your workflow. `not_found` results are free.
      #
      # @overload enrich(company: nil, education: nil, email: nil, location: nil, name: nil, social_urls: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #
      # @param company [ContextDev::Models::PersonEnrichParams::Company] Company associated with the person. Send a `name`, a `domain`, or both.
      #
      # @param education [Array<ContextDev::Models::PersonEnrichParams::Education>] Education history to help distinguish people with similar names.
      #
      # @param email [String] Work email address of the person. Free and disposable email providers return 422
      #
      # @param location [ContextDev::Models::PersonEnrichParams::Location] Location associated with the person. Send at least one of `city`, `region`, or `
      #
      # @param name [ContextDev::Models::PersonEnrichParams::Name] Name of the person. Without an email or profile URL, send both `first` and `last
      #
      # @param social_urls [Array<String>] Public profile URLs for the person. A person-profile URL is enough to identify t
      #
      # @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
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

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::PersonSearchParams} for more details.
      #
      # Find people from a plain-language description, such as
      # `VPs of sales at solar companies in California`. Each result includes the
      # current role and employer, location, years of experience, skills, schools, and
      # public profile URLs. Pages with no matches are free.
      #
      # @overload search(query:, cursor: nil, filters: nil, mode: nil, tags: nil, zdr: nil, request_options: {})
      #
      # @param query [String] Plain-language description of the people to find. Up to 500 characters in `fast`
      #
      # @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page. Send the
      #
      # @param filters [ContextDev::Models::PersonSearchParams::Filters] Constraints every result must match, in addition to `query`.
      #
      # @param mode [Symbol, ContextDev::Models::PersonSearchParams::Mode] `fast` matches people on basic criteria such as role, location, or background; `
      #
      # @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
      #
      # @param zdr [Symbol, ContextDev::Models::PersonSearchParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::PersonSearchResponse]
      #
      # @see ContextDev::Models::PersonSearchParams
      def search(params)
        parsed, options = ContextDev::PersonSearchParams.dump_request(params)
        @client.request(
          method: :post,
          path: "people/search",
          body: parsed,
          model: ContextDev::Models::PersonSearchResponse,
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
