# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::AI#ai_query
    class AIAIQueryResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data_extracted
      #   Array of extracted data points
      #
      #   @return [Array<ContextDev::Models::AIAIQueryResponse::DataExtracted>, nil]
      optional :data_extracted,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::AIAIQueryResponse::DataExtracted] }

      # @!attribute domain
      #   The domain that was analyzed
      #
      #   @return [String, nil]
      optional :domain, String

      # @!attribute key_metadata
      #   Metadata about the API key used for the request. Included in every response
      #   whenever a valid API key is provided, even when the response status is not 200.
      #
      #   @return [ContextDev::Models::AIAIQueryResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::AIAIQueryResponse::KeyMetadata }

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

      # @!method initialize(data_extracted: nil, domain: nil, key_metadata: nil, status: nil, urls_analyzed: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::AIAIQueryResponse} for more details.
      #
      #   @param data_extracted [Array<ContextDev::Models::AIAIQueryResponse::DataExtracted>] Array of extracted data points
      #
      #   @param domain [String] The domain that was analyzed
      #
      #   @param key_metadata [ContextDev::Models::AIAIQueryResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when
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
                 union: -> { ContextDev::Models::AIAIQueryResponse::DataExtracted::DatapointValue }

        # @!method initialize(datapoint_name: nil, datapoint_value: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::AIAIQueryResponse::DataExtracted} for more details.
        #
        #   @param datapoint_name [String] Name of the extracted data point
        #
        #   @param datapoint_value [String, Float, Boolean, Array<String>, Array<Float>, Array<Object>] Value of the extracted data point. Can be a primitive type, an array of primitiv

        # Value of the extracted data point. Can be a primitive type, an array of
        # primitives, or an array of objects when datapoint_list_type is 'object'.
        #
        # @see ContextDev::Models::AIAIQueryResponse::DataExtracted#datapoint_value
        module DatapointValue
          extend ContextDev::Internal::Type::Union

          variant String

          variant Float

          variant ContextDev::Internal::Type::Boolean

          variant -> { ContextDev::Models::AIAIQueryResponse::DataExtracted::DatapointValue::StringArray }

          variant -> { ContextDev::Models::AIAIQueryResponse::DataExtracted::DatapointValue::FloatArray }

          variant -> { ContextDev::Models::AIAIQueryResponse::DataExtracted::DatapointValue::UnionMember5Array }

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

      # @see ContextDev::Models::AIAIQueryResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   The number of credits consumed by this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   The number of credits remaining for your organization after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Metadata about the API key used for the request. Included in every response
        #   whenever a valid API key is provided, even when the response status is not 200.
        #
        #   @param credits_consumed [Integer] The number of credits consumed by this request.
        #
        #   @param credits_remaining [Integer] The number of credits remaining for your organization after this request.
      end
    end
  end
end
