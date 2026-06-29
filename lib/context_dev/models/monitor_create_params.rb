# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#create
    class MonitorCreateParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute body
      #   Union of supported monitor creation shapes. Supported combinations are:
      #   `page + exact`, `sitemap + exact`, `page + semantic`, and `extract + semantic`.
      #
      #   @return [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest]
      required :body, union: -> { ContextDev::MonitorCreateParams::Body }

      # @!method initialize(body:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorCreateParams} for more details.
      #
      #   @param body [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest] Union of supported monitor creation shapes. Supported combinations are: `page +
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Union of supported monitor creation shapes. Supported combinations are:
      # `page + exact`, `sitemap + exact`, `page + semantic`, and `extract + semantic`.
      module Body
        extend ContextDev::Internal::Type::Union

        # Monitor a single page for exact visible text changes.
        variant -> { ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest }

        # Monitor a sitemap for exact URL additions and removals.
        variant -> { ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest }

        # Monitor a single page for semantic changes described by a natural language query.
        variant -> { ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest }

        # Monitor a website's extracted structured data for semantic changes described by a natural language query.
        variant -> { ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest }

        class MonitorsCreatePageExactMonitorRequest < ContextDev::Internal::Type::BaseModel
          # @!attribute change_detection
          #   Detect exact changes. For page targets, this means visible text diffs. For
          #   sitemap targets, this means URL additions and removals.
          #
          #   @return [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection]
          required :change_detection,
                   -> { ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection }

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute schedule
          #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
          #   between 10 minutes and 1 year.
          #
          #   @return [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule]
          required :schedule,
                   -> { ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule }

          # @!attribute target
          #
          #   @return [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target]
          required :target,
                   -> { ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target }

          # @!attribute tags
          #   User-defined tags for grouping and filtering monitors and their changes.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute webhook
          #
          #   @return [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Webhook, nil]
          optional :webhook,
                   -> {
                     ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Webhook
                   },
                   nil?: true

          # @!method initialize(change_detection:, name:, schedule:, target:, tags: nil, webhook: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest}
          #   for more details.
          #
          #   Monitor a single page for exact visible text changes.
          #
          #   @param change_detection [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection] Detect exact changes. For page targets, this means visible text diffs. For sitem
          #
          #   @param name [String]
          #
          #   @param schedule [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule] Run the monitor on a fixed interval defined by a frequency and a unit, e.g. ever
          #
          #   @param target [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target]
          #
          #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.
          #
          #   @param webhook [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Webhook, nil]

          # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest#change_detection
          class ChangeDetection < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection::Type]
            required :type,
                     enum: -> { ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection::Type }

            # @!method initialize(type:)
            #   Detect exact changes. For page targets, this means visible text diffs. For
            #   sitemap targets, this means URL additions and removals.
            #
            #   @param type [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection::Type]

            # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection#type
            module Type
              extend ContextDev::Internal::Type::Enum

              EXACT = :exact

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest#schedule
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
            #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Type]
            required :type,
                     enum: -> { ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Type }

            # @!attribute unit
            #
            #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Unit]
            required :unit,
                     enum: -> { ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Unit }

            # @!method initialize(frequency:, type:, unit:)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule}
            #   for more details.
            #
            #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
            #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
            #   between 10 minutes and 1 year.
            #
            #   @param frequency [Integer] Number of units between runs. The resulting interval (frequency × unit) must be
            #
            #   @param type [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Type]
            #
            #   @param unit [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Unit]

            # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule#type
            module Type
              extend ContextDev::Internal::Type::Enum

              INTERVAL = :interval

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule#unit
            module Unit
              extend ContextDev::Internal::Type::Enum

              MINUTES = :minutes
              HOURS = :hours
              DAYS = :days

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest#target
          class Target < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target::Type]
            required :type,
                     enum: -> { ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target::Type }

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
            #   @param type [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target::Type]
            #
            #   @param url [String]
            #
            #   @param normalize_whitespace [Boolean] Normalize whitespace before comparing or analyzing text.

            # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target#type
            module Type
              extend ContextDev::Internal::Type::Enum

              PAGE = :page

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest#webhook
          class Webhook < ContextDev::Internal::Type::BaseModel
            # @!attribute url
            #   Webhook URL called when a change is detected.
            #
            #   @return [String]
            required :url, String

            # @!method initialize(url:)
            #   @param url [String] Webhook URL called when a change is detected.
          end
        end

        class MonitorsCreateSitemapExactMonitorRequest < ContextDev::Internal::Type::BaseModel
          # @!attribute change_detection
          #   Detect exact changes. For page targets, this means visible text diffs. For
          #   sitemap targets, this means URL additions and removals.
          #
          #   @return [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection]
          required :change_detection,
                   -> { ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection }

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute schedule
          #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
          #   between 10 minutes and 1 year.
          #
          #   @return [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule]
          required :schedule,
                   -> { ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule }

          # @!attribute target
          #
          #   @return [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target]
          required :target,
                   -> { ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target }

          # @!attribute tags
          #   User-defined tags for grouping and filtering monitors and their changes.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute webhook
          #
          #   @return [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Webhook, nil]
          optional :webhook,
                   -> {
                     ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Webhook
                   },
                   nil?: true

          # @!method initialize(change_detection:, name:, schedule:, target:, tags: nil, webhook: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest}
          #   for more details.
          #
          #   Monitor a sitemap for exact URL additions and removals.
          #
          #   @param change_detection [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection] Detect exact changes. For page targets, this means visible text diffs. For sitem
          #
          #   @param name [String]
          #
          #   @param schedule [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule] Run the monitor on a fixed interval defined by a frequency and a unit, e.g. ever
          #
          #   @param target [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target]
          #
          #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.
          #
          #   @param webhook [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Webhook, nil]

          # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest#change_detection
          class ChangeDetection < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection::Type]
            required :type,
                     enum: -> { ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection::Type }

            # @!method initialize(type:)
            #   Detect exact changes. For page targets, this means visible text diffs. For
            #   sitemap targets, this means URL additions and removals.
            #
            #   @param type [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection::Type]

            # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection#type
            module Type
              extend ContextDev::Internal::Type::Enum

              EXACT = :exact

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest#schedule
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
            #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Type]
            required :type,
                     enum: -> { ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Type }

            # @!attribute unit
            #
            #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Unit]
            required :unit,
                     enum: -> { ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Unit }

            # @!method initialize(frequency:, type:, unit:)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule}
            #   for more details.
            #
            #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
            #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
            #   between 10 minutes and 1 year.
            #
            #   @param frequency [Integer] Number of units between runs. The resulting interval (frequency × unit) must be
            #
            #   @param type [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Type]
            #
            #   @param unit [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Unit]

            # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule#type
            module Type
              extend ContextDev::Internal::Type::Enum

              INTERVAL = :interval

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule#unit
            module Unit
              extend ContextDev::Internal::Type::Enum

              MINUTES = :minutes
              HOURS = :hours
              DAYS = :days

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest#target
          class Target < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target::Type]
            required :type,
                     enum: -> { ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target::Type }

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
            #   @param type [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target::Type]
            #
            #   @param url [String] Sitemap URL to monitor.
            #
            #   @param exclude [Array<String>] URL path patterns to exclude.
            #
            #   @param include [Array<String>] URL path patterns to include.
            #
            #   @param max_urls [Integer]

            # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target#type
            module Type
              extend ContextDev::Internal::Type::Enum

              SITEMAP = :sitemap

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest#webhook
          class Webhook < ContextDev::Internal::Type::BaseModel
            # @!attribute url
            #   Webhook URL called when a change is detected.
            #
            #   @return [String]
            required :url, String

            # @!method initialize(url:)
            #   @param url [String] Webhook URL called when a change is detected.
          end
        end

        class MonitorsCreatePageSemanticMonitorRequest < ContextDev::Internal::Type::BaseModel
          # @!attribute change_detection
          #   Detect meaning-level changes that match a natural language query.
          #
          #   @return [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection]
          required :change_detection,
                   -> { ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection }

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute schedule
          #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
          #   between 10 minutes and 1 year.
          #
          #   @return [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule]
          required :schedule,
                   -> { ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule }

          # @!attribute target
          #
          #   @return [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target]
          required :target,
                   -> { ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target }

          # @!attribute tags
          #   User-defined tags for grouping and filtering monitors and their changes.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute webhook
          #
          #   @return [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Webhook, nil]
          optional :webhook,
                   -> {
                     ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Webhook
                   },
                   nil?: true

          # @!method initialize(change_detection:, name:, schedule:, target:, tags: nil, webhook: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest}
          #   for more details.
          #
          #   Monitor a single page for semantic changes described by a natural language
          #   query.
          #
          #   @param change_detection [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection] Detect meaning-level changes that match a natural language query.
          #
          #   @param name [String]
          #
          #   @param schedule [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule] Run the monitor on a fixed interval defined by a frequency and a unit, e.g. ever
          #
          #   @param target [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target]
          #
          #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.
          #
          #   @param webhook [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Webhook, nil]

          # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest#change_detection
          class ChangeDetection < ContextDev::Internal::Type::BaseModel
            # @!attribute query
            #
            #   @return [String]
            required :query, String

            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection::Type]
            required :type,
                     enum: -> { ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection::Type }

            # @!attribute confidence_threshold
            #
            #   @return [Float, nil]
            optional :confidence_threshold, Float

            # @!method initialize(query:, type:, confidence_threshold: nil)
            #   Detect meaning-level changes that match a natural language query.
            #
            #   @param query [String]
            #   @param type [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection::Type]
            #   @param confidence_threshold [Float]

            # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection#type
            module Type
              extend ContextDev::Internal::Type::Enum

              SEMANTIC = :semantic

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest#schedule
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
            #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Type]
            required :type,
                     enum: -> { ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Type }

            # @!attribute unit
            #
            #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Unit]
            required :unit,
                     enum: -> { ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Unit }

            # @!method initialize(frequency:, type:, unit:)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule}
            #   for more details.
            #
            #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
            #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
            #   between 10 minutes and 1 year.
            #
            #   @param frequency [Integer] Number of units between runs. The resulting interval (frequency × unit) must be
            #
            #   @param type [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Type]
            #
            #   @param unit [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Unit]

            # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule#type
            module Type
              extend ContextDev::Internal::Type::Enum

              INTERVAL = :interval

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule#unit
            module Unit
              extend ContextDev::Internal::Type::Enum

              MINUTES = :minutes
              HOURS = :hours
              DAYS = :days

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest#target
          class Target < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target::Type]
            required :type,
                     enum: -> { ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target::Type }

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
            #   @param type [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target::Type]
            #
            #   @param url [String]
            #
            #   @param normalize_whitespace [Boolean] Normalize whitespace before comparing or analyzing text.

            # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target#type
            module Type
              extend ContextDev::Internal::Type::Enum

              PAGE = :page

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest#webhook
          class Webhook < ContextDev::Internal::Type::BaseModel
            # @!attribute url
            #   Webhook URL called when a change is detected.
            #
            #   @return [String]
            required :url, String

            # @!method initialize(url:)
            #   @param url [String] Webhook URL called when a change is detected.
          end
        end

        class MonitorsCreateExtractSemanticMonitorRequest < ContextDev::Internal::Type::BaseModel
          # @!attribute change_detection
          #   Detect meaning-level changes that match a natural language query.
          #
          #   @return [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection]
          required :change_detection,
                   -> { ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection }

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute schedule
          #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
          #   between 10 minutes and 1 year.
          #
          #   @return [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule]
          required :schedule,
                   -> { ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule }

          # @!attribute target
          #
          #   @return [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target]
          required :target,
                   -> { ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target }

          # @!attribute tags
          #   User-defined tags for grouping and filtering monitors and their changes.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute webhook
          #
          #   @return [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Webhook, nil]
          optional :webhook,
                   -> {
                     ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Webhook
                   },
                   nil?: true

          # @!method initialize(change_detection:, name:, schedule:, target:, tags: nil, webhook: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest}
          #   for more details.
          #
          #   Monitor a website's extracted structured data for semantic changes described by
          #   a natural language query.
          #
          #   @param change_detection [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection] Detect meaning-level changes that match a natural language query.
          #
          #   @param name [String]
          #
          #   @param schedule [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule] Run the monitor on a fixed interval defined by a frequency and a unit, e.g. ever
          #
          #   @param target [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target]
          #
          #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.
          #
          #   @param webhook [ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Webhook, nil]

          # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest#change_detection
          class ChangeDetection < ContextDev::Internal::Type::BaseModel
            # @!attribute query
            #
            #   @return [String]
            required :query, String

            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection::Type]
            required :type,
                     enum: -> { ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection::Type }

            # @!attribute confidence_threshold
            #
            #   @return [Float, nil]
            optional :confidence_threshold, Float

            # @!method initialize(query:, type:, confidence_threshold: nil)
            #   Detect meaning-level changes that match a natural language query.
            #
            #   @param query [String]
            #   @param type [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection::Type]
            #   @param confidence_threshold [Float]

            # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection#type
            module Type
              extend ContextDev::Internal::Type::Enum

              SEMANTIC = :semantic

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest#schedule
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
            #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Type]
            required :type,
                     enum: -> { ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Type }

            # @!attribute unit
            #
            #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Unit]
            required :unit,
                     enum: -> { ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Unit }

            # @!method initialize(frequency:, type:, unit:)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule}
            #   for more details.
            #
            #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
            #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
            #   between 10 minutes and 1 year.
            #
            #   @param frequency [Integer] Number of units between runs. The resulting interval (frequency × unit) must be
            #
            #   @param type [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Type]
            #
            #   @param unit [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Unit]

            # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule#type
            module Type
              extend ContextDev::Internal::Type::Enum

              INTERVAL = :interval

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule#unit
            module Unit
              extend ContextDev::Internal::Type::Enum

              MINUTES = :minutes
              HOURS = :hours
              DAYS = :days

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest#target
          class Target < ContextDev::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target::Type]
            required :type,
                     enum: -> { ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target::Type }

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
            #   {ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target}
            #   for more details.
            #
            #   @param type [Symbol, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target::Type]
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

            # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target#type
            module Type
              extend ContextDev::Internal::Type::Enum

              EXTRACT = :extract

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest#webhook
          class Webhook < ContextDev::Internal::Type::BaseModel
            # @!attribute url
            #   Webhook URL called when a change is detected.
            #
            #   @return [String]
            required :url, String

            # @!method initialize(url:)
            #   @param url [String] Webhook URL called when a change is detected.
          end
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest, ContextDev::Models::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest)]
      end
    end
  end
end
