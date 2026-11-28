# typed: strong

module ContextDev
  module Resources
    class Webhooks
      # Inspect and retry batch and monitor webhook deliveries.
      class Deliveries
        # Retrieve a webhook delivery's status, retry settings, and most recent attempt.
        sig do
          params(
            delivery_id: String,
            tags: T::Array[String],
            request_options: ContextDev::RequestOptions::OrHash
          ).returns(ContextDev::Models::Webhooks::DeliveryRetrieveResponse)
        end
        def retrieve(
          # ID of the delivery.
          delivery_id,
          # Comma-separated labels for this request, such as `production,team-alpha`. Filter
          # usage and request logs by them.
          tags: nil,
          request_options: {}
        )
        end

        # List webhook deliveries for your batches or monitors from the last 30 days,
        # newest first. Filter by source, status, or creation time.
        sig do
          params(
            body:
              T.any(
                ContextDev::Webhooks::DeliveryListParams::Body::Batch::OrHash,
                ContextDev::Webhooks::DeliveryListParams::Body::Monitor::OrHash
              ),
            request_options: ContextDev::RequestOptions::OrHash
          ).returns(ContextDev::Models::Webhooks::DeliveryListResponse)
        end
        def list(body:, request_options: {})
        end

        # List a webhook delivery's attempts, newest first.
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
          # ID of the delivery.
          delivery_id,
          # Cursor from the previous page's `next_cursor`. Omit for the first page.
          cursor: nil,
          # Maximum number of attempts to return per page.
          limit: nil,
          # Comma-separated labels for this request, such as `production,team-alpha`. Filter
          # usage and request logs by them.
          tags: nil,
          request_options: {}
        )
        end

        # Resend a delivery's original payload to the source's current webhook URL, signed
        # with its current secret. Available for 7 days after the event.
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
          # Path param: ID of the delivery.
          delivery_id,
          # Body param: Resend even if the delivery already succeeded.
          force: nil,
          # Body param: Labels for this request. Filter usage and request logs by them in
          # the dashboard or with `GET /org/logs`.
          tags: nil,
          # Header param: Unique key for this retry. Repeating the request with the same key
          # does not send the payload again.
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
