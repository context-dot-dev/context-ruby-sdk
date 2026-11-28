# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Feedback#submit
    class FeedbackSubmitParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute category
      #   Kind of issue. Use `quality_degradation` for wrong or incomplete results and
      #   `bad_brand` for wrong or outdated brand data, such as a logo or colors.
      #
      #   @return [Symbol, ContextDev::Models::FeedbackSubmitParams::Category]
      required :category, enum: -> { ContextDev::FeedbackSubmitParams::Category }

      # @!attribute note
      #   What went wrong and what you expected instead. Leave out API keys and personal
      #   data.
      #
      #   @return [String]
      required :note, String

      # @!attribute request_id
      #   ID of the API call the feedback is about, from its `request_id` or
      #   `X-Request-Id` header. Send this, `url`, or both.
      #
      #   @return [String, nil]
      optional :request_id, String

      # @!attribute tags
      #   Labels for this request. Filter usage and request logs by them in the dashboard
      #   or with `GET /org/logs`.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute url
      #   URL the feedback is about, such as one page of a crawl or a docs page. Send
      #   this, `request_id`, or both.
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(category:, note:, request_id: nil, tags: nil, url: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::FeedbackSubmitParams} for more details.
      #
      #   @param category [Symbol, ContextDev::Models::FeedbackSubmitParams::Category] Kind of issue. Use `quality_degradation` for wrong or incomplete results and `ba
      #
      #   @param note [String] What went wrong and what you expected instead. Leave out API keys and personal d
      #
      #   @param request_id [String] ID of the API call the feedback is about, from its `request_id` or `X-Request-Id
      #
      #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
      #
      #   @param url [String] URL the feedback is about, such as one page of a crawl or a docs page. Send this
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Kind of issue. Use `quality_degradation` for wrong or incomplete results and
      # `bad_brand` for wrong or outdated brand data, such as a logo or colors.
      module Category
        extend ContextDev::Internal::Type::Enum

        BUG = :bug
        DOCS_MISMATCH = :docs_mismatch
        FRICTION = :friction
        FEATURE_GAP = :feature_gap
        QUALITY_DEGRADATION = :quality_degradation
        BAD_BRAND = :bad_brand
        OTHER = :other

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
