# typed: strong

module ContextDev
  module Models
    class Failure < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ContextDev::Failure, ContextDev::Internal::AnyHash)
        end

      # Machine-readable failure code, such as `stalled` or `USAGE_EXCEEDED`.
      sig { returns(String) }
      attr_accessor :code

      # Human-readable explanation of the failure.
      sig { returns(String) }
      attr_accessor :message

      # Why the batch as a whole failed. Individual page failures are counted in
      # `page_errors`.
      sig { params(code: String, message: String).returns(T.attached_class) }
      def self.new(
        # Machine-readable failure code, such as `stalled` or `USAGE_EXCEEDED`.
        code:,
        # Human-readable explanation of the failure.
        message:
      )
      end

      sig { override.returns({ code: String, message: String }) }
      def to_hash
      end
    end
  end
end
