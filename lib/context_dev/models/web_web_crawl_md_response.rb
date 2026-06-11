# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#web_crawl_md
    class WebWebCrawlMdResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute metadata
      #
      #   @return [ContextDev::Models::WebWebCrawlMdResponse::Metadata]
      required :metadata, -> { ContextDev::Models::WebWebCrawlMdResponse::Metadata }

      # @!attribute results
      #
      #   @return [Array<ContextDev::Models::WebWebCrawlMdResponse::Result>]
      required :results,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebWebCrawlMdResponse::Result] }

      # @!attribute key_metadata
      #   Metadata about the API key used for the request. Included in every response
      #   whenever a valid API key is provided, even when the response status is not 200.
      #
      #   @return [ContextDev::Models::WebWebCrawlMdResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebWebCrawlMdResponse::KeyMetadata }

      # @!method initialize(metadata:, results:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebCrawlMdResponse} for more details.
      #
      #   @param metadata [ContextDev::Models::WebWebCrawlMdResponse::Metadata]
      #
      #   @param results [Array<ContextDev::Models::WebWebCrawlMdResponse::Result>]
      #
      #   @param key_metadata [ContextDev::Models::WebWebCrawlMdResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when

      # @see ContextDev::Models::WebWebCrawlMdResponse#metadata
      class Metadata < ContextDev::Internal::Type::BaseModel
        # @!attribute max_crawl_depth
        #   Maximum crawl depth reached during the crawl
        #
        #   @return [Integer]
        required :max_crawl_depth, Integer, api_name: :maxCrawlDepth

        # @!attribute num_failed
        #   Number of pages that failed to crawl
        #
        #   @return [Integer]
        required :num_failed, Integer, api_name: :numFailed

        # @!attribute num_skipped
        #   Number of URLs skipped (PDFs when pdf.shouldParse=false, or URLs not matching
        #   urlRegex)
        #
        #   @return [Integer]
        required :num_skipped, Integer, api_name: :numSkipped

        # @!attribute num_succeeded
        #   Number of pages successfully crawled
        #
        #   @return [Integer]
        required :num_succeeded, Integer, api_name: :numSucceeded

        # @!attribute num_urls
        #   Total number of URLs crawled
        #
        #   @return [Integer]
        required :num_urls, Integer, api_name: :numUrls

        # @!method initialize(max_crawl_depth:, num_failed:, num_skipped:, num_succeeded:, num_urls:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebCrawlMdResponse::Metadata} for more details.
        #
        #   @param max_crawl_depth [Integer] Maximum crawl depth reached during the crawl
        #
        #   @param num_failed [Integer] Number of pages that failed to crawl
        #
        #   @param num_skipped [Integer] Number of URLs skipped (PDFs when pdf.shouldParse=false, or URLs not matching ur
        #
        #   @param num_succeeded [Integer] Number of pages successfully crawled
        #
        #   @param num_urls [Integer] Total number of URLs crawled
      end

      class Result < ContextDev::Internal::Type::BaseModel
        # @!attribute markdown
        #   Extracted page content as Markdown (empty string on failure)
        #
        #   @return [String]
        required :markdown, String

        # @!attribute metadata
        #
        #   @return [ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata]
        required :metadata, -> { ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata }

        # @!method initialize(markdown:, metadata:)
        #   @param markdown [String] Extracted page content as Markdown (empty string on failure)
        #
        #   @param metadata [ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata]

        # @see ContextDev::Models::WebWebCrawlMdResponse::Result#metadata
        class Metadata < ContextDev::Internal::Type::BaseModel
          # @!attribute crawl_depth
          #   Depth relative to the start URL. 0 = start URL, 1 = one link away.
          #
          #   @return [Integer]
          required :crawl_depth, Integer, api_name: :crawlDepth

          # @!attribute status_code
          #   HTTP status code of the response
          #
          #   @return [Integer]
          required :status_code, Integer, api_name: :statusCode

          # @!attribute success
          #   true if the page was fetched and parsed successfully
          #
          #   @return [Boolean]
          required :success, ContextDev::Internal::Type::Boolean

          # @!attribute title
          #   The page's <title> content (empty string if unavailable)
          #
          #   @return [String]
          required :title, String

          # @!attribute url
          #   The URL that was fetched
          #
          #   @return [String]
          required :url, String

          # @!method initialize(crawl_depth:, status_code:, success:, title:, url:)
          #   @param crawl_depth [Integer] Depth relative to the start URL. 0 = start URL, 1 = one link away.
          #
          #   @param status_code [Integer] HTTP status code of the response
          #
          #   @param success [Boolean] true if the page was fetched and parsed successfully
          #
          #   @param title [String] The page's <title> content (empty string if unavailable)
          #
          #   @param url [String] The URL that was fetched
        end
      end

      # @see ContextDev::Models::WebWebCrawlMdResponse#key_metadata
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
