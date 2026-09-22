# typed: strong

module ContextDev
  module Models
    class MonitorRetrieveRunParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::MonitorRetrieveRunParams,
            ContextDev::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :monitor_id

      sig { returns(String) }
      attr_accessor :run_id

      sig do
        params(
          monitor_id: String,
          run_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(monitor_id:, run_id:, request_options: {})
      end

      sig do
        override.returns(
          {
            monitor_id: String,
            run_id: String,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
