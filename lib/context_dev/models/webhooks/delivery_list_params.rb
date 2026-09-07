# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      # @see ContextDev::Resources::Webhooks::Deliveries#list
      class DeliveryListParams < ContextDev::Internal::Type::BaseModel
        extend ContextDev::Internal::Type::RequestParameters::Converter
        include ContextDev::Internal::Type::RequestParameters

        # @!attribute batch_id
        #
        #   @return [String, nil]
        optional :batch_id, String

        # @!attribute cursor
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute limit
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute monitor_id
        #
        #   @return [String, nil]
        optional :monitor_id, String

        # @!attribute run_id
        #
        #   @return [String, nil]
        optional :run_id, String

        # @!attribute status
        #
        #   @return [Symbol, ContextDev::Models::Webhooks::DeliveryListParams::Status, nil]
        optional :status, enum: -> { ContextDev::Webhooks::DeliveryListParams::Status }

        # @!attribute tags
        #   Optional comma-separated caller-defined tags for tracking this request. Tags are
        #   recorded on the request's usage log and can be used to filter usage on the
        #   dashboard usage page. Up to 20 tags, each 1-50 characters.
        #
        #   @return [Array<String>, nil]
        optional :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!method initialize(batch_id: nil, cursor: nil, limit: nil, monitor_id: nil, run_id: nil, status: nil, tags: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::Webhooks::DeliveryListParams} for more details.
        #
        #   @param batch_id [String]
        #
        #   @param cursor [String]
        #
        #   @param limit [Integer]
        #
        #   @param monitor_id [String]
        #
        #   @param run_id [String]
        #
        #   @param status [Symbol, ContextDev::Models::Webhooks::DeliveryListParams::Status]
        #
        #   @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
        #
        #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

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
