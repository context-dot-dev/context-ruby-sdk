# frozen_string_literal: true

require_relative "../test_helper"

class ContextDev::Test::Resources::MonitorsTest < ContextDev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @context_dev.monitors.create(
        body: {
          change_detection: {type: :exact},
          name: "Acme pricing page",
          schedule: {frequency: 6, type: :interval, unit: :hours},
          target: {type: :page, url: "https://acme.com/pricing"}
        }
      )

    assert_pattern do
      response => ContextDev::Models::MonitorCreateResponse
    end

    assert_pattern do
      case response
      in ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor
      in ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor
      in ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor
      in ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor
      end
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @context_dev.monitors.retrieve("mon_123")

    assert_pattern do
      response => ContextDev::Models::MonitorRetrieveResponse
    end

    assert_pattern do
      case response
      in ContextDev::Models::MonitorRetrieveResponse::MonitorsPageExactMonitor
      in ContextDev::Models::MonitorRetrieveResponse::MonitorsSitemapExactMonitor
      in ContextDev::Models::MonitorRetrieveResponse::MonitorsPageSemanticMonitor
      in ContextDev::Models::MonitorRetrieveResponse::MonitorsExtractSemanticMonitor
      end
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @context_dev.monitors.update("mon_123")

    assert_pattern do
      response => ContextDev::Models::MonitorUpdateResponse
    end

    assert_pattern do
      case response
      in ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor
      in ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor
      in ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor
      in ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor
      end
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
        data: ^(ContextDev::Internal::Type::ArrayOf[union: ContextDev::Models::MonitorListResponse::Data]),
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

  def test_list_account_changes
    skip("Mock server tests are disabled")

    response = @context_dev.monitors.list_account_changes

    assert_pattern do
      response => ContextDev::Models::MonitorListAccountChangesResponse
    end

    assert_pattern do
      response => {
        data: ^(ContextDev::Internal::Type::ArrayOf[union: ContextDev::Models::MonitorListAccountChangesResponse::Data]),
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
        data: ^(ContextDev::Internal::Type::ArrayOf[union: ContextDev::Models::MonitorListChangesResponse::Data]),
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
      case response
      in ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange
      in ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange
      in ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange
      in ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange
      end
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
        queued: ContextDev::Internal::Type::Boolean
      }
    end
  end
end
