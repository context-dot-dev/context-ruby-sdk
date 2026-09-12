# typed: strong

module ContextDev
  module Models
    class MonitorListResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::MonitorListResponse,
            ContextDev::Internal::AnyHash
          )
        end

      sig { returns(T::Array[ContextDev::Models::MonitorListResponse::Data]) }
      attr_accessor :data

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      sig do
        params(
          data: T::Array[ContextDev::Models::MonitorListResponse::Data::OrHash],
          has_more: T::Boolean,
          next_cursor: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(data:, has_more:, next_cursor:)
      end

      sig do
        override.returns(
          {
            data: T::Array[ContextDev::Models::MonitorListResponse::Data],
            has_more: T::Boolean,
            next_cursor: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Data < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorListResponse::Data,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Discriminated union describing how changes are detected.
        sig do
          returns(
            ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Variants
          )
        end
        attr_accessor :change_detection

        sig { returns(Time) }
        attr_accessor :created_at

        # Top-level monitor category. Always `web` today; the concrete behavior is
        # described by `target` and `change_detection`.
        sig do
          returns(
            ContextDev::Models::MonitorListResponse::Data::Mode::TaggedSymbol
          )
        end
        attr_accessor :mode

        sig { returns(String) }
        attr_accessor :name

        # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        # every 6 hours or every 2 days. The total interval (frequency × unit) must be
        # between 10 minutes and 1 year.
        sig { returns(ContextDev::Models::MonitorListResponse::Data::Schedule) }
        attr_reader :schedule

        sig do
          params(
            schedule:
              ContextDev::Models::MonitorListResponse::Data::Schedule::OrHash
          ).void
        end
        attr_writer :schedule

        # Monitor lifecycle status. `failed` means the most recent run failed (see the
        # monitor's `last_error`); failed monitors keep running on schedule and flip back
        # to `active` on the next successful run. Monitors are auto-`paused` after
        # repeated consecutive failures or insufficient-credit skips; resume by PATCHing
        # status to `active`.
        sig do
          returns(
            ContextDev::Models::MonitorListResponse::Data::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Discriminated union describing what the monitor watches.
        sig do
          returns(
            ContextDev::Models::MonitorListResponse::Data::Target::Variants
          )
        end
        attr_accessor :target

        sig { returns(Time) }
        attr_accessor :updated_at

        # Current baseline: the last observed value the monitor compares new snapshots
        # against. Its shape follows `target.type` (page/sitemap/extract). Only populated
        # on GET /monitors/{monitor_id}; null until the first baseline run completes (and
        # after a target or change_detection update, which resets the baseline).
        sig do
          returns(
            T.nilable(
              ContextDev::Models::MonitorListResponse::Data::Baseline::Variants
            )
          )
        end
        attr_accessor :baseline

        sig { returns(T.nilable(Time)) }
        attr_accessor :last_change_at

        # Error from the most recent failed run; null when the last run succeeded.
        sig do
          returns(
            T.nilable(ContextDev::Models::MonitorListResponse::Data::LastError)
          )
        end
        attr_reader :last_error

        sig do
          params(
            last_error:
              T.nilable(
                ContextDev::Models::MonitorListResponse::Data::LastError::OrHash
              )
          ).void
        end
        attr_writer :last_error

        sig { returns(T.nilable(Time)) }
        attr_accessor :last_run_at

        # When the next scheduled run is due.
        sig { returns(T.nilable(Time)) }
        attr_accessor :next_run_at

        # User-defined tags for grouping and filtering monitors and their changes.
        # Duplicates are removed.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :tags

        sig { params(tags: T::Array[String]).void }
        attr_writer :tags

        sig do
          returns(
            T.nilable(ContextDev::Models::MonitorListResponse::Data::Webhook)
          )
        end
        attr_reader :webhook

        sig do
          params(
            webhook:
              T.nilable(
                ContextDev::Models::MonitorListResponse::Data::Webhook::OrHash
              )
          ).void
        end
        attr_writer :webhook

        # Present while webhook deliveries are failing consecutively; null when deliveries
        # are healthy or no webhook is configured. Cleared on the next successful delivery
        # and when the webhook URL changes.
        sig do
          returns(
            T.nilable(
              ContextDev::Models::MonitorListResponse::Data::WebhookFailure
            )
          )
        end
        attr_reader :webhook_failure

        sig do
          params(
            webhook_failure:
              T.nilable(
                ContextDev::Models::MonitorListResponse::Data::WebhookFailure::OrHash
              )
          ).void
        end
        attr_writer :webhook_failure

        # A web monitor. `mode` is the constant `web`; behavior is described by `target`
        # (page/sitemap/extract) and `change_detection` (exact/semantic).
        sig do
          params(
            id: String,
            change_detection:
              T.any(
                ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Exact::OrHash,
                ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Semantic::OrHash
              ),
            created_at: Time,
            mode: ContextDev::Models::MonitorListResponse::Data::Mode::OrSymbol,
            name: String,
            schedule:
              ContextDev::Models::MonitorListResponse::Data::Schedule::OrHash,
            status:
              ContextDev::Models::MonitorListResponse::Data::Status::OrSymbol,
            target:
              T.any(
                ContextDev::Models::MonitorListResponse::Data::Target::Page::OrHash,
                ContextDev::Models::MonitorListResponse::Data::Target::Sitemap::OrHash,
                ContextDev::Models::MonitorListResponse::Data::Target::Extract::OrHash
              ),
            updated_at: Time,
            baseline:
              T.nilable(
                T.any(
                  ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsPageBaseline::OrHash,
                  ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsSitemapBaseline::OrHash,
                  ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsExtractBaseline::OrHash
                )
              ),
            last_change_at: T.nilable(Time),
            last_error:
              T.nilable(
                ContextDev::Models::MonitorListResponse::Data::LastError::OrHash
              ),
            last_run_at: T.nilable(Time),
            next_run_at: T.nilable(Time),
            tags: T::Array[String],
            webhook:
              T.nilable(
                ContextDev::Models::MonitorListResponse::Data::Webhook::OrHash
              ),
            webhook_failure:
              T.nilable(
                ContextDev::Models::MonitorListResponse::Data::WebhookFailure::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Discriminated union describing how changes are detected.
          change_detection:,
          created_at:,
          # Top-level monitor category. Always `web` today; the concrete behavior is
          # described by `target` and `change_detection`.
          mode:,
          name:,
          # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          # every 6 hours or every 2 days. The total interval (frequency × unit) must be
          # between 10 minutes and 1 year.
          schedule:,
          # Monitor lifecycle status. `failed` means the most recent run failed (see the
          # monitor's `last_error`); failed monitors keep running on schedule and flip back
          # to `active` on the next successful run. Monitors are auto-`paused` after
          # repeated consecutive failures or insufficient-credit skips; resume by PATCHing
          # status to `active`.
          status:,
          # Discriminated union describing what the monitor watches.
          target:,
          updated_at:,
          # Current baseline: the last observed value the monitor compares new snapshots
          # against. Its shape follows `target.type` (page/sitemap/extract). Only populated
          # on GET /monitors/{monitor_id}; null until the first baseline run completes (and
          # after a target or change_detection update, which resets the baseline).
          baseline: nil,
          last_change_at: nil,
          # Error from the most recent failed run; null when the last run succeeded.
          last_error: nil,
          last_run_at: nil,
          # When the next scheduled run is due.
          next_run_at: nil,
          # User-defined tags for grouping and filtering monitors and their changes.
          # Duplicates are removed.
          tags: nil,
          webhook: nil,
          # Present while webhook deliveries are failing consecutively; null when deliveries
          # are healthy or no webhook is configured. Cleared on the next successful delivery
          # and when the webhook URL changes.
          webhook_failure: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              change_detection:
                ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Variants,
              created_at: Time,
              mode:
                ContextDev::Models::MonitorListResponse::Data::Mode::TaggedSymbol,
              name: String,
              schedule: ContextDev::Models::MonitorListResponse::Data::Schedule,
              status:
                ContextDev::Models::MonitorListResponse::Data::Status::TaggedSymbol,
              target:
                ContextDev::Models::MonitorListResponse::Data::Target::Variants,
              updated_at: Time,
              baseline:
                T.nilable(
                  ContextDev::Models::MonitorListResponse::Data::Baseline::Variants
                ),
              last_change_at: T.nilable(Time),
              last_error:
                T.nilable(
                  ContextDev::Models::MonitorListResponse::Data::LastError
                ),
              last_run_at: T.nilable(Time),
              next_run_at: T.nilable(Time),
              tags: T::Array[String],
              webhook:
                T.nilable(
                  ContextDev::Models::MonitorListResponse::Data::Webhook
                ),
              webhook_failure:
                T.nilable(
                  ContextDev::Models::MonitorListResponse::Data::WebhookFailure
                )
            }
          )
        end
        def to_hash
        end

        # Discriminated union describing how changes are detected.
        module ChangeDetection
          extend ContextDev::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Exact,
                ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Semantic
              )
            end

          class Exact < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Exact,
                  ContextDev::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :type

            # Detect exact changes. For page targets, this means visible text diffs. For
            # sitemap targets, this means URL additions and removals.
            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :exact)
            end

            sig { override.returns({ type: Symbol }) }
            def to_hash
            end
          end

          class Semantic < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Semantic,
                  ContextDev::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :type

            sig { returns(T.nilable(Float)) }
            attr_reader :confidence_threshold

            sig { params(confidence_threshold: Float).void }
            attr_writer :confidence_threshold

            # Detect meaning-level changes to page content, ignoring cosmetic or
            # instruction-irrelevant differences. Which changes are meaningful is judged
            # against the page or extract target's `instructions` (and an extract target's
            # `schema`, when provided).
            sig do
              params(confidence_threshold: Float, type: Symbol).returns(
                T.attached_class
              )
            end
            def self.new(confidence_threshold: nil, type: :semantic)
            end

            sig do
              override.returns({ type: Symbol, confidence_threshold: Float })
            end
            def to_hash
            end
          end

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # Top-level monitor category. Always `web` today; the concrete behavior is
        # described by `target` and `change_detection`.
        module Mode
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::Models::MonitorListResponse::Data::Mode)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WEB =
            T.let(
              :web,
              ContextDev::Models::MonitorListResponse::Data::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListResponse::Data::Mode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Schedule < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorListResponse::Data::Schedule,
                ContextDev::Internal::AnyHash
              )
            end

          # Number of units between runs. The resulting interval (frequency × unit) must be
          # at least 10 minutes and at most 1 year (e.g. minimum 10 when unit is minutes;
          # maximum 365 when unit is days).
          sig { returns(Integer) }
          attr_accessor :frequency

          sig do
            returns(
              ContextDev::Models::MonitorListResponse::Data::Schedule::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            returns(
              ContextDev::Models::MonitorListResponse::Data::Schedule::Unit::TaggedSymbol
            )
          end
          attr_accessor :unit

          # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          # every 6 hours or every 2 days. The total interval (frequency × unit) must be
          # between 10 minutes and 1 year.
          sig do
            params(
              frequency: Integer,
              type:
                ContextDev::Models::MonitorListResponse::Data::Schedule::Type::OrSymbol,
              unit:
                ContextDev::Models::MonitorListResponse::Data::Schedule::Unit::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of units between runs. The resulting interval (frequency × unit) must be
            # at least 10 minutes and at most 1 year (e.g. minimum 10 when unit is minutes;
            # maximum 365 when unit is days).
            frequency:,
            type:,
            unit:
          )
          end

          sig do
            override.returns(
              {
                frequency: Integer,
                type:
                  ContextDev::Models::MonitorListResponse::Data::Schedule::Type::TaggedSymbol,
                unit:
                  ContextDev::Models::MonitorListResponse::Data::Schedule::Unit::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::Models::MonitorListResponse::Data::Schedule::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INTERVAL =
              T.let(
                :interval,
                ContextDev::Models::MonitorListResponse::Data::Schedule::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListResponse::Data::Schedule::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module Unit
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::Models::MonitorListResponse::Data::Schedule::Unit
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MINUTES =
              T.let(
                :minutes,
                ContextDev::Models::MonitorListResponse::Data::Schedule::Unit::TaggedSymbol
              )
            HOURS =
              T.let(
                :hours,
                ContextDev::Models::MonitorListResponse::Data::Schedule::Unit::TaggedSymbol
              )
            DAYS =
              T.let(
                :days,
                ContextDev::Models::MonitorListResponse::Data::Schedule::Unit::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListResponse::Data::Schedule::Unit::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        # Monitor lifecycle status. `failed` means the most recent run failed (see the
        # monitor's `last_error`); failed monitors keep running on schedule and flip back
        # to `active` on the next successful run. Monitors are auto-`paused` after
        # repeated consecutive failures or insufficient-credit skips; resume by PATCHing
        # status to `active`.
        module Status
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorListResponse::Data::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              ContextDev::Models::MonitorListResponse::Data::Status::TaggedSymbol
            )
          PAUSED =
            T.let(
              :paused,
              ContextDev::Models::MonitorListResponse::Data::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              ContextDev::Models::MonitorListResponse::Data::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListResponse::Data::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Discriminated union describing what the monitor watches.
        module Target
          extend ContextDev::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorListResponse::Data::Target::Page,
                ContextDev::Models::MonitorListResponse::Data::Target::Sitemap,
                ContextDev::Models::MonitorListResponse::Data::Target::Extract
              )
            end

          class Page < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::MonitorListResponse::Data::Target::Page,
                  ContextDev::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :type

            sig { returns(String) }
            attr_accessor :url

            # CSS selectors for HTML regions to remove before text extraction. Applied after
            # include_selectors; exclusion takes precedence when an element matches both. Omit
            # or pass an empty array to apply no explicit exclusions. Changing these selectors
            # creates a new baseline.
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :exclude_selectors

            sig { params(exclude_selectors: T::Array[String]).void }
            attr_writer :exclude_selectors

            # CSS selectors defining the HTML regions to monitor. Matching subtrees are
            # combined in document order before text extraction, instead of automatic
            # main-content selection. Omit or pass an empty array to use automatic
            # main-content extraction. If the filtered page has no usable text, the run fails
            # without replacing the baseline. Changing these selectors creates a new baseline.
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :include_selectors

            sig { params(include_selectors: T::Array[String]).void }
            attr_writer :include_selectors

            # Plain-language goal describing which page changes matter. When provided without
            # change_detection, semantic detection is inferred.
            sig { returns(T.nilable(String)) }
            attr_reader :instructions

            sig { params(instructions: String).void }
            attr_writer :instructions

            # Normalize whitespace before comparing or analyzing text.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :normalize_whitespace

            sig { params(normalize_whitespace: T::Boolean).void }
            attr_writer :normalize_whitespace

            # Watch a single web page. Exact detection reports visible-text diffs; semantic
            # detection judges confirmed stable diffs against `instructions`.
            sig do
              params(
                url: String,
                exclude_selectors: T::Array[String],
                include_selectors: T::Array[String],
                instructions: String,
                normalize_whitespace: T::Boolean,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              url:,
              # CSS selectors for HTML regions to remove before text extraction. Applied after
              # include_selectors; exclusion takes precedence when an element matches both. Omit
              # or pass an empty array to apply no explicit exclusions. Changing these selectors
              # creates a new baseline.
              exclude_selectors: nil,
              # CSS selectors defining the HTML regions to monitor. Matching subtrees are
              # combined in document order before text extraction, instead of automatic
              # main-content selection. Omit or pass an empty array to use automatic
              # main-content extraction. If the filtered page has no usable text, the run fails
              # without replacing the baseline. Changing these selectors creates a new baseline.
              include_selectors: nil,
              # Plain-language goal describing which page changes matter. When provided without
              # change_detection, semantic detection is inferred.
              instructions: nil,
              # Normalize whitespace before comparing or analyzing text.
              normalize_whitespace: nil,
              type: :page
            )
            end

            sig do
              override.returns(
                {
                  type: Symbol,
                  url: String,
                  exclude_selectors: T::Array[String],
                  include_selectors: T::Array[String],
                  instructions: String,
                  normalize_whitespace: T::Boolean
                }
              )
            end
            def to_hash
            end
          end

          class Sitemap < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::MonitorListResponse::Data::Target::Sitemap,
                  ContextDev::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :type

            # Sitemap URL to monitor.
            sig { returns(String) }
            attr_accessor :url

            # URL path patterns to exclude (max 50).
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :exclude

            sig { params(exclude: T::Array[String]).void }
            attr_writer :exclude

            # URL path patterns to include (max 50).
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :include

            sig { params(include: T::Array[String]).void }
            attr_writer :include

            # Maximum number of sitemap URLs to track (capped at 10,000).
            sig { returns(T.nilable(Integer)) }
            attr_reader :max_urls

            sig { params(max_urls: Integer).void }
            attr_writer :max_urls

            # Watch a sitemap for URL additions and removals. Crawled URLs are normalized
            # (lowercased host, no trailing slash/fragment) and scoped to the monitored site
            # and its subdomains before comparison. On a detected difference the sitemap is
            # re-fetched within the same run and only URLs both observations agree on are
            # reported, suppressing transient crawl flaps.
            sig do
              params(
                url: String,
                exclude: T::Array[String],
                include: T::Array[String],
                max_urls: Integer,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Sitemap URL to monitor.
              url:,
              # URL path patterns to exclude (max 50).
              exclude: nil,
              # URL path patterns to include (max 50).
              include: nil,
              # Maximum number of sitemap URLs to track (capped at 10,000).
              max_urls: nil,
              type: :sitemap
            )
            end

            sig do
              override.returns(
                {
                  type: Symbol,
                  url: String,
                  exclude: T::Array[String],
                  include: T::Array[String],
                  max_urls: Integer
                }
              )
            end
            def to_hash
            end
          end

          class Extract < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::MonitorListResponse::Data::Target::Extract,
                  ContextDev::Internal::AnyHash
                )
              end

            # Natural-language instructions guiding which pages and facts to track and which
            # changes to report.
            sig { returns(String) }
            attr_accessor :instructions

            sig { returns(Symbol) }
            attr_accessor :type

            # Root URL to extract structured data from.
            sig { returns(String) }
            attr_accessor :url

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :follow_subdomains

            sig { params(follow_subdomains: T::Boolean).void }
            attr_writer :follow_subdomains

            # Optional maximum link depth from the starting URL (0 = only the starting page).
            sig { returns(T.nilable(Integer)) }
            attr_reader :max_depth

            sig { params(max_depth: Integer).void }
            attr_writer :max_depth

            # Maximum number of pages to track.
            sig { returns(T.nilable(Integer)) }
            attr_reader :max_pages

            sig { params(max_pages: Integer).void }
            attr_writer :max_pages

            # JSON Schema describing the data you care about. It is used three ways: it guides
            # which pages are selected for tracking, it gives the change judge extra context
            # on which changes matter (alongside `instructions`), and it defines the shape of
            # the baseline `data` snapshot on GET /monitors/{monitor_id} (refreshed at most
            # about once a day). It is not a response format for changes: change events and
            # webhook payloads always contain diffs, summaries, and evidence excerpts — never
            # data in this schema's shape. If omitted, a default summary + key-points schema
            # is used.
            sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
            attr_reader :schema

            sig { params(schema: T::Hash[Symbol, T.anything]).void }
            attr_writer :schema

            # Watch the monitor-relevant pages of a site for meaningful changes. A crawl
            # guided by `schema`/`instructions` selects up to `max_pages` relevant pages to
            # track; each run re-checks exactly those pages, and confirmed content changes are
            # judged for relevance against the monitor's `instructions` (and `schema`, when
            # provided). The tracked page set is refreshed by a periodic re-discovery crawl.
            sig do
              params(
                instructions: String,
                url: String,
                follow_subdomains: T::Boolean,
                max_depth: Integer,
                max_pages: Integer,
                schema: T::Hash[Symbol, T.anything],
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Natural-language instructions guiding which pages and facts to track and which
              # changes to report.
              instructions:,
              # Root URL to extract structured data from.
              url:,
              follow_subdomains: nil,
              # Optional maximum link depth from the starting URL (0 = only the starting page).
              max_depth: nil,
              # Maximum number of pages to track.
              max_pages: nil,
              # JSON Schema describing the data you care about. It is used three ways: it guides
              # which pages are selected for tracking, it gives the change judge extra context
              # on which changes matter (alongside `instructions`), and it defines the shape of
              # the baseline `data` snapshot on GET /monitors/{monitor_id} (refreshed at most
              # about once a day). It is not a response format for changes: change events and
              # webhook payloads always contain diffs, summaries, and evidence excerpts — never
              # data in this schema's shape. If omitted, a default summary + key-points schema
              # is used.
              schema: nil,
              type: :extract
            )
            end

            sig do
              override.returns(
                {
                  instructions: String,
                  type: Symbol,
                  url: String,
                  follow_subdomains: T::Boolean,
                  max_depth: Integer,
                  max_pages: Integer,
                  schema: T::Hash[Symbol, T.anything]
                }
              )
            end
            def to_hash
            end
          end

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListResponse::Data::Target::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # Current baseline: the last observed value the monitor compares new snapshots
        # against. Its shape follows `target.type` (page/sitemap/extract). Only populated
        # on GET /monitors/{monitor_id}; null until the first baseline run completes (and
        # after a target or change_detection update, which resets the baseline).
        module Baseline
          extend ContextDev::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsPageBaseline,
                ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsSitemapBaseline,
                ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsExtractBaseline
              )
            end

          class MonitorsPageBaseline < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsPageBaseline,
                  ContextDev::Internal::AnyHash
                )
              end

            # When this baseline was last captured or replaced.
            sig { returns(Time) }
            attr_accessor :captured_at

            # The page's visible text as last observed.
            sig { returns(String) }
            attr_accessor :text

            # Current baseline of a `page` monitor: the visible page text as last observed.
            sig do
              params(captured_at: Time, text: String).returns(T.attached_class)
            end
            def self.new(
              # When this baseline was last captured or replaced.
              captured_at:,
              # The page's visible text as last observed.
              text:
            )
            end

            sig { override.returns({ captured_at: Time, text: String }) }
            def to_hash
            end
          end

          class MonitorsSitemapBaseline < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsSitemapBaseline,
                  ContextDev::Internal::AnyHash
                )
              end

            # When this baseline was last captured or replaced.
            sig { returns(Time) }
            attr_accessor :captured_at

            # Number of URLs in the baseline.
            sig { returns(Integer) }
            attr_accessor :url_count

            # The sitemap URLs as last observed (sorted, normalized).
            sig { returns(T::Array[String]) }
            attr_accessor :urls

            # Current baseline of a `sitemap` monitor: the normalized URL set as last
            # observed.
            sig do
              params(
                captured_at: Time,
                url_count: Integer,
                urls: T::Array[String]
              ).returns(T.attached_class)
            end
            def self.new(
              # When this baseline was last captured or replaced.
              captured_at:,
              # Number of URLs in the baseline.
              url_count:,
              # The sitemap URLs as last observed (sorted, normalized).
              urls:
            )
            end

            sig do
              override.returns(
                {
                  captured_at: Time,
                  url_count: Integer,
                  urls: T::Array[String]
                }
              )
            end
            def to_hash
            end
          end

          class MonitorsExtractBaseline < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::MonitorListResponse::Data::Baseline::MonitorsExtractBaseline,
                  ContextDev::Internal::AnyHash
                )
              end

            # When this baseline was last captured or replaced.
            sig { returns(Time) }
            attr_accessor :captured_at

            # The extracted structured data, matching the monitor's extraction schema (same
            # shape as the /web/extract endpoint's `data`). Refreshed when the monitor
            # re-discovers its page set (at most about once a day); `null` when no extraction
            # has been captured yet.
            sig { returns(T.anything) }
            attr_accessor :data

            # The page URLs the monitor tracks and analyzes for changes.
            sig { returns(T::Array[String]) }
            attr_accessor :urls_analyzed

            # Current baseline of an `extract` monitor: the pages it tracks and the structured
            # data as last extracted.
            sig do
              params(
                captured_at: Time,
                data: T.anything,
                urls_analyzed: T::Array[String]
              ).returns(T.attached_class)
            end
            def self.new(
              # When this baseline was last captured or replaced.
              captured_at:,
              # The extracted structured data, matching the monitor's extraction schema (same
              # shape as the /web/extract endpoint's `data`). Refreshed when the monitor
              # re-discovers its page set (at most about once a day); `null` when no extraction
              # has been captured yet.
              data:,
              # The page URLs the monitor tracks and analyzes for changes.
              urls_analyzed:
            )
            end

            sig do
              override.returns(
                {
                  captured_at: Time,
                  data: T.anything,
                  urls_analyzed: T::Array[String]
                }
              )
            end
            def to_hash
            end
          end

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListResponse::Data::Baseline::Variants
              ]
            )
          end
          def self.variants
          end
        end

        class LastError < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorListResponse::Data::LastError,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :code

          sig { returns(String) }
          attr_accessor :message

          # Error from the most recent failed run; null when the last run succeeded.
          sig do
            params(code: String, message: String).returns(T.attached_class)
          end
          def self.new(code:, message:)
          end

          sig { override.returns({ code: String, message: String }) }
          def to_hash
          end
        end

        class Webhook < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorListResponse::Data::Webhook,
                ContextDev::Internal::AnyHash
              )
            end

          # Webhook URL events are delivered to.
          sig { returns(String) }
          attr_accessor :url

          # Events delivered to this endpoint. `change.detected` fires only when a run
          # detects a change; `run.completed` fires on every completed run — including runs
          # that detected no change — and embeds the change when one was detected. Defaults
          # to `["change.detected"]` when omitted.
          sig do
            returns(
              T.nilable(
                T::Array[
                  ContextDev::Models::MonitorListResponse::Data::Webhook::Event::TaggedSymbol
                ]
              )
            )
          end
          attr_reader :events

          sig do
            params(
              events:
                T::Array[
                  ContextDev::Models::MonitorListResponse::Data::Webhook::Event::OrSymbol
                ]
            ).void
          end
          attr_writer :events

          # Webhook retry settings. Use {} for the default schedule.
          sig { returns(T.nilable(ContextDev::RetryConfig)) }
          attr_reader :retry_

          sig { params(retry_: ContextDev::RetryConfig::OrHash).void }
          attr_writer :retry_

          # Signing secret used to verify webhook authenticity. Omitted unless the API key
          # has monitors:write permission or full access. Each delivery includes an
          # `X-Context-Signature: t=<unix>,v1=<hmac>` header, where the HMAC is SHA-256 over
          # `"{t}.{rawRequestBody}"` keyed by this secret. Recompute it with a constant-time
          # compare and reject stale timestamps to prevent replay. Generated by the API;
          # cannot be set by clients.
          sig { returns(T.nilable(String)) }
          attr_reader :secret

          sig { params(secret: String).void }
          attr_writer :secret

          sig do
            params(
              url: String,
              events:
                T::Array[
                  ContextDev::Models::MonitorListResponse::Data::Webhook::Event::OrSymbol
                ],
              retry_: ContextDev::RetryConfig::OrHash,
              secret: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Webhook URL events are delivered to.
            url:,
            # Events delivered to this endpoint. `change.detected` fires only when a run
            # detects a change; `run.completed` fires on every completed run — including runs
            # that detected no change — and embeds the change when one was detected. Defaults
            # to `["change.detected"]` when omitted.
            events: nil,
            # Webhook retry settings. Use {} for the default schedule.
            retry_: nil,
            # Signing secret used to verify webhook authenticity. Omitted unless the API key
            # has monitors:write permission or full access. Each delivery includes an
            # `X-Context-Signature: t=<unix>,v1=<hmac>` header, where the HMAC is SHA-256 over
            # `"{t}.{rawRequestBody}"` keyed by this secret. Recompute it with a constant-time
            # compare and reject stale timestamps to prevent replay. Generated by the API;
            # cannot be set by clients.
            secret: nil
          )
          end

          sig do
            override.returns(
              {
                url: String,
                events:
                  T::Array[
                    ContextDev::Models::MonitorListResponse::Data::Webhook::Event::TaggedSymbol
                  ],
                retry_: ContextDev::RetryConfig,
                secret: String
              }
            )
          end
          def to_hash
          end

          module Event
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::Models::MonitorListResponse::Data::Webhook::Event
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CHANGE_DETECTED =
              T.let(
                :"change.detected",
                ContextDev::Models::MonitorListResponse::Data::Webhook::Event::TaggedSymbol
              )
            RUN_COMPLETED =
              T.let(
                :"run.completed",
                ContextDev::Models::MonitorListResponse::Data::Webhook::Event::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListResponse::Data::Webhook::Event::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class WebhookFailure < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorListResponse::Data::WebhookFailure,
                ContextDev::Internal::AnyHash
              )
            end

          # Number of consecutive delivery attempts that did not succeed.
          sig { returns(Integer) }
          attr_accessor :consecutive_failures

          sig { returns(Time) }
          attr_accessor :last_failed_at

          # Human-readable description of the most recent failure.
          sig { returns(String) }
          attr_accessor :last_message

          # Outcome of the most recent failed delivery. rejected means a non-2xx response;
          # failed means no HTTP response was received; skipped_unsafe_url means the URL
          # failed the public-endpoint safety check.
          sig do
            returns(
              ContextDev::Models::MonitorListResponse::Data::WebhookFailure::LastStatus::TaggedSymbol
            )
          end
          attr_accessor :last_status

          # Present while webhook deliveries are failing consecutively; null when deliveries
          # are healthy or no webhook is configured. Cleared on the next successful delivery
          # and when the webhook URL changes.
          sig do
            params(
              consecutive_failures: Integer,
              last_failed_at: Time,
              last_message: String,
              last_status:
                ContextDev::Models::MonitorListResponse::Data::WebhookFailure::LastStatus::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of consecutive delivery attempts that did not succeed.
            consecutive_failures:,
            last_failed_at:,
            # Human-readable description of the most recent failure.
            last_message:,
            # Outcome of the most recent failed delivery. rejected means a non-2xx response;
            # failed means no HTTP response was received; skipped_unsafe_url means the URL
            # failed the public-endpoint safety check.
            last_status:
          )
          end

          sig do
            override.returns(
              {
                consecutive_failures: Integer,
                last_failed_at: Time,
                last_message: String,
                last_status:
                  ContextDev::Models::MonitorListResponse::Data::WebhookFailure::LastStatus::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # Outcome of the most recent failed delivery. rejected means a non-2xx response;
          # failed means no HTTP response was received; skipped_unsafe_url means the URL
          # failed the public-endpoint safety check.
          module LastStatus
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::Models::MonitorListResponse::Data::WebhookFailure::LastStatus
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            REJECTED =
              T.let(
                :rejected,
                ContextDev::Models::MonitorListResponse::Data::WebhookFailure::LastStatus::TaggedSymbol
              )
            FAILED =
              T.let(
                :failed,
                ContextDev::Models::MonitorListResponse::Data::WebhookFailure::LastStatus::TaggedSymbol
              )
            SKIPPED_UNSAFE_URL =
              T.let(
                :skipped_unsafe_url,
                ContextDev::Models::MonitorListResponse::Data::WebhookFailure::LastStatus::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListResponse::Data::WebhookFailure::LastStatus::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
