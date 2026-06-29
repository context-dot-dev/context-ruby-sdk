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
      #
      #   @return [Symbol, ContextDev::Models::MonitorListRunsParams::Status, nil]
      optional :status, enum: -> { ContextDev::MonitorListRunsParams::Status }

      # @!method initialize(monitor_id:, cursor: nil, limit: nil, status: nil, request_options: {})
      #   @param monitor_id [String]
      #   @param cursor [String]
      #   @param limit [Integer]
      #   @param status [Symbol, ContextDev::Models::MonitorListRunsParams::Status]
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      module Status
        extend ContextDev::Internal::Type::Enum

        QUEUED = :queued
        RUNNING = :running
        COMPLETED = :completed
        FAILED = :failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
