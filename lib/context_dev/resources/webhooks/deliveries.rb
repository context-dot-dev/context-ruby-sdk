# frozen_string_literal: true

module ContextDev
  module Resources
    class Webhooks
      # Inspect and retry batch and monitor webhook deliveries.
      class Deliveries
        # Some parameter documentations has been truncated, see
        # {ContextDev::Models::Webhooks::DeliveryRetrieveParams} for more details.
        #
        # Retrieve a webhook delivery's status, retry settings, and most recent attempt.
        #
        # @overload retrieve(delivery_id, tags: nil, request_options: {})
        #
        # @param delivery_id [String] ID of the delivery.
        #
        # @param tags [Array<String>] Comma-separated labels for this request, such as `production,team-alpha`. Filter
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

        # List webhook deliveries for your batches or monitors from the last 30 days,
        # newest first. Filter by source, status, or creation time.
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
        # List a webhook delivery's attempts, newest first.
        #
        # @overload list_attempts(delivery_id, cursor: nil, limit: nil, tags: nil, request_options: {})
        #
        # @param delivery_id [String] ID of the delivery.
        #
        # @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
        #
        # @param limit [Integer] Maximum number of attempts to return per page.
        #
        # @param tags [Array<String>] Comma-separated labels for this request, such as `production,team-alpha`. Filter
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
        # Resend a delivery's original payload to the source's current webhook URL, signed
        # with its current secret. Available for 7 days after the event.
        #
        # @overload retry_(delivery_id, force: nil, tags: nil, idempotency_key: nil, request_options: {})
        #
        # @param delivery_id [String] Path param: ID of the delivery.
        #
        # @param force [Boolean] Body param: Resend even if the delivery already succeeded.
        #
        # @param tags [Array<String>] Body param: Labels for this request. Filter usage and request logs by them in th
        #
        # @param idempotency_key [String] Header param: Unique key for this retry. Repeating the request with the same key
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
