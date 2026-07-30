# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#get_results
    class BatchGetResultsResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #   Result records on this page.
      #
      #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok, ContextDev::Models::BatchGetResultsResponse::Data::Error>, nil]
      optional :data,
               -> { ContextDev::Internal::Type::ArrayOf[union: ContextDev::Models::BatchGetResultsResponse::Data] }

      # @!attribute has_more
      #   Whether another page is available.
      #
      #   @return [Boolean, nil]
      optional :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute key_metadata
      #   Metadata about the API key used for the request. Included in every response
      #   whenever a valid API key is provided, even when the response status is not 200.
      #
      #   @return [ContextDev::Models::BatchGetResultsResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BatchGetResultsResponse::KeyMetadata }

      # @!attribute next_cursor
      #   Cursor for the next page.
      #
      #   @return [String, nil]
      optional :next_cursor, String, nil?: true

      # @!method initialize(data: nil, has_more: nil, key_metadata: nil, next_cursor: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchGetResultsResponse} for more details.
      #
      #   @param data [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok, ContextDev::Models::BatchGetResultsResponse::Data::Error>] Result records on this page.
      #
      #   @param has_more [Boolean] Whether another page is available.
      #
      #   @param key_metadata [ContextDev::Models::BatchGetResultsResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when
      #
      #   @param next_cursor [String, nil] Cursor for the next page.

      # One page outcome from a finished batch.
      module Data
        extend ContextDev::Internal::Type::Union

        discriminator :status

        # A page the batch fetched successfully.
        variant :ok, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok }

        # A page the batch could not fetch.
        variant :error, -> { ContextDev::Models::BatchGetResultsResponse::Data::Error }

        class Ok < ContextDev::Internal::Type::BaseModel
          # @!attribute final_url
          #   URL the content was read from, after redirects.
          #
          #   @return [String]
          required :final_url, String

          # @!attribute http_status
          #   HTTP status of the final response, when known.
          #
          #   @return [Integer, nil]
          required :http_status, Integer, nil?: true

          # @!attribute metadata
          #   Metadata extracted from the scraped page HTML.
          #
          #   @return [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata]
          required :metadata, -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata }

          # @!attribute status
          #   The page was scraped.
          #
          #   @return [Symbol, :ok]
          required :status, const: :ok

          # @!attribute url
          #   URL as submitted, or as discovered by the crawl.
          #
          #   @return [String]
          required :url, String

          # @!attribute html
          #   Raw page HTML. Present on html batches.
          #
          #   @return [String, nil]
          optional :html, String

          # @!attribute item_id
          #   Caller-supplied identifier echoed from submission.
          #
          #   @return [String, nil]
          optional :item_id, String, api_name: :itemId

          # @!attribute markdown
          #   Page content as Markdown. Present on markdown batches.
          #
          #   @return [String, nil]
          optional :markdown, String

          # @!attribute meta
          #   Caller-supplied metadata echoed from submission.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :meta, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

          # @!method initialize(final_url:, http_status:, metadata:, url:, html: nil, item_id: nil, markdown: nil, meta: nil, status: :ok)
          #   A page the batch fetched successfully.
          #
          #   @param final_url [String] URL the content was read from, after redirects.
          #
          #   @param http_status [Integer, nil] HTTP status of the final response, when known.
          #
          #   @param metadata [ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata] Metadata extracted from the scraped page HTML.
          #
          #   @param url [String] URL as submitted, or as discovered by the crawl.
          #
          #   @param html [String] Raw page HTML. Present on html batches.
          #
          #   @param item_id [String] Caller-supplied identifier echoed from submission.
          #
          #   @param markdown [String] Page content as Markdown. Present on markdown batches.
          #
          #   @param meta [Hash{Symbol=>Object}] Caller-supplied metadata echoed from submission.
          #
          #   @param status [Symbol, :ok] The page was scraped.

          # @see ContextDev::Models::BatchGetResultsResponse::Data::Ok#metadata
          class Metadata < ContextDev::Internal::Type::BaseModel
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

            # @!attribute additional_meta
            #   Additional non-social meta tags not promoted to top-level metadata fields.
            #
            #   @return [Hash{Symbol=>String, Array<String>}, nil]
            optional :additional_meta,
                     -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::AdditionalMeta] },
                     api_name: :additionalMeta

            # @!attribute alternates
            #   Resolved alternate links from link rel=alternate tags.
            #
            #   @return [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Alternate>, nil]
            optional :alternates,
                     -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Alternate] }

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
                     -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::OpenGraph] },
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

            # @!attribute title
            #   Best title extracted from the page.
            #
            #   @return [String, nil]
            optional :title, String

            # @!attribute twitter
            #   Twitter card metadata with the twitter: prefix removed and keys camel-cased.
            #
            #   @return [Hash{Symbol=>String, Array<String>}, nil]
            optional :twitter,
                     -> { ContextDev::Internal::Type::HashOf[union: ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Twitter] }

            # @!method initialize(final_url:, source_url:, additional_meta: nil, alternates: nil, author: nil, canonical_url: nil, description: nil, favicon: nil, image: nil, json_ld: nil, keywords: nil, language: nil, modified_time: nil, open_graph: nil, published_time: nil, robots: nil, site_name: nil, title: nil, twitter: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata} for more
            #   details.
            #
            #   Metadata extracted from the scraped page HTML.
            #
            #   @param final_url [String] Final URL scraped after redirects or scraper fallback, when known. Falls back to
            #
            #   @param source_url [String] Original URL requested by the caller.
            #
            #   @param additional_meta [Hash{Symbol=>String, Array<String>}] Additional non-social meta tags not promoted to top-level metadata fields.
            #
            #   @param alternates [Array<ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Alternate>] Resolved alternate links from link rel=alternate tags.
            #
            #   @param author [String] Author metadata, when present.
            #
            #   @param canonical_url [String] Resolved canonical URL, when present.
            #
            #   @param description [String] Best description extracted from standard, Open Graph, or Twitter metadata.
            #
            #   @param favicon [String] Resolved favicon URL, when present.
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
            #   @param title [String] Best title extracted from the page.
            #
            #   @param twitter [Hash{Symbol=>String, Array<String>}] Twitter card metadata with the twitter: prefix removed and keys camel-cased.

            module AdditionalMeta
              extend ContextDev::Internal::Type::Union

              variant String

              variant -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::AdditionalMeta::StringArray }

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

            module OpenGraph
              extend ContextDev::Internal::Type::Union

              variant String

              variant -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::OpenGraph::StringArray }

              # @!method self.variants
              #   @return [Array(String, Array<String>)]

              # @type [ContextDev::Internal::Type::Converter]
              StringArray = ContextDev::Internal::Type::ArrayOf[String]
            end

            module Twitter
              extend ContextDev::Internal::Type::Union

              variant String

              variant -> { ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Twitter::StringArray }

              # @!method self.variants
              #   @return [Array(String, Array<String>)]

              # @type [ContextDev::Internal::Type::Converter]
              StringArray = ContextDev::Internal::Type::ArrayOf[String]
            end
          end
        end

        class Error < ContextDev::Internal::Type::BaseModel
          # @!attribute error_code
          #   Why the page failed.
          #
          #   @return [String]
          required :error_code, String

          # @!attribute message
          #   Human-readable failure detail.
          #
          #   @return [String]
          required :message, String

          # @!attribute status
          #   The page could not be scraped.
          #
          #   @return [Symbol, :error]
          required :status, const: :error

          # @!attribute url
          #   URL as submitted, or as discovered by the crawl.
          #
          #   @return [String]
          required :url, String

          # @!attribute item_id
          #   Caller-supplied identifier echoed from submission.
          #
          #   @return [String, nil]
          optional :item_id, String, api_name: :itemId

          # @!attribute meta
          #   Caller-supplied metadata echoed from submission.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :meta, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

          # @!method initialize(error_code:, message:, url:, item_id: nil, meta: nil, status: :error)
          #   A page the batch could not fetch.
          #
          #   @param error_code [String] Why the page failed.
          #
          #   @param message [String] Human-readable failure detail.
          #
          #   @param url [String] URL as submitted, or as discovered by the crawl.
          #
          #   @param item_id [String] Caller-supplied identifier echoed from submission.
          #
          #   @param meta [Hash{Symbol=>Object}] Caller-supplied metadata echoed from submission.
          #
          #   @param status [Symbol, :error] The page could not be scraped.
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::BatchGetResultsResponse::Data::Ok, ContextDev::Models::BatchGetResultsResponse::Data::Error)]
      end

      # @see ContextDev::Models::BatchGetResultsResponse#key_metadata
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
