# typed: strong

module ContextDev
  module Models
    class RetryConfig < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ContextDev::RetryConfig, ContextDev::Internal::AnyHash)
        end

      # Retry delays in seconds, totaling at most 72 hours. Use [] to disable automatic
      # retries.
      sig { returns(T.nilable(T::Array[Integer])) }
      attr_reader :delays_seconds

      sig { params(delays_seconds: T::Array[Integer]).void }
      attr_writer :delays_seconds

      # Webhook retry settings. Use {} for the default schedule.
      sig do
        params(delays_seconds: T::Array[Integer]).returns(T.attached_class)
      end
      def self.new(
        # Retry delays in seconds, totaling at most 72 hours. Use [] to disable automatic
        # retries.
        delays_seconds: nil
      )
      end

      sig { override.returns({ delays_seconds: T::Array[Integer] }) }
      def to_hash
      end
    end
  end
end
