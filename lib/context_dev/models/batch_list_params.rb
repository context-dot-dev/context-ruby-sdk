# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#list
    class BatchListParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Cursor from the previous page.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Batches per page. Defaults to 25.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute q
      #   Free-text search term, matched against the batch id, crawl source (start URL or
      #   sitemap domain), and tags.
      #
      #   @return [String, nil]
      optional :q, String

      # @!attribute search_type
      #   `prefix` for as-you-type prefix matching (default), `exact` for full-token
      #   matching.
      #
      #   @return [Symbol, ContextDev::Models::BatchListParams::SearchType, nil]
      optional :search_type, enum: -> { ContextDev::BatchListParams::SearchType }

      # @!attribute status
      #   Filter by status.
      #
      #   @return [Symbol, ContextDev::Models::BatchListParams::Status, nil]
      optional :status, enum: -> { ContextDev::BatchListParams::Status }

      # @!attribute tags
      #   Comma-separated list of tags to filter by (matches batches having any of them).
      #
      #   @return [String, nil]
      optional :tags, String

      # @!method initialize(cursor: nil, limit: nil, q: nil, search_type: nil, status: nil, tags: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchListParams} for more details.
      #
      #   @param cursor [String] Cursor from the previous page.
      #
      #   @param limit [Integer] Batches per page. Defaults to 25.
      #
      #   @param q [String] Free-text search term, matched against the batch id, crawl source (start URL or
      #
      #   @param search_type [Symbol, ContextDev::Models::BatchListParams::SearchType] `prefix` for as-you-type prefix matching (default), `exact` for full-token match
      #
      #   @param status [Symbol, ContextDev::Models::BatchListParams::Status] Filter by status.
      #
      #   @param tags [String] Comma-separated list of tags to filter by (matches batches having any of them).
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # `prefix` for as-you-type prefix matching (default), `exact` for full-token
      # matching.
      module SearchType
        extend ContextDev::Internal::Type::Enum

        EXACT = :exact
        PREFIX = :prefix

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Filter by status.
      module Status
        extend ContextDev::Internal::Type::Enum

        QUEUED = :queued
        RUNNING = :running
        CANCELLING = :cancelling
        COMPLETED = :completed
        CANCELLED = :cancelled
        FAILED = :failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
