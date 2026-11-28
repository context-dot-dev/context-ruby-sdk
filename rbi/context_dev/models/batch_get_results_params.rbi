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

      # ID of the batch.
      sig { returns(String) }
      attr_accessor :batch_id

      # Cursor from the previous page's `next_cursor`. Omit for the first page.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Maximum number of results to return per page. A page can hold fewer to stay
      # under about 8 MB, so page with `next_cursor` instead of counting records.
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
        # ID of the batch.
        batch_id:,
        # Cursor from the previous page's `next_cursor`. Omit for the first page.
        cursor: nil,
        # Maximum number of results to return per page. A page can hold fewer to stay
        # under about 8 MB, so page with `next_cursor` instead of counting records.
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
