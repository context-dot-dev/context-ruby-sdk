# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#retrieve_change
    class MonitorRetrieveChangeParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute change_id
      #
      #   @return [String]
      required :change_id, String

      # @!method initialize(change_id:, request_options: {})
      #   @param change_id [String]
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
