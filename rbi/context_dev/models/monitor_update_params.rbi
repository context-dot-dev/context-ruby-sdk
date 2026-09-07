# typed: strong

module ContextDev
  module Models
    class MonitorUpdateParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::MonitorUpdateParams, ContextDev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :monitor_id

      # Discriminated union describing how changes are detected.
      sig do
        returns(
          T.nilable(
            T.any(
              ContextDev::MonitorUpdateParams::ChangeDetection::Exact,
              ContextDev::MonitorUpdateParams::ChangeDetection::Semantic
            )
          )
        )
      end
      attr_reader :change_detection

      sig do
        params(
          change_detection:
            T.any(
              ContextDev::MonitorUpdateParams::ChangeDetection::Exact::OrHash,
              ContextDev::MonitorUpdateParams::ChangeDetection::Semantic::OrHash
            )
        ).void
      end
      attr_writer :change_detection

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
      # every 6 hours or every 2 days. The total interval (frequency × unit) must be
      # between 10 minutes and 1 year.
      sig { returns(T.nilable(ContextDev::MonitorUpdateParams::Schedule)) }
      attr_reader :schedule

      sig do
        params(schedule: ContextDev::MonitorUpdateParams::Schedule::OrHash).void
      end
      attr_writer :schedule

      sig do
        returns(T.nilable(ContextDev::MonitorUpdateParams::Status::OrSymbol))
      end
      attr_reader :status

      sig do
        params(status: ContextDev::MonitorUpdateParams::Status::OrSymbol).void
      end
      attr_writer :status

      # User-defined tags for grouping and filtering monitors and their changes.
      # Duplicates are removed.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Discriminated union describing what the monitor watches.
      sig do
        returns(
          T.nilable(
            T.any(
              ContextDev::MonitorUpdateParams::Target::Page,
              ContextDev::MonitorUpdateParams::Target::Sitemap,
              ContextDev::MonitorUpdateParams::Target::Extract
            )
          )
        )
      end
      attr_reader :target

      sig do
        params(
          target:
            T.any(
              ContextDev::MonitorUpdateParams::Target::Page::OrHash,
              ContextDev::MonitorUpdateParams::Target::Sitemap::OrHash,
              ContextDev::MonitorUpdateParams::Target::Extract::OrHash
            )
        ).void
      end
      attr_writer :target

      # Set to null to remove the webhook.
      sig { returns(T.nilable(ContextDev::MonitorUpdateParams::Webhook)) }
      attr_reader :webhook

      sig do
        params(
          webhook: T.nilable(ContextDev::MonitorUpdateParams::Webhook::OrHash)
        ).void
      end
      attr_writer :webhook

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
        ).returns(T.attached_class)
      end
      def self.new(
        monitor_id:,
        # Discriminated union describing how changes are detected.
        change_detection: nil,
        name: nil,
        # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        # every 6 hours or every 2 days. The total interval (frequency × unit) must be
        # between 10 minutes and 1 year.
        schedule: nil,
        status: nil,
        # User-defined tags for grouping and filtering monitors and their changes.
        # Duplicates are removed.
        tags: nil,
        # Discriminated union describing what the monitor watches.
        target: nil,
        # Set to null to remove the webhook.
        webhook: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            monitor_id: String,
            change_detection:
              T.any(
                ContextDev::MonitorUpdateParams::ChangeDetection::Exact,
                ContextDev::MonitorUpdateParams::ChangeDetection::Semantic
              ),
            name: String,
            schedule: ContextDev::MonitorUpdateParams::Schedule,
            status: ContextDev::MonitorUpdateParams::Status::OrSymbol,
            tags: T::Array[String],
            target:
              T.any(
                ContextDev::MonitorUpdateParams::Target::Page,
                ContextDev::MonitorUpdateParams::Target::Sitemap,
                ContextDev::MonitorUpdateParams::Target::Extract
              ),
            webhook: T.nilable(ContextDev::MonitorUpdateParams::Webhook),
            request_options: ContextDev::RequestOptions
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
              ContextDev::MonitorUpdateParams::ChangeDetection::Exact,
              ContextDev::MonitorUpdateParams::ChangeDetection::Semantic
            )
          end

        class Exact < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::MonitorUpdateParams::ChangeDetection::Exact,
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
                ContextDev::MonitorUpdateParams::ChangeDetection::Semantic,
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
            T::Array[ContextDev::MonitorUpdateParams::ChangeDetection::Variants]
          )
        end
        def self.variants
        end
      end

      class Schedule < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::MonitorUpdateParams::Schedule,
              ContextDev::Internal::AnyHash
            )
          end

        # Number of units between runs. The resulting interval (frequency × unit) must be
        # at least 10 minutes and at most 1 year (e.g. minimum 10 when unit is minutes;
        # maximum 365 when unit is days).
        sig { returns(Integer) }
        attr_accessor :frequency

        sig do
          returns(ContextDev::MonitorUpdateParams::Schedule::Type::OrSymbol)
        end
        attr_accessor :type

        sig do
          returns(ContextDev::MonitorUpdateParams::Schedule::Unit::OrSymbol)
        end
        attr_accessor :unit

        # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        # every 6 hours or every 2 days. The total interval (frequency × unit) must be
        # between 10 minutes and 1 year.
        sig do
          params(
            frequency: Integer,
            type: ContextDev::MonitorUpdateParams::Schedule::Type::OrSymbol,
            unit: ContextDev::MonitorUpdateParams::Schedule::Unit::OrSymbol
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
              type: ContextDev::MonitorUpdateParams::Schedule::Type::OrSymbol,
              unit: ContextDev::MonitorUpdateParams::Schedule::Unit::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::MonitorUpdateParams::Schedule::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INTERVAL =
            T.let(
              :interval,
              ContextDev::MonitorUpdateParams::Schedule::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::MonitorUpdateParams::Schedule::Type::TaggedSymbol
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
              T.all(Symbol, ContextDev::MonitorUpdateParams::Schedule::Unit)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MINUTES =
            T.let(
              :minutes,
              ContextDev::MonitorUpdateParams::Schedule::Unit::TaggedSymbol
            )
          HOURS =
            T.let(
              :hours,
              ContextDev::MonitorUpdateParams::Schedule::Unit::TaggedSymbol
            )
          DAYS =
            T.let(
              :days,
              ContextDev::MonitorUpdateParams::Schedule::Unit::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::MonitorUpdateParams::Schedule::Unit::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      module Status
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::MonitorUpdateParams::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(:active, ContextDev::MonitorUpdateParams::Status::TaggedSymbol)
        PAUSED =
          T.let(:paused, ContextDev::MonitorUpdateParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::MonitorUpdateParams::Status::TaggedSymbol]
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
              ContextDev::MonitorUpdateParams::Target::Page,
              ContextDev::MonitorUpdateParams::Target::Sitemap,
              ContextDev::MonitorUpdateParams::Target::Extract
            )
          end

        class Page < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::MonitorUpdateParams::Target::Page,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          sig { returns(String) }
          attr_accessor :url

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
              instructions: String,
              normalize_whitespace: T::Boolean,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            url:,
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
                ContextDev::MonitorUpdateParams::Target::Sitemap,
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
                ContextDev::MonitorUpdateParams::Target::Extract,
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
            T::Array[ContextDev::MonitorUpdateParams::Target::Variants]
          )
        end
        def self.variants
        end
      end

      class Webhook < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::MonitorUpdateParams::Webhook,
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
                ContextDev::MonitorUpdateParams::Webhook::Event::OrSymbol
              ]
            )
          )
        end
        attr_reader :events

        sig do
          params(
            events:
              T::Array[
                ContextDev::MonitorUpdateParams::Webhook::Event::OrSymbol
              ]
          ).void
        end
        attr_writer :events

        # Opt into durable webhook delivery. An empty object uses the default retry
        # schedule. Omit retry to preserve legacy delivery behavior. The policy is
        # snapshotted for each event.
        sig { returns(T.nilable(ContextDev::RetryConfig)) }
        attr_reader :retry_

        sig { params(retry_: ContextDev::RetryConfig::OrHash).void }
        attr_writer :retry_

        # Set to null to remove the webhook.
        sig do
          params(
            url: String,
            events:
              T::Array[
                ContextDev::MonitorUpdateParams::Webhook::Event::OrSymbol
              ],
            retry_: ContextDev::RetryConfig::OrHash
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
          # Opt into durable webhook delivery. An empty object uses the default retry
          # schedule. Omit retry to preserve legacy delivery behavior. The policy is
          # snapshotted for each event.
          retry_: nil
        )
        end

        sig do
          override.returns(
            {
              url: String,
              events:
                T::Array[
                  ContextDev::MonitorUpdateParams::Webhook::Event::OrSymbol
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
              T.all(Symbol, ContextDev::MonitorUpdateParams::Webhook::Event)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CHANGE_DETECTED =
            T.let(
              :"change.detected",
              ContextDev::MonitorUpdateParams::Webhook::Event::TaggedSymbol
            )
          RUN_COMPLETED =
            T.let(
              :"run.completed",
              ContextDev::MonitorUpdateParams::Webhook::Event::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::MonitorUpdateParams::Webhook::Event::TaggedSymbol
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
