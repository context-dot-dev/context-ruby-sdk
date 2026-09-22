# frozen_string_literal: true

require_relative "../test_helper"

class ContextDev::Test::Resources::MonitorsTest < ContextDev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @context_dev.monitors.create(
        name: "Acme pricing page",
        target: {type: :page, url: "https://acme.com/pricing"}
      )

    assert_pattern do
      response => ContextDev::Models::MonitorCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        change_detection: ContextDev::Models::MonitorCreateResponse::ChangeDetection,
        created_at: Time,
        initial_run_id: String | nil,
        mode: ContextDev::Models::MonitorCreateResponse::Mode,
        name: String,
        schedule: ContextDev::Models::MonitorCreateResponse::Schedule,
        status: ContextDev::Models::MonitorCreateResponse::Status,
        target: ContextDev::Models::MonitorCreateResponse::Target,
        updated_at: Time,
        baseline: ContextDev::Models::MonitorCreateResponse::Baseline | nil,
        last_change_at: Time | nil,
        last_error: ContextDev::Models::MonitorCreateResponse::LastError | nil,
        last_run_at: Time | nil,
        next_run_at: Time | nil,
        tags: ^(ContextDev::Internal::Type::ArrayOf[String]) | nil,
        webhook: ContextDev::Models::MonitorCreateResponse::Webhook | nil,
        webhook_failure: ContextDev::Models::MonitorCreateResponse::WebhookFailure | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @context_dev.monitors.retrieve("mon_123")

    assert_pattern do
      response => ContextDev::Models::MonitorRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String,
        change_detection: ContextDev::Models::MonitorRetrieveResponse::ChangeDetection,
        created_at: Time,
        mode: ContextDev::Models::MonitorRetrieveResponse::Mode,
        name: String,
        schedule: ContextDev::Models::MonitorRetrieveResponse::Schedule,
        status: ContextDev::Models::MonitorRetrieveResponse::Status,
        target: ContextDev::Models::MonitorRetrieveResponse::Target,
        updated_at: Time,
        baseline: ContextDev::Models::MonitorRetrieveResponse::Baseline | nil,
        last_change_at: Time | nil,
        last_error: ContextDev::Models::MonitorRetrieveResponse::LastError | nil,
        last_run_at: Time | nil,
        next_run_at: Time | nil,
        tags: ^(ContextDev::Internal::Type::ArrayOf[String]) | nil,
        webhook: ContextDev::Models::MonitorRetrieveResponse::Webhook | nil,
        webhook_failure: ContextDev::Models::MonitorRetrieveResponse::WebhookFailure | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @context_dev.monitors.update("mon_123")

    assert_pattern do
      response => ContextDev::Models::MonitorUpdateResponse
    end

    assert_pattern do
      response => {
        id: String,
        change_detection: ContextDev::Models::MonitorUpdateResponse::ChangeDetection,
        created_at: Time,
        mode: ContextDev::Models::MonitorUpdateResponse::Mode,
        name: String,
        schedule: ContextDev::Models::MonitorUpdateResponse::Schedule,
        status: ContextDev::Models::MonitorUpdateResponse::Status,
        target: ContextDev::Models::MonitorUpdateResponse::Target,
        updated_at: Time,
        baseline: ContextDev::Models::MonitorUpdateResponse::Baseline | nil,
        last_change_at: Time | nil,
        last_error: ContextDev::Models::MonitorUpdateResponse::LastError | nil,
        last_run_at: Time | nil,
        next_run_at: Time | nil,
        tags: ^(ContextDev::Internal::Type::ArrayOf[String]) | nil,
        webhook: ContextDev::Models::MonitorUpdateResponse::Webhook | nil,
        webhook_failure: ContextDev::Models::MonitorUpdateResponse::WebhookFailure | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @context_dev.monitors.list

    assert_pattern do
      response => ContextDev::Models::MonitorListResponse
    end

    assert_pattern do
      response => {
        data: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorListResponse::Data]),
        has_more: ContextDev::Internal::Type::Boolean,
        next_cursor: String | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @context_dev.monitors.delete("mon_123")

    assert_pattern do
      response => ContextDev::Models::MonitorDeleteResponse
    end

    assert_pattern do
      response => {
        id: String,
        deleted: ContextDev::Internal::Type::Boolean
      }
    end
  end

  def test_get_credit_usage
    skip("Mock server tests are disabled")

    response = @context_dev.monitors.get_credit_usage

    assert_pattern do
      response => ContextDev::Models::MonitorGetCreditUsageResponse
    end

    assert_pattern do
      response => {
        data: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorGetCreditUsageResponse::Data]),
        total_credits: Integer
      }
    end
  end

  def test_get_limits
    skip("Mock server tests are disabled")

    response = @context_dev.monitors.get_limits

    assert_pattern do
      response => ContextDev::Models::MonitorGetLimitsResponse
    end

    assert_pattern do
      response => {
        monitors_limit: Integer,
        monitors_used: Integer,
        plan: ContextDev::Models::MonitorGetLimitsResponse::Plan
      }
    end
  end

  def test_list_account_changes
    skip("Mock server tests are disabled")

    response = @context_dev.monitors.list_account_changes

    assert_pattern do
      response => ContextDev::Models::MonitorListAccountChangesResponse
    end

    assert_pattern do
      response => {
        data: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorListAccountChangesResponse::Data]),
        has_more: ContextDev::Internal::Type::Boolean,
        next_cursor: String | nil
      }
    end
  end

  def test_list_account_runs
    skip("Mock server tests are disabled")

    response = @context_dev.monitors.list_account_runs

    assert_pattern do
      response => ContextDev::Models::MonitorListAccountRunsResponse
    end

    assert_pattern do
      response => {
        data: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorListAccountRunsResponse::Data]),
        has_more: ContextDev::Internal::Type::Boolean,
        next_cursor: String | nil
      }
    end
  end

  def test_list_changes
    skip("Mock server tests are disabled")

    response = @context_dev.monitors.list_changes("mon_123")

    assert_pattern do
      response => ContextDev::Models::MonitorListChangesResponse
    end

    assert_pattern do
      response => {
        data: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorListChangesResponse::Data]),
        has_more: ContextDev::Internal::Type::Boolean,
        next_cursor: String | nil
      }
    end
  end

  def test_list_runs
    skip("Mock server tests are disabled")

    response = @context_dev.monitors.list_runs("mon_123")

    assert_pattern do
      response => ContextDev::Models::MonitorListRunsResponse
    end

    assert_pattern do
      response => {
        data: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorListRunsResponse::Data]),
        has_more: ContextDev::Internal::Type::Boolean,
        next_cursor: String | nil
      }
    end
  end

  def test_retrieve_change
    skip("Mock server tests are disabled")

    response = @context_dev.monitors.retrieve_change("chg_123")

    assert_pattern do
      response => ContextDev::Models::MonitorRetrieveChangeResponse
    end

    assert_pattern do
      response => {
        id: String,
        change_detection_type: ContextDev::Models::MonitorRetrieveChangeResponse::ChangeDetectionType,
        detected_at: Time,
        mode: ContextDev::Models::MonitorRetrieveChangeResponse::Mode,
        monitor_id: String,
        run_id: String,
        summary: String,
        tags: ^(ContextDev::Internal::Type::ArrayOf[String]),
        target_type: ContextDev::Models::MonitorRetrieveChangeResponse::TargetType,
        title: String,
        url: String,
        added_url_count: Integer | nil,
        added_urls: ^(ContextDev::Internal::Type::ArrayOf[String]) | nil,
        after_text_excerpt: String | nil,
        before_text_excerpt: String | nil,
        confidence: Float | nil,
        diff: String | nil,
        evidence: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorRetrieveChangeResponse::Evidence]) | nil,
        importance: ContextDev::Models::MonitorRetrieveChangeResponse::Importance | nil,
        matched_url_count: Integer | nil,
        matched_urls: ^(ContextDev::Internal::Type::ArrayOf[String]) | nil,
        removed_url_count: Integer | nil,
        removed_urls: ^(ContextDev::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_retrieve_run_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.monitors.retrieve_run("run_123", monitor_id: "mon_123")

    assert_pattern do
      response => ContextDev::Models::MonitorRetrieveRunResponse
    end

    assert_pattern do
      response => {
        id: String,
        baseline_created: ContextDev::Internal::Type::Boolean,
        change_detected: ContextDev::Internal::Type::Boolean,
        change_detection_type: ContextDev::Models::MonitorRetrieveRunResponse::ChangeDetectionType,
        credits_charged: Integer,
        monitor_id: String,
        run_type: ContextDev::Models::MonitorRetrieveRunResponse::RunType,
        status: ContextDev::Models::MonitorRetrieveRunResponse::Status,
        target_type: ContextDev::Models::MonitorRetrieveRunResponse::TargetType,
        change_id: String | nil,
        completed_at: Time | nil,
        error: ContextDev::Models::MonitorRetrieveRunResponse::Error | nil,
        skip_reason: ContextDev::Models::MonitorRetrieveRunResponse::SkipReason | nil,
        started_at: Time | nil,
        webhook_deliveries: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::WebhookDelivery]) | nil,
        webhook_delivery: ContextDev::WebhookDelivery | nil,
        webhook_delivery_ids: ^(ContextDev::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_rotate_webhook_secret
    skip("Mock server tests are disabled")

    response = @context_dev.monitors.rotate_webhook_secret("mon_123")

    assert_pattern do
      response => ContextDev::Models::MonitorRotateWebhookSecretResponse
    end

    assert_pattern do
      response => {
        id: String,
        change_detection: ContextDev::Models::MonitorRotateWebhookSecretResponse::ChangeDetection,
        created_at: Time,
        mode: ContextDev::Models::MonitorRotateWebhookSecretResponse::Mode,
        name: String,
        schedule: ContextDev::Models::MonitorRotateWebhookSecretResponse::Schedule,
        status: ContextDev::Models::MonitorRotateWebhookSecretResponse::Status,
        target: ContextDev::Models::MonitorRotateWebhookSecretResponse::Target,
        updated_at: Time,
        baseline: ContextDev::Models::MonitorRotateWebhookSecretResponse::Baseline | nil,
        last_change_at: Time | nil,
        last_error: ContextDev::Models::MonitorRotateWebhookSecretResponse::LastError | nil,
        last_run_at: Time | nil,
        next_run_at: Time | nil,
        tags: ^(ContextDev::Internal::Type::ArrayOf[String]) | nil,
        webhook: ContextDev::Models::MonitorRotateWebhookSecretResponse::Webhook | nil,
        webhook_failure: ContextDev::Models::MonitorRotateWebhookSecretResponse::WebhookFailure | nil
      }
    end
  end

  def test_run
    skip("Mock server tests are disabled")

    response = @context_dev.monitors.run("mon_123")

    assert_pattern do
      response => ContextDev::Models::MonitorRunResponse
    end

    assert_pattern do
      response => {
        monitor_id: String,
        queued: ContextDev::Internal::Type::Boolean,
        run_id: String
      }
    end
  end
end
