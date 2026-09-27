# typed: strong

module ContextDev
  module Resources
    # Watch websites for exact or meaningful changes.
    class Monitors
      # Watch a page, URL inventory, or extracted website data on a schedule. A run
      # starts immediately to capture the baseline.
      sig do
        params(
          name: String,
          target:
            T.any(
              ContextDev::MonitorCreateParams::Target::Page::OrHash,
              ContextDev::MonitorCreateParams::Target::Sitemap::OrHash,
              ContextDev::MonitorCreateParams::Target::Extract::OrHash
            ),
          change_detection:
            T.any(
              ContextDev::MonitorCreateParams::ChangeDetection::Exact::OrHash,
              ContextDev::MonitorCreateParams::ChangeDetection::Semantic::OrHash
            ),
          mode: ContextDev::MonitorCreateParams::Mode::OrSymbol,
          schedule: ContextDev::MonitorCreateParams::Schedule::OrHash,
          tags: T::Array[String],
          webhook: T.nilable(ContextDev::MonitorCreateParams::Webhook::OrHash),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorCreateResponse)
      end
      def create(
        # Display name for the monitor.
        name:,
        # What to watch: a page, a sitemap, or data extracted from a site.
        target:,
        # How changes are judged. Defaults to `semantic` for extract targets and page
        # targets with `instructions`, otherwise `exact`.
        change_detection: nil,
        # Always `web`. Optional.
        mode: nil,
        # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        # every 6 hours or every 2 days. The total interval (frequency × unit) must be
        # between 10 minutes and 1 year.
        schedule: nil,
        # Labels for filtering monitors, their changes, and their usage.
        tags: nil,
        # Webhook destination and delivery settings. Null means no webhook is configured.
        webhook: nil,
        request_options: {}
      )
      end

      # Retrieve a monitor’s configuration and current state.
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

      # Update a monitor. Changing its target or change detection replaces the baseline
      # and queues a new baseline run.
      sig do
        params(
          monitor_id: String,
          change_detection:
            T.any(
              ContextDev::MonitorUpdateParams::ChangeDetection::Exact::OrHash,
              ContextDev::MonitorUpdateParams::ChangeDetection::Semantic::OrHash
            ),
          name: String,
          schedule: ContextDev::MonitorUpdateParams::Schedule::OrHash,
          status: ContextDev::MonitorUpdateParams::Status::OrSymbol,
          tags: T::Array[String],
          target:
            T.any(
              ContextDev::MonitorUpdateParams::Target::Page::OrHash,
              ContextDev::MonitorUpdateParams::Target::Sitemap::OrHash,
              ContextDev::MonitorUpdateParams::Target::Extract::OrHash
            ),
          webhook: T.nilable(ContextDev::MonitorUpdateParams::Webhook::OrHash),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorUpdateResponse)
      end
      def update(
        # ID of the monitor.
        monitor_id,
        # How changes are judged. Defaults to `semantic` for extract targets and page
        # targets with `instructions`, otherwise `exact`.
        change_detection: nil,
        # Display name for the monitor.
        name: nil,
        # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        # every 6 hours or every 2 days. The total interval (frequency × unit) must be
        # between 10 minutes and 1 year.
        schedule: nil,
        # Set `paused` to stop scheduled runs or `active` to resume them.
        status: nil,
        # Labels for filtering monitors, their changes, and their usage.
        tags: nil,
        # What to watch: a page, a sitemap, or data extracted from a site.
        target: nil,
        # Set to null to remove the webhook. Changing `url` issues a new secret.
        webhook: nil,
        request_options: {}
      )
      end

      # List your monitors with optional search and filters.
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
          tag: String,
          tags: T.nilable(T::Array[String]),
          target_type: ContextDev::MonitorListParams::TargetType::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorListResponse)
      end
      def list(
        # Filter by change detection type.
        change_detection_type: nil,
        # Opaque pagination cursor from a previous response.
        cursor: nil,
        # Maximum number of items to return per page (1-100). Defaults to 25.
        limit: nil,
        # Free-text search term, matched against the fields named in `search_by`.
        q: nil,
        # Fields to search with `q`. Defaults to all fields; page and extract targets can
        # have instructions.
        search_by: nil,
        # `prefix` for as-you-type prefix matching (default), `exact` for full-token
        # matching.
        search_type: nil,
        # Filter monitors by lifecycle status.
        status: nil,
        # Filter to items that have this tag.
        tag: nil,
        # Comma-separated list of tags to filter by (matches monitors having any of them).
        tags: nil,
        # Filter by target type.
        target_type: nil,
        request_options: {}
      )
      end

      # Delete a monitor and stop future runs and webhook retries.
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

      # Return usage per monitor, highest first, for up to the 10,000 most recent runs
      # in the requested window.
      sig do
        params(
          since: Time,
          until_: Time,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorGetCreditUsageResponse)
      end
      def get_credit_usage(
        # Only include items at or after this ISO 8601 timestamp.
        since: nil,
        # Only include items before this ISO 8601 timestamp.
        until_: nil,
        request_options: {}
      )
      end

      # Retrieve your organization’s monitor allowance and usage.
      sig do
        params(request_options: ContextDev::RequestOptions::OrHash).returns(
          ContextDev::Models::MonitorGetLimitsResponse
        )
      end
      def get_limits(request_options: {})
      end

      # List full change records across your monitors, newest first.
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
        # Opaque pagination cursor from a previous response.
        cursor: nil,
        # Maximum number of items to return per page (1-100). Defaults to 25.
        limit: nil,
        # Filter changes to a single monitor.
        monitor_id: nil,
        # Only include items at or after this ISO 8601 timestamp.
        since: nil,
        # Filter to items that have this tag.
        tag: nil,
        # Filter by target type.
        target_type: nil,
        # Only include items before this ISO 8601 timestamp.
        until_: nil,
        request_options: {}
      )
      end

      # List runs across your monitors, newest first.
      sig do
        params(
          cursor: String,
          limit: Integer,
          status: ContextDev::MonitorListAccountRunsParams::Status::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorListAccountRunsResponse)
      end
      def list_account_runs(
        # Opaque pagination cursor from a previous response.
        cursor: nil,
        # Maximum number of items to return per page (1-100). Defaults to 25.
        limit: nil,
        # Filter runs by lifecycle status.
        status: nil,
        request_options: {}
      )
      end

      # List full change records for a monitor, newest first.
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
        # Opaque pagination cursor from a previous response.
        cursor: nil,
        # Maximum number of items to return per page (1-100). Defaults to 25.
        limit: nil,
        # Only include items at or after this ISO 8601 timestamp.
        since: nil,
        # Filter to items that have this tag.
        tag: nil,
        # Only include items before this ISO 8601 timestamp.
        until_: nil,
        request_options: {}
      )
      end

      # List a monitor’s runs, newest first.
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
        # Opaque pagination cursor from a previous response.
        cursor: nil,
        # Maximum number of items to return per page (1-100). Defaults to 25.
        limit: nil,
        # Filter runs by lifecycle status.
        status: nil,
        request_options: {}
      )
      end

      # Retrieve a detected change, including its diff and available evidence.
      sig do
        params(
          change_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorRetrieveChangeResponse)
      end
      def retrieve_change(
        # ID of the detected change.
        change_id,
        request_options: {}
      )
      end

      # Retrieve the status, timing, and results of one monitor run.
      sig do
        params(
          run_id: String,
          monitor_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorRetrieveRunResponse)
      end
      def retrieve_run(
        # ID of the monitor run.
        run_id,
        # ID of the monitor.
        monitor_id:,
        request_options: {}
      )
      end

      # Generate and return a new signing secret. It takes effect immediately for all
      # subsequent delivery attempts.
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

      # Queue a run without changing the regular schedule. Paused monitors return 409.
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
