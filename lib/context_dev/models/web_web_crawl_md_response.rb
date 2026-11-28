# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#web_crawl_md
    class WebWebCrawlMdResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute cache_metadata
      #   Cache status of this response.
      #
      #   @return [ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata]
      required :cache_metadata, -> { ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata }

      # @!attribute metadata
      #
      #   @return [ContextDev::Models::WebWebCrawlMdResponse::Metadata]
      required :metadata, -> { ContextDev::Models::WebWebCrawlMdResponse::Metadata }

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute results
      #
      #   @return [Array<ContextDev::Models::WebWebCrawlMdResponse::Result>]
      required :results,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebWebCrawlMdResponse::Result] }

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::WebWebCrawlMdResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebWebCrawlMdResponse::KeyMetadata }

      # @!attribute partial
      #   `true` when the deadline passed with `timeoutOpts.behavior` set to
      #   `return-partial`. Only results finished in time are included. Partial results
      #   are not cached.
      #
      #   @return [Boolean, nil]
      optional :partial, ContextDev::Internal::Type::Boolean

      # @!method initialize(cache_metadata:, metadata:, request_id:, results:, key_metadata: nil, partial: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebCrawlMdResponse} for more details.
      #
      #   @param cache_metadata [ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata] Cache status of this response.
      #
      #   @param metadata [ContextDev::Models::WebWebCrawlMdResponse::Metadata]
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param results [Array<ContextDev::Models::WebWebCrawlMdResponse::Result>]
      #
      #   @param key_metadata [ContextDev::Models::WebWebCrawlMdResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param partial [Boolean] `true` when the deadline passed with `timeoutOpts.behavior` set to `return-parti

      # @see ContextDev::Models::WebWebCrawlMdResponse#cache_metadata
      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute age_ms
        #   Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
        #
        #   @return [Integer]
        required :age_ms, Integer

        # @!attribute status
        #   `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
        #   retention bypassed the cache.
        #
        #   @return [Symbol, ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata::Status]
        required :status, enum: -> { ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata::Status }

        # @!method initialize(age_ms:, status:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata} for more details.
        #
        #   Cache status of this response.
        #
        #   @param age_ms [Integer] Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
        #
        #   @param status [Symbol, ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata::Status] `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data re

        # `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
        # retention bypassed the cache.
        #
        # @see ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata#status
        module Status
          extend ContextDev::Internal::Type::Enum

          HIT = :hit
          MISS = :miss
          ZDR = :zdr

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::WebWebCrawlMdResponse#metadata
      class Metadata < ContextDev::Internal::Type::BaseModel
        # @!attribute max_crawl_depth
        #   Deepest link depth reached.
        #
        #   @return [Integer]
        required :max_crawl_depth, Integer, api_name: :maxCrawlDepth

        # @!attribute num_failed
        #   Number of pages that failed.
        #
        #   @return [Integer]
        required :num_failed, Integer, api_name: :numFailed

        # @!attribute num_skipped
        #   Number of URLs skipped: PDFs when `pdf.shouldParse` is `false`, URLs that do not
        #   match `urlRegex`, and URLs that match `excludeUrlRegex`.
        #
        #   @return [Integer]
        required :num_skipped, Integer, api_name: :numSkipped

        # @!attribute num_succeeded
        #   Number of pages crawled successfully.
        #
        #   @return [Integer]
        required :num_succeeded, Integer, api_name: :numSucceeded

        # @!attribute num_urls
        #   Number of URLs crawled.
        #
        #   @return [Integer]
        required :num_urls, Integer, api_name: :numUrls

        # @!method initialize(max_crawl_depth:, num_failed:, num_skipped:, num_succeeded:, num_urls:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebCrawlMdResponse::Metadata} for more details.
        #
        #   @param max_crawl_depth [Integer] Deepest link depth reached.
        #
        #   @param num_failed [Integer] Number of pages that failed.
        #
        #   @param num_skipped [Integer] Number of URLs skipped: PDFs when `pdf.shouldParse` is `false`, URLs that do not
        #
        #   @param num_succeeded [Integer] Number of pages crawled successfully.
        #
        #   @param num_urls [Integer] Number of URLs crawled.
      end

      class Result < ContextDev::Internal::Type::BaseModel
        # @!attribute markdown
        #   Page content as Markdown. Empty string when the page failed.
        #
        #   @return [String]
        required :markdown, String

        # @!attribute metadata
        #
        #   @return [ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata]
        required :metadata, -> { ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata }

        # @!method initialize(markdown:, metadata:)
        #   @param markdown [String] Page content as Markdown. Empty string when the page failed.
        #
        #   @param metadata [ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata]

        # @see ContextDev::Models::WebWebCrawlMdResponse::Result#metadata
        class Metadata < ContextDev::Internal::Type::BaseModel
          # @!attribute crawl_depth
          #   Link depth from the start URL. `0` is the start URL, `1` is one link away.
          #
          #   @return [Integer]
          required :crawl_depth, Integer, api_name: :crawlDepth

          # @!attribute final_url
          #   URL that was scraped, after redirects. Same as `sourceUrl` when unknown.
          #
          #   @return [String]
          required :final_url, String, api_name: :finalUrl

          # @!attribute source_url
          #   URL that was requested, before redirects.
          #
          #   @return [String]
          required :source_url, String, api_name: :sourceUrl

          # @!attribute status_code
          #   HTTP status code of the page. `0` when the page could not be retrieved.
          #
          #   @return [Integer]
          required :status_code, Integer, api_name: :statusCode

          # @!attribute success
          #   Whether the page was fetched and parsed.
          #
          #   @return [Boolean]
          required :success, ContextDev::Internal::Type::Boolean

          # @!attribute title
          #   Page title. Empty string when unavailable.
          #
          #   @return [String]
          required :title, String

          # @!attribute url
          #   URL fetched for this page.
          #
          #   @return [String]
          required :url, String

          # @!attribute additional_meta
          #   Other non-social meta tags that don't have their own field.
          #
          #   @return [Hash{Symbol=>String, Array<String>}, nil]
          optional :additional_meta,
                   -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::AdditionalMeta] },
                   api_name: :additionalMeta

          # @!attribute alternates
          #   Alternate links from `link rel="alternate"` tags, as absolute URLs.
          #
          #   @return [Array<ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Alternate>, nil]
          optional :alternates,
                   -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Alternate] }

          # @!attribute author
          #   Author, when present.
          #
          #   @return [String, nil]
          optional :author, String

          # @!attribute canonical_url
          #   Absolute canonical URL, when present.
          #
          #   @return [String, nil]
          optional :canonical_url, String, api_name: :canonicalUrl

          # @!attribute description
          #   Best available description, from standard, Open Graph, or Twitter meta tags.
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute error_code
          #   Why the page failed. Present only when `success` is `false`: `WEBSITE_BLOCKED`
          #   (the site served an anti-bot challenge or access wall), `WEBSITE_ACCESS_ERROR`
          #   (the page could not be retrieved or had no usable content), `NOT_FOUND`,
          #   `UNSUPPORTED_CONTENT`, `NO_PUBLISHED_MARKDOWN`, or `INTERNAL_ERROR`.
          #
          #   @return [String, nil]
          optional :error_code, String

          # @!attribute favicon
          #   Absolute favicon URL, when present.
          #
          #   @return [String, nil]
          optional :favicon, String

          # @!attribute headings
          #   Headings (`h1` to `h6`) in document order, from the full page before any
          #   filtering. Up to 500. Omitted when the page has none.
          #
          #   @return [Array<ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Heading>, nil]
          optional :headings,
                   -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Heading] }

          # @!attribute image
          #   Main preview image URL, from Open Graph, Twitter, or image meta tags.
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
          #   Keywords from the page's `keywords` meta tag.
          #
          #   @return [Array<String>, nil]
          optional :keywords, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute language
          #   Page language, from the `html` `lang` attribute or language meta tags.
          #
          #   @return [String, nil]
          optional :language, String

          # @!attribute modified_time
          #   Last-modified date or timestamp from page metadata, when present.
          #
          #   @return [String, nil]
          optional :modified_time, String, api_name: :modifiedTime

          # @!attribute open_graph
          #   Open Graph tags, with the `og:` prefix removed and keys in camelCase.
          #
          #   @return [Hash{Symbol=>String, Array<String>}, nil]
          optional :open_graph,
                   -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::OpenGraph] },
                   api_name: :openGraph

          # @!attribute published_time
          #   Publish date or timestamp from page metadata, when present.
          #
          #   @return [String, nil]
          optional :published_time, String, api_name: :publishedTime

          # @!attribute robots
          #   `robots` meta directive, when present.
          #
          #   @return [String, nil]
          optional :robots, String

          # @!attribute site_name
          #   Site or app name from page metadata.
          #
          #   @return [String, nil]
          optional :site_name, String, api_name: :siteName

          # @!attribute twitter
          #   Twitter card tags, with the `twitter:` prefix removed and keys in camelCase.
          #
          #   @return [Hash{Symbol=>String, Array<String>}, nil]
          optional :twitter,
                   -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Twitter] }

          # @!method initialize(crawl_depth:, final_url:, source_url:, status_code:, success:, title:, url:, additional_meta: nil, alternates: nil, author: nil, canonical_url: nil, description: nil, error_code: nil, favicon: nil, headings: nil, image: nil, json_ld: nil, keywords: nil, language: nil, modified_time: nil, open_graph: nil, published_time: nil, robots: nil, site_name: nil, twitter: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata} for more details.
          #
          #   @param crawl_depth [Integer] Link depth from the start URL. `0` is the start URL, `1` is one link away.
          #
          #   @param final_url [String] URL that was scraped, after redirects. Same as `sourceUrl` when unknown.
          #
          #   @param source_url [String] URL that was requested, before redirects.
          #
          #   @param status_code [Integer] HTTP status code of the page. `0` when the page could not be retrieved.
          #
          #   @param success [Boolean] Whether the page was fetched and parsed.
          #
          #   @param title [String] Page title. Empty string when unavailable.
          #
          #   @param url [String] URL fetched for this page.
          #
          #   @param additional_meta [Hash{Symbol=>String, Array<String>}] Other non-social meta tags that don't have their own field.
          #
          #   @param alternates [Array<ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Alternate>] Alternate links from `link rel="alternate"` tags, as absolute URLs.
          #
          #   @param author [String] Author, when present.
          #
          #   @param canonical_url [String] Absolute canonical URL, when present.
          #
          #   @param description [String] Best available description, from standard, Open Graph, or Twitter meta tags.
          #
          #   @param error_code [String] Why the page failed. Present only when `success` is `false`: `WEBSITE_BLOCKED` (
          #
          #   @param favicon [String] Absolute favicon URL, when present.
          #
          #   @param headings [Array<ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Heading>] Headings (`h1` to `h6`) in document order, from the full page before any filteri
          #
          #   @param image [String] Main preview image URL, from Open Graph, Twitter, or image meta tags.
          #
          #   @param json_ld [Array<Hash{Symbol=>Object}>] JSON-LD structured data blocks parsed from the page.
          #
          #   @param keywords [Array<String>] Keywords from the page's `keywords` meta tag.
          #
          #   @param language [String] Page language, from the `html` `lang` attribute or language meta tags.
          #
          #   @param modified_time [String] Last-modified date or timestamp from page metadata, when present.
          #
          #   @param open_graph [Hash{Symbol=>String, Array<String>}] Open Graph tags, with the `og:` prefix removed and keys in camelCase.
          #
          #   @param published_time [String] Publish date or timestamp from page metadata, when present.
          #
          #   @param robots [String] `robots` meta directive, when present.
          #
          #   @param site_name [String] Site or app name from page metadata.
          #
          #   @param twitter [Hash{Symbol=>String, Array<String>}] Twitter card tags, with the `twitter:` prefix removed and keys in camelCase.

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
            #   Absolute URL of the alternate version.
            #
            #   @return [String]
            required :href, String

            # @!attribute hreflang
            #   Language or locale of the alternate version, when present.
            #
            #   @return [String, nil]
            optional :hreflang, String

            # @!attribute title
            #   Title of the alternate version, when present.
            #
            #   @return [String, nil]
            optional :title, String

            # @!attribute type
            #   MIME type of the alternate version, when present.
            #
            #   @return [String, nil]
            optional :type, String

            # @!method initialize(href:, hreflang: nil, title: nil, type: nil)
            #   @param href [String] Absolute URL of the alternate version.
            #
            #   @param hreflang [String] Language or locale of the alternate version, when present.
            #
            #   @param title [String] Title of the alternate version, when present.
            #
            #   @param type [String] MIME type of the alternate version, when present.
          end

          class Heading < ContextDev::Internal::Type::BaseModel
            # @!attribute level
            #   Heading level, from 1 (`h1`) to 6 (`h6`).
            #
            #   @return [Integer]
            required :level, Integer

            # @!attribute text
            #   Heading text with whitespace collapsed, truncated to 1000 characters.
            #
            #   @return [String]
            required :text, String

            # @!method initialize(level:, text:)
            #   @param level [Integer] Heading level, from 1 (`h1`) to 6 (`h6`).
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
