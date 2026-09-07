# typed: strong

module ContextDev
  module Models
    class RetryConfig < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ContextDev::RetryConfig, ContextDev::Internal::AnyHash)
        end

      # Wait in seconds after each failed attempt. The first attempt is immediate. At
      # most 10 delays, each 1–86400 seconds, totaling at most 72 hours. Small jitter is
      # added automatically. An empty array disables automatic retries; manual retries
      # remain available.
      sig { returns(T.nilable(T::Array[Integer])) }
      attr_reader :delays_seconds

      sig { params(delays_seconds: T::Array[Integer]).void }
      attr_writer :delays_seconds

      # Opt into durable webhook delivery. An empty object uses the default retry
      # schedule. Omit retry to preserve legacy delivery behavior. The policy is
      # snapshotted for each event.
      sig do
        params(delays_seconds: T::Array[Integer]).returns(T.attached_class)
      end
      def self.new(
        # Wait in seconds after each failed attempt. The first attempt is immediate. At
        # most 10 delays, each 1–86400 seconds, totaling at most 72 hours. Small jitter is
        # added automatically. An empty array disables automatic retries; manual retries
        # remain available.
        delays_seconds: nil
      )
      end

      sig { override.returns({ delays_seconds: T::Array[Integer] }) }
      def to_hash
      end
    end
  end
end
