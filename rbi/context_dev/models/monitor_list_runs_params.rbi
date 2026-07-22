# typed: strong

module ContextDev
  module Models
    class MonitorListRunsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::MonitorListRunsParams,
            ContextDev::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :monitor_id

      # Opaque pagination cursor from a previous response.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Maximum number of items to return per page (1-100). Defaults to 25.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Filter runs by lifecycle status.
      sig do
        returns(T.nilable(ContextDev::MonitorListRunsParams::Status::OrSymbol))
      end
      attr_reader :status

      sig do
        params(status: ContextDev::MonitorListRunsParams::Status::OrSymbol).void
      end
      attr_writer :status

      sig do
        params(
          monitor_id: String,
          cursor: String,
          limit: Integer,
          status: ContextDev::MonitorListRunsParams::Status::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        monitor_id:,
        # Opaque pagination cursor from a previous response.
        cursor: nil,
        # Maximum number of items to return per page (1-100). Defaults to 25.
        limit: nil,
        # Filter runs by lifecycle status.
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            monitor_id: String,
            cursor: String,
            limit: Integer,
            status: ContextDev::MonitorListRunsParams::Status::OrSymbol,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter runs by lifecycle status.
      module Status
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::MonitorListRunsParams::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        QUEUED =
          T.let(
            :queued,
            ContextDev::MonitorListRunsParams::Status::TaggedSymbol
          )
        RUNNING =
          T.let(
            :running,
            ContextDev::MonitorListRunsParams::Status::TaggedSymbol
          )
        COMPLETED =
          T.let(
            :completed,
            ContextDev::MonitorListRunsParams::Status::TaggedSymbol
          )
        FAILED =
          T.let(
            :failed,
            ContextDev::MonitorListRunsParams::Status::TaggedSymbol
          )
        SKIPPED =
          T.let(
            :skipped,
            ContextDev::MonitorListRunsParams::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::MonitorListRunsParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
