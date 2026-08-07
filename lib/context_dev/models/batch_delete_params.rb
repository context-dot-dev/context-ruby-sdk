# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#delete
    class BatchDeleteParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute batch_id
      #   ID of the batch to retrieve or cancel.
      #
      #   @return [String]
      required :batch_id, String

      # @!method initialize(batch_id:, request_options: {})
      #   @param batch_id [String] ID of the batch to retrieve or cancel.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
