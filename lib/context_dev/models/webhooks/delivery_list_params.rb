# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      # @see ContextDev::Resources::Webhooks::Deliveries#list
      class DeliveryListParams < ContextDev::Internal::Type::BaseModel
        extend ContextDev::Internal::Type::RequestParameters::Converter
        include ContextDev::Internal::Type::RequestParameters

        # @!attribute body
        #
        #   @return [ContextDev::Models::Webhooks::DeliveryListParams::Body::Batch, ContextDev::Models::Webhooks::DeliveryListParams::Body::Monitor]
        required :body, union: -> { ContextDev::Webhooks::DeliveryListParams::Body }

        # @!method initialize(body:, request_options: {})
        #   @param body [ContextDev::Models::Webhooks::DeliveryListParams::Body::Batch, ContextDev::Models::Webhooks::DeliveryListParams::Body::Monitor]
        #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

        module Body
          extend ContextDev::Internal::Type::Union

          discriminator :type

          variant :batch, -> { ContextDev::Webhooks::DeliveryListParams::Body::Batch }

          variant :monitor, -> { ContextDev::Webhooks::DeliveryListParams::Body::Monitor }

          class Batch < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #   Delivery source.
            #
            #   @return [Symbol, :batch]
            required :type, const: :batch

            # @!attribute batch_id
            #   Filter by batch ID.
            #
            #   @return [String, nil]
            optional :batch_id, String

            # @!attribute created_after
            #   Only include events created after this ISO 8601 timestamp.
            #
            #   @return [Time, nil]
            optional :created_after, Time

            # @!attribute cursor
            #   The next_cursor from the previous response.
            #
            #   @return [String, nil]
            optional :cursor, String

            # @!attribute limit
            #   Number of deliveries to return.
            #
            #   @return [Integer, nil]
            optional :limit, Integer

            # @!attribute status
            #   Filter by delivery status.
            #
            #   @return [Symbol, ContextDev::Models::Webhooks::DeliveryListParams::Body::Batch::Status, nil]
            optional :status, enum: -> { ContextDev::Webhooks::DeliveryListParams::Body::Batch::Status }

            # @!attribute tags
            #   Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
            #
            #   @return [Array<String>, nil]
            optional :tags, ContextDev::Internal::Type::ArrayOf[String]

            # @!method initialize(batch_id: nil, created_after: nil, cursor: nil, limit: nil, status: nil, tags: nil, type: :batch)
            #   @param batch_id [String] Filter by batch ID.
            #
            #   @param created_after [Time] Only include events created after this ISO 8601 timestamp.
            #
            #   @param cursor [String] The next_cursor from the previous response.
            #
            #   @param limit [Integer] Number of deliveries to return.
            #
            #   @param status [Symbol, ContextDev::Models::Webhooks::DeliveryListParams::Body::Batch::Status] Filter by delivery status.
            #
            #   @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
            #
            #   @param type [Symbol, :batch] Delivery source.

            # Filter by delivery status.
            #
            # @see ContextDev::Models::Webhooks::DeliveryListParams::Body::Batch#status
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

          class Monitor < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #   Delivery source.
            #
            #   @return [Symbol, :monitor]
            required :type, const: :monitor

            # @!attribute created_after
            #   Only include events created after this ISO 8601 timestamp.
            #
            #   @return [Time, nil]
            optional :created_after, Time

            # @!attribute cursor
            #   The next_cursor from the previous response.
            #
            #   @return [String, nil]
            optional :cursor, String

            # @!attribute limit
            #   Number of deliveries to return.
            #
            #   @return [Integer, nil]
            optional :limit, Integer

            # @!attribute monitor_id
            #   Filter by monitor ID.
            #
            #   @return [String, nil]
            optional :monitor_id, String

            # @!attribute run_id
            #   Filter by monitor run ID.
            #
            #   @return [String, nil]
            optional :run_id, String

            # @!attribute status
            #   Filter by delivery status.
            #
            #   @return [Symbol, ContextDev::Models::Webhooks::DeliveryListParams::Body::Monitor::Status, nil]
            optional :status, enum: -> { ContextDev::Webhooks::DeliveryListParams::Body::Monitor::Status }

            # @!attribute tags
            #   Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
            #
            #   @return [Array<String>, nil]
            optional :tags, ContextDev::Internal::Type::ArrayOf[String]

            # @!method initialize(created_after: nil, cursor: nil, limit: nil, monitor_id: nil, run_id: nil, status: nil, tags: nil, type: :monitor)
            #   @param created_after [Time] Only include events created after this ISO 8601 timestamp.
            #
            #   @param cursor [String] The next_cursor from the previous response.
            #
            #   @param limit [Integer] Number of deliveries to return.
            #
            #   @param monitor_id [String] Filter by monitor ID.
            #
            #   @param run_id [String] Filter by monitor run ID.
            #
            #   @param status [Symbol, ContextDev::Models::Webhooks::DeliveryListParams::Body::Monitor::Status] Filter by delivery status.
            #
            #   @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
            #
            #   @param type [Symbol, :monitor] Delivery source.

            # Filter by delivery status.
            #
            # @see ContextDev::Models::Webhooks::DeliveryListParams::Body::Monitor#status
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

          # @!method self.variants
          #   @return [Array(ContextDev::Models::Webhooks::DeliveryListParams::Body::Batch, ContextDev::Models::Webhooks::DeliveryListParams::Body::Monitor)]
        end
      end
    end
  end
end
