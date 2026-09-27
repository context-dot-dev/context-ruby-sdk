# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Feedback#submit
    class FeedbackSubmitParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute category
      #   Kind of issue.
      #
      #   @return [Symbol, ContextDev::Models::FeedbackSubmitParams::Category]
      required :category, enum: -> { ContextDev::FeedbackSubmitParams::Category }

      # @!attribute note
      #   What went wrong and what you expected instead.
      #
      #   @return [String]
      required :note, String

      # @!attribute request_id
      #   The request_id of the API call the feedback is about, from its response body or
      #   X-Request-Id header.
      #
      #   @return [String, nil]
      optional :request_id, String

      # @!attribute tags
      #   Labels for filtering usage in the dashboard.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute url
      #   The page the feedback is about, such as one page of a crawl or a docs page.
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(category:, note:, request_id: nil, tags: nil, url: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::FeedbackSubmitParams} for more details.
      #
      #   @param category [Symbol, ContextDev::Models::FeedbackSubmitParams::Category] Kind of issue.
      #
      #   @param note [String] What went wrong and what you expected instead.
      #
      #   @param request_id [String] The request_id of the API call the feedback is about, from its response body or
      #
      #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
      #
      #   @param url [String] The page the feedback is about, such as one page of a crawl or a docs page.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Kind of issue.
      module Category
        extend ContextDev::Internal::Type::Enum

        BUG = :bug
        DOCS_MISMATCH = :docs_mismatch
        FRICTION = :friction
        FEATURE_GAP = :feature_gap
        QUALITY_DEGRADATION = :quality_degradation
        OTHER = :other

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
