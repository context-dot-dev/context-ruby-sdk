# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      # @see ContextDev::Resources::Webhooks::Deliveries#retrieve
      class DeliveryRetrieveParams < ContextDev::Internal::Type::BaseModel
        extend ContextDev::Internal::Type::RequestParameters::Converter
        include ContextDev::Internal::Type::RequestParameters

        # @!attribute delivery_id
        #   Delivery ID.
        #
        #   @return [String]
        required :delivery_id, String

        # @!attribute tags
        #   Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
        #
        #   @return [Array<String>, nil]
        optional :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!method initialize(delivery_id:, tags: nil, request_options: {})
        #   @param delivery_id [String] Delivery ID.
        #
        #   @param tags [Array<String>] Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
        #
        #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
