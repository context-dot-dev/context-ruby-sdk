# typed: strong

module ContextDev
  module Models
    class MonitorUpdateResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::MonitorUpdateResponse,
            ContextDev::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Discriminated union describing how changes are detected.
      sig do
        returns(
          ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Variants
        )
      end
      attr_accessor :change_detection

      sig { returns(Time) }
      attr_accessor :created_at

      # Top-level monitor category. Always `web` today; the concrete behavior is
      # described by `target` and `change_detection`.
      sig do
        returns(ContextDev::Models::MonitorUpdateResponse::Mode::TaggedSymbol)
      end
      attr_accessor :mode

      sig { returns(String) }
      attr_accessor :name

      # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
      # every 6 hours or every 2 days. The total interval (frequency × unit) must be
      # between 10 minutes and 1 year.
      sig { returns(ContextDev::Models::MonitorUpdateResponse::Schedule) }
      attr_reader :schedule

      sig do
        params(
          schedule: ContextDev::Models::MonitorUpdateResponse::Schedule::OrHash
        ).void
      end
      attr_writer :schedule

      # Monitor lifecycle status. `failed` means the most recent run failed (see the
      # monitor's `last_error`); failed monitors keep running on schedule and flip back
      # to `active` on the next successful run. Monitors are auto-`paused` after
      # repeated consecutive failures or insufficient-credit skips; resume by PATCHing
      # status to `active`.
      sig do
        returns(ContextDev::Models::MonitorUpdateResponse::Status::TaggedSymbol)
      end
      attr_accessor :status

      # Discriminated union describing what the monitor watches.
      sig do
        returns(ContextDev::Models::MonitorUpdateResponse::Target::Variants)
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
            ContextDev::Models::MonitorUpdateResponse::Baseline::Variants
          )
        )
      end
      attr_accessor :baseline

      sig { returns(T.nilable(Time)) }
      attr_accessor :last_change_at

      # Error from the most recent failed run; null when the last run succeeded.
      sig do
        returns(T.nilable(ContextDev::Models::MonitorUpdateResponse::LastError))
      end
      attr_reader :last_error

      sig do
        params(
          last_error:
            T.nilable(
              ContextDev::Models::MonitorUpdateResponse::LastError::OrHash
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
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      sig do
        returns(T.nilable(ContextDev::Models::MonitorUpdateResponse::Webhook))
      end
      attr_reader :webhook

      sig do
        params(
          webhook:
            T.nilable(
              ContextDev::Models::MonitorUpdateResponse::Webhook::OrHash
            )
        ).void
      end
      attr_writer :webhook

      # A web monitor. `mode` is the constant `web`; behavior is described by `target`
      # (page/sitemap/extract) and `change_detection` (exact/semantic).
      sig do
        params(
          id: String,
          change_detection:
            T.any(
              ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Exact::OrHash,
              ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Semantic::OrHash
            ),
          created_at: Time,
          mode: ContextDev::Models::MonitorUpdateResponse::Mode::OrSymbol,
          name: String,
          schedule: ContextDev::Models::MonitorUpdateResponse::Schedule::OrHash,
          status: ContextDev::Models::MonitorUpdateResponse::Status::OrSymbol,
          target:
            T.any(
              ContextDev::Models::MonitorUpdateResponse::Target::Page::OrHash,
              ContextDev::Models::MonitorUpdateResponse::Target::Sitemap::OrHash,
              ContextDev::Models::MonitorUpdateResponse::Target::Extract::OrHash
            ),
          updated_at: Time,
          baseline:
            T.nilable(
              T.any(
                ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsPageBaseline::OrHash,
                ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsSitemapBaseline::OrHash,
                ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsExtractBaseline::OrHash
              )
            ),
          last_change_at: T.nilable(Time),
          last_error:
            T.nilable(
              ContextDev::Models::MonitorUpdateResponse::LastError::OrHash
            ),
          last_run_at: T.nilable(Time),
          next_run_at: T.nilable(Time),
          tags: T::Array[String],
          webhook:
            T.nilable(
              ContextDev::Models::MonitorUpdateResponse::Webhook::OrHash
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
        tags: nil,
        webhook: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            change_detection:
              ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Variants,
            created_at: Time,
            mode: ContextDev::Models::MonitorUpdateResponse::Mode::TaggedSymbol,
            name: String,
            schedule: ContextDev::Models::MonitorUpdateResponse::Schedule,
            status:
              ContextDev::Models::MonitorUpdateResponse::Status::TaggedSymbol,
            target: ContextDev::Models::MonitorUpdateResponse::Target::Variants,
            updated_at: Time,
            baseline:
              T.nilable(
                ContextDev::Models::MonitorUpdateResponse::Baseline::Variants
              ),
            last_change_at: T.nilable(Time),
            last_error:
              T.nilable(ContextDev::Models::MonitorUpdateResponse::LastError),
            last_run_at: T.nilable(Time),
            next_run_at: T.nilable(Time),
            tags: T::Array[String],
            webhook:
              T.nilable(ContextDev::Models::MonitorUpdateResponse::Webhook)
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
              ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Exact,
              ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Semantic
            )
          end

        class Exact < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Exact,
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
                ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Semantic,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          sig { returns(T.nilable(Float)) }
          attr_reader :confidence_threshold

          sig { params(confidence_threshold: Float).void }
          attr_writer :confidence_threshold

          # Detect meaning-level changes to the extracted data, ignoring cosmetic or
          # paraphrase-only differences. What is watched is determined by the extract
          # target's `schema` and `instructions`.
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
              ContextDev::Models::MonitorUpdateResponse::ChangeDetection::Variants
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
            T.all(Symbol, ContextDev::Models::MonitorUpdateResponse::Mode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WEB =
          T.let(
            :web,
            ContextDev::Models::MonitorUpdateResponse::Mode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::MonitorUpdateResponse::Mode::TaggedSymbol
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
              ContextDev::Models::MonitorUpdateResponse::Schedule,
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
            ContextDev::Models::MonitorUpdateResponse::Schedule::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig do
          returns(
            ContextDev::Models::MonitorUpdateResponse::Schedule::Unit::TaggedSymbol
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
              ContextDev::Models::MonitorUpdateResponse::Schedule::Type::OrSymbol,
            unit:
              ContextDev::Models::MonitorUpdateResponse::Schedule::Unit::OrSymbol
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
                ContextDev::Models::MonitorUpdateResponse::Schedule::Type::TaggedSymbol,
              unit:
                ContextDev::Models::MonitorUpdateResponse::Schedule::Unit::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::Schedule::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INTERVAL =
            T.let(
              :interval,
              ContextDev::Models::MonitorUpdateResponse::Schedule::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorUpdateResponse::Schedule::Type::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::Schedule::Unit
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MINUTES =
            T.let(
              :minutes,
              ContextDev::Models::MonitorUpdateResponse::Schedule::Unit::TaggedSymbol
            )
          HOURS =
            T.let(
              :hours,
              ContextDev::Models::MonitorUpdateResponse::Schedule::Unit::TaggedSymbol
            )
          DAYS =
            T.let(
              :days,
              ContextDev::Models::MonitorUpdateResponse::Schedule::Unit::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorUpdateResponse::Schedule::Unit::TaggedSymbol
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
            T.all(Symbol, ContextDev::Models::MonitorUpdateResponse::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(
            :active,
            ContextDev::Models::MonitorUpdateResponse::Status::TaggedSymbol
          )
        PAUSED =
          T.let(
            :paused,
            ContextDev::Models::MonitorUpdateResponse::Status::TaggedSymbol
          )
        FAILED =
          T.let(
            :failed,
            ContextDev::Models::MonitorUpdateResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::MonitorUpdateResponse::Status::TaggedSymbol
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
              ContextDev::Models::MonitorUpdateResponse::Target::Page,
              ContextDev::Models::MonitorUpdateResponse::Target::Sitemap,
              ContextDev::Models::MonitorUpdateResponse::Target::Extract
            )
          end

        class Page < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorUpdateResponse::Target::Page,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          sig { returns(String) }
          attr_accessor :url

          # Normalize whitespace before comparing or analyzing text.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :normalize_whitespace

          sig { params(normalize_whitespace: T::Boolean).void }
          attr_writer :normalize_whitespace

          # Watch a single web page.
          sig do
            params(
              url: String,
              normalize_whitespace: T::Boolean,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            url:,
            # Normalize whitespace before comparing or analyzing text.
            normalize_whitespace: nil,
            type: :page
          )
          end

          sig do
            override.returns(
              { type: Symbol, url: String, normalize_whitespace: T::Boolean }
            )
          end
          def to_hash
          end
        end

        class Sitemap < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorUpdateResponse::Target::Sitemap,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # Sitemap URL to monitor.
          sig { returns(String) }
          attr_accessor :url

          # URL path patterns to exclude.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :exclude

          sig { params(exclude: T::Array[String]).void }
          attr_writer :exclude

          # URL path patterns to include.
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
          # and its subdomains before comparison. A new URL set must be observed on two
          # consecutive runs before a change is reported, suppressing one-run crawl flaps.
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
            # URL path patterns to exclude.
            exclude: nil,
            # URL path patterns to include.
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
                ContextDev::Models::MonitorUpdateResponse::Target::Extract,
                ContextDev::Internal::AnyHash
              )
            end

          # Natural-language instructions describing what to extract and watch. This single
          # prompt scopes both the extraction and what changes get reported: only data
          # captured by the schema and these instructions is compared between runs.
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

          # Maximum number of pages to analyze during extraction.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_pages

          sig { params(max_pages: Integer).void }
          attr_writer :max_pages

          # JSON Schema describing the structured data to extract and watch for changes. If
          # omitted, a default summary + key-points schema is used.
          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_reader :schema

          sig { params(schema: T::Hash[Symbol, T.anything]).void }
          attr_writer :schema

          # Watch a site's extracted structured data.
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
            # Natural-language instructions describing what to extract and watch. This single
            # prompt scopes both the extraction and what changes get reported: only data
            # captured by the schema and these instructions is compared between runs.
            instructions:,
            # Root URL to extract structured data from.
            url:,
            follow_subdomains: nil,
            # Optional maximum link depth from the starting URL (0 = only the starting page).
            max_depth: nil,
            # Maximum number of pages to analyze during extraction.
            max_pages: nil,
            # JSON Schema describing the structured data to extract and watch for changes. If
            # omitted, a default summary + key-points schema is used.
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
              ContextDev::Models::MonitorUpdateResponse::Target::Variants
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
              ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsPageBaseline,
              ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsSitemapBaseline,
              ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsExtractBaseline
            )
          end

        class MonitorsPageBaseline < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsPageBaseline,
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
                ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsSitemapBaseline,
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
              { captured_at: Time, url_count: Integer, urls: T::Array[String] }
            )
          end
          def to_hash
          end
        end

        class MonitorsExtractBaseline < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorUpdateResponse::Baseline::MonitorsExtractBaseline,
                ContextDev::Internal::AnyHash
              )
            end

          # When this baseline was last captured or replaced.
          sig { returns(Time) }
          attr_accessor :captured_at

          # The extracted structured data, matching the monitor's extraction schema (same
          # shape as the /web/extract endpoint's `data`).
          sig { returns(T.anything) }
          attr_accessor :data

          # URLs that were analyzed to produce the extracted data.
          sig { returns(T::Array[String]) }
          attr_accessor :urls_analyzed

          # Current baseline of an `extract` monitor: the structured data as last extracted.
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
            # shape as the /web/extract endpoint's `data`).
            data:,
            # URLs that were analyzed to produce the extracted data.
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
              ContextDev::Models::MonitorUpdateResponse::Baseline::Variants
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
              ContextDev::Models::MonitorUpdateResponse::LastError,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :code

        sig { returns(String) }
        attr_accessor :message

        # Error from the most recent failed run; null when the last run succeeded.
        sig { params(code: String, message: String).returns(T.attached_class) }
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
              ContextDev::Models::MonitorUpdateResponse::Webhook,
              ContextDev::Internal::AnyHash
            )
          end

        # Webhook URL called when a change is detected.
        sig { returns(String) }
        attr_accessor :url

        # Signing secret used to verify webhook authenticity. Each delivery includes an
        # `X-Context-Signature: t=<unix>,v1=<hmac>` header, where the HMAC is SHA-256 over
        # `"{t}.{rawRequestBody}"` keyed by this secret. Recompute it with a constant-time
        # compare and reject stale timestamps to prevent replay. Generated by the API;
        # cannot be set by clients.
        sig { returns(T.nilable(String)) }
        attr_reader :secret

        sig { params(secret: String).void }
        attr_writer :secret

        sig { params(url: String, secret: String).returns(T.attached_class) }
        def self.new(
          # Webhook URL called when a change is detected.
          url:,
          # Signing secret used to verify webhook authenticity. Each delivery includes an
          # `X-Context-Signature: t=<unix>,v1=<hmac>` header, where the HMAC is SHA-256 over
          # `"{t}.{rawRequestBody}"` keyed by this secret. Recompute it with a constant-time
          # compare and reject stale timestamps to prevent replay. Generated by the API;
          # cannot be set by clients.
          secret: nil
        )
        end

        sig { override.returns({ url: String, secret: String }) }
        def to_hash
        end
      end
    end
  end
end
