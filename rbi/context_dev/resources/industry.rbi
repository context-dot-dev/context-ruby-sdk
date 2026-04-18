# typed: strong

module ContextDev
  module Resources
    class Industry
      # @api private
      sig { params(client: ContextDev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
