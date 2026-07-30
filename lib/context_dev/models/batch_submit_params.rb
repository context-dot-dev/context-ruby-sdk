# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#submit
    class BatchSubmitParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute identifiers
      #   Known identifiers for the person. At least one identifier is required.
      #
      #   @return [ContextDev::Models::BatchSubmitParams::Identifiers]
      required :identifiers, -> { ContextDev::BatchSubmitParams::Identifiers }

      # @!attribute tags
      #   Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_ms
      #   Optional timeout in milliseconds for the request. If the request takes longer
      #   than this value, it will be aborted with a 408 status code. Maximum allowed
      #   value is 300000ms (5 minutes).
      #
      #   @return [Integer, nil]
      optional :timeout_ms, Integer, api_name: :timeoutMS

      # @!method initialize(identifiers:, tags: nil, timeout_ms: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchSubmitParams} for more details.
      #
      #   @param identifiers [ContextDev::Models::BatchSubmitParams::Identifiers] Known identifiers for the person. At least one identifier is required.
      #
      #   @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      class Identifiers < ContextDev::Internal::Type::BaseModel
        # @!attribute linkedin_url
        #   LinkedIn profile URL, e.g. https://www.linkedin.com/in/yahia-bakour/.
        #
        #   @return [String, nil]
        optional :linkedin_url, String, api_name: :linkedinUrl

        # @!method initialize(linkedin_url: nil)
        #   Known identifiers for the person. At least one identifier is required.
        #
        #   @param linkedin_url [String] LinkedIn profile URL, e.g. https://www.linkedin.com/in/yahia-bakour/.
      end
    end
  end
end
