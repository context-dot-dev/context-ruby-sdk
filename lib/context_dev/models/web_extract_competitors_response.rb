# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#extract_competitors
    class WebExtractCompetitorsResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute competitors
      #   Direct competitors ordered by relevance and confidence.
      #
      #   @return [Array<ContextDev::Models::WebExtractCompetitorsResponse::Competitor>]
      required :competitors,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebExtractCompetitorsResponse::Competitor] }

      # @!attribute domain
      #   Normalized input domain.
      #
      #   @return [String]
      required :domain, String

      # @!attribute status
      #   Status of the response.
      #
      #   @return [Symbol, ContextDev::Models::WebExtractCompetitorsResponse::Status]
      required :status, enum: -> { ContextDev::Models::WebExtractCompetitorsResponse::Status }

      # @!attribute target
      #   Target company profile inferred from the landing page.
      #
      #   @return [ContextDev::Models::WebExtractCompetitorsResponse::Target]
      required :target, -> { ContextDev::Models::WebExtractCompetitorsResponse::Target }

      # @!attribute key_metadata
      #   Metadata about the API key used for the request. Included in every response
      #   whenever a valid API key is provided, even when the response status is not 200.
      #
      #   @return [ContextDev::Models::WebExtractCompetitorsResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebExtractCompetitorsResponse::KeyMetadata }

      # @!method initialize(competitors:, domain:, status:, target:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebExtractCompetitorsResponse} for more details.
      #
      #   @param competitors [Array<ContextDev::Models::WebExtractCompetitorsResponse::Competitor>] Direct competitors ordered by relevance and confidence.
      #
      #   @param domain [String] Normalized input domain.
      #
      #   @param status [Symbol, ContextDev::Models::WebExtractCompetitorsResponse::Status] Status of the response.
      #
      #   @param target [ContextDev::Models::WebExtractCompetitorsResponse::Target] Target company profile inferred from the landing page.
      #
      #   @param key_metadata [ContextDev::Models::WebExtractCompetitorsResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when

      class Competitor < ContextDev::Internal::Type::BaseModel
        # @!attribute confidence
        #   Confidence that this company is a direct competitor.
        #
        #   @return [Symbol, ContextDev::Models::WebExtractCompetitorsResponse::Competitor::Confidence]
        required :confidence,
                 enum: -> { ContextDev::Models::WebExtractCompetitorsResponse::Competitor::Confidence }

        # @!attribute description
        #   Short description of the competitor.
        #
        #   @return [String]
        required :description, String

        # @!attribute domain
        #   Competitor's normalized official domain.
        #
        #   @return [String]
        required :domain, String

        # @!attribute name
        #   Competitor company or product name.
        #
        #   @return [String]
        required :name, String

        # @!attribute source_urls
        #   Search result URLs used as evidence for this competitor.
        #
        #   @return [Array<String>]
        required :source_urls, ContextDev::Internal::Type::ArrayOf[String], api_name: :sourceUrls

        # @!attribute url
        #   Competitor website URL.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(confidence:, description:, domain:, name:, source_urls:, url:)
        #   @param confidence [Symbol, ContextDev::Models::WebExtractCompetitorsResponse::Competitor::Confidence] Confidence that this company is a direct competitor.
        #
        #   @param description [String] Short description of the competitor.
        #
        #   @param domain [String] Competitor's normalized official domain.
        #
        #   @param name [String] Competitor company or product name.
        #
        #   @param source_urls [Array<String>] Search result URLs used as evidence for this competitor.
        #
        #   @param url [String] Competitor website URL.

        # Confidence that this company is a direct competitor.
        #
        # @see ContextDev::Models::WebExtractCompetitorsResponse::Competitor#confidence
        module Confidence
          extend ContextDev::Internal::Type::Enum

          HIGH = :high
          MEDIUM = :medium

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # Status of the response.
      #
      # @see ContextDev::Models::WebExtractCompetitorsResponse#status
      module Status
        extend ContextDev::Internal::Type::Enum

        OK = :ok

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::WebExtractCompetitorsResponse#target
      class Target < ContextDev::Internal::Type::BaseModel
        # @!attribute company_name
        #   Company or product name inferred from the landing page.
        #
        #   @return [String]
        required :company_name, String, api_name: :companyName

        # @!attribute field
        #   Specific operating field, product category, or market.
        #
        #   @return [String]
        required :field, String

        # @!attribute field_description
        #   One-sentence description of what the target company sells and who it serves.
        #
        #   @return [String]
        required :field_description, String, api_name: :fieldDescription

        # @!attribute website_url
        #   Resolved URL used for the landing page analysis.
        #
        #   @return [String]
        required :website_url, String, api_name: :websiteUrl

        # @!method initialize(company_name:, field:, field_description:, website_url:)
        #   Target company profile inferred from the landing page.
        #
        #   @param company_name [String] Company or product name inferred from the landing page.
        #
        #   @param field [String] Specific operating field, product category, or market.
        #
        #   @param field_description [String] One-sentence description of what the target company sells and who it serves.
        #
        #   @param website_url [String] Resolved URL used for the landing page analysis.
      end

      # @see ContextDev::Models::WebExtractCompetitorsResponse#key_metadata
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
