# typed: strong

module ContextDev
  module Resources
    # Watch websites on a schedule for exact or meaningful changes.
    class Monitors
      # Watch a web page, a sitemap, data extracted from a site, or web search results
      # on a schedule, and get a webhook when something changes. Creating a monitor
      # queues its baseline run right away.
      sig do
        params(
          name: String,
          target:
            T.any(
              ContextDev::MonitorCreateParams::Target::Page::OrHash,
              ContextDev::MonitorCreateParams::Target::Sitemap::OrHash,
              ContextDev::MonitorCreateParams::Target::Extract::OrHash,
              ContextDev::MonitorCreateParams::Target::Search::OrHash
            ),
          change_detection:
            T.any(
              ContextDev::MonitorCreateParams::ChangeDetection::Exact::OrHash,
              ContextDev::MonitorCreateParams::ChangeDetection::Semantic::OrHash
            ),
          mode: ContextDev::MonitorCreateParams::Mode::OrSymbol,
          policies: T::Array[String],
          schedule: ContextDev::MonitorCreateParams::Schedule::OrHash,
          tags: T::Array[String],
          webhook: T.nilable(ContextDev::MonitorCreateParams::Webhook::OrHash),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorCreateResponse)
      end
      def create(
        # Display name for the monitor.
        name:,
        # What to watch: a page, a sitemap, data extracted from a site, or web search
        # results.
        target:,
        # How changes are judged. Defaults to `semantic` for extract and search targets
        # and for page targets with `instructions`; otherwise `exact`. Sitemap targets
        # support only `exact`, and extract targets only `semantic`.
        change_detection: nil,
        # Monitor category. Always `web`.
        mode: nil,
        # Access policy IDs to apply to every run. Requires access policies enabled for
        # your organization; otherwise returns `ACCESS_POLICIES_NOT_ENABLED`.
        policies: nil,
        # Run the monitor at a fixed interval, such as every 6 hours or every 2 days. The
        # interval must be between 10 minutes and 1 year.
        schedule: nil,
        # Labels for grouping monitors. Filter monitors, changes, and credit usage by tag.
        tags: nil,
        # Webhook that receives monitor events. `null` when no webhook is configured.
        webhook: nil,
        request_options: {}
      )
      end

      # Retrieve a monitor's configuration, status, and current baseline.
      sig do
        params(
          monitor_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorRetrieveResponse)
      end
      def retrieve(
        # ID of the monitor.
        monitor_id,
        request_options: {}
      )
      end

      # Change a monitor's settings, or pause and resume it. Changing the target or
      # change detection replaces the baseline and queues a new baseline run.
      sig do
        params(
          monitor_id: String,
          change_detection:
            T.any(
              ContextDev::MonitorUpdateParams::ChangeDetection::Exact::OrHash,
              ContextDev::MonitorUpdateParams::ChangeDetection::Semantic::OrHash
            ),
          name: String,
          policies: T::Array[String],
          schedule: ContextDev::MonitorUpdateParams::Schedule::OrHash,
          status: ContextDev::MonitorUpdateParams::Status::OrSymbol,
          tags: T::Array[String],
          target:
            T.any(
              ContextDev::MonitorUpdateParams::Target::Page::OrHash,
              ContextDev::MonitorUpdateParams::Target::Sitemap::OrHash,
              ContextDev::MonitorUpdateParams::Target::Extract::OrHash,
              ContextDev::MonitorUpdateParams::Target::Search::OrHash
            ),
          webhook: T.nilable(ContextDev::MonitorUpdateParams::Webhook::OrHash),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorUpdateResponse)
      end
      def update(
        # ID of the monitor.
        monitor_id,
        # How changes are judged. Defaults to `semantic` for extract and search targets
        # and for page targets with `instructions`; otherwise `exact`. Sitemap targets
        # support only `exact`, and extract targets only `semantic`.
        change_detection: nil,
        # Display name for the monitor.
        name: nil,
        # Access policy IDs to apply to every run, or an empty list to remove them.
        # Requires access policies enabled for your organization; otherwise returns
        # `ACCESS_POLICIES_NOT_ENABLED`.
        policies: nil,
        # Run the monitor at a fixed interval, such as every 6 hours or every 2 days. The
        # interval must be between 10 minutes and 1 year.
        schedule: nil,
        # Set `paused` to stop scheduled runs or `active` to resume them. A resumed
        # monitor runs promptly instead of waiting a full interval.
        status: nil,
        # Labels for grouping monitors. Filter monitors, changes, and credit usage by tag.
        tags: nil,
        # What to watch: a page, a sitemap, data extracted from a site, or web search
        # results.
        target: nil,
        # Set to `null` to remove the webhook. Changing `url` generates a new secret.
        webhook: nil,
        request_options: {}
      )
      end

      # List your monitors, newest first. Search by name, URL, or instructions, and
      # filter by status, target type, detection type, or tags.
      sig do
        params(
          change_detection_type:
            ContextDev::MonitorListParams::ChangeDetectionType::OrSymbol,
          cursor: String,
          limit: Integer,
          q: String,
          search_by:
            T.nilable(
              T::Array[ContextDev::MonitorListParams::SearchBy::OrSymbol]
            ),
          search_type: ContextDev::MonitorListParams::SearchType::OrSymbol,
          status: ContextDev::MonitorListParams::Status::OrSymbol,
          tags: T.nilable(T::Array[String]),
          target_type: ContextDev::MonitorListParams::TargetType::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorListResponse)
      end
      def list(
        # Filter by change detection type.
        change_detection_type: nil,
        # Cursor from the previous page's `next_cursor`. Omit for the first page.
        cursor: nil,
        # Maximum number of monitors to return per page. Defaults to 25.
        limit: nil,
        # Text to search for in the fields listed in `search_by`.
        q: nil,
        # Comma-separated fields to search with `q`. Defaults to all fields. For search
        # targets, `url` matches the target's `query`.
        search_by: nil,
        # How `q` matches. `prefix` matches the start of words and tolerates one typo, for
        # search as you type; `exact` matches whole words only. Defaults to `prefix`.
        search_type: nil,
        # Filter by monitor status.
        status: nil,
        # Comma-separated tags. Returns monitors that have any of them.
        tags: nil,
        # Filter by target type.
        target_type: nil,
        request_options: {}
      )
      end

      # Delete a monitor along with its runs, changes, and baseline. Future runs and
      # pending webhook retries stop.
      sig do
        params(
          monitor_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorDeleteResponse)
      end
      def delete(
        # ID of the monitor.
        monitor_id,
        request_options: {}
      )
      end

      # List credits charged per monitor, highest first, from up to the 10,000 most
      # recent runs in the time window. Pass `tag` to report on one group of monitors,
      # such as a single customer's.
      sig do
        params(
          since: Time,
          tag: String,
          until_: Time,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorGetCreditUsageResponse)
      end
      def get_credit_usage(
        # Count only runs created at or after this time.
        since: nil,
        # Return usage only for monitors that currently have this tag. Deleted monitors
        # are excluded.
        tag: nil,
        # Count only runs created at or before this time.
        until_: nil,
        request_options: {}
      )
      end

      # Retrieve how many monitors your organization has and how many your plan allows.
      sig do
        params(request_options: ContextDev::RequestOptions::OrHash).returns(
          ContextDev::Models::MonitorGetLimitsResponse
        )
      end
      def get_limits(request_options: {})
      end

      # List detected changes across all your monitors, newest first. Filter by monitor,
      # target type, detection type, tag, or time range.
      sig do
        params(
          change_detection_type:
            ContextDev::MonitorListAccountChangesParams::ChangeDetectionType::OrSymbol,
          cursor: String,
          limit: Integer,
          monitor_id: String,
          since: Time,
          tag: String,
          target_type:
            ContextDev::MonitorListAccountChangesParams::TargetType::OrSymbol,
          until_: Time,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorListAccountChangesResponse)
      end
      def list_account_changes(
        # Filter by change detection type.
        change_detection_type: nil,
        # Cursor from the previous page's `next_cursor`. Omit for the first page.
        cursor: nil,
        # Maximum number of changes to return per page. Defaults to 25.
        limit: nil,
        # Return only changes from this monitor.
        monitor_id: nil,
        # Return only changes detected at or after this time.
        since: nil,
        # Return only changes that have this tag.
        tag: nil,
        # Filter by target type.
        target_type: nil,
        # Return only changes detected at or before this time.
        until_: nil,
        request_options: {}
      )
      end

      # List runs across all your monitors, newest first.
      sig do
        params(
          cursor: String,
          limit: Integer,
          status: ContextDev::MonitorListAccountRunsParams::Status::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorListAccountRunsResponse)
      end
      def list_account_runs(
        # Cursor from the previous page's `next_cursor`. Omit for the first page.
        cursor: nil,
        # Maximum number of runs to return per page. Defaults to 25.
        limit: nil,
        # Filter by run status.
        status: nil,
        request_options: {}
      )
      end

      # List a monitor's detected changes, newest first. Each change includes its full
      # diff and evidence.
      sig do
        params(
          monitor_id: String,
          cursor: String,
          limit: Integer,
          since: Time,
          tag: String,
          until_: Time,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorListChangesResponse)
      end
      def list_changes(
        # ID of the monitor.
        monitor_id,
        # Cursor from the previous page's `next_cursor`. Omit for the first page.
        cursor: nil,
        # Maximum number of changes to return per page. Defaults to 25.
        limit: nil,
        # Return only changes detected at or after this time.
        since: nil,
        # Return only changes that have this tag.
        tag: nil,
        # Return only changes detected at or before this time.
        until_: nil,
        request_options: {}
      )
      end

      # List a monitor's runs, newest first.
      sig do
        params(
          monitor_id: String,
          cursor: String,
          limit: Integer,
          status: ContextDev::MonitorListRunsParams::Status::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorListRunsResponse)
      end
      def list_runs(
        # ID of the monitor.
        monitor_id,
        # Cursor from the previous page's `next_cursor`. Omit for the first page.
        cursor: nil,
        # Maximum number of runs to return per page. Defaults to 25.
        limit: nil,
        # Filter by run status.
        status: nil,
        request_options: {}
      )
      end

      # Retrieve a detected change with its summary, diff, URLs, and evidence.
      sig do
        params(
          change_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorRetrieveChangeResponse)
      end
      def retrieve_change(
        # ID of the change.
        change_id,
        request_options: {}
      )
      end

      # Retrieve a run's status, timing, credit charge, and webhook deliveries. If the
      # run found a change, `change_id` points to it.
      sig do
        params(
          run_id: String,
          monitor_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorRetrieveRunResponse)
      end
      def retrieve_run(
        # ID of the run.
        run_id,
        # ID of the monitor.
        monitor_id:,
        request_options: {}
      )
      end

      # Replace the monitor's webhook signing secret. The new secret signs every
      # delivery attempt from now on, including retries.
      sig do
        params(
          monitor_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorRotateWebhookSecretResponse)
      end
      def rotate_webhook_secret(
        # ID of the monitor.
        monitor_id,
        request_options: {}
      )
      end

      # Queue a run now without changing the monitor's schedule. Returns the run ID to
      # poll. Paused monitors return `409`.
      sig do
        params(
          monitor_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorRunResponse)
      end
      def run(
        # ID of the monitor.
        monitor_id,
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
