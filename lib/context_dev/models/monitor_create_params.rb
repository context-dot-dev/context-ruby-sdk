# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#create
    class MonitorCreateParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute change_detection
      #   Discriminated union describing how changes are detected.
      #
      #   @return [ContextDev::Models::MonitorCreateParams::ChangeDetection::Exact, ContextDev::Models::MonitorCreateParams::ChangeDetection::Semantic]
      required :change_detection, union: -> { ContextDev::MonitorCreateParams::ChangeDetection }

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute schedule
      #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
      #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
      #   between 10 minutes and 1 year.
      #
      #   @return [ContextDev::Models::MonitorCreateParams::Schedule]
      required :schedule, -> { ContextDev::MonitorCreateParams::Schedule }

      # @!attribute target
      #   Discriminated union describing what the monitor watches.
      #
      #   @return [ContextDev::Models::MonitorCreateParams::Target::Page, ContextDev::Models::MonitorCreateParams::Target::Sitemap, ContextDev::Models::MonitorCreateParams::Target::Extract]
      required :target, union: -> { ContextDev::MonitorCreateParams::Target }

      # @!attribute mode
      #   Top-level monitor category. Always `web` today; the concrete behavior is
      #   described by `target` and `change_detection`.
      #
      #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Mode, nil]
      optional :mode, enum: -> { ContextDev::MonitorCreateParams::Mode }

      # @!attribute tags
      #   User-defined tags for grouping and filtering monitors and their changes.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute webhook
      #
      #   @return [ContextDev::Models::MonitorCreateParams::Webhook, nil]
      optional :webhook, -> { ContextDev::MonitorCreateParams::Webhook }, nil?: true

      # @!method initialize(change_detection:, name:, schedule:, target:, mode: nil, tags: nil, webhook: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorCreateParams} for more details.
      #
      #   @param change_detection [ContextDev::Models::MonitorCreateParams::ChangeDetection::Exact, ContextDev::Models::MonitorCreateParams::ChangeDetection::Semantic] Discriminated union describing how changes are detected.
      #
      #   @param name [String]
      #
      #   @param schedule [ContextDev::Models::MonitorCreateParams::Schedule] Run the monitor on a fixed interval defined by a frequency and a unit, e.g. ever
      #
      #   @param target [ContextDev::Models::MonitorCreateParams::Target::Page, ContextDev::Models::MonitorCreateParams::Target::Sitemap, ContextDev::Models::MonitorCreateParams::Target::Extract] Discriminated union describing what the monitor watches.
      #
      #   @param mode [Symbol, ContextDev::Models::MonitorCreateParams::Mode] Top-level monitor category. Always `web` today; the concrete behavior is describ
      #
      #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.
      #
      #   @param webhook [ContextDev::Models::MonitorCreateParams::Webhook, nil]
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Discriminated union describing how changes are detected.
      module ChangeDetection
        extend ContextDev::Internal::Type::Union

        discriminator :type

        # Detect exact changes. For page targets, this means visible text diffs. For sitemap targets, this means URL additions and removals.
        variant :exact, -> { ContextDev::MonitorCreateParams::ChangeDetection::Exact }

        # Detect meaning-level changes that match a natural language query.
        variant :semantic, -> { ContextDev::MonitorCreateParams::ChangeDetection::Semantic }

        class Exact < ContextDev::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :exact]
          required :type, const: :exact

          # @!method initialize(type: :exact)
          #   Detect exact changes. For page targets, this means visible text diffs. For
          #   sitemap targets, this means URL additions and removals.
          #
          #   @param type [Symbol, :exact]
        end

        class Semantic < ContextDev::Internal::Type::BaseModel
          # @!attribute query
          #
          #   @return [String]
          required :query, String

          # @!attribute type
          #
          #   @return [Symbol, :semantic]
          required :type, const: :semantic

          # @!attribute confidence_threshold
          #
          #   @return [Float, nil]
          optional :confidence_threshold, Float

          # @!method initialize(query:, confidence_threshold: nil, type: :semantic)
          #   Detect meaning-level changes that match a natural language query.
          #
          #   @param query [String]
          #   @param confidence_threshold [Float]
          #   @param type [Symbol, :semantic]
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::MonitorCreateParams::ChangeDetection::Exact, ContextDev::Models::MonitorCreateParams::ChangeDetection::Semantic)]
      end

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
        #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Schedule::Type]
        required :type, enum: -> { ContextDev::MonitorCreateParams::Schedule::Type }

        # @!attribute unit
        #
        #   @return [Symbol, ContextDev::Models::MonitorCreateParams::Schedule::Unit]
        required :unit, enum: -> { ContextDev::MonitorCreateParams::Schedule::Unit }

        # @!method initialize(frequency:, type:, unit:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorCreateParams::Schedule} for more details.
        #
        #   Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        #   every 6 hours or every 2 days. The total interval (frequency × unit) must be
        #   between 10 minutes and 1 year.
        #
        #   @param frequency [Integer] Number of units between runs. The resulting interval (frequency × unit) must be
        #
        #   @param type [Symbol, ContextDev::Models::MonitorCreateParams::Schedule::Type]
        #
        #   @param unit [Symbol, ContextDev::Models::MonitorCreateParams::Schedule::Unit]

        # @see ContextDev::Models::MonitorCreateParams::Schedule#type
        module Type
          extend ContextDev::Internal::Type::Enum

          INTERVAL = :interval

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::MonitorCreateParams::Schedule#unit
        module Unit
          extend ContextDev::Internal::Type::Enum

          MINUTES = :minutes
          HOURS = :hours
          DAYS = :days

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # Discriminated union describing what the monitor watches.
      module Target
        extend ContextDev::Internal::Type::Union

        discriminator :type

        # Watch a single web page.
        variant :page, -> { ContextDev::MonitorCreateParams::Target::Page }

        # Watch a sitemap for URL additions and removals. Crawled URLs are normalized (lowercased host, no trailing slash/fragment) and scoped to the monitored site and its subdomains before comparison. A new URL set must be observed on two consecutive runs before a change is reported, suppressing one-run crawl flaps.
        variant :sitemap, -> { ContextDev::MonitorCreateParams::Target::Sitemap }

        # Watch a site's extracted structured data.
        variant :extract, -> { ContextDev::MonitorCreateParams::Target::Extract }

        class Page < ContextDev::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :page]
          required :type, const: :page

          # @!attribute url
          #
          #   @return [String]
          required :url, String

          # @!attribute normalize_whitespace
          #   Normalize whitespace before comparing or analyzing text.
          #
          #   @return [Boolean, nil]
          optional :normalize_whitespace, ContextDev::Internal::Type::Boolean

          # @!method initialize(url:, normalize_whitespace: nil, type: :page)
          #   Watch a single web page.
          #
          #   @param url [String]
          #
          #   @param normalize_whitespace [Boolean] Normalize whitespace before comparing or analyzing text.
          #
          #   @param type [Symbol, :page]
        end

        class Sitemap < ContextDev::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :sitemap]
          required :type, const: :sitemap

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
          #   Maximum number of sitemap URLs to track (capped at 10,000).
          #
          #   @return [Integer, nil]
          optional :max_urls, Integer

          # @!method initialize(url:, exclude: nil, include: nil, max_urls: nil, type: :sitemap)
          #   Watch a sitemap for URL additions and removals. Crawled URLs are normalized
          #   (lowercased host, no trailing slash/fragment) and scoped to the monitored site
          #   and its subdomains before comparison. A new URL set must be observed on two
          #   consecutive runs before a change is reported, suppressing one-run crawl flaps.
          #
          #   @param url [String] Sitemap URL to monitor.
          #
          #   @param exclude [Array<String>] URL path patterns to exclude.
          #
          #   @param include [Array<String>] URL path patterns to include.
          #
          #   @param max_urls [Integer] Maximum number of sitemap URLs to track (capped at 10,000).
          #
          #   @param type [Symbol, :sitemap]
        end

        class Extract < ContextDev::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :extract]
          required :type, const: :extract

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

          # @!method initialize(url:, follow_subdomains: nil, instructions: nil, max_depth: nil, max_pages: nil, schema: nil, type: :extract)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorCreateParams::Target::Extract} for more details.
          #
          #   Watch a site's extracted structured data.
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
          #
          #   @param type [Symbol, :extract]
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::MonitorCreateParams::Target::Page, ContextDev::Models::MonitorCreateParams::Target::Sitemap, ContextDev::Models::MonitorCreateParams::Target::Extract)]
      end

      # Top-level monitor category. Always `web` today; the concrete behavior is
      # described by `target` and `change_detection`.
      module Mode
        extend ContextDev::Internal::Type::Enum

        WEB = :web

        # @!method self.values
        #   @return [Array<Symbol>]
      end

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
  end
end
