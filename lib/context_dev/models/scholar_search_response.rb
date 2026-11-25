# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Scholar#search
    class ScholarSearchResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #   Matching papers in the requested order.
      #
      #   @return [Array<ContextDev::Models::ScholarSearchResponse::Data>]
      required :data,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::ScholarSearchResponse::Data] }

      # @!attribute has_more
      #   Whether another page is available.
      #
      #   @return [Boolean]
      required :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute meta
      #   Page summary.
      #
      #   @return [ContextDev::Models::ScholarSearchResponse::Meta]
      required :meta, -> { ContextDev::Models::ScholarSearchResponse::Meta }

      # @!attribute next_cursor
      #   Cursor for the next page, or null on the last page.
      #
      #   @return [String, nil]
      required :next_cursor, String, nil?: true

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::ScholarSearchResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::ScholarSearchResponse::KeyMetadata }

      # @!method initialize(data:, has_more:, meta:, next_cursor:, request_id:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::ScholarSearchResponse} for more details.
      #
      #   @param data [Array<ContextDev::Models::ScholarSearchResponse::Data>] Matching papers in the requested order.
      #
      #   @param has_more [Boolean] Whether another page is available.
      #
      #   @param meta [ContextDev::Models::ScholarSearchResponse::Meta] Page summary.
      #
      #   @param next_cursor [String, nil] Cursor for the next page, or null on the last page.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param key_metadata [ContextDev::Models::ScholarSearchResponse::KeyMetadata] Credits this request used and your remaining balance.

      class Data < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #   Stable paper identifier.
        #
        #   @return [String]
        required :id, String

        # @!attribute full_text_format
        #   Format of the linked full text. jats is XML.
        #
        #   @return [Symbol, ContextDev::Models::ScholarSearchResponse::Data::FullTextFormat]
        required :full_text_format, enum: -> { ContextDev::Models::ScholarSearchResponse::Data::FullTextFormat }

        # @!attribute full_text_url
        #   Direct link to the full text.
        #
        #   @return [String]
        required :full_text_url, String

        # @!attribute published_at
        #   Publication time in ISO 8601, or null when unknown.
        #
        #   @return [Time, nil]
        required :published_at, Time, nil?: true

        # @!attribute snippet
        #   Matching passage, or opening passage for an ID-only query.
        #
        #   @return [String]
        required :snippet, String

        # @!attribute title
        #   Paper title.
        #
        #   @return [String]
        required :title, String

        # @!attribute url
        #   Paper landing page.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(id:, full_text_format:, full_text_url:, published_at:, snippet:, title:, url:)
        #   @param id [String] Stable paper identifier.
        #
        #   @param full_text_format [Symbol, ContextDev::Models::ScholarSearchResponse::Data::FullTextFormat] Format of the linked full text. jats is XML.
        #
        #   @param full_text_url [String] Direct link to the full text.
        #
        #   @param published_at [Time, nil] Publication time in ISO 8601, or null when unknown.
        #
        #   @param snippet [String] Matching passage, or opening passage for an ID-only query.
        #
        #   @param title [String] Paper title.
        #
        #   @param url [String] Paper landing page.

        # Format of the linked full text. jats is XML.
        #
        # @see ContextDev::Models::ScholarSearchResponse::Data#full_text_format
        module FullTextFormat
          extend ContextDev::Internal::Type::Enum

          PDF = :pdf
          HTML = :html
          JATS = :jats

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::ScholarSearchResponse#meta
      class Meta < ContextDev::Internal::Type::BaseModel
        # @!attribute count
        #   Papers in this page.
        #
        #   @return [Integer]
        required :count, Integer

        # @!method initialize(count:)
        #   Page summary.
        #
        #   @param count [Integer] Papers in this page.
      end

      # @see ContextDev::Models::ScholarSearchResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits remaining for your organization.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits remaining for your organization.
      end
    end
  end
end
