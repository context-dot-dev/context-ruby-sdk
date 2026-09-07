# typed: strong

module ContextDev
  module Resources
    class Webhooks
      # Inspect and retry batch and monitor webhook deliveries without rerunning the
      # underlying work.
      class Deliveries
        # Get the live status, retry policy, latest attempt, and replay expiration for a
        # retained delivery. Use the attempts endpoint for its complete paginated history.
        # This endpoint costs no credits.
        sig do
          params(
            delivery_id: String,
            tags: T::Array[String],
            request_options: ContextDev::RequestOptions::OrHash
          ).returns(ContextDev::Models::Webhooks::DeliveryRetrieveResponse)
        end
        def retrieve(
          delivery_id,
          # Optional comma-separated caller-defined tags for tracking this request. Tags are
          # recorded on the request's usage log and can be used to filter usage on the
          # dashboard usage page. Up to 20 tags, each 1-50 characters.
          tags: nil,
          request_options: {}
        )
        end

        # List retained batch and monitor webhook deliveries for your organization, newest
        # first. Filter by at most one of batch_id, monitor_id, or run_id, optionally
        # combined with status. Historical events without retained payloads are not
        # listed. This endpoint costs no credits.
        sig do
          params(
            batch_id: String,
            cursor: String,
            limit: Integer,
            monitor_id: String,
            run_id: String,
            status: ContextDev::Webhooks::DeliveryListParams::Status::OrSymbol,
            tags: T::Array[String],
            request_options: ContextDev::RequestOptions::OrHash
          ).returns(ContextDev::Models::Webhooks::DeliveryListResponse)
        end
        def list(
          batch_id: nil,
          cursor: nil,
          limit: nil,
          monitor_id: nil,
          run_id: nil,
          status: nil,
          # Optional comma-separated caller-defined tags for tracking this request. Tags are
          # recorded on the request's usage log and can be used to filter usage on the
          # dashboard usage page. Up to 20 tags, each 1-50 characters.
          tags: nil,
          request_options: {}
        )
        end

        # List individual HTTP attempts for a delivery, newest first, including their
        # destination, timestamps, HTTP status, and error. An interrupted attempt may have
        # reached the endpoint even when its outcome is unknown. This endpoint costs no
        # credits.
        sig do
          params(
            delivery_id: String,
            cursor: String,
            limit: Integer,
            tags: T::Array[String],
            request_options: ContextDev::RequestOptions::OrHash
          ).returns(ContextDev::Models::Webhooks::DeliveryListAttemptsResponse)
        end
        def list_attempts(
          delivery_id,
          cursor: nil,
          limit: nil,
          # Optional comma-separated caller-defined tags for tracking this request. Tags are
          # recorded on the request's usage log and can be used to filter usage on the
          # dashboard usage page. Up to 20 tags, each 1-50 characters.
          tags: nil,
          request_options: {}
        )
        end

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
        sig do
          params(
            delivery_id: String,
            force: T::Boolean,
            tags: T::Array[String],
            idempotency_key: String,
            request_options: ContextDev::RequestOptions::OrHash
          ).returns(ContextDev::Models::Webhooks::DeliveryRetryResponse)
        end
        def retry_(
          # Path param
          delivery_id,
          # Body param
          force: nil,
          # Body param: Optional tags for tracking usage. Up to 20 tags, each 1 to 50
          # characters.
          tags: nil,
          # Header param
          idempotency_key: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: ContextDev::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
