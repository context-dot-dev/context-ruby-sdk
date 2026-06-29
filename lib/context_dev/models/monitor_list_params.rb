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

      # @!attribute status
      #
      #   @return [Symbol, ContextDev::Models::MonitorListParams::Status, nil]
      optional :status, enum: -> { ContextDev::MonitorListParams::Status }

      # @!attribute tag
      #   Filter to items that have this tag.
      #
      #   @return [String, nil]
      optional :tag, String

      # @!attribute target_type
      #
      #   @return [Symbol, ContextDev::Models::MonitorListParams::TargetType, nil]
      optional :target_type, enum: -> { ContextDev::MonitorListParams::TargetType }

      # @!method initialize(change_detection_type: nil, cursor: nil, limit: nil, status: nil, tag: nil, target_type: nil, request_options: {})
      #   @param change_detection_type [Symbol, ContextDev::Models::MonitorListParams::ChangeDetectionType]
      #
      #   @param cursor [String]
      #
      #   @param limit [Integer]
      #
      #   @param status [Symbol, ContextDev::Models::MonitorListParams::Status]
      #
      #   @param tag [String] Filter to items that have this tag.
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
