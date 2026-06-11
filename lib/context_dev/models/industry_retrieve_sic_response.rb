# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Industry#retrieve_sic
    class IndustryRetrieveSicResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute classification
      #   Echoes back which SIC dataset was used to classify the brand.
      #
      #   @return [Symbol, ContextDev::Models::IndustryRetrieveSicResponse::Classification, nil]
      optional :classification, enum: -> { ContextDev::Models::IndustryRetrieveSicResponse::Classification }

      # @!attribute codes
      #   Array of SIC codes with confidence scores. Extra fields depend on the requested
      #   classification: `original_sic` results include `majorGroup` and
      #   `majorGroupName`; `latest_sec` results include `office`.
      #
      #   @return [Array<ContextDev::Models::IndustryRetrieveSicResponse::Code>, nil]
      optional :codes,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::IndustryRetrieveSicResponse::Code] }

      # @!attribute domain
      #   Domain found for the brand
      #
      #   @return [String, nil]
      optional :domain, String

      # @!attribute key_metadata
      #   Metadata about the API key used for the request. Included in every response
      #   whenever a valid API key is provided, even when the response status is not 200.
      #
      #   @return [ContextDev::Models::IndustryRetrieveSicResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::IndustryRetrieveSicResponse::KeyMetadata }

      # @!attribute status
      #   Status of the response, e.g., 'ok'
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute type
      #   Industry classification type, for sic api it will be `sic`
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(classification: nil, codes: nil, domain: nil, key_metadata: nil, status: nil, type: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::IndustryRetrieveSicResponse} for more details.
      #
      #   @param classification [Symbol, ContextDev::Models::IndustryRetrieveSicResponse::Classification] Echoes back which SIC dataset was used to classify the brand.
      #
      #   @param codes [Array<ContextDev::Models::IndustryRetrieveSicResponse::Code>] Array of SIC codes with confidence scores. Extra fields depend on the requested
      #
      #   @param domain [String] Domain found for the brand
      #
      #   @param key_metadata [ContextDev::Models::IndustryRetrieveSicResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when
      #
      #   @param status [String] Status of the response, e.g., 'ok'
      #
      #   @param type [String] Industry classification type, for sic api it will be `sic`

      # Echoes back which SIC dataset was used to classify the brand.
      #
      # @see ContextDev::Models::IndustryRetrieveSicResponse#classification
      module Classification
        extend ContextDev::Internal::Type::Enum

        ORIGINAL_SIC = :original_sic
        LATEST_SEC = :latest_sec

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Code < ContextDev::Internal::Type::BaseModel
        # @!attribute code
        #   SIC code (4-digit).
        #
        #   @return [String]
        required :code, String

        # @!attribute confidence
        #   Confidence level for how well this SIC code matches the company description.
        #
        #   @return [Symbol, ContextDev::Models::IndustryRetrieveSicResponse::Code::Confidence]
        required :confidence, enum: -> { ContextDev::Models::IndustryRetrieveSicResponse::Code::Confidence }

        # @!attribute name
        #   SIC industry title.
        #
        #   @return [String]
        required :name, String

        # @!attribute major_group
        #   2-digit major group identifier (the leading two digits of the code). Only
        #   present when `classification` is `original_sic`.
        #
        #   @return [String, nil]
        optional :major_group, String, api_name: :majorGroup

        # @!attribute major_group_name
        #   Description of the 2-digit major group. Only present when `classification` is
        #   `original_sic`.
        #
        #   @return [String, nil]
        optional :major_group_name, String, api_name: :majorGroupName

        # @!attribute office
        #   SEC review office responsible for filings under this code. Only present when
        #   `classification` is `latest_sec`.
        #
        #   @return [String, nil]
        optional :office, String

        # @!method initialize(code:, confidence:, name:, major_group: nil, major_group_name: nil, office: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::IndustryRetrieveSicResponse::Code} for more details.
        #
        #   @param code [String] SIC code (4-digit).
        #
        #   @param confidence [Symbol, ContextDev::Models::IndustryRetrieveSicResponse::Code::Confidence] Confidence level for how well this SIC code matches the company description.
        #
        #   @param name [String] SIC industry title.
        #
        #   @param major_group [String] 2-digit major group identifier (the leading two digits of the code). Only presen
        #
        #   @param major_group_name [String] Description of the 2-digit major group. Only present when `classification` is `o
        #
        #   @param office [String] SEC review office responsible for filings under this code. Only present when `cl

        # Confidence level for how well this SIC code matches the company description.
        #
        # @see ContextDev::Models::IndustryRetrieveSicResponse::Code#confidence
        module Confidence
          extend ContextDev::Internal::Type::Enum

          HIGH = :high
          MEDIUM = :medium
          LOW = :low

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::IndustryRetrieveSicResponse#key_metadata
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
