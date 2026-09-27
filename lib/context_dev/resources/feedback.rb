# frozen_string_literal: true

module ContextDev
  module Resources
    # Report bugs, docs mismatches, and friction with any Context.dev API. Submissions
    # cost no credits and use a separate rate limit.
    class Feedback
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::FeedbackSubmitParams} for more details.
      #
      # Report a problem with a Context.dev API call, docs page, SDK, or CLI. Include
      # request_id, url, or both.
      #
      # @overload submit(category:, note:, request_id: nil, tags: nil, url: nil, request_options: {})
      #
      # @param category [Symbol, ContextDev::Models::FeedbackSubmitParams::Category] Kind of issue.
      #
      # @param note [String] What went wrong and what you expected instead.
      #
      # @param request_id [String] The request_id of the API call the feedback is about, from its response body or
      #
      # @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      # @param url [String] The page the feedback is about, such as one page of a crawl or a docs page.
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
