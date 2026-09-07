# frozen_string_literal: true

module ContextDev
  module Resources
    class Webhooks
      # Inspect and retry batch and monitor webhook deliveries without rerunning the
      # underlying work.
      class Deliveries
        # Some parameter documentations has been truncated, see
        # {ContextDev::Models::Webhooks::DeliveryRetrieveParams} for more details.
        #
        # Get the live status, retry policy, latest attempt, and replay expiration for a
        # retained delivery. Use the attempts endpoint for its complete paginated history.
        # This endpoint costs no credits.
        #
        # @overload retrieve(delivery_id, tags: nil, request_options: {})
        #
        # @param delivery_id [String]
        #
        # @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
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

        # Some parameter documentations has been truncated, see
        # {ContextDev::Models::Webhooks::DeliveryListParams} for more details.
        #
        # List retained batch and monitor webhook deliveries for your organization, newest
        # first. Filter by at most one of batch_id, monitor_id, or run_id, optionally
        # combined with status. Historical events without retained payloads are not
        # listed. This endpoint costs no credits.
        #
        # @overload list(batch_id: nil, cursor: nil, limit: nil, monitor_id: nil, run_id: nil, status: nil, tags: nil, request_options: {})
        #
        # @param batch_id [String]
        #
        # @param cursor [String]
        #
        # @param limit [Integer]
        #
        # @param monitor_id [String]
        #
        # @param run_id [String]
        #
        # @param status [Symbol, ContextDev::Models::Webhooks::DeliveryListParams::Status]
        #
        # @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
        #
        # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ContextDev::Models::Webhooks::DeliveryListResponse]
        #
        # @see ContextDev::Models::Webhooks::DeliveryListParams
        def list(params = {})
          parsed, options = ContextDev::Webhooks::DeliveryListParams.dump_request(params)
          query = ContextDev::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "webhooks/deliveries",
            query: query,
            model: ContextDev::Models::Webhooks::DeliveryListResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {ContextDev::Models::Webhooks::DeliveryListAttemptsParams} for more details.
        #
        # List individual HTTP attempts for a delivery, newest first, including their
        # destination, timestamps, HTTP status, and error. An interrupted attempt may have
        # reached the endpoint even when its outcome is unknown. This endpoint costs no
        # credits.
        #
        # @overload list_attempts(delivery_id, cursor: nil, limit: nil, tags: nil, request_options: {})
        #
        # @param delivery_id [String]
        #
        # @param cursor [String]
        #
        # @param limit [Integer]
        #
        # @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
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
        # Queue an immediate attempt without rerunning or billing the underlying batch or
        # monitor. A waiting retry is brought forward. A failed delivery gets one
        # additional attempt without restarting its automatic retry budget. Set force:
        # true to resend an acknowledged delivery. An in-progress attempt cannot be
        # duplicated. The stored event body, event ID, and creation time remain unchanged;
        # each attempt receives a fresh signature. Monitor retries use the current URL and
        # secret; removing the webhook cancels pending deliveries. Batch result URLs in
        # old payloads may have expired: retrieve the batch to get fresh URLs. Replay is
        # available for seven days. A successful attempt cancels remaining automatic
        # retries. Idempotency-Key is scoped to your organization and retained with the
        # delivery metadata; repeating the same key and input returns the original
        # accepted response.
        #
        # @overload retry_(delivery_id, force: nil, tags: nil, idempotency_key: nil, request_options: {})
        #
        # @param delivery_id [String] Path param
        #
        # @param force [Boolean] Body param
        #
        # @param tags [Array<String>] Body param: Optional tags for tracking usage. Up to 20 tags, each 1 to 50 charac
        #
        # @param idempotency_key [String] Header param
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
