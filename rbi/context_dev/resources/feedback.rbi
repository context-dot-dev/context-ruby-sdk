# typed: strong

module ContextDev
  module Resources
    # Report bugs, wrong results, and docs mismatches to the Context.dev team.
    class Feedback
      # Report a bug, docs mismatch, or wrong result to the Context.dev team. Send
      # `request_id`, `url`, or both. Any API key can submit, and a repeat report for
      # the same `request_id` returns the original feedback.
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
        # Kind of issue. Use `quality_degradation` for wrong or incomplete results and
        # `bad_brand` for wrong or outdated brand data, such as a logo or colors.
        category:,
        # What went wrong and what you expected instead. Leave out API keys and personal
        # data.
        note:,
        # ID of the API call the feedback is about, from its `request_id` or
        # `X-Request-Id` header. Send this, `url`, or both.
        request_id: nil,
        # Labels for this request. Filter usage and request logs by them in the dashboard
        # or with `GET /org/logs`.
        tags: nil,
        # URL the feedback is about, such as one page of a crawl or a docs page. Send
        # this, `request_id`, or both.
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
