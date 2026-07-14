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
      #   Opaque pagination cursor from a previous response.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Maximum number of items to return per page (1-100). Defaults to 25.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

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

      # @!attribute until_
      #   Only include items before this ISO 8601 timestamp.
      #
      #   @return [Time, nil]
      optional :until_, Time

      # @!method initialize(monitor_id:, cursor: nil, limit: nil, since: nil, tag: nil, until_: nil, request_options: {})
      #   @param monitor_id [String]
      #
      #   @param cursor [String] Opaque pagination cursor from a previous response.
      #
      #   @param limit [Integer] Maximum number of items to return per page (1-100). Defaults to 25.
      #
      #   @param since [Time] Only include items at or after this ISO 8601 timestamp.
      #
      #   @param tag [String] Filter to items that have this tag.
      #
      #   @param until_ [Time] Only include items before this ISO 8601 timestamp.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
