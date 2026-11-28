# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      # @see ContextDev::Resources::Webhooks::Deliveries#list_attempts
      class DeliveryListAttemptsParams < ContextDev::Internal::Type::BaseModel
        extend ContextDev::Internal::Type::RequestParameters::Converter
        include ContextDev::Internal::Type::RequestParameters

        # @!attribute delivery_id
        #   ID of the delivery.
        #
        #   @return [String]
        required :delivery_id, String

        # @!attribute cursor
        #   Cursor from the previous page's `next_cursor`. Omit for the first page.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute limit
        #   Maximum number of attempts to return per page.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute tags
        #   Comma-separated labels for this request, such as `production,team-alpha`. Filter
        #   usage and request logs by them.
        #
        #   @return [Array<String>, nil]
        optional :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!method initialize(delivery_id:, cursor: nil, limit: nil, tags: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::Webhooks::DeliveryListAttemptsParams} for more details.
        #
        #   @param delivery_id [String] ID of the delivery.
        #
        #   @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
        #
        #   @param limit [Integer] Maximum number of attempts to return per page.
        #
        #   @param tags [Array<String>] Comma-separated labels for this request, such as `production,team-alpha`. Filter
        #
        #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
