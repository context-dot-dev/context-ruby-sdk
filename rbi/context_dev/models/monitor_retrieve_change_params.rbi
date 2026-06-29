# typed: strong

module ContextDev
  module Models
    class MonitorRetrieveChangeParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::MonitorRetrieveChangeParams,
            ContextDev::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :change_id

      sig do
        params(
          change_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(change_id:, request_options: {})
      end

      sig do
        override.returns(
          { change_id: String, request_options: ContextDev::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
