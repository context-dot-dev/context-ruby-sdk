# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Brand#search
    class BrandSearchResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute results
      #   Up to 10 matching brands, most popular first. Empty when nothing matches.
      #
      #   @return [Array<ContextDev::Models::BrandSearchResponse::Result>]
      required :results,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandSearchResponse::Result] }

      # @!attribute key_metadata
      #   Metadata about the API key used for the request. Included in every response
      #   whenever a valid API key is provided, even when the response status is not 200.
      #
      #   @return [ContextDev::Models::BrandSearchResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BrandSearchResponse::KeyMetadata }

      # @!method initialize(results:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BrandSearchResponse} for more details.
      #
      #   @param results [Array<ContextDev::Models::BrandSearchResponse::Result>] Up to 10 matching brands, most popular first. Empty when nothing matches.
      #
      #   @param key_metadata [ContextDev::Models::BrandSearchResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when

      class Result < ContextDev::Internal::Type::BaseModel
        # @!attribute domain
        #   The brand's domain.
        #
        #   @return [String]
        required :domain, String

        # @!attribute logo
        #   Logo link URL that serves the brand's logo, generated per request for the
        #   calling organization.
        #
        #   @return [String]
        required :logo, String

        # @!attribute name
        #   The brand's name. Empty string when unknown.
        #
        #   @return [String]
        required :name, String

        # @!method initialize(domain:, logo:, name:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::BrandSearchResponse::Result} for more details.
        #
        #   @param domain [String] The brand's domain.
        #
        #   @param logo [String] Logo link URL that serves the brand's logo, generated per request for the callin
        #
        #   @param name [String] The brand's name. Empty string when unknown.
      end

      # @see ContextDev::Models::BrandSearchResponse#key_metadata
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
