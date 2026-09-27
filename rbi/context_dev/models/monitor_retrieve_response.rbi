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

      sig { returns(String) }
      attr_accessor :id

      # How changes are judged. Defaults to `semantic` for extract targets and page
      # targets with `instructions`, otherwise `exact`.
      sig do
        returns(
          ContextDev::Models::MonitorRetrieveResponse::ChangeDetection::Variants
        )
      end
      attr_accessor :change_detection

      sig { returns(Time) }
      attr_accessor :created_at

      # Always `web`. Optional.
      sig do
        returns(ContextDev::Models::MonitorRetrieveResponse::Mode::TaggedSymbol)
      end
      attr_accessor :mode

      sig { returns(String) }
      attr_accessor :name

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Current state. Failed monitors keep running; paused monitors must be resumed
      # with `status: "active"`.
      sig do
        returns(
          ContextDev::Models::MonitorRetrieveResponse::Status::TaggedSymbol
        )
      end
      attr_accessor :status

      # What to watch: a page, a sitemap, or data extracted from a site.
      sig do
        returns(ContextDev::Models::MonitorRetrieveResponse::Target::Variants)
      end
      attr_accessor :target

      sig { returns(Time) }
      attr_accessor :updated_at

      # Comparison baseline, included on Retrieve. Null until capture completes or after
      # target changes.
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

      sig { returns(T.nilable(Time)) }
      attr_accessor :last_change_at

      # Error from the most recent failed run; null when the last run succeeded.
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

      sig { returns(T.nilable(Time)) }
      attr_accessor :last_run_at

      # When the next scheduled run is due; null while paused.
      sig { returns(T.nilable(Time)) }
      attr_accessor :next_run_at

      # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
      # every 6 hours or every 2 days. The total interval (frequency × unit) must be
      # between 10 minutes and 1 year.
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

      # Labels for filtering monitors, their changes, and their usage.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Webhook destination and delivery settings. Null means no webhook is configured.
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

      # Present while webhook deliveries are failing consecutively; null when deliveries
      # are healthy or no webhook is configured. Cleared on the next successful delivery
      # and when the webhook URL changes.
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
              ContextDev::Models::MonitorRetrieveResponse::Target::Extract::OrHash
            ),
          updated_at: Time,
          baseline:
            T.nilable(
              T.any(
                ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsPageBaseline::OrHash,
                ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsSitemapBaseline::OrHash,
                ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsExtractBaseline::OrHash
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
        id:,
        # How changes are judged. Defaults to `semantic` for extract targets and page
        # targets with `instructions`, otherwise `exact`.
        change_detection:,
        created_at:,
        # Always `web`. Optional.
        mode:,
        name:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Current state. Failed monitors keep running; paused monitors must be resumed
        # with `status: "active"`.
        status:,
        # What to watch: a page, a sitemap, or data extracted from a site.
        target:,
        updated_at:,
        # Comparison baseline, included on Retrieve. Null until capture completes or after
        # target changes.
        baseline: nil,
        # Credits this request used and your remaining balance.
        key_metadata: nil,
        last_change_at: nil,
        # Error from the most recent failed run; null when the last run succeeded.
        last_error: nil,
        last_run_at: nil,
        # When the next scheduled run is due; null while paused.
        next_run_at: nil,
        # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        # every 6 hours or every 2 days. The total interval (frequency × unit) must be
        # between 10 minutes and 1 year.
        schedule: nil,
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

      # How changes are judged. Defaults to `semantic` for extract targets and page
      # targets with `instructions`, otherwise `exact`.
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
                ContextDev::Models::MonitorRetrieveResponse::ChangeDetection::Semantic,
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
              ContextDev::Models::MonitorRetrieveResponse::ChangeDetection::Variants
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

      # Current state. Failed monitors keep running; paused monitors must be resumed
      # with `status: "active"`.
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

      # What to watch: a page, a sitemap, or data extracted from a site.
      module Target
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorRetrieveResponse::Target::Page,
              ContextDev::Models::MonitorRetrieveResponse::Target::Sitemap,
              ContextDev::Models::MonitorRetrieveResponse::Target::Extract
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
                ContextDev::Models::MonitorRetrieveResponse::Target::Sitemap,
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
                ContextDev::Models::MonitorRetrieveResponse::Target::Extract,
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
              ContextDev::Models::MonitorRetrieveResponse::Target::Variants
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
              ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsPageBaseline,
              ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsSitemapBaseline,
              ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsExtractBaseline
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
                ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsSitemapBaseline,
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
                ContextDev::Models::MonitorRetrieveResponse::Baseline::MonitorsExtractBaseline,
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

      class LastError < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorRetrieveResponse::LastError,
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

      class Schedule < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorRetrieveResponse::Schedule,
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
            ContextDev::Models::MonitorRetrieveResponse::Schedule::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Time unit used with `frequency` to set the run interval.
        sig do
          returns(
            ContextDev::Models::MonitorRetrieveResponse::Schedule::Unit::TaggedSymbol
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
              ContextDev::Models::MonitorRetrieveResponse::Schedule::Type::OrSymbol,
            unit:
              ContextDev::Models::MonitorRetrieveResponse::Schedule::Unit::OrSymbol
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

        # Time unit used with `frequency` to set the run interval.
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
                ContextDev::Models::MonitorRetrieveResponse::Webhook::Event::OrSymbol
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
            ContextDev::Models::MonitorRetrieveResponse::WebhookFailure::LastStatus::TaggedSymbol
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
              ContextDev::Models::MonitorRetrieveResponse::WebhookFailure::LastStatus::OrSymbol
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
                ContextDev::Models::MonitorRetrieveResponse::WebhookFailure::LastStatus::TaggedSymbol
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
