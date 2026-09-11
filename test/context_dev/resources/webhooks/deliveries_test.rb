# frozen_string_literal: true

require_relative "../../test_helper"

class ContextDev::Test::Resources::Webhooks::DeliveriesTest < ContextDev::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @context_dev.webhooks.deliveries.retrieve("whd_210b9798eb53baa4e69d31c1071cf03d")

    assert_pattern do
      response => ContextDev::Models::Webhooks::DeliveryRetrieveResponse
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.webhooks.deliveries.list(body: {type: :batch})

    assert_pattern do
      response => ContextDev::Models::Webhooks::DeliveryListResponse
    end

    assert_pattern do
      response => {
        data: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Webhooks::DeliverySummary]),
        has_more: ContextDev::Internal::Type::Boolean,
        next_cursor: String | nil,
        request_id: String,
        key_metadata: ContextDev::Models::Webhooks::DeliveryListResponse::KeyMetadata | nil
      }
    end
  end

  def test_list_attempts
    skip("Mock server tests are disabled")

    response = @context_dev.webhooks.deliveries.list_attempts("whd_210b9798eb53baa4e69d31c1071cf03d")

    assert_pattern do
      response => ContextDev::Models::Webhooks::DeliveryListAttemptsResponse
    end

    assert_pattern do
      response => {
        data: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Webhooks::Attempt]),
        has_more: ContextDev::Internal::Type::Boolean,
        next_cursor: String | nil,
        request_id: String,
        key_metadata: ContextDev::Models::Webhooks::DeliveryListAttemptsResponse::KeyMetadata | nil
      }
    end
  end

  def test_retry_
    skip("Mock server tests are disabled")

    response = @context_dev.webhooks.deliveries.retry_("whd_210b9798eb53baa4e69d31c1071cf03d")

    assert_pattern do
      response => ContextDev::Models::Webhooks::DeliveryRetryResponse
    end

    assert_pattern do
      response => {
        id: String,
        request_id: String,
        key_metadata: ContextDev::Models::Webhooks::DeliveryRetryResponse::KeyMetadata | nil
      }
    end
  end
end
