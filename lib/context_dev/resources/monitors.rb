# frozen_string_literal: true

module ContextDev
  module Resources
    # Watch websites for exact or meaningful changes.
    class Monitors
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::MonitorCreateParams} for more details.
      #
      # Watch a page, URL inventory, or extracted website data on a schedule. A run
      # starts immediately to capture the baseline.
      #
      # @overload create(name:, target:, change_detection: nil, mode: nil, schedule: nil, tags: nil, webhook: nil, request_options: {})
      #
      # @param name [String] Display name for the monitor.
      #
      # @param target [ContextDev::Models::MonitorCreateParams::Target::Page, ContextDev::Models::MonitorCreateParams::Target::Sitemap, ContextDev::Models::MonitorCreateParams::Target::Extract] What to watch: a page, a sitemap, or data extracted from a site.
      #
      # @param change_detection [ContextDev::Models::MonitorCreateParams::ChangeDetection::Exact, ContextDev::Models::MonitorCreateParams::ChangeDetection::Semantic] How changes are judged. Defaults to `semantic` for extract targets and page targ
      #
      # @param mode [Symbol, ContextDev::Models::MonitorCreateParams::Mode] Always `web`. Optional.
      #
      # @param schedule [ContextDev::Models::MonitorCreateParams::Schedule] Run the monitor on a fixed interval defined by a frequency and a unit, e.g. ever
      #
      # @param tags [Array<String>] Labels for filtering monitors, their changes, and their usage.
      #
      # @param webhook [ContextDev::Models::MonitorCreateParams::Webhook, nil] Webhook destination and delivery settings. Null means no webhook is configured.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::MonitorCreateResponse]
      #
      # @see ContextDev::Models::MonitorCreateParams
      def create(params)
        parsed, options = ContextDev::MonitorCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "monitors",
          body: parsed,
          model: ContextDev::Models::MonitorCreateResponse,
          options: options
        )
      end

      # Retrieve a monitor’s configuration and current state.
      #
      # @overload retrieve(monitor_id, request_options: {})
      #
      # @param monitor_id [String] ID of the monitor.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::MonitorRetrieveResponse]
      #
      # @see ContextDev::Models::MonitorRetrieveParams
      def retrieve(monitor_id, params = {})
        @client.request(
          method: :get,
          path: ["monitors/%1$s", monitor_id],
          model: ContextDev::Models::MonitorRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::MonitorUpdateParams} for more details.
      #
      # Update a monitor. Changing its target or change detection replaces the baseline
      # and queues a new baseline run.
      #
      # @overload update(monitor_id, change_detection: nil, name: nil, schedule: nil, status: nil, tags: nil, target: nil, webhook: nil, request_options: {})
      #
      # @param monitor_id [String] ID of the monitor.
      #
      # @param change_detection [ContextDev::Models::MonitorUpdateParams::ChangeDetection::Exact, ContextDev::Models::MonitorUpdateParams::ChangeDetection::Semantic] How changes are judged. Defaults to `semantic` for extract targets and page targ
      #
      # @param name [String] Display name for the monitor.
      #
      # @param schedule [ContextDev::Models::MonitorUpdateParams::Schedule] Run the monitor on a fixed interval defined by a frequency and a unit, e.g. ever
      #
      # @param status [Symbol, ContextDev::Models::MonitorUpdateParams::Status] Set `paused` to stop scheduled runs or `active` to resume them.
      #
      # @param tags [Array<String>] Labels for filtering monitors, their changes, and their usage.
      #
      # @param target [ContextDev::Models::MonitorUpdateParams::Target::Page, ContextDev::Models::MonitorUpdateParams::Target::Sitemap, ContextDev::Models::MonitorUpdateParams::Target::Extract] What to watch: a page, a sitemap, or data extracted from a site.
      #
      # @param webhook [ContextDev::Models::MonitorUpdateParams::Webhook, nil] Set to null to remove the webhook. Changing `url` issues a new secret.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::MonitorUpdateResponse]
      #
      # @see ContextDev::Models::MonitorUpdateParams
      def update(monitor_id, params = {})
        parsed, options = ContextDev::MonitorUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["monitors/%1$s", monitor_id],
          body: parsed,
          model: ContextDev::Models::MonitorUpdateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::MonitorListParams} for more details.
      #
      # List your monitors with optional search and filters.
      #
      # @overload list(change_detection_type: nil, cursor: nil, limit: nil, q: nil, search_by: nil, search_type: nil, status: nil, tag: nil, tags: nil, target_type: nil, request_options: {})
      #
      # @param change_detection_type [Symbol, ContextDev::Models::MonitorListParams::ChangeDetectionType] Filter by change detection type.
      #
      # @param cursor [String] Opaque pagination cursor from a previous response.
      #
      # @param limit [Integer] Maximum number of items to return per page (1-100). Defaults to 25.
      #
      # @param q [String] Free-text search term, matched against the fields named in `search_by`.
      #
      # @param search_by [Array<Symbol, ContextDev::Models::MonitorListParams::SearchBy>, nil] Fields to search with `q`. Defaults to all fields; page and extract targets can
      #
      # @param search_type [Symbol, ContextDev::Models::MonitorListParams::SearchType] `prefix` for as-you-type prefix matching (default), `exact` for full-token match
      #
      # @param status [Symbol, ContextDev::Models::MonitorListParams::Status] Filter monitors by lifecycle status.
      #
      # @param tag [String] Filter to items that have this tag.
      #
      # @param tags [Array<String>, nil] Comma-separated list of tags to filter by (matches monitors having any of them).
      #
      # @param target_type [Symbol, ContextDev::Models::MonitorListParams::TargetType] Filter by target type.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::MonitorListResponse]
      #
      # @see ContextDev::Models::MonitorListParams
      def list(params = {})
        parsed, options = ContextDev::MonitorListParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "monitors",
          query: query,
          model: ContextDev::Models::MonitorListResponse,
          options: options
        )
      end

      # Delete a monitor and stop future runs and webhook retries.
      #
      # @overload delete(monitor_id, request_options: {})
      #
      # @param monitor_id [String] ID of the monitor.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::MonitorDeleteResponse]
      #
      # @see ContextDev::Models::MonitorDeleteParams
      def delete(monitor_id, params = {})
        @client.request(
          method: :delete,
          path: ["monitors/%1$s", monitor_id],
          model: ContextDev::Models::MonitorDeleteResponse,
          options: params[:request_options]
        )
      end

      # Return usage per monitor, highest first, for up to the 10,000 most recent runs
      # in the requested window.
      #
      # @overload get_credit_usage(since: nil, until_: nil, request_options: {})
      #
      # @param since [Time] Only include items at or after this ISO 8601 timestamp.
      #
      # @param until_ [Time] Only include items before this ISO 8601 timestamp.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::MonitorGetCreditUsageResponse]
      #
      # @see ContextDev::Models::MonitorGetCreditUsageParams
      def get_credit_usage(params = {})
        parsed, options = ContextDev::MonitorGetCreditUsageParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "monitors/credit-usage",
          query: query.transform_keys(until_: "until"),
          model: ContextDev::Models::MonitorGetCreditUsageResponse,
          options: options
        )
      end

      # Retrieve your organization’s monitor allowance and usage.
      #
      # @overload get_limits(request_options: {})
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::MonitorGetLimitsResponse]
      #
      # @see ContextDev::Models::MonitorGetLimitsParams
      def get_limits(params = {})
        @client.request(
          method: :get,
          path: "monitors/limits",
          model: ContextDev::Models::MonitorGetLimitsResponse,
          options: params[:request_options]
        )
      end

      # List full change records across your monitors, newest first.
      #
      # @overload list_account_changes(change_detection_type: nil, cursor: nil, limit: nil, monitor_id: nil, since: nil, tag: nil, target_type: nil, until_: nil, request_options: {})
      #
      # @param change_detection_type [Symbol, ContextDev::Models::MonitorListAccountChangesParams::ChangeDetectionType] Filter by change detection type.
      #
      # @param cursor [String] Opaque pagination cursor from a previous response.
      #
      # @param limit [Integer] Maximum number of items to return per page (1-100). Defaults to 25.
      #
      # @param monitor_id [String] Filter changes to a single monitor.
      #
      # @param since [Time] Only include items at or after this ISO 8601 timestamp.
      #
      # @param tag [String] Filter to items that have this tag.
      #
      # @param target_type [Symbol, ContextDev::Models::MonitorListAccountChangesParams::TargetType] Filter by target type.
      #
      # @param until_ [Time] Only include items before this ISO 8601 timestamp.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::MonitorListAccountChangesResponse]
      #
      # @see ContextDev::Models::MonitorListAccountChangesParams
      def list_account_changes(params = {})
        parsed, options = ContextDev::MonitorListAccountChangesParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "monitors/changes",
          query: query.transform_keys(until_: "until"),
          model: ContextDev::Models::MonitorListAccountChangesResponse,
          options: options
        )
      end

      # List runs across your monitors, newest first.
      #
      # @overload list_account_runs(cursor: nil, limit: nil, status: nil, request_options: {})
      #
      # @param cursor [String] Opaque pagination cursor from a previous response.
      #
      # @param limit [Integer] Maximum number of items to return per page (1-100). Defaults to 25.
      #
      # @param status [Symbol, ContextDev::Models::MonitorListAccountRunsParams::Status] Filter runs by lifecycle status.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::MonitorListAccountRunsResponse]
      #
      # @see ContextDev::Models::MonitorListAccountRunsParams
      def list_account_runs(params = {})
        parsed, options = ContextDev::MonitorListAccountRunsParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "monitors/runs",
          query: query,
          model: ContextDev::Models::MonitorListAccountRunsResponse,
          options: options
        )
      end

      # List full change records for a monitor, newest first.
      #
      # @overload list_changes(monitor_id, cursor: nil, limit: nil, since: nil, tag: nil, until_: nil, request_options: {})
      #
      # @param monitor_id [String] ID of the monitor.
      #
      # @param cursor [String] Opaque pagination cursor from a previous response.
      #
      # @param limit [Integer] Maximum number of items to return per page (1-100). Defaults to 25.
      #
      # @param since [Time] Only include items at or after this ISO 8601 timestamp.
      #
      # @param tag [String] Filter to items that have this tag.
      #
      # @param until_ [Time] Only include items before this ISO 8601 timestamp.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::MonitorListChangesResponse]
      #
      # @see ContextDev::Models::MonitorListChangesParams
      def list_changes(monitor_id, params = {})
        parsed, options = ContextDev::MonitorListChangesParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["monitors/%1$s/changes", monitor_id],
          query: query.transform_keys(until_: "until"),
          model: ContextDev::Models::MonitorListChangesResponse,
          options: options
        )
      end

      # List a monitor’s runs, newest first.
      #
      # @overload list_runs(monitor_id, cursor: nil, limit: nil, status: nil, request_options: {})
      #
      # @param monitor_id [String] ID of the monitor.
      #
      # @param cursor [String] Opaque pagination cursor from a previous response.
      #
      # @param limit [Integer] Maximum number of items to return per page (1-100). Defaults to 25.
      #
      # @param status [Symbol, ContextDev::Models::MonitorListRunsParams::Status] Filter runs by lifecycle status.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::MonitorListRunsResponse]
      #
      # @see ContextDev::Models::MonitorListRunsParams
      def list_runs(monitor_id, params = {})
        parsed, options = ContextDev::MonitorListRunsParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["monitors/%1$s/runs", monitor_id],
          query: query,
          model: ContextDev::Models::MonitorListRunsResponse,
          options: options
        )
      end

      # Retrieve a detected change, including its diff and available evidence.
      #
      # @overload retrieve_change(change_id, request_options: {})
      #
      # @param change_id [String] ID of the detected change.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::MonitorRetrieveChangeResponse]
      #
      # @see ContextDev::Models::MonitorRetrieveChangeParams
      def retrieve_change(change_id, params = {})
        @client.request(
          method: :get,
          path: ["monitors/changes/%1$s", change_id],
          model: ContextDev::Models::MonitorRetrieveChangeResponse,
          options: params[:request_options]
        )
      end

      # Retrieve the status, timing, and results of one monitor run.
      #
      # @overload retrieve_run(run_id, monitor_id:, request_options: {})
      #
      # @param run_id [String] ID of the monitor run.
      #
      # @param monitor_id [String] ID of the monitor.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::MonitorRetrieveRunResponse]
      #
      # @see ContextDev::Models::MonitorRetrieveRunParams
      def retrieve_run(run_id, params)
        parsed, options = ContextDev::MonitorRetrieveRunParams.dump_request(params)
        monitor_id =
          parsed.delete(:monitor_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :get,
          path: ["monitors/%1$s/runs/%2$s", monitor_id, run_id],
          model: ContextDev::Models::MonitorRetrieveRunResponse,
          options: options
        )
      end

      # Generate and return a new signing secret. It takes effect immediately for all
      # subsequent delivery attempts.
      #
      # @overload rotate_webhook_secret(monitor_id, request_options: {})
      #
      # @param monitor_id [String] ID of the monitor.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::MonitorRotateWebhookSecretResponse]
      #
      # @see ContextDev::Models::MonitorRotateWebhookSecretParams
      def rotate_webhook_secret(monitor_id, params = {})
        @client.request(
          method: :post,
          path: ["monitors/%1$s/webhook/rotate-secret", monitor_id],
          model: ContextDev::Models::MonitorRotateWebhookSecretResponse,
          options: params[:request_options]
        )
      end

      # Queue a run without changing the regular schedule. Paused monitors return 409.
      #
      # @overload run(monitor_id, request_options: {})
      #
      # @param monitor_id [String] ID of the monitor.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::MonitorRunResponse]
      #
      # @see ContextDev::Models::MonitorRunParams
      def run(monitor_id, params = {})
        @client.request(
          method: :post,
          path: ["monitors/%1$s/run", monitor_id],
          model: ContextDev::Models::MonitorRunResponse,
          options: params[:request_options]
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
