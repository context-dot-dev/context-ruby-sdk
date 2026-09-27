# typed: strong

module ContextDev
  module Resources
    class Webhooks
      # Inspect and retry batch and monitor webhook deliveries.
      class Deliveries
        # Retrieve a webhook delivery’s status and original payload.
        sig do
          params(
            delivery_id: String,
            tags: T::Array[String],
            request_options: ContextDev::RequestOptions::OrHash
          ).returns(ContextDev::Models::Webhooks::DeliveryRetrieveResponse)
        end
        def retrieve(
          # Delivery ID.
          delivery_id,
          # Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
          tags: nil,
          request_options: {}
        )
        end

        # List batch and monitor webhook deliveries from the last 30 days.
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

        # List a delivery’s attempts, newest first.
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
          # Delivery ID.
          delivery_id,
          # The next_cursor from the previous response.
          cursor: nil,
          # Number of attempts to return.
          limit: nil,
          # Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
          tags: nil,
          request_options: {}
        )
        end

        # Resend the original payload using the source’s current URL and secret. Available
        # for 7 days after the event.
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
          # Path param: Delivery ID.
          delivery_id,
          # Body param: Resend even if the delivery already succeeded. Defaults to false.
          force: nil,
          # Body param: Labels for filtering usage in the dashboard.
          tags: nil,
          # Header param: Unique key to prevent duplicate retry requests.
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
