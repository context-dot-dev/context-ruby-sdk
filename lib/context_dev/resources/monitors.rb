# frozen_string_literal: true

module ContextDev
  module Resources
    # Monitor pages, sitemaps, and extracted website data for exact or semantic
    # changes. Webhook payloads are documented by the
    # MonitorsChangeDetectedWebhookPayload and MonitorsRunCompletedWebhookPayload
    # schemas.
    class Monitors
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::MonitorCreateParams} for more details.
      #
      # Creates a monitor. The request body is a union of the supported target/change
      # detection combinations. The monitor runs immediately after creation to create
      # its initial baseline.
      #
      # @overload create(name:, target:, change_detection: nil, mode: nil, schedule: nil, tags: nil, webhook: nil, request_options: {})
      #
      # @param name [String]
      #
      # @param target [ContextDev::Models::MonitorCreateParams::Target::Page, ContextDev::Models::MonitorCreateParams::Target::Sitemap, ContextDev::Models::MonitorCreateParams::Target::Extract] Discriminated union describing what the monitor watches.
      #
      # @param change_detection [ContextDev::Models::MonitorCreateParams::ChangeDetection::Exact, ContextDev::Models::MonitorCreateParams::ChangeDetection::Semantic] Discriminated union describing how changes are detected.
      #
      # @param mode [Symbol, ContextDev::Models::MonitorCreateParams::Mode] Top-level monitor category. Always `web` today; the concrete behavior is describ
      #
      # @param schedule [ContextDev::Models::MonitorCreateParams::Schedule] Run the monitor on a fixed interval defined by a frequency and a unit, e.g. ever
      #
      # @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes. Duplica
      #
      # @param webhook [ContextDev::Models::MonitorCreateParams::Webhook, nil]
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

      # Get a monitor
      #
      # @overload retrieve(monitor_id, request_options: {})
      #
      # @param monitor_id [String]
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
      # Updates a monitor. If `target` or `change_detection` changes, the monitor
      # creates a new baseline. Unsupported target/change detection combinations are
      # rejected.
      #
      # @overload update(monitor_id, change_detection: nil, name: nil, schedule: nil, status: nil, tags: nil, target: nil, webhook: nil, request_options: {})
      #
      # @param monitor_id [String]
      #
      # @param change_detection [ContextDev::Models::MonitorUpdateParams::ChangeDetection::Exact, ContextDev::Models::MonitorUpdateParams::ChangeDetection::Semantic] Discriminated union describing how changes are detected.
      #
      # @param name [String]
      #
      # @param schedule [ContextDev::Models::MonitorUpdateParams::Schedule] Run the monitor on a fixed interval defined by a frequency and a unit, e.g. ever
      #
      # @param status [Symbol, ContextDev::Models::MonitorUpdateParams::Status]
      #
      # @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes. Duplica
      #
      # @param target [ContextDev::Models::MonitorUpdateParams::Target::Page, ContextDev::Models::MonitorUpdateParams::Target::Sitemap, ContextDev::Models::MonitorUpdateParams::Target::Extract] Discriminated union describing what the monitor watches.
      #
      # @param webhook [ContextDev::Models::MonitorUpdateParams::Webhook, nil] Set to null to remove the webhook.
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
      # Lists monitors for the authenticated organization. Supports free-text search
      # (`q` over `search_by` fields, `prefix` or `exact` via `search_type`) plus
      # status/type/tag filters. Results are paginated via the opaque `cursor`.
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
      # @param search_by [Array<Symbol, ContextDev::Models::MonitorListParams::SearchBy>, nil] Comma-separated fields to search with `q`. Defaults to all of them. Note `instru
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

      # Delete a monitor
      #
      # @overload delete(monitor_id, request_options: {})
      #
      # @param monitor_id [String]
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

      # Returns credits charged per monitor over an optional [since, until] window,
      # newest spenders first.
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

      # Returns how many monitors the account has and the maximum it allows.
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

      # Returns an account-wide feed of detected changes across monitors.
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

      # Returns an account-wide feed of monitor runs across all monitors.
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

      # List changes for a monitor
      #
      # @overload list_changes(monitor_id, cursor: nil, limit: nil, since: nil, tag: nil, until_: nil, request_options: {})
      #
      # @param monitor_id [String]
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

      # List monitor runs
      #
      # @overload list_runs(monitor_id, cursor: nil, limit: nil, status: nil, request_options: {})
      #
      # @param monitor_id [String]
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

      # Get a change
      #
      # @overload retrieve_change(change_id, request_options: {})
      #
      # @param change_id [String]
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

      # Fetches one run for a monitor, including lifecycle status, timing, credits
      # charged, and any detected change.
      #
      # @overload retrieve_run(run_id, monitor_id:, request_options: {})
      #
      # @param run_id [String]
      # @param monitor_id [String]
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

      # Generates a new signing secret for the monitor's webhook and returns the updated
      # monitor (including the new `webhook.secret`). The previous secret stops signing
      # deliveries immediately, so update your endpoint before rotating.
      #
      # @overload rotate_webhook_secret(monitor_id, request_options: {})
      #
      # @param monitor_id [String]
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

      # Triggers an immediate run of the monitor outside its normal schedule. The run is
      # queued and processed asynchronously.
      #
      # @overload run(monitor_id, request_options: {})
      #
      # @param monitor_id [String]
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
