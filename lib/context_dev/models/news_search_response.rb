# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::News#search
    class NewsSearchResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #   Articles on this page, in the requested order.
      #
      #   @return [Array<ContextDev::Models::NewsSearchResponse::Data>]
      required :data, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::NewsSearchResponse::Data] }

      # @!attribute has_more
      #   Whether more results are available after this page.
      #
      #   @return [Boolean]
      required :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute meta
      #   Summary of this page.
      #
      #   @return [ContextDev::Models::NewsSearchResponse::Meta]
      required :meta, -> { ContextDev::Models::NewsSearchResponse::Meta }

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
      #   @return [ContextDev::Models::NewsSearchResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::NewsSearchResponse::KeyMetadata }

      # @!method initialize(data:, has_more:, meta:, next_cursor:, request_id:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::NewsSearchResponse} for more details.
      #
      #   @param data [Array<ContextDev::Models::NewsSearchResponse::Data>] Articles on this page, in the requested order.
      #
      #   @param has_more [Boolean] Whether more results are available after this page.
      #
      #   @param meta [ContextDev::Models::NewsSearchResponse::Meta] Summary of this page.
      #
      #   @param next_cursor [String, nil] Pass as `cursor` to fetch the next page. `null` on the last page.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param key_metadata [ContextDev::Models::NewsSearchResponse::KeyMetadata] Credits this request used and your remaining balance.

      class Data < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #   Unique ID of the article. It stays the same across requests, so you can use it
        #   to deduplicate.
        #
        #   @return [String]
        required :id, String

        # @!attribute authors
        #   Authors named in the byline. Empty when there is no byline.
        #
        #   @return [Array<String>]
        required :authors, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute description
        #   Summary or excerpt of the article. For natural-language searches, it includes
        #   the matching passages, up to 2,000 characters.
        #
        #   @return [String, nil]
        required :description, String, nil?: true

        # @!attribute image_url
        #   URL of the article's lead image. `null` when there is none.
        #
        #   @return [String, nil]
        required :image_url, String, nil?: true

        # @!attribute language
        #   Language of the article, as an ISO 639-1 code such as `en`. `null` when unknown.
        #
        #   @return [String, nil]
        required :language, String, nil?: true

        # @!attribute match
        #   How the article relates to the company you searched for. `null` for
        #   natural-language searches.
        #
        #   @return [ContextDev::Models::NewsSearchResponse::Data::Match, nil]
        required :match, -> { ContextDev::Models::NewsSearchResponse::Data::Match }, nil?: true

        # @!attribute published_at
        #   When the article was published. `null` when the publisher does not give a
        #   reliable date.
        #
        #   @return [Time, nil]
        required :published_at, Time, nil?: true

        # @!attribute source
        #   Publication that published the article.
        #
        #   @return [ContextDev::Models::NewsSearchResponse::Data::Source]
        required :source, -> { ContextDev::Models::NewsSearchResponse::Data::Source }

        # @!attribute story_id
        #   ID shared by articles that cover the same story on the same day. Use it to group
        #   syndicated copies of one announcement across outlets.
        #
        #   @return [String]
        required :story_id, String

        # @!attribute title
        #   Headline of the article.
        #
        #   @return [String]
        required :title, String

        # @!attribute type
        #   Type of coverage. Use it to separate independent reporting (`editorial`) from
        #   company-issued content (`press_release`, `regulatory_filing`, `advisory`).
        #
        #   @return [Symbol, ContextDev::Models::NewsSearchResponse::Data::Type]
        required :type, enum: -> { ContextDev::Models::NewsSearchResponse::Data::Type }

        # @!attribute url
        #   URL of the article on the publisher's site.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(id:, authors:, description:, image_url:, language:, match:, published_at:, source:, story_id:, title:, type:, url:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::NewsSearchResponse::Data} for more details.
        #
        #   @param id [String] Unique ID of the article. It stays the same across requests, so you can use it t
        #
        #   @param authors [Array<String>] Authors named in the byline. Empty when there is no byline.
        #
        #   @param description [String, nil] Summary or excerpt of the article. For natural-language searches, it includes th
        #
        #   @param image_url [String, nil] URL of the article's lead image. `null` when there is none.
        #
        #   @param language [String, nil] Language of the article, as an ISO 639-1 code such as `en`. `null` when unknown.
        #
        #   @param match [ContextDev::Models::NewsSearchResponse::Data::Match, nil] How the article relates to the company you searched for. `null` for natural-lang
        #
        #   @param published_at [Time, nil] When the article was published. `null` when the publisher does not give a reliab
        #
        #   @param source [ContextDev::Models::NewsSearchResponse::Data::Source] Publication that published the article.
        #
        #   @param story_id [String] ID shared by articles that cover the same story on the same day. Use it to group
        #
        #   @param title [String] Headline of the article.
        #
        #   @param type [Symbol, ContextDev::Models::NewsSearchResponse::Data::Type] Type of coverage. Use it to separate independent reporting (`editorial`) from co
        #
        #   @param url [String] URL of the article on the publisher's site.

        # @see ContextDev::Models::NewsSearchResponse::Data#match
        class Match < ContextDev::Internal::Type::BaseModel
          # @!attribute confidence
          #   Confidence in the match, from 0 to 1. `null` when no score is available.
          #
          #   @return [Float, nil]
          required :confidence, Float, nil?: true

          # @!attribute level
          #   `primary` when the article is mainly about the company; `secondary` when the
          #   company is mentioned but is not the main subject.
          #
          #   @return [Symbol, ContextDev::Models::NewsSearchResponse::Data::Match::Level]
          required :level, enum: -> { ContextDev::Models::NewsSearchResponse::Data::Match::Level }

          # @!method initialize(confidence:, level:)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::NewsSearchResponse::Data::Match} for more details.
          #
          #   How the article relates to the company you searched for. `null` for
          #   natural-language searches.
          #
          #   @param confidence [Float, nil] Confidence in the match, from 0 to 1. `null` when no score is available.
          #
          #   @param level [Symbol, ContextDev::Models::NewsSearchResponse::Data::Match::Level] `primary` when the article is mainly about the company; `secondary` when the com

          # `primary` when the article is mainly about the company; `secondary` when the
          # company is mentioned but is not the main subject.
          #
          # @see ContextDev::Models::NewsSearchResponse::Data::Match#level
          module Level
            extend ContextDev::Internal::Type::Enum

            PRIMARY = :primary
            SECONDARY = :secondary

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see ContextDev::Models::NewsSearchResponse::Data#source
        class Source < ContextDev::Internal::Type::BaseModel
          # @!attribute direct
          #   Whether the article came directly from the publisher's own feed rather than
          #   through an aggregator.
          #
          #   @return [Boolean]
          required :direct, ContextDev::Internal::Type::Boolean

          # @!attribute domain
          #   Website domain of the publication, such as `reuters.com`.
          #
          #   @return [String]
          required :domain, String

          # @!attribute name
          #   Name of the publication, such as Reuters.
          #
          #   @return [String]
          required :name, String

          # @!method initialize(direct:, domain:, name:)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::NewsSearchResponse::Data::Source} for more details.
          #
          #   Publication that published the article.
          #
          #   @param direct [Boolean] Whether the article came directly from the publisher's own feed rather than thro
          #
          #   @param domain [String] Website domain of the publication, such as `reuters.com`.
          #
          #   @param name [String] Name of the publication, such as Reuters.
        end

        # Type of coverage. Use it to separate independent reporting (`editorial`) from
        # company-issued content (`press_release`, `regulatory_filing`, `advisory`).
        #
        # @see ContextDev::Models::NewsSearchResponse::Data#type
        module Type
          extend ContextDev::Internal::Type::Enum

          EDITORIAL = :editorial
          PRESS_RELEASE = :press_release
          REGULATORY_FILING = :regulatory_filing
          ADVISORY = :advisory

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::NewsSearchResponse#meta
      class Meta < ContextDev::Internal::Type::BaseModel
        # @!attribute count
        #   Number of articles on this page.
        #
        #   @return [Integer]
        required :count, Integer

        # @!method initialize(count:)
        #   Summary of this page.
        #
        #   @param count [Integer] Number of articles on this page.
      end

      # @see ContextDev::Models::NewsSearchResponse#key_metadata
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
