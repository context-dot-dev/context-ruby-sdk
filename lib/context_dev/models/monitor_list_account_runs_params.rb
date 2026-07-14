# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list_account_runs
    class MonitorListAccountRunsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

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

      # @!attribute status
      #   Filter runs by lifecycle status.
      #
      #   @return [Symbol, ContextDev::Models::MonitorListAccountRunsParams::Status, nil]
      optional :status, enum: -> { ContextDev::MonitorListAccountRunsParams::Status }

      # @!method initialize(cursor: nil, limit: nil, status: nil, request_options: {})
      #   @param cursor [String] Opaque pagination cursor from a previous response.
      #
      #   @param limit [Integer] Maximum number of items to return per page (1-100). Defaults to 25.
      #
      #   @param status [Symbol, ContextDev::Models::MonitorListAccountRunsParams::Status] Filter runs by lifecycle status.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Filter runs by lifecycle status.
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
