# typed: strong

module ContextDev
  module Models
    class MonitorRunResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::MonitorRunResponse,
            ContextDev::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :monitor_id

      sig { returns(T::Boolean) }
      attr_accessor :queued

      sig do
        params(monitor_id: String, queued: T::Boolean).returns(T.attached_class)
      end
      def self.new(monitor_id:, queued:)
      end

      sig { override.returns({ monitor_id: String, queued: T::Boolean }) }
      def to_hash
      end
    end
  end
end
