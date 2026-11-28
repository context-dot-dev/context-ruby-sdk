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

      # Cursor from the previous page's `next_cursor`. Omit for the first page.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Maximum number of batches to return per page.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Search term matched against batch IDs, crawl sources (start URL or sitemap
      # domain), and tags.
      sig { returns(T.nilable(String)) }
      attr_reader :q

      sig { params(q: String).void }
      attr_writer :q

      # How `q` matches: `prefix` matches the start of a term, for search-as-you-type,
      # and `exact` matches whole terms. Defaults to `prefix`.
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

      # Filter by batch status.
      sig { returns(T.nilable(ContextDev::BatchListParams::Status::OrSymbol)) }
      attr_reader :status

      sig { params(status: ContextDev::BatchListParams::Status::OrSymbol).void }
      attr_writer :status

      # Comma-separated tags. Returns batches that have any of them. You can also repeat
      # the `tags` parameter.
      sig { returns(T.nilable(ContextDev::BatchListParams::Tags::Variants)) }
      attr_reader :tags

      sig { params(tags: ContextDev::BatchListParams::Tags::Variants).void }
      attr_writer :tags

      sig do
        params(
          cursor: String,
          limit: Integer,
          q: String,
          search_type: ContextDev::BatchListParams::SearchType::OrSymbol,
          status: ContextDev::BatchListParams::Status::OrSymbol,
          tags: ContextDev::BatchListParams::Tags::Variants,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cursor from the previous page's `next_cursor`. Omit for the first page.
        cursor: nil,
        # Maximum number of batches to return per page.
        limit: nil,
        # Search term matched against batch IDs, crawl sources (start URL or sitemap
        # domain), and tags.
        q: nil,
        # How `q` matches: `prefix` matches the start of a term, for search-as-you-type,
        # and `exact` matches whole terms. Defaults to `prefix`.
        search_type: nil,
        # Filter by batch status.
        status: nil,
        # Comma-separated tags. Returns batches that have any of them. You can also repeat
        # the `tags` parameter.
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
            tags: ContextDev::BatchListParams::Tags::Variants,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # How `q` matches: `prefix` matches the start of a term, for search-as-you-type,
      # and `exact` matches whole terms. Defaults to `prefix`.
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

      # Filter by batch status.
      module Status
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::BatchListParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING =
          T.let(:pending, ContextDev::BatchListParams::Status::TaggedSymbol)
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

      # Comma-separated tags. Returns batches that have any of them. You can also repeat
      # the `tags` parameter.
      module Tags
        extend ContextDev::Internal::Type::Union

        Variants = T.type_alias { T.any(String, T::Array[String]) }

        sig do
          override.returns(
            T::Array[ContextDev::BatchListParams::Tags::Variants]
          )
        end
        def self.variants
        end

        StringArray =
          T.let(
            ContextDev::Internal::Type::ArrayOf[String],
            ContextDev::Internal::Type::Converter
          )
      end
    end
  end
end
