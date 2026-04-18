# frozen_string_literal: true

module ContextDev
  module Resources
    class Industry
      # @api private
      #
      # @param client [ContextDev::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
