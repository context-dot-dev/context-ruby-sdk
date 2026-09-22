# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#retrieve_run
    class MonitorRetrieveRunParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute monitor_id
      #
      #   @return [String]
      required :monitor_id, String

      # @!attribute run_id
      #
      #   @return [String]
      required :run_id, String

      # @!method initialize(monitor_id:, run_id:, request_options: {})
      #   @param monitor_id [String]
      #   @param run_id [String]
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
