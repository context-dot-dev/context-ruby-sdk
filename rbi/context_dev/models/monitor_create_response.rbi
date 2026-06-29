# typed: strong

module ContextDev
  module Models
    # Union of monitor response shapes.
    module MonitorCreateResponse
      extend ContextDev::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor,
            ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor,
            ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor,
            ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor
          )
        end

      class MonitorsPageExactMonitor < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Detect exact changes. For page targets, this means visible text diffs. For
        # sitemap targets, this means URL additions and removals.
        sig do
          returns(
            ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::ChangeDetection
          )
        end
        attr_reader :change_detection

        sig do
          params(
            change_detection:
              ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::ChangeDetection::OrHash
          ).void
        end
        attr_writer :change_detection

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :name

        # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        # every 6 hours or every 2 days. The total interval (frequency × unit) must be
        # between 10 minutes and 1 year.
        sig do
          returns(
            ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule
          )
        end
        attr_reader :schedule

        sig do
          params(
            schedule:
              ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule::OrHash
          ).void
        end
        attr_writer :schedule

        sig do
          returns(
            ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Target
          )
        end
        attr_reader :target

        sig do
          params(
            target:
              ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Target::OrHash
          ).void
        end
        attr_writer :target

        sig { returns(Time) }
        attr_accessor :updated_at

        sig { returns(T.nilable(Time)) }
        attr_accessor :last_change_at

        sig { returns(T.nilable(Time)) }
        attr_accessor :last_run_at

        # User-defined tags for grouping and filtering monitors and their changes.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :tags

        sig { params(tags: T::Array[String]).void }
        attr_writer :tags

        sig do
          returns(
            T.nilable(
              ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Webhook
            )
          )
        end
        attr_reader :webhook

        sig do
          params(
            webhook:
              T.nilable(
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Webhook::OrHash
              )
          ).void
        end
        attr_writer :webhook

        # A page monitor using exact change detection.
        sig do
          params(
            id: String,
            change_detection:
              ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::ChangeDetection::OrHash,
            created_at: Time,
            name: String,
            schedule:
              ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule::OrHash,
            status:
              ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Status::OrSymbol,
            target:
              ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Target::OrHash,
            updated_at: Time,
            last_change_at: T.nilable(Time),
            last_run_at: T.nilable(Time),
            tags: T::Array[String],
            webhook:
              T.nilable(
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Webhook::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Detect exact changes. For page targets, this means visible text diffs. For
          # sitemap targets, this means URL additions and removals.
          change_detection:,
          created_at:,
          name:,
          # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          # every 6 hours or every 2 days. The total interval (frequency × unit) must be
          # between 10 minutes and 1 year.
          schedule:,
          status:,
          target:,
          updated_at:,
          last_change_at: nil,
          last_run_at: nil,
          # User-defined tags for grouping and filtering monitors and their changes.
          tags: nil,
          webhook: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              change_detection:
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::ChangeDetection,
              created_at: Time,
              name: String,
              schedule:
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule,
              status:
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Status::TaggedSymbol,
              target:
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Target,
              updated_at: Time,
              last_change_at: T.nilable(Time),
              last_run_at: T.nilable(Time),
              tags: T::Array[String],
              webhook:
                T.nilable(
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Webhook
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
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::ChangeDetection,
                ContextDev::Internal::AnyHash
              )
            end

          sig do
            returns(
              ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::ChangeDetection::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Detect exact changes. For page targets, this means visible text diffs. For
          # sitemap targets, this means URL additions and removals.
          sig do
            params(
              type:
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::ChangeDetection::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::ChangeDetection::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::ChangeDetection::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            EXACT =
              T.let(
                :exact,
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::ChangeDetection::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::ChangeDetection::Type::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule,
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
              ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            returns(
              ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule::Type::OrSymbol,
              unit:
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule::Unit::OrSymbol
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule::Type::TaggedSymbol,
                unit:
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INTERVAL =
              T.let(
                :interval,
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule::Unit
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MINUTES =
              T.let(
                :minutes,
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
              )
            HOURS =
              T.let(
                :hours,
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
              )
            DAYS =
              T.let(
                :days,
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        module Status
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Status::TaggedSymbol
            )
          PAUSED =
            T.let(
              :paused,
              ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Target < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Target,
                ContextDev::Internal::AnyHash
              )
            end

          sig do
            returns(
              ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Target::Type::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Target::Type::OrSymbol,
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Target::Type::TaggedSymbol,
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Target::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PAGE =
              T.let(
                :page,
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Target::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Target::Type::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsPageExactMonitor::Webhook,
                ContextDev::Internal::AnyHash
              )
            end

          # Webhook URL called when a change is detected.
          sig { returns(String) }
          attr_accessor :url

          # Signing secret used to verify webhook authenticity. Each delivery includes an
          # `X-Context-Signature: t=<unix>,v1=<hmac>` header, where the HMAC is SHA-256 over
          # `"{t}.{rawRequestBody}"` keyed by this secret. Recompute it with a constant-time
          # compare and reject stale timestamps to prevent replay. Generated by the API;
          # cannot be set by clients.
          sig { returns(T.nilable(String)) }
          attr_reader :secret

          sig { params(secret: String).void }
          attr_writer :secret

          sig { params(url: String, secret: String).returns(T.attached_class) }
          def self.new(
            # Webhook URL called when a change is detected.
            url:,
            # Signing secret used to verify webhook authenticity. Each delivery includes an
            # `X-Context-Signature: t=<unix>,v1=<hmac>` header, where the HMAC is SHA-256 over
            # `"{t}.{rawRequestBody}"` keyed by this secret. Recompute it with a constant-time
            # compare and reject stale timestamps to prevent replay. Generated by the API;
            # cannot be set by clients.
            secret: nil
          )
          end

          sig { override.returns({ url: String, secret: String }) }
          def to_hash
          end
        end
      end

      class MonitorsSitemapExactMonitor < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Detect exact changes. For page targets, this means visible text diffs. For
        # sitemap targets, this means URL additions and removals.
        sig do
          returns(
            ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::ChangeDetection
          )
        end
        attr_reader :change_detection

        sig do
          params(
            change_detection:
              ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::ChangeDetection::OrHash
          ).void
        end
        attr_writer :change_detection

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :name

        # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        # every 6 hours or every 2 days. The total interval (frequency × unit) must be
        # between 10 minutes and 1 year.
        sig do
          returns(
            ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule
          )
        end
        attr_reader :schedule

        sig do
          params(
            schedule:
              ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule::OrHash
          ).void
        end
        attr_writer :schedule

        sig do
          returns(
            ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Target
          )
        end
        attr_reader :target

        sig do
          params(
            target:
              ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Target::OrHash
          ).void
        end
        attr_writer :target

        sig { returns(Time) }
        attr_accessor :updated_at

        sig { returns(T.nilable(Time)) }
        attr_accessor :last_change_at

        sig { returns(T.nilable(Time)) }
        attr_accessor :last_run_at

        # User-defined tags for grouping and filtering monitors and their changes.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :tags

        sig { params(tags: T::Array[String]).void }
        attr_writer :tags

        sig do
          returns(
            T.nilable(
              ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Webhook
            )
          )
        end
        attr_reader :webhook

        sig do
          params(
            webhook:
              T.nilable(
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Webhook::OrHash
              )
          ).void
        end
        attr_writer :webhook

        # A sitemap monitor using exact change detection.
        sig do
          params(
            id: String,
            change_detection:
              ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::ChangeDetection::OrHash,
            created_at: Time,
            name: String,
            schedule:
              ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule::OrHash,
            status:
              ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Status::OrSymbol,
            target:
              ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Target::OrHash,
            updated_at: Time,
            last_change_at: T.nilable(Time),
            last_run_at: T.nilable(Time),
            tags: T::Array[String],
            webhook:
              T.nilable(
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Webhook::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Detect exact changes. For page targets, this means visible text diffs. For
          # sitemap targets, this means URL additions and removals.
          change_detection:,
          created_at:,
          name:,
          # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          # every 6 hours or every 2 days. The total interval (frequency × unit) must be
          # between 10 minutes and 1 year.
          schedule:,
          status:,
          target:,
          updated_at:,
          last_change_at: nil,
          last_run_at: nil,
          # User-defined tags for grouping and filtering monitors and their changes.
          tags: nil,
          webhook: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              change_detection:
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::ChangeDetection,
              created_at: Time,
              name: String,
              schedule:
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule,
              status:
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Status::TaggedSymbol,
              target:
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Target,
              updated_at: Time,
              last_change_at: T.nilable(Time),
              last_run_at: T.nilable(Time),
              tags: T::Array[String],
              webhook:
                T.nilable(
                  ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Webhook
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
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::ChangeDetection,
                ContextDev::Internal::AnyHash
              )
            end

          sig do
            returns(
              ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::ChangeDetection::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Detect exact changes. For page targets, this means visible text diffs. For
          # sitemap targets, this means URL additions and removals.
          sig do
            params(
              type:
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::ChangeDetection::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::ChangeDetection::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::ChangeDetection::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            EXACT =
              T.let(
                :exact,
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::ChangeDetection::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::ChangeDetection::Type::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule,
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
              ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            returns(
              ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule::Type::OrSymbol,
              unit:
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule::Unit::OrSymbol
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule::Type::TaggedSymbol,
                unit:
                  ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INTERVAL =
              T.let(
                :interval,
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule::Unit
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MINUTES =
              T.let(
                :minutes,
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
              )
            HOURS =
              T.let(
                :hours,
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
              )
            DAYS =
              T.let(
                :days,
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        module Status
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Status::TaggedSymbol
            )
          PAUSED =
            T.let(
              :paused,
              ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Target < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Target,
                ContextDev::Internal::AnyHash
              )
            end

          sig do
            returns(
              ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Target::Type::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Target::Type::OrSymbol,
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Target::Type::TaggedSymbol,
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Target::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SITEMAP =
              T.let(
                :sitemap,
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Target::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Target::Type::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsSitemapExactMonitor::Webhook,
                ContextDev::Internal::AnyHash
              )
            end

          # Webhook URL called when a change is detected.
          sig { returns(String) }
          attr_accessor :url

          # Signing secret used to verify webhook authenticity. Each delivery includes an
          # `X-Context-Signature: t=<unix>,v1=<hmac>` header, where the HMAC is SHA-256 over
          # `"{t}.{rawRequestBody}"` keyed by this secret. Recompute it with a constant-time
          # compare and reject stale timestamps to prevent replay. Generated by the API;
          # cannot be set by clients.
          sig { returns(T.nilable(String)) }
          attr_reader :secret

          sig { params(secret: String).void }
          attr_writer :secret

          sig { params(url: String, secret: String).returns(T.attached_class) }
          def self.new(
            # Webhook URL called when a change is detected.
            url:,
            # Signing secret used to verify webhook authenticity. Each delivery includes an
            # `X-Context-Signature: t=<unix>,v1=<hmac>` header, where the HMAC is SHA-256 over
            # `"{t}.{rawRequestBody}"` keyed by this secret. Recompute it with a constant-time
            # compare and reject stale timestamps to prevent replay. Generated by the API;
            # cannot be set by clients.
            secret: nil
          )
          end

          sig { override.returns({ url: String, secret: String }) }
          def to_hash
          end
        end
      end

      class MonitorsPageSemanticMonitor < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Detect meaning-level changes that match a natural language query.
        sig do
          returns(
            ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::ChangeDetection
          )
        end
        attr_reader :change_detection

        sig do
          params(
            change_detection:
              ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::ChangeDetection::OrHash
          ).void
        end
        attr_writer :change_detection

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :name

        # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        # every 6 hours or every 2 days. The total interval (frequency × unit) must be
        # between 10 minutes and 1 year.
        sig do
          returns(
            ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule
          )
        end
        attr_reader :schedule

        sig do
          params(
            schedule:
              ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule::OrHash
          ).void
        end
        attr_writer :schedule

        sig do
          returns(
            ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Target
          )
        end
        attr_reader :target

        sig do
          params(
            target:
              ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Target::OrHash
          ).void
        end
        attr_writer :target

        sig { returns(Time) }
        attr_accessor :updated_at

        sig { returns(T.nilable(Time)) }
        attr_accessor :last_change_at

        sig { returns(T.nilable(Time)) }
        attr_accessor :last_run_at

        # User-defined tags for grouping and filtering monitors and their changes.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :tags

        sig { params(tags: T::Array[String]).void }
        attr_writer :tags

        sig do
          returns(
            T.nilable(
              ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Webhook
            )
          )
        end
        attr_reader :webhook

        sig do
          params(
            webhook:
              T.nilable(
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Webhook::OrHash
              )
          ).void
        end
        attr_writer :webhook

        # A page monitor using semantic change detection.
        sig do
          params(
            id: String,
            change_detection:
              ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::ChangeDetection::OrHash,
            created_at: Time,
            name: String,
            schedule:
              ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule::OrHash,
            status:
              ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Status::OrSymbol,
            target:
              ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Target::OrHash,
            updated_at: Time,
            last_change_at: T.nilable(Time),
            last_run_at: T.nilable(Time),
            tags: T::Array[String],
            webhook:
              T.nilable(
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Webhook::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Detect meaning-level changes that match a natural language query.
          change_detection:,
          created_at:,
          name:,
          # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          # every 6 hours or every 2 days. The total interval (frequency × unit) must be
          # between 10 minutes and 1 year.
          schedule:,
          status:,
          target:,
          updated_at:,
          last_change_at: nil,
          last_run_at: nil,
          # User-defined tags for grouping and filtering monitors and their changes.
          tags: nil,
          webhook: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              change_detection:
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::ChangeDetection,
              created_at: Time,
              name: String,
              schedule:
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule,
              status:
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Status::TaggedSymbol,
              target:
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Target,
              updated_at: Time,
              last_change_at: T.nilable(Time),
              last_run_at: T.nilable(Time),
              tags: T::Array[String],
              webhook:
                T.nilable(
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Webhook
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
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::ChangeDetection,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :query

          sig do
            returns(
              ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::ChangeDetection::Type::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::ChangeDetection::Type::OrSymbol,
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::ChangeDetection::Type::TaggedSymbol,
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::ChangeDetection::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SEMANTIC =
              T.let(
                :semantic,
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::ChangeDetection::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::ChangeDetection::Type::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule,
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
              ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            returns(
              ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule::Type::OrSymbol,
              unit:
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule::Unit::OrSymbol
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule::Type::TaggedSymbol,
                unit:
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INTERVAL =
              T.let(
                :interval,
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule::Unit
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MINUTES =
              T.let(
                :minutes,
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
              )
            HOURS =
              T.let(
                :hours,
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
              )
            DAYS =
              T.let(
                :days,
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        module Status
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Status::TaggedSymbol
            )
          PAUSED =
            T.let(
              :paused,
              ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Target < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Target,
                ContextDev::Internal::AnyHash
              )
            end

          sig do
            returns(
              ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Target::Type::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Target::Type::OrSymbol,
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Target::Type::TaggedSymbol,
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Target::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PAGE =
              T.let(
                :page,
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Target::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Target::Type::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsPageSemanticMonitor::Webhook,
                ContextDev::Internal::AnyHash
              )
            end

          # Webhook URL called when a change is detected.
          sig { returns(String) }
          attr_accessor :url

          # Signing secret used to verify webhook authenticity. Each delivery includes an
          # `X-Context-Signature: t=<unix>,v1=<hmac>` header, where the HMAC is SHA-256 over
          # `"{t}.{rawRequestBody}"` keyed by this secret. Recompute it with a constant-time
          # compare and reject stale timestamps to prevent replay. Generated by the API;
          # cannot be set by clients.
          sig { returns(T.nilable(String)) }
          attr_reader :secret

          sig { params(secret: String).void }
          attr_writer :secret

          sig { params(url: String, secret: String).returns(T.attached_class) }
          def self.new(
            # Webhook URL called when a change is detected.
            url:,
            # Signing secret used to verify webhook authenticity. Each delivery includes an
            # `X-Context-Signature: t=<unix>,v1=<hmac>` header, where the HMAC is SHA-256 over
            # `"{t}.{rawRequestBody}"` keyed by this secret. Recompute it with a constant-time
            # compare and reject stale timestamps to prevent replay. Generated by the API;
            # cannot be set by clients.
            secret: nil
          )
          end

          sig { override.returns({ url: String, secret: String }) }
          def to_hash
          end
        end
      end

      class MonitorsExtractSemanticMonitor < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Detect meaning-level changes that match a natural language query.
        sig do
          returns(
            ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::ChangeDetection
          )
        end
        attr_reader :change_detection

        sig do
          params(
            change_detection:
              ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::ChangeDetection::OrHash
          ).void
        end
        attr_writer :change_detection

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :name

        # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
        # every 6 hours or every 2 days. The total interval (frequency × unit) must be
        # between 10 minutes and 1 year.
        sig do
          returns(
            ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule
          )
        end
        attr_reader :schedule

        sig do
          params(
            schedule:
              ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule::OrHash
          ).void
        end
        attr_writer :schedule

        sig do
          returns(
            ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Target
          )
        end
        attr_reader :target

        sig do
          params(
            target:
              ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Target::OrHash
          ).void
        end
        attr_writer :target

        sig { returns(Time) }
        attr_accessor :updated_at

        sig { returns(T.nilable(Time)) }
        attr_accessor :last_change_at

        sig { returns(T.nilable(Time)) }
        attr_accessor :last_run_at

        # User-defined tags for grouping and filtering monitors and their changes.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :tags

        sig { params(tags: T::Array[String]).void }
        attr_writer :tags

        sig do
          returns(
            T.nilable(
              ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Webhook
            )
          )
        end
        attr_reader :webhook

        sig do
          params(
            webhook:
              T.nilable(
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Webhook::OrHash
              )
          ).void
        end
        attr_writer :webhook

        # An extract monitor using semantic change detection.
        sig do
          params(
            id: String,
            change_detection:
              ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::ChangeDetection::OrHash,
            created_at: Time,
            name: String,
            schedule:
              ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule::OrHash,
            status:
              ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Status::OrSymbol,
            target:
              ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Target::OrHash,
            updated_at: Time,
            last_change_at: T.nilable(Time),
            last_run_at: T.nilable(Time),
            tags: T::Array[String],
            webhook:
              T.nilable(
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Webhook::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Detect meaning-level changes that match a natural language query.
          change_detection:,
          created_at:,
          name:,
          # Run the monitor on a fixed interval defined by a frequency and a unit, e.g.
          # every 6 hours or every 2 days. The total interval (frequency × unit) must be
          # between 10 minutes and 1 year.
          schedule:,
          status:,
          target:,
          updated_at:,
          last_change_at: nil,
          last_run_at: nil,
          # User-defined tags for grouping and filtering monitors and their changes.
          tags: nil,
          webhook: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              change_detection:
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::ChangeDetection,
              created_at: Time,
              name: String,
              schedule:
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule,
              status:
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Status::TaggedSymbol,
              target:
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Target,
              updated_at: Time,
              last_change_at: T.nilable(Time),
              last_run_at: T.nilable(Time),
              tags: T::Array[String],
              webhook:
                T.nilable(
                  ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Webhook
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
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::ChangeDetection,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :query

          sig do
            returns(
              ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::ChangeDetection::Type::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::ChangeDetection::Type::OrSymbol,
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::ChangeDetection::Type::TaggedSymbol,
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::ChangeDetection::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SEMANTIC =
              T.let(
                :semantic,
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::ChangeDetection::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::ChangeDetection::Type::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule,
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
              ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            returns(
              ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule::Type::OrSymbol,
              unit:
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule::Unit::OrSymbol
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule::Type::TaggedSymbol,
                unit:
                  ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INTERVAL =
              T.let(
                :interval,
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule::Unit
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MINUTES =
              T.let(
                :minutes,
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
              )
            HOURS =
              T.let(
                :hours,
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
              )
            DAYS =
              T.let(
                :days,
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        module Status
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Status::TaggedSymbol
            )
          PAUSED =
            T.let(
              :paused,
              ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Target < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Target,
                ContextDev::Internal::AnyHash
              )
            end

          sig do
            returns(
              ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Target::Type::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Target::Type::OrSymbol,
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Target::Type::TaggedSymbol,
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
                  ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Target::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            EXTRACT =
              T.let(
                :extract,
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Target::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Target::Type::TaggedSymbol
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
                ContextDev::Models::MonitorCreateResponse::MonitorsExtractSemanticMonitor::Webhook,
                ContextDev::Internal::AnyHash
              )
            end

          # Webhook URL called when a change is detected.
          sig { returns(String) }
          attr_accessor :url

          # Signing secret used to verify webhook authenticity. Each delivery includes an
          # `X-Context-Signature: t=<unix>,v1=<hmac>` header, where the HMAC is SHA-256 over
          # `"{t}.{rawRequestBody}"` keyed by this secret. Recompute it with a constant-time
          # compare and reject stale timestamps to prevent replay. Generated by the API;
          # cannot be set by clients.
          sig { returns(T.nilable(String)) }
          attr_reader :secret

          sig { params(secret: String).void }
          attr_writer :secret

          sig { params(url: String, secret: String).returns(T.attached_class) }
          def self.new(
            # Webhook URL called when a change is detected.
            url:,
            # Signing secret used to verify webhook authenticity. Each delivery includes an
            # `X-Context-Signature: t=<unix>,v1=<hmac>` header, where the HMAC is SHA-256 over
            # `"{t}.{rawRequestBody}"` keyed by this secret. Recompute it with a constant-time
            # compare and reject stale timestamps to prevent replay. Generated by the API;
            # cannot be set by clients.
            secret: nil
          )
          end

          sig { override.returns({ url: String, secret: String }) }
          def to_hash
          end
        end
      end

      sig do
        override.returns(
          T::Array[ContextDev::Models::MonitorCreateResponse::Variants]
        )
      end
      def self.variants
      end
    end
  end
end
