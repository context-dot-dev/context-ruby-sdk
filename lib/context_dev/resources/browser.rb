# frozen_string_literal: true

module ContextDev
  module Resources
    class Browser
      # List the authenticated browser profiles your organization created.
      # @return [ContextDev::Resources::Browser::Profiles]
      attr_reader :profiles

      # @api private
      #
      # @param client [ContextDev::Client]
      def initialize(client:)
        @client = client
        @profiles = ContextDev::Resources::Browser::Profiles.new(client: client)
      end
    end
  end
end
