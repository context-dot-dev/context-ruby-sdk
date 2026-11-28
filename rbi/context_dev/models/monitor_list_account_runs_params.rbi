# typed: strong

module ContextDev
  module Models
    class MonitorListAccountRunsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::MonitorListAccountRunsParams,
            ContextDev::Internal::AnyHash
          )
        end

      # Cursor from the previous page's `next_cursor`. Omit for the first page.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Maximum number of runs to return per page. Defaults to 25.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Filter by run status.
      sig do
        returns(
          T.nilable(ContextDev::MonitorListAccountRunsParams::Status::OrSymbol)
        )
      end
      attr_reader :status

      sig do
        params(
          status: ContextDev::MonitorListAccountRunsParams::Status::OrSymbol
        ).void
      end
      attr_writer :status

      sig do
        params(
          cursor: String,
          limit: Integer,
          status: ContextDev::MonitorListAccountRunsParams::Status::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cursor from the previous page's `next_cursor`. Omit for the first page.
        cursor: nil,
        # Maximum number of runs to return per page. Defaults to 25.
        limit: nil,
        # Filter by run status.
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            limit: Integer,
            status: ContextDev::MonitorListAccountRunsParams::Status::OrSymbol,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter by run status.
      module Status
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::MonitorListAccountRunsParams::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        QUEUED =
          T.let(
            :queued,
            ContextDev::MonitorListAccountRunsParams::Status::TaggedSymbol
          )
        RUNNING =
          T.let(
            :running,
            ContextDev::MonitorListAccountRunsParams::Status::TaggedSymbol
          )
        COMPLETED =
          T.let(
            :completed,
            ContextDev::MonitorListAccountRunsParams::Status::TaggedSymbol
          )
        FAILED =
          T.let(
            :failed,
            ContextDev::MonitorListAccountRunsParams::Status::TaggedSymbol
          )
        SKIPPED =
          T.let(
            :skipped,
            ContextDev::MonitorListAccountRunsParams::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::MonitorListAccountRunsParams::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
