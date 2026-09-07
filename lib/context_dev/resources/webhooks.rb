# frozen_string_literal: true

module ContextDev
  module Resources
    class Webhooks
      # Inspect and retry batch and monitor webhook deliveries without rerunning the
      # underlying work.
      # @return [ContextDev::Resources::Webhooks::Deliveries]
      attr_reader :deliveries

      # @api private
      #
      # @param client [ContextDev::Client]
      def initialize(client:)
        @client = client
        @deliveries = ContextDev::Resources::Webhooks::Deliveries.new(client: client)
      end
    end
  end
end
