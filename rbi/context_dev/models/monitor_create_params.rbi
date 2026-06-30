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

      # Discriminated union describing how changes are detected.
      sig do
        returns(
          T.any(
            ContextDev::MonitorCreateParams::ChangeDetection::Exact,
            ContextDev::MonitorCreateParams::ChangeDetection::Semantic
          )
        )
      end
      attr_accessor :change_detection

      sig { returns(String) }
      attr_accessor :name

      # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
      # every 6 hours or every 2 days. The total interval (frequency × unit) must be
      # between 10 minutes and 1 year.
      sig { returns(ContextDev::MonitorCreateParams::Schedule) }
      attr_reader :schedule

      sig do
        params(schedule: ContextDev::MonitorCreateParams::Schedule::OrHash).void
      end
      attr_writer :schedule

      # Discriminated union describing what the monitor watches.
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

      # Top-level monitor category. Always `web` today; the concrete behavior is
      # described by `target` and `change_detection`.
      sig do
        returns(T.nilable(ContextDev::MonitorCreateParams::Mode::OrSymbol))
      end
      attr_reader :mode

      sig { params(mode: ContextDev::MonitorCreateParams::Mode::OrSymbol).void }
      attr_writer :mode

      # User-defined tags for grouping and filtering monitors and their changes.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

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
          change_detection:
            T.any(
              ContextDev::MonitorCreateParams::ChangeDetection::Exact::OrHash,
              ContextDev::MonitorCreateParams::ChangeDetection::Semantic::OrHash
            ),
          name: String,
          schedule: ContextDev::MonitorCreateParams::Schedule::OrHash,
          target:
            T.any(
              ContextDev::MonitorCreateParams::Target::Page::OrHash,
              ContextDev::MonitorCreateParams::Target::Sitemap::OrHash,
              ContextDev::MonitorCreateParams::Target::Extract::OrHash
            ),
          mode: ContextDev::MonitorCreateParams::Mode::OrSymbol,
          tags: T::Array[String],
          webhook: T.nilable(ContextDev::MonitorCreateParams::Webhook::OrHash),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Discriminated union describing how changes are detected.
        change_detection:,
        name:,
        # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        # every 6 hours or every 2 days. The total interval (frequency × unit) must be
        # between 10 minutes and 1 year.
        schedule:,
        # Discriminated union describing what the monitor watches.
        target:,
        # Top-level monitor category. Always `web` today; the concrete behavior is
        # described by `target` and `change_detection`.
        mode: nil,
        # User-defined tags for grouping and filtering monitors and their changes.
        tags: nil,
        webhook: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            change_detection:
              T.any(
                ContextDev::MonitorCreateParams::ChangeDetection::Exact,
                ContextDev::MonitorCreateParams::ChangeDetection::Semantic
              ),
            name: String,
            schedule: ContextDev::MonitorCreateParams::Schedule,
            target:
              T.any(
                ContextDev::MonitorCreateParams::Target::Page,
                ContextDev::MonitorCreateParams::Target::Sitemap,
                ContextDev::MonitorCreateParams::Target::Extract
              ),
            mode: ContextDev::MonitorCreateParams::Mode::OrSymbol,
            tags: T::Array[String],
            webhook: T.nilable(ContextDev::MonitorCreateParams::Webhook),
            request_options: ContextDev::RequestOptions
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
                ContextDev::MonitorCreateParams::ChangeDetection::Semantic,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :query

          sig { returns(Symbol) }
          attr_accessor :type

          sig { returns(T.nilable(Float)) }
          attr_reader :confidence_threshold

          sig { params(confidence_threshold: Float).void }
          attr_writer :confidence_threshold

          # Detect meaning-level changes that match a natural language query.
          sig do
            params(
              query: String,
              confidence_threshold: Float,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(query:, confidence_threshold: nil, type: :semantic)
          end

          sig do
            override.returns(
              { query: String, type: Symbol, confidence_threshold: Float }
            )
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

        sig do
          returns(ContextDev::MonitorCreateParams::Schedule::Type::OrSymbol)
        end
        attr_accessor :type

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
          type:,
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

      # Discriminated union describing what the monitor watches.
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
                ContextDev::MonitorCreateParams::Target::Sitemap,
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

          sig { returns(T.nilable(Integer)) }
          attr_reader :max_urls

          sig { params(max_urls: Integer).void }
          attr_writer :max_urls

          # Watch a sitemap for URL additions and removals.
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
                ContextDev::MonitorCreateParams::Target::Extract,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # Root URL to extract structured data from.
          sig { returns(String) }
          attr_accessor :url

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :follow_subdomains

          sig { params(follow_subdomains: T::Boolean).void }
          attr_writer :follow_subdomains

          # Optional natural-language instructions guiding what to extract.
          sig { returns(T.nilable(String)) }
          attr_reader :instructions

          sig { params(instructions: String).void }
          attr_writer :instructions

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
              url: String,
              follow_subdomains: T::Boolean,
              instructions: String,
              max_depth: Integer,
              max_pages: Integer,
              schema: T::Hash[Symbol, T.anything],
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Root URL to extract structured data from.
            url:,
            follow_subdomains: nil,
            # Optional natural-language instructions guiding what to extract.
            instructions: nil,
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
                type: Symbol,
                url: String,
                follow_subdomains: T::Boolean,
                instructions: String,
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

      # Top-level monitor category. Always `web` today; the concrete behavior is
      # described by `target` and `change_detection`.
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

      class Webhook < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::MonitorCreateParams::Webhook,
              ContextDev::Internal::AnyHash
            )
          end

        # Webhook URL called when a change is detected.
        sig { returns(String) }
        attr_accessor :url

        sig { params(url: String).returns(T.attached_class) }
        def self.new(
          # Webhook URL called when a change is detected.
          url:
        )
        end

        sig { override.returns({ url: String, secret: String }) }
        def to_hash
        end
      end
    end
  end
end
