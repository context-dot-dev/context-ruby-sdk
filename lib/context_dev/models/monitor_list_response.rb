# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list
    class MonitorListResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Array<ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor, ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor, ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor, ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor>]
      required :data,
               -> { ContextDev::Internal::Type::ArrayOf[union: ContextDev::Models::MonitorListResponse::Data] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      required :next_cursor, String, nil?: true

      # @!method initialize(data:, has_more:, next_cursor:)
      #   @param data [Array<ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor, ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor, ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor, ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor>]
      #   @param has_more [Boolean]
      #   @param next_cursor [String, nil]

      # Union of monitor response shapes.
      module Data
        extend ContextDev::Internal::Type::Union

        # A page monitor using exact change detection.
        variant -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor }

        # A sitemap monitor using exact change detection.
        variant -> { ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor }

        # A page monitor using semantic change detection.
        variant -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor }

        # An extract monitor using semantic change detection.
        variant -> { ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor }

        class MonitorsPageExactMonitor < ContextDev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute change_detection
          #   Detect exact changes. For page targets, this means visible text diffs. For
          #   sitemap targets, this means URL additions and removals.
          #
          #   @return [ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection]
          required :change_detection,
                   -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection }

          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute schedule
          #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
          #   between 10 minutes and 1 year.
          #
          #   @return [ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule]
          required :schedule,
                   -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule }

          # @!attribute status
          #
          #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Status]
          required :status,
                   enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Status }

          # @!attribute target
          #
          #   @return [ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target]
          required :target, -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target }

          # @!attribute updated_at
          #
          #   @return [Time]
          required :updated_at, Time

          # @!attribute last_change_at
          #
          #   @return [Time, nil]
          optional :last_change_at, Time, nil?: true

          # @!attribute last_run_at
          #
          #   @return [Time, nil]
          optional :last_run_at, Time, nil?: true

          # @!attribute tags
          #   User-defined tags for grouping and filtering monitors and their changes.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute webhook
          #
          #   @return [ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Webhook, nil]
          optional :webhook,
                   -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Webhook },
                   nil?: true

          # @!method initialize(id:, change_detection:, created_at:, name:, schedule:, status:, target:, updated_at:, last_change_at: nil, last_run_at: nil, tags: nil, webhook: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor} for
          #   more details.
          #
          #   A page monitor using exact change detection.
          #
          #   @param id [String]
          #
          #   @param change_detection [ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection] Detect exact changes. For page targets, this means visible text diffs. For sitem
          #
          #   @param created_at [Time]
          #
          #   @param name [String]
          #
          #   @param schedule [ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule] Run the monitor on a fixed interval defined by a frequency and a unit, e.g. ever
          #
          #   @param status [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Status]
          #
          #   @param target [ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target]
          #
          #   @param updated_at [Time]
          #
          #   @param last_change_at [Time, nil]
          #
          #   @param last_run_at [Time, nil]
          #
          #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.
          #
          #   @param webhook [ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Webhook, nil]

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor#change_detection
          class ChangeDetection < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection::Type]
            required :type,
                     enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection::Type }

            # @!method initialize(type:)
            #   Detect exact changes. For page targets, this means visible text diffs. For
            #   sitemap targets, this means URL additions and removals.
            #
            #   @param type [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection::Type]

            # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection#type
            module Type
              extend ContextDev::Internal::Type::Enum

              EXACT = :exact

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor#schedule
          class Schedule < ContextDev::Internal::Type::BaseModel
            # @!attribute frequency
            #   Number of units between runs. The resulting interval (frequency × unit) must be
            #   at least 10 minutes and at most 1 year (e.g. minimum 10 when unit is minutes;
            #   maximum 365 when unit is days).
            #
            #   @return [Integer]
            required :frequency, Integer

            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Type]
            required :type,
                     enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Type }

            # @!attribute unit
            #
            #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Unit]
            required :unit,
                     enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Unit }

            # @!method initialize(frequency:, type:, unit:)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule}
            #   for more details.
            #
            #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
            #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
            #   between 10 minutes and 1 year.
            #
            #   @param frequency [Integer] Number of units between runs. The resulting interval (frequency × unit) must be
            #
            #   @param type [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Type]
            #
            #   @param unit [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Unit]

            # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule#type
            module Type
              extend ContextDev::Internal::Type::Enum

              INTERVAL = :interval

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule#unit
            module Unit
              extend ContextDev::Internal::Type::Enum

              MINUTES = :minutes
              HOURS = :hours
              DAYS = :days

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor#status
          module Status
            extend ContextDev::Internal::Type::Enum

            ACTIVE = :active
            PAUSED = :paused
            FAILED = :failed

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor#target
          class Target < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target::Type]
            required :type,
                     enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target::Type }

            # @!attribute url
            #
            #   @return [String]
            required :url, String

            # @!attribute normalize_whitespace
            #   Normalize whitespace before comparing or analyzing text.
            #
            #   @return [Boolean, nil]
            optional :normalize_whitespace, ContextDev::Internal::Type::Boolean

            # @!method initialize(type:, url:, normalize_whitespace: nil)
            #   @param type [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target::Type]
            #
            #   @param url [String]
            #
            #   @param normalize_whitespace [Boolean] Normalize whitespace before comparing or analyzing text.

            # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target#type
            module Type
              extend ContextDev::Internal::Type::Enum

              PAGE = :page

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor#webhook
          class Webhook < ContextDev::Internal::Type::BaseModel
            # @!attribute url
            #   Webhook URL called when a change is detected.
            #
            #   @return [String]
            required :url, String

            response_only do
              # @!attribute secret
              #   Signing secret used to verify webhook authenticity. Each delivery includes an
              #   `X-Context-Signature: t=<unix>,v1=<hmac>` header, where the HMAC is SHA-256 over
              #   `"{t}.{rawRequestBody}"` keyed by this secret. Recompute it with a constant-time
              #   compare and reject stale timestamps to prevent replay. Generated by the API;
              #   cannot be set by clients.
              #
              #   @return [String, nil]
              optional :secret, String
            end

            # @!method initialize(url:, secret: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Webhook}
            #   for more details.
            #
            #   @param url [String] Webhook URL called when a change is detected.
            #
            #   @param secret [String] Signing secret used to verify webhook authenticity. Each delivery includes an `X
          end
        end

        class MonitorsSitemapExactMonitor < ContextDev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute change_detection
          #   Detect exact changes. For page targets, this means visible text diffs. For
          #   sitemap targets, this means URL additions and removals.
          #
          #   @return [ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection]
          required :change_detection,
                   -> { ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection }

          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute schedule
          #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
          #   between 10 minutes and 1 year.
          #
          #   @return [ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule]
          required :schedule,
                   -> { ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule }

          # @!attribute status
          #
          #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Status]
          required :status,
                   enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Status }

          # @!attribute target
          #
          #   @return [ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target]
          required :target,
                   -> { ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target }

          # @!attribute updated_at
          #
          #   @return [Time]
          required :updated_at, Time

          # @!attribute last_change_at
          #
          #   @return [Time, nil]
          optional :last_change_at, Time, nil?: true

          # @!attribute last_run_at
          #
          #   @return [Time, nil]
          optional :last_run_at, Time, nil?: true

          # @!attribute tags
          #   User-defined tags for grouping and filtering monitors and their changes.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute webhook
          #
          #   @return [ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Webhook, nil]
          optional :webhook,
                   -> { ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Webhook },
                   nil?: true

          # @!method initialize(id:, change_detection:, created_at:, name:, schedule:, status:, target:, updated_at:, last_change_at: nil, last_run_at: nil, tags: nil, webhook: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor} for
          #   more details.
          #
          #   A sitemap monitor using exact change detection.
          #
          #   @param id [String]
          #
          #   @param change_detection [ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection] Detect exact changes. For page targets, this means visible text diffs. For sitem
          #
          #   @param created_at [Time]
          #
          #   @param name [String]
          #
          #   @param schedule [ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule] Run the monitor on a fixed interval defined by a frequency and a unit, e.g. ever
          #
          #   @param status [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Status]
          #
          #   @param target [ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target]
          #
          #   @param updated_at [Time]
          #
          #   @param last_change_at [Time, nil]
          #
          #   @param last_run_at [Time, nil]
          #
          #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.
          #
          #   @param webhook [ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Webhook, nil]

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor#change_detection
          class ChangeDetection < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection::Type]
            required :type,
                     enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection::Type }

            # @!method initialize(type:)
            #   Detect exact changes. For page targets, this means visible text diffs. For
            #   sitemap targets, this means URL additions and removals.
            #
            #   @param type [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection::Type]

            # @see ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection#type
            module Type
              extend ContextDev::Internal::Type::Enum

              EXACT = :exact

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor#schedule
          class Schedule < ContextDev::Internal::Type::BaseModel
            # @!attribute frequency
            #   Number of units between runs. The resulting interval (frequency × unit) must be
            #   at least 10 minutes and at most 1 year (e.g. minimum 10 when unit is minutes;
            #   maximum 365 when unit is days).
            #
            #   @return [Integer]
            required :frequency, Integer

            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Type]
            required :type,
                     enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Type }

            # @!attribute unit
            #
            #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Unit]
            required :unit,
                     enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Unit }

            # @!method initialize(frequency:, type:, unit:)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule}
            #   for more details.
            #
            #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
            #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
            #   between 10 minutes and 1 year.
            #
            #   @param frequency [Integer] Number of units between runs. The resulting interval (frequency × unit) must be
            #
            #   @param type [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Type]
            #
            #   @param unit [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Unit]

            # @see ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule#type
            module Type
              extend ContextDev::Internal::Type::Enum

              INTERVAL = :interval

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule#unit
            module Unit
              extend ContextDev::Internal::Type::Enum

              MINUTES = :minutes
              HOURS = :hours
              DAYS = :days

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor#status
          module Status
            extend ContextDev::Internal::Type::Enum

            ACTIVE = :active
            PAUSED = :paused
            FAILED = :failed

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor#target
          class Target < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target::Type]
            required :type,
                     enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target::Type }

            # @!attribute url
            #   Sitemap URL to monitor.
            #
            #   @return [String]
            required :url, String

            # @!attribute exclude
            #   URL path patterns to exclude.
            #
            #   @return [Array<String>, nil]
            optional :exclude, ContextDev::Internal::Type::ArrayOf[String]

            # @!attribute include
            #   URL path patterns to include.
            #
            #   @return [Array<String>, nil]
            optional :include, ContextDev::Internal::Type::ArrayOf[String]

            # @!attribute max_urls
            #
            #   @return [Integer, nil]
            optional :max_urls, Integer

            # @!method initialize(type:, url:, exclude: nil, include: nil, max_urls: nil)
            #   @param type [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target::Type]
            #
            #   @param url [String] Sitemap URL to monitor.
            #
            #   @param exclude [Array<String>] URL path patterns to exclude.
            #
            #   @param include [Array<String>] URL path patterns to include.
            #
            #   @param max_urls [Integer]

            # @see ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target#type
            module Type
              extend ContextDev::Internal::Type::Enum

              SITEMAP = :sitemap

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor#webhook
          class Webhook < ContextDev::Internal::Type::BaseModel
            # @!attribute url
            #   Webhook URL called when a change is detected.
            #
            #   @return [String]
            required :url, String

            response_only do
              # @!attribute secret
              #   Signing secret used to verify webhook authenticity. Each delivery includes an
              #   `X-Context-Signature: t=<unix>,v1=<hmac>` header, where the HMAC is SHA-256 over
              #   `"{t}.{rawRequestBody}"` keyed by this secret. Recompute it with a constant-time
              #   compare and reject stale timestamps to prevent replay. Generated by the API;
              #   cannot be set by clients.
              #
              #   @return [String, nil]
              optional :secret, String
            end

            # @!method initialize(url:, secret: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Webhook}
            #   for more details.
            #
            #   @param url [String] Webhook URL called when a change is detected.
            #
            #   @param secret [String] Signing secret used to verify webhook authenticity. Each delivery includes an `X
          end
        end

        class MonitorsPageSemanticMonitor < ContextDev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute change_detection
          #   Detect meaning-level changes that match a natural language query.
          #
          #   @return [ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection]
          required :change_detection,
                   -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection }

          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute schedule
          #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
          #   between 10 minutes and 1 year.
          #
          #   @return [ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule]
          required :schedule,
                   -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule }

          # @!attribute status
          #
          #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Status]
          required :status,
                   enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Status }

          # @!attribute target
          #
          #   @return [ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target]
          required :target,
                   -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target }

          # @!attribute updated_at
          #
          #   @return [Time]
          required :updated_at, Time

          # @!attribute last_change_at
          #
          #   @return [Time, nil]
          optional :last_change_at, Time, nil?: true

          # @!attribute last_run_at
          #
          #   @return [Time, nil]
          optional :last_run_at, Time, nil?: true

          # @!attribute tags
          #   User-defined tags for grouping and filtering monitors and their changes.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute webhook
          #
          #   @return [ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Webhook, nil]
          optional :webhook,
                   -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Webhook },
                   nil?: true

          # @!method initialize(id:, change_detection:, created_at:, name:, schedule:, status:, target:, updated_at:, last_change_at: nil, last_run_at: nil, tags: nil, webhook: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor} for
          #   more details.
          #
          #   A page monitor using semantic change detection.
          #
          #   @param id [String]
          #
          #   @param change_detection [ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection] Detect meaning-level changes that match a natural language query.
          #
          #   @param created_at [Time]
          #
          #   @param name [String]
          #
          #   @param schedule [ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule] Run the monitor on a fixed interval defined by a frequency and a unit, e.g. ever
          #
          #   @param status [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Status]
          #
          #   @param target [ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target]
          #
          #   @param updated_at [Time]
          #
          #   @param last_change_at [Time, nil]
          #
          #   @param last_run_at [Time, nil]
          #
          #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.
          #
          #   @param webhook [ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Webhook, nil]

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor#change_detection
          class ChangeDetection < ContextDev::Internal::Type::BaseModel
            # @!attribute query
            #
            #   @return [String]
            required :query, String

            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection::Type]
            required :type,
                     enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection::Type }

            # @!attribute confidence_threshold
            #
            #   @return [Float, nil]
            optional :confidence_threshold, Float

            # @!method initialize(query:, type:, confidence_threshold: nil)
            #   Detect meaning-level changes that match a natural language query.
            #
            #   @param query [String]
            #   @param type [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection::Type]
            #   @param confidence_threshold [Float]

            # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection#type
            module Type
              extend ContextDev::Internal::Type::Enum

              SEMANTIC = :semantic

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor#schedule
          class Schedule < ContextDev::Internal::Type::BaseModel
            # @!attribute frequency
            #   Number of units between runs. The resulting interval (frequency × unit) must be
            #   at least 10 minutes and at most 1 year (e.g. minimum 10 when unit is minutes;
            #   maximum 365 when unit is days).
            #
            #   @return [Integer]
            required :frequency, Integer

            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Type]
            required :type,
                     enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Type }

            # @!attribute unit
            #
            #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Unit]
            required :unit,
                     enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Unit }

            # @!method initialize(frequency:, type:, unit:)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule}
            #   for more details.
            #
            #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
            #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
            #   between 10 minutes and 1 year.
            #
            #   @param frequency [Integer] Number of units between runs. The resulting interval (frequency × unit) must be
            #
            #   @param type [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Type]
            #
            #   @param unit [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Unit]

            # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule#type
            module Type
              extend ContextDev::Internal::Type::Enum

              INTERVAL = :interval

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule#unit
            module Unit
              extend ContextDev::Internal::Type::Enum

              MINUTES = :minutes
              HOURS = :hours
              DAYS = :days

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor#status
          module Status
            extend ContextDev::Internal::Type::Enum

            ACTIVE = :active
            PAUSED = :paused
            FAILED = :failed

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor#target
          class Target < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target::Type]
            required :type,
                     enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target::Type }

            # @!attribute url
            #
            #   @return [String]
            required :url, String

            # @!attribute normalize_whitespace
            #   Normalize whitespace before comparing or analyzing text.
            #
            #   @return [Boolean, nil]
            optional :normalize_whitespace, ContextDev::Internal::Type::Boolean

            # @!method initialize(type:, url:, normalize_whitespace: nil)
            #   @param type [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target::Type]
            #
            #   @param url [String]
            #
            #   @param normalize_whitespace [Boolean] Normalize whitespace before comparing or analyzing text.

            # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target#type
            module Type
              extend ContextDev::Internal::Type::Enum

              PAGE = :page

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor#webhook
          class Webhook < ContextDev::Internal::Type::BaseModel
            # @!attribute url
            #   Webhook URL called when a change is detected.
            #
            #   @return [String]
            required :url, String

            response_only do
              # @!attribute secret
              #   Signing secret used to verify webhook authenticity. Each delivery includes an
              #   `X-Context-Signature: t=<unix>,v1=<hmac>` header, where the HMAC is SHA-256 over
              #   `"{t}.{rawRequestBody}"` keyed by this secret. Recompute it with a constant-time
              #   compare and reject stale timestamps to prevent replay. Generated by the API;
              #   cannot be set by clients.
              #
              #   @return [String, nil]
              optional :secret, String
            end

            # @!method initialize(url:, secret: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Webhook}
            #   for more details.
            #
            #   @param url [String] Webhook URL called when a change is detected.
            #
            #   @param secret [String] Signing secret used to verify webhook authenticity. Each delivery includes an `X
          end
        end

        class MonitorsExtractSemanticMonitor < ContextDev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute change_detection
          #   Detect meaning-level changes that match a natural language query.
          #
          #   @return [ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection]
          required :change_detection,
                   -> { ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection }

          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute schedule
          #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
          #   between 10 minutes and 1 year.
          #
          #   @return [ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule]
          required :schedule,
                   -> { ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule }

          # @!attribute status
          #
          #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Status]
          required :status,
                   enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Status }

          # @!attribute target
          #
          #   @return [ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target]
          required :target,
                   -> { ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target }

          # @!attribute updated_at
          #
          #   @return [Time]
          required :updated_at, Time

          # @!attribute last_change_at
          #
          #   @return [Time, nil]
          optional :last_change_at, Time, nil?: true

          # @!attribute last_run_at
          #
          #   @return [Time, nil]
          optional :last_run_at, Time, nil?: true

          # @!attribute tags
          #   User-defined tags for grouping and filtering monitors and their changes.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute webhook
          #
          #   @return [ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Webhook, nil]
          optional :webhook,
                   -> { ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Webhook },
                   nil?: true

          # @!method initialize(id:, change_detection:, created_at:, name:, schedule:, status:, target:, updated_at:, last_change_at: nil, last_run_at: nil, tags: nil, webhook: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor}
          #   for more details.
          #
          #   An extract monitor using semantic change detection.
          #
          #   @param id [String]
          #
          #   @param change_detection [ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection] Detect meaning-level changes that match a natural language query.
          #
          #   @param created_at [Time]
          #
          #   @param name [String]
          #
          #   @param schedule [ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule] Run the monitor on a fixed interval defined by a frequency and a unit, e.g. ever
          #
          #   @param status [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Status]
          #
          #   @param target [ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target]
          #
          #   @param updated_at [Time]
          #
          #   @param last_change_at [Time, nil]
          #
          #   @param last_run_at [Time, nil]
          #
          #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.
          #
          #   @param webhook [ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Webhook, nil]

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor#change_detection
          class ChangeDetection < ContextDev::Internal::Type::BaseModel
            # @!attribute query
            #
            #   @return [String]
            required :query, String

            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection::Type]
            required :type,
                     enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection::Type }

            # @!attribute confidence_threshold
            #
            #   @return [Float, nil]
            optional :confidence_threshold, Float

            # @!method initialize(query:, type:, confidence_threshold: nil)
            #   Detect meaning-level changes that match a natural language query.
            #
            #   @param query [String]
            #   @param type [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection::Type]
            #   @param confidence_threshold [Float]

            # @see ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection#type
            module Type
              extend ContextDev::Internal::Type::Enum

              SEMANTIC = :semantic

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor#schedule
          class Schedule < ContextDev::Internal::Type::BaseModel
            # @!attribute frequency
            #   Number of units between runs. The resulting interval (frequency × unit) must be
            #   at least 10 minutes and at most 1 year (e.g. minimum 10 when unit is minutes;
            #   maximum 365 when unit is days).
            #
            #   @return [Integer]
            required :frequency, Integer

            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Type]
            required :type,
                     enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Type }

            # @!attribute unit
            #
            #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Unit]
            required :unit,
                     enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Unit }

            # @!method initialize(frequency:, type:, unit:)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule}
            #   for more details.
            #
            #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
            #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
            #   between 10 minutes and 1 year.
            #
            #   @param frequency [Integer] Number of units between runs. The resulting interval (frequency × unit) must be
            #
            #   @param type [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Type]
            #
            #   @param unit [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Unit]

            # @see ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule#type
            module Type
              extend ContextDev::Internal::Type::Enum

              INTERVAL = :interval

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule#unit
            module Unit
              extend ContextDev::Internal::Type::Enum

              MINUTES = :minutes
              HOURS = :hours
              DAYS = :days

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor#status
          module Status
            extend ContextDev::Internal::Type::Enum

            ACTIVE = :active
            PAUSED = :paused
            FAILED = :failed

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor#target
          class Target < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target::Type]
            required :type,
                     enum: -> { ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target::Type }

            # @!attribute url
            #   Root URL to extract structured data from.
            #
            #   @return [String]
            required :url, String

            # @!attribute follow_subdomains
            #
            #   @return [Boolean, nil]
            optional :follow_subdomains, ContextDev::Internal::Type::Boolean

            # @!attribute instructions
            #   Optional natural-language instructions guiding what to extract.
            #
            #   @return [String, nil]
            optional :instructions, String

            # @!attribute max_depth
            #   Optional maximum link depth from the starting URL (0 = only the starting page).
            #
            #   @return [Integer, nil]
            optional :max_depth, Integer

            # @!attribute max_pages
            #   Maximum number of pages to analyze during extraction.
            #
            #   @return [Integer, nil]
            optional :max_pages, Integer

            # @!attribute schema
            #   JSON Schema describing the structured data to extract and watch for changes. If
            #   omitted, a default summary + key-points schema is used.
            #
            #   @return [Hash{Symbol=>Object}, nil]
            optional :schema, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

            # @!method initialize(type:, url:, follow_subdomains: nil, instructions: nil, max_depth: nil, max_pages: nil, schema: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target}
            #   for more details.
            #
            #   @param type [Symbol, ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target::Type]
            #
            #   @param url [String] Root URL to extract structured data from.
            #
            #   @param follow_subdomains [Boolean]
            #
            #   @param instructions [String] Optional natural-language instructions guiding what to extract.
            #
            #   @param max_depth [Integer] Optional maximum link depth from the starting URL (0 = only the starting page).
            #
            #   @param max_pages [Integer] Maximum number of pages to analyze during extraction.
            #
            #   @param schema [Hash{Symbol=>Object}] JSON Schema describing the structured data to extract and watch for changes. If

            # @see ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target#type
            module Type
              extend ContextDev::Internal::Type::Enum

              EXTRACT = :extract

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor#webhook
          class Webhook < ContextDev::Internal::Type::BaseModel
            # @!attribute url
            #   Webhook URL called when a change is detected.
            #
            #   @return [String]
            required :url, String

            response_only do
              # @!attribute secret
              #   Signing secret used to verify webhook authenticity. Each delivery includes an
              #   `X-Context-Signature: t=<unix>,v1=<hmac>` header, where the HMAC is SHA-256 over
              #   `"{t}.{rawRequestBody}"` keyed by this secret. Recompute it with a constant-time
              #   compare and reject stale timestamps to prevent replay. Generated by the API;
              #   cannot be set by clients.
              #
              #   @return [String, nil]
              optional :secret, String
            end

            # @!method initialize(url:, secret: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Webhook}
            #   for more details.
            #
            #   @param url [String] Webhook URL called when a change is detected.
            #
            #   @param secret [String] Signing secret used to verify webhook authenticity. Each delivery includes an `X
          end
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor, ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor, ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor, ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor)]
      end
    end
  end
end
