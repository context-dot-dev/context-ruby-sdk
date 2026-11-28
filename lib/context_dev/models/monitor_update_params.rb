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
      #   How changes are judged. Defaults to `semantic` for extract and search targets
      #   and for page targets with `instructions`; otherwise `exact`. Sitemap targets
      #   support only `exact`, and extract targets only `semantic`.
      #
      #   @return [ContextDev::Models::MonitorUpdateParams::ChangeDetection::Exact, ContextDev::Models::MonitorUpdateParams::ChangeDetection::Semantic, nil]
      optional :change_detection, union: -> { ContextDev::MonitorUpdateParams::ChangeDetection }

      # @!attribute name
      #   Display name for the monitor.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute policies
      #   Access policy IDs to apply to every run, or an empty list to remove them.
      #   Requires access policies enabled for your organization; otherwise returns
      #   `ACCESS_POLICIES_NOT_ENABLED`.
      #
      #   @return [Array<String>, nil]
      optional :policies, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute schedule
      #   Run the monitor at a fixed interval, such as every 6 hours or every 2 days. The
      #   interval must be between 10 minutes and 1 year.
      #
      #   @return [ContextDev::Models::MonitorUpdateParams::Schedule, nil]
      optional :schedule, -> { ContextDev::MonitorUpdateParams::Schedule }

      # @!attribute status
      #   Set `paused` to stop scheduled runs or `active` to resume them. A resumed
      #   monitor runs promptly instead of waiting a full interval.
      #
      #   @return [Symbol, ContextDev::Models::MonitorUpdateParams::Status, nil]
      optional :status, enum: -> { ContextDev::MonitorUpdateParams::Status }

      # @!attribute tags
      #   Labels for grouping monitors. Filter monitors, changes, and credit usage by tag.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute target
      #   What to watch: a page, a sitemap, data extracted from a site, or web search
      #   results.
      #
      #   @return [ContextDev::Models::MonitorUpdateParams::Target::Page, ContextDev::Models::MonitorUpdateParams::Target::Sitemap, ContextDev::Models::MonitorUpdateParams::Target::Extract, ContextDev::Models::MonitorUpdateParams::Target::Search, nil]
      optional :target, union: -> { ContextDev::MonitorUpdateParams::Target }

      # @!attribute webhook
      #   Set to `null` to remove the webhook. Changing `url` generates a new secret.
      #
      #   @return [ContextDev::Models::MonitorUpdateParams::Webhook, nil]
      optional :webhook, -> { ContextDev::MonitorUpdateParams::Webhook }, nil?: true

      # @!method initialize(monitor_id:, change_detection: nil, name: nil, policies: nil, schedule: nil, status: nil, tags: nil, target: nil, webhook: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorUpdateParams} for more details.
      #
      #   @param monitor_id [String] ID of the monitor.
      #
      #   @param change_detection [ContextDev::Models::MonitorUpdateParams::ChangeDetection::Exact, ContextDev::Models::MonitorUpdateParams::ChangeDetection::Semantic] How changes are judged. Defaults to `semantic` for extract and search targets an
      #
      #   @param name [String] Display name for the monitor.
      #
      #   @param policies [Array<String>] Access policy IDs to apply to every run, or an empty list to remove them. Requir
      #
      #   @param schedule [ContextDev::Models::MonitorUpdateParams::Schedule] Run the monitor at a fixed interval, such as every 6 hours or every 2 days. The
      #
      #   @param status [Symbol, ContextDev::Models::MonitorUpdateParams::Status] Set `paused` to stop scheduled runs or `active` to resume them. A resumed monito
      #
      #   @param tags [Array<String>] Labels for grouping monitors. Filter monitors, changes, and credit usage by tag.
      #
      #   @param target [ContextDev::Models::MonitorUpdateParams::Target::Page, ContextDev::Models::MonitorUpdateParams::Target::Sitemap, ContextDev::Models::MonitorUpdateParams::Target::Extract, ContextDev::Models::MonitorUpdateParams::Target::Search] What to watch: a page, a sitemap, data extracted from a site, or web search resu
      #
      #   @param webhook [ContextDev::Models::MonitorUpdateParams::Webhook, nil] Set to `null` to remove the webhook. Changing `url` generates a new secret.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # How changes are judged. Defaults to `semantic` for extract and search targets
      # and for page targets with `instructions`; otherwise `exact`. Sitemap targets
      # support only `exact`, and extract targets only `semantic`.
      module ChangeDetection
        extend ContextDev::Internal::Type::Union

        discriminator :type

        # Report every change: visible-text diffs for pages, added or removed URLs for sitemaps, and every new result for searches.
        variant :exact, -> { ContextDev::MonitorUpdateParams::ChangeDetection::Exact }

        # Report only changes that matter, judged against the target's `instructions` and, for extract targets, its `schema`.
        variant :semantic, -> { ContextDev::MonitorUpdateParams::ChangeDetection::Semantic }

        class Exact < ContextDev::Internal::Type::BaseModel
          # @!attribute type
          #   Use `exact` to compare visible text, sitemap URLs, or search results.
          #
          #   @return [Symbol, :exact]
          required :type, const: :exact

          # @!method initialize(type: :exact)
          #   Report every change: visible-text diffs for pages, added or removed URLs for
          #   sitemaps, and every new result for searches.
          #
          #   @param type [Symbol, :exact] Use `exact` to compare visible text, sitemap URLs, or search results.
        end

        class Semantic < ContextDev::Internal::Type::BaseModel
          # @!attribute type
          #   Use `semantic` to report only changes that match the target's `instructions`.
          #
          #   @return [Symbol, :semantic]
          required :type, const: :semantic

          # @!attribute confidence_threshold
          #   Minimum confidence a change needs to be reported. Higher values mean fewer, more
          #   certain alerts.
          #
          #   @return [Float, nil]
          optional :confidence_threshold, Float

          # @!method initialize(confidence_threshold: nil, type: :semantic)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorUpdateParams::ChangeDetection::Semantic} for more
          #   details.
          #
          #   Report only changes that matter, judged against the target's `instructions` and,
          #   for extract targets, its `schema`.
          #
          #   @param confidence_threshold [Float] Minimum confidence a change needs to be reported. Higher values mean fewer, more
          #
          #   @param type [Symbol, :semantic] Use `semantic` to report only changes that match the target's `instructions`.
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::MonitorUpdateParams::ChangeDetection::Exact, ContextDev::Models::MonitorUpdateParams::ChangeDetection::Semantic)]
      end

      class Schedule < ContextDev::Internal::Type::BaseModel
        # @!attribute frequency
        #   Number of `unit` periods between runs. The interval must be between 10 minutes
        #   and 1 year, so at least `10` with `minutes` and at most `365` with `days`.
        #
        #   @return [Integer]
        required :frequency, Integer

        # @!attribute type
        #   Use `interval` to run on a repeating schedule.
        #
        #   @return [Symbol, ContextDev::Models::MonitorUpdateParams::Schedule::Type]
        required :type, enum: -> { ContextDev::MonitorUpdateParams::Schedule::Type }

        # @!attribute unit
        #   Time unit for `frequency`.
        #
        #   @return [Symbol, ContextDev::Models::MonitorUpdateParams::Schedule::Unit]
        required :unit, enum: -> { ContextDev::MonitorUpdateParams::Schedule::Unit }

        # @!method initialize(frequency:, type:, unit:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorUpdateParams::Schedule} for more details.
        #
        #   Run the monitor at a fixed interval, such as every 6 hours or every 2 days. The
        #   interval must be between 10 minutes and 1 year.
        #
        #   @param frequency [Integer] Number of `unit` periods between runs. The interval must be between 10 minutes a
        #
        #   @param type [Symbol, ContextDev::Models::MonitorUpdateParams::Schedule::Type] Use `interval` to run on a repeating schedule.
        #
        #   @param unit [Symbol, ContextDev::Models::MonitorUpdateParams::Schedule::Unit] Time unit for `frequency`.

        # Use `interval` to run on a repeating schedule.
        #
        # @see ContextDev::Models::MonitorUpdateParams::Schedule#type
        module Type
          extend ContextDev::Internal::Type::Enum

          INTERVAL = :interval

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Time unit for `frequency`.
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

      # Set `paused` to stop scheduled runs or `active` to resume them. A resumed
      # monitor runs promptly instead of waiting a full interval.
      module Status
        extend ContextDev::Internal::Type::Enum

        ACTIVE = :active
        PAUSED = :paused

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # What to watch: a page, a sitemap, data extracted from a site, or web search
      # results.
      module Target
        extend ContextDev::Internal::Type::Union

        discriminator :type

        # Watch one web page. `exact` detection reports any change to the visible text; `semantic` detection reports only confirmed changes that match `instructions`.
        variant :page, -> { ContextDev::MonitorUpdateParams::Target::Page }

        # Watch a sitemap and report URLs that are added or removed.
        variant :sitemap, -> { ContextDev::MonitorUpdateParams::Target::Sitemap }

        # Extract structured data from the most relevant pages of a site and report meaningful changes. Pages are chosen from `schema` and `instructions`, and the page set is refreshed periodically.
        variant :extract, -> { ContextDev::MonitorUpdateParams::Target::Extract }

        # Search the web on every run and report results not seen before, listed in the change's `matched_urls` and `evidence`. `semantic` detection reports only results about a new development that matches `instructions`; `exact` detection reports every new result.
        variant :search, -> { ContextDev::MonitorUpdateParams::Target::Search }

        class Page < ContextDev::Internal::Type::BaseModel
          # @!attribute type
          #   Use `page` to watch one web page.
          #
          #   @return [Symbol, :page]
          required :type, const: :page

          # @!attribute url
          #   Public HTTP(S) URL of the page to watch.
          #
          #   @return [String]
          required :url, String

          # @!attribute actions
          #   Browser actions to run in order after the page loads and before each capture.
          #   Requires a paid plan. Changing it resets the baseline.
          #
          #   @return [Array<ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Wait, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Perform, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll>, nil]
          optional :actions,
                   -> {
                     ContextDev::Internal::Type::ArrayOf[union: ContextDev::MonitorUpdateParams::Target::Page::Action]
                   },
                   nil?: true

          # @!attribute exclude_selectors
          #   CSS selectors for regions to ignore, applied after `include_selectors`. Changing
          #   it resets the baseline.
          #
          #   @return [Array<String>, nil]
          optional :exclude_selectors, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute include_selectors
          #   CSS selectors for the regions to watch. Omit or leave empty to watch the main
          #   content. Changing it resets the baseline.
          #
          #   @return [Array<String>, nil]
          optional :include_selectors, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute instructions
          #   Plain-language description of the changes that matter. Requires `semantic`
          #   detection, which is selected when `change_detection` is omitted.
          #
          #   @return [String, nil]
          optional :instructions, String

          # @!attribute normalize_whitespace
          #   Collapse whitespace before comparing text, so spacing-only edits are not
          #   reported.
          #
          #   @return [Boolean, nil]
          optional :normalize_whitespace, ContextDev::Internal::Type::Boolean

          # @!method initialize(url:, actions: nil, exclude_selectors: nil, include_selectors: nil, instructions: nil, normalize_whitespace: nil, type: :page)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorUpdateParams::Target::Page} for more details.
          #
          #   Watch one web page. `exact` detection reports any change to the visible text;
          #   `semantic` detection reports only confirmed changes that match `instructions`.
          #
          #   @param url [String] Public HTTP(S) URL of the page to watch.
          #
          #   @param actions [Array<ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Wait, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Perform, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll>, nil] Browser actions to run in order after the page loads and before each capture. Re
          #
          #   @param exclude_selectors [Array<String>] CSS selectors for regions to ignore, applied after `include_selectors`. Changing
          #
          #   @param include_selectors [Array<String>] CSS selectors for the regions to watch. Omit or leave empty to watch the main co
          #
          #   @param instructions [String] Plain-language description of the changes that matter. Requires `semantic` detec
          #
          #   @param normalize_whitespace [Boolean] Collapse whitespace before comparing text, so spacing-only edits are not reporte
          #
          #   @param type [Symbol, :page] Use `page` to watch one web page.

          # One browser action. `do` selects the type: `wait`, `perform`, or `scroll`.
          module Action
            extend ContextDev::Internal::Type::Union

            discriminator :do

            # Pause for a fixed time before the next action.
            variant :wait, -> { ContextDev::MonitorUpdateParams::Target::Page::Action::Wait }

            # Perform one browser instruction written in plain language.
            variant :perform, -> { ContextDev::MonitorUpdateParams::Target::Page::Action::Perform }

            # Scroll the page or a scrollable container. Waits for new content to settle after each scroll.
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
              #   Pause for a fixed time before the next action.
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
              #   Perform one browser instruction written in plain language.
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
              #   Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
              #
              #   @return [Integer, Symbol, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll::Amount, nil]
              optional :amount, union: -> { ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Amount }

              # @!attribute container
              #   Scroll the first container matching this CSS selector. Omit to scroll the page.
              #
              #   @return [String, nil]
              optional :container, String

              # @!attribute direction
              #   Direction to scroll.
              #
              #   @return [Symbol, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll::Direction, nil]
              optional :direction, enum: -> { ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Direction }

              # @!attribute max_scrolls
              #   Maximum number of scroll steps. Stops early when the page stops changing.
              #
              #   @return [Integer, nil]
              optional :max_scrolls, Integer, api_name: :maxScrolls

              # @!method initialize(amount: nil, container: nil, direction: nil, max_scrolls: nil, do_: :scroll)
              #   Scroll the page or a scrollable container. Waits for new content to settle after
              #   each scroll.
              #
              #   @param amount [Integer, Symbol, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll::Amount] Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
              #
              #   @param container [String] Scroll the first container matching this CSS selector. Omit to scroll the page.
              #
              #   @param direction [Symbol, ContextDev::Models::MonitorUpdateParams::Target::Page::Action::Scroll::Direction] Direction to scroll.
              #
              #   @param max_scrolls [Integer] Maximum number of scroll steps. Stops early when the page stops changing.
              #
              #   @param do_ [Symbol, :scroll] Use `scroll` to move through the page or a container.

              # Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
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

              # Direction to scroll.
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
          #   Public HTTP(S) URL of the sitemap to watch.
          #
          #   @return [String]
          required :url, String

          # @!attribute exclude
          #   Path patterns of URLs to ignore, such as `/legal/*`.
          #
          #   @return [Array<String>, nil]
          optional :exclude, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute include
          #   Path patterns of URLs to track, such as `/blog/*`.
          #
          #   @return [Array<String>, nil]
          optional :include, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute max_urls
          #   Maximum number of URLs to track.
          #
          #   @return [Integer, nil]
          optional :max_urls, Integer

          # @!method initialize(url:, exclude: nil, include: nil, max_urls: nil, type: :sitemap)
          #   Watch a sitemap and report URLs that are added or removed.
          #
          #   @param url [String] Public HTTP(S) URL of the sitemap to watch.
          #
          #   @param exclude [Array<String>] Path patterns of URLs to ignore, such as `/legal/*`.
          #
          #   @param include [Array<String>] Path patterns of URLs to track, such as `/blog/*`.
          #
          #   @param max_urls [Integer] Maximum number of URLs to track.
          #
          #   @param type [Symbol, :sitemap] Use `sitemap` to watch a site for added or removed URLs.
        end

        class Extract < ContextDev::Internal::Type::BaseModel
          # @!attribute instructions
          #   Plain-language description of the pages and facts to track and the changes to
          #   report.
          #
          #   @return [String]
          required :instructions, String

          # @!attribute type
          #   Use `extract` to watch structured data across selected pages.
          #
          #   @return [Symbol, :extract]
          required :type, const: :extract

          # @!attribute url
          #   Public HTTP(S) URL where page discovery starts, usually the site home page.
          #
          #   @return [String]
          required :url, String

          # @!attribute follow_subdomains
          #   Also discover pages on subdomains of the site.
          #
          #   @return [Boolean, nil]
          optional :follow_subdomains, ContextDev::Internal::Type::Boolean

          # @!attribute max_depth
          #   Maximum link depth from `url`. `0` tracks only the starting page.
          #
          #   @return [Integer, nil]
          optional :max_depth, Integer

          # @!attribute max_pages
          #   Maximum number of pages to track.
          #
          #   @return [Integer, nil]
          optional :max_pages, Integer

          # @!attribute schema
          #   JSON Schema for the data to extract, up to 20,000 characters; it also guides
          #   which pages are tracked. Defaults to a `summary` string and a `key_points` list.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :schema, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

          # @!method initialize(instructions:, url:, follow_subdomains: nil, max_depth: nil, max_pages: nil, schema: nil, type: :extract)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorUpdateParams::Target::Extract} for more details.
          #
          #   Extract structured data from the most relevant pages of a site and report
          #   meaningful changes. Pages are chosen from `schema` and `instructions`, and the
          #   page set is refreshed periodically.
          #
          #   @param instructions [String] Plain-language description of the pages and facts to track and the changes to re
          #
          #   @param url [String] Public HTTP(S) URL where page discovery starts, usually the site home page.
          #
          #   @param follow_subdomains [Boolean] Also discover pages on subdomains of the site.
          #
          #   @param max_depth [Integer] Maximum link depth from `url`. `0` tracks only the starting page.
          #
          #   @param max_pages [Integer] Maximum number of pages to track.
          #
          #   @param schema [Hash{Symbol=>Object}] JSON Schema for the data to extract, up to 20,000 characters; it also guides whi
          #
          #   @param type [Symbol, :extract] Use `extract` to watch structured data across selected pages.
        end

        class Search < ContextDev::Internal::Type::BaseModel
          # @!attribute query
          #   Web search query to run on every check. Supports `site:`, `-site:`, and quoted
          #   phrases.
          #
          #   @return [String]
          required :query, String

          # @!attribute type
          #   Use `search` to watch the web for new results about a topic.
          #
          #   @return [Symbol, :search]
          required :type, const: :search

          # @!attribute instructions
          #   Plain-language description of the new results that matter. Defaults to `query`.
          #   Not allowed with `exact` detection.
          #
          #   @return [String, nil]
          optional :instructions, String

          # @!method initialize(query:, instructions: nil, type: :search)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorUpdateParams::Target::Search} for more details.
          #
          #   Search the web on every run and report results not seen before, listed in the
          #   change's `matched_urls` and `evidence`. `semantic` detection reports only
          #   results about a new development that matches `instructions`; `exact` detection
          #   reports every new result.
          #
          #   @param query [String] Web search query to run on every check. Supports `site:`, `-site:`, and quoted p
          #
          #   @param instructions [String] Plain-language description of the new results that matter. Defaults to `query`.
          #
          #   @param type [Symbol, :search] Use `search` to watch the web for new results about a topic.
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::MonitorUpdateParams::Target::Page, ContextDev::Models::MonitorUpdateParams::Target::Sitemap, ContextDev::Models::MonitorUpdateParams::Target::Extract, ContextDev::Models::MonitorUpdateParams::Target::Search)]
      end

      class Webhook < ContextDev::Internal::Type::BaseModel
        # @!attribute url
        #   Public HTTP(S) URL that receives events. Slack and GovSlack webhook URLs get
        #   formatted messages.
        #
        #   @return [String]
        required :url, String

        # @!attribute events
        #   Events to send. Defaults to `change.detected`. Add `run.completed` to get a
        #   delivery after every completed run, including runs with no change.
        #
        #   @return [Array<Symbol, ContextDev::Models::MonitorUpdateParams::Webhook::Event>, nil]
        optional :events,
                 -> { ContextDev::Internal::Type::ArrayOf[enum: ContextDev::MonitorUpdateParams::Webhook::Event] }

        # @!attribute retry_
        #   Automatic retry settings. Pass `{}` for the default schedule.
        #
        #   @return [ContextDev::Models::RetryConfig, nil]
        optional :retry_, -> { ContextDev::RetryConfig }, api_name: :retry

        # @!method initialize(url:, events: nil, retry_: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorUpdateParams::Webhook} for more details.
        #
        #   Set to `null` to remove the webhook. Changing `url` generates a new secret.
        #
        #   @param url [String] Public HTTP(S) URL that receives events. Slack and GovSlack webhook URLs get for
        #
        #   @param events [Array<Symbol, ContextDev::Models::MonitorUpdateParams::Webhook::Event>] Events to send. Defaults to `change.detected`. Add `run.completed` to get a deli
        #
        #   @param retry_ [ContextDev::Models::RetryConfig] Automatic retry settings. Pass `{}` for the default schedule.

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
