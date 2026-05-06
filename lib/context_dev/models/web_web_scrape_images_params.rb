# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#web_scrape_images
    class WebWebScrapeImagesParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute url
      #   Page URL to inspect. Must include http:// or https://.
      #
      #   @return [String]
      required :url, String

      # @!attribute enrichment
      #   Optional per-image processing, sent as deep-object query params such as
      #   enrichment[resolution]=true.
      #
      #   @return [ContextDev::Models::WebWebScrapeImagesParams::Enrichment, nil]
      optional :enrichment, -> { ContextDev::WebWebScrapeImagesParams::Enrichment }

      # @!attribute max_age_ms
      #   Reuse a cached result this many milliseconds old or newer. Default: 86400000 (1
      #   day). Set to 0 to bypass cache. Maximum: 2592000000 (30 days).
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer

      # @!method initialize(url:, enrichment: nil, max_age_ms: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebScrapeImagesParams} for more details.
      #
      #   @param url [String] Page URL to inspect. Must include http:// or https://.
      #
      #   @param enrichment [ContextDev::Models::WebWebScrapeImagesParams::Enrichment] Optional per-image processing, sent as deep-object query params such as enrichme
      #
      #   @param max_age_ms [Integer] Reuse a cached result this many milliseconds old or newer. Default: 86400000 (1
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      class Enrichment < ContextDev::Internal::Type::BaseModel
        # @!attribute classification
        #   Classify each image by visual asset type.
        #
        #   @return [Boolean, nil]
        optional :classification, ContextDev::Internal::Type::Boolean

        # @!attribute hosted_url
        #   Host materializable images on the Brand.dev CDN and return their URL and MIME
        #   type.
        #
        #   @return [Boolean, nil]
        optional :hosted_url, ContextDev::Internal::Type::Boolean, api_name: :hostedUrl

        # @!attribute max_time_per_ms
        #   Per-image enrichment timeout in milliseconds. Default: 6000. Maximum: 60000.
        #
        #   @return [Integer, nil]
        optional :max_time_per_ms, Integer, api_name: :maxTimePerMs

        # @!attribute resolution
        #   Measure image width and height when possible.
        #
        #   @return [Boolean, nil]
        optional :resolution, ContextDev::Internal::Type::Boolean

        # @!method initialize(classification: nil, hosted_url: nil, max_time_per_ms: nil, resolution: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebScrapeImagesParams::Enrichment} for more details.
        #
        #   Optional per-image processing, sent as deep-object query params such as
        #   enrichment[resolution]=true.
        #
        #   @param classification [Boolean] Classify each image by visual asset type.
        #
        #   @param hosted_url [Boolean] Host materializable images on the Brand.dev CDN and return their URL and MIME ty
        #
        #   @param max_time_per_ms [Integer] Per-image enrichment timeout in milliseconds. Default: 6000. Maximum: 60000.
        #
        #   @param resolution [Boolean] Measure image width and height when possible.
      end
    end
  end
end
