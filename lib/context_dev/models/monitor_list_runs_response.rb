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

      # @!method initialize(data:, has_more:, next_cursor:)
      #   @param data [Array<ContextDev::Models::MonitorListRunsResponse::Data>]
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
        #   The first run after monitor creation is a baseline run.
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
        #   @return [Array<ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery>, nil]
        optional :webhook_deliveries,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery] }

        # @!attribute webhook_delivery
        #   @deprecated
        #
        #   Deprecated: use `webhook_deliveries`, which records every attempt now that a run
        #   can deliver multiple events. Omitted when no webhook was attempted, including
        #   historical runs created before delivery tracking was added.
        #
        #   @return [ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery, nil]
        optional :webhook_delivery, -> { ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery }

        # @!method initialize(id:, baseline_created:, change_detected:, change_detection_type:, credits_charged:, monitor_id:, run_type:, status:, target_type:, change_id: nil, completed_at: nil, error: nil, skip_reason: nil, started_at: nil, webhook_deliveries: nil, webhook_delivery: nil)
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
        #   @param run_type [Symbol, ContextDev::Models::MonitorListRunsResponse::Data::RunType] The first run after monitor creation is a baseline run.
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
        #   @param webhook_deliveries [Array<ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery>] All webhook deliveries attempted by this run — one per subscribed event that fir
        #
        #   @param webhook_delivery [ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery] Deprecated: use `webhook_deliveries`, which records every attempt now that a run

        # @see ContextDev::Models::MonitorListRunsResponse::Data#change_detection_type
        module ChangeDetectionType
          extend ContextDev::Internal::Type::Enum

          EXACT = :exact
          SEMANTIC = :semantic

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The first run after monitor creation is a baseline run.
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

        class WebhookDelivery < ContextDev::Internal::Type::BaseModel
          # @!attribute attempted_at
          #
          #   @return [Time]
          required :attempted_at, Time

          # @!attribute error
          #
          #   @return [ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery::Error, nil]
          required :error,
                   -> { ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery::Error },
                   nil?: true

          # @!attribute event
          #   The event this delivery carried. Deliveries recorded before event selection
          #   existed report change.detected.
          #
          #   @return [Symbol, ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery::Event]
          required :event, enum: -> { ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery::Event }

          # @!attribute event_id
          #   Identifier sent in the X-Context-Id header.
          #
          #   @return [String]
          required :event_id, String

          # @!attribute http_status
          #   The endpoint's final HTTP response status, or null when no response was
          #   received.
          #
          #   @return [Integer, nil]
          required :http_status, Integer, nil?: true

          # @!attribute status
          #   Delivery outcome. delivered means any 2xx response; rejected means a non-2xx
          #   response; failed means no HTTP response was received; skipped_unsafe_url means
          #   the URL failed the public-endpoint safety check.
          #
          #   @return [Symbol, ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery::Status]
          required :status, enum: -> { ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery::Status }

          # @!method initialize(attempted_at:, error:, event:, event_id:, http_status:, status:)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery} for more
          #   details.
          #
          #   @param attempted_at [Time]
          #
          #   @param error [ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery::Error, nil]
          #
          #   @param event [Symbol, ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery::Event] The event this delivery carried. Deliveries recorded before event selection exis
          #
          #   @param event_id [String] Identifier sent in the X-Context-Id header.
          #
          #   @param http_status [Integer, nil] The endpoint's final HTTP response status, or null when no response was received
          #
          #   @param status [Symbol, ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery::Status] Delivery outcome. delivered means any 2xx response; rejected means a non-2xx res

          # @see ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery#error
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

          # The event this delivery carried. Deliveries recorded before event selection
          # existed report change.detected.
          #
          # @see ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery#event
          module Event
            extend ContextDev::Internal::Type::Enum

            CHANGE_DETECTED = :"change.detected"
            RUN_COMPLETED = :"run.completed"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Delivery outcome. delivered means any 2xx response; rejected means a non-2xx
          # response; failed means no HTTP response was received; skipped_unsafe_url means
          # the URL failed the public-endpoint safety check.
          #
          # @see ContextDev::Models::MonitorListRunsResponse::Data::WebhookDelivery#status
          module Status
            extend ContextDev::Internal::Type::Enum

            DELIVERED = :delivered
            REJECTED = :rejected
            FAILED = :failed
            SKIPPED_UNSAFE_URL = :skipped_unsafe_url

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
