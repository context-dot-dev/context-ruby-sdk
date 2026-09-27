# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list_runs
    class MonitorListRunsResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Array<ContextDev::Models::MonitorListRunsResponse::Data>]
      required :data,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorListRunsResponse::Data] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      required :next_cursor, String, nil?: true

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::MonitorListRunsResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::MonitorListRunsResponse::KeyMetadata }

      # @!method initialize(data:, has_more:, next_cursor:, request_id:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorListRunsResponse} for more details.
      #
      #   @param data [Array<ContextDev::Models::MonitorListRunsResponse::Data>]
      #
      #   @param has_more [Boolean]
      #
      #   @param next_cursor [String, nil]
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param key_metadata [ContextDev::Models::MonitorListRunsResponse::KeyMetadata] Credits this request used and your remaining balance.

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
        #   @return [Symbol, ContextDev::Models::MonitorListRunsResponse::Data::ChangeDetectionType]
        required :change_detection_type,
                 enum: -> { ContextDev::Models::MonitorListRunsResponse::Data::ChangeDetectionType }

        # @!attribute credits_charged
        #   Credits charged for this run (0 for skipped/failed runs).
        #
        #   @return [Integer]
        required :credits_charged, Integer

        # @!attribute monitor_id
        #
        #   @return [String]
        required :monitor_id, String

        # @!attribute run_type
        #   A baseline run follows creation or a target or detection change.
        #
        #   @return [Symbol, ContextDev::Models::MonitorListRunsResponse::Data::RunType]
        required :run_type, enum: -> { ContextDev::Models::MonitorListRunsResponse::Data::RunType }

        # @!attribute status
        #   Lifecycle status of a run. `skipped` runs never executed — see `skip_reason`
        #   (insufficient credits, monitor paused, or superseded by a concurrent run).
        #
        #   @return [Symbol, ContextDev::Models::MonitorListRunsResponse::Data::Status]
        required :status, enum: -> { ContextDev::Models::MonitorListRunsResponse::Data::Status }

        # @!attribute target_type
        #
        #   @return [Symbol, ContextDev::Models::MonitorListRunsResponse::Data::TargetType]
        required :target_type, enum: -> { ContextDev::Models::MonitorListRunsResponse::Data::TargetType }

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
        #   @return [ContextDev::Models::MonitorListRunsResponse::Data::Error, nil]
        optional :error, -> { ContextDev::Models::MonitorListRunsResponse::Data::Error }, nil?: true

        # @!attribute skip_reason
        #   Why a skipped run never executed; null unless status is `skipped`.
        #
        #   @return [Symbol, ContextDev::Models::MonitorListRunsResponse::Data::SkipReason, nil]
        optional :skip_reason,
                 enum: -> { ContextDev::Models::MonitorListRunsResponse::Data::SkipReason },
                 nil?: true

        # @!attribute started_at
        #
        #   @return [Time, nil]
        optional :started_at, Time, nil?: true

        # @!attribute webhook_deliveries
        #   All webhook deliveries attempted by this run — one per subscribed event that
        #   fired. Omitted when no webhook was attempted, including runs created before
        #   event selection was added.
        #
        #   @return [Array<ContextDev::Models::WebhookDelivery>, nil]
        optional :webhook_deliveries, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::WebhookDelivery] }

        # @!attribute webhook_delivery
        #   @deprecated
        #
        #   Deprecated. Use `webhook_deliveries` for all attempts.
        #
        #   @return [ContextDev::Models::WebhookDelivery, nil]
        optional :webhook_delivery, -> { ContextDev::WebhookDelivery }

        # @!attribute webhook_delivery_ids
        #   Webhook delivery IDs for this run.
        #
        #   @return [Array<String>, nil]
        optional :webhook_delivery_ids, ContextDev::Internal::Type::ArrayOf[String]

        # @!method initialize(id:, baseline_created:, change_detected:, change_detection_type:, credits_charged:, monitor_id:, run_type:, status:, target_type:, change_id: nil, completed_at: nil, error: nil, skip_reason: nil, started_at: nil, webhook_deliveries: nil, webhook_delivery: nil, webhook_delivery_ids: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorListRunsResponse::Data} for more details.
        #
        #   @param id [String]
        #
        #   @param baseline_created [Boolean] True when this run established the monitor's initial baseline; baseline runs per
        #
        #   @param change_detected [Boolean]
        #
        #   @param change_detection_type [Symbol, ContextDev::Models::MonitorListRunsResponse::Data::ChangeDetectionType]
        #
        #   @param credits_charged [Integer] Credits charged for this run (0 for skipped/failed runs).
        #
        #   @param monitor_id [String]
        #
        #   @param run_type [Symbol, ContextDev::Models::MonitorListRunsResponse::Data::RunType] A baseline run follows creation or a target or detection change.
        #
        #   @param status [Symbol, ContextDev::Models::MonitorListRunsResponse::Data::Status] Lifecycle status of a run. `skipped` runs never executed — see `skip_reason` (in
        #
        #   @param target_type [Symbol, ContextDev::Models::MonitorListRunsResponse::Data::TargetType]
        #
        #   @param change_id [String, nil]
        #
        #   @param completed_at [Time, nil]
        #
        #   @param error [ContextDev::Models::MonitorListRunsResponse::Data::Error, nil]
        #
        #   @param skip_reason [Symbol, ContextDev::Models::MonitorListRunsResponse::Data::SkipReason, nil] Why a skipped run never executed; null unless status is `skipped`.
        #
        #   @param started_at [Time, nil]
        #
        #   @param webhook_deliveries [Array<ContextDev::Models::WebhookDelivery>] All webhook deliveries attempted by this run — one per subscribed event that fir
        #
        #   @param webhook_delivery [ContextDev::Models::WebhookDelivery] Deprecated. Use `webhook_deliveries` for all attempts.
        #
        #   @param webhook_delivery_ids [Array<String>] Webhook delivery IDs for this run.

        # @see ContextDev::Models::MonitorListRunsResponse::Data#change_detection_type
        module ChangeDetectionType
          extend ContextDev::Internal::Type::Enum

          EXACT = :exact
          SEMANTIC = :semantic

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # A baseline run follows creation or a target or detection change.
        #
        # @see ContextDev::Models::MonitorListRunsResponse::Data#run_type
        module RunType
          extend ContextDev::Internal::Type::Enum

          BASELINE = :baseline
          SCHEDULED = :scheduled

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Lifecycle status of a run. `skipped` runs never executed — see `skip_reason`
        # (insufficient credits, monitor paused, or superseded by a concurrent run).
        #
        # @see ContextDev::Models::MonitorListRunsResponse::Data#status
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

        # @see ContextDev::Models::MonitorListRunsResponse::Data#target_type
        module TargetType
          extend ContextDev::Internal::Type::Enum

          PAGE = :page
          SITEMAP = :sitemap
          EXTRACT = :extract

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::MonitorListRunsResponse::Data#error
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

        # Why a skipped run never executed; null unless status is `skipped`.
        #
        # @see ContextDev::Models::MonitorListRunsResponse::Data#skip_reason
        module SkipReason
          extend ContextDev::Internal::Type::Enum

          INSUFFICIENT_CREDITS = :insufficient_credits
          MONITOR_PAUSED = :monitor_paused
          SUPERSEDED = :superseded

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::MonitorListRunsResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits remaining for your organization.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits remaining for your organization.
      end
    end
  end
end
