# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#run
    class MonitorRunParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute monitor_id
      #
      #   @return [String]
      required :monitor_id, String

      # @!method initialize(monitor_id:, request_options: {})
      #   @param monitor_id [String]
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
