# typed: strong

module ContextDev
  module Resources
    class People
      # Find a person from identity clues and return their profile with a match score.
      # Requires a paid plan; free or disposable email addresses return 422.
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
        # Company context to help identify the person. Provide a name or domain.
        company: nil,
        # Education history to help distinguish people with similar names.
        education: nil,
        # Email address of the person to find.
        email: nil,
        # Location context to help identify the person. Provide a city, region, or
        # country.
        location: nil,
        # Person name. Without an email or person-profile URL, provide both first and last
        # name plus company, education, or location.
        name: nil,
        # Public profile URLs for the person. A person-profile URL can identify the person
        # without a name.
        social_urls: nil,
        # Labels for filtering usage in the dashboard.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
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
