# typed: strong

module ContextDev
  module Models
    class FeedbackSubmitParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::FeedbackSubmitParams, ContextDev::Internal::AnyHash)
        end

      # Kind of issue. Use `quality_degradation` for wrong or incomplete results and
      # `bad_brand` for wrong or outdated brand data, such as a logo or colors.
      sig { returns(ContextDev::FeedbackSubmitParams::Category::OrSymbol) }
      attr_accessor :category

      # What went wrong and what you expected instead. Leave out API keys and personal
      # data.
      sig { returns(String) }
      attr_accessor :note

      # ID of the API call the feedback is about, from its `request_id` or
      # `X-Request-Id` header. Send this, `url`, or both.
      sig { returns(T.nilable(String)) }
      attr_reader :request_id

      sig { params(request_id: String).void }
      attr_writer :request_id

      # Labels for this request. Filter usage and request logs by them in the dashboard
      # or with `GET /org/logs`.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # URL the feedback is about, such as one page of a crawl or a docs page. Send
      # this, `request_id`, or both.
      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      sig do
        params(
          category: ContextDev::FeedbackSubmitParams::Category::OrSymbol,
          note: String,
          request_id: String,
          tags: T::Array[String],
          url: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            category: ContextDev::FeedbackSubmitParams::Category::OrSymbol,
            note: String,
            request_id: String,
            tags: T::Array[String],
            url: String,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Kind of issue. Use `quality_degradation` for wrong or incomplete results and
      # `bad_brand` for wrong or outdated brand data, such as a logo or colors.
      module Category
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::FeedbackSubmitParams::Category)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BUG =
          T.let(:bug, ContextDev::FeedbackSubmitParams::Category::TaggedSymbol)
        DOCS_MISMATCH =
          T.let(
            :docs_mismatch,
            ContextDev::FeedbackSubmitParams::Category::TaggedSymbol
          )
        FRICTION =
          T.let(
            :friction,
            ContextDev::FeedbackSubmitParams::Category::TaggedSymbol
          )
        FEATURE_GAP =
          T.let(
            :feature_gap,
            ContextDev::FeedbackSubmitParams::Category::TaggedSymbol
          )
        QUALITY_DEGRADATION =
          T.let(
            :quality_degradation,
            ContextDev::FeedbackSubmitParams::Category::TaggedSymbol
          )
        BAD_BRAND =
          T.let(
            :bad_brand,
            ContextDev::FeedbackSubmitParams::Category::TaggedSymbol
          )
        OTHER =
          T.let(
            :other,
            ContextDev::FeedbackSubmitParams::Category::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::FeedbackSubmitParams::Category::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
