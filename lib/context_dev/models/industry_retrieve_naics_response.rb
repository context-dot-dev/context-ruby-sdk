# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Industry#retrieve_naics
    class IndustryRetrieveNaicsResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute codes
      #   Array of NAICS codes and titles.
      #
      #   @return [Array<ContextDev::Models::IndustryRetrieveNaicsResponse::Code>, nil]
      optional :codes,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::IndustryRetrieveNaicsResponse::Code] }

      # @!attribute domain
      #   Domain found for the brand
      #
      #   @return [String, nil]
      optional :domain, String

      # @!attribute key_metadata
      #   Metadata about the API key used for the request. Included in every response
      #   whenever a valid API key is provided, even when the response status is not 200.
      #
      #   @return [ContextDev::Models::IndustryRetrieveNaicsResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::IndustryRetrieveNaicsResponse::KeyMetadata }

      # @!attribute status
      #   Status of the response, e.g., 'ok'
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute type
      #   Industry classification type, for naics api it will be `naics`
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(codes: nil, domain: nil, key_metadata: nil, status: nil, type: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::IndustryRetrieveNaicsResponse} for more details.
      #
      #   @param codes [Array<ContextDev::Models::IndustryRetrieveNaicsResponse::Code>] Array of NAICS codes and titles.
      #
      #   @param domain [String] Domain found for the brand
      #
      #   @param key_metadata [ContextDev::Models::IndustryRetrieveNaicsResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when
      #
      #   @param status [String] Status of the response, e.g., 'ok'
      #
      #   @param type [String] Industry classification type, for naics api it will be `naics`

      class Code < ContextDev::Internal::Type::BaseModel
        # @!attribute code
        #   NAICS code
        #
        #   @return [String]
        required :code, String

        # @!attribute confidence
        #   Confidence level for how well this NAICS code matches the company description
        #
        #   @return [Symbol, ContextDev::Models::IndustryRetrieveNaicsResponse::Code::Confidence]
        required :confidence, enum: -> { ContextDev::Models::IndustryRetrieveNaicsResponse::Code::Confidence }

        # @!attribute name
        #   NAICS title
        #
        #   @return [String]
        required :name, String

        # @!method initialize(code:, confidence:, name:)
        #   @param code [String] NAICS code
        #
        #   @param confidence [Symbol, ContextDev::Models::IndustryRetrieveNaicsResponse::Code::Confidence] Confidence level for how well this NAICS code matches the company description
        #
        #   @param name [String] NAICS title

        # Confidence level for how well this NAICS code matches the company description
        #
        # @see ContextDev::Models::IndustryRetrieveNaicsResponse::Code#confidence
        module Confidence
          extend ContextDev::Internal::Type::Enum

          HIGH = :high
          MEDIUM = :medium
          LOW = :low

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::IndustryRetrieveNaicsResponse#key_metadata
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
