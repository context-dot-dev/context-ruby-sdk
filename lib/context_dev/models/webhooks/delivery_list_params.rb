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
            #   List batch webhook deliveries.
            #
            #   @return [Symbol, :batch]
            required :type, const: :batch

            # @!attribute batch_id
            #   Filter by batch ID.
            #
            #   @return [String, nil]
            optional :batch_id, String

            # @!attribute created_after
            #   Only include deliveries created after this time.
            #
            #   @return [Time, nil]
            optional :created_after, Time

            # @!attribute cursor
            #   Cursor from the previous page's `next_cursor`. Omit for the first page.
            #
            #   @return [String, nil]
            optional :cursor, String

            # @!attribute limit
            #   Maximum number of deliveries to return per page.
            #
            #   @return [Integer, nil]
            optional :limit, Integer

            # @!attribute status
            #   Filter by delivery status.
            #
            #   @return [Symbol, ContextDev::Models::Webhooks::DeliveryListParams::Body::Batch::Status, nil]
            optional :status, enum: -> { ContextDev::Webhooks::DeliveryListParams::Body::Batch::Status }

            # @!attribute tags
            #   Labels for this request. Filter usage and request logs by them in the dashboard
            #   or with `GET /org/logs`.
            #
            #   @return [Array<String>, nil]
            optional :tags, ContextDev::Internal::Type::ArrayOf[String]

            # @!method initialize(batch_id: nil, created_after: nil, cursor: nil, limit: nil, status: nil, tags: nil, type: :batch)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::Webhooks::DeliveryListParams::Body::Batch} for more
            #   details.
            #
            #   @param batch_id [String] Filter by batch ID.
            #
            #   @param created_after [Time] Only include deliveries created after this time.
            #
            #   @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
            #
            #   @param limit [Integer] Maximum number of deliveries to return per page.
            #
            #   @param status [Symbol, ContextDev::Models::Webhooks::DeliveryListParams::Body::Batch::Status] Filter by delivery status.
            #
            #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
            #
            #   @param type [Symbol, :batch] List batch webhook deliveries.

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
            #   List monitor webhook deliveries.
            #
            #   @return [Symbol, :monitor]
            required :type, const: :monitor

            # @!attribute created_after
            #   Only include deliveries created after this time.
            #
            #   @return [Time, nil]
            optional :created_after, Time

            # @!attribute cursor
            #   Cursor from the previous page's `next_cursor`. Omit for the first page.
            #
            #   @return [String, nil]
            optional :cursor, String

            # @!attribute limit
            #   Maximum number of deliveries to return per page.
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
            #   Labels for this request. Filter usage and request logs by them in the dashboard
            #   or with `GET /org/logs`.
            #
            #   @return [Array<String>, nil]
            optional :tags, ContextDev::Internal::Type::ArrayOf[String]

            # @!method initialize(created_after: nil, cursor: nil, limit: nil, monitor_id: nil, run_id: nil, status: nil, tags: nil, type: :monitor)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::Webhooks::DeliveryListParams::Body::Monitor} for more
            #   details.
            #
            #   @param created_after [Time] Only include deliveries created after this time.
            #
            #   @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
            #
            #   @param limit [Integer] Maximum number of deliveries to return per page.
            #
            #   @param monitor_id [String] Filter by monitor ID.
            #
            #   @param run_id [String] Filter by monitor run ID.
            #
            #   @param status [Symbol, ContextDev::Models::Webhooks::DeliveryListParams::Body::Monitor::Status] Filter by delivery status.
            #
            #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
            #
            #   @param type [Symbol, :monitor] List monitor webhook deliveries.

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
