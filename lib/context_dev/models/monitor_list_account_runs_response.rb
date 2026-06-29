# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list_account_runs
    class MonitorListAccountRunsResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Array<ContextDev::Models::MonitorListAccountRunsResponse::Data>]
      required :data,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorListAccountRunsResponse::Data] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      required :next_cursor, String, nil?: true

      # @!method initialize(data:, has_more:, next_cursor:)
      #   @param data [Array<ContextDev::Models::MonitorListAccountRunsResponse::Data>]
      #   @param has_more [Boolean]
      #   @param next_cursor [String, nil]

      class Data < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute baseline_created
        #   True when this run established the monitor's initial baseline; baseline runs
        #   perform no change detection.
        #
        #   @return [Boolean]
        required :baseline_created, ContextDev::Internal::Type::Boolean

        # @!attribute change_detected
        #
        #   @return [Boolean]
        required :change_detected, ContextDev::Internal::Type::Boolean

        # @!attribute change_detection_type
        #
        #   @return [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::ChangeDetectionType]
        required :change_detection_type,
                 enum: -> { ContextDev::Models::MonitorListAccountRunsResponse::Data::ChangeDetectionType }

        # @!attribute monitor_id
        #
        #   @return [String]
        required :monitor_id, String

        # @!attribute run_type
        #   The first run after monitor creation is a baseline run.
        #
        #   @return [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::RunType]
        required :run_type, enum: -> { ContextDev::Models::MonitorListAccountRunsResponse::Data::RunType }

        # @!attribute status
        #
        #   @return [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::Status]
        required :status, enum: -> { ContextDev::Models::MonitorListAccountRunsResponse::Data::Status }

        # @!attribute target_type
        #
        #   @return [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::TargetType]
        required :target_type, enum: -> { ContextDev::Models::MonitorListAccountRunsResponse::Data::TargetType }

        # @!attribute change_id
        #
        #   @return [String, nil]
        optional :change_id, String, nil?: true

        # @!attribute completed_at
        #
        #   @return [Time, nil]
        optional :completed_at, Time, nil?: true

        # @!attribute error
        #
        #   @return [ContextDev::Models::MonitorListAccountRunsResponse::Data::Error, nil]
        optional :error, -> { ContextDev::Models::MonitorListAccountRunsResponse::Data::Error }, nil?: true

        # @!attribute started_at
        #
        #   @return [Time, nil]
        optional :started_at, Time, nil?: true

        # @!method initialize(id:, baseline_created:, change_detected:, change_detection_type:, monitor_id:, run_type:, status:, target_type:, change_id: nil, completed_at: nil, error: nil, started_at: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorListAccountRunsResponse::Data} for more details.
        #
        #   @param id [String]
        #
        #   @param baseline_created [Boolean] True when this run established the monitor's initial baseline; baseline runs per
        #
        #   @param change_detected [Boolean]
        #
        #   @param change_detection_type [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::ChangeDetectionType]
        #
        #   @param monitor_id [String]
        #
        #   @param run_type [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::RunType] The first run after monitor creation is a baseline run.
        #
        #   @param status [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::Status]
        #
        #   @param target_type [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::TargetType]
        #
        #   @param change_id [String, nil]
        #
        #   @param completed_at [Time, nil]
        #
        #   @param error [ContextDev::Models::MonitorListAccountRunsResponse::Data::Error, nil]
        #
        #   @param started_at [Time, nil]

        # @see ContextDev::Models::MonitorListAccountRunsResponse::Data#change_detection_type
        module ChangeDetectionType
          extend ContextDev::Internal::Type::Enum

          EXACT = :exact
          SEMANTIC = :semantic

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The first run after monitor creation is a baseline run.
        #
        # @see ContextDev::Models::MonitorListAccountRunsResponse::Data#run_type
        module RunType
          extend ContextDev::Internal::Type::Enum

          BASELINE = :baseline
          SCHEDULED = :scheduled

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::MonitorListAccountRunsResponse::Data#status
        module Status
          extend ContextDev::Internal::Type::Enum

          QUEUED = :queued
          RUNNING = :running
          COMPLETED = :completed
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::MonitorListAccountRunsResponse::Data#target_type
        module TargetType
          extend ContextDev::Internal::Type::Enum

          PAGE = :page
          SITEMAP = :sitemap
          EXTRACT = :extract

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::MonitorListAccountRunsResponse::Data#error
        class Error < ContextDev::Internal::Type::BaseModel
          # @!attribute code
          #
          #   @return [String]
          required :code, String

          # @!attribute message
          #
          #   @return [String]
          required :message, String

          # @!method initialize(code:, message:)
          #   @param code [String]
          #   @param message [String]
        end
      end
    end
  end
end
