# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      class Attempt < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute attempt
        #
        #   @return [Integer]
        required :attempt, Integer

        # @!attribute completed_at
        #
        #   @return [Time, nil]
        required :completed_at, Time, nil?: true

        # @!attribute error
        #
        #   @return [ContextDev::Models::Webhooks::Attempt::Error, nil]
        required :error, -> { ContextDev::Webhooks::Attempt::Error }, nil?: true

        # @!attribute http_status
        #
        #   @return [Integer, nil]
        required :http_status, Integer, nil?: true

        # @!attribute started_at
        #
        #   @return [Time]
        required :started_at, Time

        # @!attribute trigger
        #
        #   @return [Symbol, ContextDev::Models::Webhooks::Attempt::Trigger]
        required :trigger, enum: -> { ContextDev::Webhooks::Attempt::Trigger }

        # @!attribute url
        #
        #   @return [String]
        required :url, String

        # @!method initialize(id:, attempt:, completed_at:, error:, http_status:, started_at:, trigger:, url:)
        #   @param id [String]
        #   @param attempt [Integer]
        #   @param completed_at [Time, nil]
        #   @param error [ContextDev::Models::Webhooks::Attempt::Error, nil]
        #   @param http_status [Integer, nil]
        #   @param started_at [Time]
        #   @param trigger [Symbol, ContextDev::Models::Webhooks::Attempt::Trigger]
        #   @param url [String]

        # @see ContextDev::Models::Webhooks::Attempt#error
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
