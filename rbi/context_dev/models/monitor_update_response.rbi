# typed: strong

module ContextDev
  module Models
    # Union of monitor response shapes.
    module MonitorUpdateResponse
      extend ContextDev::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor,
            ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor,
            ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor,
            ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor
          )
        end

      class MonitorsPageExactMonitor < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Detect exact changes. For page targets, this means visible text diffs. For
        # sitemap targets, this means URL additions and removals.
        sig do
          returns(
            ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::ChangeDetection
          )
        end
        attr_reader :change_detection

        sig do
          params(
            change_detection:
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::ChangeDetection::OrHash
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
            ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule
          )
        end
        attr_reader :schedule

        sig do
          params(
            schedule:
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule::OrHash
          ).void
        end
        attr_writer :schedule

        sig do
          returns(
            ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Target
          )
        end
        attr_reader :target

        sig do
          params(
            target:
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Target::OrHash
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
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Webhook
            )
          )
        end
        attr_reader :webhook

        sig do
          params(
            webhook:
              T.nilable(
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Webhook::OrHash
              )
          ).void
        end
        attr_writer :webhook

        # A page monitor using exact change detection.
        sig do
          params(
            id: String,
            change_detection:
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::ChangeDetection::OrHash,
            created_at: Time,
            name: String,
            schedule:
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule::OrHash,
            status:
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Status::OrSymbol,
            target:
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Target::OrHash,
            updated_at: Time,
            last_change_at: T.nilable(Time),
            last_run_at: T.nilable(Time),
            tags: T::Array[String],
            webhook:
              T.nilable(
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Webhook::OrHash
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::ChangeDetection,
              created_at: Time,
              name: String,
              schedule:
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule,
              status:
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Status::TaggedSymbol,
              target:
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Target,
              updated_at: Time,
              last_change_at: T.nilable(Time),
              last_run_at: T.nilable(Time),
              tags: T::Array[String],
              webhook:
                T.nilable(
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Webhook
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::ChangeDetection,
                ContextDev::Internal::AnyHash
              )
            end

          sig do
            returns(
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::ChangeDetection::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Detect exact changes. For page targets, this means visible text diffs. For
          # sitemap targets, this means URL additions and removals.
          sig do
            params(
              type:
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::ChangeDetection::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::ChangeDetection::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::ChangeDetection::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            EXACT =
              T.let(
                :exact,
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::ChangeDetection::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::ChangeDetection::Type::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule,
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
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            returns(
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule::Type::OrSymbol,
              unit:
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule::Unit::OrSymbol
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule::Type::TaggedSymbol,
                unit:
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INTERVAL =
              T.let(
                :interval,
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule::Unit
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MINUTES =
              T.let(
                :minutes,
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
              )
            HOURS =
              T.let(
                :hours,
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
              )
            DAYS =
              T.let(
                :days,
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Status::TaggedSymbol
            )
          PAUSED =
            T.let(
              :paused,
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Status::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Target,
                ContextDev::Internal::AnyHash
              )
            end

          sig do
            returns(
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Target::Type::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Target::Type::OrSymbol,
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Target::Type::TaggedSymbol,
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Target::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PAGE =
              T.let(
                :page,
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Target::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Target::Type::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageExactMonitor::Webhook,
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
              ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Detect exact changes. For page targets, this means visible text diffs. For
        # sitemap targets, this means URL additions and removals.
        sig do
          returns(
            ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::ChangeDetection
          )
        end
        attr_reader :change_detection

        sig do
          params(
            change_detection:
              ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::ChangeDetection::OrHash
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
            ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule
          )
        end
        attr_reader :schedule

        sig do
          params(
            schedule:
              ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule::OrHash
          ).void
        end
        attr_writer :schedule

        sig do
          returns(
            ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Target
          )
        end
        attr_reader :target

        sig do
          params(
            target:
              ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Target::OrHash
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
              ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Webhook
            )
          )
        end
        attr_reader :webhook

        sig do
          params(
            webhook:
              T.nilable(
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Webhook::OrHash
              )
          ).void
        end
        attr_writer :webhook

        # A sitemap monitor using exact change detection.
        sig do
          params(
            id: String,
            change_detection:
              ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::ChangeDetection::OrHash,
            created_at: Time,
            name: String,
            schedule:
              ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule::OrHash,
            status:
              ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Status::OrSymbol,
            target:
              ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Target::OrHash,
            updated_at: Time,
            last_change_at: T.nilable(Time),
            last_run_at: T.nilable(Time),
            tags: T::Array[String],
            webhook:
              T.nilable(
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Webhook::OrHash
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::ChangeDetection,
              created_at: Time,
              name: String,
              schedule:
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule,
              status:
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Status::TaggedSymbol,
              target:
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Target,
              updated_at: Time,
              last_change_at: T.nilable(Time),
              last_run_at: T.nilable(Time),
              tags: T::Array[String],
              webhook:
                T.nilable(
                  ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Webhook
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::ChangeDetection,
                ContextDev::Internal::AnyHash
              )
            end

          sig do
            returns(
              ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::ChangeDetection::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Detect exact changes. For page targets, this means visible text diffs. For
          # sitemap targets, this means URL additions and removals.
          sig do
            params(
              type:
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::ChangeDetection::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::ChangeDetection::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::ChangeDetection::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            EXACT =
              T.let(
                :exact,
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::ChangeDetection::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::ChangeDetection::Type::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule,
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
              ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            returns(
              ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule::Type::OrSymbol,
              unit:
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule::Unit::OrSymbol
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule::Type::TaggedSymbol,
                unit:
                  ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INTERVAL =
              T.let(
                :interval,
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule::Unit
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MINUTES =
              T.let(
                :minutes,
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
              )
            HOURS =
              T.let(
                :hours,
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
              )
            DAYS =
              T.let(
                :days,
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Status::TaggedSymbol
            )
          PAUSED =
            T.let(
              :paused,
              ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Status::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Target,
                ContextDev::Internal::AnyHash
              )
            end

          sig do
            returns(
              ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Target::Type::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Target::Type::OrSymbol,
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Target::Type::TaggedSymbol,
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Target::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SITEMAP =
              T.let(
                :sitemap,
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Target::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Target::Type::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsSitemapExactMonitor::Webhook,
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
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Detect meaning-level changes that match a natural language query.
        sig do
          returns(
            ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::ChangeDetection
          )
        end
        attr_reader :change_detection

        sig do
          params(
            change_detection:
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::ChangeDetection::OrHash
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
            ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule
          )
        end
        attr_reader :schedule

        sig do
          params(
            schedule:
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule::OrHash
          ).void
        end
        attr_writer :schedule

        sig do
          returns(
            ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Target
          )
        end
        attr_reader :target

        sig do
          params(
            target:
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Target::OrHash
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
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Webhook
            )
          )
        end
        attr_reader :webhook

        sig do
          params(
            webhook:
              T.nilable(
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Webhook::OrHash
              )
          ).void
        end
        attr_writer :webhook

        # A page monitor using semantic change detection.
        sig do
          params(
            id: String,
            change_detection:
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::ChangeDetection::OrHash,
            created_at: Time,
            name: String,
            schedule:
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule::OrHash,
            status:
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Status::OrSymbol,
            target:
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Target::OrHash,
            updated_at: Time,
            last_change_at: T.nilable(Time),
            last_run_at: T.nilable(Time),
            tags: T::Array[String],
            webhook:
              T.nilable(
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Webhook::OrHash
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::ChangeDetection,
              created_at: Time,
              name: String,
              schedule:
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule,
              status:
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Status::TaggedSymbol,
              target:
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Target,
              updated_at: Time,
              last_change_at: T.nilable(Time),
              last_run_at: T.nilable(Time),
              tags: T::Array[String],
              webhook:
                T.nilable(
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Webhook
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::ChangeDetection,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :query

          sig do
            returns(
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::ChangeDetection::Type::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::ChangeDetection::Type::OrSymbol,
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::ChangeDetection::Type::TaggedSymbol,
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::ChangeDetection::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SEMANTIC =
              T.let(
                :semantic,
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::ChangeDetection::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::ChangeDetection::Type::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule,
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
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            returns(
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule::Type::OrSymbol,
              unit:
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule::Unit::OrSymbol
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule::Type::TaggedSymbol,
                unit:
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INTERVAL =
              T.let(
                :interval,
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule::Unit
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MINUTES =
              T.let(
                :minutes,
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
              )
            HOURS =
              T.let(
                :hours,
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
              )
            DAYS =
              T.let(
                :days,
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Status::TaggedSymbol
            )
          PAUSED =
            T.let(
              :paused,
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Status::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Target,
                ContextDev::Internal::AnyHash
              )
            end

          sig do
            returns(
              ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Target::Type::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Target::Type::OrSymbol,
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Target::Type::TaggedSymbol,
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Target::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PAGE =
              T.let(
                :page,
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Target::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Target::Type::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsPageSemanticMonitor::Webhook,
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
              ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Detect meaning-level changes that match a natural language query.
        sig do
          returns(
            ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::ChangeDetection
          )
        end
        attr_reader :change_detection

        sig do
          params(
            change_detection:
              ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::ChangeDetection::OrHash
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
            ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule
          )
        end
        attr_reader :schedule

        sig do
          params(
            schedule:
              ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule::OrHash
          ).void
        end
        attr_writer :schedule

        sig do
          returns(
            ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Target
          )
        end
        attr_reader :target

        sig do
          params(
            target:
              ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Target::OrHash
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
              ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Webhook
            )
          )
        end
        attr_reader :webhook

        sig do
          params(
            webhook:
              T.nilable(
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Webhook::OrHash
              )
          ).void
        end
        attr_writer :webhook

        # An extract monitor using semantic change detection.
        sig do
          params(
            id: String,
            change_detection:
              ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::ChangeDetection::OrHash,
            created_at: Time,
            name: String,
            schedule:
              ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule::OrHash,
            status:
              ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Status::OrSymbol,
            target:
              ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Target::OrHash,
            updated_at: Time,
            last_change_at: T.nilable(Time),
            last_run_at: T.nilable(Time),
            tags: T::Array[String],
            webhook:
              T.nilable(
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Webhook::OrHash
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::ChangeDetection,
              created_at: Time,
              name: String,
              schedule:
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule,
              status:
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Status::TaggedSymbol,
              target:
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Target,
              updated_at: Time,
              last_change_at: T.nilable(Time),
              last_run_at: T.nilable(Time),
              tags: T::Array[String],
              webhook:
                T.nilable(
                  ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Webhook
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::ChangeDetection,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :query

          sig do
            returns(
              ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::ChangeDetection::Type::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::ChangeDetection::Type::OrSymbol,
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::ChangeDetection::Type::TaggedSymbol,
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::ChangeDetection::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SEMANTIC =
              T.let(
                :semantic,
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::ChangeDetection::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::ChangeDetection::Type::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule,
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
              ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            returns(
              ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule::Type::OrSymbol,
              unit:
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule::Unit::OrSymbol
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule::Type::TaggedSymbol,
                unit:
                  ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INTERVAL =
              T.let(
                :interval,
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule::Unit
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MINUTES =
              T.let(
                :minutes,
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
              )
            HOURS =
              T.let(
                :hours,
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
              )
            DAYS =
              T.let(
                :days,
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Status::TaggedSymbol
            )
          PAUSED =
            T.let(
              :paused,
              ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Status::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Target,
                ContextDev::Internal::AnyHash
              )
            end

          sig do
            returns(
              ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Target::Type::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Target::Type::OrSymbol,
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Target::Type::TaggedSymbol,
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
                  ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Target::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            EXTRACT =
              T.let(
                :extract,
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Target::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Target::Type::TaggedSymbol
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
                ContextDev::Models::MonitorUpdateResponse::MonitorsExtractSemanticMonitor::Webhook,
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
          T::Array[ContextDev::Models::MonitorUpdateResponse::Variants]
        )
      end
      def self.variants
      end
    end
  end
end
