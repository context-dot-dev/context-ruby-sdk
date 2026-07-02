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

      # The queued run. Poll GET /monitors/{monitor_id}/runs or use it to correlate
      # results.
      sig { returns(String) }
      attr_accessor :run_id

      sig do
        params(monitor_id: String, queued: T::Boolean, run_id: String).returns(
          T.attached_class
        )
      end
      def self.new(
        monitor_id:,
        queued:,
        # The queued run. Poll GET /monitors/{monitor_id}/runs or use it to correlate
        # results.
        run_id:
      )
      end

      sig do
        override.returns(
          { monitor_id: String, queued: T::Boolean, run_id: String }
        )
      end
      def to_hash
      end
    end
  end
end
