# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::People#search
    class PersonSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute query
      #   Plain-language description of the people to find. Up to 500 characters in `fast`
      #   mode and 5000 in `ultra` mode.
      #
      #   @return [String]
      required :query, String

      # @!attribute cursor
      #   Cursor from the previous page's `next_cursor`. Omit for the first page. Send the
      #   same `query`, `mode`, and `filters` with it.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute filters
      #   Constraints every result must match, in addition to `query`.
      #
      #   @return [ContextDev::Models::PersonSearchParams::Filters, nil]
      optional :filters, -> { ContextDev::PersonSearchParams::Filters }

      # @!attribute mode
      #   `fast` matches people on basic criteria such as role, location, or background;
      #   `ultra` runs a deeper search, checks every candidate against each criterion in
      #   your query, and adds a `match` score. Complex `ultra` searches can take up to 30
      #   seconds, so set your client timeout to match.
      #
      #   @return [Symbol, ContextDev::Models::PersonSearchParams::Mode, nil]
      optional :mode, enum: -> { ContextDev::PersonSearchParams::Mode }

      # @!attribute tags
      #   Labels for this request. Filter usage and request logs by them in the dashboard
      #   or with `GET /org/logs`.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute zdr
      #   `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      #   your organization has ZDR.
      #
      #   @return [Symbol, ContextDev::Models::PersonSearchParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::PersonSearchParams::Zdr }

      # @!method initialize(query:, cursor: nil, filters: nil, mode: nil, tags: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::PersonSearchParams} for more details.
      #
      #   @param query [String] Plain-language description of the people to find. Up to 500 characters in `fast`
      #
      #   @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page. Send the
      #
      #   @param filters [ContextDev::Models::PersonSearchParams::Filters] Constraints every result must match, in addition to `query`.
      #
      #   @param mode [Symbol, ContextDev::Models::PersonSearchParams::Mode] `fast` matches people on basic criteria such as role, location, or background; `
      #
      #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
      #
      #   @param zdr [Symbol, ContextDev::Models::PersonSearchParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      class Filters < ContextDev::Internal::Type::BaseModel
        # @!attribute countries
        #   Only return people who live in these countries, as ISO 3166-1 alpha-2 codes such
        #   as `US`.
        #
        #   @return [Array<String>, nil]
        optional :countries, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute years_of_experience_max
        #   Maximum years of professional experience.
        #
        #   @return [Integer, nil]
        optional :years_of_experience_max, Integer

        # @!attribute years_of_experience_min
        #   Minimum years of professional experience.
        #
        #   @return [Integer, nil]
        optional :years_of_experience_min, Integer

        # @!method initialize(countries: nil, years_of_experience_max: nil, years_of_experience_min: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::PersonSearchParams::Filters} for more details.
        #
        #   Constraints every result must match, in addition to `query`.
        #
        #   @param countries [Array<String>] Only return people who live in these countries, as ISO 3166-1 alpha-2 codes such
        #
        #   @param years_of_experience_max [Integer] Maximum years of professional experience.
        #
        #   @param years_of_experience_min [Integer] Minimum years of professional experience.
      end

      # `fast` matches people on basic criteria such as role, location, or background;
      # `ultra` runs a deeper search, checks every candidate against each criterion in
      # your query, and adds a `match` score. Complex `ultra` searches can take up to 30
      # seconds, so set your client timeout to match.
      module Mode
        extend ContextDev::Internal::Type::Enum

        FAST = :fast
        ULTRA = :ultra

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        ENABLED = :enabled
        DISABLED = :disabled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
