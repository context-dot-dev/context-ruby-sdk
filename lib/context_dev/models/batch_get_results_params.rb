# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#get_results
    class BatchGetResultsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute batch_id
      #   ID of the batch to retrieve or cancel.
      #
      #   @return [String]
      required :batch_id, String

      # @!attribute cursor
      #   next_cursor from the previous page.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Records per page. Defaults to 25. A page can close early so its payload stays
      #   under ~8 MB; rely on next_cursor rather than counting records.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute tags
      #   Optional comma-separated caller-defined tags for tracking this request. Tags are
      #   recorded on the request's usage log and can be used to filter usage on the
      #   dashboard usage page. Up to 20 tags, each 1-50 characters.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!method initialize(batch_id:, cursor: nil, limit: nil, tags: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchGetResultsParams} for more details.
      #
      #   @param batch_id [String] ID of the batch to retrieve or cancel.
      #
      #   @param cursor [String] next_cursor from the previous page.
      #
      #   @param limit [Integer] Records per page. Defaults to 25. A page can close early so its payload stays un
      #
      #   @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
