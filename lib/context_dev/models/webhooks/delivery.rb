# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      class Delivery < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #   Delivery ID.
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #   Event creation time.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute delivered_at
        #   Last successful delivery time, or null if never delivered.
        #
        #   @return [Time, nil]
        required :delivered_at, Time, nil?: true

        # @!attribute event
        #   Webhook event type.
        #
        #   @return [Symbol, ContextDev::Models::Webhooks::Delivery::Event]
        required :event, enum: -> { ContextDev::Webhooks::Delivery::Event }

        # @!attribute event_id
        #   Stable event ID for deduplicating received webhooks.
        #
        #   @return [String]
        required :event_id, String

        # @!attribute last_attempt
        #   Latest attempt, or null if none.
        #
        #   @return [ContextDev::Models::Webhooks::Attempt, nil]
        required :last_attempt, -> { ContextDev::Webhooks::Attempt }, nil?: true

        # @!attribute last_error
        #   Latest delivery error, or null if none.
        #
        #   @return [ContextDev::Models::Webhooks::Delivery::LastError, nil]
        required :last_error, -> { ContextDev::Webhooks::Delivery::LastError }, nil?: true

        # @!attribute next_attempt_at
        #   Next scheduled attempt, or null if none.
        #
        #   @return [Time, nil]
        required :next_attempt_at, Time, nil?: true

        # @!attribute retry_
        #   Webhook retry settings. Use {} for the default schedule.
        #
        #   @return [ContextDev::Models::RetryConfig]
        required :retry_, -> { ContextDev::RetryConfig }, api_name: :retry

        # @!attribute retry_expires_at
        #   Last time you can retry manually (7 days after the event).
        #
        #   @return [Time]
        required :retry_expires_at, Time

        # @!attribute source
        #   Batch or monitor run that produced the event.
        #
        #   @return [ContextDev::Models::Webhooks::Delivery::Source::Batch, ContextDev::Models::Webhooks::Delivery::Source::Monitor]
        required :source, union: -> { ContextDev::Webhooks::Delivery::Source }

        # @!attribute status
        #   `pending`, `delivering`, `retrying`, `delivered`, `failed`, or `cancelled`
        #   (source or its webhook was removed).
        #
        #   @return [Symbol, ContextDev::Models::Webhooks::Delivery::Status]
        required :status, enum: -> { ContextDev::Webhooks::Delivery::Status }

        # @!attribute url
        #   Webhook destination URL.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(id:, created_at:, delivered_at:, event:, event_id:, last_attempt:, last_error:, next_attempt_at:, retry_:, retry_expires_at:, source:, status:, url:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::Webhooks::Delivery} for more details.
        #
        #   @param id [String] Delivery ID.
        #
        #   @param created_at [Time] Event creation time.
        #
        #   @param delivered_at [Time, nil] Last successful delivery time, or null if never delivered.
        #
        #   @param event [Symbol, ContextDev::Models::Webhooks::Delivery::Event] Webhook event type.
        #
        #   @param event_id [String] Stable event ID for deduplicating received webhooks.
        #
        #   @param last_attempt [ContextDev::Models::Webhooks::Attempt, nil] Latest attempt, or null if none.
        #
        #   @param last_error [ContextDev::Models::Webhooks::Delivery::LastError, nil] Latest delivery error, or null if none.
        #
        #   @param next_attempt_at [Time, nil] Next scheduled attempt, or null if none.
        #
        #   @param retry_ [ContextDev::Models::RetryConfig] Webhook retry settings. Use {} for the default schedule.
        #
        #   @param retry_expires_at [Time] Last time you can retry manually (7 days after the event).
        #
        #   @param source [ContextDev::Models::Webhooks::Delivery::Source::Batch, ContextDev::Models::Webhooks::Delivery::Source::Monitor] Batch or monitor run that produced the event.
        #
        #   @param status [Symbol, ContextDev::Models::Webhooks::Delivery::Status] `pending`, `delivering`, `retrying`, `delivered`, `failed`, or `cancelled` (sour
        #
        #   @param url [String] Webhook destination URL.

        # Webhook event type.
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
          #   Error code.
          #
          #   @return [String]
          required :code, String

          # @!attribute message
          #   Error details.
          #
          #   @return [String]
          required :message, String

          # @!method initialize(code:, message:)
          #   Latest delivery error, or null if none.
          #
          #   @param code [String] Error code.
          #
          #   @param message [String] Error details.
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
            #   Batch ID.
            #
            #   @return [String]
            required :batch_id, String

            # @!attribute type
            #   Which deliveries to list: `batch` or `monitor`.
            #
            #   @return [Symbol, ContextDev::Models::Webhooks::Delivery::Source::Batch::Type]
            required :type, enum: -> { ContextDev::Webhooks::Delivery::Source::Batch::Type }

            # @!method initialize(batch_id:, type:)
            #   @param batch_id [String] Batch ID.
            #
            #   @param type [Symbol, ContextDev::Models::Webhooks::Delivery::Source::Batch::Type] Which deliveries to list: `batch` or `monitor`.

            # Which deliveries to list: `batch` or `monitor`.
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
            #   Monitor ID.
            #
            #   @return [String]
            required :monitor_id, String

            # @!attribute run_id
            #   Monitor run ID.
            #
            #   @return [String]
            required :run_id, String

            # @!attribute type
            #   Which deliveries to list: `batch` or `monitor`.
            #
            #   @return [Symbol, ContextDev::Models::Webhooks::Delivery::Source::Monitor::Type]
            required :type, enum: -> { ContextDev::Webhooks::Delivery::Source::Monitor::Type }

            # @!method initialize(monitor_id:, run_id:, type:)
            #   @param monitor_id [String] Monitor ID.
            #
            #   @param run_id [String] Monitor run ID.
            #
            #   @param type [Symbol, ContextDev::Models::Webhooks::Delivery::Source::Monitor::Type] Which deliveries to list: `batch` or `monitor`.

            # Which deliveries to list: `batch` or `monitor`.
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

        # `pending`, `delivering`, `retrying`, `delivered`, `failed`, or `cancelled`
        # (source or its webhook was removed).
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
