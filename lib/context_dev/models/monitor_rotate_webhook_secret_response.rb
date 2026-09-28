# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#rotate_webhook_secret
    class MonitorRotateWebhookSecretResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute change_detection
      #   How changes are judged. Defaults to `semantic` for extract targets and page
      #   targets with `instructions`, otherwise `exact`.
      #
      #   @return [ContextDev::Models::MonitorRotateWebhookSecretResponse::ChangeDetection::Exact, ContextDev::Models::MonitorRotateWebhookSecretResponse::ChangeDetection::Semantic]
      required :change_detection,
               union: -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::ChangeDetection }

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute mode
      #   Always `web`. Optional.
      #
      #   @return [Symbol, ContextDev::Models::MonitorRotateWebhookSecretResponse::Mode]
      required :mode, enum: -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Mode }

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute status
      #   Current state. Failed monitors keep running; paused monitors must be resumed
      #   with `status: "active"`.
      #
      #   @return [Symbol, ContextDev::Models::MonitorRotateWebhookSecretResponse::Status]
      required :status, enum: -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Status }

      # @!attribute target
      #   What to watch: a page, a sitemap, or data extracted from a site.
      #
      #   @return [ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page, ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Sitemap, ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Extract]
      required :target, union: -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Target }

      # @!attribute updated_at
      #
      #   @return [Time]
      required :updated_at, Time

      # @!attribute baseline
      #   Comparison baseline, included on Retrieve. Null until capture completes or after
      #   target changes.
      #
      #   @return [ContextDev::Models::MonitorRotateWebhookSecretResponse::Baseline::MonitorsPageBaseline, ContextDev::Models::MonitorRotateWebhookSecretResponse::Baseline::MonitorsSitemapBaseline, ContextDev::Models::MonitorRotateWebhookSecretResponse::Baseline::MonitorsExtractBaseline, nil]
      optional :baseline,
               union: -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Baseline },
               nil?: true

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::MonitorRotateWebhookSecretResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::KeyMetadata }

      # @!attribute last_change_at
      #
      #   @return [Time, nil]
      optional :last_change_at, Time, nil?: true

      # @!attribute last_error
      #   Error from the most recent failed run; null when the last run succeeded.
      #
      #   @return [ContextDev::Models::MonitorRotateWebhookSecretResponse::LastError, nil]
      optional :last_error, -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::LastError }, nil?: true

      # @!attribute last_run_at
      #
      #   @return [Time, nil]
      optional :last_run_at, Time, nil?: true

      # @!attribute next_run_at
      #   When the next scheduled run is due; null while paused.
      #
      #   @return [Time, nil]
      optional :next_run_at, Time, nil?: true

      # @!attribute schedule
      #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
      #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
      #   between 10 minutes and 1 year.
      #
      #   @return [ContextDev::Models::MonitorRotateWebhookSecretResponse::Schedule, nil]
      optional :schedule, -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Schedule }

      # @!attribute tags
      #   Labels for filtering monitors, their changes, and their usage.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute webhook
      #   Webhook destination and delivery settings. Null means no webhook is configured.
      #
      #   @return [ContextDev::Models::MonitorRotateWebhookSecretResponse::Webhook, nil]
      optional :webhook, -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Webhook }, nil?: true

      # @!attribute webhook_failure
      #   Present while webhook deliveries are failing consecutively; null when deliveries
      #   are healthy or no webhook is configured. Cleared on the next successful delivery
      #   and when the webhook URL changes.
      #
      #   @return [ContextDev::Models::MonitorRotateWebhookSecretResponse::WebhookFailure, nil]
      optional :webhook_failure,
               -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::WebhookFailure },
               nil?: true

      # @!method initialize(id:, change_detection:, created_at:, mode:, name:, request_id:, status:, target:, updated_at:, baseline: nil, key_metadata: nil, last_change_at: nil, last_error: nil, last_run_at: nil, next_run_at: nil, schedule: nil, tags: nil, webhook: nil, webhook_failure: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorRotateWebhookSecretResponse} for more details.
      #
      #   @param id [String]
      #
      #   @param change_detection [ContextDev::Models::MonitorRotateWebhookSecretResponse::ChangeDetection::Exact, ContextDev::Models::MonitorRotateWebhookSecretResponse::ChangeDetection::Semantic] How changes are judged. Defaults to `semantic` for extract targets and page targ
      #
      #   @param created_at [Time]
      #
      #   @param mode [Symbol, ContextDev::Models::MonitorRotateWebhookSecretResponse::Mode] Always `web`. Optional.
      #
      #   @param name [String]
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param status [Symbol, ContextDev::Models::MonitorRotateWebhookSecretResponse::Status] Current state. Failed monitors keep running; paused monitors must be resumed wit
      #
      #   @param target [ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page, ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Sitemap, ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Extract] What to watch: a page, a sitemap, or data extracted from a site.
      #
      #   @param updated_at [Time]
      #
      #   @param baseline [ContextDev::Models::MonitorRotateWebhookSecretResponse::Baseline::MonitorsPageBaseline, ContextDev::Models::MonitorRotateWebhookSecretResponse::Baseline::MonitorsSitemapBaseline, ContextDev::Models::MonitorRotateWebhookSecretResponse::Baseline::MonitorsExtractBaseline, nil] Comparison baseline, included on Retrieve. Null until capture completes or after
      #
      #   @param key_metadata [ContextDev::Models::MonitorRotateWebhookSecretResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param last_change_at [Time, nil]
      #
      #   @param last_error [ContextDev::Models::MonitorRotateWebhookSecretResponse::LastError, nil] Error from the most recent failed run; null when the last run succeeded.
      #
      #   @param last_run_at [Time, nil]
      #
      #   @param next_run_at [Time, nil] When the next scheduled run is due; null while paused.
      #
      #   @param schedule [ContextDev::Models::MonitorRotateWebhookSecretResponse::Schedule] Run the monitor on a fixed interval defined by a frequency and a unit, e.g. ever
      #
      #   @param tags [Array<String>] Labels for filtering monitors, their changes, and their usage.
      #
      #   @param webhook [ContextDev::Models::MonitorRotateWebhookSecretResponse::Webhook, nil] Webhook destination and delivery settings. Null means no webhook is configured.
      #
      #   @param webhook_failure [ContextDev::Models::MonitorRotateWebhookSecretResponse::WebhookFailure, nil] Present while webhook deliveries are failing consecutively; null when deliveries

      # How changes are judged. Defaults to `semantic` for extract targets and page
      # targets with `instructions`, otherwise `exact`.
      #
      # @see ContextDev::Models::MonitorRotateWebhookSecretResponse#change_detection
      module ChangeDetection
        extend ContextDev::Internal::Type::Union

        discriminator :type

        # Detect exact changes. For page targets, this means visible text diffs. For sitemap targets, this means URL additions and removals.
        variant :exact, -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::ChangeDetection::Exact }

        # Detect meaningful content changes using the target’s instructions and optional schema.
        variant :semantic,
                -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::ChangeDetection::Semantic }

        class Exact < ContextDev::Internal::Type::BaseModel
          # @!attribute type
          #   Use `exact` to compare visible text or sitemap URLs.
          #
          #   @return [Symbol, :exact]
          required :type, const: :exact

          # @!method initialize(type: :exact)
          #   Detect exact changes. For page targets, this means visible text diffs. For
          #   sitemap targets, this means URL additions and removals.
          #
          #   @param type [Symbol, :exact] Use `exact` to compare visible text or sitemap URLs.
        end

        class Semantic < ContextDev::Internal::Type::BaseModel
          # @!attribute type
          #   Use `semantic` to judge changes against the target instructions.
          #
          #   @return [Symbol, :semantic]
          required :type, const: :semantic

          # @!attribute confidence_threshold
          #   Minimum confidence required to report a meaningful change, from 0 to 1.
          #
          #   @return [Float, nil]
          optional :confidence_threshold, Float

          # @!method initialize(confidence_threshold: nil, type: :semantic)
          #   Detect meaningful content changes using the target’s instructions and optional
          #   schema.
          #
          #   @param confidence_threshold [Float] Minimum confidence required to report a meaningful change, from 0 to 1.
          #
          #   @param type [Symbol, :semantic] Use `semantic` to judge changes against the target instructions.
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::MonitorRotateWebhookSecretResponse::ChangeDetection::Exact, ContextDev::Models::MonitorRotateWebhookSecretResponse::ChangeDetection::Semantic)]
      end

      # Always `web`. Optional.
      #
      # @see ContextDev::Models::MonitorRotateWebhookSecretResponse#mode
      module Mode
        extend ContextDev::Internal::Type::Enum

        WEB = :web

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Current state. Failed monitors keep running; paused monitors must be resumed
      # with `status: "active"`.
      #
      # @see ContextDev::Models::MonitorRotateWebhookSecretResponse#status
      module Status
        extend ContextDev::Internal::Type::Enum

        ACTIVE = :active
        PAUSED = :paused
        FAILED = :failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # What to watch: a page, a sitemap, or data extracted from a site.
      #
      # @see ContextDev::Models::MonitorRotateWebhookSecretResponse#target
      module Target
        extend ContextDev::Internal::Type::Union

        discriminator :type

        # Watch a single web page. Exact detection reports visible-text diffs; semantic detection judges confirmed stable diffs against `instructions`.
        variant :page, -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page }

        # Watch a site’s URL inventory for confirmed additions and removals.
        variant :sitemap, -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Sitemap }

        # Track relevant pages selected by `schema` and `instructions`; refresh the page set periodically.
        variant :extract, -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Extract }

        class Page < ContextDev::Internal::Type::BaseModel
          # @!attribute type
          #   Use `page` to watch one web page.
          #
          #   @return [Symbol, :page]
          required :type, const: :page

          # @!attribute url
          #   Public HTTP(S) page URL to monitor.
          #
          #   @return [String]
          required :url, String

          # @!attribute actions
          #   Optional browser actions executed in array order after the page loads, before
          #   content is captured, on every run. Requires a paid plan. Maximum: 5 actions.
          #   Changes create a new baseline.
          #
          #   @return [Array<ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Wait, ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Perform, ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Scroll>, nil]
          optional :actions,
                   -> { ContextDev::Internal::Type::ArrayOf[union: ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action] },
                   nil?: true

          # @!attribute exclude_selectors
          #   Remove matching regions after inclusions. Changes create a new baseline.
          #
          #   @return [Array<String>, nil]
          optional :exclude_selectors, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute include_selectors
          #   Monitor these CSS-selected regions. Empty or omitted uses main content. Changes
          #   create a new baseline.
          #
          #   @return [Array<String>, nil]
          optional :include_selectors, ContextDev::Internal::Type::ArrayOf[String]

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

          # @!method initialize(url:, actions: nil, exclude_selectors: nil, include_selectors: nil, instructions: nil, normalize_whitespace: nil, type: :page)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page} for more
          #   details.
          #
          #   Watch a single web page. Exact detection reports visible-text diffs; semantic
          #   detection judges confirmed stable diffs against `instructions`.
          #
          #   @param url [String] Public HTTP(S) page URL to monitor.
          #
          #   @param actions [Array<ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Wait, ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Perform, ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Scroll>, nil] Optional browser actions executed in array order after the page loads, before co
          #
          #   @param exclude_selectors [Array<String>] Remove matching regions after inclusions. Changes create a new baseline.
          #
          #   @param include_selectors [Array<String>] Monitor these CSS-selected regions. Empty or omitted uses main content. Changes
          #
          #   @param instructions [String] Plain-language goal describing which page changes matter. When provided without
          #
          #   @param normalize_whitespace [Boolean] Normalize whitespace before comparing or analyzing text.
          #
          #   @param type [Symbol, :page] Use `page` to watch one web page.

          # Browser action discriminated by `do`. Each variant exposes only its applicable
          # fields.
          module Action
            extend ContextDev::Internal::Type::Union

            discriminator :do

            # Pause for a fixed number of milliseconds before continuing to the next action.
            variant :wait, -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Wait }

            # Resolve and perform one natural-language browser action.
            variant :perform,
                    -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Perform }

            # Scroll the page or a selected scrollable container, waiting adaptively for content and dimensions to settle after each iteration.
            variant :scroll,
                    -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Scroll }

            class Wait < ContextDev::Internal::Type::BaseModel
              # @!attribute do_
              #   Use `wait` to pause for a fixed duration.
              #
              #   @return [Symbol, :wait]
              required :do_, const: :wait, api_name: :do

              # @!attribute time_ms
              #   Time to pause in milliseconds before the next action.
              #
              #   @return [Integer]
              required :time_ms, Integer, api_name: :timeMs

              # @!method initialize(time_ms:, do_: :wait)
              #   Pause for a fixed number of milliseconds before continuing to the next action.
              #
              #   @param time_ms [Integer] Time to pause in milliseconds before the next action.
              #
              #   @param do_ [Symbol, :wait] Use `wait` to pause for a fixed duration.
            end

            class Perform < ContextDev::Internal::Type::BaseModel
              # @!attribute action
              #   One browser instruction, such as clicking a button or entering text.
              #
              #   @return [String]
              required :action, String

              # @!attribute do_
              #   Use `perform` for a plain-language browser instruction.
              #
              #   @return [Symbol, :perform]
              required :do_, const: :perform, api_name: :do

              # @!method initialize(action:, do_: :perform)
              #   Resolve and perform one natural-language browser action.
              #
              #   @param action [String] One browser instruction, such as clicking a button or entering text.
              #
              #   @param do_ [Symbol, :perform] Use `perform` for a plain-language browser instruction.
            end

            class Scroll < ContextDev::Internal::Type::BaseModel
              # @!attribute do_
              #   Use `scroll` to move through the page or a container.
              #
              #   @return [Symbol, :scroll]
              required :do_, const: :scroll, api_name: :do

              # @!attribute amount
              #   Pixels per scroll, one visible viewport, or the current scroll boundary.
              #   Defaults to viewport.
              #
              #   @return [Integer, Symbol, ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Scroll::Amount, nil]
              optional :amount,
                       union: -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Scroll::Amount }

              # @!attribute container
              #   CSS selector for the first matching scroll container. Defaults to the page.
              #
              #   @return [String, nil]
              optional :container, String

              # @!attribute direction
              #   Direction to scroll. Defaults to down.
              #
              #   @return [Symbol, ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Scroll::Direction, nil]
              optional :direction,
                       enum: -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Scroll::Direction }

              # @!attribute max_scrolls
              #   Maximum scroll iterations. Stops early when scrolling and scrollable extent stop
              #   changing. Defaults to 1.
              #
              #   @return [Integer, nil]
              optional :max_scrolls, Integer, api_name: :maxScrolls

              # @!method initialize(amount: nil, container: nil, direction: nil, max_scrolls: nil, do_: :scroll)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Scroll}
              #   for more details.
              #
              #   Scroll the page or a selected scrollable container, waiting adaptively for
              #   content and dimensions to settle after each iteration.
              #
              #   @param amount [Integer, Symbol, ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Scroll::Amount] Pixels per scroll, one visible viewport, or the current scroll boundary. Default
              #
              #   @param container [String] CSS selector for the first matching scroll container. Defaults to the page.
              #
              #   @param direction [Symbol, ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Scroll::Direction] Direction to scroll. Defaults to down.
              #
              #   @param max_scrolls [Integer] Maximum scroll iterations. Stops early when scrolling and scrollable extent stop
              #
              #   @param do_ [Symbol, :scroll] Use `scroll` to move through the page or a container.

              # Pixels per scroll, one visible viewport, or the current scroll boundary.
              # Defaults to viewport.
              #
              # @see ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Scroll#amount
              module Amount
                extend ContextDev::Internal::Type::Union

                variant Integer

                variant const: -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Scroll::Amount::VIEWPORT }

                variant const: -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Scroll::Amount::MAX }

                # @!method self.variants
                #   @return [Array(Integer, Symbol)]

                define_sorbet_constant!(:Variants) do
                  T.type_alias do
                    T.any(
                      Integer,
                      ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Scroll::Amount::TaggedSymbol
                    )
                  end
                end

                # @!group

                VIEWPORT = :viewport
                MAX = :max

                # @!endgroup
              end

              # Direction to scroll. Defaults to down.
              #
              # @see ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Scroll#direction
              module Direction
                extend ContextDev::Internal::Type::Enum

                UP = :up
                DOWN = :down
                LEFT = :left
                RIGHT = :right

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @!method self.variants
            #   @return [Array(ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Wait, ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Perform, ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page::Action::Scroll)]
          end
        end

        class Sitemap < ContextDev::Internal::Type::BaseModel
          # @!attribute type
          #   Use `sitemap` to watch a site for added or removed URLs.
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
          #   Watch a site’s URL inventory for confirmed additions and removals.
          #
          #   @param url [String] Sitemap URL to monitor.
          #
          #   @param exclude [Array<String>] URL path patterns to exclude (max 50).
          #
          #   @param include [Array<String>] URL path patterns to include (max 50).
          #
          #   @param max_urls [Integer] Maximum number of sitemap URLs to track (capped at 10,000).
          #
          #   @param type [Symbol, :sitemap] Use `sitemap` to watch a site for added or removed URLs.
        end

        class Extract < ContextDev::Internal::Type::BaseModel
          # @!attribute instructions
          #   Natural-language instructions guiding which pages and facts to track and which
          #   changes to report.
          #
          #   @return [String]
          required :instructions, String

          # @!attribute type
          #   Use `extract` to watch structured data across selected pages.
          #
          #   @return [Symbol, :extract]
          required :type, const: :extract

          # @!attribute url
          #   Root URL to extract structured data from.
          #
          #   @return [String]
          required :url, String

          # @!attribute follow_subdomains
          #   Allow page discovery on subdomains of the target site.
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
          #   JSON Schema for page selection and the baseline snapshot. Changes return diffs
          #   and evidence.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :schema, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

          # @!method initialize(instructions:, url:, follow_subdomains: nil, max_depth: nil, max_pages: nil, schema: nil, type: :extract)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Extract} for
          #   more details.
          #
          #   Track relevant pages selected by `schema` and `instructions`; refresh the page
          #   set periodically.
          #
          #   @param instructions [String] Natural-language instructions guiding which pages and facts to track and which c
          #
          #   @param url [String] Root URL to extract structured data from.
          #
          #   @param follow_subdomains [Boolean] Allow page discovery on subdomains of the target site.
          #
          #   @param max_depth [Integer] Optional maximum link depth from the starting URL (0 = only the starting page).
          #
          #   @param max_pages [Integer] Maximum number of pages to track.
          #
          #   @param schema [Hash{Symbol=>Object}] JSON Schema for page selection and the baseline snapshot. Changes return diffs a
          #
          #   @param type [Symbol, :extract] Use `extract` to watch structured data across selected pages.
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Page, ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Sitemap, ContextDev::Models::MonitorRotateWebhookSecretResponse::Target::Extract)]
      end

      # Comparison baseline, included on Retrieve. Null until capture completes or after
      # target changes.
      #
      # @see ContextDev::Models::MonitorRotateWebhookSecretResponse#baseline
      module Baseline
        extend ContextDev::Internal::Type::Union

        # Current baseline of a `page` monitor: the visible page text as last observed.
        variant -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Baseline::MonitorsPageBaseline }

        # Current baseline of a `sitemap` monitor: the normalized URL set as last observed.
        variant -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Baseline::MonitorsSitemapBaseline }

        # Current baseline of an `extract` monitor: the pages it tracks and the structured data as last extracted.
        variant -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Baseline::MonitorsExtractBaseline }

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
          #   Latest structured snapshot matching the extraction schema, refreshed at most
          #   daily; `null` before capture.
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
          #   {ContextDev::Models::MonitorRotateWebhookSecretResponse::Baseline::MonitorsExtractBaseline}
          #   for more details.
          #
          #   Current baseline of an `extract` monitor: the pages it tracks and the structured
          #   data as last extracted.
          #
          #   @param captured_at [Time] When this baseline was last captured or replaced.
          #
          #   @param data [Object] Latest structured snapshot matching the extraction schema, refreshed at most dai
          #
          #   @param urls_analyzed [Array<String>] The page URLs the monitor tracks and analyzes for changes.
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::MonitorRotateWebhookSecretResponse::Baseline::MonitorsPageBaseline, ContextDev::Models::MonitorRotateWebhookSecretResponse::Baseline::MonitorsSitemapBaseline, ContextDev::Models::MonitorRotateWebhookSecretResponse::Baseline::MonitorsExtractBaseline)]
      end

      # @see ContextDev::Models::MonitorRotateWebhookSecretResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits remaining for your organization.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits remaining for your organization.
      end

      # @see ContextDev::Models::MonitorRotateWebhookSecretResponse#last_error
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

      # @see ContextDev::Models::MonitorRotateWebhookSecretResponse#schedule
      class Schedule < ContextDev::Internal::Type::BaseModel
        # @!attribute frequency
        #   Number of units between runs. The resulting interval (frequency × unit) must be
        #   at least 10 minutes and at most 1 year (e.g. minimum 10 when unit is minutes;
        #   maximum 365 when unit is days).
        #
        #   @return [Integer]
        required :frequency, Integer

        # @!attribute type
        #   Use `interval` to run on a repeating schedule.
        #
        #   @return [Symbol, ContextDev::Models::MonitorRotateWebhookSecretResponse::Schedule::Type]
        required :type, enum: -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Schedule::Type }

        # @!attribute unit
        #   Time unit used with `frequency` to set the run interval.
        #
        #   @return [Symbol, ContextDev::Models::MonitorRotateWebhookSecretResponse::Schedule::Unit]
        required :unit, enum: -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::Schedule::Unit }

        # @!method initialize(frequency:, type:, unit:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorRotateWebhookSecretResponse::Schedule} for more
        #   details.
        #
        #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
        #   between 10 minutes and 1 year.
        #
        #   @param frequency [Integer] Number of units between runs. The resulting interval (frequency × unit) must be
        #
        #   @param type [Symbol, ContextDev::Models::MonitorRotateWebhookSecretResponse::Schedule::Type] Use `interval` to run on a repeating schedule.
        #
        #   @param unit [Symbol, ContextDev::Models::MonitorRotateWebhookSecretResponse::Schedule::Unit] Time unit used with `frequency` to set the run interval.

        # Use `interval` to run on a repeating schedule.
        #
        # @see ContextDev::Models::MonitorRotateWebhookSecretResponse::Schedule#type
        module Type
          extend ContextDev::Internal::Type::Enum

          INTERVAL = :interval

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Time unit used with `frequency` to set the run interval.
        #
        # @see ContextDev::Models::MonitorRotateWebhookSecretResponse::Schedule#unit
        module Unit
          extend ContextDev::Internal::Type::Enum

          MINUTES = :minutes
          HOURS = :hours
          DAYS = :days

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::MonitorRotateWebhookSecretResponse#webhook
      class Webhook < ContextDev::Internal::Type::BaseModel
        # @!attribute url
        #   Public HTTP(S) URL that receives events. Slack and GovSlack URLs get formatted
        #   messages.
        #
        #   @return [String]
        required :url, String

        # @!attribute events
        #   Events to deliver. Defaults to `change.detected`; `run.completed` also includes
        #   unchanged runs.
        #
        #   @return [Array<Symbol, ContextDev::Models::MonitorRotateWebhookSecretResponse::Webhook::Event>, nil]
        optional :events,
                 -> { ContextDev::Internal::Type::ArrayOf[enum: ContextDev::Models::MonitorRotateWebhookSecretResponse::Webhook::Event] }

        # @!attribute retry_
        #   Webhook retry settings. Use {} for the default schedule.
        #
        #   @return [ContextDev::Models::RetryConfig, nil]
        optional :retry_, -> { ContextDev::RetryConfig }, api_name: :retry

        response_only do
          # @!attribute secret
          #   API-generated signing secret. Visible only with full access or `monitors:write`
          #   permission.
          #
          #   @return [String, nil]
          optional :secret, String
        end

        # @!method initialize(url:, events: nil, retry_: nil, secret: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorRotateWebhookSecretResponse::Webhook} for more
        #   details.
        #
        #   Webhook destination and delivery settings. Null means no webhook is configured.
        #
        #   @param url [String] Public HTTP(S) URL that receives events. Slack and GovSlack URLs get formatted m
        #
        #   @param events [Array<Symbol, ContextDev::Models::MonitorRotateWebhookSecretResponse::Webhook::Event>] Events to deliver. Defaults to `change.detected`; `run.completed` also includes
        #
        #   @param retry_ [ContextDev::Models::RetryConfig] Webhook retry settings. Use {} for the default schedule.
        #
        #   @param secret [String] API-generated signing secret. Visible only with full access or `monitors:write`

        module Event
          extend ContextDev::Internal::Type::Enum

          CHANGE_DETECTED = :"change.detected"
          RUN_COMPLETED = :"run.completed"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::MonitorRotateWebhookSecretResponse#webhook_failure
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
        #   @return [Symbol, ContextDev::Models::MonitorRotateWebhookSecretResponse::WebhookFailure::LastStatus]
        required :last_status,
                 enum: -> { ContextDev::Models::MonitorRotateWebhookSecretResponse::WebhookFailure::LastStatus }

        # @!method initialize(consecutive_failures:, last_failed_at:, last_message:, last_status:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorRotateWebhookSecretResponse::WebhookFailure} for
        #   more details.
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
        #   @param last_status [Symbol, ContextDev::Models::MonitorRotateWebhookSecretResponse::WebhookFailure::LastStatus] Outcome of the most recent failed delivery. rejected means a non-2xx response; f

        # Outcome of the most recent failed delivery. rejected means a non-2xx response;
        # failed means no HTTP response was received; skipped_unsafe_url means the URL
        # failed the public-endpoint safety check.
        #
        # @see ContextDev::Models::MonitorRotateWebhookSecretResponse::WebhookFailure#last_status
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
