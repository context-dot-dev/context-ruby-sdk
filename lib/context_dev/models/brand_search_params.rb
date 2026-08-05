# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Brand#search
    class BrandSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute query
      #   Search term, matched against brand names and domains by prefix (e.g. 'nike',
      #   'nike.com', 'nik').
      #
      #   @return [String]
      required :query, String

      # @!attribute tags
      #   Optional comma-separated caller-defined tags for tracking this request. Tags are
      #   recorded on the request's usage log and can be used to filter usage on the
      #   dashboard usage page. Up to 20 tags, each 1-50 characters.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!method initialize(query:, tags: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BrandSearchParams} for more details.
      #
      #   @param query [String] Search term, matched against brand names and domains by prefix (e.g. 'nike', 'ni
      #
      #   @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
