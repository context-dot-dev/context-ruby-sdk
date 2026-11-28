# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      class DeliverySummary < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #   Unique ID of the delivery.
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #   When the event was created.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute delivered_at
        #   When the delivery last succeeded. `null` until it succeeds.
        #
        #   @return [Time, nil]
        required :delivered_at, Time, nil?: true

        # @!attribute event
        #   Event that triggered the delivery.
        #
        #   @return [Symbol, ContextDev::Models::Webhooks::DeliverySummary::Event]
        required :event, enum: -> { ContextDev::Webhooks::DeliverySummary::Event }

        # @!attribute last_error
        #   Most recent delivery error. `null` when there is none.
        #
        #   @return [ContextDev::Models::Webhooks::DeliverySummary::LastError, nil]
        required :last_error, -> { ContextDev::Webhooks::DeliverySummary::LastError }, nil?: true

        # @!attribute next_attempt_at
        #   When the next attempt is scheduled. `null` when none is scheduled.
        #
        #   @return [Time, nil]
        required :next_attempt_at, Time, nil?: true

        # @!attribute retry_expires_at
        #   Last time you can retry the delivery manually, 7 days after the event.
        #
        #   @return [Time]
        required :retry_expires_at, Time

        # @!attribute source
        #   Batch or monitor run that produced the event.
        #
        #   @return [ContextDev::Models::Webhooks::DeliverySummary::Source::Batch, ContextDev::Models::Webhooks::DeliverySummary::Source::Monitor]
        required :source, union: -> { ContextDev::Webhooks::DeliverySummary::Source }

        # @!attribute status
        #   Delivery state. `pending` is waiting for an attempt, `delivering` has an attempt
        #   in progress, `retrying` is waiting for an automatic retry, `delivered` was
        #   acknowledged with a 2xx, `failed` has no automatic retries left, and `cancelled`
        #   means the source or its webhook was removed.
        #
        #   @return [Symbol, ContextDev::Models::Webhooks::DeliverySummary::Status]
        required :status, enum: -> { ContextDev::Webhooks::DeliverySummary::Status }

        # @!attribute url
        #   URL the webhook is sent to.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(id:, created_at:, delivered_at:, event:, last_error:, next_attempt_at:, retry_expires_at:, source:, status:, url:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::Webhooks::DeliverySummary} for more details.
        #
        #   @param id [String] Unique ID of the delivery.
        #
        #   @param created_at [Time] When the event was created.
        #
        #   @param delivered_at [Time, nil] When the delivery last succeeded. `null` until it succeeds.
        #
        #   @param event [Symbol, ContextDev::Models::Webhooks::DeliverySummary::Event] Event that triggered the delivery.
        #
        #   @param last_error [ContextDev::Models::Webhooks::DeliverySummary::LastError, nil] Most recent delivery error. `null` when there is none.
        #
        #   @param next_attempt_at [Time, nil] When the next attempt is scheduled. `null` when none is scheduled.
        #
        #   @param retry_expires_at [Time] Last time you can retry the delivery manually, 7 days after the event.
        #
        #   @param source [ContextDev::Models::Webhooks::DeliverySummary::Source::Batch, ContextDev::Models::Webhooks::DeliverySummary::Source::Monitor] Batch or monitor run that produced the event.
        #
        #   @param status [Symbol, ContextDev::Models::Webhooks::DeliverySummary::Status] Delivery state. `pending` is waiting for an attempt, `delivering` has an attempt
        #
        #   @param url [String] URL the webhook is sent to.

        # Event that triggered the delivery.
        #
        # @see ContextDev::Models::Webhooks::DeliverySummary#event
        module Event
          extend ContextDev::Internal::Type::Enum

          BATCH_COMPLETED = :"batch.completed"
          BATCH_FAILED = :"batch.failed"
          BATCH_CANCELLED = :"batch.cancelled"
          CHANGE_DETECTED = :"change.detected"
          RUN_COMPLETED = :"run.completed"

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::Webhooks::DeliverySummary#last_error
        class LastError < ContextDev::Internal::Type::BaseModel
          # @!attribute code
          #   Machine-readable error code.
          #
          #   @return [String]
          required :code, String

          # @!attribute message
          #   Human-readable explanation of the error.
          #
          #   @return [String]
          required :message, String

          # @!method initialize(code:, message:)
          #   Most recent delivery error. `null` when there is none.
          #
          #   @param code [String] Machine-readable error code.
          #
          #   @param message [String] Human-readable explanation of the error.
        end

        # Batch or monitor run that produced the event.
        #
        # @see ContextDev::Models::Webhooks::DeliverySummary#source
        module Source
          extend ContextDev::Internal::Type::Union

          variant -> { ContextDev::Webhooks::DeliverySummary::Source::Batch }

          variant -> { ContextDev::Webhooks::DeliverySummary::Source::Monitor }

          class Batch < ContextDev::Internal::Type::BaseModel
            # @!attribute batch_id
            #   ID of the batch.
            #
            #   @return [String]
            required :batch_id, String

            # @!attribute type
            #   The event came from a batch.
            #
            #   @return [Symbol, ContextDev::Models::Webhooks::DeliverySummary::Source::Batch::Type]
            required :type, enum: -> { ContextDev::Webhooks::DeliverySummary::Source::Batch::Type }

            # @!method initialize(batch_id:, type:)
            #   @param batch_id [String] ID of the batch.
            #
            #   @param type [Symbol, ContextDev::Models::Webhooks::DeliverySummary::Source::Batch::Type] The event came from a batch.

            # The event came from a batch.
            #
            # @see ContextDev::Models::Webhooks::DeliverySummary::Source::Batch#type
            module Type
              extend ContextDev::Internal::Type::Enum

              BATCH = :batch

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class Monitor < ContextDev::Internal::Type::BaseModel
            # @!attribute monitor_id
            #   ID of the monitor.
            #
            #   @return [String]
            required :monitor_id, String

            # @!attribute run_id
            #   ID of the monitor run.
            #
            #   @return [String]
            required :run_id, String

            # @!attribute type
            #   The event came from a monitor run.
            #
            #   @return [Symbol, ContextDev::Models::Webhooks::DeliverySummary::Source::Monitor::Type]
            required :type, enum: -> { ContextDev::Webhooks::DeliverySummary::Source::Monitor::Type }

            # @!method initialize(monitor_id:, run_id:, type:)
            #   @param monitor_id [String] ID of the monitor.
            #
            #   @param run_id [String] ID of the monitor run.
            #
            #   @param type [Symbol, ContextDev::Models::Webhooks::DeliverySummary::Source::Monitor::Type] The event came from a monitor run.

            # The event came from a monitor run.
            #
            # @see ContextDev::Models::Webhooks::DeliverySummary::Source::Monitor#type
            module Type
              extend ContextDev::Internal::Type::Enum

              MONITOR = :monitor

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @!method self.variants
          #   @return [Array(ContextDev::Models::Webhooks::DeliverySummary::Source::Batch, ContextDev::Models::Webhooks::DeliverySummary::Source::Monitor)]
        end

        # Delivery state. `pending` is waiting for an attempt, `delivering` has an attempt
        # in progress, `retrying` is waiting for an automatic retry, `delivered` was
        # acknowledged with a 2xx, `failed` has no automatic retries left, and `cancelled`
        # means the source or its webhook was removed.
        #
        # @see ContextDev::Models::Webhooks::DeliverySummary#status
        module Status
          extend ContextDev::Internal::Type::Enum

          PENDING = :pending
          DELIVERING = :delivering
          RETRYING = :retrying
          DELIVERED = :delivered
          FAILED = :failed
          CANCELLED = :cancelled

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
