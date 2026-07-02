# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#update
    class MonitorUpdateResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute change_detection
      #   Discriminated union describing how changes are detected.
      #
      #   @return [ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Exact, ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Semantic]
      required :change_detection, union: -> { ContextDev::Models::MonitorUpdateResponse::ChangeDetection }

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute mode
      #   Top-level monitor category. Always `web` today; the concrete behavior is
      #   described by `target` and `change_detection`.
      #
      #   @return [Symbol, ContextDev::Models::MonitorUpdateResponse::Mode]
      required :mode, enum: -> { ContextDev::Models::MonitorUpdateResponse::Mode }

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute schedule
      #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
      #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
      #   between 10 minutes and 1 year.
      #
      #   @return [ContextDev::Models::MonitorUpdateResponse::Schedule]
      required :schedule, -> { ContextDev::Models::MonitorUpdateResponse::Schedule }

      # @!attribute status
      #   Monitor lifecycle status. `failed` means the most recent run failed (see the
      #   monitor's `last_error`); failed monitors keep running on schedule and flip back
      #   to `active` on the next successful run. Monitors are auto-`paused` after
      #   repeated consecutive failures or insufficient-credit skips; resume by PATCHing
      #   status to `active`.
      #
      #   @return [Symbol, ContextDev::Models::MonitorUpdateResponse::Status]
      required :status, enum: -> { ContextDev::Models::MonitorUpdateResponse::Status }

      # @!attribute target
      #   Discriminated union describing what the monitor watches.
      #
      #   @return [ContextDev::Models::MonitorUpdateResponse::Target::Page, ContextDev::Models::MonitorUpdateResponse::Target::Sitemap, ContextDev::Models::MonitorUpdateResponse::Target::Extract]
      required :target, union: -> { ContextDev::Models::MonitorUpdateResponse::Target }

      # @!attribute updated_at
      #
      #   @return [Time]
      required :updated_at, Time

      # @!attribute last_change_at
      #
      #   @return [Time, nil]
      optional :last_change_at, Time, nil?: true

      # @!attribute last_error
      #   Error from the most recent failed run; null when the last run succeeded.
      #
      #   @return [ContextDev::Models::MonitorUpdateResponse::LastError, nil]
      optional :last_error, -> { ContextDev::Models::MonitorUpdateResponse::LastError }, nil?: true

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
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute webhook
      #
      #   @return [ContextDev::Models::MonitorUpdateResponse::Webhook, nil]
      optional :webhook, -> { ContextDev::Models::MonitorUpdateResponse::Webhook }, nil?: true

      # @!method initialize(id:, change_detection:, created_at:, mode:, name:, schedule:, status:, target:, updated_at:, last_change_at: nil, last_error: nil, last_run_at: nil, next_run_at: nil, tags: nil, webhook: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorUpdateResponse} for more details.
      #
      #   A web monitor. `mode` is the constant `web`; behavior is described by `target`
      #   (page/sitemap/extract) and `change_detection` (exact/semantic).
      #
      #   @param id [String]
      #
      #   @param change_detection [ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Exact, ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Semantic] Discriminated union describing how changes are detected.
      #
      #   @param created_at [Time]
      #
      #   @param mode [Symbol, ContextDev::Models::MonitorUpdateResponse::Mode] Top-level monitor category. Always `web` today; the concrete behavior is describ
      #
      #   @param name [String]
      #
      #   @param schedule [ContextDev::Models::MonitorUpdateResponse::Schedule] Run the monitor on a fixed interval defined by a frequency and a unit, e.g. ever
      #
      #   @param status [Symbol, ContextDev::Models::MonitorUpdateResponse::Status] Monitor lifecycle status. `failed` means the most recent run failed (see the mon
      #
      #   @param target [ContextDev::Models::MonitorUpdateResponse::Target::Page, ContextDev::Models::MonitorUpdateResponse::Target::Sitemap, ContextDev::Models::MonitorUpdateResponse::Target::Extract] Discriminated union describing what the monitor watches.
      #
      #   @param updated_at [Time]
      #
      #   @param last_change_at [Time, nil]
      #
      #   @param last_error [ContextDev::Models::MonitorUpdateResponse::LastError, nil] Error from the most recent failed run; null when the last run succeeded.
      #
      #   @param last_run_at [Time, nil]
      #
      #   @param next_run_at [Time, nil] When the next scheduled run is due.
      #
      #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.
      #
      #   @param webhook [ContextDev::Models::MonitorUpdateResponse::Webhook, nil]

      # Discriminated union describing how changes are detected.
      #
      # @see ContextDev::Models::MonitorUpdateResponse#change_detection
      module ChangeDetection
        extend ContextDev::Internal::Type::Union

        discriminator :type

        # Detect exact changes. For page targets, this means visible text diffs. For sitemap targets, this means URL additions and removals.
        variant :exact, -> { ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Exact }

        # Detect meaning-level changes that match a natural language query.
        variant :semantic, -> { ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Semantic }

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
          # @!attribute query
          #
          #   @return [String]
          required :query, String

          # @!attribute type
          #
          #   @return [Symbol, :semantic]
          required :type, const: :semantic

          # @!attribute confidence_threshold
          #
          #   @return [Float, nil]
          optional :confidence_threshold, Float

          # @!method initialize(query:, confidence_threshold: nil, type: :semantic)
          #   Detect meaning-level changes that match a natural language query.
          #
          #   @param query [String]
          #   @param confidence_threshold [Float]
          #   @param type [Symbol, :semantic]
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Exact, ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Semantic)]
      end

      # Top-level monitor category. Always `web` today; the concrete behavior is
      # described by `target` and `change_detection`.
      #
      # @see ContextDev::Models::MonitorUpdateResponse#mode
      module Mode
        extend ContextDev::Internal::Type::Enum

        WEB = :web

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::MonitorUpdateResponse#schedule
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
        #   @return [Symbol, ContextDev::Models::MonitorUpdateResponse::Schedule::Type]
        required :type, enum: -> { ContextDev::Models::MonitorUpdateResponse::Schedule::Type }

        # @!attribute unit
        #
        #   @return [Symbol, ContextDev::Models::MonitorUpdateResponse::Schedule::Unit]
        required :unit, enum: -> { ContextDev::Models::MonitorUpdateResponse::Schedule::Unit }

        # @!method initialize(frequency:, type:, unit:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorUpdateResponse::Schedule} for more details.
        #
        #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
        #   between 10 minutes and 1 year.
        #
        #   @param frequency [Integer] Number of units between runs. The resulting interval (frequency × unit) must be
        #
        #   @param type [Symbol, ContextDev::Models::MonitorUpdateResponse::Schedule::Type]
        #
        #   @param unit [Symbol, ContextDev::Models::MonitorUpdateResponse::Schedule::Unit]

        # @see ContextDev::Models::MonitorUpdateResponse::Schedule#type
        module Type
          extend ContextDev::Internal::Type::Enum

          INTERVAL = :interval

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::MonitorUpdateResponse::Schedule#unit
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
      # @see ContextDev::Models::MonitorUpdateResponse#status
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
      # @see ContextDev::Models::MonitorUpdateResponse#target
      module Target
        extend ContextDev::Internal::Type::Union

        discriminator :type

        # Watch a single web page.
        variant :page, -> { ContextDev::Models::MonitorUpdateResponse::Target::Page }

        # Watch a sitemap for URL additions and removals. Crawled URLs are normalized (lowercased host, no trailing slash/fragment) and scoped to the monitored site and its subdomains before comparison. A new URL set must be observed on two consecutive runs before a change is reported, suppressing one-run crawl flaps.
        variant :sitemap, -> { ContextDev::Models::MonitorUpdateResponse::Target::Sitemap }

        # Watch a site's extracted structured data.
        variant :extract, -> { ContextDev::Models::MonitorUpdateResponse::Target::Extract }

        class Page < ContextDev::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :page]
          required :type, const: :page

          # @!attribute url
          #
          #   @return [String]
          required :url, String

          # @!attribute normalize_whitespace
          #   Normalize whitespace before comparing or analyzing text.
          #
          #   @return [Boolean, nil]
          optional :normalize_whitespace, ContextDev::Internal::Type::Boolean

          # @!method initialize(url:, normalize_whitespace: nil, type: :page)
          #   Watch a single web page.
          #
          #   @param url [String]
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
          #   URL path patterns to exclude.
          #
          #   @return [Array<String>, nil]
          optional :exclude, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute include
          #   URL path patterns to include.
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
          #   and its subdomains before comparison. A new URL set must be observed on two
          #   consecutive runs before a change is reported, suppressing one-run crawl flaps.
          #
          #   @param url [String] Sitemap URL to monitor.
          #
          #   @param exclude [Array<String>] URL path patterns to exclude.
          #
          #   @param include [Array<String>] URL path patterns to include.
          #
          #   @param max_urls [Integer] Maximum number of sitemap URLs to track (capped at 10,000).
          #
          #   @param type [Symbol, :sitemap]
        end

        class Extract < ContextDev::Internal::Type::BaseModel
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

          # @!attribute instructions
          #   Optional natural-language instructions guiding what to extract.
          #
          #   @return [String, nil]
          optional :instructions, String

          # @!attribute max_depth
          #   Optional maximum link depth from the starting URL (0 = only the starting page).
          #
          #   @return [Integer, nil]
          optional :max_depth, Integer

          # @!attribute max_pages
          #   Maximum number of pages to analyze during extraction.
          #
          #   @return [Integer, nil]
          optional :max_pages, Integer

          # @!attribute schema
          #   JSON Schema describing the structured data to extract and watch for changes. If
          #   omitted, a default summary + key-points schema is used.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :schema, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

          # @!method initialize(url:, follow_subdomains: nil, instructions: nil, max_depth: nil, max_pages: nil, schema: nil, type: :extract)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorUpdateResponse::Target::Extract} for more details.
          #
          #   Watch a site's extracted structured data.
          #
          #   @param url [String] Root URL to extract structured data from.
          #
          #   @param follow_subdomains [Boolean]
          #
          #   @param instructions [String] Optional natural-language instructions guiding what to extract.
          #
          #   @param max_depth [Integer] Optional maximum link depth from the starting URL (0 = only the starting page).
          #
          #   @param max_pages [Integer] Maximum number of pages to analyze during extraction.
          #
          #   @param schema [Hash{Symbol=>Object}] JSON Schema describing the structured data to extract and watch for changes. If
          #
          #   @param type [Symbol, :extract]
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::MonitorUpdateResponse::Target::Page, ContextDev::Models::MonitorUpdateResponse::Target::Sitemap, ContextDev::Models::MonitorUpdateResponse::Target::Extract)]
      end

      # @see ContextDev::Models::MonitorUpdateResponse#last_error
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

      # @see ContextDev::Models::MonitorUpdateResponse#webhook
      class Webhook < ContextDev::Internal::Type::BaseModel
        # @!attribute url
        #   Webhook URL called when a change is detected.
        #
        #   @return [String]
        required :url, String

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

        # @!method initialize(url:, secret: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorUpdateResponse::Webhook} for more details.
        #
        #   @param url [String] Webhook URL called when a change is detected.
        #
        #   @param secret [String] Signing secret used to verify webhook authenticity. Each delivery includes an `X
      end
    end
  end
end
