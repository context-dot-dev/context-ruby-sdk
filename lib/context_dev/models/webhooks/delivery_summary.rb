# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      class DeliverySummary < ContextDev::Internal::Type::BaseModel
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
        #   @return [Symbol, ContextDev::Models::Webhooks::DeliverySummary::Event]
        required :event, enum: -> { ContextDev::Webhooks::DeliverySummary::Event }

        # @!attribute last_error
        #   Latest delivery error, or null if none.
        #
        #   @return [ContextDev::Models::Webhooks::DeliverySummary::LastError, nil]
        required :last_error, -> { ContextDev::Webhooks::DeliverySummary::LastError }, nil?: true

        # @!attribute next_attempt_at
        #   Next scheduled attempt, or null if none.
        #
        #   @return [Time, nil]
        required :next_attempt_at, Time, nil?: true

        # @!attribute retry_expires_at
        #   Manual retry deadline, seven days after event creation.
        #
        #   @return [Time]
        required :retry_expires_at, Time

        # @!attribute source
        #   Batch or monitor run that produced the event.
        #
        #   @return [ContextDev::Models::Webhooks::DeliverySummary::Source::Batch, ContextDev::Models::Webhooks::DeliverySummary::Source::Monitor]
        required :source, union: -> { ContextDev::Webhooks::DeliverySummary::Source }

        # @!attribute status
        #   Current delivery status.
        #
        #   @return [Symbol, ContextDev::Models::Webhooks::DeliverySummary::Status]
        required :status, enum: -> { ContextDev::Webhooks::DeliverySummary::Status }

        # @!attribute url
        #   Webhook destination URL.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(id:, created_at:, delivered_at:, event:, last_error:, next_attempt_at:, retry_expires_at:, source:, status:, url:)
        #   @param id [String] Delivery ID.
        #
        #   @param created_at [Time] Event creation time.
        #
        #   @param delivered_at [Time, nil] Last successful delivery time, or null if never delivered.
        #
        #   @param event [Symbol, ContextDev::Models::Webhooks::DeliverySummary::Event] Webhook event type.
        #
        #   @param last_error [ContextDev::Models::Webhooks::DeliverySummary::LastError, nil] Latest delivery error, or null if none.
        #
        #   @param next_attempt_at [Time, nil] Next scheduled attempt, or null if none.
        #
        #   @param retry_expires_at [Time] Manual retry deadline, seven days after event creation.
        #
        #   @param source [ContextDev::Models::Webhooks::DeliverySummary::Source::Batch, ContextDev::Models::Webhooks::DeliverySummary::Source::Monitor] Batch or monitor run that produced the event.
        #
        #   @param status [Symbol, ContextDev::Models::Webhooks::DeliverySummary::Status] Current delivery status.
        #
        #   @param url [String] Webhook destination URL.

        # Webhook event type.
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
        # @see ContextDev::Models::Webhooks::DeliverySummary#source
        module Source
          extend ContextDev::Internal::Type::Union

          variant -> { ContextDev::Webhooks::DeliverySummary::Source::Batch }

          variant -> { ContextDev::Webhooks::DeliverySummary::Source::Monitor }

          class Batch < ContextDev::Internal::Type::BaseModel
            # @!attribute batch_id
            #   Batch ID.
            #
            #   @return [String]
            required :batch_id, String

            # @!attribute type
            #   Delivery source.
            #
            #   @return [Symbol, ContextDev::Models::Webhooks::DeliverySummary::Source::Batch::Type]
            required :type, enum: -> { ContextDev::Webhooks::DeliverySummary::Source::Batch::Type }

            # @!method initialize(batch_id:, type:)
            #   @param batch_id [String] Batch ID.
            #
            #   @param type [Symbol, ContextDev::Models::Webhooks::DeliverySummary::Source::Batch::Type] Delivery source.

            # Delivery source.
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
            #   Delivery source.
            #
            #   @return [Symbol, ContextDev::Models::Webhooks::DeliverySummary::Source::Monitor::Type]
            required :type, enum: -> { ContextDev::Webhooks::DeliverySummary::Source::Monitor::Type }

            # @!method initialize(monitor_id:, run_id:, type:)
            #   @param monitor_id [String] Monitor ID.
            #
            #   @param run_id [String] Monitor run ID.
            #
            #   @param type [Symbol, ContextDev::Models::Webhooks::DeliverySummary::Source::Monitor::Type] Delivery source.

            # Delivery source.
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

        # Current delivery status.
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
