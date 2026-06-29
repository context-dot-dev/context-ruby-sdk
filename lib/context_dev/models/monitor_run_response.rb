# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#run
    class MonitorRunResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute monitor_id
      #
      #   @return [String]
      required :monitor_id, String

      # @!attribute queued
      #
      #   @return [Boolean]
      required :queued, ContextDev::Internal::Type::Boolean

      # @!method initialize(monitor_id:, queued:)
      #   @param monitor_id [String]
      #   @param queued [Boolean]
    end
  end
end
