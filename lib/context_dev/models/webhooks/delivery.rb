# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      class Delivery < ContextDev::Internal::Type::BaseModel
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
        #   @return [Symbol, ContextDev::Models::Webhooks::Delivery::Event]
        required :event, enum: -> { ContextDev::Webhooks::Delivery::Event }

        # @!attribute event_id
        #   Event ID, sent as `X-Context-Id` and as `id` in the payload. It stays the same
        #   across retries, so use it to deduplicate.
        #
        #   @return [String]
        required :event_id, String

        # @!attribute last_attempt
        #   Most recent attempt. `null` before the first attempt.
        #
        #   @return [ContextDev::Models::Webhooks::Attempt, nil]
        required :last_attempt, -> { ContextDev::Webhooks::Attempt }, nil?: true

        # @!attribute last_error
        #   Most recent delivery error. `null` when there is none.
        #
        #   @return [ContextDev::Models::Webhooks::Delivery::LastError, nil]
        required :last_error, -> { ContextDev::Webhooks::Delivery::LastError }, nil?: true

        # @!attribute next_attempt_at
        #   When the next attempt is scheduled. `null` when none is scheduled.
        #
        #   @return [Time, nil]
        required :next_attempt_at, Time, nil?: true

        # @!attribute retry_
        #   Automatic retry settings. Pass `{}` for the default schedule.
        #
        #   @return [ContextDev::Models::RetryConfig]
        required :retry_, -> { ContextDev::RetryConfig }, api_name: :retry

        # @!attribute retry_expires_at
        #   Last time you can retry the delivery manually, 7 days after the event.
        #
        #   @return [Time]
        required :retry_expires_at, Time

        # @!attribute source
        #   Batch or monitor run that produced the event.
        #
        #   @return [ContextDev::Models::Webhooks::Delivery::Source::Batch, ContextDev::Models::Webhooks::Delivery::Source::Monitor]
        required :source, union: -> { ContextDev::Webhooks::Delivery::Source }

        # @!attribute status
        #   Delivery state. `pending` is waiting for an attempt, `delivering` has an attempt
        #   in progress, `retrying` is waiting for an automatic retry, `delivered` was
        #   acknowledged with a 2xx, `failed` has no automatic retries left, and `cancelled`
        #   means the source or its webhook was removed.
        #
        #   @return [Symbol, ContextDev::Models::Webhooks::Delivery::Status]
        required :status, enum: -> { ContextDev::Webhooks::Delivery::Status }

        # @!attribute url
        #   URL the webhook is sent to.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(id:, created_at:, delivered_at:, event:, event_id:, last_attempt:, last_error:, next_attempt_at:, retry_:, retry_expires_at:, source:, status:, url:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::Webhooks::Delivery} for more details.
        #
        #   @param id [String] Unique ID of the delivery.
        #
        #   @param created_at [Time] When the event was created.
        #
        #   @param delivered_at [Time, nil] When the delivery last succeeded. `null` until it succeeds.
        #
        #   @param event [Symbol, ContextDev::Models::Webhooks::Delivery::Event] Event that triggered the delivery.
        #
        #   @param event_id [String] Event ID, sent as `X-Context-Id` and as `id` in the payload. It stays the same a
        #
        #   @param last_attempt [ContextDev::Models::Webhooks::Attempt, nil] Most recent attempt. `null` before the first attempt.
        #
        #   @param last_error [ContextDev::Models::Webhooks::Delivery::LastError, nil] Most recent delivery error. `null` when there is none.
        #
        #   @param next_attempt_at [Time, nil] When the next attempt is scheduled. `null` when none is scheduled.
        #
        #   @param retry_ [ContextDev::Models::RetryConfig] Automatic retry settings. Pass `{}` for the default schedule.
        #
        #   @param retry_expires_at [Time] Last time you can retry the delivery manually, 7 days after the event.
        #
        #   @param source [ContextDev::Models::Webhooks::Delivery::Source::Batch, ContextDev::Models::Webhooks::Delivery::Source::Monitor] Batch or monitor run that produced the event.
        #
        #   @param status [Symbol, ContextDev::Models::Webhooks::Delivery::Status] Delivery state. `pending` is waiting for an attempt, `delivering` has an attempt
        #
        #   @param url [String] URL the webhook is sent to.

        # Event that triggered the delivery.
        #
        # @see ContextDev::Models::Webhooks::Delivery#event
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

        # @see ContextDev::Models::Webhooks::Delivery#last_error
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
        # @see ContextDev::Models::Webhooks::Delivery#source
        module Source
          extend ContextDev::Internal::Type::Union

          variant -> { ContextDev::Webhooks::Delivery::Source::Batch }

          variant -> { ContextDev::Webhooks::Delivery::Source::Monitor }

          class Batch < ContextDev::Internal::Type::BaseModel
            # @!attribute batch_id
            #   ID of the batch.
            #
            #   @return [String]
            required :batch_id, String

            # @!attribute type
            #   The event came from a batch.
            #
            #   @return [Symbol, ContextDev::Models::Webhooks::Delivery::Source::Batch::Type]
            required :type, enum: -> { ContextDev::Webhooks::Delivery::Source::Batch::Type }

            # @!method initialize(batch_id:, type:)
            #   @param batch_id [String] ID of the batch.
            #
            #   @param type [Symbol, ContextDev::Models::Webhooks::Delivery::Source::Batch::Type] The event came from a batch.

            # The event came from a batch.
            #
            # @see ContextDev::Models::Webhooks::Delivery::Source::Batch#type
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
            #   @return [Symbol, ContextDev::Models::Webhooks::Delivery::Source::Monitor::Type]
            required :type, enum: -> { ContextDev::Webhooks::Delivery::Source::Monitor::Type }

            # @!method initialize(monitor_id:, run_id:, type:)
            #   @param monitor_id [String] ID of the monitor.
            #
            #   @param run_id [String] ID of the monitor run.
            #
            #   @param type [Symbol, ContextDev::Models::Webhooks::Delivery::Source::Monitor::Type] The event came from a monitor run.

            # The event came from a monitor run.
            #
            # @see ContextDev::Models::Webhooks::Delivery::Source::Monitor#type
            module Type
              extend ContextDev::Internal::Type::Enum

              MONITOR = :monitor

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @!method self.variants
          #   @return [Array(ContextDev::Models::Webhooks::Delivery::Source::Batch, ContextDev::Models::Webhooks::Delivery::Source::Monitor)]
        end

        # Delivery state. `pending` is waiting for an attempt, `delivering` has an attempt
        # in progress, `retrying` is waiting for an automatic retry, `delivered` was
        # acknowledged with a 2xx, `failed` has no automatic retries left, and `cancelled`
        # means the source or its webhook was removed.
        #
        # @see ContextDev::Models::Webhooks::Delivery#status
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
