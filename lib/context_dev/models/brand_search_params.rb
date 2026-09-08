# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Brand#search
    class BrandSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute query
      #   Search term, matched against the fields selected by queryBy (e.g. 'nike',
      #   'nike.com', 'nik').
      #
      #   @return [String]
      required :query, String

      # @!attribute autocomplete
      #   Whether the search term matches by prefix, so partial words match as they are
      #   typed (e.g. 'nik' matches Nike). Set to false to match whole words only.
      #
      #   @return [Boolean, nil]
      optional :autocomplete, ContextDev::Internal::Type::Boolean

      # @!attribute query_by
      #   Fields to match the search term against, as a comma-separated list or repeated
      #   parameter: 'name', 'domain', or both. Defaults to both.
      #
      #   @return [Array<Symbol, ContextDev::Models::BrandSearchParams::QueryBy>, nil]
      optional :query_by,
               -> { ContextDev::Internal::Type::ArrayOf[enum: ContextDev::BrandSearchParams::QueryBy] }

      # @!attribute tags
      #   Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
      #   characters.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute typo_tolerance
      #   Maximum number of typos tolerated when matching, from 0 to 2. Defaults to 0 (no
      #   typo tolerance).
      #
      #   @return [Integer, nil]
      optional :typo_tolerance, Integer

      # @!method initialize(query:, autocomplete: nil, query_by: nil, tags: nil, typo_tolerance: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BrandSearchParams} for more details.
      #
      #   @param query [String] Search term, matched against the fields selected by queryBy (e.g. 'nike', 'nike.
      #
      #   @param autocomplete [Boolean] Whether the search term matches by prefix, so partial words match as they are ty
      #
      #   @param query_by [Array<Symbol, ContextDev::Models::BrandSearchParams::QueryBy>] Fields to match the search term against, as a comma-separated list or repeated p
      #
      #   @param tags [Array<String>] Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50 charac
      #
      #   @param typo_tolerance [Integer] Maximum number of typos tolerated when matching, from 0 to 2. Defaults to 0 (no
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      module QueryBy
        extend ContextDev::Internal::Type::Enum

        NAME = :name
        DOMAIN = :domain

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
