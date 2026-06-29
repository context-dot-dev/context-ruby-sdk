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

        sig { returns(String) }
        attr_accessor :monitor_id

        # The first run after monitor creation is a baseline run.
        sig do
          returns(
            ContextDev::Models::MonitorListRunsResponse::Data::RunType::TaggedSymbol
          )
        end
        attr_accessor :run_type

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

        sig { returns(T.nilable(Time)) }
        attr_accessor :started_at

        sig do
          params(
            id: String,
            baseline_created: T::Boolean,
            change_detected: T::Boolean,
            change_detection_type:
              ContextDev::Models::MonitorListRunsResponse::Data::ChangeDetectionType::OrSymbol,
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
            started_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # True when this run established the monitor's initial baseline; baseline runs
          # perform no change detection.
          baseline_created:,
          change_detected:,
          change_detection_type:,
          monitor_id:,
          # The first run after monitor creation is a baseline run.
          run_type:,
          status:,
          target_type:,
          change_id: nil,
          completed_at: nil,
          error: nil,
          started_at: nil
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
              started_at: T.nilable(Time)
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
      end
    end
  end
end
