# typed: strong

module ContextDev
  module Models
    class MonitorCreateParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::MonitorCreateParams, ContextDev::Internal::AnyHash)
        end

      # Display name for the monitor.
      sig { returns(String) }
      attr_accessor :name

      # What to watch: a page, a sitemap, or data extracted from a site.
      sig do
        returns(
          T.any(
            ContextDev::MonitorCreateParams::Target::Page,
            ContextDev::MonitorCreateParams::Target::Sitemap,
            ContextDev::MonitorCreateParams::Target::Extract
          )
        )
      end
      attr_accessor :target

      # How changes are judged. Defaults to `semantic` for extract targets and page
      # targets with `instructions`, otherwise `exact`.
      sig do
        returns(
          T.nilable(
            T.any(
              ContextDev::MonitorCreateParams::ChangeDetection::Exact,
              ContextDev::MonitorCreateParams::ChangeDetection::Semantic
            )
          )
        )
      end
      attr_reader :change_detection

      sig do
        params(
          change_detection:
            T.any(
              ContextDev::MonitorCreateParams::ChangeDetection::Exact::OrHash,
              ContextDev::MonitorCreateParams::ChangeDetection::Semantic::OrHash
            )
        ).void
      end
      attr_writer :change_detection

      # Always `web`. Optional.
      sig do
        returns(T.nilable(ContextDev::MonitorCreateParams::Mode::OrSymbol))
      end
      attr_reader :mode

      sig { params(mode: ContextDev::MonitorCreateParams::Mode::OrSymbol).void }
      attr_writer :mode

      # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
      # every 6 hours or every 2 days. The total interval (frequency × unit) must be
      # between 10 minutes and 1 year.
      sig { returns(T.nilable(ContextDev::MonitorCreateParams::Schedule)) }
      attr_reader :schedule

      sig do
        params(schedule: ContextDev::MonitorCreateParams::Schedule::OrHash).void
      end
      attr_writer :schedule

      # Labels for filtering monitors, their changes, and their usage.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Webhook destination and delivery settings. Null means no webhook is configured.
      sig { returns(T.nilable(ContextDev::MonitorCreateParams::Webhook)) }
      attr_reader :webhook

      sig do
        params(
          webhook: T.nilable(ContextDev::MonitorCreateParams::Webhook::OrHash)
        ).void
      end
      attr_writer :webhook

      sig do
        params(
          name: String,
          target:
            T.any(
              ContextDev::MonitorCreateParams::Target::Page::OrHash,
              ContextDev::MonitorCreateParams::Target::Sitemap::OrHash,
              ContextDev::MonitorCreateParams::Target::Extract::OrHash
            ),
          change_detection:
            T.any(
              ContextDev::MonitorCreateParams::ChangeDetection::Exact::OrHash,
              ContextDev::MonitorCreateParams::ChangeDetection::Semantic::OrHash
            ),
          mode: ContextDev::MonitorCreateParams::Mode::OrSymbol,
          schedule: ContextDev::MonitorCreateParams::Schedule::OrHash,
          tags: T::Array[String],
          webhook: T.nilable(ContextDev::MonitorCreateParams::Webhook::OrHash),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Display name for the monitor.
        name:,
        # What to watch: a page, a sitemap, or data extracted from a site.
        target:,
        # How changes are judged. Defaults to `semantic` for extract targets and page
        # targets with `instructions`, otherwise `exact`.
        change_detection: nil,
        # Always `web`. Optional.
        mode: nil,
        # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        # every 6 hours or every 2 days. The total interval (frequency × unit) must be
        # between 10 minutes and 1 year.
        schedule: nil,
        # Labels for filtering monitors, their changes, and their usage.
        tags: nil,
        # Webhook destination and delivery settings. Null means no webhook is configured.
        webhook: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            target:
              T.any(
                ContextDev::MonitorCreateParams::Target::Page,
                ContextDev::MonitorCreateParams::Target::Sitemap,
                ContextDev::MonitorCreateParams::Target::Extract
              ),
            change_detection:
              T.any(
                ContextDev::MonitorCreateParams::ChangeDetection::Exact,
                ContextDev::MonitorCreateParams::ChangeDetection::Semantic
              ),
            mode: ContextDev::MonitorCreateParams::Mode::OrSymbol,
            schedule: ContextDev::MonitorCreateParams::Schedule,
            tags: T::Array[String],
            webhook: T.nilable(ContextDev::MonitorCreateParams::Webhook),
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # What to watch: a page, a sitemap, or data extracted from a site.
      module Target
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::MonitorCreateParams::Target::Page,
              ContextDev::MonitorCreateParams::Target::Sitemap,
              ContextDev::MonitorCreateParams::Target::Extract
            )
          end

        class Page < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::MonitorCreateParams::Target::Page,
                ContextDev::Internal::AnyHash
              )
            end

          # Use `page` to watch one web page.
          sig { returns(Symbol) }
          attr_accessor :type

          # Public HTTP(S) page URL to monitor.
          sig { returns(String) }
          attr_accessor :url

          # Optional browser actions executed in array order after the page loads, before
          # content is captured, on every run. Requires a paid plan. Maximum: 5 actions.
          # Changes create a new baseline.
          sig do
            returns(
              T.nilable(
                T::Array[
                  T.any(
                    ContextDev::MonitorCreateParams::Target::Page::Action::Wait,
                    ContextDev::MonitorCreateParams::Target::Page::Action::Perform,
                    ContextDev::MonitorCreateParams::Target::Page::Action::Scroll
                  )
                ]
              )
            )
          end
          attr_accessor :actions

          # Remove matching regions after inclusions. Changes create a new baseline.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :exclude_selectors

          sig { params(exclude_selectors: T::Array[String]).void }
          attr_writer :exclude_selectors

          # Monitor these CSS-selected regions. Empty or omitted uses main content. Changes
          # create a new baseline.
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
              actions:
                T.nilable(
                  T::Array[
                    T.any(
                      ContextDev::MonitorCreateParams::Target::Page::Action::Wait::OrHash,
                      ContextDev::MonitorCreateParams::Target::Page::Action::Perform::OrHash,
                      ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::OrHash
                    )
                  ]
                ),
              exclude_selectors: T::Array[String],
              include_selectors: T::Array[String],
              instructions: String,
              normalize_whitespace: T::Boolean,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Public HTTP(S) page URL to monitor.
            url:,
            # Optional browser actions executed in array order after the page loads, before
            # content is captured, on every run. Requires a paid plan. Maximum: 5 actions.
            # Changes create a new baseline.
            actions: nil,
            # Remove matching regions after inclusions. Changes create a new baseline.
            exclude_selectors: nil,
            # Monitor these CSS-selected regions. Empty or omitted uses main content. Changes
            # create a new baseline.
            include_selectors: nil,
            # Plain-language goal describing which page changes matter. When provided without
            # change_detection, semantic detection is inferred.
            instructions: nil,
            # Normalize whitespace before comparing or analyzing text.
            normalize_whitespace: nil,
            # Use `page` to watch one web page.
            type: :page
          )
          end

          sig do
            override.returns(
              {
                type: Symbol,
                url: String,
                actions:
                  T.nilable(
                    T::Array[
                      T.any(
                        ContextDev::MonitorCreateParams::Target::Page::Action::Wait,
                        ContextDev::MonitorCreateParams::Target::Page::Action::Perform,
                        ContextDev::MonitorCreateParams::Target::Page::Action::Scroll
                      )
                    ]
                  ),
                exclude_selectors: T::Array[String],
                include_selectors: T::Array[String],
                instructions: String,
                normalize_whitespace: T::Boolean
              }
            )
          end
          def to_hash
          end

          # Browser action discriminated by `do`. Each variant exposes only its applicable
          # fields.
          module Action
            extend ContextDev::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  ContextDev::MonitorCreateParams::Target::Page::Action::Wait,
                  ContextDev::MonitorCreateParams::Target::Page::Action::Perform,
                  ContextDev::MonitorCreateParams::Target::Page::Action::Scroll
                )
              end

            class Wait < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::MonitorCreateParams::Target::Page::Action::Wait,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Use `wait` to pause for a fixed duration.
              sig { returns(Symbol) }
              attr_accessor :do_

              # Time to pause in milliseconds before the next action.
              sig { returns(Integer) }
              attr_accessor :time_ms

              # Pause for a fixed number of milliseconds before continuing to the next action.
              sig do
                params(time_ms: Integer, do_: Symbol).returns(T.attached_class)
              end
              def self.new(
                # Time to pause in milliseconds before the next action.
                time_ms:,
                # Use `wait` to pause for a fixed duration.
                do_: :wait
              )
              end

              sig { override.returns({ do_: Symbol, time_ms: Integer }) }
              def to_hash
              end
            end

            class Perform < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::MonitorCreateParams::Target::Page::Action::Perform,
                    ContextDev::Internal::AnyHash
                  )
                end

              # One browser instruction, such as clicking a button or entering text.
              sig { returns(String) }
              attr_accessor :action

              # Use `perform` for a plain-language browser instruction.
              sig { returns(Symbol) }
              attr_accessor :do_

              # Resolve and perform one natural-language browser action.
              sig do
                params(action: String, do_: Symbol).returns(T.attached_class)
              end
              def self.new(
                # One browser instruction, such as clicking a button or entering text.
                action:,
                # Use `perform` for a plain-language browser instruction.
                do_: :perform
              )
              end

              sig { override.returns({ action: String, do_: Symbol }) }
              def to_hash
              end
            end

            class Scroll < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::MonitorCreateParams::Target::Page::Action::Scroll,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Use `scroll` to move through the page or a container.
              sig { returns(Symbol) }
              attr_accessor :do_

              # Pixels per scroll, one visible viewport, or the current scroll boundary.
              # Defaults to viewport.
              sig do
                returns(
                  T.nilable(
                    T.any(
                      Integer,
                      ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Amount::OrSymbol
                    )
                  )
                )
              end
              attr_reader :amount

              sig do
                params(
                  amount:
                    T.any(
                      Integer,
                      ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Amount::OrSymbol
                    )
                ).void
              end
              attr_writer :amount

              # CSS selector for the first matching scroll container. Defaults to the page.
              sig { returns(T.nilable(String)) }
              attr_reader :container

              sig { params(container: String).void }
              attr_writer :container

              # Direction to scroll. Defaults to down.
              sig do
                returns(
                  T.nilable(
                    ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Direction::OrSymbol
                  )
                )
              end
              attr_reader :direction

              sig do
                params(
                  direction:
                    ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Direction::OrSymbol
                ).void
              end
              attr_writer :direction

              # Maximum scroll iterations. Stops early when scrolling and scrollable extent stop
              # changing. Defaults to 1.
              sig { returns(T.nilable(Integer)) }
              attr_reader :max_scrolls

              sig { params(max_scrolls: Integer).void }
              attr_writer :max_scrolls

              # Scroll the page or a selected scrollable container, waiting adaptively for
              # content and dimensions to settle after each iteration.
              sig do
                params(
                  amount:
                    T.any(
                      Integer,
                      ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Amount::OrSymbol
                    ),
                  container: String,
                  direction:
                    ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Direction::OrSymbol,
                  max_scrolls: Integer,
                  do_: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                # Pixels per scroll, one visible viewport, or the current scroll boundary.
                # Defaults to viewport.
                amount: nil,
                # CSS selector for the first matching scroll container. Defaults to the page.
                container: nil,
                # Direction to scroll. Defaults to down.
                direction: nil,
                # Maximum scroll iterations. Stops early when scrolling and scrollable extent stop
                # changing. Defaults to 1.
                max_scrolls: nil,
                # Use `scroll` to move through the page or a container.
                do_: :scroll
              )
              end

              sig do
                override.returns(
                  {
                    do_: Symbol,
                    amount:
                      T.any(
                        Integer,
                        ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Amount::OrSymbol
                      ),
                    container: String,
                    direction:
                      ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Direction::OrSymbol,
                    max_scrolls: Integer
                  }
                )
              end
              def to_hash
              end

              # Pixels per scroll, one visible viewport, or the current scroll boundary.
              # Defaults to viewport.
              module Amount
                extend ContextDev::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      Integer,
                      ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Amount::TaggedSymbol
                    )
                  end

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Amount::Variants
                    ]
                  )
                end
                def self.variants
                end

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Amount
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                VIEWPORT =
                  T.let(
                    :viewport,
                    ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Amount::TaggedSymbol
                  )
                MAX =
                  T.let(
                    :max,
                    ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Amount::TaggedSymbol
                  )
              end

              # Direction to scroll. Defaults to down.
              module Direction
                extend ContextDev::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Direction
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                UP =
                  T.let(
                    :up,
                    ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Direction::TaggedSymbol
                  )
                DOWN =
                  T.let(
                    :down,
                    ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Direction::TaggedSymbol
                  )
                LEFT =
                  T.let(
                    :left,
                    ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Direction::TaggedSymbol
                  )
                RIGHT =
                  T.let(
                    :right,
                    ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Direction::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::MonitorCreateParams::Target::Page::Action::Scroll::Direction::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            sig do
              override.returns(
                T::Array[
                  ContextDev::MonitorCreateParams::Target::Page::Action::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end

        class Sitemap < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::MonitorCreateParams::Target::Sitemap,
                ContextDev::Internal::AnyHash
              )
            end

          # Use `sitemap` to watch a site for added or removed URLs.
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

          # Watch a site’s URL inventory for confirmed additions and removals.
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
            # Use `sitemap` to watch a site for added or removed URLs.
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
                ContextDev::MonitorCreateParams::Target::Extract,
                ContextDev::Internal::AnyHash
              )
            end

          # Natural-language instructions guiding which pages and facts to track and which
          # changes to report.
          sig { returns(String) }
          attr_accessor :instructions

          # Use `extract` to watch structured data across selected pages.
          sig { returns(Symbol) }
          attr_accessor :type

          # Root URL to extract structured data from.
          sig { returns(String) }
          attr_accessor :url

          # Allow page discovery on subdomains of the target site.
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

          # JSON Schema for page selection and the baseline snapshot. Changes return diffs
          # and evidence.
          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_reader :schema

          sig { params(schema: T::Hash[Symbol, T.anything]).void }
          attr_writer :schema

          # Track relevant pages selected by `schema` and `instructions`; refresh the page
          # set periodically.
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
            # Allow page discovery on subdomains of the target site.
            follow_subdomains: nil,
            # Optional maximum link depth from the starting URL (0 = only the starting page).
            max_depth: nil,
            # Maximum number of pages to track.
            max_pages: nil,
            # JSON Schema for page selection and the baseline snapshot. Changes return diffs
            # and evidence.
            schema: nil,
            # Use `extract` to watch structured data across selected pages.
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
            T::Array[ContextDev::MonitorCreateParams::Target::Variants]
          )
        end
        def self.variants
        end
      end

      # How changes are judged. Defaults to `semantic` for extract targets and page
      # targets with `instructions`, otherwise `exact`.
      module ChangeDetection
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::MonitorCreateParams::ChangeDetection::Exact,
              ContextDev::MonitorCreateParams::ChangeDetection::Semantic
            )
          end

        class Exact < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::MonitorCreateParams::ChangeDetection::Exact,
                ContextDev::Internal::AnyHash
              )
            end

          # Use `exact` to compare visible text or sitemap URLs.
          sig { returns(Symbol) }
          attr_accessor :type

          # Detect exact changes. For page targets, this means visible text diffs. For
          # sitemap targets, this means URL additions and removals.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(
            # Use `exact` to compare visible text or sitemap URLs.
            type: :exact
          )
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end

        class Semantic < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::MonitorCreateParams::ChangeDetection::Semantic,
                ContextDev::Internal::AnyHash
              )
            end

          # Use `semantic` to judge changes against the target instructions.
          sig { returns(Symbol) }
          attr_accessor :type

          # Minimum confidence required to report a meaningful change, from 0 to 1.
          sig { returns(T.nilable(Float)) }
          attr_reader :confidence_threshold

          sig { params(confidence_threshold: Float).void }
          attr_writer :confidence_threshold

          # Detect meaningful content changes using the target’s instructions and optional
          # schema.
          sig do
            params(confidence_threshold: Float, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # Minimum confidence required to report a meaningful change, from 0 to 1.
            confidence_threshold: nil,
            # Use `semantic` to judge changes against the target instructions.
            type: :semantic
          )
          end

          sig do
            override.returns({ type: Symbol, confidence_threshold: Float })
          end
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[ContextDev::MonitorCreateParams::ChangeDetection::Variants]
          )
        end
        def self.variants
        end
      end

      # Always `web`. Optional.
      module Mode
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::MonitorCreateParams::Mode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WEB = T.let(:web, ContextDev::MonitorCreateParams::Mode::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::MonitorCreateParams::Mode::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Schedule < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::MonitorCreateParams::Schedule,
              ContextDev::Internal::AnyHash
            )
          end

        # Number of units between runs. The resulting interval (frequency × unit) must be
        # at least 10 minutes and at most 1 year (e.g. minimum 10 when unit is minutes;
        # maximum 365 when unit is days).
        sig { returns(Integer) }
        attr_accessor :frequency

        # Use `interval` to run on a repeating schedule.
        sig do
          returns(ContextDev::MonitorCreateParams::Schedule::Type::OrSymbol)
        end
        attr_accessor :type

        # Time unit used with `frequency` to set the run interval.
        sig do
          returns(ContextDev::MonitorCreateParams::Schedule::Unit::OrSymbol)
        end
        attr_accessor :unit

        # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        # every 6 hours or every 2 days. The total interval (frequency × unit) must be
        # between 10 minutes and 1 year.
        sig do
          params(
            frequency: Integer,
            type: ContextDev::MonitorCreateParams::Schedule::Type::OrSymbol,
            unit: ContextDev::MonitorCreateParams::Schedule::Unit::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of units between runs. The resulting interval (frequency × unit) must be
          # at least 10 minutes and at most 1 year (e.g. minimum 10 when unit is minutes;
          # maximum 365 when unit is days).
          frequency:,
          # Use `interval` to run on a repeating schedule.
          type:,
          # Time unit used with `frequency` to set the run interval.
          unit:
        )
        end

        sig do
          override.returns(
            {
              frequency: Integer,
              type: ContextDev::MonitorCreateParams::Schedule::Type::OrSymbol,
              unit: ContextDev::MonitorCreateParams::Schedule::Unit::OrSymbol
            }
          )
        end
        def to_hash
        end

        # Use `interval` to run on a repeating schedule.
        module Type
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::MonitorCreateParams::Schedule::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INTERVAL =
            T.let(
              :interval,
              ContextDev::MonitorCreateParams::Schedule::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::MonitorCreateParams::Schedule::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Time unit used with `frequency` to set the run interval.
        module Unit
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::MonitorCreateParams::Schedule::Unit)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MINUTES =
            T.let(
              :minutes,
              ContextDev::MonitorCreateParams::Schedule::Unit::TaggedSymbol
            )
          HOURS =
            T.let(
              :hours,
              ContextDev::MonitorCreateParams::Schedule::Unit::TaggedSymbol
            )
          DAYS =
            T.let(
              :days,
              ContextDev::MonitorCreateParams::Schedule::Unit::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::MonitorCreateParams::Schedule::Unit::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Webhook < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::MonitorCreateParams::Webhook,
              ContextDev::Internal::AnyHash
            )
          end

        # Public HTTP(S) URL that receives events. Slack and GovSlack URLs get formatted
        # messages.
        sig { returns(String) }
        attr_accessor :url

        # Events to deliver. Defaults to `change.detected`; `run.completed` also includes
        # unchanged runs.
        sig do
          returns(
            T.nilable(
              T::Array[
                ContextDev::MonitorCreateParams::Webhook::Event::OrSymbol
              ]
            )
          )
        end
        attr_reader :events

        sig do
          params(
            events:
              T::Array[
                ContextDev::MonitorCreateParams::Webhook::Event::OrSymbol
              ]
          ).void
        end
        attr_writer :events

        # Webhook retry settings. Use {} for the default schedule.
        sig { returns(T.nilable(ContextDev::RetryConfig)) }
        attr_reader :retry_

        sig { params(retry_: ContextDev::RetryConfig::OrHash).void }
        attr_writer :retry_

        # Webhook destination and delivery settings. Null means no webhook is configured.
        sig do
          params(
            url: String,
            events:
              T::Array[
                ContextDev::MonitorCreateParams::Webhook::Event::OrSymbol
              ],
            retry_: ContextDev::RetryConfig::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Public HTTP(S) URL that receives events. Slack and GovSlack URLs get formatted
          # messages.
          url:,
          # Events to deliver. Defaults to `change.detected`; `run.completed` also includes
          # unchanged runs.
          events: nil,
          # Webhook retry settings. Use {} for the default schedule.
          retry_: nil
        )
        end

        sig do
          override.returns(
            {
              url: String,
              events:
                T::Array[
                  ContextDev::MonitorCreateParams::Webhook::Event::OrSymbol
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
              T.all(Symbol, ContextDev::MonitorCreateParams::Webhook::Event)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CHANGE_DETECTED =
            T.let(
              :"change.detected",
              ContextDev::MonitorCreateParams::Webhook::Event::TaggedSymbol
            )
          RUN_COMPLETED =
            T.let(
              :"run.completed",
              ContextDev::MonitorCreateParams::Webhook::Event::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::MonitorCreateParams::Webhook::Event::TaggedSymbol
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
