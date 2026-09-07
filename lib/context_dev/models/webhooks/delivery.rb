# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      class Delivery < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute attempt_count
        #   Number of delivery attempts started, including any attempt in progress.
        #
        #   @return [Integer]
        required :attempt_count, Integer

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute delivered_at
        #   Most recent successful acknowledgment; retained if a later forced resend fails.
        #
        #   @return [Time, nil]
        required :delivered_at, Time, nil?: true

        # @!attribute event
        #
        #   @return [Symbol, ContextDev::Models::Webhooks::Delivery::Event]
        required :event, enum: -> { ContextDev::Webhooks::Delivery::Event }

        # @!attribute event_id
        #   Stable event ID. Unchanged across automatic and manual attempts; use it to
        #   deduplicate events.
        #
        #   @return [String]
        required :event_id, String

        # @!attribute last_attempt
        #
        #   @return [ContextDev::Models::Webhooks::Delivery::LastAttempt]
        required :last_attempt, -> { ContextDev::Webhooks::Delivery::LastAttempt }

        # @!attribute last_error
        #
        #   @return [ContextDev::Models::Webhooks::Delivery::LastError, nil]
        required :last_error, -> { ContextDev::Webhooks::Delivery::LastError }, nil?: true

        # @!attribute next_attempt_at
        #
        #   @return [Time, nil]
        required :next_attempt_at, Time, nil?: true

        # @!attribute retry_
        #   Opt into durable webhook delivery. An empty object uses the default retry
        #   schedule. Omit retry to preserve legacy delivery behavior. The policy is
        #   snapshotted for each event.
        #
        #   @return [ContextDev::Models::RetryConfig]
        required :retry_, -> { ContextDev::RetryConfig }, api_name: :retry

        # @!attribute retry_expires_at
        #   Seven days after event creation. Manual retries after this time return 410.
        #   Delivery and attempt metadata remain available for up to 30 days.
        #
        #   @return [Time]
        required :retry_expires_at, Time

        # @!attribute source
        #
        #   @return [ContextDev::Models::Webhooks::Delivery::Source::UnionMember0, ContextDev::Models::Webhooks::Delivery::Source::UnionMember1]
        required :source, union: -> { ContextDev::Webhooks::Delivery::Source }

        # @!attribute status
        #
        #   @return [Symbol, ContextDev::Models::Webhooks::Delivery::Status]
        required :status, enum: -> { ContextDev::Webhooks::Delivery::Status }

        # @!attribute url
        #   Destination recorded for this delivery. Each attempt records the URL it used.
        #   Monitor retries use the currently configured URL and signing secret.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(id:, attempt_count:, created_at:, delivered_at:, event:, event_id:, last_attempt:, last_error:, next_attempt_at:, retry_:, retry_expires_at:, source:, status:, url:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::Webhooks::Delivery} for more details.
        #
        #   @param id [String]
        #
        #   @param attempt_count [Integer] Number of delivery attempts started, including any attempt in progress.
        #
        #   @param created_at [Time]
        #
        #   @param delivered_at [Time, nil] Most recent successful acknowledgment; retained if a later forced resend fails.
        #
        #   @param event [Symbol, ContextDev::Models::Webhooks::Delivery::Event]
        #
        #   @param event_id [String] Stable event ID. Unchanged across automatic and manual attempts; use it to dedup
        #
        #   @param last_attempt [ContextDev::Models::Webhooks::Delivery::LastAttempt]
        #
        #   @param last_error [ContextDev::Models::Webhooks::Delivery::LastError, nil]
        #
        #   @param next_attempt_at [Time, nil]
        #
        #   @param retry_ [ContextDev::Models::RetryConfig] Opt into durable webhook delivery. An empty object uses the default retry schedu
        #
        #   @param retry_expires_at [Time] Seven days after event creation. Manual retries after this time return 410. Deli
        #
        #   @param source [ContextDev::Models::Webhooks::Delivery::Source::UnionMember0, ContextDev::Models::Webhooks::Delivery::Source::UnionMember1]
        #
        #   @param status [Symbol, ContextDev::Models::Webhooks::Delivery::Status]
        #
        #   @param url [String] Destination recorded for this delivery. Each attempt records the URL it used. Mo

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

        # @see ContextDev::Models::Webhooks::Delivery#last_attempt
        class LastAttempt < ContextDev::Models::Webhooks::Attempt
          # @!method initialize
        end

        # @see ContextDev::Models::Webhooks::Delivery#last_error
        class LastError < ContextDev::Internal::Type::BaseModel
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

        # @see ContextDev::Models::Webhooks::Delivery#source
        module Source
          extend ContextDev::Internal::Type::Union

          variant -> { ContextDev::Webhooks::Delivery::Source::UnionMember0 }

          variant -> { ContextDev::Webhooks::Delivery::Source::UnionMember1 }

          class UnionMember0 < ContextDev::Internal::Type::BaseModel
            # @!attribute batch_id
            #
            #   @return [String]
            required :batch_id, String

            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::Webhooks::Delivery::Source::UnionMember0::Type]
            required :type, enum: -> { ContextDev::Webhooks::Delivery::Source::UnionMember0::Type }

            # @!method initialize(batch_id:, type:)
            #   @param batch_id [String]
            #   @param type [Symbol, ContextDev::Models::Webhooks::Delivery::Source::UnionMember0::Type]

            # @see ContextDev::Models::Webhooks::Delivery::Source::UnionMember0#type
            module Type
              extend ContextDev::Internal::Type::Enum

              BATCH = :batch

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class UnionMember1 < ContextDev::Internal::Type::BaseModel
            # @!attribute monitor_id
            #
            #   @return [String]
            required :monitor_id, String

            # @!attribute run_id
            #
            #   @return [String]
            required :run_id, String

            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::Webhooks::Delivery::Source::UnionMember1::Type]
            required :type, enum: -> { ContextDev::Webhooks::Delivery::Source::UnionMember1::Type }

            # @!method initialize(monitor_id:, run_id:, type:)
            #   @param monitor_id [String]
            #   @param run_id [String]
            #   @param type [Symbol, ContextDev::Models::Webhooks::Delivery::Source::UnionMember1::Type]

            # @see ContextDev::Models::Webhooks::Delivery::Source::UnionMember1#type
            module Type
              extend ContextDev::Internal::Type::Enum

              MONITOR = :monitor

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @!method self.variants
          #   @return [Array(ContextDev::Models::Webhooks::Delivery::Source::UnionMember0, ContextDev::Models::Webhooks::Delivery::Source::UnionMember1)]
        end

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
