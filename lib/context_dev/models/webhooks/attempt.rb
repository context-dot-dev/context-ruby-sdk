# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      class Attempt < ContextDev::Internal::Type::BaseModel
        # @!attribute attempt
        #   Attempt number, starting at 1.
        #
        #   @return [Integer]
        required :attempt, Integer

        # @!attribute completed_at
        #   When the attempt finished. `null` while in progress.
        #
        #   @return [Time, nil]
        required :completed_at, Time, nil?: true

        # @!attribute error
        #   Why the attempt failed. `null` when it did not fail.
        #
        #   @return [ContextDev::Models::Webhooks::Attempt::Error, nil]
        required :error, -> { ContextDev::Webhooks::Attempt::Error }, nil?: true

        # @!attribute http_status
        #   HTTP status your endpoint returned. `null` when no response was received.
        #
        #   @return [Integer, nil]
        required :http_status, Integer, nil?: true

        # @!attribute started_at
        #   When the attempt started.
        #
        #   @return [Time]
        required :started_at, Time

        # @!attribute trigger
        #   What started the attempt: `initial` is the first send, `automatic` is a
        #   scheduled retry, and `manual` came from
        #   `POST /webhooks/deliveries/{delivery_id}/retry`.
        #
        #   @return [Symbol, ContextDev::Models::Webhooks::Attempt::Trigger]
        required :trigger, enum: -> { ContextDev::Webhooks::Attempt::Trigger }

        # @!attribute url
        #   URL this attempt was sent to.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(attempt:, completed_at:, error:, http_status:, started_at:, trigger:, url:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::Webhooks::Attempt} for more details.
        #
        #   @param attempt [Integer] Attempt number, starting at 1.
        #
        #   @param completed_at [Time, nil] When the attempt finished. `null` while in progress.
        #
        #   @param error [ContextDev::Models::Webhooks::Attempt::Error, nil] Why the attempt failed. `null` when it did not fail.
        #
        #   @param http_status [Integer, nil] HTTP status your endpoint returned. `null` when no response was received.
        #
        #   @param started_at [Time] When the attempt started.
        #
        #   @param trigger [Symbol, ContextDev::Models::Webhooks::Attempt::Trigger] What started the attempt: `initial` is the first send, `automatic` is a schedule
        #
        #   @param url [String] URL this attempt was sent to.

        # @see ContextDev::Models::Webhooks::Attempt#error
        class Error < ContextDev::Internal::Type::BaseModel
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
          #   Why the attempt failed. `null` when it did not fail.
          #
          #   @param code [String] Machine-readable error code.
          #
          #   @param message [String] Human-readable explanation of the error.
        end

        # What started the attempt: `initial` is the first send, `automatic` is a
        # scheduled retry, and `manual` came from
        # `POST /webhooks/deliveries/{delivery_id}/retry`.
        #
        # @see ContextDev::Models::Webhooks::Attempt#trigger
        module Trigger
          extend ContextDev::Internal::Type::Enum

          INITIAL = :initial
          AUTOMATIC = :automatic
          MANUAL = :manual

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
