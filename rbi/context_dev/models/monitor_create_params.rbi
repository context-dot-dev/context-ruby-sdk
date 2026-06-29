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

      # Union of supported monitor creation shapes. Supported combinations are:
      # `page + exact`, `sitemap + exact`, `page + semantic`, and `extract + semantic`.
      sig do
        returns(
          T.any(
            ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest,
            ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest,
            ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest,
            ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest
          )
        )
      end
      attr_accessor :body

      sig do
        params(
          body:
            T.any(
              ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::OrHash,
              ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::OrHash,
              ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::OrHash,
              ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::OrHash
            ),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Union of supported monitor creation shapes. Supported combinations are:
        # `page + exact`, `sitemap + exact`, `page + semantic`, and `extract + semantic`.
        body:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            body:
              T.any(
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest,
                ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest,
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest,
                ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest
              ),
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Union of supported monitor creation shapes. Supported combinations are:
      # `page + exact`, `sitemap + exact`, `page + semantic`, and `extract + semantic`.
      module Body
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest,
              ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest,
              ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest,
              ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest
            )
          end

        class MonitorsCreatePageExactMonitorRequest < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest,
                ContextDev::Internal::AnyHash
              )
            end

          # Detect exact changes. For page targets, this means visible text diffs. For
          # sitemap targets, this means URL additions and removals.
          sig do
            returns(
              ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection
            )
          end
          attr_reader :change_detection

          sig do
            params(
              change_detection:
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection::OrHash
            ).void
          end
          attr_writer :change_detection

          sig { returns(String) }
          attr_accessor :name

          # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          # every 6 hours or every 2 days. The total interval (frequency × unit) must be
          # between 10 minutes and 1 year.
          sig do
            returns(
              ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule
            )
          end
          attr_reader :schedule

          sig do
            params(
              schedule:
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::OrHash
            ).void
          end
          attr_writer :schedule

          sig do
            returns(
              ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target
            )
          end
          attr_reader :target

          sig do
            params(
              target:
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target::OrHash
            ).void
          end
          attr_writer :target

          # User-defined tags for grouping and filtering monitors and their changes.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :tags

          sig { params(tags: T::Array[String]).void }
          attr_writer :tags

          sig do
            returns(
              T.nilable(
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Webhook
              )
            )
          end
          attr_reader :webhook

          sig do
            params(
              webhook:
                T.nilable(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Webhook::OrHash
                )
            ).void
          end
          attr_writer :webhook

          # Monitor a single page for exact visible text changes.
          sig do
            params(
              change_detection:
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection::OrHash,
              name: String,
              schedule:
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::OrHash,
              target:
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target::OrHash,
              tags: T::Array[String],
              webhook:
                T.nilable(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Webhook::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Detect exact changes. For page targets, this means visible text diffs. For
            # sitemap targets, this means URL additions and removals.
            change_detection:,
            name:,
            # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
            # every 6 hours or every 2 days. The total interval (frequency × unit) must be
            # between 10 minutes and 1 year.
            schedule:,
            target:,
            # User-defined tags for grouping and filtering monitors and their changes.
            tags: nil,
            webhook: nil
          )
          end

          sig do
            override.returns(
              {
                change_detection:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection,
                name: String,
                schedule:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule,
                target:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target,
                tags: T::Array[String],
                webhook:
                  T.nilable(
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Webhook
                  )
              }
            )
          end
          def to_hash
          end

          class ChangeDetection < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection,
                  ContextDev::Internal::AnyHash
                )
              end

            sig do
              returns(
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection::Type::OrSymbol
              )
            end
            attr_accessor :type

            # Detect exact changes. For page targets, this means visible text diffs. For
            # sitemap targets, this means URL additions and removals.
            sig do
              params(
                type:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(type:)
            end

            sig do
              override.returns(
                {
                  type:
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection::Type::OrSymbol
                }
              )
            end
            def to_hash
            end

            module Type
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              EXACT =
                T.let(
                  :exact,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::ChangeDetection::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Schedule < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule,
                  ContextDev::Internal::AnyHash
                )
              end

            # Number of units between runs. The resulting interval (frequency × unit) must be
            # at least 10 minutes and at most 1 year (e.g. minimum 10 when unit is minutes;
            # maximum 365 when unit is days).
            sig { returns(Integer) }
            attr_accessor :frequency

            sig do
              returns(
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Type::OrSymbol
              )
            end
            attr_accessor :type

            sig do
              returns(
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Unit::OrSymbol
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
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Type::OrSymbol,
                unit:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Unit::OrSymbol
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
                  type:
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Type::OrSymbol,
                  unit:
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Unit::OrSymbol
                }
              )
            end
            def to_hash
            end

            module Type
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              INTERVAL =
                T.let(
                  :interval,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Type::TaggedSymbol
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
                  T.all(
                    Symbol,
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Unit
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MINUTES =
                T.let(
                  :minutes,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Unit::TaggedSymbol
                )
              HOURS =
                T.let(
                  :hours,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Unit::TaggedSymbol
                )
              DAYS =
                T.let(
                  :days,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Unit::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Schedule::Unit::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Target < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target,
                  ContextDev::Internal::AnyHash
                )
              end

            sig do
              returns(
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target::Type::OrSymbol
              )
            end
            attr_accessor :type

            sig { returns(String) }
            attr_accessor :url

            # Normalize whitespace before comparing or analyzing text.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :normalize_whitespace

            sig { params(normalize_whitespace: T::Boolean).void }
            attr_writer :normalize_whitespace

            sig do
              params(
                type:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target::Type::OrSymbol,
                url: String,
                normalize_whitespace: T::Boolean
              ).returns(T.attached_class)
            end
            def self.new(
              type:,
              url:,
              # Normalize whitespace before comparing or analyzing text.
              normalize_whitespace: nil
            )
            end

            sig do
              override.returns(
                {
                  type:
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target::Type::OrSymbol,
                  url: String,
                  normalize_whitespace: T::Boolean
                }
              )
            end
            def to_hash
            end

            module Type
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              PAGE =
                T.let(
                  :page,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Target::Type::TaggedSymbol
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
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageExactMonitorRequest::Webhook,
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

        class MonitorsCreateSitemapExactMonitorRequest < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest,
                ContextDev::Internal::AnyHash
              )
            end

          # Detect exact changes. For page targets, this means visible text diffs. For
          # sitemap targets, this means URL additions and removals.
          sig do
            returns(
              ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection
            )
          end
          attr_reader :change_detection

          sig do
            params(
              change_detection:
                ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection::OrHash
            ).void
          end
          attr_writer :change_detection

          sig { returns(String) }
          attr_accessor :name

          # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          # every 6 hours or every 2 days. The total interval (frequency × unit) must be
          # between 10 minutes and 1 year.
          sig do
            returns(
              ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule
            )
          end
          attr_reader :schedule

          sig do
            params(
              schedule:
                ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::OrHash
            ).void
          end
          attr_writer :schedule

          sig do
            returns(
              ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target
            )
          end
          attr_reader :target

          sig do
            params(
              target:
                ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target::OrHash
            ).void
          end
          attr_writer :target

          # User-defined tags for grouping and filtering monitors and their changes.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :tags

          sig { params(tags: T::Array[String]).void }
          attr_writer :tags

          sig do
            returns(
              T.nilable(
                ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Webhook
              )
            )
          end
          attr_reader :webhook

          sig do
            params(
              webhook:
                T.nilable(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Webhook::OrHash
                )
            ).void
          end
          attr_writer :webhook

          # Monitor a sitemap for exact URL additions and removals.
          sig do
            params(
              change_detection:
                ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection::OrHash,
              name: String,
              schedule:
                ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::OrHash,
              target:
                ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target::OrHash,
              tags: T::Array[String],
              webhook:
                T.nilable(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Webhook::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Detect exact changes. For page targets, this means visible text diffs. For
            # sitemap targets, this means URL additions and removals.
            change_detection:,
            name:,
            # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
            # every 6 hours or every 2 days. The total interval (frequency × unit) must be
            # between 10 minutes and 1 year.
            schedule:,
            target:,
            # User-defined tags for grouping and filtering monitors and their changes.
            tags: nil,
            webhook: nil
          )
          end

          sig do
            override.returns(
              {
                change_detection:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection,
                name: String,
                schedule:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule,
                target:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target,
                tags: T::Array[String],
                webhook:
                  T.nilable(
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Webhook
                  )
              }
            )
          end
          def to_hash
          end

          class ChangeDetection < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection,
                  ContextDev::Internal::AnyHash
                )
              end

            sig do
              returns(
                ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection::Type::OrSymbol
              )
            end
            attr_accessor :type

            # Detect exact changes. For page targets, this means visible text diffs. For
            # sitemap targets, this means URL additions and removals.
            sig do
              params(
                type:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(type:)
            end

            sig do
              override.returns(
                {
                  type:
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection::Type::OrSymbol
                }
              )
            end
            def to_hash
            end

            module Type
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              EXACT =
                T.let(
                  :exact,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::ChangeDetection::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Schedule < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule,
                  ContextDev::Internal::AnyHash
                )
              end

            # Number of units between runs. The resulting interval (frequency × unit) must be
            # at least 10 minutes and at most 1 year (e.g. minimum 10 when unit is minutes;
            # maximum 365 when unit is days).
            sig { returns(Integer) }
            attr_accessor :frequency

            sig do
              returns(
                ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Type::OrSymbol
              )
            end
            attr_accessor :type

            sig do
              returns(
                ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Unit::OrSymbol
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
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Type::OrSymbol,
                unit:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Unit::OrSymbol
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
                  type:
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Type::OrSymbol,
                  unit:
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Unit::OrSymbol
                }
              )
            end
            def to_hash
            end

            module Type
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              INTERVAL =
                T.let(
                  :interval,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Type::TaggedSymbol
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
                  T.all(
                    Symbol,
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Unit
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MINUTES =
                T.let(
                  :minutes,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Unit::TaggedSymbol
                )
              HOURS =
                T.let(
                  :hours,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Unit::TaggedSymbol
                )
              DAYS =
                T.let(
                  :days,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Unit::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Schedule::Unit::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Target < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target,
                  ContextDev::Internal::AnyHash
                )
              end

            sig do
              returns(
                ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target::Type::OrSymbol
              )
            end
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

            sig do
              params(
                type:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target::Type::OrSymbol,
                url: String,
                exclude: T::Array[String],
                include: T::Array[String],
                max_urls: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              type:,
              # Sitemap URL to monitor.
              url:,
              # URL path patterns to exclude.
              exclude: nil,
              # URL path patterns to include.
              include: nil,
              max_urls: nil
            )
            end

            sig do
              override.returns(
                {
                  type:
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target::Type::OrSymbol,
                  url: String,
                  exclude: T::Array[String],
                  include: T::Array[String],
                  max_urls: Integer
                }
              )
            end
            def to_hash
            end

            module Type
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              SITEMAP =
                T.let(
                  :sitemap,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Target::Type::TaggedSymbol
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
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateSitemapExactMonitorRequest::Webhook,
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

        class MonitorsCreatePageSemanticMonitorRequest < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest,
                ContextDev::Internal::AnyHash
              )
            end

          # Detect meaning-level changes that match a natural language query.
          sig do
            returns(
              ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection
            )
          end
          attr_reader :change_detection

          sig do
            params(
              change_detection:
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection::OrHash
            ).void
          end
          attr_writer :change_detection

          sig { returns(String) }
          attr_accessor :name

          # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          # every 6 hours or every 2 days. The total interval (frequency × unit) must be
          # between 10 minutes and 1 year.
          sig do
            returns(
              ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule
            )
          end
          attr_reader :schedule

          sig do
            params(
              schedule:
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::OrHash
            ).void
          end
          attr_writer :schedule

          sig do
            returns(
              ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target
            )
          end
          attr_reader :target

          sig do
            params(
              target:
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target::OrHash
            ).void
          end
          attr_writer :target

          # User-defined tags for grouping and filtering monitors and their changes.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :tags

          sig { params(tags: T::Array[String]).void }
          attr_writer :tags

          sig do
            returns(
              T.nilable(
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Webhook
              )
            )
          end
          attr_reader :webhook

          sig do
            params(
              webhook:
                T.nilable(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Webhook::OrHash
                )
            ).void
          end
          attr_writer :webhook

          # Monitor a single page for semantic changes described by a natural language
          # query.
          sig do
            params(
              change_detection:
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection::OrHash,
              name: String,
              schedule:
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::OrHash,
              target:
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target::OrHash,
              tags: T::Array[String],
              webhook:
                T.nilable(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Webhook::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Detect meaning-level changes that match a natural language query.
            change_detection:,
            name:,
            # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
            # every 6 hours or every 2 days. The total interval (frequency × unit) must be
            # between 10 minutes and 1 year.
            schedule:,
            target:,
            # User-defined tags for grouping and filtering monitors and their changes.
            tags: nil,
            webhook: nil
          )
          end

          sig do
            override.returns(
              {
                change_detection:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection,
                name: String,
                schedule:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule,
                target:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target,
                tags: T::Array[String],
                webhook:
                  T.nilable(
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Webhook
                  )
              }
            )
          end
          def to_hash
          end

          class ChangeDetection < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection,
                  ContextDev::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :query

            sig do
              returns(
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection::Type::OrSymbol
              )
            end
            attr_accessor :type

            sig { returns(T.nilable(Float)) }
            attr_reader :confidence_threshold

            sig { params(confidence_threshold: Float).void }
            attr_writer :confidence_threshold

            # Detect meaning-level changes that match a natural language query.
            sig do
              params(
                query: String,
                type:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection::Type::OrSymbol,
                confidence_threshold: Float
              ).returns(T.attached_class)
            end
            def self.new(query:, type:, confidence_threshold: nil)
            end

            sig do
              override.returns(
                {
                  query: String,
                  type:
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection::Type::OrSymbol,
                  confidence_threshold: Float
                }
              )
            end
            def to_hash
            end

            module Type
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              SEMANTIC =
                T.let(
                  :semantic,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::ChangeDetection::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Schedule < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule,
                  ContextDev::Internal::AnyHash
                )
              end

            # Number of units between runs. The resulting interval (frequency × unit) must be
            # at least 10 minutes and at most 1 year (e.g. minimum 10 when unit is minutes;
            # maximum 365 when unit is days).
            sig { returns(Integer) }
            attr_accessor :frequency

            sig do
              returns(
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Type::OrSymbol
              )
            end
            attr_accessor :type

            sig do
              returns(
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Unit::OrSymbol
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
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Type::OrSymbol,
                unit:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Unit::OrSymbol
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
                  type:
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Type::OrSymbol,
                  unit:
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Unit::OrSymbol
                }
              )
            end
            def to_hash
            end

            module Type
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              INTERVAL =
                T.let(
                  :interval,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Type::TaggedSymbol
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
                  T.all(
                    Symbol,
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Unit
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MINUTES =
                T.let(
                  :minutes,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Unit::TaggedSymbol
                )
              HOURS =
                T.let(
                  :hours,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Unit::TaggedSymbol
                )
              DAYS =
                T.let(
                  :days,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Unit::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Schedule::Unit::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Target < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target,
                  ContextDev::Internal::AnyHash
                )
              end

            sig do
              returns(
                ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target::Type::OrSymbol
              )
            end
            attr_accessor :type

            sig { returns(String) }
            attr_accessor :url

            # Normalize whitespace before comparing or analyzing text.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :normalize_whitespace

            sig { params(normalize_whitespace: T::Boolean).void }
            attr_writer :normalize_whitespace

            sig do
              params(
                type:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target::Type::OrSymbol,
                url: String,
                normalize_whitespace: T::Boolean
              ).returns(T.attached_class)
            end
            def self.new(
              type:,
              url:,
              # Normalize whitespace before comparing or analyzing text.
              normalize_whitespace: nil
            )
            end

            sig do
              override.returns(
                {
                  type:
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target::Type::OrSymbol,
                  url: String,
                  normalize_whitespace: T::Boolean
                }
              )
            end
            def to_hash
            end

            module Type
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              PAGE =
                T.let(
                  :page,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Target::Type::TaggedSymbol
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
                  ContextDev::MonitorCreateParams::Body::MonitorsCreatePageSemanticMonitorRequest::Webhook,
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

        class MonitorsCreateExtractSemanticMonitorRequest < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest,
                ContextDev::Internal::AnyHash
              )
            end

          # Detect meaning-level changes that match a natural language query.
          sig do
            returns(
              ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection
            )
          end
          attr_reader :change_detection

          sig do
            params(
              change_detection:
                ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection::OrHash
            ).void
          end
          attr_writer :change_detection

          sig { returns(String) }
          attr_accessor :name

          # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          # every 6 hours or every 2 days. The total interval (frequency × unit) must be
          # between 10 minutes and 1 year.
          sig do
            returns(
              ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule
            )
          end
          attr_reader :schedule

          sig do
            params(
              schedule:
                ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::OrHash
            ).void
          end
          attr_writer :schedule

          sig do
            returns(
              ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target
            )
          end
          attr_reader :target

          sig do
            params(
              target:
                ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target::OrHash
            ).void
          end
          attr_writer :target

          # User-defined tags for grouping and filtering monitors and their changes.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :tags

          sig { params(tags: T::Array[String]).void }
          attr_writer :tags

          sig do
            returns(
              T.nilable(
                ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Webhook
              )
            )
          end
          attr_reader :webhook

          sig do
            params(
              webhook:
                T.nilable(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Webhook::OrHash
                )
            ).void
          end
          attr_writer :webhook

          # Monitor a website's extracted structured data for semantic changes described by
          # a natural language query.
          sig do
            params(
              change_detection:
                ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection::OrHash,
              name: String,
              schedule:
                ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::OrHash,
              target:
                ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target::OrHash,
              tags: T::Array[String],
              webhook:
                T.nilable(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Webhook::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Detect meaning-level changes that match a natural language query.
            change_detection:,
            name:,
            # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
            # every 6 hours or every 2 days. The total interval (frequency × unit) must be
            # between 10 minutes and 1 year.
            schedule:,
            target:,
            # User-defined tags for grouping and filtering monitors and their changes.
            tags: nil,
            webhook: nil
          )
          end

          sig do
            override.returns(
              {
                change_detection:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection,
                name: String,
                schedule:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule,
                target:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target,
                tags: T::Array[String],
                webhook:
                  T.nilable(
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Webhook
                  )
              }
            )
          end
          def to_hash
          end

          class ChangeDetection < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection,
                  ContextDev::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :query

            sig do
              returns(
                ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection::Type::OrSymbol
              )
            end
            attr_accessor :type

            sig { returns(T.nilable(Float)) }
            attr_reader :confidence_threshold

            sig { params(confidence_threshold: Float).void }
            attr_writer :confidence_threshold

            # Detect meaning-level changes that match a natural language query.
            sig do
              params(
                query: String,
                type:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection::Type::OrSymbol,
                confidence_threshold: Float
              ).returns(T.attached_class)
            end
            def self.new(query:, type:, confidence_threshold: nil)
            end

            sig do
              override.returns(
                {
                  query: String,
                  type:
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection::Type::OrSymbol,
                  confidence_threshold: Float
                }
              )
            end
            def to_hash
            end

            module Type
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              SEMANTIC =
                T.let(
                  :semantic,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::ChangeDetection::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Schedule < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule,
                  ContextDev::Internal::AnyHash
                )
              end

            # Number of units between runs. The resulting interval (frequency × unit) must be
            # at least 10 minutes and at most 1 year (e.g. minimum 10 when unit is minutes;
            # maximum 365 when unit is days).
            sig { returns(Integer) }
            attr_accessor :frequency

            sig do
              returns(
                ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Type::OrSymbol
              )
            end
            attr_accessor :type

            sig do
              returns(
                ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Unit::OrSymbol
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
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Type::OrSymbol,
                unit:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Unit::OrSymbol
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
                  type:
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Type::OrSymbol,
                  unit:
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Unit::OrSymbol
                }
              )
            end
            def to_hash
            end

            module Type
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              INTERVAL =
                T.let(
                  :interval,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Type::TaggedSymbol
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
                  T.all(
                    Symbol,
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Unit
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MINUTES =
                T.let(
                  :minutes,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Unit::TaggedSymbol
                )
              HOURS =
                T.let(
                  :hours,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Unit::TaggedSymbol
                )
              DAYS =
                T.let(
                  :days,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Unit::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Schedule::Unit::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Target < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target,
                  ContextDev::Internal::AnyHash
                )
              end

            sig do
              returns(
                ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target::Type::OrSymbol
              )
            end
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

            sig do
              params(
                type:
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target::Type::OrSymbol,
                url: String,
                follow_subdomains: T::Boolean,
                instructions: String,
                max_depth: Integer,
                max_pages: Integer,
                schema: T::Hash[Symbol, T.anything]
              ).returns(T.attached_class)
            end
            def self.new(
              type:,
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
              schema: nil
            )
            end

            sig do
              override.returns(
                {
                  type:
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target::Type::OrSymbol,
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

            module Type
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              EXTRACT =
                T.let(
                  :extract,
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Target::Type::TaggedSymbol
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
                  ContextDev::MonitorCreateParams::Body::MonitorsCreateExtractSemanticMonitorRequest::Webhook,
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

        sig do
          override.returns(
            T::Array[ContextDev::MonitorCreateParams::Body::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
