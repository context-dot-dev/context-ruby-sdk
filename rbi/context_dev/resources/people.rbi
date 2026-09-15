# typed: strong

module ContextDev
  module Resources
    class People
      # Finds and normalizes the best available person candidate from additive identity
      # clues, then assigns an identity match score from 0 to 100. Available on all paid
      # plans. Successful requests cost 20 credits. Disposable and free email addresses
      # (like gmail.com, yahoo.com) will throw a 422 error.
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
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::PersonEnrichResponse)
      end
      def enrich(
        company: nil,
        education: nil,
        email: nil,
        location: nil,
        name: nil,
        social_urls: nil,
        # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
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
