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

      # Search term, matched against brand names and domains by prefix (e.g. 'nike',
      # 'nike.com', 'nik').
      sig { returns(String) }
      attr_accessor :query

      # Optional comma-separated caller-defined tags for tracking this request. Tags are
      # recorded on the request's usage log and can be used to filter usage on the
      # dashboard usage page. Up to 20 tags, each 1-50 characters.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      sig do
        params(
          query: String,
          tags: T::Array[String],
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Search term, matched against brand names and domains by prefix (e.g. 'nike',
        # 'nike.com', 'nik').
        query:,
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
            query: String,
            tags: T::Array[String],
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
