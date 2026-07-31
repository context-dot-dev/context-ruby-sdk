# typed: strong

module ContextDev
  module Models
    class BatchCancelParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::BatchCancelParams, ContextDev::Internal::AnyHash)
        end

      # ID of the batch to retrieve or cancel.
      sig { returns(String) }
      attr_accessor :batch_id

      sig do
        params(
          batch_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the batch to retrieve or cancel.
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
