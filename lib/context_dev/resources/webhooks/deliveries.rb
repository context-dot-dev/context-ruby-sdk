# frozen_string_literal: true

module ContextDev
  module Resources
    class Webhooks
      # Inspect and retry webhook deliveries. These endpoints cost no credits.
      class Deliveries
        # Some parameter documentations has been truncated, see
        # {ContextDev::Models::Webhooks::DeliveryRetrieveParams} for more details.
        #
        # Get a webhook delivery, including its status and latest attempt.
        #
        # @overload retrieve(delivery_id, tags: nil, request_options: {})
        #
        # @param delivery_id [String] Delivery ID.
        #
        # @param tags [Array<String>] Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50 charac
        #
        # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ContextDev::Models::Webhooks::DeliveryRetrieveResponse]
        #
        # @see ContextDev::Models::Webhooks::DeliveryRetrieveParams
        def retrieve(delivery_id, params = {})
          parsed, options = ContextDev::Webhooks::DeliveryRetrieveParams.dump_request(params)
          query = ContextDev::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["webhooks/deliveries/%1$s", delivery_id],
            query: query,
            model: ContextDev::Models::Webhooks::DeliveryRetrieveResponse,
            options: options
          )
        end

        # List your batch or monitor webhook deliveries, newest first.
        #
        # @overload list(body:, request_options: {})
        #
        # @param body [ContextDev::Models::Webhooks::DeliveryListParams::Body::Batch, ContextDev::Models::Webhooks::DeliveryListParams::Body::Monitor]
        # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ContextDev::Models::Webhooks::DeliveryListResponse]
        #
        # @see ContextDev::Models::Webhooks::DeliveryListParams
        def list(params)
          parsed, options = ContextDev::Webhooks::DeliveryListParams.dump_request(params)
          @client.request(
            method: :post,
            path: "webhooks/deliveries",
            body: parsed[:body],
            model: ContextDev::Models::Webhooks::DeliveryListResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {ContextDev::Models::Webhooks::DeliveryListAttemptsParams} for more details.
        #
        # List delivery attempts, newest first.
        #
        # @overload list_attempts(delivery_id, cursor: nil, limit: nil, tags: nil, request_options: {})
        #
        # @param delivery_id [String] Delivery ID.
        #
        # @param cursor [String] The next_cursor from the previous response.
        #
        # @param limit [Integer] Number of attempts to return.
        #
        # @param tags [Array<String>] Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50 charac
        #
        # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ContextDev::Models::Webhooks::DeliveryListAttemptsResponse]
        #
        # @see ContextDev::Models::Webhooks::DeliveryListAttemptsParams
        def list_attempts(delivery_id, params = {})
          parsed, options = ContextDev::Webhooks::DeliveryListAttemptsParams.dump_request(params)
          query = ContextDev::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["webhooks/deliveries/%1$s/attempts", delivery_id],
            query: query,
            model: ContextDev::Models::Webhooks::DeliveryListAttemptsResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {ContextDev::Models::Webhooks::DeliveryRetryParams} for more details.
        #
        # Retry a webhook delivery within seven days of creation.
        #
        # @overload retry_(delivery_id, force: nil, tags: nil, idempotency_key: nil, request_options: {})
        #
        # @param delivery_id [String] Path param: Delivery ID.
        #
        # @param force [Boolean] Body param: Resend a delivery that already succeeded.
        #
        # @param tags [Array<String>] Body param: Optional tags for tracking usage. Up to 20 tags, each 1 to 50 charac
        #
        # @param idempotency_key [String] Header param: Unique key to prevent duplicate retry requests.
        #
        # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ContextDev::Models::Webhooks::DeliveryRetryResponse]
        #
        # @see ContextDev::Models::Webhooks::DeliveryRetryParams
        def retry_(delivery_id, params = {})
          parsed, options = ContextDev::Webhooks::DeliveryRetryParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key"}
          @client.request(
            method: :post,
            path: ["webhooks/deliveries/%1$s/retry", delivery_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: ContextDev::Models::Webhooks::DeliveryRetryResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [ContextDev::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
