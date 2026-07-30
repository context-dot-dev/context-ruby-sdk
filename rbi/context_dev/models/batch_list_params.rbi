# typed: strong

module ContextDev
  module Models
    class BatchListParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::BatchListParams, ContextDev::Internal::AnyHash)
        end

      # Cursor from the previous page.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Batches per page. Defaults to 25.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Filter by status.
      sig { returns(T.nilable(ContextDev::BatchListParams::Status::OrSymbol)) }
      attr_reader :status

      sig { params(status: ContextDev::BatchListParams::Status::OrSymbol).void }
      attr_writer :status

      # Optional comma-separated caller-defined tags for tracking this request. Tags are
      # recorded on the request's usage log and can be used to filter usage on the
      # dashboard usage page. Up to 20 tags, each 1-50 characters.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      sig do
        params(
          cursor: String,
          limit: Integer,
          status: ContextDev::BatchListParams::Status::OrSymbol,
          tags: T::Array[String],
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cursor from the previous page.
        cursor: nil,
        # Batches per page. Defaults to 25.
        limit: nil,
        # Filter by status.
        status: nil,
        # Optional comma-separated caller-defined tags for tracking this request. Tags are
        # recorded on the request's usage log and can be used to filter usage on the
        # dashboard usage page. Up to 20 tags, each 1-50 characters.
        tags: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            limit: Integer,
            status: ContextDev::BatchListParams::Status::OrSymbol,
            tags: T::Array[String],
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter by status.
      module Status
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::BatchListParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        QUEUED =
          T.let(:queued, ContextDev::BatchListParams::Status::TaggedSymbol)
        RUNNING =
          T.let(:running, ContextDev::BatchListParams::Status::TaggedSymbol)
        CANCELLING =
          T.let(:cancelling, ContextDev::BatchListParams::Status::TaggedSymbol)
        COMPLETED =
          T.let(:completed, ContextDev::BatchListParams::Status::TaggedSymbol)
        CANCELLED =
          T.let(:cancelled, ContextDev::BatchListParams::Status::TaggedSymbol)
        FAILED =
          T.let(:failed, ContextDev::BatchListParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::BatchListParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
