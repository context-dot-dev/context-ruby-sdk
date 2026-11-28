# typed: strong

module ContextDev
  module Resources
    class Browser
      # List the authenticated browser profiles your organization created.
      sig { returns(ContextDev::Resources::Browser::Profiles) }
      attr_reader :profiles

      # @api private
      sig { params(client: ContextDev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
