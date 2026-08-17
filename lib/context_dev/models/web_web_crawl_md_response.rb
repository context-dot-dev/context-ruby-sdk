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

          # @!attribute final_url
          #   Final URL scraped after redirects or scraper fallback, when known. Falls back to
          #   sourceUrl when unavailable.
          #
          #   @return [String]
          required :final_url, String, api_name: :finalUrl

          # @!attribute source_url
          #   Original URL requested by the caller.
          #
          #   @return [String]
          required :source_url, String, api_name: :sourceUrl

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
          #   Best page title extracted from the page (empty string if unavailable).
          #
          #   @return [String]
          required :title, String

          # @!attribute url
          #   The crawl URL fetched for this page.
          #
          #   @return [String]
          required :url, String

          # @!attribute additional_meta
          #   Additional non-social meta tags not promoted to top-level metadata fields.
          #
          #   @return [Hash{Symbol=>String, Array<String>}, nil]
          optional :additional_meta,
                   -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::AdditionalMeta] },
                   api_name: :additionalMeta

          # @!attribute alternates
          #   Resolved alternate links from link rel=alternate tags.
          #
          #   @return [Array<ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Alternate>, nil]
          optional :alternates,
                   -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Alternate] }

          # @!attribute author
          #   Author metadata, when present.
          #
          #   @return [String, nil]
          optional :author, String

          # @!attribute canonical_url
          #   Resolved canonical URL, when present.
          #
          #   @return [String, nil]
          optional :canonical_url, String, api_name: :canonicalUrl

          # @!attribute description
          #   Best description extracted from standard, Open Graph, or Twitter metadata.
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute favicon
          #   Resolved favicon URL, when present.
          #
          #   @return [String, nil]
          optional :favicon, String

          # @!attribute headings
          #   Page headings (h1–h6) in document order, extracted from the unfiltered document.
          #   Capped at the first 500 headings. Omitted when the page has none.
          #
          #   @return [Array<ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Heading>, nil]
          optional :headings,
                   -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Heading] }

          # @!attribute image
          #   Primary resolved preview image from Open Graph, Twitter, or image metadata.
          #
          #   @return [String, nil]
          optional :image, String

          # @!attribute json_ld
          #   JSON-LD structured data blocks parsed from the page.
          #
          #   @return [Array<Hash{Symbol=>Object}>, nil]
          optional :json_ld,
                   ContextDev::Internal::Type::ArrayOf[ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]],
                   api_name: :jsonLd

          # @!attribute keywords
          #   Keywords extracted from the page's keywords meta tag.
          #
          #   @return [Array<String>, nil]
          optional :keywords, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute language
          #   Language extracted from html lang or language meta tags.
          #
          #   @return [String, nil]
          optional :language, String

          # @!attribute modified_time
          #   Modified timestamp/date from page metadata, when present.
          #
          #   @return [String, nil]
          optional :modified_time, String, api_name: :modifiedTime

          # @!attribute open_graph
          #   Open Graph metadata with the og: prefix removed and keys camel-cased.
          #
          #   @return [Hash{Symbol=>String, Array<String>}, nil]
          optional :open_graph,
                   -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::OpenGraph] },
                   api_name: :openGraph

          # @!attribute published_time
          #   Published timestamp/date from page metadata, when present.
          #
          #   @return [String, nil]
          optional :published_time, String, api_name: :publishedTime

          # @!attribute robots
          #   Robots meta directive, when present.
          #
          #   @return [String, nil]
          optional :robots, String

          # @!attribute site_name
          #   Site or application name from page metadata.
          #
          #   @return [String, nil]
          optional :site_name, String, api_name: :siteName

          # @!attribute twitter
          #   Twitter card metadata with the twitter: prefix removed and keys camel-cased.
          #
          #   @return [Hash{Symbol=>String, Array<String>}, nil]
          optional :twitter,
                   -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Twitter] }

          # @!method initialize(crawl_depth:, final_url:, source_url:, status_code:, success:, title:, url:, additional_meta: nil, alternates: nil, author: nil, canonical_url: nil, description: nil, favicon: nil, headings: nil, image: nil, json_ld: nil, keywords: nil, language: nil, modified_time: nil, open_graph: nil, published_time: nil, robots: nil, site_name: nil, twitter: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata} for more details.
          #
          #   @param crawl_depth [Integer] Depth relative to the start URL. 0 = start URL, 1 = one link away.
          #
          #   @param final_url [String] Final URL scraped after redirects or scraper fallback, when known. Falls back to
          #
          #   @param source_url [String] Original URL requested by the caller.
          #
          #   @param status_code [Integer] HTTP status code of the response
          #
          #   @param success [Boolean] true if the page was fetched and parsed successfully
          #
          #   @param title [String] Best page title extracted from the page (empty string if unavailable).
          #
          #   @param url [String] The crawl URL fetched for this page.
          #
          #   @param additional_meta [Hash{Symbol=>String, Array<String>}] Additional non-social meta tags not promoted to top-level metadata fields.
          #
          #   @param alternates [Array<ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Alternate>] Resolved alternate links from link rel=alternate tags.
          #
          #   @param author [String] Author metadata, when present.
          #
          #   @param canonical_url [String] Resolved canonical URL, when present.
          #
          #   @param description [String] Best description extracted from standard, Open Graph, or Twitter metadata.
          #
          #   @param favicon [String] Resolved favicon URL, when present.
          #
          #   @param headings [Array<ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Heading>] Page headings (h1–h6) in document order, extracted from the unfiltered document.
          #
          #   @param image [String] Primary resolved preview image from Open Graph, Twitter, or image metadata.
          #
          #   @param json_ld [Array<Hash{Symbol=>Object}>] JSON-LD structured data blocks parsed from the page.
          #
          #   @param keywords [Array<String>] Keywords extracted from the page's keywords meta tag.
          #
          #   @param language [String] Language extracted from html lang or language meta tags.
          #
          #   @param modified_time [String] Modified timestamp/date from page metadata, when present.
          #
          #   @param open_graph [Hash{Symbol=>String, Array<String>}] Open Graph metadata with the og: prefix removed and keys camel-cased.
          #
          #   @param published_time [String] Published timestamp/date from page metadata, when present.
          #
          #   @param robots [String] Robots meta directive, when present.
          #
          #   @param site_name [String] Site or application name from page metadata.
          #
          #   @param twitter [Hash{Symbol=>String, Array<String>}] Twitter card metadata with the twitter: prefix removed and keys camel-cased.

          module AdditionalMeta
            extend ContextDev::Internal::Type::Union

            variant String

            variant -> { ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::AdditionalMeta::StringArray }

            # @!method self.variants
            #   @return [Array(String, Array<String>)]

            # @type [ContextDev::Internal::Type::Converter]
            StringArray = ContextDev::Internal::Type::ArrayOf[String]
          end

          class Alternate < ContextDev::Internal::Type::BaseModel
            # @!attribute href
            #   Resolved alternate URL.
            #
            #   @return [String]
            required :href, String

            # @!attribute hreflang
            #   Language or locale for the alternate URL, when present.
            #
            #   @return [String, nil]
            optional :hreflang, String

            # @!attribute title
            #   Alternate resource title, when present.
            #
            #   @return [String, nil]
            optional :title, String

            # @!attribute type
            #   Alternate resource MIME type, when present.
            #
            #   @return [String, nil]
            optional :type, String

            # @!method initialize(href:, hreflang: nil, title: nil, type: nil)
            #   @param href [String] Resolved alternate URL.
            #
            #   @param hreflang [String] Language or locale for the alternate URL, when present.
            #
            #   @param title [String] Alternate resource title, when present.
            #
            #   @param type [String] Alternate resource MIME type, when present.
          end

          class Heading < ContextDev::Internal::Type::BaseModel
            # @!attribute level
            #   Heading level, 1–6 (from h1–h6).
            #
            #   @return [Integer]
            required :level, Integer

            # @!attribute text
            #   Heading text with whitespace collapsed, truncated to 1000 characters.
            #
            #   @return [String]
            required :text, String

            # @!method initialize(level:, text:)
            #   @param level [Integer] Heading level, 1–6 (from h1–h6).
            #
            #   @param text [String] Heading text with whitespace collapsed, truncated to 1000 characters.
          end

          module OpenGraph
            extend ContextDev::Internal::Type::Union

            variant String

            variant -> { ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::OpenGraph::StringArray }

            # @!method self.variants
            #   @return [Array(String, Array<String>)]

            # @type [ContextDev::Internal::Type::Converter]
            StringArray = ContextDev::Internal::Type::ArrayOf[String]
          end

          module Twitter
            extend ContextDev::Internal::Type::Union

            variant String

            variant -> { ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Twitter::StringArray }

            # @!method self.variants
            #   @return [Array(String, Array<String>)]

            # @type [ContextDev::Internal::Type::Converter]
            StringArray = ContextDev::Internal::Type::ArrayOf[String]
          end
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
