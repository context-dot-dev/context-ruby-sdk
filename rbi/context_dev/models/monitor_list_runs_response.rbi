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

      # Runs on this page.
      sig do
        returns(T::Array[ContextDev::Models::MonitorListRunsResponse::Data])
      end
      attr_accessor :data

      # Whether more results are available after this page.
      sig { returns(T::Boolean) }
      attr_accessor :has_more

      # Pass as `cursor` to fetch the next page. `null` on the last page.
      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Credits this request used and your remaining balance.
      sig do
        returns(
          T.nilable(ContextDev::Models::MonitorListRunsResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::MonitorListRunsResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          data:
            T::Array[ContextDev::Models::MonitorListRunsResponse::Data::OrHash],
          has_more: T::Boolean,
          next_cursor: T.nilable(String),
          request_id: String,
          key_metadata:
            ContextDev::Models::MonitorListRunsResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Runs on this page.
        data:,
        # Whether more results are available after this page.
        has_more:,
        # Pass as `cursor` to fetch the next page. `null` on the last page.
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
            data: T::Array[ContextDev::Models::MonitorListRunsResponse::Data],
            has_more: T::Boolean,
            next_cursor: T.nilable(String),
            request_id: String,
            key_metadata:
              ContextDev::Models::MonitorListRunsResponse::KeyMetadata
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

        # Unique ID of the run.
        sig { returns(String) }
        attr_accessor :id

        # `true` when this run captured the monitor's baseline instead of checking for
        # changes.
        sig { returns(T::Boolean) }
        attr_accessor :baseline_created

        # Whether the run detected a change.
        sig { returns(T::Boolean) }
        attr_accessor :change_detected

        # Change detection type the monitor uses.
        sig do
          returns(
            ContextDev::Models::MonitorListRunsResponse::Data::ChangeDetectionType::TaggedSymbol
          )
        end
        attr_accessor :change_detection_type

        # Credits charged for this run. `0` for skipped and failed runs.
        sig { returns(Integer) }
        attr_accessor :credits_charged

        # ID of the monitor this run belongs to.
        sig { returns(String) }
        attr_accessor :monitor_id

        # `baseline` runs capture a fresh baseline after creation or a target or detection
        # change. `scheduled` runs, including on-demand ones, check for changes.
        sig do
          returns(
            ContextDev::Models::MonitorListRunsResponse::Data::RunType::TaggedSymbol
          )
        end
        attr_accessor :run_type

        # Run status. `skipped` runs never executed; `skip_reason` says why.
        sig do
          returns(
            ContextDev::Models::MonitorListRunsResponse::Data::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Type of target the monitor watches.
        sig do
          returns(
            ContextDev::Models::MonitorListRunsResponse::Data::TargetType::TaggedSymbol
          )
        end
        attr_accessor :target_type

        # ID of the change this run detected. `null` when it found none.
        sig { returns(T.nilable(String)) }
        attr_accessor :change_id

        # When the run ended. `null` until it ends.
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

        # Why the run was skipped; `superseded` means a concurrent run took its place or
        # the monitor was deleted. `null` unless `status` is `skipped`.
        sig do
          returns(
            T.nilable(
              ContextDev::Models::MonitorListRunsResponse::Data::SkipReason::TaggedSymbol
            )
          )
        end
        attr_accessor :skip_reason

        # When the run started. `null` until it starts.
        sig { returns(T.nilable(Time)) }
        attr_accessor :started_at

        # Webhook deliveries for this run, one per subscribed event that fired. Omitted
        # when no delivery was attempted.
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

        # IDs of the webhook deliveries sent for this run.
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
          # Unique ID of the run.
          id:,
          # `true` when this run captured the monitor's baseline instead of checking for
          # changes.
          baseline_created:,
          # Whether the run detected a change.
          change_detected:,
          # Change detection type the monitor uses.
          change_detection_type:,
          # Credits charged for this run. `0` for skipped and failed runs.
          credits_charged:,
          # ID of the monitor this run belongs to.
          monitor_id:,
          # `baseline` runs capture a fresh baseline after creation or a target or detection
          # change. `scheduled` runs, including on-demand ones, check for changes.
          run_type:,
          # Run status. `skipped` runs never executed; `skip_reason` says why.
          status:,
          # Type of target the monitor watches.
          target_type:,
          # ID of the change this run detected. `null` when it found none.
          change_id: nil,
          # When the run ended. `null` until it ends.
          completed_at: nil,
          error: nil,
          # Why the run was skipped; `superseded` means a concurrent run took its place or
          # the monitor was deleted. `null` unless `status` is `skipped`.
          skip_reason: nil,
          # When the run started. `null` until it starts.
          started_at: nil,
          # Webhook deliveries for this run, one per subscribed event that fired. Omitted
          # when no delivery was attempted.
          webhook_deliveries: nil,
          # Deprecated. Use `webhook_deliveries` for all attempts.
          webhook_delivery: nil,
          # IDs of the webhook deliveries sent for this run.
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

        # Change detection type the monitor uses.
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

        # `baseline` runs capture a fresh baseline after creation or a target or detection
        # change. `scheduled` runs, including on-demand ones, check for changes.
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

        # Run status. `skipped` runs never executed; `skip_reason` says why.
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

        # Type of target the monitor watches.
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
          SEARCH =
            T.let(
              :search,
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

          # Machine-readable error code, such as `fetch_failed`.
          sig { returns(String) }
          attr_accessor :code

          # Human-readable explanation of the error.
          sig { returns(String) }
          attr_accessor :message

          sig do
            params(code: String, message: String).returns(T.attached_class)
          end
          def self.new(
            # Machine-readable error code, such as `fetch_failed`.
            code:,
            # Human-readable explanation of the error.
            message:
          )
          end

          sig { override.returns({ code: String, message: String }) }
          def to_hash
          end
        end

        # Why the run was skipped; `superseded` means a concurrent run took its place or
        # the monitor was deleted. `null` unless `status` is `skipped`.
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

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorListRunsResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits your organization has left after this request.
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
          # Credits your organization has left after this request.
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
