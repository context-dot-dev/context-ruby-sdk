# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#map_urls
    class WebMapURLsResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute domain
      #
      #   @return [String]
      required :domain, String

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute success
      #
      #   @return [Boolean, ContextDev::Models::WebMapURLsResponse::Success]
      required :success, enum: -> { ContextDev::Models::WebMapURLsResponse::Success }

      # @!attribute urls
      #
      #   @return [Array<ContextDev::Models::WebMapURLsResponse::URL>]
      required :urls, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebMapURLsResponse::URL] }

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::WebMapURLsResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebMapURLsResponse::KeyMetadata }

      # @!attribute partial
      #
      #   @return [Boolean, nil]
      optional :partial, ContextDev::Internal::Type::Boolean

      # @!method initialize(domain:, request_id:, success:, urls:, key_metadata: nil, partial: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebMapURLsResponse} for more details.
      #
      #   @param domain [String]
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param success [Boolean, ContextDev::Models::WebMapURLsResponse::Success]
      #
      #   @param urls [Array<ContextDev::Models::WebMapURLsResponse::URL>]
      #
      #   @param key_metadata [ContextDev::Models::WebMapURLsResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param partial [Boolean]

      # @see ContextDev::Models::WebMapURLsResponse#success
      module Success
        extend ContextDev::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      class URL < ContextDev::Internal::Type::BaseModel
        # @!attribute url
        #
        #   @return [String]
        required :url, String

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute keywords
        #
        #   @return [Array<String>, nil]
        optional :keywords, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute language
        #
        #   @return [String, nil]
        optional :language, String

        # @!attribute title
        #
        #   @return [String, nil]
        optional :title, String

        # @!method initialize(url:, description: nil, keywords: nil, language: nil, title: nil)
        #   @param url [String]
        #   @param description [String]
        #   @param keywords [Array<String>]
        #   @param language [String]
        #   @param title [String]
      end

      # @see ContextDev::Models::WebMapURLsResponse#key_metadata
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
