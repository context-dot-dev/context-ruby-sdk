# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#get_results
    class BatchGetResultsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute batch_id
      #   ID of the batch.
      #
      #   @return [String]
      required :batch_id, String

      # @!attribute cursor
      #   Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Maximum number of results to return per page. A page can hold fewer to stay
      #   under about 8 MB, so page with `next_cursor` instead of counting records.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(batch_id:, cursor: nil, limit: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchGetResultsParams} for more details.
      #
      #   @param batch_id [String] ID of the batch.
      #
      #   @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      #   @param limit [Integer] Maximum number of results to return per page. A page can hold fewer to stay unde
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
