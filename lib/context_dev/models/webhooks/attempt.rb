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
        #   Completion time, or null while in progress.
        #
        #   @return [Time, nil]
        required :completed_at, Time, nil?: true

        # @!attribute error
        #   Attempt error, or null if none.
        #
        #   @return [ContextDev::Models::Webhooks::Attempt::Error, nil]
        required :error, -> { ContextDev::Webhooks::Attempt::Error }, nil?: true

        # @!attribute http_status
        #   HTTP response status, or null if no response was received.
        #
        #   @return [Integer, nil]
        required :http_status, Integer, nil?: true

        # @!attribute started_at
        #   Attempt start time.
        #
        #   @return [Time]
        required :started_at, Time

        # @!attribute trigger
        #   What started this attempt.
        #
        #   @return [Symbol, ContextDev::Models::Webhooks::Attempt::Trigger]
        required :trigger, enum: -> { ContextDev::Webhooks::Attempt::Trigger }

        # @!attribute url
        #   URL used for this attempt.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(attempt:, completed_at:, error:, http_status:, started_at:, trigger:, url:)
        #   @param attempt [Integer] Attempt number, starting at 1.
        #
        #   @param completed_at [Time, nil] Completion time, or null while in progress.
        #
        #   @param error [ContextDev::Models::Webhooks::Attempt::Error, nil] Attempt error, or null if none.
        #
        #   @param http_status [Integer, nil] HTTP response status, or null if no response was received.
        #
        #   @param started_at [Time] Attempt start time.
        #
        #   @param trigger [Symbol, ContextDev::Models::Webhooks::Attempt::Trigger] What started this attempt.
        #
        #   @param url [String] URL used for this attempt.

        # @see ContextDev::Models::Webhooks::Attempt#error
        class Error < ContextDev::Internal::Type::BaseModel
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
          #   Attempt error, or null if none.
          #
          #   @param code [String] Error code.
          #
          #   @param message [String] Error details.
        end

        # What started this attempt.
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
