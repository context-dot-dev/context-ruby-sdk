# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#get_limits
    class MonitorGetLimitsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
