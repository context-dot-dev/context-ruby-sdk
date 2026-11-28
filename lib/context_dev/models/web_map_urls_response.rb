# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#map_urls
    class WebMapURLsResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute domain
      #   Normalized domain that was mapped.
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
      #   Always `true` on success.
      #
      #   @return [Boolean, ContextDev::Models::WebMapURLsResponse::Success]
      required :success, enum: -> { ContextDev::Models::WebMapURLsResponse::Success }

      # @!attribute urls
      #   URLs found on the domain, with page metadata when available.
      #
      #   @return [Array<ContextDev::Models::WebMapURLsResponse::URL>]
      required :urls, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebMapURLsResponse::URL] }

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::WebMapURLsResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebMapURLsResponse::KeyMetadata }

      # @!attribute partial
      #   `true` when the deadline passed with `timeoutOpts.behavior` set to
      #   `return-partial`. Only results finished in time are included.
      #
      #   @return [Boolean, nil]
      optional :partial, ContextDev::Internal::Type::Boolean

      # @!method initialize(domain:, request_id:, success:, urls:, key_metadata: nil, partial: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebMapURLsResponse} for more details.
      #
      #   @param domain [String] Normalized domain that was mapped.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param success [Boolean, ContextDev::Models::WebMapURLsResponse::Success] Always `true` on success.
      #
      #   @param urls [Array<ContextDev::Models::WebMapURLsResponse::URL>] URLs found on the domain, with page metadata when available.
      #
      #   @param key_metadata [ContextDev::Models::WebMapURLsResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param partial [Boolean] `true` when the deadline passed with `timeoutOpts.behavior` set to `return-parti

      # Always `true` on success.
      #
      # @see ContextDev::Models::WebMapURLsResponse#success
      module Success
        extend ContextDev::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      class URL < ContextDev::Internal::Type::BaseModel
        # @!attribute url
        #   Page URL.
        #
        #   @return [String]
        required :url, String

        # @!attribute description
        #   Page description, when available.
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute keywords
        #   Keywords from the page's `keywords` meta tag.
        #
        #   @return [Array<String>, nil]
        optional :keywords, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute language
        #   Page language, when available.
        #
        #   @return [String, nil]
        optional :language, String

        # @!attribute title
        #   Page title, when available.
        #
        #   @return [String, nil]
        optional :title, String

        # @!method initialize(url:, description: nil, keywords: nil, language: nil, title: nil)
        #   @param url [String] Page URL.
        #
        #   @param description [String] Page description, when available.
        #
        #   @param keywords [Array<String>] Keywords from the page's `keywords` meta tag.
        #
        #   @param language [String] Page language, when available.
        #
        #   @param title [String] Page title, when available.
      end

      # @see ContextDev::Models::WebMapURLsResponse#key_metadata
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
