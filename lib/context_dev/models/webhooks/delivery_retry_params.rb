# frozen_string_literal: true

module ContextDev
  module Models
    module Webhooks
      # @see ContextDev::Resources::Webhooks::Deliveries#retry_
      class DeliveryRetryParams < ContextDev::Internal::Type::BaseModel
        extend ContextDev::Internal::Type::RequestParameters::Converter
        include ContextDev::Internal::Type::RequestParameters

        # @!attribute delivery_id
        #   ID of the delivery.
        #
        #   @return [String]
        required :delivery_id, String

        # @!attribute force
        #   Resend even if the delivery already succeeded.
        #
        #   @return [Boolean, nil]
        optional :force, ContextDev::Internal::Type::Boolean

        # @!attribute tags
        #   Labels for this request. Filter usage and request logs by them in the dashboard
        #   or with `GET /org/logs`.
        #
        #   @return [Array<String>, nil]
        optional :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute idempotency_key
        #   Unique key for this retry. Repeating the request with the same key does not send
        #   the payload again.
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!method initialize(delivery_id:, force: nil, tags: nil, idempotency_key: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::Webhooks::DeliveryRetryParams} for more details.
        #
        #   @param delivery_id [String] ID of the delivery.
        #
        #   @param force [Boolean] Resend even if the delivery already succeeded.
        #
        #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
        #
        #   @param idempotency_key [String] Unique key for this retry. Repeating the request with the same key does not send
        #
        #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
