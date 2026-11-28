# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#update
    class MonitorUpdateResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute id
      #   Unique ID of the monitor.
      #
      #   @return [String]
      required :id, String

      # @!attribute change_detection
      #   How changes are judged. Defaults to `semantic` for extract and search targets
      #   and for page targets with `instructions`; otherwise `exact`. Sitemap targets
      #   support only `exact`, and extract targets only `semantic`.
      #
      #   @return [ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Exact, ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Semantic]
      required :change_detection, union: -> { ContextDev::Models::MonitorUpdateResponse::ChangeDetection }

      # @!attribute created_at
      #   When the monitor was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute mode
      #   Monitor category. Always `web`.
      #
      #   @return [Symbol, ContextDev::Models::MonitorUpdateResponse::Mode]
      required :mode, enum: -> { ContextDev::Models::MonitorUpdateResponse::Mode }

      # @!attribute name
      #   Display name of the monitor.
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
      #   `active` monitors run on schedule. `failed` monitors keep running after a failed
      #   run and return to `active` on the next success. `paused` monitors don't run
      #   until you set `status` to `active`; Context.dev also pauses monitors after
      #   repeated failures or credit shortfalls.
      #
      #   @return [Symbol, ContextDev::Models::MonitorUpdateResponse::Status]
      required :status, enum: -> { ContextDev::Models::MonitorUpdateResponse::Status }

      # @!attribute target
      #   What to watch: a page, a sitemap, data extracted from a site, or web search
      #   results.
      #
      #   @return [ContextDev::Models::MonitorUpdateResponse::Target::Page, ContextDev::Models::MonitorUpdateResponse::Target::Sitemap, ContextDev::Models::MonitorUpdateResponse::Target::Extract, ContextDev::Models::MonitorUpdateResponse::Target::Search]
      required :target, union: -> { ContextDev::Models::MonitorUpdateResponse::Target }

      # @!attribute updated_at
      #   When the monitor was last updated.
      #
      #   @return [Time]
      required :updated_at, Time

      # @!attribute baseline
      #   What the next run compares against. Returned only by
      #   `GET /monitors/{monitor_id}`; `null` until the first capture finishes or after
      #   the target changes.
      #
      #   @return [ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsPageBaseline, ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsSitemapBaseline, ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsExtractBaseline, ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsSearchBaseline, nil]
      optional :baseline, union: -> { ContextDev::Models::MonitorUpdateResponse::Baseline }, nil?: true

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::MonitorUpdateResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::MonitorUpdateResponse::KeyMetadata }

      # @!attribute last_change_at
      #   When the monitor last detected a change. `null` until it detects one.
      #
      #   @return [Time, nil]
      optional :last_change_at, Time, nil?: true

      # @!attribute last_error
      #   Error from the most recent failed run. `null` when the last run succeeded.
      #
      #   @return [ContextDev::Models::MonitorUpdateResponse::LastError, nil]
      optional :last_error, -> { ContextDev::Models::MonitorUpdateResponse::LastError }, nil?: true

      # @!attribute last_run_at
      #   When the most recent run ended. `null` until the first run ends.
      #
      #   @return [Time, nil]
      optional :last_run_at, Time, nil?: true

      # @!attribute next_run_at
      #   When the next scheduled run is due. `null` while paused.
      #
      #   @return [Time, nil]
      optional :next_run_at, Time, nil?: true

      # @!attribute policies
      #   Access policy IDs applied to every run.
      #
      #   @return [Array<String>, nil]
      optional :policies, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute schedule
      #   Run the monitor at a fixed interval, such as every 6 hours or every 2 days. The
      #   interval must be between 10 minutes and 1 year.
      #
      #   @return [ContextDev::Models::MonitorUpdateResponse::Schedule, nil]
      optional :schedule, -> { ContextDev::Models::MonitorUpdateResponse::Schedule }

      # @!attribute tags
      #   Labels for grouping monitors. Filter monitors, changes, and credit usage by tag.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute webhook
      #   Webhook that receives monitor events. `null` when no webhook is configured.
      #
      #   @return [ContextDev::Models::MonitorUpdateResponse::Webhook, nil]
      optional :webhook, -> { ContextDev::Models::MonitorUpdateResponse::Webhook }, nil?: true

      # @!attribute webhook_failure
      #   Details of failing webhook deliveries. `null` when deliveries succeed or no
      #   webhook is configured; cleared by the next successful delivery or a new webhook
      #   URL.
      #
      #   @return [ContextDev::Models::MonitorUpdateResponse::WebhookFailure, nil]
      optional :webhook_failure, -> { ContextDev::Models::MonitorUpdateResponse::WebhookFailure }, nil?: true

      # @!method initialize(id:, change_detection:, created_at:, mode:, name:, request_id:, status:, target:, updated_at:, baseline: nil, key_metadata: nil, last_change_at: nil, last_error: nil, last_run_at: nil, next_run_at: nil, policies: nil, schedule: nil, tags: nil, webhook: nil, webhook_failure: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorUpdateResponse} for more details.
      #
      #   @param id [String] Unique ID of the monitor.
      #
      #   @param change_detection [ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Exact, ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Semantic] How changes are judged. Defaults to `semantic` for extract and search targets an
      #
      #   @param created_at [Time] When the monitor was created.
      #
      #   @param mode [Symbol, ContextDev::Models::MonitorUpdateResponse::Mode] Monitor category. Always `web`.
      #
      #   @param name [String] Display name of the monitor.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param status [Symbol, ContextDev::Models::MonitorUpdateResponse::Status] `active` monitors run on schedule. `failed` monitors keep running after a failed
      #
      #   @param target [ContextDev::Models::MonitorUpdateResponse::Target::Page, ContextDev::Models::MonitorUpdateResponse::Target::Sitemap, ContextDev::Models::MonitorUpdateResponse::Target::Extract, ContextDev::Models::MonitorUpdateResponse::Target::Search] What to watch: a page, a sitemap, data extracted from a site, or web search resu
      #
      #   @param updated_at [Time] When the monitor was last updated.
      #
      #   @param baseline [ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsPageBaseline, ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsSitemapBaseline, ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsExtractBaseline, ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsSearchBaseline, nil] What the next run compares against. Returned only by `GET /monitors/{monitor_id}
      #
      #   @param key_metadata [ContextDev::Models::MonitorUpdateResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param last_change_at [Time, nil] When the monitor last detected a change. `null` until it detects one.
      #
      #   @param last_error [ContextDev::Models::MonitorUpdateResponse::LastError, nil] Error from the most recent failed run. `null` when the last run succeeded.
      #
      #   @param last_run_at [Time, nil] When the most recent run ended. `null` until the first run ends.
      #
      #   @param next_run_at [Time, nil] When the next scheduled run is due. `null` while paused.
      #
      #   @param policies [Array<String>] Access policy IDs applied to every run.
      #
      #   @param schedule [ContextDev::Models::MonitorUpdateResponse::Schedule] Run the monitor at a fixed interval, such as every 6 hours or every 2 days. The
      #
      #   @param tags [Array<String>] Labels for grouping monitors. Filter monitors, changes, and credit usage by tag.
      #
      #   @param webhook [ContextDev::Models::MonitorUpdateResponse::Webhook, nil] Webhook that receives monitor events. `null` when no webhook is configured.
      #
      #   @param webhook_failure [ContextDev::Models::MonitorUpdateResponse::WebhookFailure, nil] Details of failing webhook deliveries. `null` when deliveries succeed or no webh

      # How changes are judged. Defaults to `semantic` for extract and search targets
      # and for page targets with `instructions`; otherwise `exact`. Sitemap targets
      # support only `exact`, and extract targets only `semantic`.
      #
      # @see ContextDev::Models::MonitorUpdateResponse#change_detection
      module ChangeDetection
        extend ContextDev::Internal::Type::Union

        discriminator :type

        # Report every change: visible-text diffs for pages, added or removed URLs for sitemaps, and every new result for searches.
        variant :exact, -> { ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Exact }

        # Report only changes that matter, judged against the target's `instructions` and, for extract targets, its `schema`.
        variant :semantic, -> { ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Semantic }

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
          #   {ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Semantic} for more
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
        #   @return [Array(ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Exact, ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Semantic)]
      end

      # Monitor category. Always `web`.
      #
      # @see ContextDev::Models::MonitorUpdateResponse#mode
      module Mode
        extend ContextDev::Internal::Type::Enum

        WEB = :web

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # `active` monitors run on schedule. `failed` monitors keep running after a failed
      # run and return to `active` on the next success. `paused` monitors don't run
      # until you set `status` to `active`; Context.dev also pauses monitors after
      # repeated failures or credit shortfalls.
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

      # What to watch: a page, a sitemap, data extracted from a site, or web search
      # results.
      #
      # @see ContextDev::Models::MonitorUpdateResponse#target
      module Target
        extend ContextDev::Internal::Type::Union

        discriminator :type

        # Watch one web page. `exact` detection reports any change to the visible text; `semantic` detection reports only confirmed changes that match `instructions`.
        variant :page, -> { ContextDev::Models::MonitorUpdateResponse::Target::Page }

        # Watch a sitemap and report URLs that are added or removed.
        variant :sitemap, -> { ContextDev::Models::MonitorUpdateResponse::Target::Sitemap }

        # Extract structured data from the most relevant pages of a site and report meaningful changes. Pages are chosen from `schema` and `instructions`, and the page set is refreshed periodically.
        variant :extract, -> { ContextDev::Models::MonitorUpdateResponse::Target::Extract }

        # Search the web on every run and report results not seen before, listed in the change's `matched_urls` and `evidence`. `semantic` detection reports only results about a new development that matches `instructions`; `exact` detection reports every new result.
        variant :search, -> { ContextDev::Models::MonitorUpdateResponse::Target::Search }

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
          #   @return [Array<ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Wait, ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Perform, ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Scroll>, nil]
          optional :actions,
                   -> { ContextDev::Internal::Type::ArrayOf[union: ContextDev::Models::MonitorUpdateResponse::Target::Page::Action] },
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
          #   {ContextDev::Models::MonitorUpdateResponse::Target::Page} for more details.
          #
          #   Watch one web page. `exact` detection reports any change to the visible text;
          #   `semantic` detection reports only confirmed changes that match `instructions`.
          #
          #   @param url [String] Public HTTP(S) URL of the page to watch.
          #
          #   @param actions [Array<ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Wait, ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Perform, ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Scroll>, nil] Browser actions to run in order after the page loads and before each capture. Re
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
            variant :wait, -> { ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Wait }

            # Perform one browser instruction written in plain language.
            variant :perform, -> { ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Perform }

            # Scroll the page or a scrollable container. Waits for new content to settle after each scroll.
            variant :scroll, -> { ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Scroll }

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
              #   @return [Integer, Symbol, ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Scroll::Amount, nil]
              optional :amount,
                       union: -> { ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Scroll::Amount }

              # @!attribute container
              #   Scroll the first container matching this CSS selector. Omit to scroll the page.
              #
              #   @return [String, nil]
              optional :container, String

              # @!attribute direction
              #   Direction to scroll.
              #
              #   @return [Symbol, ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Scroll::Direction, nil]
              optional :direction,
                       enum: -> { ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Scroll::Direction }

              # @!attribute max_scrolls
              #   Maximum number of scroll steps. Stops early when the page stops changing.
              #
              #   @return [Integer, nil]
              optional :max_scrolls, Integer, api_name: :maxScrolls

              # @!method initialize(amount: nil, container: nil, direction: nil, max_scrolls: nil, do_: :scroll)
              #   Scroll the page or a scrollable container. Waits for new content to settle after
              #   each scroll.
              #
              #   @param amount [Integer, Symbol, ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Scroll::Amount] Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
              #
              #   @param container [String] Scroll the first container matching this CSS selector. Omit to scroll the page.
              #
              #   @param direction [Symbol, ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Scroll::Direction] Direction to scroll.
              #
              #   @param max_scrolls [Integer] Maximum number of scroll steps. Stops early when the page stops changing.
              #
              #   @param do_ [Symbol, :scroll] Use `scroll` to move through the page or a container.

              # Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
              #
              # @see ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Scroll#amount
              module Amount
                extend ContextDev::Internal::Type::Union

                variant Integer

                variant const: -> { ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Scroll::Amount::VIEWPORT }

                variant const: -> { ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Scroll::Amount::MAX }

                # @!method self.variants
                #   @return [Array(Integer, Symbol)]

                define_sorbet_constant!(:Variants) do
                  T.type_alias do
                    T.any(
                      Integer,
                      ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Scroll::Amount::TaggedSymbol
                    )
                  end
                end

                # @!group

                VIEWPORT = :viewport
                MAX = :max

                # @!endgroup
              end

              # Direction to scroll.
              #
              # @see ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Scroll#direction
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
            #   @return [Array(ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Wait, ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Perform, ContextDev::Models::MonitorUpdateResponse::Target::Page::Action::Scroll)]
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
          #   {ContextDev::Models::MonitorUpdateResponse::Target::Extract} for more details.
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
          #   {ContextDev::Models::MonitorUpdateResponse::Target::Search} for more details.
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
        #   @return [Array(ContextDev::Models::MonitorUpdateResponse::Target::Page, ContextDev::Models::MonitorUpdateResponse::Target::Sitemap, ContextDev::Models::MonitorUpdateResponse::Target::Extract, ContextDev::Models::MonitorUpdateResponse::Target::Search)]
      end

      # What the next run compares against. Returned only by
      # `GET /monitors/{monitor_id}`; `null` until the first capture finishes or after
      # the target changes.
      #
      # @see ContextDev::Models::MonitorUpdateResponse#baseline
      module Baseline
        extend ContextDev::Internal::Type::Union

        # Baseline for a `page` target: the page's visible text from the last capture.
        variant -> { ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsPageBaseline }

        # Baseline for a `sitemap` target: the normalized set of URLs from the last capture.
        variant -> { ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsSitemapBaseline }

        # Baseline for an `extract` target: the tracked pages and the data last extracted from them.
        variant -> { ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsExtractBaseline }

        # Baseline for a `search` target: the results from the last capture.
        variant -> { ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsSearchBaseline }

        class MonitorsPageBaseline < ContextDev::Internal::Type::BaseModel
          # @!attribute captured_at
          #   When the baseline was last captured or updated.
          #
          #   @return [Time]
          required :captured_at, Time

          # @!attribute text
          #   Visible page text from the last capture.
          #
          #   @return [String]
          required :text, String

          # @!method initialize(captured_at:, text:)
          #   Baseline for a `page` target: the page's visible text from the last capture.
          #
          #   @param captured_at [Time] When the baseline was last captured or updated.
          #
          #   @param text [String] Visible page text from the last capture.
        end

        class MonitorsSitemapBaseline < ContextDev::Internal::Type::BaseModel
          # @!attribute captured_at
          #   When the baseline was last captured or updated.
          #
          #   @return [Time]
          required :captured_at, Time

          # @!attribute url_count
          #   Number of URLs in the baseline.
          #
          #   @return [Integer]
          required :url_count, Integer

          # @!attribute urls
          #   Normalized sitemap URLs from the last capture, sorted.
          #
          #   @return [Array<String>]
          required :urls, ContextDev::Internal::Type::ArrayOf[String]

          # @!method initialize(captured_at:, url_count:, urls:)
          #   Baseline for a `sitemap` target: the normalized set of URLs from the last
          #   capture.
          #
          #   @param captured_at [Time] When the baseline was last captured or updated.
          #
          #   @param url_count [Integer] Number of URLs in the baseline.
          #
          #   @param urls [Array<String>] Normalized sitemap URLs from the last capture, sorted.
        end

        class MonitorsExtractBaseline < ContextDev::Internal::Type::BaseModel
          # @!attribute captured_at
          #   When the baseline was last captured or updated.
          #
          #   @return [Time]
          required :captured_at, Time

          # @!attribute data
          #   Latest extracted data, matching the target's `schema`. Refreshed at most once a
          #   day; `null` before the first capture.
          #
          #   @return [Object]
          required :data, ContextDev::Internal::Type::Unknown

          # @!attribute urls_analyzed
          #   Pages the monitor tracks for changes.
          #
          #   @return [Array<String>]
          required :urls_analyzed, ContextDev::Internal::Type::ArrayOf[String]

          # @!method initialize(captured_at:, data:, urls_analyzed:)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsExtractBaseline}
          #   for more details.
          #
          #   Baseline for an `extract` target: the tracked pages and the data last extracted
          #   from them.
          #
          #   @param captured_at [Time] When the baseline was last captured or updated.
          #
          #   @param data [Object] Latest extracted data, matching the target's `schema`. Refreshed at most once a
          #
          #   @param urls_analyzed [Array<String>] Pages the monitor tracks for changes.
        end

        class MonitorsSearchBaseline < ContextDev::Internal::Type::BaseModel
          # @!attribute captured_at
          #   When the baseline was last captured or updated.
          #
          #   @return [Time]
          required :captured_at, Time

          # @!attribute results
          #   Search results from the last capture.
          #
          #   @return [Array<ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsSearchBaseline::Result>]
          required :results,
                   -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsSearchBaseline::Result] }

          # @!method initialize(captured_at:, results:)
          #   Baseline for a `search` target: the results from the last capture.
          #
          #   @param captured_at [Time] When the baseline was last captured or updated.
          #
          #   @param results [Array<ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsSearchBaseline::Result>] Search results from the last capture.

          class Result < ContextDev::Internal::Type::BaseModel
            # @!attribute description
            #   Result snippet.
            #
            #   @return [String]
            required :description, String

            # @!attribute published_at
            #   When the result was published. `null` when unknown.
            #
            #   @return [Time, nil]
            required :published_at, Time, nil?: true

            # @!attribute title
            #   Title of the result.
            #
            #   @return [String]
            required :title, String

            # @!attribute url
            #   URL of the result.
            #
            #   @return [String]
            required :url, String

            # @!method initialize(description:, published_at:, title:, url:)
            #   @param description [String] Result snippet.
            #
            #   @param published_at [Time, nil] When the result was published. `null` when unknown.
            #
            #   @param title [String] Title of the result.
            #
            #   @param url [String] URL of the result.
          end
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsPageBaseline, ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsSitemapBaseline, ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsExtractBaseline, ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsSearchBaseline)]
      end

      # @see ContextDev::Models::MonitorUpdateResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits your organization has left after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits your organization has left after this request.
      end

      # @see ContextDev::Models::MonitorUpdateResponse#last_error
      class LastError < ContextDev::Internal::Type::BaseModel
        # @!attribute code
        #   Machine-readable error code, such as `fetch_failed`.
        #
        #   @return [String]
        required :code, String

        # @!attribute message
        #   Human-readable explanation of the error.
        #
        #   @return [String]
        required :message, String

        # @!method initialize(code:, message:)
        #   Error from the most recent failed run. `null` when the last run succeeded.
        #
        #   @param code [String] Machine-readable error code, such as `fetch_failed`.
        #
        #   @param message [String] Human-readable explanation of the error.
      end

      # @see ContextDev::Models::MonitorUpdateResponse#schedule
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
        #   @return [Symbol, ContextDev::Models::MonitorUpdateResponse::Schedule::Type]
        required :type, enum: -> { ContextDev::Models::MonitorUpdateResponse::Schedule::Type }

        # @!attribute unit
        #   Time unit for `frequency`.
        #
        #   @return [Symbol, ContextDev::Models::MonitorUpdateResponse::Schedule::Unit]
        required :unit, enum: -> { ContextDev::Models::MonitorUpdateResponse::Schedule::Unit }

        # @!method initialize(frequency:, type:, unit:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorUpdateResponse::Schedule} for more details.
        #
        #   Run the monitor at a fixed interval, such as every 6 hours or every 2 days. The
        #   interval must be between 10 minutes and 1 year.
        #
        #   @param frequency [Integer] Number of `unit` periods between runs. The interval must be between 10 minutes a
        #
        #   @param type [Symbol, ContextDev::Models::MonitorUpdateResponse::Schedule::Type] Use `interval` to run on a repeating schedule.
        #
        #   @param unit [Symbol, ContextDev::Models::MonitorUpdateResponse::Schedule::Unit] Time unit for `frequency`.

        # Use `interval` to run on a repeating schedule.
        #
        # @see ContextDev::Models::MonitorUpdateResponse::Schedule#type
        module Type
          extend ContextDev::Internal::Type::Enum

          INTERVAL = :interval

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Time unit for `frequency`.
        #
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

      # @see ContextDev::Models::MonitorUpdateResponse#webhook
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
        #   @return [Array<Symbol, ContextDev::Models::MonitorUpdateResponse::Webhook::Event>, nil]
        optional :events,
                 -> { ContextDev::Internal::Type::ArrayOf[enum: ContextDev::Models::MonitorUpdateResponse::Webhook::Event] }

        # @!attribute retry_
        #   Automatic retry settings. Pass `{}` for the default schedule.
        #
        #   @return [ContextDev::Models::RetryConfig, nil]
        optional :retry_, -> { ContextDev::RetryConfig }, api_name: :retry

        response_only do
          # @!attribute secret
          #   Signing secret for verifying deliveries, generated by Context.dev. Returned only
          #   to API keys with full access or the `monitors:write` permission.
          #
          #   @return [String, nil]
          optional :secret, String
        end

        # @!method initialize(url:, events: nil, retry_: nil, secret: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorUpdateResponse::Webhook} for more details.
        #
        #   Webhook that receives monitor events. `null` when no webhook is configured.
        #
        #   @param url [String] Public HTTP(S) URL that receives events. Slack and GovSlack webhook URLs get for
        #
        #   @param events [Array<Symbol, ContextDev::Models::MonitorUpdateResponse::Webhook::Event>] Events to send. Defaults to `change.detected`. Add `run.completed` to get a deli
        #
        #   @param retry_ [ContextDev::Models::RetryConfig] Automatic retry settings. Pass `{}` for the default schedule.
        #
        #   @param secret [String] Signing secret for verifying deliveries, generated by Context.dev. Returned only

        module Event
          extend ContextDev::Internal::Type::Enum

          CHANGE_DETECTED = :"change.detected"
          RUN_COMPLETED = :"run.completed"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::MonitorUpdateResponse#webhook_failure
      class WebhookFailure < ContextDev::Internal::Type::BaseModel
        # @!attribute consecutive_failures
        #   Number of failed delivery attempts in a row.
        #
        #   @return [Integer]
        required :consecutive_failures, Integer

        # @!attribute last_failed_at
        #   When the most recent delivery failed.
        #
        #   @return [Time]
        required :last_failed_at, Time

        # @!attribute last_message
        #   Human-readable explanation of the most recent failure.
        #
        #   @return [String]
        required :last_message, String

        # @!attribute last_status
        #   Outcome of the most recent failed delivery: `rejected` (non-2xx response),
        #   `failed` (no response), or `skipped_unsafe_url` (the URL isn't a safe public
        #   endpoint).
        #
        #   @return [Symbol, ContextDev::Models::MonitorUpdateResponse::WebhookFailure::LastStatus]
        required :last_status, enum: -> { ContextDev::Models::MonitorUpdateResponse::WebhookFailure::LastStatus }

        # @!method initialize(consecutive_failures:, last_failed_at:, last_message:, last_status:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorUpdateResponse::WebhookFailure} for more details.
        #
        #   Details of failing webhook deliveries. `null` when deliveries succeed or no
        #   webhook is configured; cleared by the next successful delivery or a new webhook
        #   URL.
        #
        #   @param consecutive_failures [Integer] Number of failed delivery attempts in a row.
        #
        #   @param last_failed_at [Time] When the most recent delivery failed.
        #
        #   @param last_message [String] Human-readable explanation of the most recent failure.
        #
        #   @param last_status [Symbol, ContextDev::Models::MonitorUpdateResponse::WebhookFailure::LastStatus] Outcome of the most recent failed delivery: `rejected` (non-2xx response), `fail

        # Outcome of the most recent failed delivery: `rejected` (non-2xx response),
        # `failed` (no response), or `skipped_unsafe_url` (the URL isn't a safe public
        # endpoint).
        #
        # @see ContextDev::Models::MonitorUpdateResponse::WebhookFailure#last_status
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
