# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      # @see ContextDev::Resources::Webhooks::Deliveries#retrieve
      class DeliveryRetrieveParams < ContextDev::Internal::Type::BaseModel
        extend ContextDev::Internal::Type::RequestParameters::Converter
        include ContextDev::Internal::Type::RequestParameters

        # @!attribute delivery_id
        #
        #   @return [String]
        required :delivery_id, String

        # @!attribute tags
        #   Optional comma-separated caller-defined tags for tracking this request. Tags are
        #   recorded on the request's usage log and can be used to filter usage on the
        #   dashboard usage page. Up to 20 tags, each 1-50 characters.
        #
        #   @return [Array<String>, nil]
        optional :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!method initialize(delivery_id:, tags: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::Webhooks::DeliveryRetrieveParams} for more details.
        #
        #   @param delivery_id [String]
        #
        #   @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
        #
        #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
