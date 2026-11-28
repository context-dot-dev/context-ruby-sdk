# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list_account_changes
    class MonitorListAccountChangesParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute change_detection_type
      #   Filter by change detection type.
      #
      #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesParams::ChangeDetectionType, nil]
      optional :change_detection_type,
               enum: -> { ContextDev::MonitorListAccountChangesParams::ChangeDetectionType }

      # @!attribute cursor
      #   Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Maximum number of changes to return per page. Defaults to 25.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute monitor_id
      #   Return only changes from this monitor.
      #
      #   @return [String, nil]
      optional :monitor_id, String

      # @!attribute since
      #   Return only changes detected at or after this time.
      #
      #   @return [Time, nil]
      optional :since, Time

      # @!attribute tag
      #   Return only changes that have this tag.
      #
      #   @return [String, nil]
      optional :tag, String

      # @!attribute target_type
      #   Filter by target type.
      #
      #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesParams::TargetType, nil]
      optional :target_type, enum: -> { ContextDev::MonitorListAccountChangesParams::TargetType }

      # @!attribute until_
      #   Return only changes detected at or before this time.
      #
      #   @return [Time, nil]
      optional :until_, Time

      # @!method initialize(change_detection_type: nil, cursor: nil, limit: nil, monitor_id: nil, since: nil, tag: nil, target_type: nil, until_: nil, request_options: {})
      #   @param change_detection_type [Symbol, ContextDev::Models::MonitorListAccountChangesParams::ChangeDetectionType] Filter by change detection type.
      #
      #   @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      #   @param limit [Integer] Maximum number of changes to return per page. Defaults to 25.
      #
      #   @param monitor_id [String] Return only changes from this monitor.
      #
      #   @param since [Time] Return only changes detected at or after this time.
      #
      #   @param tag [String] Return only changes that have this tag.
      #
      #   @param target_type [Symbol, ContextDev::Models::MonitorListAccountChangesParams::TargetType] Filter by target type.
      #
      #   @param until_ [Time] Return only changes detected at or before this time.
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
