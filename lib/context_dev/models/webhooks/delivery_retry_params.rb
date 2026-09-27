# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      # @see ContextDev::Resources::Webhooks::Deliveries#retry_
      class DeliveryRetryParams < ContextDev::Internal::Type::BaseModel
        extend ContextDev::Internal::Type::RequestParameters::Converter
        include ContextDev::Internal::Type::RequestParameters

        # @!attribute delivery_id
        #   Delivery ID.
        #
        #   @return [String]
        required :delivery_id, String

        # @!attribute force
        #   Resend even if the delivery already succeeded. Defaults to false.
        #
        #   @return [Boolean, nil]
        optional :force, ContextDev::Internal::Type::Boolean

        # @!attribute tags
        #   Labels for filtering usage in the dashboard.
        #
        #   @return [Array<String>, nil]
        optional :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute idempotency_key
        #   Unique key to prevent duplicate retry requests.
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!method initialize(delivery_id:, force: nil, tags: nil, idempotency_key: nil, request_options: {})
        #   @param delivery_id [String] Delivery ID.
        #
        #   @param force [Boolean] Resend even if the delivery already succeeded. Defaults to false.
        #
        #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
        #
        #   @param idempotency_key [String] Unique key to prevent duplicate retry requests.
        #
        #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
