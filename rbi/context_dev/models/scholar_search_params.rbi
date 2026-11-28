# typed: strong

module ContextDev
  module Models
    class ScholarSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::ScholarSearchParams, ContextDev::Internal::AnyHash)
        end

      # Topic or question to search for. Append one `arxiv:`, `pmcid:`, `pmid:`, or
      # `doi:` ID to search within that paper, such as `protein folding pmid:34265844`,
      # or send the ID on its own.
      sig { returns(String) }
      attr_accessor :query

      # Cursor from the previous page's `next_cursor`. Omit for the first page.
      sig { returns(T.nilable(String)) }
      attr_accessor :cursor

      # Filter by publication date.
      sig { returns(T.nilable(ContextDev::ScholarSearchParams::FilterBy)) }
      attr_reader :filter_by

      sig do
        params(
          filter_by: ContextDev::ScholarSearchParams::FilterBy::OrHash
        ).void
      end
      attr_writer :filter_by

      # Maximum number of papers to return per page.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # `relevance` puts the closest matches first; `date_desc` puts the newest papers
      # first, with undated papers last. Both orders apply to the top 250 matches.
      sig do
        returns(T.nilable(ContextDev::ScholarSearchParams::Sort::OrSymbol))
      end
      attr_reader :sort

      sig { params(sort: ContextDev::ScholarSearchParams::Sort::OrSymbol).void }
      attr_writer :sort

      # Labels for this request. Filter usage and request logs by them in the dashboard
      # or with `GET /org/logs`.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      sig do
        params(
          query: String,
          cursor: T.nilable(String),
          filter_by: ContextDev::ScholarSearchParams::FilterBy::OrHash,
          limit: Integer,
          sort: ContextDev::ScholarSearchParams::Sort::OrSymbol,
          tags: T::Array[String],
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Topic or question to search for. Append one `arxiv:`, `pmcid:`, `pmid:`, or
        # `doi:` ID to search within that paper, such as `protein folding pmid:34265844`,
        # or send the ID on its own.
        query:,
        # Cursor from the previous page's `next_cursor`. Omit for the first page.
        cursor: nil,
        # Filter by publication date.
        filter_by: nil,
        # Maximum number of papers to return per page.
        limit: nil,
        # `relevance` puts the closest matches first; `date_desc` puts the newest papers
        # first, with undated papers last. Both orders apply to the top 250 matches.
        sort: nil,
        # Labels for this request. Filter usage and request logs by them in the dashboard
        # or with `GET /org/logs`.
        tags: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            query: String,
            cursor: T.nilable(String),
            filter_by: ContextDev::ScholarSearchParams::FilterBy,
            limit: Integer,
            sort: ContextDev::ScholarSearchParams::Sort::OrSymbol,
            tags: T::Array[String],
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class FilterBy < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::ScholarSearchParams::FilterBy,
              ContextDev::Internal::AnyHash
            )
          end

        # Publication date range. Undated papers are excluded.
        sig do
          returns(T.nilable(ContextDev::ScholarSearchParams::FilterBy::Date))
        end
        attr_reader :date

        sig do
          params(
            date: ContextDev::ScholarSearchParams::FilterBy::Date::OrHash
          ).void
        end
        attr_writer :date

        # Filter by publication date.
        sig do
          params(
            date: ContextDev::ScholarSearchParams::FilterBy::Date::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Publication date range. Undated papers are excluded.
          date: nil
        )
        end

        sig do
          override.returns(
            { date: ContextDev::ScholarSearchParams::FilterBy::Date }
          )
        end
        def to_hash
        end

        class Date < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::ScholarSearchParams::FilterBy::Date,
                ContextDev::Internal::AnyHash
              )
            end

          # Inclusive start date, in Unix milliseconds.
          sig { returns(T.nilable(Integer)) }
          attr_reader :from

          sig { params(from: Integer).void }
          attr_writer :from

          # Inclusive end date, in Unix milliseconds.
          sig { returns(T.nilable(Integer)) }
          attr_reader :to

          sig { params(to: Integer).void }
          attr_writer :to

          # Publication date range. Undated papers are excluded.
          sig { params(from: Integer, to: Integer).returns(T.attached_class) }
          def self.new(
            # Inclusive start date, in Unix milliseconds.
            from: nil,
            # Inclusive end date, in Unix milliseconds.
            to: nil
          )
          end

          sig { override.returns({ from: Integer, to: Integer }) }
          def to_hash
          end
        end
      end

      # `relevance` puts the closest matches first; `date_desc` puts the newest papers
      # first, with undated papers last. Both orders apply to the top 250 matches.
      module Sort
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::ScholarSearchParams::Sort) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        RELEVANCE =
          T.let(:relevance, ContextDev::ScholarSearchParams::Sort::TaggedSymbol)
        DATE_DESC =
          T.let(:date_desc, ContextDev::ScholarSearchParams::Sort::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::ScholarSearchParams::Sort::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
