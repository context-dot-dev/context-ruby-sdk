# typed: strong

module ContextDev
  module Models
    class MonitorListRunsResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::MonitorListRunsResponse,
            ContextDev::Internal::AnyHash
          )
        end

      sig do
        returns(T::Array[ContextDev::Models::MonitorListRunsResponse::Data])
      end
      attr_accessor :data

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      sig do
        params(
          data:
            T::Array[ContextDev::Models::MonitorListRunsResponse::Data::OrHash],
          has_more: T::Boolean,
          next_cursor: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(data:, has_more:, next_cursor:)
      end

      sig do
        override.returns(
          {
            data: T::Array[ContextDev::Models::MonitorListRunsResponse::Data],
            has_more: T::Boolean,
            next_cursor: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Data < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorListRunsResponse::Data,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # True when this run established the monitor's initial baseline; baseline runs
        # perform no change detection.
        sig { returns(T::Boolean) }
        attr_accessor :baseline_created

        sig { returns(T::Boolean) }
        attr_accessor :change_detected

        sig do
          returns(
            ContextDev::Models::MonitorListRunsResponse::Data::ChangeDetectionType::TaggedSymbol
          )
        end
        attr_accessor :change_detection_type

        # Credits charged for this run (0 for skipped/failed runs).
        sig { returns(Integer) }
        attr_accessor :credits_charged

        sig { returns(String) }
        attr_accessor :monitor_id

        # The first run after monitor creation is a baseline run.
        sig do
          returns(
            ContextDev::Models::MonitorListRunsResponse::Data::RunType::TaggedSymbol
          )
        end
        attr_accessor :run_type

        # Lifecycle status of a run. `skipped` runs never executed — see `skip_reason`
        # (insufficient credits, monitor paused, or superseded by a concurrent run).
        sig do
          returns(
            ContextDev::Models::MonitorListRunsResponse::Data::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            ContextDev::Models::MonitorListRunsResponse::Data::TargetType::TaggedSymbol
          )
        end
        attr_accessor :target_type

        sig { returns(T.nilable(String)) }
        attr_accessor :change_id

        sig { returns(T.nilable(Time)) }
        attr_accessor :completed_at

        sig do
          returns(
            T.nilable(ContextDev::Models::MonitorListRunsResponse::Data::Error)
          )
        end
        attr_reader :error

        sig do
          params(
            error:
              T.nilable(
                ContextDev::Models::MonitorListRunsResponse::Data::Error::OrHash
              )
          ).void
        end
        attr_writer :error

        # Why a skipped run never executed; null unless status is `skipped`.
        sig do
          returns(
            T.nilable(
              ContextDev::Models::MonitorListRunsResponse::Data::SkipReason::TaggedSymbol
            )
          )
        end
        attr_accessor :skip_reason

        sig { returns(T.nilable(Time)) }
        attr_accessor :started_at

        # All webhook deliveries attempted by this run — one per subscribed event that
        # fired. Omitted when no webhook was attempted, including runs created before
        # event selection was added.
        sig { returns(T.nilable(T::Array[ContextDev::WebhookDelivery])) }
        attr_reader :webhook_deliveries

        sig do
          params(
            webhook_deliveries: T::Array[ContextDev::WebhookDelivery::OrHash]
          ).void
        end
        attr_writer :webhook_deliveries

        # Deprecated: use `webhook_deliveries`, which records every attempt now that a run
        # can deliver multiple events. Omitted when no webhook was attempted, including
        # historical runs created before delivery tracking was added.
        sig { returns(T.nilable(ContextDev::WebhookDelivery)) }
        attr_reader :webhook_delivery

        sig do
          params(webhook_delivery: ContextDev::WebhookDelivery::OrHash).void
        end
        attr_writer :webhook_delivery

        # Retained webhook deliveries for this run. Inspect their live state and attempt
        # history through /webhooks/deliveries. With webhook.retry configured, delivery is
        # asynchronous and the legacy webhook_delivery/webhook_deliveries outcomes are
        # omitted.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :webhook_delivery_ids

        sig { params(webhook_delivery_ids: T::Array[String]).void }
        attr_writer :webhook_delivery_ids

        sig do
          params(
            id: String,
            baseline_created: T::Boolean,
            change_detected: T::Boolean,
            change_detection_type:
              ContextDev::Models::MonitorListRunsResponse::Data::ChangeDetectionType::OrSymbol,
            credits_charged: Integer,
            monitor_id: String,
            run_type:
              ContextDev::Models::MonitorListRunsResponse::Data::RunType::OrSymbol,
            status:
              ContextDev::Models::MonitorListRunsResponse::Data::Status::OrSymbol,
            target_type:
              ContextDev::Models::MonitorListRunsResponse::Data::TargetType::OrSymbol,
            change_id: T.nilable(String),
            completed_at: T.nilable(Time),
            error:
              T.nilable(
                ContextDev::Models::MonitorListRunsResponse::Data::Error::OrHash
              ),
            skip_reason:
              T.nilable(
                ContextDev::Models::MonitorListRunsResponse::Data::SkipReason::OrSymbol
              ),
            started_at: T.nilable(Time),
            webhook_deliveries: T::Array[ContextDev::WebhookDelivery::OrHash],
            webhook_delivery: ContextDev::WebhookDelivery::OrHash,
            webhook_delivery_ids: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # True when this run established the monitor's initial baseline; baseline runs
          # perform no change detection.
          baseline_created:,
          change_detected:,
          change_detection_type:,
          # Credits charged for this run (0 for skipped/failed runs).
          credits_charged:,
          monitor_id:,
          # The first run after monitor creation is a baseline run.
          run_type:,
          # Lifecycle status of a run. `skipped` runs never executed — see `skip_reason`
          # (insufficient credits, monitor paused, or superseded by a concurrent run).
          status:,
          target_type:,
          change_id: nil,
          completed_at: nil,
          error: nil,
          # Why a skipped run never executed; null unless status is `skipped`.
          skip_reason: nil,
          started_at: nil,
          # All webhook deliveries attempted by this run — one per subscribed event that
          # fired. Omitted when no webhook was attempted, including runs created before
          # event selection was added.
          webhook_deliveries: nil,
          # Deprecated: use `webhook_deliveries`, which records every attempt now that a run
          # can deliver multiple events. Omitted when no webhook was attempted, including
          # historical runs created before delivery tracking was added.
          webhook_delivery: nil,
          # Retained webhook deliveries for this run. Inspect their live state and attempt
          # history through /webhooks/deliveries. With webhook.retry configured, delivery is
          # asynchronous and the legacy webhook_delivery/webhook_deliveries outcomes are
          # omitted.
          webhook_delivery_ids: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              baseline_created: T::Boolean,
              change_detected: T::Boolean,
              change_detection_type:
                ContextDev::Models::MonitorListRunsResponse::Data::ChangeDetectionType::TaggedSymbol,
              credits_charged: Integer,
              monitor_id: String,
              run_type:
                ContextDev::Models::MonitorListRunsResponse::Data::RunType::TaggedSymbol,
              status:
                ContextDev::Models::MonitorListRunsResponse::Data::Status::TaggedSymbol,
              target_type:
                ContextDev::Models::MonitorListRunsResponse::Data::TargetType::TaggedSymbol,
              change_id: T.nilable(String),
              completed_at: T.nilable(Time),
              error:
                T.nilable(
                  ContextDev::Models::MonitorListRunsResponse::Data::Error
                ),
              skip_reason:
                T.nilable(
                  ContextDev::Models::MonitorListRunsResponse::Data::SkipReason::TaggedSymbol
                ),
              started_at: T.nilable(Time),
              webhook_deliveries: T::Array[ContextDev::WebhookDelivery],
              webhook_delivery: ContextDev::WebhookDelivery,
              webhook_delivery_ids: T::Array[String]
            }
          )
        end
        def to_hash
        end

        module ChangeDetectionType
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorListRunsResponse::Data::ChangeDetectionType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EXACT =
            T.let(
              :exact,
              ContextDev::Models::MonitorListRunsResponse::Data::ChangeDetectionType::TaggedSymbol
            )
          SEMANTIC =
            T.let(
              :semantic,
              ContextDev::Models::MonitorListRunsResponse::Data::ChangeDetectionType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListRunsResponse::Data::ChangeDetectionType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The first run after monitor creation is a baseline run.
        module RunType
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorListRunsResponse::Data::RunType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BASELINE =
            T.let(
              :baseline,
              ContextDev::Models::MonitorListRunsResponse::Data::RunType::TaggedSymbol
            )
          SCHEDULED =
            T.let(
              :scheduled,
              ContextDev::Models::MonitorListRunsResponse::Data::RunType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListRunsResponse::Data::RunType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Lifecycle status of a run. `skipped` runs never executed — see `skip_reason`
        # (insufficient credits, monitor paused, or superseded by a concurrent run).
        module Status
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorListRunsResponse::Data::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          QUEUED =
            T.let(
              :queued,
              ContextDev::Models::MonitorListRunsResponse::Data::Status::TaggedSymbol
            )
          RUNNING =
            T.let(
              :running,
              ContextDev::Models::MonitorListRunsResponse::Data::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :completed,
              ContextDev::Models::MonitorListRunsResponse::Data::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              ContextDev::Models::MonitorListRunsResponse::Data::Status::TaggedSymbol
            )
          SKIPPED =
            T.let(
              :skipped,
              ContextDev::Models::MonitorListRunsResponse::Data::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListRunsResponse::Data::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module TargetType
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorListRunsResponse::Data::TargetType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PAGE =
            T.let(
              :page,
              ContextDev::Models::MonitorListRunsResponse::Data::TargetType::TaggedSymbol
            )
          SITEMAP =
            T.let(
              :sitemap,
              ContextDev::Models::MonitorListRunsResponse::Data::TargetType::TaggedSymbol
            )
          EXTRACT =
            T.let(
              :extract,
              ContextDev::Models::MonitorListRunsResponse::Data::TargetType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListRunsResponse::Data::TargetType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Error < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorListRunsResponse::Data::Error,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :code

          sig { returns(String) }
          attr_accessor :message

          sig do
            params(code: String, message: String).returns(T.attached_class)
          end
          def self.new(code:, message:)
          end

          sig { override.returns({ code: String, message: String }) }
          def to_hash
          end
        end

        # Why a skipped run never executed; null unless status is `skipped`.
        module SkipReason
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorListRunsResponse::Data::SkipReason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INSUFFICIENT_CREDITS =
            T.let(
              :insufficient_credits,
              ContextDev::Models::MonitorListRunsResponse::Data::SkipReason::TaggedSymbol
            )
          MONITOR_PAUSED =
            T.let(
              :monitor_paused,
              ContextDev::Models::MonitorListRunsResponse::Data::SkipReason::TaggedSymbol
            )
          SUPERSEDED =
            T.let(
              :superseded,
              ContextDev::Models::MonitorListRunsResponse::Data::SkipReason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListRunsResponse::Data::SkipReason::TaggedSymbol
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
