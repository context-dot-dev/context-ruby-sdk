# typed: strong

module ContextDev
  module Models
    class BrandSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::BrandSearchParams, ContextDev::Internal::AnyHash)
        end

      # Search term, matched against the fields selected by queryBy (e.g. 'nike',
      # 'nike.com', 'nik').
      sig { returns(String) }
      attr_accessor :query

      # Whether the search term matches by prefix, so partial words match as they are
      # typed (e.g. 'nik' matches Nike). Set to false to match whole words only.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :autocomplete

      sig { params(autocomplete: T::Boolean).void }
      attr_writer :autocomplete

      # Fields to match the search term against, as a comma-separated list or repeated
      # parameter: 'name', 'domain', or both. Defaults to both.
      sig do
        returns(
          T.nilable(T::Array[ContextDev::BrandSearchParams::QueryBy::OrSymbol])
        )
      end
      attr_reader :query_by

      sig do
        params(
          query_by: T::Array[ContextDev::BrandSearchParams::QueryBy::OrSymbol]
        ).void
      end
      attr_writer :query_by

      # Optional comma-separated caller-defined tags for tracking this request. Tags are
      # recorded on the request's usage log and can be used to filter usage on the
      # dashboard usage page. Up to 20 tags, each 1-50 characters.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Maximum number of typos tolerated when matching, from 0 to 2. Defaults to 0 (no
      # typo tolerance).
      sig { returns(T.nilable(Integer)) }
      attr_reader :typo_tolerance

      sig { params(typo_tolerance: Integer).void }
      attr_writer :typo_tolerance

      sig do
        params(
          query: String,
          autocomplete: T::Boolean,
          query_by: T::Array[ContextDev::BrandSearchParams::QueryBy::OrSymbol],
          tags: T::Array[String],
          typo_tolerance: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Search term, matched against the fields selected by queryBy (e.g. 'nike',
        # 'nike.com', 'nik').
        query:,
        # Whether the search term matches by prefix, so partial words match as they are
        # typed (e.g. 'nik' matches Nike). Set to false to match whole words only.
        autocomplete: nil,
        # Fields to match the search term against, as a comma-separated list or repeated
        # parameter: 'name', 'domain', or both. Defaults to both.
        query_by: nil,
        # Optional comma-separated caller-defined tags for tracking this request. Tags are
        # recorded on the request's usage log and can be used to filter usage on the
        # dashboard usage page. Up to 20 tags, each 1-50 characters.
        tags: nil,
        # Maximum number of typos tolerated when matching, from 0 to 2. Defaults to 0 (no
        # typo tolerance).
        typo_tolerance: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            query: String,
            autocomplete: T::Boolean,
            query_by:
              T::Array[ContextDev::BrandSearchParams::QueryBy::OrSymbol],
            tags: T::Array[String],
            typo_tolerance: Integer,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      module QueryBy
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::BrandSearchParams::QueryBy) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NAME =
          T.let(:name, ContextDev::BrandSearchParams::QueryBy::TaggedSymbol)
        DOMAIN =
          T.let(:domain, ContextDev::BrandSearchParams::QueryBy::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::BrandSearchParams::QueryBy::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
