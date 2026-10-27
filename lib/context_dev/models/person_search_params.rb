# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::People#search
    class PersonSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute query
      #   Describe the people to find. Up to 500 characters in `fast` mode and 5000 in
      #   `ultra` mode.
      #
      #   @return [String]
      required :query, String

      # @!attribute cursor
      #   Use next_cursor with the same query, mode and filters to fetch the next page.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute filters
      #   Additional constraints every result must match.
      #
      #   @return [ContextDev::Models::PersonSearchParams::Filters, nil]
      optional :filters, -> { ContextDev::PersonSearchParams::Filters }

      # @!attribute mode
      #   `fast` matches people on basic criteria (e.g. their role, location or
      #   background); `ultra` plans a deeper search, judges each candidate against every
      #   criterion in the query and explains each match.
      #
      #   @return [Symbol, ContextDev::Models::PersonSearchParams::Mode, nil]
      optional :mode, enum: -> { ContextDev::PersonSearchParams::Mode }

      # @!attribute tags
      #   Labels for filtering usage in the dashboard.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!method initialize(query:, cursor: nil, filters: nil, mode: nil, tags: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::PersonSearchParams} for more details.
      #
      #   @param query [String] Describe the people to find. Up to 500 characters in `fast` mode and 5000 in `ul
      #
      #   @param cursor [String] Use next_cursor with the same query, mode and filters to fetch the next page.
      #
      #   @param filters [ContextDev::Models::PersonSearchParams::Filters] Additional constraints every result must match.
      #
      #   @param mode [Symbol, ContextDev::Models::PersonSearchParams::Mode] `fast` matches people on basic criteria (e.g. their role, location or background
      #
      #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      class Filters < ContextDev::Internal::Type::BaseModel
        # @!attribute countries
        #   Countries people live in as two-letter codes, such as US or GB.
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
        #   Additional constraints every result must match.
        #
        #   @param countries [Array<String>] Countries people live in as two-letter codes, such as US or GB.
        #
        #   @param years_of_experience_max [Integer] Maximum years of professional experience.
        #
        #   @param years_of_experience_min [Integer] Minimum years of professional experience.
      end

      # `fast` matches people on basic criteria (e.g. their role, location or
      # background); `ultra` plans a deeper search, judges each candidate against every
      # criterion in the query and explains each match.
      module Mode
        extend ContextDev::Internal::Type::Enum

        FAST = :fast
        ULTRA = :ultra

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
