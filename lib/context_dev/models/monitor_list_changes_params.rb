# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list_changes
    class MonitorListChangesParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute monitor_id
      #
      #   @return [String]
      required :monitor_id, String

      # @!attribute cursor
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute since
      #
      #   @return [Time, nil]
      optional :since, Time

      # @!attribute tag
      #   Filter to items that have this tag.
      #
      #   @return [String, nil]
      optional :tag, String

      # @!attribute until_
      #
      #   @return [Time, nil]
      optional :until_, Time

      # @!method initialize(monitor_id:, cursor: nil, limit: nil, since: nil, tag: nil, until_: nil, request_options: {})
      #   @param monitor_id [String]
      #
      #   @param cursor [String]
      #
      #   @param limit [Integer]
      #
      #   @param since [Time]
      #
      #   @param tag [String] Filter to items that have this tag.
      #
      #   @param until_ [Time]
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
