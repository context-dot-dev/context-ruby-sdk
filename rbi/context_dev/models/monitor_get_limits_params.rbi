# typed: strong

module ContextDev
  module Models
    class MonitorGetLimitsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::MonitorGetLimitsParams,
            ContextDev::Internal::AnyHash
          )
        end

      sig do
        params(request_options: ContextDev::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: ContextDev::RequestOptions }) }
      def to_hash
      end
    end
  end
end
