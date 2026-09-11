# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Logs#retrieve
    class LogRetrieveParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute request_id
      #   The request ID of the logged API call.
      #
      #   @return [String]
      required :request_id, String

      # @!method initialize(request_id:, request_options: {})
      #   @param request_id [String] The request ID of the logged API call.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
