# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#delete
    class MonitorDeleteResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute deleted
      #
      #   @return [Boolean]
      required :deleted, ContextDev::Internal::Type::Boolean

      # @!method initialize(id:, deleted:)
      #   @param id [String]
      #   @param deleted [Boolean]
    end
  end
end
