# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list_account_runs
    class MonitorListAccountRunsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Maximum number of runs to return per page. Defaults to 25.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute status
      #   Filter by run status.
      #
      #   @return [Symbol, ContextDev::Models::MonitorListAccountRunsParams::Status, nil]
      optional :status, enum: -> { ContextDev::MonitorListAccountRunsParams::Status }

      # @!method initialize(cursor: nil, limit: nil, status: nil, request_options: {})
      #   @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      #   @param limit [Integer] Maximum number of runs to return per page. Defaults to 25.
      #
      #   @param status [Symbol, ContextDev::Models::MonitorListAccountRunsParams::Status] Filter by run status.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Filter by run status.
      module Status
        extend ContextDev::Internal::Type::Enum

        QUEUED = :queued
        RUNNING = :running
        COMPLETED = :completed
        FAILED = :failed
        SKIPPED = :skipped

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
