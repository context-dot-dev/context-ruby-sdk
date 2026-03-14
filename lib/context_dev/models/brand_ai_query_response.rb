# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Brand#ai_query
    class BrandAIQueryResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data_extracted
      #   Array of extracted data points
      #
      #   @return [Array<ContextDev::Models::BrandAIQueryResponse::DataExtracted>, nil]
      optional :data_extracted,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandAIQueryResponse::DataExtracted] }

      # @!attribute domain
      #   The domain that was analyzed
      #
      #   @return [String, nil]
      optional :domain, String

      # @!attribute status
      #   Status of the response, e.g., 'ok'
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute urls_analyzed
      #   List of URLs that were analyzed
      #
      #   @return [Array<String>, nil]
      optional :urls_analyzed, ContextDev::Internal::Type::ArrayOf[String]

      # @!method initialize(data_extracted: nil, domain: nil, status: nil, urls_analyzed: nil)
      #   @param data_extracted [Array<ContextDev::Models::BrandAIQueryResponse::DataExtracted>] Array of extracted data points
      #
      #   @param domain [String] The domain that was analyzed
      #
      #   @param status [String] Status of the response, e.g., 'ok'
      #
      #   @param urls_analyzed [Array<String>] List of URLs that were analyzed

      class DataExtracted < ContextDev::Internal::Type::BaseModel
        # @!attribute datapoint_name
        #   Name of the extracted data point
        #
        #   @return [String, nil]
        optional :datapoint_name, String

        # @!attribute datapoint_value
        #   Value of the extracted data point. Can be a primitive type, an array of
        #   primitives, or an array of objects when datapoint_list_type is 'object'.
        #
        #   @return [String, Float, Boolean, Array<String>, Array<Float>, Array<Object>, nil]
        optional :datapoint_value,
                 union: -> { ContextDev::Models::BrandAIQueryResponse::DataExtracted::DatapointValue }

        # @!method initialize(datapoint_name: nil, datapoint_value: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::BrandAIQueryResponse::DataExtracted} for more details.
        #
        #   @param datapoint_name [String] Name of the extracted data point
        #
        #   @param datapoint_value [String, Float, Boolean, Array<String>, Array<Float>, Array<Object>] Value of the extracted data point. Can be a primitive type, an array of primitiv

        # Value of the extracted data point. Can be a primitive type, an array of
        # primitives, or an array of objects when datapoint_list_type is 'object'.
        #
        # @see ContextDev::Models::BrandAIQueryResponse::DataExtracted#datapoint_value
        module DatapointValue
          extend ContextDev::Internal::Type::Union

          variant String

          variant Float

          variant ContextDev::Internal::Type::Boolean

          variant -> { ContextDev::Models::BrandAIQueryResponse::DataExtracted::DatapointValue::StringArray }

          variant -> { ContextDev::Models::BrandAIQueryResponse::DataExtracted::DatapointValue::FloatArray }

          variant -> { ContextDev::Models::BrandAIQueryResponse::DataExtracted::DatapointValue::UnionMember5Array }

          # @!method self.variants
          #   @return [Array(String, Float, Boolean, Array<String>, Array<Float>, Array<Object>)]

          # @type [ContextDev::Internal::Type::Converter]
          StringArray = ContextDev::Internal::Type::ArrayOf[String]

          # @type [ContextDev::Internal::Type::Converter]
          FloatArray = ContextDev::Internal::Type::ArrayOf[Float]

          # @type [ContextDev::Internal::Type::Converter]
          UnionMember5Array = ContextDev::Internal::Type::ArrayOf[ContextDev::Internal::Type::Unknown]
        end
      end
    end
  end
end
