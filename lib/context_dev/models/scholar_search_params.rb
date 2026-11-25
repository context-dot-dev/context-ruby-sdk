# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Scholar#search
    class ScholarSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute query
      #   A topic or question. Append one arxiv:, pmcid:, pmid:, or doi: ID to search
      #   within an indexed paper.
      #
      #   @return [String]
      required :query, String

      # @!attribute cursor
      #   Use next_cursor to fetch the next page.
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!attribute filter_by
      #   Filter by publication date.
      #
      #   @return [ContextDev::Models::ScholarSearchParams::FilterBy, nil]
      optional :filter_by, -> { ContextDev::ScholarSearchParams::FilterBy }, api_name: :filterBy

      # @!attribute limit
      #   Papers per page.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute sort
      #   Order the top 250 matches. date_desc puts newest first, with undated papers
      #   last.
      #
      #   @return [Symbol, ContextDev::Models::ScholarSearchParams::Sort, nil]
      optional :sort, enum: -> { ContextDev::ScholarSearchParams::Sort }

      # @!attribute tags
      #   Labels for filtering usage in the dashboard.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!method initialize(query:, cursor: nil, filter_by: nil, limit: nil, sort: nil, tags: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::ScholarSearchParams} for more details.
      #
      #   @param query [String] A topic or question. Append one arxiv:, pmcid:, pmid:, or doi: ID to search with
      #
      #   @param cursor [String, nil] Use next_cursor to fetch the next page.
      #
      #   @param filter_by [ContextDev::Models::ScholarSearchParams::FilterBy] Filter by publication date.
      #
      #   @param limit [Integer] Papers per page.
      #
      #   @param sort [Symbol, ContextDev::Models::ScholarSearchParams::Sort] Order the top 250 matches. date_desc puts newest first, with undated papers last
      #
      #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      class FilterBy < ContextDev::Internal::Type::BaseModel
        # @!attribute date
        #   Publication date range. Undated papers are excluded.
        #
        #   @return [ContextDev::Models::ScholarSearchParams::FilterBy::Date, nil]
        optional :date, -> { ContextDev::ScholarSearchParams::FilterBy::Date }

        # @!method initialize(date: nil)
        #   Filter by publication date.
        #
        #   @param date [ContextDev::Models::ScholarSearchParams::FilterBy::Date] Publication date range. Undated papers are excluded.

        # @see ContextDev::Models::ScholarSearchParams::FilterBy#date
        class Date < ContextDev::Internal::Type::BaseModel
          # @!attribute from
          #   Inclusive start date, in Unix milliseconds.
          #
          #   @return [Integer, nil]
          optional :from, Integer

          # @!attribute to
          #   Inclusive end date, in Unix milliseconds.
          #
          #   @return [Integer, nil]
          optional :to, Integer

          # @!method initialize(from: nil, to: nil)
          #   Publication date range. Undated papers are excluded.
          #
          #   @param from [Integer] Inclusive start date, in Unix milliseconds.
          #
          #   @param to [Integer] Inclusive end date, in Unix milliseconds.
        end
      end

      # Order the top 250 matches. date_desc puts newest first, with undated papers
      # last.
      module Sort
        extend ContextDev::Internal::Type::Enum

        RELEVANCE = :relevance
        DATE_DESC = :date_desc

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
