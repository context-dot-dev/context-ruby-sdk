# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      # @see ContextDev::Resources::Webhooks::Deliveries#list_attempts
      class DeliveryListAttemptsParams < ContextDev::Internal::Type::BaseModel
        extend ContextDev::Internal::Type::RequestParameters::Converter
        include ContextDev::Internal::Type::RequestParameters

        # @!attribute delivery_id
        #   Delivery ID.
        #
        #   @return [String]
        required :delivery_id, String

        # @!attribute cursor
        #   The next_cursor from the previous response.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute limit
        #   Number of attempts to return.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute tags
        #   Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
        #
        #   @return [Array<String>, nil]
        optional :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!method initialize(delivery_id:, cursor: nil, limit: nil, tags: nil, request_options: {})
        #   @param delivery_id [String] Delivery ID.
        #
        #   @param cursor [String] The next_cursor from the previous response.
        #
        #   @param limit [Integer] Number of attempts to return.
        #
        #   @param tags [Array<String>] Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
        #
        #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
