# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      # @see ContextDev::Resources::Webhooks::Deliveries#retry_
      class DeliveryRetryParams < ContextDev::Internal::Type::BaseModel
        extend ContextDev::Internal::Type::RequestParameters::Converter
        include ContextDev::Internal::Type::RequestParameters

        # @!attribute delivery_id
        #
        #   @return [String]
        required :delivery_id, String

        # @!attribute force
        #
        #   @return [Boolean, nil]
        optional :force, ContextDev::Internal::Type::Boolean

        # @!attribute tags
        #   Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
        #
        #   @return [Array<String>, nil]
        optional :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!method initialize(delivery_id:, force: nil, tags: nil, idempotency_key: nil, request_options: {})
        #   @param delivery_id [String]
        #
        #   @param force [Boolean]
        #
        #   @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
        #
        #   @param idempotency_key [String]
        #
        #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
