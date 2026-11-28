# frozen_string_literal: true

module ContextDev
  module Models
    class WebhookDelivery < ContextDev::Internal::Type::BaseModel
      # @!attribute attempted_at
      #   When the delivery was attempted.
      #
      #   @return [Time]
      required :attempted_at, Time

      # @!attribute error
      #
      #   @return [ContextDev::Models::WebhookDelivery::Error, nil]
      required :error, -> { ContextDev::WebhookDelivery::Error }, nil?: true

      # @!attribute event
      #   Event this delivery carried.
      #
      #   @return [Symbol, ContextDev::Models::WebhookDelivery::Event]
      required :event, enum: -> { ContextDev::WebhookDelivery::Event }

      # @!attribute event_id
      #   Event ID, sent in the `X-Context-Id` header.
      #
      #   @return [String]
      required :event_id, String

      # @!attribute http_status
      #   Final HTTP status from your endpoint. `null` when no response was received.
      #
      #   @return [Integer, nil]
      required :http_status, Integer, nil?: true

      # @!attribute status
      #   Outcome of the delivery: `delivered` (2xx response), `rejected` (non-2xx
      #   response), `failed` (no response), or `skipped_unsafe_url` (the URL isn't a safe
      #   public endpoint).
      #
      #   @return [Symbol, ContextDev::Models::WebhookDelivery::Status]
      required :status, enum: -> { ContextDev::WebhookDelivery::Status }

      # @!attribute delivery_id
      #   ID for looking up or retrying this delivery, when available.
      #
      #   @return [String, nil]
      optional :delivery_id, String

      # @!method initialize(attempted_at:, error:, event:, event_id:, http_status:, status:, delivery_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebhookDelivery} for more details.
      #
      #   @param attempted_at [Time] When the delivery was attempted.
      #
      #   @param error [ContextDev::Models::WebhookDelivery::Error, nil]
      #
      #   @param event [Symbol, ContextDev::Models::WebhookDelivery::Event] Event this delivery carried.
      #
      #   @param event_id [String] Event ID, sent in the `X-Context-Id` header.
      #
      #   @param http_status [Integer, nil] Final HTTP status from your endpoint. `null` when no response was received.
      #
      #   @param status [Symbol, ContextDev::Models::WebhookDelivery::Status] Outcome of the delivery: `delivered` (2xx response), `rejected` (non-2xx respons
      #
      #   @param delivery_id [String] ID for looking up or retrying this delivery, when available.

      # @see ContextDev::Models::WebhookDelivery#error
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

      # Event this delivery carried.
      #
      # @see ContextDev::Models::WebhookDelivery#event
      module Event
        extend ContextDev::Internal::Type::Enum

        CHANGE_DETECTED = :"change.detected"
        RUN_COMPLETED = :"run.completed"

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Outcome of the delivery: `delivered` (2xx response), `rejected` (non-2xx
      # response), `failed` (no response), or `skipped_unsafe_url` (the URL isn't a safe
      # public endpoint).
      #
      # @see ContextDev::Models::WebhookDelivery#status
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
