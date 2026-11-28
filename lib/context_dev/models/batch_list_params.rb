# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#list
    class BatchListParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Maximum number of batches to return per page.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute q
      #   Search term matched against batch IDs, crawl sources (start URL or sitemap
      #   domain), and tags.
      #
      #   @return [String, nil]
      optional :q, String

      # @!attribute search_type
      #   How `q` matches: `prefix` matches the start of a term, for search-as-you-type,
      #   and `exact` matches whole terms. Defaults to `prefix`.
      #
      #   @return [Symbol, ContextDev::Models::BatchListParams::SearchType, nil]
      optional :search_type, enum: -> { ContextDev::BatchListParams::SearchType }

      # @!attribute status
      #   Filter by batch status.
      #
      #   @return [Symbol, ContextDev::Models::BatchListParams::Status, nil]
      optional :status, enum: -> { ContextDev::BatchListParams::Status }

      # @!attribute tags
      #   Comma-separated tags. Returns batches that have any of them. You can also repeat
      #   the `tags` parameter.
      #
      #   @return [String, Array<String>, nil]
      optional :tags, union: -> { ContextDev::BatchListParams::Tags }

      # @!method initialize(cursor: nil, limit: nil, q: nil, search_type: nil, status: nil, tags: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchListParams} for more details.
      #
      #   @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      #   @param limit [Integer] Maximum number of batches to return per page.
      #
      #   @param q [String] Search term matched against batch IDs, crawl sources (start URL or sitemap domai
      #
      #   @param search_type [Symbol, ContextDev::Models::BatchListParams::SearchType] How `q` matches: `prefix` matches the start of a term, for search-as-you-type, a
      #
      #   @param status [Symbol, ContextDev::Models::BatchListParams::Status] Filter by batch status.
      #
      #   @param tags [String, Array<String>] Comma-separated tags. Returns batches that have any of them. You can also repeat
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # How `q` matches: `prefix` matches the start of a term, for search-as-you-type,
      # and `exact` matches whole terms. Defaults to `prefix`.
      module SearchType
        extend ContextDev::Internal::Type::Enum

        EXACT = :exact
        PREFIX = :prefix

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Filter by batch status.
      module Status
        extend ContextDev::Internal::Type::Enum

        PENDING = :pending
        QUEUED = :queued
        RUNNING = :running
        CANCELLING = :cancelling
        COMPLETED = :completed
        CANCELLED = :cancelled
        FAILED = :failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Comma-separated tags. Returns batches that have any of them. You can also repeat
      # the `tags` parameter.
      module Tags
        extend ContextDev::Internal::Type::Union

        variant String

        variant -> { ContextDev::Models::BatchListParams::Tags::StringArray }

        # @!method self.variants
        #   @return [Array(String, Array<String>)]

        # @type [ContextDev::Internal::Type::Converter]
        StringArray = ContextDev::Internal::Type::ArrayOf[String]
      end
    end
  end
end
