# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#update
    class MonitorUpdateParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute monitor_id
      #   ID of the monitor.
      #
      #   @return [String]
      required :monitor_id, String

      # @!attribute change_detection
      #   How changes are judged. Defaults to `semantic` for extract targets and page
      #   targets with `instructions`, otherwise `exact`.
      #
      #   @return [ContextDev::Models::MonitorUpdateParams::ChangeDetection::Exact, ContextDev::Models::MonitorUpdateParams::ChangeDetection::Semantic, nil]
      optional :change_detection, union: -> { ContextDev::MonitorUpdateParams::ChangeDetection }

      # @!attribute name
      #   Display name for the monitor.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute schedule
      #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
      #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
      #   between 10 minutes and 1 year.
      #
      #   @return [ContextDev::Models::MonitorUpdateParams::Schedule, nil]
      optional :schedule, -> { ContextDev::MonitorUpdateParams::Schedule }

      # @!attribute status
      #   Set `paused` to stop scheduled runs or `active` to resume them.
      #
      #   @return [Symbol, ContextDev::Models::MonitorUpdateParams::Status, nil]
      optional :status, enum: -> { ContextDev::MonitorUpdateParams::Status }

      # @!attribute tags
      #   Labels for filtering monitors, their changes, and their usage.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute target
      #   What to watch: a page, a sitemap, or data extracted from a site.
      #
      #   @return [ContextDev::Models::MonitorUpdateParams::Target::Page, ContextDev::Models::MonitorUpdateParams::Target::Sitemap, ContextDev::Models::MonitorUpdateParams::Target::Extract, nil]
      optional :target, union: -> { ContextDev::MonitorUpdateParams::Target }

      # @!attribute webhook
      #   Set to null to remove the webhook. Changing `url` issues a new secret.
      #
      #   @return [ContextDev::Models::MonitorUpdateParams::Webhook, nil]
      optional :webhook, -> { ContextDev::MonitorUpdateParams::Webhook }, nil?: true

      # @!method initialize(monitor_id:, change_detection: nil, name: nil, schedule: nil, status: nil, tags: nil, target: nil, webhook: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorUpdateParams} for more details.
      #
      #   @param monitor_id [String] ID of the monitor.
      #
      #   @param change_detection [ContextDev::Models::MonitorUpdateParams::ChangeDetection::Exact, ContextDev::Models::MonitorUpdateParams::ChangeDetection::Semantic] How changes are judged. Defaults to `semantic` for extract targets and page targ
      #
      #   @param name [String] Display name for the monitor.
      #
      #   @param schedule [ContextDev::Models::MonitorUpdateParams::Schedule] Run the monitor on a fixed interval defined by a frequency and a unit, e.g. ever
      #
      #   @param status [Symbol, ContextDev::Models::MonitorUpdateParams::Status] Set `paused` to stop scheduled runs or `active` to resume them.
      #
      #   @param tags [Array<String>] Labels for filtering monitors, their changes, and their usage.
      #
      #   @param target [ContextDev::Models::MonitorUpdateParams::Target::Page, ContextDev::Models::MonitorUpdateParams::Target::Sitemap, ContextDev::Models::MonitorUpdateParams::Target::Extract] What to watch: a page, a sitemap, or data extracted from a site.
      #
      #   @param webhook [ContextDev::Models::MonitorUpdateParams::Webhook, nil] Set to null to remove the webhook. Changing `url` issues a new secret.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # How changes are judged. Defaults to `semantic` for extract targets and page
      # targets with `instructions`, otherwise `exact`.
      module ChangeDetection
        extend ContextDev::Internal::Type::Union

        discriminator :type

        # Detect exact changes. For page targets, this means visible text diffs. For sitemap targets, this means URL additions and removals.
        variant :exact, -> { ContextDev::MonitorUpdateParams::ChangeDetection::Exact }

        # Detect meaningful content changes using the target’s instructions and optional schema.
        variant :semantic, -> { ContextDev::MonitorUpdateParams::ChangeDetection::Semantic }

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
        #   @return [Array(ContextDev::Models::MonitorUpdateParams::ChangeDetection::Exact, ContextDev::Models::MonitorUpdateParams::ChangeDetection::Semantic)]
      end

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
        #   @return [Symbol, ContextDev::Models::MonitorUpdateParams::Schedule::Type]
        required :type, enum: -> { ContextDev::MonitorUpdateParams::Schedule::Type }

        # @!attribute unit
        #   Time unit used with `frequency` to set the run interval.
        #
        #   @return [Symbol, ContextDev::Models::MonitorUpdateParams::Schedule::Unit]
        required :unit, enum: -> { ContextDev::MonitorUpdateParams::Schedule::Unit }

        # @!method initialize(frequency:, type:, unit:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorUpdateParams::Schedule} for more details.
        #
        #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
        #   between 10 minutes and 1 year.
        #
        #   @param frequency [Integer] Number of units between runs. The resulting interval (frequency × unit) must be
        #
        #   @param type [Symbol, ContextDev::Models::MonitorUpdateParams::Schedule::Type] Use `interval` to run on a repeating schedule.
        #
        #   @param unit [Symbol, ContextDev::Models::MonitorUpdateParams::Schedule::Unit] Time unit used with `frequency` to set the run interval.

        # Use `interval` to run on a repeating schedule.
        #
        # @see ContextDev::Models::MonitorUpdateParams::Schedule#type
        module Type
          extend ContextDev::Internal::Type::Enum

          INTERVAL = :interval

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Time unit used with `frequency` to set the run interval.
        #
        # @see ContextDev::Models::MonitorUpdateParams::Schedule#unit
        module Unit
          extend ContextDev::Internal::Type::Enum

          MINUTES = :minutes
          HOURS = :hours
          DAYS = :days

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # Set `paused` to stop scheduled runs or `active` to resume them.
      module Status
        extend ContextDev::Internal::Type::Enum

        ACTIVE = :active
        PAUSED = :paused

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # What to watch: a page, a sitemap, or data extracted from a site.
      module Target
        extend ContextDev::Internal::Type::Union

        discriminator :type

        # Watch a single web page. Exact detection reports visible-text diffs; semantic detection judges confirmed stable diffs against `instructions`.
        variant :page, -> { ContextDev::MonitorUpdateParams::Target::Page }

        # Watch a site’s URL inventory for confirmed additions and removals.
        variant :sitemap, -> { ContextDev::MonitorUpdateParams::Target::Sitemap }

        # Track relevant pages selected by `schema` and `instructions`; refresh the page set periodically.
        variant :extract, -> { ContextDev::MonitorUpdateParams::Target::Extract }

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
          #   @return [Array<ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Wait, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Perform, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll>, nil]
          optional :actions,
                   -> {
                     ContextDev::Internal::Type::ArrayOf[union: ContextDev::MonitorUpdateParams::Target::Page::Action]
                   },
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
          #   {ContextDev::Models::MonitorUpdateParams::Target::Page} for more details.
          #
          #   Watch a single web page. Exact detection reports visible-text diffs; semantic
          #   detection judges confirmed stable diffs against `instructions`.
          #
          #   @param url [String] Public HTTP(S) page URL to monitor.
          #
          #   @param actions [Array<ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Wait, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Perform, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll>, nil] Optional browser actions executed in array order after the page loads, before co
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
            variant :wait, -> { ContextDev::MonitorUpdateParams::Target::Page::Action::Wait }

            # Resolve and perform one natural-language browser action.
            variant :perform, -> { ContextDev::MonitorUpdateParams::Target::Page::Action::Perform }

            # Scroll the page or a selected scrollable container, waiting adaptively for content and dimensions to settle after each iteration.
            variant :scroll, -> { ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll }

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
              #   @return [Integer, Symbol, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll::Amount, nil]
              optional :amount, union: -> { ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Amount }

              # @!attribute container
              #   CSS selector for the first matching scroll container. Defaults to the page.
              #
              #   @return [String, nil]
              optional :container, String

              # @!attribute direction
              #   Direction to scroll. Defaults to down.
              #
              #   @return [Symbol, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll::Direction, nil]
              optional :direction, enum: -> { ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Direction }

              # @!attribute max_scrolls
              #   Maximum scroll iterations. Stops early when scrolling and scrollable extent stop
              #   changing. Defaults to 1.
              #
              #   @return [Integer, nil]
              optional :max_scrolls, Integer, api_name: :maxScrolls

              # @!method initialize(amount: nil, container: nil, direction: nil, max_scrolls: nil, do_: :scroll)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll} for more
              #   details.
              #
              #   Scroll the page or a selected scrollable container, waiting adaptively for
              #   content and dimensions to settle after each iteration.
              #
              #   @param amount [Integer, Symbol, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll::Amount] Pixels per scroll, one visible viewport, or the current scroll boundary. Default
              #
              #   @param container [String] CSS selector for the first matching scroll container. Defaults to the page.
              #
              #   @param direction [Symbol, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll::Direction] Direction to scroll. Defaults to down.
              #
              #   @param max_scrolls [Integer] Maximum scroll iterations. Stops early when scrolling and scrollable extent stop
              #
              #   @param do_ [Symbol, :scroll] Use `scroll` to move through the page or a container.

              # Pixels per scroll, one visible viewport, or the current scroll boundary.
              # Defaults to viewport.
              #
              # @see ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll#amount
              module Amount
                extend ContextDev::Internal::Type::Union

                variant Integer

                variant const: -> { ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll::Amount::VIEWPORT }

                variant const: -> { ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll::Amount::MAX }

                # @!method self.variants
                #   @return [Array(Integer, Symbol)]

                define_sorbet_constant!(:Variants) do
                  T.type_alias { T.any(Integer, ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Amount::TaggedSymbol) }
                end

                # @!group

                VIEWPORT = :viewport
                MAX = :max

                # @!endgroup
              end

              # Direction to scroll. Defaults to down.
              #
              # @see ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll#direction
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
            #   @return [Array(ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Wait, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Perform, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll)]
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
          #   {ContextDev::Models::MonitorUpdateParams::Target::Extract} for more details.
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
        #   @return [Array(ContextDev::Models::MonitorUpdateParams::Target::Page, ContextDev::Models::MonitorUpdateParams::Target::Sitemap, ContextDev::Models::MonitorUpdateParams::Target::Extract)]
      end

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
        #   @return [Array<Symbol, ContextDev::Models::MonitorUpdateParams::Webhook::Event>, nil]
        optional :events,
                 -> { ContextDev::Internal::Type::ArrayOf[enum: ContextDev::MonitorUpdateParams::Webhook::Event] }

        # @!attribute retry_
        #   Webhook retry settings. Use {} for the default schedule.
        #
        #   @return [ContextDev::Models::RetryConfig, nil]
        optional :retry_, -> { ContextDev::RetryConfig }, api_name: :retry

        # @!method initialize(url:, events: nil, retry_: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorUpdateParams::Webhook} for more details.
        #
        #   Set to null to remove the webhook. Changing `url` issues a new secret.
        #
        #   @param url [String] Public HTTP(S) URL that receives events. Slack and GovSlack URLs get formatted m
        #
        #   @param events [Array<Symbol, ContextDev::Models::MonitorUpdateParams::Webhook::Event>] Events to deliver. Defaults to `change.detected`; `run.completed` also includes
        #
        #   @param retry_ [ContextDev::Models::RetryConfig] Webhook retry settings. Use {} for the default schedule.

        module Event
          extend ContextDev::Internal::Type::Enum

          CHANGE_DETECTED = :"change.detected"
          RUN_COMPLETED = :"run.completed"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
