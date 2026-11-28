# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#extract_competitors
    class WebExtractCompetitorsResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute competitors
      #   Direct competitors, ordered by relevance and confidence.
      #
      #   @return [Array<ContextDev::Models::WebExtractCompetitorsResponse::Competitor>]
      required :competitors,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebExtractCompetitorsResponse::Competitor] }

      # @!attribute domain
      #   Normalized domain from the request.
      #
      #   @return [String]
      required :domain, String

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute status
      #   Always `ok` on success.
      #
      #   @return [Symbol, ContextDev::Models::WebExtractCompetitorsResponse::Status]
      required :status, enum: -> { ContextDev::Models::WebExtractCompetitorsResponse::Status }

      # @!attribute target
      #   Profile of the requested company, inferred from its website.
      #
      #   @return [ContextDev::Models::WebExtractCompetitorsResponse::Target]
      required :target, -> { ContextDev::Models::WebExtractCompetitorsResponse::Target }

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::WebExtractCompetitorsResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebExtractCompetitorsResponse::KeyMetadata }

      # @!attribute partial
      #   `true` when the deadline passed with `timeoutOpts.behavior` set to
      #   `return-partial`. Only results finished in time are included.
      #
      #   @return [Boolean, nil]
      optional :partial, ContextDev::Internal::Type::Boolean

      # @!method initialize(competitors:, domain:, request_id:, status:, target:, key_metadata: nil, partial: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebExtractCompetitorsResponse} for more details.
      #
      #   @param competitors [Array<ContextDev::Models::WebExtractCompetitorsResponse::Competitor>] Direct competitors, ordered by relevance and confidence.
      #
      #   @param domain [String] Normalized domain from the request.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param status [Symbol, ContextDev::Models::WebExtractCompetitorsResponse::Status] Always `ok` on success.
      #
      #   @param target [ContextDev::Models::WebExtractCompetitorsResponse::Target] Profile of the requested company, inferred from its website.
      #
      #   @param key_metadata [ContextDev::Models::WebExtractCompetitorsResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param partial [Boolean] `true` when the deadline passed with `timeoutOpts.behavior` set to `return-parti

      class Competitor < ContextDev::Internal::Type::BaseModel
        # @!attribute confidence
        #   Confidence that this company is a direct competitor.
        #
        #   @return [Symbol, ContextDev::Models::WebExtractCompetitorsResponse::Competitor::Confidence]
        required :confidence,
                 enum: -> { ContextDev::Models::WebExtractCompetitorsResponse::Competitor::Confidence }

        # @!attribute description
        #   Short description of what the competitor offers.
        #
        #   @return [String]
        required :description, String

        # @!attribute domain
        #   Competitor's official domain, normalized.
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
        #   Competitor's website URL.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(confidence:, description:, domain:, name:, source_urls:, url:)
        #   @param confidence [Symbol, ContextDev::Models::WebExtractCompetitorsResponse::Competitor::Confidence] Confidence that this company is a direct competitor.
        #
        #   @param description [String] Short description of what the competitor offers.
        #
        #   @param domain [String] Competitor's official domain, normalized.
        #
        #   @param name [String] Competitor company or product name.
        #
        #   @param source_urls [Array<String>] Search result URLs used as evidence for this competitor.
        #
        #   @param url [String] Competitor's website URL.

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

      # Always `ok` on success.
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
        #   Company or product name, inferred from its website.
        #
        #   @return [String]
        required :company_name, String, api_name: :companyName

        # @!attribute field
        #   Product category or market the company operates in.
        #
        #   @return [String]
        required :field, String

        # @!attribute field_description
        #   One-sentence summary of what the company sells and who it serves.
        #
        #   @return [String]
        required :field_description, String, api_name: :fieldDescription

        # @!attribute website_url
        #   Website URL that was analyzed.
        #
        #   @return [String]
        required :website_url, String, api_name: :websiteUrl

        # @!method initialize(company_name:, field:, field_description:, website_url:)
        #   Profile of the requested company, inferred from its website.
        #
        #   @param company_name [String] Company or product name, inferred from its website.
        #
        #   @param field [String] Product category or market the company operates in.
        #
        #   @param field_description [String] One-sentence summary of what the company sells and who it serves.
        #
        #   @param website_url [String] Website URL that was analyzed.
      end

      # @see ContextDev::Models::WebExtractCompetitorsResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits your organization has left after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits your organization has left after this request.
      end
    end
  end
end
