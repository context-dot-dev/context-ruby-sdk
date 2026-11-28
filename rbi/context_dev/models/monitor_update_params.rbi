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

      # ID of the monitor.
      sig { returns(String) }
      attr_accessor :monitor_id

      # How changes are judged. Defaults to `semantic` for extract and search targets
      # and for page targets with `instructions`; otherwise `exact`. Sitemap targets
      # support only `exact`, and extract targets only `semantic`.
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

      # Display name for the monitor.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Access policy IDs to apply to every run, or an empty list to remove them.
      # Requires access policies enabled for your organization; otherwise returns
      # `ACCESS_POLICIES_NOT_ENABLED`.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :policies

      sig { params(policies: T::Array[String]).void }
      attr_writer :policies

      # Run the monitor at a fixed interval, such as every 6 hours or every 2 days. The
      # interval must be between 10 minutes and 1 year.
      sig { returns(T.nilable(ContextDev::MonitorUpdateParams::Schedule)) }
      attr_reader :schedule

      sig do
        params(schedule: ContextDev::MonitorUpdateParams::Schedule::OrHash).void
      end
      attr_writer :schedule

      # Set `paused` to stop scheduled runs or `active` to resume them. A resumed
      # monitor runs promptly instead of waiting a full interval.
      sig do
        returns(T.nilable(ContextDev::MonitorUpdateParams::Status::OrSymbol))
      end
      attr_reader :status

      sig do
        params(status: ContextDev::MonitorUpdateParams::Status::OrSymbol).void
      end
      attr_writer :status

      # Labels for grouping monitors. Filter monitors, changes, and credit usage by tag.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # What to watch: a page, a sitemap, data extracted from a site, or web search
      # results.
      sig do
        returns(
          T.nilable(
            T.any(
              ContextDev::MonitorUpdateParams::Target::Page,
              ContextDev::MonitorUpdateParams::Target::Sitemap,
              ContextDev::MonitorUpdateParams::Target::Extract,
              ContextDev::MonitorUpdateParams::Target::Search
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
              ContextDev::MonitorUpdateParams::Target::Extract::OrHash,
              ContextDev::MonitorUpdateParams::Target::Search::OrHash
            )
        ).void
      end
      attr_writer :target

      # Set to `null` to remove the webhook. Changing `url` generates a new secret.
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
          policies: T::Array[String],
          schedule: ContextDev::MonitorUpdateParams::Schedule::OrHash,
          status: ContextDev::MonitorUpdateParams::Status::OrSymbol,
          tags: T::Array[String],
          target:
            T.any(
              ContextDev::MonitorUpdateParams::Target::Page::OrHash,
              ContextDev::MonitorUpdateParams::Target::Sitemap::OrHash,
              ContextDev::MonitorUpdateParams::Target::Extract::OrHash,
              ContextDev::MonitorUpdateParams::Target::Search::OrHash
            ),
          webhook: T.nilable(ContextDev::MonitorUpdateParams::Webhook::OrHash),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the monitor.
        monitor_id:,
        # How changes are judged. Defaults to `semantic` for extract and search targets
        # and for page targets with `instructions`; otherwise `exact`. Sitemap targets
        # support only `exact`, and extract targets only `semantic`.
        change_detection: nil,
        # Display name for the monitor.
        name: nil,
        # Access policy IDs to apply to every run, or an empty list to remove them.
        # Requires access policies enabled for your organization; otherwise returns
        # `ACCESS_POLICIES_NOT_ENABLED`.
        policies: nil,
        # Run the monitor at a fixed interval, such as every 6 hours or every 2 days. The
        # interval must be between 10 minutes and 1 year.
        schedule: nil,
        # Set `paused` to stop scheduled runs or `active` to resume them. A resumed
        # monitor runs promptly instead of waiting a full interval.
        status: nil,
        # Labels for grouping monitors. Filter monitors, changes, and credit usage by tag.
        tags: nil,
        # What to watch: a page, a sitemap, data extracted from a site, or web search
        # results.
        target: nil,
        # Set to `null` to remove the webhook. Changing `url` generates a new secret.
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
            policies: T::Array[String],
            schedule: ContextDev::MonitorUpdateParams::Schedule,
            status: ContextDev::MonitorUpdateParams::Status::OrSymbol,
            tags: T::Array[String],
            target:
              T.any(
                ContextDev::MonitorUpdateParams::Target::Page,
                ContextDev::MonitorUpdateParams::Target::Sitemap,
                ContextDev::MonitorUpdateParams::Target::Extract,
                ContextDev::MonitorUpdateParams::Target::Search
              ),
            webhook: T.nilable(ContextDev::MonitorUpdateParams::Webhook),
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # How changes are judged. Defaults to `semantic` for extract and search targets
      # and for page targets with `instructions`; otherwise `exact`. Sitemap targets
      # support only `exact`, and extract targets only `semantic`.
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

          # Use `exact` to compare visible text, sitemap URLs, or search results.
          sig { returns(Symbol) }
          attr_accessor :type

          # Report every change: visible-text diffs for pages, added or removed URLs for
          # sitemaps, and every new result for searches.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(
            # Use `exact` to compare visible text, sitemap URLs, or search results.
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
                ContextDev::MonitorUpdateParams::ChangeDetection::Semantic,
                ContextDev::Internal::AnyHash
              )
            end

          # Use `semantic` to report only changes that match the target's `instructions`.
          sig { returns(Symbol) }
          attr_accessor :type

          # Minimum confidence a change needs to be reported. Higher values mean fewer, more
          # certain alerts.
          sig { returns(T.nilable(Float)) }
          attr_reader :confidence_threshold

          sig { params(confidence_threshold: Float).void }
          attr_writer :confidence_threshold

          # Report only changes that matter, judged against the target's `instructions` and,
          # for extract targets, its `schema`.
          sig do
            params(confidence_threshold: Float, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # Minimum confidence a change needs to be reported. Higher values mean fewer, more
            # certain alerts.
            confidence_threshold: nil,
            # Use `semantic` to report only changes that match the target's `instructions`.
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

        # Number of `unit` periods between runs. The interval must be between 10 minutes
        # and 1 year, so at least `10` with `minutes` and at most `365` with `days`.
        sig { returns(Integer) }
        attr_accessor :frequency

        # Use `interval` to run on a repeating schedule.
        sig do
          returns(ContextDev::MonitorUpdateParams::Schedule::Type::OrSymbol)
        end
        attr_accessor :type

        # Time unit for `frequency`.
        sig do
          returns(ContextDev::MonitorUpdateParams::Schedule::Unit::OrSymbol)
        end
        attr_accessor :unit

        # Run the monitor at a fixed interval, such as every 6 hours or every 2 days. The
        # interval must be between 10 minutes and 1 year.
        sig do
          params(
            frequency: Integer,
            type: ContextDev::MonitorUpdateParams::Schedule::Type::OrSymbol,
            unit: ContextDev::MonitorUpdateParams::Schedule::Unit::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of `unit` periods between runs. The interval must be between 10 minutes
          # and 1 year, so at least `10` with `minutes` and at most `365` with `days`.
          frequency:,
          # Use `interval` to run on a repeating schedule.
          type:,
          # Time unit for `frequency`.
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

        # Use `interval` to run on a repeating schedule.
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

        # Time unit for `frequency`.
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

      # Set `paused` to stop scheduled runs or `active` to resume them. A resumed
      # monitor runs promptly instead of waiting a full interval.
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

      # What to watch: a page, a sitemap, data extracted from a site, or web search
      # results.
      module Target
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::MonitorUpdateParams::Target::Page,
              ContextDev::MonitorUpdateParams::Target::Sitemap,
              ContextDev::MonitorUpdateParams::Target::Extract,
              ContextDev::MonitorUpdateParams::Target::Search
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

          # Use `page` to watch one web page.
          sig { returns(Symbol) }
          attr_accessor :type

          # Public HTTP(S) URL of the page to watch.
          sig { returns(String) }
          attr_accessor :url

          # Browser actions to run in order after the page loads and before each capture.
          # Requires a paid plan. Changing it resets the baseline.
          sig do
            returns(
              T.nilable(
                T::Array[
                  T.any(
                    ContextDev::MonitorUpdateParams::Target::Page::Action::Wait,
                    ContextDev::MonitorUpdateParams::Target::Page::Action::Perform,
                    ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll
                  )
                ]
              )
            )
          end
          attr_accessor :actions

          # CSS selectors for regions to ignore, applied after `include_selectors`. Changing
          # it resets the baseline.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :exclude_selectors

          sig { params(exclude_selectors: T::Array[String]).void }
          attr_writer :exclude_selectors

          # CSS selectors for the regions to watch. Omit or leave empty to watch the main
          # content. Changing it resets the baseline.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :include_selectors

          sig { params(include_selectors: T::Array[String]).void }
          attr_writer :include_selectors

          # Plain-language description of the changes that matter. Requires `semantic`
          # detection, which is selected when `change_detection` is omitted.
          sig { returns(T.nilable(String)) }
          attr_reader :instructions

          sig { params(instructions: String).void }
          attr_writer :instructions

          # Collapse whitespace before comparing text, so spacing-only edits are not
          # reported.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :normalize_whitespace

          sig { params(normalize_whitespace: T::Boolean).void }
          attr_writer :normalize_whitespace

          # Watch one web page. `exact` detection reports any change to the visible text;
          # `semantic` detection reports only confirmed changes that match `instructions`.
          sig do
            params(
              url: String,
              actions:
                T.nilable(
                  T::Array[
                    T.any(
                      ContextDev::MonitorUpdateParams::Target::Page::Action::Wait::OrHash,
                      ContextDev::MonitorUpdateParams::Target::Page::Action::Perform::OrHash,
                      ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::OrHash
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
            # Public HTTP(S) URL of the page to watch.
            url:,
            # Browser actions to run in order after the page loads and before each capture.
            # Requires a paid plan. Changing it resets the baseline.
            actions: nil,
            # CSS selectors for regions to ignore, applied after `include_selectors`. Changing
            # it resets the baseline.
            exclude_selectors: nil,
            # CSS selectors for the regions to watch. Omit or leave empty to watch the main
            # content. Changing it resets the baseline.
            include_selectors: nil,
            # Plain-language description of the changes that matter. Requires `semantic`
            # detection, which is selected when `change_detection` is omitted.
            instructions: nil,
            # Collapse whitespace before comparing text, so spacing-only edits are not
            # reported.
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
                        ContextDev::MonitorUpdateParams::Target::Page::Action::Wait,
                        ContextDev::MonitorUpdateParams::Target::Page::Action::Perform,
                        ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll
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

          # One browser action. `do` selects the type: `wait`, `perform`, or `scroll`.
          module Action
            extend ContextDev::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  ContextDev::MonitorUpdateParams::Target::Page::Action::Wait,
                  ContextDev::MonitorUpdateParams::Target::Page::Action::Perform,
                  ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll
                )
              end

            class Wait < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::MonitorUpdateParams::Target::Page::Action::Wait,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Use `wait` to pause for a fixed duration.
              sig { returns(Symbol) }
              attr_accessor :do_

              # Time to pause in milliseconds before the next action.
              sig { returns(Integer) }
              attr_accessor :time_ms

              # Pause for a fixed time before the next action.
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
                    ContextDev::MonitorUpdateParams::Target::Page::Action::Perform,
                    ContextDev::Internal::AnyHash
                  )
                end

              # One browser instruction, such as clicking a button or entering text.
              sig { returns(String) }
              attr_accessor :action

              # Use `perform` for a plain-language browser instruction.
              sig { returns(Symbol) }
              attr_accessor :do_

              # Perform one browser instruction written in plain language.
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
                    ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Use `scroll` to move through the page or a container.
              sig { returns(Symbol) }
              attr_accessor :do_

              # Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
              sig do
                returns(
                  T.nilable(
                    T.any(
                      Integer,
                      ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Amount::OrSymbol
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
                      ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Amount::OrSymbol
                    )
                ).void
              end
              attr_writer :amount

              # Scroll the first container matching this CSS selector. Omit to scroll the page.
              sig { returns(T.nilable(String)) }
              attr_reader :container

              sig { params(container: String).void }
              attr_writer :container

              # Direction to scroll.
              sig do
                returns(
                  T.nilable(
                    ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Direction::OrSymbol
                  )
                )
              end
              attr_reader :direction

              sig do
                params(
                  direction:
                    ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Direction::OrSymbol
                ).void
              end
              attr_writer :direction

              # Maximum number of scroll steps. Stops early when the page stops changing.
              sig { returns(T.nilable(Integer)) }
              attr_reader :max_scrolls

              sig { params(max_scrolls: Integer).void }
              attr_writer :max_scrolls

              # Scroll the page or a scrollable container. Waits for new content to settle after
              # each scroll.
              sig do
                params(
                  amount:
                    T.any(
                      Integer,
                      ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Amount::OrSymbol
                    ),
                  container: String,
                  direction:
                    ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Direction::OrSymbol,
                  max_scrolls: Integer,
                  do_: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                # Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
                amount: nil,
                # Scroll the first container matching this CSS selector. Omit to scroll the page.
                container: nil,
                # Direction to scroll.
                direction: nil,
                # Maximum number of scroll steps. Stops early when the page stops changing.
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
                        ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Amount::OrSymbol
                      ),
                    container: String,
                    direction:
                      ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Direction::OrSymbol,
                    max_scrolls: Integer
                  }
                )
              end
              def to_hash
              end

              # Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
              module Amount
                extend ContextDev::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      Integer,
                      ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Amount::TaggedSymbol
                    )
                  end

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Amount::Variants
                    ]
                  )
                end
                def self.variants
                end

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Amount
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                VIEWPORT =
                  T.let(
                    :viewport,
                    ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Amount::TaggedSymbol
                  )
                MAX =
                  T.let(
                    :max,
                    ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Amount::TaggedSymbol
                  )
              end

              # Direction to scroll.
              module Direction
                extend ContextDev::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Direction
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                UP =
                  T.let(
                    :up,
                    ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Direction::TaggedSymbol
                  )
                DOWN =
                  T.let(
                    :down,
                    ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Direction::TaggedSymbol
                  )
                LEFT =
                  T.let(
                    :left,
                    ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Direction::TaggedSymbol
                  )
                RIGHT =
                  T.let(
                    :right,
                    ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Direction::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::MonitorUpdateParams::Target::Page::Action::Scroll::Direction::TaggedSymbol
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
                  ContextDev::MonitorUpdateParams::Target::Page::Action::Variants
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
                ContextDev::MonitorUpdateParams::Target::Sitemap,
                ContextDev::Internal::AnyHash
              )
            end

          # Use `sitemap` to watch a site for added or removed URLs.
          sig { returns(Symbol) }
          attr_accessor :type

          # Public HTTP(S) URL of the sitemap to watch.
          sig { returns(String) }
          attr_accessor :url

          # Path patterns of URLs to ignore, such as `/legal/*`.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :exclude

          sig { params(exclude: T::Array[String]).void }
          attr_writer :exclude

          # Path patterns of URLs to track, such as `/blog/*`.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :include

          sig { params(include: T::Array[String]).void }
          attr_writer :include

          # Maximum number of URLs to track.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_urls

          sig { params(max_urls: Integer).void }
          attr_writer :max_urls

          # Watch a sitemap and report URLs that are added or removed.
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
            # Public HTTP(S) URL of the sitemap to watch.
            url:,
            # Path patterns of URLs to ignore, such as `/legal/*`.
            exclude: nil,
            # Path patterns of URLs to track, such as `/blog/*`.
            include: nil,
            # Maximum number of URLs to track.
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
                ContextDev::MonitorUpdateParams::Target::Extract,
                ContextDev::Internal::AnyHash
              )
            end

          # Plain-language description of the pages and facts to track and the changes to
          # report.
          sig { returns(String) }
          attr_accessor :instructions

          # Use `extract` to watch structured data across selected pages.
          sig { returns(Symbol) }
          attr_accessor :type

          # Public HTTP(S) URL where page discovery starts, usually the site home page.
          sig { returns(String) }
          attr_accessor :url

          # Also discover pages on subdomains of the site.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :follow_subdomains

          sig { params(follow_subdomains: T::Boolean).void }
          attr_writer :follow_subdomains

          # Maximum link depth from `url`. `0` tracks only the starting page.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_depth

          sig { params(max_depth: Integer).void }
          attr_writer :max_depth

          # Maximum number of pages to track.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_pages

          sig { params(max_pages: Integer).void }
          attr_writer :max_pages

          # JSON Schema for the data to extract, up to 20,000 characters; it also guides
          # which pages are tracked. Defaults to a `summary` string and a `key_points` list.
          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_reader :schema

          sig { params(schema: T::Hash[Symbol, T.anything]).void }
          attr_writer :schema

          # Extract structured data from the most relevant pages of a site and report
          # meaningful changes. Pages are chosen from `schema` and `instructions`, and the
          # page set is refreshed periodically.
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
            # Plain-language description of the pages and facts to track and the changes to
            # report.
            instructions:,
            # Public HTTP(S) URL where page discovery starts, usually the site home page.
            url:,
            # Also discover pages on subdomains of the site.
            follow_subdomains: nil,
            # Maximum link depth from `url`. `0` tracks only the starting page.
            max_depth: nil,
            # Maximum number of pages to track.
            max_pages: nil,
            # JSON Schema for the data to extract, up to 20,000 characters; it also guides
            # which pages are tracked. Defaults to a `summary` string and a `key_points` list.
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

        class Search < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::MonitorUpdateParams::Target::Search,
                ContextDev::Internal::AnyHash
              )
            end

          # Web search query to run on every check. Supports `site:`, `-site:`, and quoted
          # phrases.
          sig { returns(String) }
          attr_accessor :query

          # Use `search` to watch the web for new results about a topic.
          sig { returns(Symbol) }
          attr_accessor :type

          # Plain-language description of the new results that matter. Defaults to `query`.
          # Not allowed with `exact` detection.
          sig { returns(T.nilable(String)) }
          attr_reader :instructions

          sig { params(instructions: String).void }
          attr_writer :instructions

          # Search the web on every run and report results not seen before, listed in the
          # change's `matched_urls` and `evidence`. `semantic` detection reports only
          # results about a new development that matches `instructions`; `exact` detection
          # reports every new result.
          sig do
            params(query: String, instructions: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # Web search query to run on every check. Supports `site:`, `-site:`, and quoted
            # phrases.
            query:,
            # Plain-language description of the new results that matter. Defaults to `query`.
            # Not allowed with `exact` detection.
            instructions: nil,
            # Use `search` to watch the web for new results about a topic.
            type: :search
          )
          end

          sig do
            override.returns(
              { query: String, type: Symbol, instructions: String }
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

        # Public HTTP(S) URL that receives events. Slack and GovSlack webhook URLs get
        # formatted messages.
        sig { returns(String) }
        attr_accessor :url

        # Events to send. Defaults to `change.detected`. Add `run.completed` to get a
        # delivery after every completed run, including runs with no change.
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

        # Automatic retry settings. Pass `{}` for the default schedule.
        sig { returns(T.nilable(ContextDev::RetryConfig)) }
        attr_reader :retry_

        sig { params(retry_: ContextDev::RetryConfig::OrHash).void }
        attr_writer :retry_

        # Set to `null` to remove the webhook. Changing `url` generates a new secret.
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
          # Public HTTP(S) URL that receives events. Slack and GovSlack webhook URLs get
          # formatted messages.
          url:,
          # Events to send. Defaults to `change.detected`. Add `run.completed` to get a
          # delivery after every completed run, including runs with no change.
          events: nil,
          # Automatic retry settings. Pass `{}` for the default schedule.
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
