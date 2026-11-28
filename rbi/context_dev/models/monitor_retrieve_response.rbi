# typed: strong

module ContextDev
  module Models
    class MonitorRetrieveResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::MonitorRetrieveResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Unique ID of the monitor.
      sig { returns(String) }
      attr_accessor :id

      # How changes are judged. Defaults to `semantic` for extract and search targets
      # and for page targets with `instructions`; otherwise `exact`. Sitemap targets
      # support only `exact`, and extract targets only `semantic`.
      sig do
        returns(
          ContextDev::Models::MonitorRetrieveResponse::ChangeDetection::Variants
        )
      end
      attr_accessor :change_detection

      # When the monitor was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # Monitor category. Always `web`.
      sig do
        returns(ContextDev::Models::MonitorRetrieveResponse::Mode::TaggedSymbol)
      end
      attr_accessor :mode

      # Display name of the monitor.
      sig { returns(String) }
      attr_accessor :name

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # `active` monitors run on schedule. `failed` monitors keep running after a failed
      # run and return to `active` on the next success. `paused` monitors don't run
      # until you set `status` to `active`; Context.dev also pauses monitors after
      # repeated failures or credit shortfalls.
      sig do
        returns(
          ContextDev::Models::MonitorRetrieveResponse::Status::TaggedSymbol
        )
      end
      attr_accessor :status

      # What to watch: a page, a sitemap, data extracted from a site, or web search
      # results.
      sig do
        returns(ContextDev::Models::MonitorRetrieveResponse::Target::Variants)
      end
      attr_accessor :target

      # When the monitor was last updated.
      sig { returns(Time) }
      attr_accessor :updated_at

      # What the next run compares against. Returned only by
      # `GET /monitors/{monitor_id}`; `null` until the first capture finishes or after
      # the target changes.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::MonitorRetrieveResponse::Baseline::Variants
          )
        )
      end
      attr_accessor :baseline

      # Credits this request used and your remaining balance.
      sig do
        returns(
          T.nilable(ContextDev::Models::MonitorRetrieveResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::MonitorRetrieveResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # When the monitor last detected a change. `null` until it detects one.
      sig { returns(T.nilable(Time)) }
      attr_accessor :last_change_at

      # Error from the most recent failed run. `null` when the last run succeeded.
      sig do
        returns(
          T.nilable(ContextDev::Models::MonitorRetrieveResponse::LastError)
        )
      end
      attr_reader :last_error

      sig do
        params(
          last_error:
            T.nilable(
              ContextDev::Models::MonitorRetrieveResponse::LastError::OrHash
            )
        ).void
      end
      attr_writer :last_error

      # When the most recent run ended. `null` until the first run ends.
      sig { returns(T.nilable(Time)) }
      attr_accessor :last_run_at

      # When the next scheduled run is due. `null` while paused.
      sig { returns(T.nilable(Time)) }
      attr_accessor :next_run_at

      # Access policy IDs applied to every run.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :policies

      sig { params(policies: T::Array[String]).void }
      attr_writer :policies

      # Run the monitor at a fixed interval, such as every 6 hours or every 2 days. The
      # interval must be between 10 minutes and 1 year.
      sig do
        returns(
          T.nilable(ContextDev::Models::MonitorRetrieveResponse::Schedule)
        )
      end
      attr_reader :schedule

      sig do
        params(
          schedule:
            ContextDev::Models::MonitorRetrieveResponse::Schedule::OrHash
        ).void
      end
      attr_writer :schedule

      # Labels for grouping monitors. Filter monitors, changes, and credit usage by tag.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Webhook that receives monitor events. `null` when no webhook is configured.
      sig do
        returns(T.nilable(ContextDev::Models::MonitorRetrieveResponse::Webhook))
      end
      attr_reader :webhook

      sig do
        params(
          webhook:
            T.nilable(
              ContextDev::Models::MonitorRetrieveResponse::Webhook::OrHash
            )
        ).void
      end
      attr_writer :webhook

      # Details of failing webhook deliveries. `null` when deliveries succeed or no
      # webhook is configured; cleared by the next successful delivery or a new webhook
      # URL.
      sig do
        returns(
          T.nilable(ContextDev::Models::MonitorRetrieveResponse::WebhookFailure)
        )
      end
      attr_reader :webhook_failure

      sig do
        params(
          webhook_failure:
            T.nilable(
              ContextDev::Models::MonitorRetrieveResponse::WebhookFailure::OrHash
            )
        ).void
      end
      attr_writer :webhook_failure

      sig do
        params(
          id: String,
          change_detection:
            T.any(
              ContextDev::Models::MonitorRetrieveResponse::ChangeDetection::Exact::OrHash,
              ContextDev::Models::MonitorRetrieveResponse::ChangeDetection::Semantic::OrHash
            ),
          created_at: Time,
          mode: ContextDev::Models::MonitorRetrieveResponse::Mode::OrSymbol,
          name: String,
          request_id: String,
          status: ContextDev::Models::MonitorRetrieveResponse::Status::OrSymbol,
          target:
            T.any(
              ContextDev::Models::MonitorRetrieveResponse::Target::Page::OrHash,
              ContextDev::Models::MonitorRetrieveResponse::Target::Sitemap::OrHash,
              ContextDev::Models::MonitorRetrieveResponse::Target::Extract::OrHash,
              ContextDev::Models::MonitorRetrieveResponse::Target::Search::OrHash
            ),
          updated_at: Time,
          baseline:
            T.nilable(
              T.any(
                ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsPageBaseline::OrHash,
                ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsSitemapBaseline::OrHash,
                ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsExtractBaseline::OrHash,
                ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsSearchBaseline::OrHash
              )
            ),
          key_metadata:
            ContextDev::Models::MonitorRetrieveResponse::KeyMetadata::OrHash,
          last_change_at: T.nilable(Time),
          last_error:
            T.nilable(
              ContextDev::Models::MonitorRetrieveResponse::LastError::OrHash
            ),
          last_run_at: T.nilable(Time),
          next_run_at: T.nilable(Time),
          policies: T::Array[String],
          schedule:
            ContextDev::Models::MonitorRetrieveResponse::Schedule::OrHash,
          tags: T::Array[String],
          webhook:
            T.nilable(
              ContextDev::Models::MonitorRetrieveResponse::Webhook::OrHash
            ),
          webhook_failure:
            T.nilable(
              ContextDev::Models::MonitorRetrieveResponse::WebhookFailure::OrHash
            )
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique ID of the monitor.
        id:,
        # How changes are judged. Defaults to `semantic` for extract and search targets
        # and for page targets with `instructions`; otherwise `exact`. Sitemap targets
        # support only `exact`, and extract targets only `semantic`.
        change_detection:,
        # When the monitor was created.
        created_at:,
        # Monitor category. Always `web`.
        mode:,
        # Display name of the monitor.
        name:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # `active` monitors run on schedule. `failed` monitors keep running after a failed
        # run and return to `active` on the next success. `paused` monitors don't run
        # until you set `status` to `active`; Context.dev also pauses monitors after
        # repeated failures or credit shortfalls.
        status:,
        # What to watch: a page, a sitemap, data extracted from a site, or web search
        # results.
        target:,
        # When the monitor was last updated.
        updated_at:,
        # What the next run compares against. Returned only by
        # `GET /monitors/{monitor_id}`; `null` until the first capture finishes or after
        # the target changes.
        baseline: nil,
        # Credits this request used and your remaining balance.
        key_metadata: nil,
        # When the monitor last detected a change. `null` until it detects one.
        last_change_at: nil,
        # Error from the most recent failed run. `null` when the last run succeeded.
        last_error: nil,
        # When the most recent run ended. `null` until the first run ends.
        last_run_at: nil,
        # When the next scheduled run is due. `null` while paused.
        next_run_at: nil,
        # Access policy IDs applied to every run.
        policies: nil,
        # Run the monitor at a fixed interval, such as every 6 hours or every 2 days. The
        # interval must be between 10 minutes and 1 year.
        schedule: nil,
        # Labels for grouping monitors. Filter monitors, changes, and credit usage by tag.
        tags: nil,
        # Webhook that receives monitor events. `null` when no webhook is configured.
        webhook: nil,
        # Details of failing webhook deliveries. `null` when deliveries succeed or no
        # webhook is configured; cleared by the next successful delivery or a new webhook
        # URL.
        webhook_failure: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            change_detection:
              ContextDev::Models::MonitorRetrieveResponse::ChangeDetection::Variants,
            created_at: Time,
            mode:
              ContextDev::Models::MonitorRetrieveResponse::Mode::TaggedSymbol,
            name: String,
            request_id: String,
            status:
              ContextDev::Models::MonitorRetrieveResponse::Status::TaggedSymbol,
            target:
              ContextDev::Models::MonitorRetrieveResponse::Target::Variants,
            updated_at: Time,
            baseline:
              T.nilable(
                ContextDev::Models::MonitorRetrieveResponse::Baseline::Variants
              ),
            key_metadata:
              ContextDev::Models::MonitorRetrieveResponse::KeyMetadata,
            last_change_at: T.nilable(Time),
            last_error:
              T.nilable(ContextDev::Models::MonitorRetrieveResponse::LastError),
            last_run_at: T.nilable(Time),
            next_run_at: T.nilable(Time),
            policies: T::Array[String],
            schedule: ContextDev::Models::MonitorRetrieveResponse::Schedule,
            tags: T::Array[String],
            webhook:
              T.nilable(ContextDev::Models::MonitorRetrieveResponse::Webhook),
            webhook_failure:
              T.nilable(
                ContextDev::Models::MonitorRetrieveResponse::WebhookFailure
              )
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
              ContextDev::Models::MonitorRetrieveResponse::ChangeDetection::Exact,
              ContextDev::Models::MonitorRetrieveResponse::ChangeDetection::Semantic
            )
          end

        class Exact < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorRetrieveResponse::ChangeDetection::Exact,
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
                ContextDev::Models::MonitorRetrieveResponse::ChangeDetection::Semantic,
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
            T::Array[
              ContextDev::Models::MonitorRetrieveResponse::ChangeDetection::Variants
            ]
          )
        end
        def self.variants
        end
      end

      # Monitor category. Always `web`.
      module Mode
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::MonitorRetrieveResponse::Mode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WEB =
          T.let(
            :web,
            ContextDev::Models::MonitorRetrieveResponse::Mode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::MonitorRetrieveResponse::Mode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # `active` monitors run on schedule. `failed` monitors keep running after a failed
      # run and return to `active` on the next success. `paused` monitors don't run
      # until you set `status` to `active`; Context.dev also pauses monitors after
      # repeated failures or credit shortfalls.
      module Status
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::MonitorRetrieveResponse::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(
            :active,
            ContextDev::Models::MonitorRetrieveResponse::Status::TaggedSymbol
          )
        PAUSED =
          T.let(
            :paused,
            ContextDev::Models::MonitorRetrieveResponse::Status::TaggedSymbol
          )
        FAILED =
          T.let(
            :failed,
            ContextDev::Models::MonitorRetrieveResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::MonitorRetrieveResponse::Status::TaggedSymbol
            ]
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
              ContextDev::Models::MonitorRetrieveResponse::Target::Page,
              ContextDev::Models::MonitorRetrieveResponse::Target::Sitemap,
              ContextDev::Models::MonitorRetrieveResponse::Target::Extract,
              ContextDev::Models::MonitorRetrieveResponse::Target::Search
            )
          end

        class Page < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorRetrieveResponse::Target::Page,
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
                  ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Variants
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
                      ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Wait::OrHash,
                      ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Perform::OrHash,
                      ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::OrHash
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
                      ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Variants
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
                  ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Wait,
                  ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Perform,
                  ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll
                )
              end

            class Wait < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Wait,
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
                    ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Perform,
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
                    ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll,
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
                    ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Amount::Variants
                  )
                )
              end
              attr_reader :amount

              sig do
                params(
                  amount:
                    T.any(
                      Integer,
                      ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Amount::OrSymbol
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
                    ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Direction::TaggedSymbol
                  )
                )
              end
              attr_reader :direction

              sig do
                params(
                  direction:
                    ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Direction::OrSymbol
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
                      ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Amount::OrSymbol
                    ),
                  container: String,
                  direction:
                    ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Direction::OrSymbol,
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
                      ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Amount::Variants,
                    container: String,
                    direction:
                      ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Direction::TaggedSymbol,
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
                      ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Amount::TaggedSymbol
                    )
                  end

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Amount::Variants
                    ]
                  )
                end
                def self.variants
                end

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Amount
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                VIEWPORT =
                  T.let(
                    :viewport,
                    ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Amount::TaggedSymbol
                  )
                MAX =
                  T.let(
                    :max,
                    ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Amount::TaggedSymbol
                  )
              end

              # Direction to scroll.
              module Direction
                extend ContextDev::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Direction
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                UP =
                  T.let(
                    :up,
                    ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Direction::TaggedSymbol
                  )
                DOWN =
                  T.let(
                    :down,
                    ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Direction::TaggedSymbol
                  )
                LEFT =
                  T.let(
                    :left,
                    ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Direction::TaggedSymbol
                  )
                RIGHT =
                  T.let(
                    :right,
                    ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Direction::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Scroll::Direction::TaggedSymbol
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
                  ContextDev::Models::MonitorRetrieveResponse::Target::Page::Action::Variants
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
                ContextDev::Models::MonitorRetrieveResponse::Target::Sitemap,
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
                ContextDev::Models::MonitorRetrieveResponse::Target::Extract,
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
                ContextDev::Models::MonitorRetrieveResponse::Target::Search,
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
            T::Array[
              ContextDev::Models::MonitorRetrieveResponse::Target::Variants
            ]
          )
        end
        def self.variants
        end
      end

      # What the next run compares against. Returned only by
      # `GET /monitors/{monitor_id}`; `null` until the first capture finishes or after
      # the target changes.
      module Baseline
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsPageBaseline,
              ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsSitemapBaseline,
              ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsExtractBaseline,
              ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsSearchBaseline
            )
          end

        class MonitorsPageBaseline < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsPageBaseline,
                ContextDev::Internal::AnyHash
              )
            end

          # When the baseline was last captured or updated.
          sig { returns(Time) }
          attr_accessor :captured_at

          # Visible page text from the last capture.
          sig { returns(String) }
          attr_accessor :text

          # Baseline for a `page` target: the page's visible text from the last capture.
          sig do
            params(captured_at: Time, text: String).returns(T.attached_class)
          end
          def self.new(
            # When the baseline was last captured or updated.
            captured_at:,
            # Visible page text from the last capture.
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
                ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsSitemapBaseline,
                ContextDev::Internal::AnyHash
              )
            end

          # When the baseline was last captured or updated.
          sig { returns(Time) }
          attr_accessor :captured_at

          # Number of URLs in the baseline.
          sig { returns(Integer) }
          attr_accessor :url_count

          # Normalized sitemap URLs from the last capture, sorted.
          sig { returns(T::Array[String]) }
          attr_accessor :urls

          # Baseline for a `sitemap` target: the normalized set of URLs from the last
          # capture.
          sig do
            params(
              captured_at: Time,
              url_count: Integer,
              urls: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(
            # When the baseline was last captured or updated.
            captured_at:,
            # Number of URLs in the baseline.
            url_count:,
            # Normalized sitemap URLs from the last capture, sorted.
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
                ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsExtractBaseline,
                ContextDev::Internal::AnyHash
              )
            end

          # When the baseline was last captured or updated.
          sig { returns(Time) }
          attr_accessor :captured_at

          # Latest extracted data, matching the target's `schema`. Refreshed at most once a
          # day; `null` before the first capture.
          sig { returns(T.anything) }
          attr_accessor :data

          # Pages the monitor tracks for changes.
          sig { returns(T::Array[String]) }
          attr_accessor :urls_analyzed

          # Baseline for an `extract` target: the tracked pages and the data last extracted
          # from them.
          sig do
            params(
              captured_at: Time,
              data: T.anything,
              urls_analyzed: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(
            # When the baseline was last captured or updated.
            captured_at:,
            # Latest extracted data, matching the target's `schema`. Refreshed at most once a
            # day; `null` before the first capture.
            data:,
            # Pages the monitor tracks for changes.
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

        class MonitorsSearchBaseline < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsSearchBaseline,
                ContextDev::Internal::AnyHash
              )
            end

          # When the baseline was last captured or updated.
          sig { returns(Time) }
          attr_accessor :captured_at

          # Search results from the last capture.
          sig do
            returns(
              T::Array[
                ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsSearchBaseline::Result
              ]
            )
          end
          attr_accessor :results

          # Baseline for a `search` target: the results from the last capture.
          sig do
            params(
              captured_at: Time,
              results:
                T::Array[
                  ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsSearchBaseline::Result::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # When the baseline was last captured or updated.
            captured_at:,
            # Search results from the last capture.
            results:
          )
          end

          sig do
            override.returns(
              {
                captured_at: Time,
                results:
                  T::Array[
                    ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsSearchBaseline::Result
                  ]
              }
            )
          end
          def to_hash
          end

          class Result < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsSearchBaseline::Result,
                  ContextDev::Internal::AnyHash
                )
              end

            # Result snippet.
            sig { returns(String) }
            attr_accessor :description

            # When the result was published. `null` when unknown.
            sig { returns(T.nilable(Time)) }
            attr_accessor :published_at

            # Title of the result.
            sig { returns(String) }
            attr_accessor :title

            # URL of the result.
            sig { returns(String) }
            attr_accessor :url

            sig do
              params(
                description: String,
                published_at: T.nilable(Time),
                title: String,
                url: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Result snippet.
              description:,
              # When the result was published. `null` when unknown.
              published_at:,
              # Title of the result.
              title:,
              # URL of the result.
              url:
            )
            end

            sig do
              override.returns(
                {
                  description: String,
                  published_at: T.nilable(Time),
                  title: String,
                  url: String
                }
              )
            end
            def to_hash
            end
          end
        end

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::MonitorRetrieveResponse::Baseline::Variants
            ]
          )
        end
        def self.variants
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorRetrieveResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits your organization has left after this request.
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
          # Credits your organization has left after this request.
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

      class LastError < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorRetrieveResponse::LastError,
              ContextDev::Internal::AnyHash
            )
          end

        # Machine-readable error code, such as `fetch_failed`.
        sig { returns(String) }
        attr_accessor :code

        # Human-readable explanation of the error.
        sig { returns(String) }
        attr_accessor :message

        # Error from the most recent failed run. `null` when the last run succeeded.
        sig { params(code: String, message: String).returns(T.attached_class) }
        def self.new(
          # Machine-readable error code, such as `fetch_failed`.
          code:,
          # Human-readable explanation of the error.
          message:
        )
        end

        sig { override.returns({ code: String, message: String }) }
        def to_hash
        end
      end

      class Schedule < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorRetrieveResponse::Schedule,
              ContextDev::Internal::AnyHash
            )
          end

        # Number of `unit` periods between runs. The interval must be between 10 minutes
        # and 1 year, so at least `10` with `minutes` and at most `365` with `days`.
        sig { returns(Integer) }
        attr_accessor :frequency

        # Use `interval` to run on a repeating schedule.
        sig do
          returns(
            ContextDev::Models::MonitorRetrieveResponse::Schedule::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Time unit for `frequency`.
        sig do
          returns(
            ContextDev::Models::MonitorRetrieveResponse::Schedule::Unit::TaggedSymbol
          )
        end
        attr_accessor :unit

        # Run the monitor at a fixed interval, such as every 6 hours or every 2 days. The
        # interval must be between 10 minutes and 1 year.
        sig do
          params(
            frequency: Integer,
            type:
              ContextDev::Models::MonitorRetrieveResponse::Schedule::Type::OrSymbol,
            unit:
              ContextDev::Models::MonitorRetrieveResponse::Schedule::Unit::OrSymbol
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
              type:
                ContextDev::Models::MonitorRetrieveResponse::Schedule::Type::TaggedSymbol,
              unit:
                ContextDev::Models::MonitorRetrieveResponse::Schedule::Unit::TaggedSymbol
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
                ContextDev::Models::MonitorRetrieveResponse::Schedule::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INTERVAL =
            T.let(
              :interval,
              ContextDev::Models::MonitorRetrieveResponse::Schedule::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorRetrieveResponse::Schedule::Type::TaggedSymbol
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
              T.all(
                Symbol,
                ContextDev::Models::MonitorRetrieveResponse::Schedule::Unit
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MINUTES =
            T.let(
              :minutes,
              ContextDev::Models::MonitorRetrieveResponse::Schedule::Unit::TaggedSymbol
            )
          HOURS =
            T.let(
              :hours,
              ContextDev::Models::MonitorRetrieveResponse::Schedule::Unit::TaggedSymbol
            )
          DAYS =
            T.let(
              :days,
              ContextDev::Models::MonitorRetrieveResponse::Schedule::Unit::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorRetrieveResponse::Schedule::Unit::TaggedSymbol
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
              ContextDev::Models::MonitorRetrieveResponse::Webhook,
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
                ContextDev::Models::MonitorRetrieveResponse::Webhook::Event::TaggedSymbol
              ]
            )
          )
        end
        attr_reader :events

        sig do
          params(
            events:
              T::Array[
                ContextDev::Models::MonitorRetrieveResponse::Webhook::Event::OrSymbol
              ]
          ).void
        end
        attr_writer :events

        # Automatic retry settings. Pass `{}` for the default schedule.
        sig { returns(T.nilable(ContextDev::RetryConfig)) }
        attr_reader :retry_

        sig { params(retry_: ContextDev::RetryConfig::OrHash).void }
        attr_writer :retry_

        # Signing secret for verifying deliveries, generated by Context.dev. Returned only
        # to API keys with full access or the `monitors:write` permission.
        sig { returns(T.nilable(String)) }
        attr_reader :secret

        sig { params(secret: String).void }
        attr_writer :secret

        # Webhook that receives monitor events. `null` when no webhook is configured.
        sig do
          params(
            url: String,
            events:
              T::Array[
                ContextDev::Models::MonitorRetrieveResponse::Webhook::Event::OrSymbol
              ],
            retry_: ContextDev::RetryConfig::OrHash,
            secret: String
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
          retry_: nil,
          # Signing secret for verifying deliveries, generated by Context.dev. Returned only
          # to API keys with full access or the `monitors:write` permission.
          secret: nil
        )
        end

        sig do
          override.returns(
            {
              url: String,
              events:
                T::Array[
                  ContextDev::Models::MonitorRetrieveResponse::Webhook::Event::TaggedSymbol
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
                ContextDev::Models::MonitorRetrieveResponse::Webhook::Event
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CHANGE_DETECTED =
            T.let(
              :"change.detected",
              ContextDev::Models::MonitorRetrieveResponse::Webhook::Event::TaggedSymbol
            )
          RUN_COMPLETED =
            T.let(
              :"run.completed",
              ContextDev::Models::MonitorRetrieveResponse::Webhook::Event::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorRetrieveResponse::Webhook::Event::TaggedSymbol
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
              ContextDev::Models::MonitorRetrieveResponse::WebhookFailure,
              ContextDev::Internal::AnyHash
            )
          end

        # Number of failed delivery attempts in a row.
        sig { returns(Integer) }
        attr_accessor :consecutive_failures

        # When the most recent delivery failed.
        sig { returns(Time) }
        attr_accessor :last_failed_at

        # Human-readable explanation of the most recent failure.
        sig { returns(String) }
        attr_accessor :last_message

        # Outcome of the most recent failed delivery: `rejected` (non-2xx response),
        # `failed` (no response), or `skipped_unsafe_url` (the URL isn't a safe public
        # endpoint).
        sig do
          returns(
            ContextDev::Models::MonitorRetrieveResponse::WebhookFailure::LastStatus::TaggedSymbol
          )
        end
        attr_accessor :last_status

        # Details of failing webhook deliveries. `null` when deliveries succeed or no
        # webhook is configured; cleared by the next successful delivery or a new webhook
        # URL.
        sig do
          params(
            consecutive_failures: Integer,
            last_failed_at: Time,
            last_message: String,
            last_status:
              ContextDev::Models::MonitorRetrieveResponse::WebhookFailure::LastStatus::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of failed delivery attempts in a row.
          consecutive_failures:,
          # When the most recent delivery failed.
          last_failed_at:,
          # Human-readable explanation of the most recent failure.
          last_message:,
          # Outcome of the most recent failed delivery: `rejected` (non-2xx response),
          # `failed` (no response), or `skipped_unsafe_url` (the URL isn't a safe public
          # endpoint).
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
                ContextDev::Models::MonitorRetrieveResponse::WebhookFailure::LastStatus::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Outcome of the most recent failed delivery: `rejected` (non-2xx response),
        # `failed` (no response), or `skipped_unsafe_url` (the URL isn't a safe public
        # endpoint).
        module LastStatus
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorRetrieveResponse::WebhookFailure::LastStatus
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          REJECTED =
            T.let(
              :rejected,
              ContextDev::Models::MonitorRetrieveResponse::WebhookFailure::LastStatus::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              ContextDev::Models::MonitorRetrieveResponse::WebhookFailure::LastStatus::TaggedSymbol
            )
          SKIPPED_UNSAFE_URL =
            T.let(
              :skipped_unsafe_url,
              ContextDev::Models::MonitorRetrieveResponse::WebhookFailure::LastStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorRetrieveResponse::WebhookFailure::LastStatus::TaggedSymbol
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
