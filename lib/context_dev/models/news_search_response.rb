# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::News#search
    class NewsSearchResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Array<ContextDev::Models::NewsSearchResponse::Data>]
      required :data, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::NewsSearchResponse::Data] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute meta
      #
      #   @return [ContextDev::Models::NewsSearchResponse::Meta]
      required :meta, -> { ContextDev::Models::NewsSearchResponse::Meta }

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      required :next_cursor, String, nil?: true

      # @!attribute key_metadata
      #   Metadata about the API key used for the request. Included in every response
      #   whenever a valid API key is provided, even when the response status is not 200.
      #
      #   @return [ContextDev::Models::NewsSearchResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::NewsSearchResponse::KeyMetadata }

      # @!method initialize(data:, has_more:, meta:, next_cursor:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::NewsSearchResponse} for more details.
      #
      #   @param data [Array<ContextDev::Models::NewsSearchResponse::Data>]
      #
      #   @param has_more [Boolean]
      #
      #   @param meta [ContextDev::Models::NewsSearchResponse::Meta]
      #
      #   @param next_cursor [String, nil]
      #
      #   @param key_metadata [ContextDev::Models::NewsSearchResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when

      class Data < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute authors
        #
        #   @return [Array<String>]
        required :authors, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute description
        #
        #   @return [String, nil]
        required :description, String, nil?: true

        # @!attribute image_url
        #
        #   @return [String, nil]
        required :image_url, String, nil?: true

        # @!attribute language
        #
        #   @return [String, nil]
        required :language, String, nil?: true

        # @!attribute match
        #
        #   @return [ContextDev::Models::NewsSearchResponse::Data::Match]
        required :match, -> { ContextDev::Models::NewsSearchResponse::Data::Match }

        # @!attribute published_at
        #
        #   @return [Time, nil]
        required :published_at, Time, nil?: true

        # @!attribute source
        #
        #   @return [ContextDev::Models::NewsSearchResponse::Data::Source]
        required :source, -> { ContextDev::Models::NewsSearchResponse::Data::Source }

        # @!attribute story_id
        #   Groups matching normalized headlines published on the same UTC day.
        #
        #   @return [String]
        required :story_id, String

        # @!attribute title
        #
        #   @return [String]
        required :title, String

        # @!attribute type
        #
        #   @return [Symbol, ContextDev::Models::NewsSearchResponse::Data::Type]
        required :type, enum: -> { ContextDev::Models::NewsSearchResponse::Data::Type }

        # @!attribute url
        #
        #   @return [String]
        required :url, String

        # @!method initialize(id:, authors:, description:, image_url:, language:, match:, published_at:, source:, story_id:, title:, type:, url:)
        #   @param id [String]
        #
        #   @param authors [Array<String>]
        #
        #   @param description [String, nil]
        #
        #   @param image_url [String, nil]
        #
        #   @param language [String, nil]
        #
        #   @param match [ContextDev::Models::NewsSearchResponse::Data::Match]
        #
        #   @param published_at [Time, nil]
        #
        #   @param source [ContextDev::Models::NewsSearchResponse::Data::Source]
        #
        #   @param story_id [String] Groups matching normalized headlines published on the same UTC day.
        #
        #   @param title [String]
        #
        #   @param type [Symbol, ContextDev::Models::NewsSearchResponse::Data::Type]
        #
        #   @param url [String]

        # @see ContextDev::Models::NewsSearchResponse::Data#match
        class Match < ContextDev::Internal::Type::BaseModel
          # @!attribute confidence
          #
          #   @return [Float, nil]
          required :confidence, Float, nil?: true

          # @!attribute level
          #
          #   @return [Symbol, ContextDev::Models::NewsSearchResponse::Data::Match::Level]
          required :level, enum: -> { ContextDev::Models::NewsSearchResponse::Data::Match::Level }

          # @!method initialize(confidence:, level:)
          #   @param confidence [Float, nil]
          #   @param level [Symbol, ContextDev::Models::NewsSearchResponse::Data::Match::Level]

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
          #
          #   @return [String]
          required :domain, String

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!method initialize(direct:, domain:, name:)
          #   @param direct [Boolean] True when Context observed this article in the publisher-owned feed.
          #
          #   @param domain [String]
          #
          #   @param name [String]
        end

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
        #
        #   @return [Integer]
        required :count, Integer

        # @!method initialize(count:)
        #   @param count [Integer]
      end

      # @see ContextDev::Models::NewsSearchResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   The number of credits consumed by this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   The number of credits remaining for your organization after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Metadata about the API key used for the request. Included in every response
        #   whenever a valid API key is provided, even when the response status is not 200.
        #
        #   @param credits_consumed [Integer] The number of credits consumed by this request.
        #
        #   @param credits_remaining [Integer] The number of credits remaining for your organization after this request.
      end
    end
  end
end
