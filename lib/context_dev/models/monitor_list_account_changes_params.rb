# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list_account_changes
    class MonitorListAccountChangesParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute change_detection_type
      #
      #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesParams::ChangeDetectionType, nil]
      optional :change_detection_type,
               enum: -> { ContextDev::MonitorListAccountChangesParams::ChangeDetectionType }

      # @!attribute cursor
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute monitor_id
      #
      #   @return [String, nil]
      optional :monitor_id, String

      # @!attribute since
      #
      #   @return [Time, nil]
      optional :since, Time

      # @!attribute tag
      #   Filter to items that have this tag.
      #
      #   @return [String, nil]
      optional :tag, String

      # @!attribute target_type
      #
      #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesParams::TargetType, nil]
      optional :target_type, enum: -> { ContextDev::MonitorListAccountChangesParams::TargetType }

      # @!attribute until_
      #
      #   @return [Time, nil]
      optional :until_, Time

      # @!method initialize(change_detection_type: nil, cursor: nil, limit: nil, monitor_id: nil, since: nil, tag: nil, target_type: nil, until_: nil, request_options: {})
      #   @param change_detection_type [Symbol, ContextDev::Models::MonitorListAccountChangesParams::ChangeDetectionType]
      #
      #   @param cursor [String]
      #
      #   @param limit [Integer]
      #
      #   @param monitor_id [String]
      #
      #   @param since [Time]
      #
      #   @param tag [String] Filter to items that have this tag.
      #
      #   @param target_type [Symbol, ContextDev::Models::MonitorListAccountChangesParams::TargetType]
      #
      #   @param until_ [Time]
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      module ChangeDetectionType
        extend ContextDev::Internal::Type::Enum

        EXACT = :exact
        SEMANTIC = :semantic

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
