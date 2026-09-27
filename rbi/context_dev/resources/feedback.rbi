# typed: strong

module ContextDev
  module Resources
    # Report API issues and documentation mismatches.
    class Feedback
      # Report an API issue or documentation mismatch, including request IDs when
      # available.
      sig do
        params(
          category: ContextDev::FeedbackSubmitParams::Category::OrSymbol,
          note: String,
          request_id: String,
          tags: T::Array[String],
          url: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::FeedbackSubmitResponse)
      end
      def submit(
        # Kind of issue.
        category:,
        # What went wrong and what you expected instead.
        note:,
        # The request_id of the API call the feedback is about, from its response body or
        # X-Request-Id header.
        request_id: nil,
        # Labels for filtering usage in the dashboard.
        tags: nil,
        # The page the feedback is about, such as one page of a crawl or a docs page.
        url: nil,
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
