# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list_account_runs
    class MonitorListAccountRunsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

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
      #   @return [Symbol, ContextDev::Models::MonitorListAccountRunsParams::Status, nil]
      optional :status, enum: -> { ContextDev::MonitorListAccountRunsParams::Status }

      # @!method initialize(cursor: nil, limit: nil, status: nil, request_options: {})
      #   @param cursor [String]
      #   @param limit [Integer]
      #   @param status [Symbol, ContextDev::Models::MonitorListAccountRunsParams::Status]
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
