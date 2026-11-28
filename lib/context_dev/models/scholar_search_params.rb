# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Scholar#search
    class ScholarSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute query
      #   Topic or question to search for. Append one `arxiv:`, `pmcid:`, `pmid:`, or
      #   `doi:` ID to search within that paper, such as `protein folding pmid:34265844`,
      #   or send the ID on its own.
      #
      #   @return [String]
      required :query, String

      # @!attribute cursor
      #   Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!attribute filter_by
      #   Filter by publication date.
      #
      #   @return [ContextDev::Models::ScholarSearchParams::FilterBy, nil]
      optional :filter_by, -> { ContextDev::ScholarSearchParams::FilterBy }, api_name: :filterBy

      # @!attribute limit
      #   Maximum number of papers to return per page.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute sort
      #   `relevance` puts the closest matches first; `date_desc` puts the newest papers
      #   first, with undated papers last. Both orders apply to the top 250 matches.
      #
      #   @return [Symbol, ContextDev::Models::ScholarSearchParams::Sort, nil]
      optional :sort, enum: -> { ContextDev::ScholarSearchParams::Sort }

      # @!attribute tags
      #   Labels for this request. Filter usage and request logs by them in the dashboard
      #   or with `GET /org/logs`.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!method initialize(query:, cursor: nil, filter_by: nil, limit: nil, sort: nil, tags: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::ScholarSearchParams} for more details.
      #
      #   @param query [String] Topic or question to search for. Append one `arxiv:`, `pmcid:`, `pmid:`, or `doi
      #
      #   @param cursor [String, nil] Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      #   @param filter_by [ContextDev::Models::ScholarSearchParams::FilterBy] Filter by publication date.
      #
      #   @param limit [Integer] Maximum number of papers to return per page.
      #
      #   @param sort [Symbol, ContextDev::Models::ScholarSearchParams::Sort] `relevance` puts the closest matches first; `date_desc` puts the newest papers f
      #
      #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
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

      # `relevance` puts the closest matches first; `date_desc` puts the newest papers
      # first, with undated papers last. Both orders apply to the top 250 matches.
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
