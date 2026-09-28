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

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Credits this request used and your remaining balance.
      sig do
        returns(T.nilable(ContextDev::Models::MonitorListResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::MonitorListResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          data: T::Array[ContextDev::Models::MonitorListResponse::Data::OrHash],
          has_more: T::Boolean,
          next_cursor: T.nilable(String),
          request_id: String,
          key_metadata:
            ContextDev::Models::MonitorListResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        data:,
        has_more:,
        next_cursor:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Credits this request used and your remaining balance.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            data: T::Array[ContextDev::Models::MonitorListResponse::Data],
            has_more: T::Boolean,
            next_cursor: T.nilable(String),
            request_id: String,
            key_metadata: ContextDev::Models::MonitorListResponse::KeyMetadata
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

        # How changes are judged. Defaults to `semantic` for extract targets and page
        # targets with `instructions`, otherwise `exact`.
        sig do
          returns(
            ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Variants
          )
        end
        attr_accessor :change_detection

        sig { returns(Time) }
        attr_accessor :created_at

        # Always `web`. Optional.
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

        # Current state. Failed monitors keep running; paused monitors must be resumed
        # with `status: "active"`.
        sig do
          returns(
            ContextDev::Models::MonitorListResponse::Data::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # What to watch: a page, a sitemap, or data extracted from a site.
        sig do
          returns(
            ContextDev::Models::MonitorListResponse::Data::Target::Variants
          )
        end
        attr_accessor :target

        sig { returns(Time) }
        attr_accessor :updated_at

        # Comparison baseline, included on Retrieve. Null until capture completes or after
        # target changes.
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

        # When the next scheduled run is due; null while paused.
        sig { returns(T.nilable(Time)) }
        attr_accessor :next_run_at

        # Labels for filtering monitors, their changes, and their usage.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :tags

        sig { params(tags: T::Array[String]).void }
        attr_writer :tags

        # Webhook destination and delivery settings. Null means no webhook is configured.
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
          # How changes are judged. Defaults to `semantic` for extract targets and page
          # targets with `instructions`, otherwise `exact`.
          change_detection:,
          created_at:,
          # Always `web`. Optional.
          mode:,
          name:,
          # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          # every 6 hours or every 2 days. The total interval (frequency × unit) must be
          # between 10 minutes and 1 year.
          schedule:,
          # Current state. Failed monitors keep running; paused monitors must be resumed
          # with `status: "active"`.
          status:,
          # What to watch: a page, a sitemap, or data extracted from a site.
          target:,
          updated_at:,
          # Comparison baseline, included on Retrieve. Null until capture completes or after
          # target changes.
          baseline: nil,
          last_change_at: nil,
          # Error from the most recent failed run; null when the last run succeeded.
          last_error: nil,
          last_run_at: nil,
          # When the next scheduled run is due; null while paused.
          next_run_at: nil,
          # Labels for filtering monitors, their changes, and their usage.
          tags: nil,
          # Webhook destination and delivery settings. Null means no webhook is configured.
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

        # How changes are judged. Defaults to `semantic` for extract targets and page
        # targets with `instructions`, otherwise `exact`.
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
                  ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Semantic,
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
              T::Array[
                ContextDev::Models::MonitorListResponse::Data::ChangeDetection::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # Always `web`. Optional.
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

          # Use `interval` to run on a repeating schedule.
          sig do
            returns(
              ContextDev::Models::MonitorListResponse::Data::Schedule::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Time unit used with `frequency` to set the run interval.
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
                type:
                  ContextDev::Models::MonitorListResponse::Data::Schedule::Type::TaggedSymbol,
                unit:
                  ContextDev::Models::MonitorListResponse::Data::Schedule::Unit::TaggedSymbol
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

          # Time unit used with `frequency` to set the run interval.
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

        # Current state. Failed monitors keep running; paused monitors must be resumed
        # with `status: "active"`.
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

        # What to watch: a page, a sitemap, or data extracted from a site.
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
                    ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Variants
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
                        ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Wait::OrHash,
                        ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Perform::OrHash,
                        ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::OrHash
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
                        ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Variants
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
                    ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Wait,
                    ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Perform,
                    ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll
                  )
                end

              class Wait < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Wait,
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
                  params(time_ms: Integer, do_: Symbol).returns(
                    T.attached_class
                  )
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
                      ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Perform,
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
                      ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll,
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
                      ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Amount::Variants
                    )
                  )
                end
                attr_reader :amount

                sig do
                  params(
                    amount:
                      T.any(
                        Integer,
                        ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Amount::OrSymbol
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
                      ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Direction::TaggedSymbol
                    )
                  )
                end
                attr_reader :direction

                sig do
                  params(
                    direction:
                      ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Direction::OrSymbol
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
                        ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Amount::OrSymbol
                      ),
                    container: String,
                    direction:
                      ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Direction::OrSymbol,
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
                        ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Amount::Variants,
                      container: String,
                      direction:
                        ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Direction::TaggedSymbol,
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
                        ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Amount::TaggedSymbol
                      )
                    end

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Amount::Variants
                      ]
                    )
                  end
                  def self.variants
                  end

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Amount
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  VIEWPORT =
                    T.let(
                      :viewport,
                      ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Amount::TaggedSymbol
                    )
                  MAX =
                    T.let(
                      :max,
                      ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Amount::TaggedSymbol
                    )
                end

                # Direction to scroll. Defaults to down.
                module Direction
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Direction
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  UP =
                    T.let(
                      :up,
                      ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Direction::TaggedSymbol
                    )
                  DOWN =
                    T.let(
                      :down,
                      ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Direction::TaggedSymbol
                    )
                  LEFT =
                    T.let(
                      :left,
                      ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Direction::TaggedSymbol
                    )
                  RIGHT =
                    T.let(
                      :right,
                      ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Direction::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Scroll::Direction::TaggedSymbol
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
                    ContextDev::Models::MonitorListResponse::Data::Target::Page::Action::Variants
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
                  ContextDev::Models::MonitorListResponse::Data::Target::Sitemap,
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
                  ContextDev::Models::MonitorListResponse::Data::Target::Extract,
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
              T::Array[
                ContextDev::Models::MonitorListResponse::Data::Target::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # Comparison baseline, included on Retrieve. Null until capture completes or after
        # target changes.
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

            # Latest structured snapshot matching the extraction schema, refreshed at most
            # daily; `null` before capture.
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
              # Latest structured snapshot matching the extraction schema, refreshed at most
              # daily; `null` before capture.
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

          # API-generated signing secret. Visible only with full access or `monitors:write`
          # permission.
          sig { returns(T.nilable(String)) }
          attr_reader :secret

          sig { params(secret: String).void }
          attr_writer :secret

          # Webhook destination and delivery settings. Null means no webhook is configured.
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
            # Public HTTP(S) URL that receives events. Slack and GovSlack URLs get formatted
            # messages.
            url:,
            # Events to deliver. Defaults to `change.detected`; `run.completed` also includes
            # unchanged runs.
            events: nil,
            # Webhook retry settings. Use {} for the default schedule.
            retry_: nil,
            # API-generated signing secret. Visible only with full access or `monitors:write`
            # permission.
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

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorListResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits remaining for your organization.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Credits this request used and your remaining balance.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Credits charged for this request.
          credits_consumed:,
          # Credits remaining for your organization.
          credits_remaining:
        )
        end

        sig do
          override.returns(
            { credits_consumed: Integer, credits_remaining: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
