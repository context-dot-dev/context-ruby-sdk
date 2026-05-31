# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#extract
    class WebExtractResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #   Extracted data matching the request schema
      #
      #   @return [Hash{Symbol=>Object}]
      required :data, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

      # @!attribute metadata
      #
      #   @return [ContextDev::Models::WebExtractResponse::Metadata]
      required :metadata, -> { ContextDev::Models::WebExtractResponse::Metadata }

      # @!attribute status
      #   Status of the response, e.g., 'ok'
      #
      #   @return [String]
      required :status, String

      # @!attribute url
      #   The starting URL that was analyzed
      #
      #   @return [String]
      required :url, String

      # @!attribute urls_analyzed
      #   List of URLs whose Markdown was used for extraction
      #
      #   @return [Array<String>]
      required :urls_analyzed, ContextDev::Internal::Type::ArrayOf[String]

      # @!method initialize(data:, metadata:, status:, url:, urls_analyzed:)
      #   @param data [Hash{Symbol=>Object}] Extracted data matching the request schema
      #
      #   @param metadata [ContextDev::Models::WebExtractResponse::Metadata]
      #
      #   @param status [String] Status of the response, e.g., 'ok'
      #
      #   @param url [String] The starting URL that was analyzed
      #
      #   @param urls_analyzed [Array<String>] List of URLs whose Markdown was used for extraction

      # @see ContextDev::Models::WebExtractResponse#metadata
      class Metadata < ContextDev::Internal::Type::BaseModel
        # @!attribute max_crawl_depth
        #
        #   @return [Integer]
        required :max_crawl_depth, Integer, api_name: :maxCrawlDepth

        # @!attribute num_failed
        #
        #   @return [Integer]
        required :num_failed, Integer, api_name: :numFailed

        # @!attribute num_skipped
        #
        #   @return [Integer]
        required :num_skipped, Integer, api_name: :numSkipped

        # @!attribute num_succeeded
        #
        #   @return [Integer]
        required :num_succeeded, Integer, api_name: :numSucceeded

        # @!attribute num_urls
        #
        #   @return [Integer]
        required :num_urls, Integer, api_name: :numUrls

        # @!method initialize(max_crawl_depth:, num_failed:, num_skipped:, num_succeeded:, num_urls:)
        #   @param max_crawl_depth [Integer]
        #   @param num_failed [Integer]
        #   @param num_skipped [Integer]
        #   @param num_succeeded [Integer]
        #   @param num_urls [Integer]
      end
    end
  end
end
