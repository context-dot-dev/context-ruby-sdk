# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Scholar#search
    class ScholarSearchResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #   Papers on this page, in the requested order.
      #
      #   @return [Array<ContextDev::Models::ScholarSearchResponse::Data>]
      required :data,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::ScholarSearchResponse::Data] }

      # @!attribute has_more
      #   Whether more results are available after this page.
      #
      #   @return [Boolean]
      required :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute meta
      #   Summary of this page.
      #
      #   @return [ContextDev::Models::ScholarSearchResponse::Meta]
      required :meta, -> { ContextDev::Models::ScholarSearchResponse::Meta }

      # @!attribute next_cursor
      #   Pass as `cursor` to fetch the next page. `null` on the last page.
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
      #   @param data [Array<ContextDev::Models::ScholarSearchResponse::Data>] Papers on this page, in the requested order.
      #
      #   @param has_more [Boolean] Whether more results are available after this page.
      #
      #   @param meta [ContextDev::Models::ScholarSearchResponse::Meta] Summary of this page.
      #
      #   @param next_cursor [String, nil] Pass as `cursor` to fetch the next page. `null` on the last page.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param key_metadata [ContextDev::Models::ScholarSearchResponse::KeyMetadata] Credits this request used and your remaining balance.

      class Data < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #   Unique ID of the paper.
        #
        #   @return [String]
        required :id, String

        # @!attribute full_text_format
        #   Format of the full text at `full_text_url`. `jats` is JATS XML.
        #
        #   @return [Symbol, ContextDev::Models::ScholarSearchResponse::Data::FullTextFormat]
        required :full_text_format, enum: -> { ContextDev::Models::ScholarSearchResponse::Data::FullTextFormat }

        # @!attribute full_text_url
        #   Direct URL of the full text.
        #
        #   @return [String]
        required :full_text_url, String

        # @!attribute published_at
        #   When the paper was published. `null` when unknown.
        #
        #   @return [Time, nil]
        required :published_at, Time, nil?: true

        # @!attribute snippet
        #   Passage that matches the query, or the opening passage when the query is only a
        #   paper ID.
        #
        #   @return [String]
        required :snippet, String

        # @!attribute title
        #   Title of the paper.
        #
        #   @return [String]
        required :title, String

        # @!attribute url
        #   URL of the paper's landing page.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(id:, full_text_format:, full_text_url:, published_at:, snippet:, title:, url:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::ScholarSearchResponse::Data} for more details.
        #
        #   @param id [String] Unique ID of the paper.
        #
        #   @param full_text_format [Symbol, ContextDev::Models::ScholarSearchResponse::Data::FullTextFormat] Format of the full text at `full_text_url`. `jats` is JATS XML.
        #
        #   @param full_text_url [String] Direct URL of the full text.
        #
        #   @param published_at [Time, nil] When the paper was published. `null` when unknown.
        #
        #   @param snippet [String] Passage that matches the query, or the opening passage when the query is only a
        #
        #   @param title [String] Title of the paper.
        #
        #   @param url [String] URL of the paper's landing page.

        # Format of the full text at `full_text_url`. `jats` is JATS XML.
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
        #   Number of papers on this page.
        #
        #   @return [Integer]
        required :count, Integer

        # @!method initialize(count:)
        #   Summary of this page.
        #
        #   @param count [Integer] Number of papers on this page.
      end

      # @see ContextDev::Models::ScholarSearchResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits your organization has left after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits your organization has left after this request.
      end
    end
  end
end
