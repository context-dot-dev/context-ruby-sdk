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

      # @!attribute run_id
      #   The queued run. Poll GET /monitors/{monitor_id}/runs or use it to correlate
      #   results.
      #
      #   @return [String]
      required :run_id, String

      # @!method initialize(monitor_id:, queued:, run_id:)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorRunResponse} for more details.
      #
      #   @param monitor_id [String]
      #
      #   @param queued [Boolean]
      #
      #   @param run_id [String] The queued run. Poll GET /monitors/{monitor_id}/runs or use it to correlate resu
    end
  end
end
