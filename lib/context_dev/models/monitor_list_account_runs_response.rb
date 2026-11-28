# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list_account_runs
    class MonitorListAccountRunsResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #   Runs on this page.
      #
      #   @return [Array<ContextDev::Models::MonitorListAccountRunsResponse::Data>]
      required :data,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorListAccountRunsResponse::Data] }

      # @!attribute has_more
      #   Whether more results are available after this page.
      #
      #   @return [Boolean]
      required :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute next_cursor
      #   Pass as `cursor` to fetch the next page. `null` on the last page.
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
      #   @return [ContextDev::Models::MonitorListAccountRunsResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::MonitorListAccountRunsResponse::KeyMetadata }

      # @!method initialize(data:, has_more:, next_cursor:, request_id:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorListAccountRunsResponse} for more details.
      #
      #   @param data [Array<ContextDev::Models::MonitorListAccountRunsResponse::Data>] Runs on this page.
      #
      #   @param has_more [Boolean] Whether more results are available after this page.
      #
      #   @param next_cursor [String, nil] Pass as `cursor` to fetch the next page. `null` on the last page.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param key_metadata [ContextDev::Models::MonitorListAccountRunsResponse::KeyMetadata] Credits this request used and your remaining balance.

      class Data < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #   Unique ID of the run.
        #
        #   @return [String]
        required :id, String

        # @!attribute baseline_created
        #   `true` when this run captured the monitor's baseline instead of checking for
        #   changes.
        #
        #   @return [Boolean]
        required :baseline_created, ContextDev::Internal::Type::Boolean

        # @!attribute change_detected
        #   Whether the run detected a change.
        #
        #   @return [Boolean]
        required :change_detected, ContextDev::Internal::Type::Boolean

        # @!attribute change_detection_type
        #   Change detection type the monitor uses.
        #
        #   @return [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::ChangeDetectionType]
        required :change_detection_type,
                 enum: -> { ContextDev::Models::MonitorListAccountRunsResponse::Data::ChangeDetectionType }

        # @!attribute credits_charged
        #   Credits charged for this run. `0` for skipped and failed runs.
        #
        #   @return [Integer]
        required :credits_charged, Integer

        # @!attribute monitor_id
        #   ID of the monitor this run belongs to.
        #
        #   @return [String]
        required :monitor_id, String

        # @!attribute run_type
        #   `baseline` runs capture a fresh baseline after creation or a target or detection
        #   change. `scheduled` runs, including on-demand ones, check for changes.
        #
        #   @return [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::RunType]
        required :run_type, enum: -> { ContextDev::Models::MonitorListAccountRunsResponse::Data::RunType }

        # @!attribute status
        #   Run status. `skipped` runs never executed; `skip_reason` says why.
        #
        #   @return [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::Status]
        required :status, enum: -> { ContextDev::Models::MonitorListAccountRunsResponse::Data::Status }

        # @!attribute target_type
        #   Type of target the monitor watches.
        #
        #   @return [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::TargetType]
        required :target_type, enum: -> { ContextDev::Models::MonitorListAccountRunsResponse::Data::TargetType }

        # @!attribute change_id
        #   ID of the change this run detected. `null` when it found none.
        #
        #   @return [String, nil]
        optional :change_id, String, nil?: true

        # @!attribute completed_at
        #   When the run ended. `null` until it ends.
        #
        #   @return [Time, nil]
        optional :completed_at, Time, nil?: true

        # @!attribute error
        #
        #   @return [ContextDev::Models::MonitorListAccountRunsResponse::Data::Error, nil]
        optional :error, -> { ContextDev::Models::MonitorListAccountRunsResponse::Data::Error }, nil?: true

        # @!attribute skip_reason
        #   Why the run was skipped; `superseded` means a concurrent run took its place or
        #   the monitor was deleted. `null` unless `status` is `skipped`.
        #
        #   @return [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::SkipReason, nil]
        optional :skip_reason,
                 enum: -> { ContextDev::Models::MonitorListAccountRunsResponse::Data::SkipReason },
                 nil?: true

        # @!attribute started_at
        #   When the run started. `null` until it starts.
        #
        #   @return [Time, nil]
        optional :started_at, Time, nil?: true

        # @!attribute webhook_deliveries
        #   Webhook deliveries for this run, one per subscribed event that fired. Omitted
        #   when no delivery was attempted.
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
        #   IDs of the webhook deliveries sent for this run.
        #
        #   @return [Array<String>, nil]
        optional :webhook_delivery_ids, ContextDev::Internal::Type::ArrayOf[String]

        # @!method initialize(id:, baseline_created:, change_detected:, change_detection_type:, credits_charged:, monitor_id:, run_type:, status:, target_type:, change_id: nil, completed_at: nil, error: nil, skip_reason: nil, started_at: nil, webhook_deliveries: nil, webhook_delivery: nil, webhook_delivery_ids: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorListAccountRunsResponse::Data} for more details.
        #
        #   @param id [String] Unique ID of the run.
        #
        #   @param baseline_created [Boolean] `true` when this run captured the monitor's baseline instead of checking for cha
        #
        #   @param change_detected [Boolean] Whether the run detected a change.
        #
        #   @param change_detection_type [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::ChangeDetectionType] Change detection type the monitor uses.
        #
        #   @param credits_charged [Integer] Credits charged for this run. `0` for skipped and failed runs.
        #
        #   @param monitor_id [String] ID of the monitor this run belongs to.
        #
        #   @param run_type [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::RunType] `baseline` runs capture a fresh baseline after creation or a target or detection
        #
        #   @param status [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::Status] Run status. `skipped` runs never executed; `skip_reason` says why.
        #
        #   @param target_type [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::TargetType] Type of target the monitor watches.
        #
        #   @param change_id [String, nil] ID of the change this run detected. `null` when it found none.
        #
        #   @param completed_at [Time, nil] When the run ended. `null` until it ends.
        #
        #   @param error [ContextDev::Models::MonitorListAccountRunsResponse::Data::Error, nil]
        #
        #   @param skip_reason [Symbol, ContextDev::Models::MonitorListAccountRunsResponse::Data::SkipReason, nil] Why the run was skipped; `superseded` means a concurrent run took its place or t
        #
        #   @param started_at [Time, nil] When the run started. `null` until it starts.
        #
        #   @param webhook_deliveries [Array<ContextDev::Models::WebhookDelivery>] Webhook deliveries for this run, one per subscribed event that fired. Omitted wh
        #
        #   @param webhook_delivery [ContextDev::Models::WebhookDelivery] Deprecated. Use `webhook_deliveries` for all attempts.
        #
        #   @param webhook_delivery_ids [Array<String>] IDs of the webhook deliveries sent for this run.

        # Change detection type the monitor uses.
        #
        # @see ContextDev::Models::MonitorListAccountRunsResponse::Data#change_detection_type
        module ChangeDetectionType
          extend ContextDev::Internal::Type::Enum

          EXACT = :exact
          SEMANTIC = :semantic

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # `baseline` runs capture a fresh baseline after creation or a target or detection
        # change. `scheduled` runs, including on-demand ones, check for changes.
        #
        # @see ContextDev::Models::MonitorListAccountRunsResponse::Data#run_type
        module RunType
          extend ContextDev::Internal::Type::Enum

          BASELINE = :baseline
          SCHEDULED = :scheduled

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Run status. `skipped` runs never executed; `skip_reason` says why.
        #
        # @see ContextDev::Models::MonitorListAccountRunsResponse::Data#status
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

        # Type of target the monitor watches.
        #
        # @see ContextDev::Models::MonitorListAccountRunsResponse::Data#target_type
        module TargetType
          extend ContextDev::Internal::Type::Enum

          PAGE = :page
          SITEMAP = :sitemap
          EXTRACT = :extract
          SEARCH = :search

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::MonitorListAccountRunsResponse::Data#error
        class Error < ContextDev::Internal::Type::BaseModel
          # @!attribute code
          #   Machine-readable error code, such as `fetch_failed`.
          #
          #   @return [String]
          required :code, String

          # @!attribute message
          #   Human-readable explanation of the error.
          #
          #   @return [String]
          required :message, String

          # @!method initialize(code:, message:)
          #   @param code [String] Machine-readable error code, such as `fetch_failed`.
          #
          #   @param message [String] Human-readable explanation of the error.
        end

        # Why the run was skipped; `superseded` means a concurrent run took its place or
        # the monitor was deleted. `null` unless `status` is `skipped`.
        #
        # @see ContextDev::Models::MonitorListAccountRunsResponse::Data#skip_reason
        module SkipReason
          extend ContextDev::Internal::Type::Enum

          INSUFFICIENT_CREDITS = :insufficient_credits
          MONITOR_PAUSED = :monitor_paused
          SUPERSEDED = :superseded

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::MonitorListAccountRunsResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits your organization has left after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits your organization has left after this request.
      end
    end
  end
end
