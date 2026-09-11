# typed: strong

module ContextDev
  module Models
    class LogRetrieveParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::LogRetrieveParams, ContextDev::Internal::AnyHash)
        end

      # The request ID of the logged API call.
      sig { returns(String) }
      attr_accessor :request_id

      sig do
        params(
          request_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The request ID of the logged API call.
        request_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { request_id: String, request_options: ContextDev::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
