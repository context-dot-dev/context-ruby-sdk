# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Brand#retrieve_naics
    class BrandRetrieveNaicsResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute codes
      #   Array of NAICS codes and titles.
      #
      #   @return [Array<ContextDev::Models::BrandRetrieveNaicsResponse::Code>, nil]
      optional :codes,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandRetrieveNaicsResponse::Code] }

      # @!attribute domain
      #   Domain found for the brand
      #
      #   @return [String, nil]
      optional :domain, String

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

      # @!method initialize(codes: nil, domain: nil, status: nil, type: nil)
      #   @param codes [Array<ContextDev::Models::BrandRetrieveNaicsResponse::Code>] Array of NAICS codes and titles.
      #
      #   @param domain [String] Domain found for the brand
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
        #   @return [Symbol, ContextDev::Models::BrandRetrieveNaicsResponse::Code::Confidence]
        required :confidence, enum: -> { ContextDev::Models::BrandRetrieveNaicsResponse::Code::Confidence }

        # @!attribute name
        #   NAICS title
        #
        #   @return [String]
        required :name, String

        # @!method initialize(code:, confidence:, name:)
        #   @param code [String] NAICS code
        #
        #   @param confidence [Symbol, ContextDev::Models::BrandRetrieveNaicsResponse::Code::Confidence] Confidence level for how well this NAICS code matches the company description
        #
        #   @param name [String] NAICS title

        # Confidence level for how well this NAICS code matches the company description
        #
        # @see ContextDev::Models::BrandRetrieveNaicsResponse::Code#confidence
        module Confidence
          extend ContextDev::Internal::Type::Enum

          HIGH = :high
          MEDIUM = :medium
          LOW = :low

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
