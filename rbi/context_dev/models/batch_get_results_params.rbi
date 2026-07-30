# typed: strong

module ContextDev
  module Models
    class BatchGetResultsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::BatchGetResultsParams,
            ContextDev::Internal::AnyHash
          )
        end

      # ID of the batch to retrieve or cancel.
      sig { returns(String) }
      attr_accessor :batch_id

      # next_cursor from the previous page.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Records per page. Defaults to 25. A page can close early so its payload stays
      # under ~8 MB; rely on next_cursor rather than counting records.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          batch_id: String,
          cursor: String,
          limit: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the batch to retrieve or cancel.
        batch_id:,
        # next_cursor from the previous page.
        cursor: nil,
        # Records per page. Defaults to 25. A page can close early so its payload stays
        # under ~8 MB; rely on next_cursor rather than counting records.
        limit: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            batch_id: String,
            cursor: String,
            limit: Integer,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
