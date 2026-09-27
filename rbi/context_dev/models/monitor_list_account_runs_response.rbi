# typed: strong

module ContextDev
  module Models
    class MonitorListAccountRunsResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::MonitorListAccountRunsResponse,
            ContextDev::Internal::AnyHash
          )
        end

      sig do
        returns(
          T::Array[ContextDev::Models::MonitorListAccountRunsResponse::Data]
        )
      end
      attr_accessor :data

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Credits this request used and your remaining balance.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::MonitorListAccountRunsResponse::KeyMetadata
          )
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::MonitorListAccountRunsResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          data:
            T::Array[
              ContextDev::Models::MonitorListAccountRunsResponse::Data::OrHash
            ],
          has_more: T::Boolean,
          next_cursor: T.nilable(String),
          request_id: String,
          key_metadata:
            ContextDev::Models::MonitorListAccountRunsResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        data:,
        has_more:,
        next_cursor:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Credits this request used and your remaining balance.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            data:
              T::Array[
                ContextDev::Models::MonitorListAccountRunsResponse::Data
              ],
            has_more: T::Boolean,
            next_cursor: T.nilable(String),
            request_id: String,
            key_metadata:
              ContextDev::Models::MonitorListAccountRunsResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class Data < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorListAccountRunsResponse::Data,
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
            ContextDev::Models::MonitorListAccountRunsResponse::Data::ChangeDetectionType::TaggedSymbol
          )
        end
        attr_accessor :change_detection_type

        # Credits charged for this run (0 for skipped/failed runs).
        sig { returns(Integer) }
        attr_accessor :credits_charged

        sig { returns(String) }
        attr_accessor :monitor_id

        # A baseline run follows creation or a target or detection change.
        sig do
          returns(
            ContextDev::Models::MonitorListAccountRunsResponse::Data::RunType::TaggedSymbol
          )
        end
        attr_accessor :run_type

        # Lifecycle status of a run. `skipped` runs never executed — see `skip_reason`
        # (insufficient credits, monitor paused, or superseded by a concurrent run).
        sig do
          returns(
            ContextDev::Models::MonitorListAccountRunsResponse::Data::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            ContextDev::Models::MonitorListAccountRunsResponse::Data::TargetType::TaggedSymbol
          )
        end
        attr_accessor :target_type

        sig { returns(T.nilable(String)) }
        attr_accessor :change_id

        sig { returns(T.nilable(Time)) }
        attr_accessor :completed_at

        sig do
          returns(
            T.nilable(
              ContextDev::Models::MonitorListAccountRunsResponse::Data::Error
            )
          )
        end
        attr_reader :error

        sig do
          params(
            error:
              T.nilable(
                ContextDev::Models::MonitorListAccountRunsResponse::Data::Error::OrHash
              )
          ).void
        end
        attr_writer :error

        # Why a skipped run never executed; null unless status is `skipped`.
        sig do
          returns(
            T.nilable(
              ContextDev::Models::MonitorListAccountRunsResponse::Data::SkipReason::TaggedSymbol
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

        # Deprecated. Use `webhook_deliveries` for all attempts.
        sig { returns(T.nilable(ContextDev::WebhookDelivery)) }
        attr_reader :webhook_delivery

        sig do
          params(webhook_delivery: ContextDev::WebhookDelivery::OrHash).void
        end
        attr_writer :webhook_delivery

        # Webhook delivery IDs for this run.
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
              ContextDev::Models::MonitorListAccountRunsResponse::Data::ChangeDetectionType::OrSymbol,
            credits_charged: Integer,
            monitor_id: String,
            run_type:
              ContextDev::Models::MonitorListAccountRunsResponse::Data::RunType::OrSymbol,
            status:
              ContextDev::Models::MonitorListAccountRunsResponse::Data::Status::OrSymbol,
            target_type:
              ContextDev::Models::MonitorListAccountRunsResponse::Data::TargetType::OrSymbol,
            change_id: T.nilable(String),
            completed_at: T.nilable(Time),
            error:
              T.nilable(
                ContextDev::Models::MonitorListAccountRunsResponse::Data::Error::OrHash
              ),
            skip_reason:
              T.nilable(
                ContextDev::Models::MonitorListAccountRunsResponse::Data::SkipReason::OrSymbol
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
          # A baseline run follows creation or a target or detection change.
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
          # Deprecated. Use `webhook_deliveries` for all attempts.
          webhook_delivery: nil,
          # Webhook delivery IDs for this run.
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
                ContextDev::Models::MonitorListAccountRunsResponse::Data::ChangeDetectionType::TaggedSymbol,
              credits_charged: Integer,
              monitor_id: String,
              run_type:
                ContextDev::Models::MonitorListAccountRunsResponse::Data::RunType::TaggedSymbol,
              status:
                ContextDev::Models::MonitorListAccountRunsResponse::Data::Status::TaggedSymbol,
              target_type:
                ContextDev::Models::MonitorListAccountRunsResponse::Data::TargetType::TaggedSymbol,
              change_id: T.nilable(String),
              completed_at: T.nilable(Time),
              error:
                T.nilable(
                  ContextDev::Models::MonitorListAccountRunsResponse::Data::Error
                ),
              skip_reason:
                T.nilable(
                  ContextDev::Models::MonitorListAccountRunsResponse::Data::SkipReason::TaggedSymbol
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
                ContextDev::Models::MonitorListAccountRunsResponse::Data::ChangeDetectionType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EXACT =
            T.let(
              :exact,
              ContextDev::Models::MonitorListAccountRunsResponse::Data::ChangeDetectionType::TaggedSymbol
            )
          SEMANTIC =
            T.let(
              :semantic,
              ContextDev::Models::MonitorListAccountRunsResponse::Data::ChangeDetectionType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListAccountRunsResponse::Data::ChangeDetectionType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # A baseline run follows creation or a target or detection change.
        module RunType
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorListAccountRunsResponse::Data::RunType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BASELINE =
            T.let(
              :baseline,
              ContextDev::Models::MonitorListAccountRunsResponse::Data::RunType::TaggedSymbol
            )
          SCHEDULED =
            T.let(
              :scheduled,
              ContextDev::Models::MonitorListAccountRunsResponse::Data::RunType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListAccountRunsResponse::Data::RunType::TaggedSymbol
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
                ContextDev::Models::MonitorListAccountRunsResponse::Data::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          QUEUED =
            T.let(
              :queued,
              ContextDev::Models::MonitorListAccountRunsResponse::Data::Status::TaggedSymbol
            )
          RUNNING =
            T.let(
              :running,
              ContextDev::Models::MonitorListAccountRunsResponse::Data::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :completed,
              ContextDev::Models::MonitorListAccountRunsResponse::Data::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              ContextDev::Models::MonitorListAccountRunsResponse::Data::Status::TaggedSymbol
            )
          SKIPPED =
            T.let(
              :skipped,
              ContextDev::Models::MonitorListAccountRunsResponse::Data::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListAccountRunsResponse::Data::Status::TaggedSymbol
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
                ContextDev::Models::MonitorListAccountRunsResponse::Data::TargetType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PAGE =
            T.let(
              :page,
              ContextDev::Models::MonitorListAccountRunsResponse::Data::TargetType::TaggedSymbol
            )
          SITEMAP =
            T.let(
              :sitemap,
              ContextDev::Models::MonitorListAccountRunsResponse::Data::TargetType::TaggedSymbol
            )
          EXTRACT =
            T.let(
              :extract,
              ContextDev::Models::MonitorListAccountRunsResponse::Data::TargetType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListAccountRunsResponse::Data::TargetType::TaggedSymbol
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
                ContextDev::Models::MonitorListAccountRunsResponse::Data::Error,
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
                ContextDev::Models::MonitorListAccountRunsResponse::Data::SkipReason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INSUFFICIENT_CREDITS =
            T.let(
              :insufficient_credits,
              ContextDev::Models::MonitorListAccountRunsResponse::Data::SkipReason::TaggedSymbol
            )
          MONITOR_PAUSED =
            T.let(
              :monitor_paused,
              ContextDev::Models::MonitorListAccountRunsResponse::Data::SkipReason::TaggedSymbol
            )
          SUPERSEDED =
            T.let(
              :superseded,
              ContextDev::Models::MonitorListAccountRunsResponse::Data::SkipReason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListAccountRunsResponse::Data::SkipReason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorListAccountRunsResponse::KeyMetadata,
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
    end
  end
end
