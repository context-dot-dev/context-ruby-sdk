# typed: strong

module ContextDev
  module Resources
    # Enrich a person from identity clues, or find people with a natural-language
    # query.
    class People
      # Match a person from a work email, a profile URL, or a name with company,
      # education, or location context, and get their profile with an identity-match
      # score from 0 to 100. The best candidate is returned even when the match is weak,
      # so set a score threshold for your workflow. `not_found` results are free.
      sig do
        params(
          company: ContextDev::PersonEnrichParams::Company::OrHash,
          education:
            T::Array[ContextDev::PersonEnrichParams::Education::OrHash],
          email: String,
          location: ContextDev::PersonEnrichParams::Location::OrHash,
          name: ContextDev::PersonEnrichParams::Name::OrHash,
          social_urls: T::Array[String],
          tags: T::Array[String],
          timeout_opts: ContextDev::PersonEnrichParams::TimeoutOpts::OrHash,
          zdr: ContextDev::PersonEnrichParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::PersonEnrichResponse)
      end
      def enrich(
        # Company associated with the person. Send a `name`, a `domain`, or both.
        company: nil,
        # Education history to help distinguish people with similar names.
        education: nil,
        # Work email address of the person. Free and disposable email providers
        # return 422.
        email: nil,
        # Location associated with the person. Send at least one of `city`, `region`, or
        # `country`.
        location: nil,
        # Name of the person. Without an email or profile URL, send both `first` and
        # `last` plus `company`, `education`, or `location`.
        name: nil,
        # Public profile URLs for the person. A person-profile URL is enough to identify
        # them without a name.
        social_urls: nil,
        # Labels for this request. Filter usage and request logs by them in the dashboard
        # or with `GET /org/logs`.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      # Find people from a plain-language description, such as
      # `VPs of sales at solar companies in California`. Each result includes the
      # current role and employer, location, years of experience, skills, schools, and
      # public profile URLs. Pages with no matches are free.
      sig do
        params(
          query: String,
          cursor: String,
          filters: ContextDev::PersonSearchParams::Filters::OrHash,
          mode: ContextDev::PersonSearchParams::Mode::OrSymbol,
          tags: T::Array[String],
          zdr: ContextDev::PersonSearchParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::PersonSearchResponse)
      end
      def search(
        # Plain-language description of the people to find. Up to 500 characters in `fast`
        # mode and 5000 in `ultra` mode.
        query:,
        # Cursor from the previous page's `next_cursor`. Omit for the first page. Send the
        # same `query`, `mode`, and `filters` with it.
        cursor: nil,
        # Constraints every result must match, in addition to `query`.
        filters: nil,
        # `fast` matches people on basic criteria such as role, location, or background;
        # `ultra` runs a deeper search, checks every candidate against each criterion in
        # your query, and adds a `match` score. Complex `ultra` searches can take up to 30
        # seconds, so set your client timeout to match.
        mode: nil,
        # Labels for this request. Filter usage and request logs by them in the dashboard
        # or with `GET /org/logs`.
        tags: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
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
