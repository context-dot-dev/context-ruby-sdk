# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Industry#retrieve_naics
    class IndustryRetrieveNaicsResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

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
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::IndustryRetrieveNaicsResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::IndustryRetrieveNaicsResponse::KeyMetadata }

      # @!attribute partial
      #   True when the timeout ended processing and this response contains only usable
      #   results completed so far. Unfinished results are omitted.
      #
      #   @return [Boolean, nil]
      optional :partial, ContextDev::Internal::Type::Boolean

      # @!attribute status
      #   Always `ok` on success.
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute type
      #   Industry classification type, for naics api it will be `naics`
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(request_id:, codes: nil, domain: nil, key_metadata: nil, partial: nil, status: nil, type: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::IndustryRetrieveNaicsResponse} for more details.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param codes [Array<ContextDev::Models::IndustryRetrieveNaicsResponse::Code>] Array of NAICS codes and titles.
      #
      #   @param domain [String] Domain found for the brand
      #
      #   @param key_metadata [ContextDev::Models::IndustryRetrieveNaicsResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param partial [Boolean] True when the timeout ended processing and this response contains only usable re
      #
      #   @param status [String] Always `ok` on success.
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
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits remaining for your organization.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits remaining for your organization.
      end
    end
  end
end
