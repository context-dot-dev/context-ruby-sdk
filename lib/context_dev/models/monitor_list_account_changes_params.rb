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
      #   Opaque pagination cursor from a previous response.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Maximum number of items to return per page (1-100). Defaults to 25.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute monitor_id
      #   Filter changes to a single monitor.
      #
      #   @return [String, nil]
      optional :monitor_id, String

      # @!attribute since
      #   Only include items at or after this ISO 8601 timestamp.
      #
      #   @return [Time, nil]
      optional :since, Time

      # @!attribute tag
      #   Filter to items that have this tag.
      #
      #   @return [String, nil]
      optional :tag, String

      # @!attribute target_type
      #   Filter by target type.
      #
      #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesParams::TargetType, nil]
      optional :target_type, enum: -> { ContextDev::MonitorListAccountChangesParams::TargetType }

      # @!attribute until_
      #   Only include items before this ISO 8601 timestamp.
      #
      #   @return [Time, nil]
      optional :until_, Time

      # @!method initialize(change_detection_type: nil, cursor: nil, limit: nil, monitor_id: nil, since: nil, tag: nil, target_type: nil, until_: nil, request_options: {})
      #   @param change_detection_type [Symbol, ContextDev::Models::MonitorListAccountChangesParams::ChangeDetectionType] Filter by change detection type.
      #
      #   @param cursor [String] Opaque pagination cursor from a previous response.
      #
      #   @param limit [Integer] Maximum number of items to return per page (1-100). Defaults to 25.
      #
      #   @param monitor_id [String] Filter changes to a single monitor.
      #
      #   @param since [Time] Only include items at or after this ISO 8601 timestamp.
      #
      #   @param tag [String] Filter to items that have this tag.
      #
      #   @param target_type [Symbol, ContextDev::Models::MonitorListAccountChangesParams::TargetType] Filter by target type.
      #
      #   @param until_ [Time] Only include items before this ISO 8601 timestamp.
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

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
