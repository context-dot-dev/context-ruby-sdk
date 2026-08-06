# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#web_scrape_sitemap
    class WebWebScrapeSitemapResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute domain
      #   The normalized domain that was crawled
      #
      #   @return [String]
      required :domain, String

      # @!attribute meta
      #   Metadata about the sitemap crawl operation
      #
      #   @return [ContextDev::Models::WebWebScrapeSitemapResponse::Meta]
      required :meta, -> { ContextDev::Models::WebWebScrapeSitemapResponse::Meta }

      # @!attribute success
      #   Indicates success
      #
      #   @return [Boolean, ContextDev::Models::WebWebScrapeSitemapResponse::Success]
      required :success, enum: -> { ContextDev::Models::WebWebScrapeSitemapResponse::Success }

      # @!attribute urls
      #   Discovered page URLs from the sitemap, up to `maxLinks`. When `search` is set
      #   these are only the matching pages, most relevant first.
      #
      #   @return [Array<String>]
      required :urls, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute key_metadata
      #   Metadata about the API key used for the request. Included in every response
      #   whenever a valid API key is provided, even when the response status is not 200.
      #
      #   @return [ContextDev::Models::WebWebScrapeSitemapResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebWebScrapeSitemapResponse::KeyMetadata }

      # @!method initialize(domain:, meta:, success:, urls:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebScrapeSitemapResponse} for more details.
      #
      #   @param domain [String] The normalized domain that was crawled
      #
      #   @param meta [ContextDev::Models::WebWebScrapeSitemapResponse::Meta] Metadata about the sitemap crawl operation
      #
      #   @param success [Boolean, ContextDev::Models::WebWebScrapeSitemapResponse::Success] Indicates success
      #
      #   @param urls [Array<String>] Discovered page URLs from the sitemap, up to `maxLinks`. When `search` is set th
      #
      #   @param key_metadata [ContextDev::Models::WebWebScrapeSitemapResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when

      # @see ContextDev::Models::WebWebScrapeSitemapResponse#meta
      class Meta < ContextDev::Internal::Type::BaseModel
        # @!attribute errors
        #   Number of errors encountered during crawling
        #
        #   @return [Integer]
        required :errors, Integer

        # @!attribute sitemaps_discovered
        #   Total number of sitemap files discovered
        #
        #   @return [Integer]
        required :sitemaps_discovered, Integer, api_name: :sitemapsDiscovered

        # @!attribute sitemaps_fetched
        #   Number of sitemap files successfully fetched and parsed
        #
        #   @return [Integer]
        required :sitemaps_fetched, Integer, api_name: :sitemapsFetched

        # @!attribute sitemaps_skipped
        #   Number of sitemap files skipped (due to errors, timeouts, or limits)
        #
        #   @return [Integer]
        required :sitemaps_skipped, Integer, api_name: :sitemapsSkipped

        # @!method initialize(errors:, sitemaps_discovered:, sitemaps_fetched:, sitemaps_skipped:)
        #   Metadata about the sitemap crawl operation
        #
        #   @param errors [Integer] Number of errors encountered during crawling
        #
        #   @param sitemaps_discovered [Integer] Total number of sitemap files discovered
        #
        #   @param sitemaps_fetched [Integer] Number of sitemap files successfully fetched and parsed
        #
        #   @param sitemaps_skipped [Integer] Number of sitemap files skipped (due to errors, timeouts, or limits)
      end

      # Indicates success
      #
      # @see ContextDev::Models::WebWebScrapeSitemapResponse#success
      module Success
        extend ContextDev::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # @see ContextDev::Models::WebWebScrapeSitemapResponse#key_metadata
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
