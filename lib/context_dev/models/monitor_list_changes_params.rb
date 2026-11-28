# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list_changes
    class MonitorListChangesParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute monitor_id
      #   ID of the monitor.
      #
      #   @return [String]
      required :monitor_id, String

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

      # @!attribute until_
      #   Return only changes detected at or before this time.
      #
      #   @return [Time, nil]
      optional :until_, Time

      # @!method initialize(monitor_id:, cursor: nil, limit: nil, since: nil, tag: nil, until_: nil, request_options: {})
      #   @param monitor_id [String] ID of the monitor.
      #
      #   @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      #   @param limit [Integer] Maximum number of changes to return per page. Defaults to 25.
      #
      #   @param since [Time] Return only changes detected at or after this time.
      #
      #   @param tag [String] Return only changes that have this tag.
      #
      #   @param until_ [Time] Return only changes detected at or before this time.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
