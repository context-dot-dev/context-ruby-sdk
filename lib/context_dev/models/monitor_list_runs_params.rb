# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list_runs
    class MonitorListRunsParams < ContextDev::Internal::Type::BaseModel
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

      # @!attribute status
      #   Lifecycle status of a run. `skipped` runs never executed — see `skip_reason`
      #   (insufficient credits, monitor paused, or superseded by a concurrent run).
      #
      #   @return [Symbol, ContextDev::Models::MonitorListRunsParams::Status, nil]
      optional :status, enum: -> { ContextDev::MonitorListRunsParams::Status }

      # @!method initialize(monitor_id:, cursor: nil, limit: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorListRunsParams} for more details.
      #
      #   @param monitor_id [String]
      #
      #   @param cursor [String]
      #
      #   @param limit [Integer]
      #
      #   @param status [Symbol, ContextDev::Models::MonitorListRunsParams::Status] Lifecycle status of a run. `skipped` runs never executed — see `skip_reason` (in
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Lifecycle status of a run. `skipped` runs never executed — see `skip_reason`
      # (insufficient credits, monitor paused, or superseded by a concurrent run).
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
