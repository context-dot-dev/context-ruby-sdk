# frozen_string_literal: true

module ContextDev
  module Resources
    # Watch websites on a schedule for exact or meaningful changes.
    class Monitors
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::MonitorCreateParams} for more details.
      #
      # Watch a web page, a sitemap, data extracted from a site, or web search results
      # on a schedule, and get a webhook when something changes. Creating a monitor
      # queues its baseline run right away.
      #
      # @overload create(name:, target:, change_detection: nil, mode: nil, policies: nil, schedule: nil, tags: nil, webhook: nil, request_options: {})
      #
      # @param name [String] Display name for the monitor.
      #
      # @param target [ContextDev::Models::MonitorCreateParams::Target::Page, ContextDev::Models::MonitorCreateParams::Target::Sitemap, ContextDev::Models::MonitorCreateParams::Target::Extract, ContextDev::Models::MonitorCreateParams::Target::Search] What to watch: a page, a sitemap, data extracted from a site, or web search resu
      #
      # @param change_detection [ContextDev::Models::MonitorCreateParams::ChangeDetection::Exact, ContextDev::Models::MonitorCreateParams::ChangeDetection::Semantic] How changes are judged. Defaults to `semantic` for extract and search targets an
      #
      # @param mode [Symbol, ContextDev::Models::MonitorCreateParams::Mode] Monitor category. Always `web`.
      #
      # @param policies [Array<String>] Access policy IDs to apply to every run. Requires access policies enabled for yo
      #
      # @param schedule [ContextDev::Models::MonitorCreateParams::Schedule] Run the monitor at a fixed interval, such as every 6 hours or every 2 days. The
      #
      # @param tags [Array<String>] Labels for grouping monitors. Filter monitors, changes, and credit usage by tag.
      #
      # @param webhook [ContextDev::Models::MonitorCreateParams::Webhook, nil] Webhook that receives monitor events. `null` when no webhook is configured.
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

      # Retrieve a monitor's configuration, status, and current baseline.
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
      # Change a monitor's settings, or pause and resume it. Changing the target or
      # change detection replaces the baseline and queues a new baseline run.
      #
      # @overload update(monitor_id, change_detection: nil, name: nil, policies: nil, schedule: nil, status: nil, tags: nil, target: nil, webhook: nil, request_options: {})
      #
      # @param monitor_id [String] ID of the monitor.
      #
      # @param change_detection [ContextDev::Models::MonitorUpdateParams::ChangeDetection::Exact, ContextDev::Models::MonitorUpdateParams::ChangeDetection::Semantic] How changes are judged. Defaults to `semantic` for extract and search targets an
      #
      # @param name [String] Display name for the monitor.
      #
      # @param policies [Array<String>] Access policy IDs to apply to every run, or an empty list to remove them. Requir
      #
      # @param schedule [ContextDev::Models::MonitorUpdateParams::Schedule] Run the monitor at a fixed interval, such as every 6 hours or every 2 days. The
      #
      # @param status [Symbol, ContextDev::Models::MonitorUpdateParams::Status] Set `paused` to stop scheduled runs or `active` to resume them. A resumed monito
      #
      # @param tags [Array<String>] Labels for grouping monitors. Filter monitors, changes, and credit usage by tag.
      #
      # @param target [ContextDev::Models::MonitorUpdateParams::Target::Page, ContextDev::Models::MonitorUpdateParams::Target::Sitemap, ContextDev::Models::MonitorUpdateParams::Target::Extract, ContextDev::Models::MonitorUpdateParams::Target::Search] What to watch: a page, a sitemap, data extracted from a site, or web search resu
      #
      # @param webhook [ContextDev::Models::MonitorUpdateParams::Webhook, nil] Set to `null` to remove the webhook. Changing `url` generates a new secret.
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
      # List your monitors, newest first. Search by name, URL, or instructions, and
      # filter by status, target type, detection type, or tags.
      #
      # @overload list(change_detection_type: nil, cursor: nil, limit: nil, q: nil, search_by: nil, search_type: nil, status: nil, tags: nil, target_type: nil, request_options: {})
      #
      # @param change_detection_type [Symbol, ContextDev::Models::MonitorListParams::ChangeDetectionType] Filter by change detection type.
      #
      # @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      # @param limit [Integer] Maximum number of monitors to return per page. Defaults to 25.
      #
      # @param q [String] Text to search for in the fields listed in `search_by`.
      #
      # @param search_by [Array<Symbol, ContextDev::Models::MonitorListParams::SearchBy>, nil] Comma-separated fields to search with `q`. Defaults to all fields. For search ta
      #
      # @param search_type [Symbol, ContextDev::Models::MonitorListParams::SearchType] How `q` matches. `prefix` matches the start of words and tolerates one typo, for
      #
      # @param status [Symbol, ContextDev::Models::MonitorListParams::Status] Filter by monitor status.
      #
      # @param tags [Array<String>, nil] Comma-separated tags. Returns monitors that have any of them.
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

      # Delete a monitor along with its runs, changes, and baseline. Future runs and
      # pending webhook retries stop.
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

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::MonitorGetCreditUsageParams} for more details.
      #
      # List credits charged per monitor, highest first, from up to the 10,000 most
      # recent runs in the time window. Pass `tag` to report on one group of monitors,
      # such as a single customer's.
      #
      # @overload get_credit_usage(since: nil, tag: nil, until_: nil, request_options: {})
      #
      # @param since [Time] Count only runs created at or after this time.
      #
      # @param tag [String] Return usage only for monitors that currently have this tag. Deleted monitors ar
      #
      # @param until_ [Time] Count only runs created at or before this time.
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

      # Retrieve how many monitors your organization has and how many your plan allows.
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

      # List detected changes across all your monitors, newest first. Filter by monitor,
      # target type, detection type, tag, or time range.
      #
      # @overload list_account_changes(change_detection_type: nil, cursor: nil, limit: nil, monitor_id: nil, since: nil, tag: nil, target_type: nil, until_: nil, request_options: {})
      #
      # @param change_detection_type [Symbol, ContextDev::Models::MonitorListAccountChangesParams::ChangeDetectionType] Filter by change detection type.
      #
      # @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      # @param limit [Integer] Maximum number of changes to return per page. Defaults to 25.
      #
      # @param monitor_id [String] Return only changes from this monitor.
      #
      # @param since [Time] Return only changes detected at or after this time.
      #
      # @param tag [String] Return only changes that have this tag.
      #
      # @param target_type [Symbol, ContextDev::Models::MonitorListAccountChangesParams::TargetType] Filter by target type.
      #
      # @param until_ [Time] Return only changes detected at or before this time.
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

      # List runs across all your monitors, newest first.
      #
      # @overload list_account_runs(cursor: nil, limit: nil, status: nil, request_options: {})
      #
      # @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      # @param limit [Integer] Maximum number of runs to return per page. Defaults to 25.
      #
      # @param status [Symbol, ContextDev::Models::MonitorListAccountRunsParams::Status] Filter by run status.
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

      # List a monitor's detected changes, newest first. Each change includes its full
      # diff and evidence.
      #
      # @overload list_changes(monitor_id, cursor: nil, limit: nil, since: nil, tag: nil, until_: nil, request_options: {})
      #
      # @param monitor_id [String] ID of the monitor.
      #
      # @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      # @param limit [Integer] Maximum number of changes to return per page. Defaults to 25.
      #
      # @param since [Time] Return only changes detected at or after this time.
      #
      # @param tag [String] Return only changes that have this tag.
      #
      # @param until_ [Time] Return only changes detected at or before this time.
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

      # List a monitor's runs, newest first.
      #
      # @overload list_runs(monitor_id, cursor: nil, limit: nil, status: nil, request_options: {})
      #
      # @param monitor_id [String] ID of the monitor.
      #
      # @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      # @param limit [Integer] Maximum number of runs to return per page. Defaults to 25.
      #
      # @param status [Symbol, ContextDev::Models::MonitorListRunsParams::Status] Filter by run status.
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

      # Retrieve a detected change with its summary, diff, URLs, and evidence.
      #
      # @overload retrieve_change(change_id, request_options: {})
      #
      # @param change_id [String] ID of the change.
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

      # Retrieve a run's status, timing, credit charge, and webhook deliveries. If the
      # run found a change, `change_id` points to it.
      #
      # @overload retrieve_run(run_id, monitor_id:, request_options: {})
      #
      # @param run_id [String] ID of the run.
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

      # Replace the monitor's webhook signing secret. The new secret signs every
      # delivery attempt from now on, including retries.
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

      # Queue a run now without changing the monitor's schedule. Returns the run ID to
      # poll. Paused monitors return `409`.
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
