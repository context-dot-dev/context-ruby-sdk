# frozen_string_literal: true

module ContextDev
  module Resources
    # Report bugs, wrong results, and docs mismatches to the Context.dev team.
    class Feedback
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::FeedbackSubmitParams} for more details.
      #
      # Report a bug, docs mismatch, or wrong result to the Context.dev team. Send
      # `request_id`, `url`, or both. Any API key can submit, and a repeat report for
      # the same `request_id` returns the original feedback.
      #
      # @overload submit(category:, note:, request_id: nil, tags: nil, url: nil, request_options: {})
      #
      # @param category [Symbol, ContextDev::Models::FeedbackSubmitParams::Category] Kind of issue. Use `quality_degradation` for wrong or incomplete results and `ba
      #
      # @param note [String] What went wrong and what you expected instead. Leave out API keys and personal d
      #
      # @param request_id [String] ID of the API call the feedback is about, from its `request_id` or `X-Request-Id
      #
      # @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
      #
      # @param url [String] URL the feedback is about, such as one page of a crawl or a docs page. Send this
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::FeedbackSubmitResponse]
      #
      # @see ContextDev::Models::FeedbackSubmitParams
      def submit(params)
        parsed, options = ContextDev::FeedbackSubmitParams.dump_request(params)
        @client.request(
          method: :post,
          path: "feedback",
          body: parsed,
          model: ContextDev::Models::FeedbackSubmitResponse,
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
