# typed: strong

module ContextDev
  module Resources
    class Webhooks
      # Inspect and retry webhook deliveries. These endpoints cost no credits.
      class Deliveries
        # Get a webhook delivery, including its status and latest attempt.
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
          # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
          # characters.
          tags: nil,
          request_options: {}
        )
        end

        # List your batch or monitor webhook deliveries, newest first.
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

        # List delivery attempts, newest first.
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
          # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
          # characters.
          tags: nil,
          request_options: {}
        )
        end

        # Retry a webhook delivery within seven days of creation.
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
          # Body param: Resend a delivery that already succeeded.
          force: nil,
          # Body param: Optional tags for tracking usage. Up to 20 tags, each 1 to 50
          # characters.
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
