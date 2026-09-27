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

      # How changes are judged. Defaults to `semantic` for extract targets and page
      # targets with `instructions`, otherwise `exact`.
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

      # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
      # every 6 hours or every 2 days. The total interval (frequency × unit) must be
      # between 10 minutes and 1 year.
      sig { returns(T.nilable(ContextDev::MonitorUpdateParams::Schedule)) }
      attr_reader :schedule

      sig do
        params(schedule: ContextDev::MonitorUpdateParams::Schedule::OrHash).void
      end
      attr_writer :schedule

      # Set `paused` to stop scheduled runs or `active` to resume them.
      sig do
        returns(T.nilable(ContextDev::MonitorUpdateParams::Status::OrSymbol))
      end
      attr_reader :status

      sig do
        params(status: ContextDev::MonitorUpdateParams::Status::OrSymbol).void
      end
      attr_writer :status

      # Labels for filtering monitors, their changes, and their usage.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # What to watch: a page, a sitemap, or data extracted from a site.
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

      # Set to null to remove the webhook. Changing `url` issues a new secret.
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
        # ID of the monitor.
        monitor_id:,
        # How changes are judged. Defaults to `semantic` for extract targets and page
        # targets with `instructions`, otherwise `exact`.
        change_detection: nil,
        # Display name for the monitor.
        name: nil,
        # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        # every 6 hours or every 2 days. The total interval (frequency × unit) must be
        # between 10 minutes and 1 year.
        schedule: nil,
        # Set `paused` to stop scheduled runs or `active` to resume them.
        status: nil,
        # Labels for filtering monitors, their changes, and their usage.
        tags: nil,
        # What to watch: a page, a sitemap, or data extracted from a site.
        target: nil,
        # Set to null to remove the webhook. Changing `url` issues a new secret.
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

      # How changes are judged. Defaults to `semantic` for extract targets and page
      # targets with `instructions`, otherwise `exact`.
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
                ContextDev::MonitorUpdateParams::ChangeDetection::Semantic,
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

        # Use `interval` to run on a repeating schedule.
        sig do
          returns(ContextDev::MonitorUpdateParams::Schedule::Type::OrSymbol)
        end
        attr_accessor :type

        # Time unit used with `frequency` to set the run interval.
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

        # Time unit used with `frequency` to set the run interval.
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

      # Set `paused` to stop scheduled runs or `active` to resume them.
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

      # What to watch: a page, a sitemap, or data extracted from a site.
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

          # Use `page` to watch one web page.
          sig { returns(Symbol) }
          attr_accessor :type

          # Public HTTP(S) page URL to monitor.
          sig { returns(String) }
          attr_accessor :url

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
                ContextDev::MonitorUpdateParams::Target::Sitemap,
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
                ContextDev::MonitorUpdateParams::Target::Extract,
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

        # Webhook retry settings. Use {} for the default schedule.
        sig { returns(T.nilable(ContextDev::RetryConfig)) }
        attr_reader :retry_

        sig { params(retry_: ContextDev::RetryConfig::OrHash).void }
        attr_writer :retry_

        # Set to null to remove the webhook. Changing `url` issues a new secret.
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
