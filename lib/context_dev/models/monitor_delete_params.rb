# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#delete
    class MonitorDeleteParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute monitor_id
      #   ID of the monitor.
      #
      #   @return [String]
      required :monitor_id, String

      # @!method initialize(monitor_id:, request_options: {})
      #   @param monitor_id [String] ID of the monitor.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
