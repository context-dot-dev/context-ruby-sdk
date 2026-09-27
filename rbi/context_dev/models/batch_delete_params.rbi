# typed: strong

module ContextDev
  module Models
    class BatchDeleteParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::BatchDeleteParams, ContextDev::Internal::AnyHash)
        end

      # Batch ID.
      sig { returns(String) }
      attr_accessor :batch_id

      sig do
        params(
          batch_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Batch ID.
        batch_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { batch_id: String, request_options: ContextDev::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
