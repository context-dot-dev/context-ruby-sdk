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

      # Free-text search term, matched against the batch id, crawl source (start URL or
      # sitemap domain), and tags.
      sig { returns(T.nilable(String)) }
      attr_reader :q

      sig { params(q: String).void }
      attr_writer :q

      # `prefix` for as-you-type prefix matching (default), `exact` for full-token
      # matching.
      sig do
        returns(T.nilable(ContextDev::BatchListParams::SearchType::OrSymbol))
      end
      attr_reader :search_type

      sig do
        params(
          search_type: ContextDev::BatchListParams::SearchType::OrSymbol
        ).void
      end
      attr_writer :search_type

      # Filter by status.
      sig { returns(T.nilable(ContextDev::BatchListParams::Status::OrSymbol)) }
      attr_reader :status

      sig { params(status: ContextDev::BatchListParams::Status::OrSymbol).void }
      attr_writer :status

      # Comma-separated list of tags to filter by (matches batches having any of them).
      sig { returns(T.nilable(String)) }
      attr_reader :tags

      sig { params(tags: String).void }
      attr_writer :tags

      sig do
        params(
          cursor: String,
          limit: Integer,
          q: String,
          search_type: ContextDev::BatchListParams::SearchType::OrSymbol,
          status: ContextDev::BatchListParams::Status::OrSymbol,
          tags: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cursor from the previous page.
        cursor: nil,
        # Batches per page. Defaults to 25.
        limit: nil,
        # Free-text search term, matched against the batch id, crawl source (start URL or
        # sitemap domain), and tags.
        q: nil,
        # `prefix` for as-you-type prefix matching (default), `exact` for full-token
        # matching.
        search_type: nil,
        # Filter by status.
        status: nil,
        # Comma-separated list of tags to filter by (matches batches having any of them).
        tags: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            limit: Integer,
            q: String,
            search_type: ContextDev::BatchListParams::SearchType::OrSymbol,
            status: ContextDev::BatchListParams::Status::OrSymbol,
            tags: String,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # `prefix` for as-you-type prefix matching (default), `exact` for full-token
      # matching.
      module SearchType
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::BatchListParams::SearchType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EXACT =
          T.let(:exact, ContextDev::BatchListParams::SearchType::TaggedSymbol)
        PREFIX =
          T.let(:prefix, ContextDev::BatchListParams::SearchType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::BatchListParams::SearchType::TaggedSymbol]
          )
        end
        def self.values
        end
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
