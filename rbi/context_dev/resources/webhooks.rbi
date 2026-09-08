# typed: strong

module ContextDev
  module Resources
    class Webhooks
      # Inspect and retry webhook deliveries. These endpoints cost no credits.
      sig { returns(ContextDev::Resources::Webhooks::Deliveries) }
      attr_reader :deliveries

      # @api private
      sig { params(client: ContextDev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
