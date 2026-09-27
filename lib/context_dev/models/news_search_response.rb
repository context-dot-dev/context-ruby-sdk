# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::News#search
    class NewsSearchResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #   Articles matching the search, in the requested order.
      #
      #   @return [Array<ContextDev::Models::NewsSearchResponse::Data>]
      required :data, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::NewsSearchResponse::Data] }

      # @!attribute has_more
      #   True when more results are available beyond this page.
      #
      #   @return [Boolean]
      required :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute meta
      #   Summary information about this response.
      #
      #   @return [ContextDev::Models::NewsSearchResponse::Meta]
      required :meta, -> { ContextDev::Models::NewsSearchResponse::Meta }

      # @!attribute next_cursor
      #   Pass as cursor in the next request to fetch the following page. Null when there
      #   are no more results.
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
      #   @param data [Array<ContextDev::Models::NewsSearchResponse::Data>] Articles matching the search, in the requested order.
      #
      #   @param has_more [Boolean] True when more results are available beyond this page.
      #
      #   @param meta [ContextDev::Models::NewsSearchResponse::Meta] Summary information about this response.
      #
      #   @param next_cursor [String, nil] Pass as cursor in the next request to fetch the following page. Null when there
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param key_metadata [ContextDev::Models::NewsSearchResponse::KeyMetadata] Credits this request used and your remaining balance.

      class Data < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #   Stable unique identifier for this article. Use it to deduplicate or reference an
        #   article across requests.
        #
        #   @return [String]
        required :id, String

        # @!attribute authors
        #   Bylined authors. Empty when no byline is available.
        #
        #   @return [Array<String>]
        required :authors, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute description
        #   Short summary or excerpt of the article, when the publisher provides one.
        #
        #   @return [String, nil]
        required :description, String, nil?: true

        # @!attribute image_url
        #   Lead image for the article, when one is available.
        #
        #   @return [String, nil]
        required :image_url, String, nil?: true

        # @!attribute language
        #   Language the article is written in, as a lowercase ISO 639-1 code such as en.
        #   Null when unknown.
        #
        #   @return [String, nil]
        required :language, String, nil?: true

        # @!attribute match
        #   How the article relates to the company you searched for.
        #
        #   @return [ContextDev::Models::NewsSearchResponse::Data::Match]
        required :match, -> { ContextDev::Models::NewsSearchResponse::Data::Match }

        # @!attribute published_at
        #   When the article was published, as an ISO 8601 timestamp. Null when the
        #   publisher does not state a reliable date.
        #
        #   @return [Time, nil]
        required :published_at, Time, nil?: true

        # @!attribute source
        #   The publication that published the article.
        #
        #   @return [ContextDev::Models::NewsSearchResponse::Data::Source]
        required :source, -> { ContextDev::Models::NewsSearchResponse::Data::Source }

        # @!attribute story_id
        #   Shared by articles covering the same story on the same day. Use it to group or
        #   collapse syndicated copies of one announcement across outlets.
        #
        #   @return [String]
        required :story_id, String

        # @!attribute title
        #   Article headline.
        #
        #   @return [String]
        required :title, String

        # @!attribute type
        #   Kind of coverage. Use it to separate independent reporting (editorial) from
        #   company-issued content (press_release, regulatory_filing, advisory).
        #
        #   @return [Symbol, ContextDev::Models::NewsSearchResponse::Data::Type]
        required :type, enum: -> { ContextDev::Models::NewsSearchResponse::Data::Type }

        # @!attribute url
        #   Link to the article on the publisher site.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(id:, authors:, description:, image_url:, language:, match:, published_at:, source:, story_id:, title:, type:, url:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::NewsSearchResponse::Data} for more details.
        #
        #   @param id [String] Stable unique identifier for this article. Use it to deduplicate or reference an
        #
        #   @param authors [Array<String>] Bylined authors. Empty when no byline is available.
        #
        #   @param description [String, nil] Short summary or excerpt of the article, when the publisher provides one.
        #
        #   @param image_url [String, nil] Lead image for the article, when one is available.
        #
        #   @param language [String, nil] Language the article is written in, as a lowercase ISO 639-1 code such as en. Nu
        #
        #   @param match [ContextDev::Models::NewsSearchResponse::Data::Match] How the article relates to the company you searched for.
        #
        #   @param published_at [Time, nil] When the article was published, as an ISO 8601 timestamp. Null when the publishe
        #
        #   @param source [ContextDev::Models::NewsSearchResponse::Data::Source] The publication that published the article.
        #
        #   @param story_id [String] Shared by articles covering the same story on the same day. Use it to group or c
        #
        #   @param title [String] Article headline.
        #
        #   @param type [Symbol, ContextDev::Models::NewsSearchResponse::Data::Type] Kind of coverage. Use it to separate independent reporting (editorial) from comp
        #
        #   @param url [String] Link to the article on the publisher site.

        # @see ContextDev::Models::NewsSearchResponse::Data#match
        class Match < ContextDev::Internal::Type::BaseModel
          # @!attribute confidence
          #   How confident the match is, from 0 to 1. Null when a score is unavailable.
          #
          #   @return [Float, nil]
          required :confidence, Float, nil?: true

          # @!attribute level
          #   primary when the article is mainly about the company, secondary when the company
          #   is mentioned but is not the main subject.
          #
          #   @return [Symbol, ContextDev::Models::NewsSearchResponse::Data::Match::Level]
          required :level, enum: -> { ContextDev::Models::NewsSearchResponse::Data::Match::Level }

          # @!method initialize(confidence:, level:)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::NewsSearchResponse::Data::Match} for more details.
          #
          #   How the article relates to the company you searched for.
          #
          #   @param confidence [Float, nil] How confident the match is, from 0 to 1. Null when a score is unavailable.
          #
          #   @param level [Symbol, ContextDev::Models::NewsSearchResponse::Data::Match::Level] primary when the article is mainly about the company, secondary when the company

          # primary when the article is mainly about the company, secondary when the company
          # is mentioned but is not the main subject.
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
          #   True when Context observed this article in the publisher-owned feed.
          #
          #   @return [Boolean]
          required :direct, ContextDev::Internal::Type::Boolean

          # @!attribute domain
          #   Website domain of the publication.
          #
          #   @return [String]
          required :domain, String

          # @!attribute name
          #   Name of the publication, such as Reuters.
          #
          #   @return [String]
          required :name, String

          # @!method initialize(direct:, domain:, name:)
          #   The publication that published the article.
          #
          #   @param direct [Boolean] True when Context observed this article in the publisher-owned feed.
          #
          #   @param domain [String] Website domain of the publication.
          #
          #   @param name [String] Name of the publication, such as Reuters.
        end

        # Kind of coverage. Use it to separate independent reporting (editorial) from
        # company-issued content (press_release, regulatory_filing, advisory).
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
        #   Number of articles in this page.
        #
        #   @return [Integer]
        required :count, Integer

        # @!method initialize(count:)
        #   Summary information about this response.
        #
        #   @param count [Integer] Number of articles in this page.
      end

      # @see ContextDev::Models::NewsSearchResponse#key_metadata
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
