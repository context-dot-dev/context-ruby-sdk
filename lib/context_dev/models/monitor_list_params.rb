# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list
    class MonitorListParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute change_detection_type
      #
      #   @return [Symbol, ContextDev::Models::MonitorListParams::ChangeDetectionType, nil]
      optional :change_detection_type, enum: -> { ContextDev::MonitorListParams::ChangeDetectionType }

      # @!attribute cursor
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute q
      #   Free-text search term, matched against the fields named in `search_by`.
      #
      #   @return [String, nil]
      optional :q, String

      # @!attribute search_by
      #   Comma-separated fields to search with `q`. Defaults to all of them. Note `query`
      #   only exists on semantic monitors.
      #
      #   @return [Array<Symbol, ContextDev::Models::MonitorListParams::SearchBy>, nil]
      optional :search_by,
               -> { ContextDev::Internal::Type::ArrayOf[enum: ContextDev::MonitorListParams::SearchBy] }

      # @!attribute search_type
      #   `prefix` for as-you-type prefix matching (default), `exact` for full-token
      #   matching.
      #
      #   @return [Symbol, ContextDev::Models::MonitorListParams::SearchType, nil]
      optional :search_type, enum: -> { ContextDev::MonitorListParams::SearchType }

      # @!attribute status
      #
      #   @return [Symbol, ContextDev::Models::MonitorListParams::Status, nil]
      optional :status, enum: -> { ContextDev::MonitorListParams::Status }

      # @!attribute tag
      #   Filter to items that have this tag.
      #
      #   @return [String, nil]
      optional :tag, String

      # @!attribute tags
      #   Comma-separated list of tags to filter by (matches monitors having any of them).
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute target_type
      #
      #   @return [Symbol, ContextDev::Models::MonitorListParams::TargetType, nil]
      optional :target_type, enum: -> { ContextDev::MonitorListParams::TargetType }

      # @!method initialize(change_detection_type: nil, cursor: nil, limit: nil, q: nil, search_by: nil, search_type: nil, status: nil, tag: nil, tags: nil, target_type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorListParams} for more details.
      #
      #   @param change_detection_type [Symbol, ContextDev::Models::MonitorListParams::ChangeDetectionType]
      #
      #   @param cursor [String]
      #
      #   @param limit [Integer]
      #
      #   @param q [String] Free-text search term, matched against the fields named in `search_by`.
      #
      #   @param search_by [Array<Symbol, ContextDev::Models::MonitorListParams::SearchBy>] Comma-separated fields to search with `q`. Defaults to all of them. Note `query`
      #
      #   @param search_type [Symbol, ContextDev::Models::MonitorListParams::SearchType] `prefix` for as-you-type prefix matching (default), `exact` for full-token match
      #
      #   @param status [Symbol, ContextDev::Models::MonitorListParams::Status]
      #
      #   @param tag [String] Filter to items that have this tag.
      #
      #   @param tags [Array<String>] Comma-separated list of tags to filter by (matches monitors having any of them).
      #
      #   @param target_type [Symbol, ContextDev::Models::MonitorListParams::TargetType]
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

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
        QUERY = :query
        TAGS = :tags

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # `prefix` for as-you-type prefix matching (default), `exact` for full-token
      # matching.
      module SearchType
        extend ContextDev::Internal::Type::Enum

        EXACT = :exact
        PREFIX = :prefix

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      module Status
        extend ContextDev::Internal::Type::Enum

        ACTIVE = :active
        PAUSED = :paused
        FAILED = :failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      module TargetType
        extend ContextDev::Internal::Type::Enum

        PAGE = :page
        SITEMAP = :sitemap
        EXTRACT = :extract

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
