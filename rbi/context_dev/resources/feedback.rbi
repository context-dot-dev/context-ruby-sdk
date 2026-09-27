# typed: strong

module ContextDev
  module Resources
    # Report bugs, docs mismatches, and friction with any Context.dev API. Submissions
    # cost no credits and use a separate rate limit.
    class Feedback
      # Report a problem with a Context.dev API call, docs page, SDK, or CLI. Include
      # request_id, url, or both.
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
        # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
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
