# frozen_string_literal: true

module ContextDev
  module Resources
    class Webhooks
      # Inspect and retry batch and monitor webhook deliveries.
      class Deliveries
        # Retrieve a webhook delivery’s status and original payload.
        #
        # @overload retrieve(delivery_id, tags: nil, request_options: {})
        #
        # @param delivery_id [String] Delivery ID.
        #
        # @param tags [Array<String>] Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
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

        # List batch and monitor webhook deliveries from the last 30 days.
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

        # List a delivery’s attempts, newest first.
        #
        # @overload list_attempts(delivery_id, cursor: nil, limit: nil, tags: nil, request_options: {})
        #
        # @param delivery_id [String] Delivery ID.
        #
        # @param cursor [String] The next_cursor from the previous response.
        #
        # @param limit [Integer] Number of attempts to return.
        #
        # @param tags [Array<String>] Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
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

        # Resend the original payload using the source’s current URL and secret. Available
        # for 7 days after the event.
        #
        # @overload retry_(delivery_id, force: nil, tags: nil, idempotency_key: nil, request_options: {})
        #
        # @param delivery_id [String] Path param: Delivery ID.
        #
        # @param force [Boolean] Body param: Resend even if the delivery already succeeded. Defaults to false.
        #
        # @param tags [Array<String>] Body param: Labels for filtering usage in the dashboard.
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
