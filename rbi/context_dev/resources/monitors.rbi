# typed: strong

module ContextDev
  module Resources
    # Monitor pages, sitemaps, and extracted website data for exact or semantic
    # changes. The change.detected webhook payload is documented by the
    # MonitorsChangeDetectedWebhookPayload schema.
    class Monitors
      # Creates a monitor. The request body is a union of the supported target/change
      # detection combinations. The monitor runs immediately after creation to create
      # its initial baseline.
      sig do
        params(
          body:
            T.any(
              ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::OrHash,
              ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::OrHash,
              ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::OrHash,
              ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::OrHash
            ),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorCreateResponse::Variants)
      end
      def create(
        # Union of supported monitor creation shapes. Supported combinations are:
        # `page + exact`, `sitemap + exact`, `page + semantic`, and `extract + semantic`.
        body:,
        request_options: {}
      )
      end

      # Get a monitor
      sig do
        params(
          monitor_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorRetrieveResponse::Variants)
      end
      def retrieve(monitor_id, request_options: {})
      end

      # Updates a monitor. If `target` or `change_detection` changes, the monitor
      # creates a new baseline. Unsupported target/change detection combinations are
      # rejected.
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
        ).returns(ContextDev::Models::MonitorUpdateResponse::Variants)
      end
      def update(
        monitor_id,
        # Discriminated union describing how changes are detected.
        change_detection: nil,
        name: nil,
        # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        # every 6 hours or every 2 days. The total interval (frequency × unit) must be
        # between 10 minutes and 1 year.
        schedule: nil,
        status: nil,
        # User-defined tags for grouping and filtering monitors and their changes.
        tags: nil,
        # Discriminated union describing what the monitor watches.
        target: nil,
        # Set to null to remove the webhook.
        webhook: nil,
        request_options: {}
      )
      end

      # List monitors
      sig do
        params(
          change_detection_type:
            ContextDev::MonitorListParams::ChangeDetectionType::OrSymbol,
          cursor: String,
          limit: Integer,
          status: ContextDev::MonitorListParams::Status::OrSymbol,
          tag: String,
          target_type: ContextDev::MonitorListParams::TargetType::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorListResponse)
      end
      def list(
        change_detection_type: nil,
        cursor: nil,
        limit: nil,
        status: nil,
        # Filter to items that have this tag.
        tag: nil,
        target_type: nil,
        request_options: {}
      )
      end

      # Delete a monitor
      sig do
        params(
          monitor_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorDeleteResponse)
      end
      def delete(monitor_id, request_options: {})
      end

      # Returns an account-wide feed of detected changes across monitors.
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
        change_detection_type: nil,
        cursor: nil,
        limit: nil,
        monitor_id: nil,
        since: nil,
        # Filter to items that have this tag.
        tag: nil,
        target_type: nil,
        until_: nil,
        request_options: {}
      )
      end

      # Returns an account-wide feed of monitor runs across all monitors.
      sig do
        params(
          cursor: String,
          limit: Integer,
          status: ContextDev::MonitorListAccountRunsParams::Status::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorListAccountRunsResponse)
      end
      def list_account_runs(
        cursor: nil,
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      # List changes for a monitor
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
        monitor_id,
        cursor: nil,
        limit: nil,
        since: nil,
        # Filter to items that have this tag.
        tag: nil,
        until_: nil,
        request_options: {}
      )
      end

      # List monitor runs
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
        monitor_id,
        cursor: nil,
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      # Get a change
      sig do
        params(
          change_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorRetrieveChangeResponse::Variants)
      end
      def retrieve_change(change_id, request_options: {})
      end

      # Triggers an immediate run of the monitor outside its normal schedule. The run is
      # queued and processed asynchronously.
      sig do
        params(
          monitor_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::MonitorRunResponse)
      end
      def run(monitor_id, request_options: {})
      end

      # @api private
      sig { params(client: ContextDev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
