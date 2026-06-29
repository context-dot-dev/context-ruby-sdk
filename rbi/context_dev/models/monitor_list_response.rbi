# typed: strong

module ContextDev
  module Models
    class MonitorListResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::MonitorListResponse,
            ContextDev::Internal::AnyHash
          )
        end

      sig do
        returns(
          T::Array[ContextDev::Models::MonitorListResponse::Data::Variants]
        )
      end
      attr_accessor :data

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      sig do
        params(
          data:
            T::Array[
              T.any(
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::OrHash,
                ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::OrHash,
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::OrHash,
                ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::OrHash
              )
            ],
          has_more: T::Boolean,
          next_cursor: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(data:, has_more:, next_cursor:)
      end

      sig do
        override.returns(
          {
            data:
              T::Array[ContextDev::Models::MonitorListResponse::Data::Variants],
            has_more: T::Boolean,
            next_cursor: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Union of monitor response shapes.
      module Data
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor,
              ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor,
              ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor,
              ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor
            )
          end

        class MonitorsPageExactMonitor < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          # Detect exact changes. For page targets, this means visible text diffs. For
          # sitemap targets, this means URL additions and removals.
          sig do
            returns(
              ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection
            )
          end
          attr_reader :change_detection

          sig do
            params(
              change_detection:
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection::OrHash
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
              ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule
            )
          end
          attr_reader :schedule

          sig do
            params(
              schedule:
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::OrHash
            ).void
          end
          attr_writer :schedule

          sig do
            returns(
              ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          sig do
            returns(
              ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target
            )
          end
          attr_reader :target

          sig do
            params(
              target:
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target::OrHash
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
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Webhook
              )
            )
          end
          attr_reader :webhook

          sig do
            params(
              webhook:
                T.nilable(
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Webhook::OrHash
                )
            ).void
          end
          attr_writer :webhook

          # A page monitor using exact change detection.
          sig do
            params(
              id: String,
              change_detection:
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection::OrHash,
              created_at: Time,
              name: String,
              schedule:
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::OrHash,
              status:
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Status::OrSymbol,
              target:
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target::OrHash,
              updated_at: Time,
              last_change_at: T.nilable(Time),
              last_run_at: T.nilable(Time),
              tags: T::Array[String],
              webhook:
                T.nilable(
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Webhook::OrHash
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection,
                created_at: Time,
                name: String,
                schedule:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule,
                status:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Status::TaggedSymbol,
                target:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target,
                updated_at: Time,
                last_change_at: T.nilable(Time),
                last_run_at: T.nilable(Time),
                tags: T::Array[String],
                webhook:
                  T.nilable(
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Webhook
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection,
                  ContextDev::Internal::AnyHash
                )
              end

            sig do
              returns(
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            # Detect exact changes. For page targets, this means visible text diffs. For
            # sitemap targets, this means URL additions and removals.
            sig do
              params(
                type:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(type:)
            end

            sig do
              override.returns(
                {
                  type:
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection::Type::TaggedSymbol
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              EXACT =
                T.let(
                  :exact,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::ChangeDetection::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule,
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
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            sig do
              returns(
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Type::OrSymbol,
                unit:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Unit::OrSymbol
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Type::TaggedSymbol,
                  unit:
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              INTERVAL =
                T.let(
                  :interval,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Type::TaggedSymbol
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Unit
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MINUTES =
                T.let(
                  :minutes,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
                )
              HOURS =
                T.let(
                  :hours,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
                )
              DAYS =
                T.let(
                  :days,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Schedule::Unit::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ACTIVE =
              T.let(
                :active,
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Status::TaggedSymbol
              )
            PAUSED =
              T.let(
                :paused,
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Status::TaggedSymbol
              )
            FAILED =
              T.let(
                :failed,
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Status::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target,
                  ContextDev::Internal::AnyHash
                )
              end

            sig do
              returns(
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target::Type::OrSymbol,
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target::Type::TaggedSymbol,
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              PAGE =
                T.let(
                  :page,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Target::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageExactMonitor::Webhook,
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

            sig do
              params(url: String, secret: String).returns(T.attached_class)
            end
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
                ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          # Detect exact changes. For page targets, this means visible text diffs. For
          # sitemap targets, this means URL additions and removals.
          sig do
            returns(
              ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection
            )
          end
          attr_reader :change_detection

          sig do
            params(
              change_detection:
                ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection::OrHash
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
              ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule
            )
          end
          attr_reader :schedule

          sig do
            params(
              schedule:
                ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::OrHash
            ).void
          end
          attr_writer :schedule

          sig do
            returns(
              ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          sig do
            returns(
              ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target
            )
          end
          attr_reader :target

          sig do
            params(
              target:
                ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target::OrHash
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
                ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Webhook
              )
            )
          end
          attr_reader :webhook

          sig do
            params(
              webhook:
                T.nilable(
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Webhook::OrHash
                )
            ).void
          end
          attr_writer :webhook

          # A sitemap monitor using exact change detection.
          sig do
            params(
              id: String,
              change_detection:
                ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection::OrHash,
              created_at: Time,
              name: String,
              schedule:
                ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::OrHash,
              status:
                ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Status::OrSymbol,
              target:
                ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target::OrHash,
              updated_at: Time,
              last_change_at: T.nilable(Time),
              last_run_at: T.nilable(Time),
              tags: T::Array[String],
              webhook:
                T.nilable(
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Webhook::OrHash
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection,
                created_at: Time,
                name: String,
                schedule:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule,
                status:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Status::TaggedSymbol,
                target:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target,
                updated_at: Time,
                last_change_at: T.nilable(Time),
                last_run_at: T.nilable(Time),
                tags: T::Array[String],
                webhook:
                  T.nilable(
                    ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Webhook
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection,
                  ContextDev::Internal::AnyHash
                )
              end

            sig do
              returns(
                ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            # Detect exact changes. For page targets, this means visible text diffs. For
            # sitemap targets, this means URL additions and removals.
            sig do
              params(
                type:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(type:)
            end

            sig do
              override.returns(
                {
                  type:
                    ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection::Type::TaggedSymbol
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              EXACT =
                T.let(
                  :exact,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::ChangeDetection::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule,
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
                ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            sig do
              returns(
                ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Type::OrSymbol,
                unit:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Unit::OrSymbol
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Type::TaggedSymbol,
                  unit:
                    ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              INTERVAL =
                T.let(
                  :interval,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Type::TaggedSymbol
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Unit
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MINUTES =
                T.let(
                  :minutes,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
                )
              HOURS =
                T.let(
                  :hours,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
                )
              DAYS =
                T.let(
                  :days,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Schedule::Unit::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ACTIVE =
              T.let(
                :active,
                ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Status::TaggedSymbol
              )
            PAUSED =
              T.let(
                :paused,
                ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Status::TaggedSymbol
              )
            FAILED =
              T.let(
                :failed,
                ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Status::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target,
                  ContextDev::Internal::AnyHash
                )
              end

            sig do
              returns(
                ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target::Type::OrSymbol,
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target::Type::TaggedSymbol,
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              SITEMAP =
                T.let(
                  :sitemap,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Target::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsSitemapExactMonitor::Webhook,
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

            sig do
              params(url: String, secret: String).returns(T.attached_class)
            end
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
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          # Detect meaning-level changes that match a natural language query.
          sig do
            returns(
              ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection
            )
          end
          attr_reader :change_detection

          sig do
            params(
              change_detection:
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection::OrHash
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
              ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule
            )
          end
          attr_reader :schedule

          sig do
            params(
              schedule:
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::OrHash
            ).void
          end
          attr_writer :schedule

          sig do
            returns(
              ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          sig do
            returns(
              ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target
            )
          end
          attr_reader :target

          sig do
            params(
              target:
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target::OrHash
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
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Webhook
              )
            )
          end
          attr_reader :webhook

          sig do
            params(
              webhook:
                T.nilable(
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Webhook::OrHash
                )
            ).void
          end
          attr_writer :webhook

          # A page monitor using semantic change detection.
          sig do
            params(
              id: String,
              change_detection:
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection::OrHash,
              created_at: Time,
              name: String,
              schedule:
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::OrHash,
              status:
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Status::OrSymbol,
              target:
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target::OrHash,
              updated_at: Time,
              last_change_at: T.nilable(Time),
              last_run_at: T.nilable(Time),
              tags: T::Array[String],
              webhook:
                T.nilable(
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Webhook::OrHash
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection,
                created_at: Time,
                name: String,
                schedule:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule,
                status:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Status::TaggedSymbol,
                target:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target,
                updated_at: Time,
                last_change_at: T.nilable(Time),
                last_run_at: T.nilable(Time),
                tags: T::Array[String],
                webhook:
                  T.nilable(
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Webhook
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection,
                  ContextDev::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :query

            sig do
              returns(
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection::Type::OrSymbol,
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection::Type::TaggedSymbol,
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              SEMANTIC =
                T.let(
                  :semantic,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::ChangeDetection::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule,
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
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            sig do
              returns(
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Type::OrSymbol,
                unit:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Unit::OrSymbol
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Type::TaggedSymbol,
                  unit:
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              INTERVAL =
                T.let(
                  :interval,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Type::TaggedSymbol
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Unit
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MINUTES =
                T.let(
                  :minutes,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
                )
              HOURS =
                T.let(
                  :hours,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
                )
              DAYS =
                T.let(
                  :days,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Schedule::Unit::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ACTIVE =
              T.let(
                :active,
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Status::TaggedSymbol
              )
            PAUSED =
              T.let(
                :paused,
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Status::TaggedSymbol
              )
            FAILED =
              T.let(
                :failed,
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Status::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target,
                  ContextDev::Internal::AnyHash
                )
              end

            sig do
              returns(
                ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target::Type::OrSymbol,
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target::Type::TaggedSymbol,
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              PAGE =
                T.let(
                  :page,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Target::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsPageSemanticMonitor::Webhook,
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

            sig do
              params(url: String, secret: String).returns(T.attached_class)
            end
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
                ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          # Detect meaning-level changes that match a natural language query.
          sig do
            returns(
              ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection
            )
          end
          attr_reader :change_detection

          sig do
            params(
              change_detection:
                ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection::OrHash
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
              ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule
            )
          end
          attr_reader :schedule

          sig do
            params(
              schedule:
                ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::OrHash
            ).void
          end
          attr_writer :schedule

          sig do
            returns(
              ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          sig do
            returns(
              ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target
            )
          end
          attr_reader :target

          sig do
            params(
              target:
                ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target::OrHash
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
                ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Webhook
              )
            )
          end
          attr_reader :webhook

          sig do
            params(
              webhook:
                T.nilable(
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Webhook::OrHash
                )
            ).void
          end
          attr_writer :webhook

          # An extract monitor using semantic change detection.
          sig do
            params(
              id: String,
              change_detection:
                ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection::OrHash,
              created_at: Time,
              name: String,
              schedule:
                ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::OrHash,
              status:
                ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Status::OrSymbol,
              target:
                ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target::OrHash,
              updated_at: Time,
              last_change_at: T.nilable(Time),
              last_run_at: T.nilable(Time),
              tags: T::Array[String],
              webhook:
                T.nilable(
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Webhook::OrHash
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection,
                created_at: Time,
                name: String,
                schedule:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule,
                status:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Status::TaggedSymbol,
                target:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target,
                updated_at: Time,
                last_change_at: T.nilable(Time),
                last_run_at: T.nilable(Time),
                tags: T::Array[String],
                webhook:
                  T.nilable(
                    ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Webhook
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection,
                  ContextDev::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :query

            sig do
              returns(
                ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection::Type::OrSymbol,
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection::Type::TaggedSymbol,
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              SEMANTIC =
                T.let(
                  :semantic,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::ChangeDetection::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule,
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
                ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            sig do
              returns(
                ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Type::OrSymbol,
                unit:
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Unit::OrSymbol
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Type::TaggedSymbol,
                  unit:
                    ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              INTERVAL =
                T.let(
                  :interval,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Type::TaggedSymbol
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Unit
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MINUTES =
                T.let(
                  :minutes,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
                )
              HOURS =
                T.let(
                  :hours,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
                )
              DAYS =
                T.let(
                  :days,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Schedule::Unit::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ACTIVE =
              T.let(
                :active,
                ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Status::TaggedSymbol
              )
            PAUSED =
              T.let(
                :paused,
                ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Status::TaggedSymbol
              )
            FAILED =
              T.let(
                :failed,
                ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Status::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target,
                  ContextDev::Internal::AnyHash
                )
              end

            sig do
              returns(
                ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target::Type::OrSymbol,
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target::Type::TaggedSymbol,
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
                    ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              EXTRACT =
                T.let(
                  :extract,
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Target::Type::TaggedSymbol
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
                  ContextDev::Models::MonitorListResponse::Data::MonitorsExtractSemanticMonitor::Webhook,
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

            sig do
              params(url: String, secret: String).returns(T.attached_class)
            end
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
            T::Array[ContextDev::Models::MonitorListResponse::Data::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
