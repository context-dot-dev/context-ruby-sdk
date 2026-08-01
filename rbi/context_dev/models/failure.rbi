# typed: strong

module ContextDev
  module Models
    class Failure < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ContextDev::Failure, ContextDev::Internal::AnyHash)
        end

      # Why the batch itself stopped.
      sig { returns(String) }
      attr_accessor :code

      # Human-readable explanation.
      sig { returns(String) }
      attr_accessor :message

      # A failure of the batch as a whole, distinct from the per-page failures in
      # `page_errors`.
      sig { params(code: String, message: String).returns(T.attached_class) }
      def self.new(
        # Why the batch itself stopped.
        code:,
        # Human-readable explanation.
        message:
      )
      end

      sig { override.returns({ code: String, message: String }) }
      def to_hash
      end
    end
  end
end
