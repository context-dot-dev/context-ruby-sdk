# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list
    class MonitorListParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute change_detection_type
      #   Filter by change detection type.
      #
      #   @return [Symbol, ContextDev::Models::MonitorListParams::ChangeDetectionType, nil]
      optional :change_detection_type, enum: -> { ContextDev::MonitorListParams::ChangeDetectionType }

      # @!attribute cursor
      #   Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Maximum number of monitors to return per page. Defaults to 25.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute q
      #   Text to search for in the fields listed in `search_by`.
      #
      #   @return [String, nil]
      optional :q, String

      # @!attribute search_by
      #   Comma-separated fields to search with `q`. Defaults to all fields. For search
      #   targets, `url` matches the target's `query`.
      #
      #   @return [Array<Symbol, ContextDev::Models::MonitorListParams::SearchBy>, nil]
      optional :search_by,
               -> { ContextDev::Internal::Type::ArrayOf[enum: ContextDev::MonitorListParams::SearchBy] },
               nil?: true

      # @!attribute search_type
      #   How `q` matches. `prefix` matches the start of words and tolerates one typo, for
      #   search as you type; `exact` matches whole words only. Defaults to `prefix`.
      #
      #   @return [Symbol, ContextDev::Models::MonitorListParams::SearchType, nil]
      optional :search_type, enum: -> { ContextDev::MonitorListParams::SearchType }

      # @!attribute status
      #   Filter by monitor status.
      #
      #   @return [Symbol, ContextDev::Models::MonitorListParams::Status, nil]
      optional :status, enum: -> { ContextDev::MonitorListParams::Status }

      # @!attribute tags
      #   Comma-separated tags. Returns monitors that have any of them.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute target_type
      #   Filter by target type.
      #
      #   @return [Symbol, ContextDev::Models::MonitorListParams::TargetType, nil]
      optional :target_type, enum: -> { ContextDev::MonitorListParams::TargetType }

      # @!method initialize(change_detection_type: nil, cursor: nil, limit: nil, q: nil, search_by: nil, search_type: nil, status: nil, tags: nil, target_type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorListParams} for more details.
      #
      #   @param change_detection_type [Symbol, ContextDev::Models::MonitorListParams::ChangeDetectionType] Filter by change detection type.
      #
      #   @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      #   @param limit [Integer] Maximum number of monitors to return per page. Defaults to 25.
      #
      #   @param q [String] Text to search for in the fields listed in `search_by`.
      #
      #   @param search_by [Array<Symbol, ContextDev::Models::MonitorListParams::SearchBy>, nil] Comma-separated fields to search with `q`. Defaults to all fields. For search ta
      #
      #   @param search_type [Symbol, ContextDev::Models::MonitorListParams::SearchType] How `q` matches. `prefix` matches the start of words and tolerates one typo, for
      #
      #   @param status [Symbol, ContextDev::Models::MonitorListParams::Status] Filter by monitor status.
      #
      #   @param tags [Array<String>, nil] Comma-separated tags. Returns monitors that have any of them.
      #
      #   @param target_type [Symbol, ContextDev::Models::MonitorListParams::TargetType] Filter by target type.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Filter by change detection type.
      module ChangeDetectionType
        extend ContextDev::Internal::Type::Enum

        EXACT = :exact
        SEMANTIC = :semantic

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      module SearchBy
        extend ContextDev::Internal::Type::Enum

        NAME = :name
        URL = :url
        INSTRUCTIONS = :instructions
        TAGS = :tags

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # How `q` matches. `prefix` matches the start of words and tolerates one typo, for
      # search as you type; `exact` matches whole words only. Defaults to `prefix`.
      module SearchType
        extend ContextDev::Internal::Type::Enum

        EXACT = :exact
        PREFIX = :prefix

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Filter by monitor status.
      module Status
        extend ContextDev::Internal::Type::Enum

        ACTIVE = :active
        PAUSED = :paused
        FAILED = :failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Filter by target type.
      module TargetType
        extend ContextDev::Internal::Type::Enum

        PAGE = :page
        SITEMAP = :sitemap
        EXTRACT = :extract
        SEARCH = :search

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
