# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list
    class MonitorListResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Array<ContextDev::Models::MonitorListResponse::Data>]
      required :data, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorListResponse::Data] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      required :next_cursor, String, nil?: true

      # @!method initialize(data:, has_more:, next_cursor:)
      #   @param data [Array<ContextDev::Models::MonitorListResponse::Data>]
      #   @param has_more [Boolean]
      #   @param next_cursor [String, nil]

      class Data < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute change_detection
        #   Discriminated union describing how changes are detected.
        #
        #   @return [ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Exact, ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Semantic]
        required :change_detection, union: -> { ContextDev::Models::MonitorListResponse::Data::ChangeDetection }

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute mode
        #   Top-level monitor category. Always `web` today; the concrete behavior is
        #   described by `target` and `change_detection`.
        #
        #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::Mode]
        required :mode, enum: -> { ContextDev::Models::MonitorListResponse::Data::Mode }

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute schedule
        #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
        #   between 10 minutes and 1 year.
        #
        #   @return [ContextDev::Models::MonitorListResponse::Data::Schedule]
        required :schedule, -> { ContextDev::Models::MonitorListResponse::Data::Schedule }

        # @!attribute status
        #   Monitor lifecycle status. `failed` means the most recent run failed (see the
        #   monitor's `last_error`); failed monitors keep running on schedule and flip back
        #   to `active` on the next successful run. Monitors are auto-`paused` after
        #   repeated consecutive failures or insufficient-credit skips; resume by PATCHing
        #   status to `active`.
        #
        #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::Status]
        required :status, enum: -> { ContextDev::Models::MonitorListResponse::Data::Status }

        # @!attribute target
        #   Discriminated union describing what the monitor watches.
        #
        #   @return [ContextDev::Models::MonitorListResponse::Data::Target::Page, ContextDev::Models::MonitorListResponse::Data::Target::Sitemap, ContextDev::Models::MonitorListResponse::Data::Target::Extract]
        required :target, union: -> { ContextDev::Models::MonitorListResponse::Data::Target }

        # @!attribute updated_at
        #
        #   @return [Time]
        required :updated_at, Time

        # @!attribute baseline
        #   Current baseline: the last observed value the monitor compares new snapshots
        #   against. Its shape follows `target.type` (page/sitemap/extract). Only populated
        #   on GET /monitors/{monitor_id}; null until the first baseline run completes (and
        #   after a target or change_detection update, which resets the baseline).
        #
        #   @return [ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsPageBaseline, ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsSitemapBaseline, ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsExtractBaseline, nil]
        optional :baseline, union: -> { ContextDev::Models::MonitorListResponse::Data::Baseline }, nil?: true

        # @!attribute last_change_at
        #
        #   @return [Time, nil]
        optional :last_change_at, Time, nil?: true

        # @!attribute last_error
        #   Error from the most recent failed run; null when the last run succeeded.
        #
        #   @return [ContextDev::Models::MonitorListResponse::Data::LastError, nil]
        optional :last_error, -> { ContextDev::Models::MonitorListResponse::Data::LastError }, nil?: true

        # @!attribute last_run_at
        #
        #   @return [Time, nil]
        optional :last_run_at, Time, nil?: true

        # @!attribute next_run_at
        #   When the next scheduled run is due.
        #
        #   @return [Time, nil]
        optional :next_run_at, Time, nil?: true

        # @!attribute tags
        #   User-defined tags for grouping and filtering monitors and their changes.
        #   Duplicates are removed.
        #
        #   @return [Array<String>, nil]
        optional :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute webhook
        #
        #   @return [ContextDev::Models::MonitorListResponse::Data::Webhook, nil]
        optional :webhook, -> { ContextDev::Models::MonitorListResponse::Data::Webhook }, nil?: true

        # @!attribute webhook_failure
        #   Present while webhook deliveries are failing consecutively; null when deliveries
        #   are healthy or no webhook is configured. Cleared on the next successful delivery
        #   and when the webhook URL changes.
        #
        #   @return [ContextDev::Models::MonitorListResponse::Data::WebhookFailure, nil]
        optional :webhook_failure,
                 -> { ContextDev::Models::MonitorListResponse::Data::WebhookFailure },
                 nil?: true

        # @!method initialize(id:, change_detection:, created_at:, mode:, name:, schedule:, status:, target:, updated_at:, baseline: nil, last_change_at: nil, last_error: nil, last_run_at: nil, next_run_at: nil, tags: nil, webhook: nil, webhook_failure: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorListResponse::Data} for more details.
        #
        #   A web monitor. `mode` is the constant `web`; behavior is described by `target`
        #   (page/sitemap/extract) and `change_detection` (exact/semantic).
        #
        #   @param id [String]
        #
        #   @param change_detection [ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Exact, ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Semantic] Discriminated union describing how changes are detected.
        #
        #   @param created_at [Time]
        #
        #   @param mode [Symbol, ContextDev::Models::MonitorListResponse::Data::Mode] Top-level monitor category. Always `web` today; the concrete behavior is describ
        #
        #   @param name [String]
        #
        #   @param schedule [ContextDev::Models::MonitorListResponse::Data::Schedule] Run the monitor on a fixed interval defined by a frequency and a unit, e.g. ever
        #
        #   @param status [Symbol, ContextDev::Models::MonitorListResponse::Data::Status] Monitor lifecycle status. `failed` means the most recent run failed (see the mon
        #
        #   @param target [ContextDev::Models::MonitorListResponse::Data::Target::Page, ContextDev::Models::MonitorListResponse::Data::Target::Sitemap, ContextDev::Models::MonitorListResponse::Data::Target::Extract] Discriminated union describing what the monitor watches.
        #
        #   @param updated_at [Time]
        #
        #   @param baseline [ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsPageBaseline, ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsSitemapBaseline, ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsExtractBaseline, nil] Current baseline: the last observed value the monitor compares new snapshots aga
        #
        #   @param last_change_at [Time, nil]
        #
        #   @param last_error [ContextDev::Models::MonitorListResponse::Data::LastError, nil] Error from the most recent failed run; null when the last run succeeded.
        #
        #   @param last_run_at [Time, nil]
        #
        #   @param next_run_at [Time, nil] When the next scheduled run is due.
        #
        #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes. Duplica
        #
        #   @param webhook [ContextDev::Models::MonitorListResponse::Data::Webhook, nil]
        #
        #   @param webhook_failure [ContextDev::Models::MonitorListResponse::Data::WebhookFailure, nil] Present while webhook deliveries are failing consecutively; null when deliveries

        # Discriminated union describing how changes are detected.
        #
        # @see ContextDev::Models::MonitorListResponse::Data#change_detection
        module ChangeDetection
          extend ContextDev::Internal::Type::Union

          discriminator :type

          # Detect exact changes. For page targets, this means visible text diffs. For sitemap targets, this means URL additions and removals.
          variant :exact, -> { ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Exact }

          # Detect meaning-level changes to page content, ignoring cosmetic or instruction-irrelevant differences. Which changes are meaningful is judged against the page or extract target's `instructions` (and an extract target's `schema`, when provided).
          variant :semantic, -> { ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Semantic }

          class Exact < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :exact]
            required :type, const: :exact

            # @!method initialize(type: :exact)
            #   Detect exact changes. For page targets, this means visible text diffs. For
            #   sitemap targets, this means URL additions and removals.
            #
            #   @param type [Symbol, :exact]
          end

          class Semantic < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :semantic]
            required :type, const: :semantic

            # @!attribute confidence_threshold
            #
            #   @return [Float, nil]
            optional :confidence_threshold, Float

            # @!method initialize(confidence_threshold: nil, type: :semantic)
            #   Detect meaning-level changes to page content, ignoring cosmetic or
            #   instruction-irrelevant differences. Which changes are meaningful is judged
            #   against the page or extract target's `instructions` (and an extract target's
            #   `schema`, when provided).
            #
            #   @param confidence_threshold [Float]
            #   @param type [Symbol, :semantic]
          end

          # @!method self.variants
          #   @return [Array(ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Exact, ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Semantic)]
        end

        # Top-level monitor category. Always `web` today; the concrete behavior is
        # described by `target` and `change_detection`.
        #
        # @see ContextDev::Models::MonitorListResponse::Data#mode
        module Mode
          extend ContextDev::Internal::Type::Enum

          WEB = :web

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::MonitorListResponse::Data#schedule
        class Schedule < ContextDev::Internal::Type::BaseModel
          # @!attribute frequency
          #   Number of units between runs. The resulting interval (frequency × unit) must be
          #   at least 10 minutes and at most 1 year (e.g. minimum 10 when unit is minutes;
          #   maximum 365 when unit is days).
          #
          #   @return [Integer]
          required :frequency, Integer

          # @!attribute type
          #
          #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::Schedule::Type]
          required :type, enum: -> { ContextDev::Models::MonitorListResponse::Data::Schedule::Type }

          # @!attribute unit
          #
          #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::Schedule::Unit]
          required :unit, enum: -> { ContextDev::Models::MonitorListResponse::Data::Schedule::Unit }

          # @!method initialize(frequency:, type:, unit:)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorListResponse::Data::Schedule} for more details.
          #
          #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
          #   between 10 minutes and 1 year.
          #
          #   @param frequency [Integer] Number of units between runs. The resulting interval (frequency × unit) must be
          #
          #   @param type [Symbol, ContextDev::Models::MonitorListResponse::Data::Schedule::Type]
          #
          #   @param unit [Symbol, ContextDev::Models::MonitorListResponse::Data::Schedule::Unit]

          # @see ContextDev::Models::MonitorListResponse::Data::Schedule#type
          module Type
            extend ContextDev::Internal::Type::Enum

            INTERVAL = :interval

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see ContextDev::Models::MonitorListResponse::Data::Schedule#unit
          module Unit
            extend ContextDev::Internal::Type::Enum

            MINUTES = :minutes
            HOURS = :hours
            DAYS = :days

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # Monitor lifecycle status. `failed` means the most recent run failed (see the
        # monitor's `last_error`); failed monitors keep running on schedule and flip back
        # to `active` on the next successful run. Monitors are auto-`paused` after
        # repeated consecutive failures or insufficient-credit skips; resume by PATCHing
        # status to `active`.
        #
        # @see ContextDev::Models::MonitorListResponse::Data#status
        module Status
          extend ContextDev::Internal::Type::Enum

          ACTIVE = :active
          PAUSED = :paused
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Discriminated union describing what the monitor watches.
        #
        # @see ContextDev::Models::MonitorListResponse::Data#target
        module Target
          extend ContextDev::Internal::Type::Union

          discriminator :type

          # Watch a single web page. Exact detection reports visible-text diffs; semantic detection judges confirmed stable diffs against `instructions`.
          variant :page, -> { ContextDev::Models::MonitorListResponse::Data::Target::Page }

          # Watch a sitemap for URL additions and removals. Crawled URLs are normalized (lowercased host, no trailing slash/fragment) and scoped to the monitored site and its subdomains before comparison. On a detected difference the sitemap is re-fetched within the same run and only URLs both observations agree on are reported, suppressing transient crawl flaps.
          variant :sitemap, -> { ContextDev::Models::MonitorListResponse::Data::Target::Sitemap }

          # Watch the monitor-relevant pages of a site for meaningful changes. A crawl guided by `schema`/`instructions` selects up to `max_pages` relevant pages to track; each run re-checks exactly those pages, and confirmed content changes are judged for relevance against the monitor's `instructions` (and `schema`, when provided). The tracked page set is refreshed by a periodic re-discovery crawl.
          variant :extract, -> { ContextDev::Models::MonitorListResponse::Data::Target::Extract }

          class Page < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :page]
            required :type, const: :page

            # @!attribute url
            #
            #   @return [String]
            required :url, String

            # @!attribute instructions
            #   Plain-language goal describing which page changes matter. When provided without
            #   change_detection, semantic detection is inferred.
            #
            #   @return [String, nil]
            optional :instructions, String

            # @!attribute normalize_whitespace
            #   Normalize whitespace before comparing or analyzing text.
            #
            #   @return [Boolean, nil]
            optional :normalize_whitespace, ContextDev::Internal::Type::Boolean

            # @!method initialize(url:, instructions: nil, normalize_whitespace: nil, type: :page)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::MonitorListResponse::Data::Target::Page} for more details.
            #
            #   Watch a single web page. Exact detection reports visible-text diffs; semantic
            #   detection judges confirmed stable diffs against `instructions`.
            #
            #   @param url [String]
            #
            #   @param instructions [String] Plain-language goal describing which page changes matter. When provided without
            #
            #   @param normalize_whitespace [Boolean] Normalize whitespace before comparing or analyzing text.
            #
            #   @param type [Symbol, :page]
          end

          class Sitemap < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :sitemap]
            required :type, const: :sitemap

            # @!attribute url
            #   Sitemap URL to monitor.
            #
            #   @return [String]
            required :url, String

            # @!attribute exclude
            #   URL path patterns to exclude (max 50).
            #
            #   @return [Array<String>, nil]
            optional :exclude, ContextDev::Internal::Type::ArrayOf[String]

            # @!attribute include
            #   URL path patterns to include (max 50).
            #
            #   @return [Array<String>, nil]
            optional :include, ContextDev::Internal::Type::ArrayOf[String]

            # @!attribute max_urls
            #   Maximum number of sitemap URLs to track (capped at 10,000).
            #
            #   @return [Integer, nil]
            optional :max_urls, Integer

            # @!method initialize(url:, exclude: nil, include: nil, max_urls: nil, type: :sitemap)
            #   Watch a sitemap for URL additions and removals. Crawled URLs are normalized
            #   (lowercased host, no trailing slash/fragment) and scoped to the monitored site
            #   and its subdomains before comparison. On a detected difference the sitemap is
            #   re-fetched within the same run and only URLs both observations agree on are
            #   reported, suppressing transient crawl flaps.
            #
            #   @param url [String] Sitemap URL to monitor.
            #
            #   @param exclude [Array<String>] URL path patterns to exclude (max 50).
            #
            #   @param include [Array<String>] URL path patterns to include (max 50).
            #
            #   @param max_urls [Integer] Maximum number of sitemap URLs to track (capped at 10,000).
            #
            #   @param type [Symbol, :sitemap]
          end

          class Extract < ContextDev::Internal::Type::BaseModel
            # @!attribute instructions
            #   Natural-language instructions guiding which pages and facts to track and which
            #   changes to report.
            #
            #   @return [String]
            required :instructions, String

            # @!attribute type
            #
            #   @return [Symbol, :extract]
            required :type, const: :extract

            # @!attribute url
            #   Root URL to extract structured data from.
            #
            #   @return [String]
            required :url, String

            # @!attribute follow_subdomains
            #
            #   @return [Boolean, nil]
            optional :follow_subdomains, ContextDev::Internal::Type::Boolean

            # @!attribute max_depth
            #   Optional maximum link depth from the starting URL (0 = only the starting page).
            #
            #   @return [Integer, nil]
            optional :max_depth, Integer

            # @!attribute max_pages
            #   Maximum number of pages to track.
            #
            #   @return [Integer, nil]
            optional :max_pages, Integer

            # @!attribute schema
            #   JSON Schema describing the data you care about. It is used three ways: it guides
            #   which pages are selected for tracking, it gives the change judge extra context
            #   on which changes matter (alongside `instructions`), and it defines the shape of
            #   the baseline `data` snapshot on GET /monitors/{monitor_id} (refreshed at most
            #   about once a day). It is not a response format for changes: change events and
            #   webhook payloads always contain diffs, summaries, and evidence excerpts — never
            #   data in this schema's shape. If omitted, a default summary + key-points schema
            #   is used.
            #
            #   @return [Hash{Symbol=>Object}, nil]
            optional :schema, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

            # @!method initialize(instructions:, url:, follow_subdomains: nil, max_depth: nil, max_pages: nil, schema: nil, type: :extract)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::MonitorListResponse::Data::Target::Extract} for more
            #   details.
            #
            #   Watch the monitor-relevant pages of a site for meaningful changes. A crawl
            #   guided by `schema`/`instructions` selects up to `max_pages` relevant pages to
            #   track; each run re-checks exactly those pages, and confirmed content changes are
            #   judged for relevance against the monitor's `instructions` (and `schema`, when
            #   provided). The tracked page set is refreshed by a periodic re-discovery crawl.
            #
            #   @param instructions [String] Natural-language instructions guiding which pages and facts to track and which c
            #
            #   @param url [String] Root URL to extract structured data from.
            #
            #   @param follow_subdomains [Boolean]
            #
            #   @param max_depth [Integer] Optional maximum link depth from the starting URL (0 = only the starting page).
            #
            #   @param max_pages [Integer] Maximum number of pages to track.
            #
            #   @param schema [Hash{Symbol=>Object}] JSON Schema describing the data you care about. It is used three ways: it guides
            #
            #   @param type [Symbol, :extract]
          end

          # @!method self.variants
          #   @return [Array(ContextDev::Models::MonitorListResponse::Data::Target::Page, ContextDev::Models::MonitorListResponse::Data::Target::Sitemap, ContextDev::Models::MonitorListResponse::Data::Target::Extract)]
        end

        # Current baseline: the last observed value the monitor compares new snapshots
        # against. Its shape follows `target.type` (page/sitemap/extract). Only populated
        # on GET /monitors/{monitor_id}; null until the first baseline run completes (and
        # after a target or change_detection update, which resets the baseline).
        #
        # @see ContextDev::Models::MonitorListResponse::Data#baseline
        module Baseline
          extend ContextDev::Internal::Type::Union

          # Current baseline of a `page` monitor: the visible page text as last observed.
          variant -> { ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsPageBaseline }

          # Current baseline of a `sitemap` monitor: the normalized URL set as last observed.
          variant -> { ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsSitemapBaseline }

          # Current baseline of an `extract` monitor: the pages it tracks and the structured data as last extracted.
          variant -> { ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsExtractBaseline }

          class MonitorsPageBaseline < ContextDev::Internal::Type::BaseModel
            # @!attribute captured_at
            #   When this baseline was last captured or replaced.
            #
            #   @return [Time]
            required :captured_at, Time

            # @!attribute text
            #   The page's visible text as last observed.
            #
            #   @return [String]
            required :text, String

            # @!method initialize(captured_at:, text:)
            #   Current baseline of a `page` monitor: the visible page text as last observed.
            #
            #   @param captured_at [Time] When this baseline was last captured or replaced.
            #
            #   @param text [String] The page's visible text as last observed.
          end

          class MonitorsSitemapBaseline < ContextDev::Internal::Type::BaseModel
            # @!attribute captured_at
            #   When this baseline was last captured or replaced.
            #
            #   @return [Time]
            required :captured_at, Time

            # @!attribute url_count
            #   Number of URLs in the baseline.
            #
            #   @return [Integer]
            required :url_count, Integer

            # @!attribute urls
            #   The sitemap URLs as last observed (sorted, normalized).
            #
            #   @return [Array<String>]
            required :urls, ContextDev::Internal::Type::ArrayOf[String]

            # @!method initialize(captured_at:, url_count:, urls:)
            #   Current baseline of a `sitemap` monitor: the normalized URL set as last
            #   observed.
            #
            #   @param captured_at [Time] When this baseline was last captured or replaced.
            #
            #   @param url_count [Integer] Number of URLs in the baseline.
            #
            #   @param urls [Array<String>] The sitemap URLs as last observed (sorted, normalized).
          end

          class MonitorsExtractBaseline < ContextDev::Internal::Type::BaseModel
            # @!attribute captured_at
            #   When this baseline was last captured or replaced.
            #
            #   @return [Time]
            required :captured_at, Time

            # @!attribute data
            #   The extracted structured data, matching the monitor's extraction schema (same
            #   shape as the /web/extract endpoint's `data`). Refreshed when the monitor
            #   re-discovers its page set (at most about once a day); `null` when no extraction
            #   has been captured yet.
            #
            #   @return [Object]
            required :data, ContextDev::Internal::Type::Unknown

            # @!attribute urls_analyzed
            #   The page URLs the monitor tracks and analyzes for changes.
            #
            #   @return [Array<String>]
            required :urls_analyzed, ContextDev::Internal::Type::ArrayOf[String]

            # @!method initialize(captured_at:, data:, urls_analyzed:)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsExtractBaseline}
            #   for more details.
            #
            #   Current baseline of an `extract` monitor: the pages it tracks and the structured
            #   data as last extracted.
            #
            #   @param captured_at [Time] When this baseline was last captured or replaced.
            #
            #   @param data [Object] The extracted structured data, matching the monitor's extraction schema (same sh
            #
            #   @param urls_analyzed [Array<String>] The page URLs the monitor tracks and analyzes for changes.
          end

          # @!method self.variants
          #   @return [Array(ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsPageBaseline, ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsSitemapBaseline, ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsExtractBaseline)]
        end

        # @see ContextDev::Models::MonitorListResponse::Data#last_error
        class LastError < ContextDev::Internal::Type::BaseModel
          # @!attribute code
          #
          #   @return [String]
          required :code, String

          # @!attribute message
          #
          #   @return [String]
          required :message, String

          # @!method initialize(code:, message:)
          #   Error from the most recent failed run; null when the last run succeeded.
          #
          #   @param code [String]
          #   @param message [String]
        end

        # @see ContextDev::Models::MonitorListResponse::Data#webhook
        class Webhook < ContextDev::Internal::Type::BaseModel
          # @!attribute url
          #   Webhook URL events are delivered to.
          #
          #   @return [String]
          required :url, String

          # @!attribute events
          #   Events delivered to this endpoint. `change.detected` fires only when a run
          #   detects a change; `run.completed` fires on every completed run — including runs
          #   that detected no change — and embeds the change when one was detected. Defaults
          #   to `["change.detected"]` when omitted.
          #
          #   @return [Array<Symbol, ContextDev::Models::MonitorListResponse::Data::Webhook::Event>, nil]
          optional :events,
                   -> { ContextDev::Internal::Type::ArrayOf[enum: ContextDev::Models::MonitorListResponse::Data::Webhook::Event] }

          response_only do
            # @!attribute secret
            #   Signing secret used to verify webhook authenticity. Each delivery includes an
            #   `X-Context-Signature: t=<unix>,v1=<hmac>` header, where the HMAC is SHA-256 over
            #   `"{t}.{rawRequestBody}"` keyed by this secret. Recompute it with a constant-time
            #   compare and reject stale timestamps to prevent replay. Generated by the API;
            #   cannot be set by clients.
            #
            #   @return [String, nil]
            optional :secret, String
          end

          # @!method initialize(url:, events: nil, secret: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorListResponse::Data::Webhook} for more details.
          #
          #   @param url [String] Webhook URL events are delivered to.
          #
          #   @param events [Array<Symbol, ContextDev::Models::MonitorListResponse::Data::Webhook::Event>] Events delivered to this endpoint. `change.detected` fires only when a run detec
          #
          #   @param secret [String] Signing secret used to verify webhook authenticity. Each delivery includes an `X

          module Event
            extend ContextDev::Internal::Type::Enum

            CHANGE_DETECTED = :"change.detected"
            RUN_COMPLETED = :"run.completed"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see ContextDev::Models::MonitorListResponse::Data#webhook_failure
        class WebhookFailure < ContextDev::Internal::Type::BaseModel
          # @!attribute consecutive_failures
          #   Number of consecutive delivery attempts that did not succeed.
          #
          #   @return [Integer]
          required :consecutive_failures, Integer

          # @!attribute last_failed_at
          #
          #   @return [Time]
          required :last_failed_at, Time

          # @!attribute last_message
          #   Human-readable description of the most recent failure.
          #
          #   @return [String]
          required :last_message, String

          # @!attribute last_status
          #   Outcome of the most recent failed delivery. rejected means a non-2xx response;
          #   failed means no HTTP response was received; skipped_unsafe_url means the URL
          #   failed the public-endpoint safety check.
          #
          #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::WebhookFailure::LastStatus]
          required :last_status,
                   enum: -> { ContextDev::Models::MonitorListResponse::Data::WebhookFailure::LastStatus }

          # @!method initialize(consecutive_failures:, last_failed_at:, last_message:, last_status:)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorListResponse::Data::WebhookFailure} for more
          #   details.
          #
          #   Present while webhook deliveries are failing consecutively; null when deliveries
          #   are healthy or no webhook is configured. Cleared on the next successful delivery
          #   and when the webhook URL changes.
          #
          #   @param consecutive_failures [Integer] Number of consecutive delivery attempts that did not succeed.
          #
          #   @param last_failed_at [Time]
          #
          #   @param last_message [String] Human-readable description of the most recent failure.
          #
          #   @param last_status [Symbol, ContextDev::Models::MonitorListResponse::Data::WebhookFailure::LastStatus] Outcome of the most recent failed delivery. rejected means a non-2xx response; f

          # Outcome of the most recent failed delivery. rejected means a non-2xx response;
          # failed means no HTTP response was received; skipped_unsafe_url means the URL
          # failed the public-endpoint safety check.
          #
          # @see ContextDev::Models::MonitorListResponse::Data::WebhookFailure#last_status
          module LastStatus
            extend ContextDev::Internal::Type::Enum

            REJECTED = :rejected
            FAILED = :failed
            SKIPPED_UNSAFE_URL = :skipped_unsafe_url

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
