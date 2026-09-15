# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#web_scrape_sitemap
    class WebWebScrapeSitemapParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute domain
      #   Domain to build a sitemap for
      #
      #   @return [String]
      required :domain, String

      # @!attribute headers
      #   Optional outbound HTTP headers forwarded only to the target URL, sent as
      #   deep-object query params such as headers[X-Custom]=value. When provided, caching
      #   is bypassed: the result is neither read from nor written to cache.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, ContextDev::Internal::Type::HashOf[String]

      # @!attribute include_subdomains
      #   When true, discover and include public pages and sitemaps on subdomains of the
      #   requested domain. Defaults to false.
      #
      #   @return [Boolean, nil]
      optional :include_subdomains, ContextDev::Internal::Type::Boolean

      # @!attribute max_links
      #   Maximum number of links to return from the sitemap crawl. Defaults to 10,000.
      #   Minimum is 1, maximum is 100,000.
      #
      #   @return [Integer, nil]
      optional :max_links, Integer

      # @!attribute search
      #   Optional search phrase. When provided, the crawled sitemap is filtered to the
      #   pages whose URLs are about that phrase, most relevant first, and the request
      #   costs 2 credits instead of 1.
      #
      #   @return [String, nil]
      optional :search, String

      # @!attribute sitemap_url
      #   Optional explicit sitemap URL. When provided, exactly this sitemap is crawled
      #   instead of discovering the domain's sitemaps.
      #
      #   @return [String, nil]
      optional :sitemap_url, String

      # @!attribute tags
      #   Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
      #   characters.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Optional request deadline and behavior on timeout. For GET requests, use
      #   timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
      #   timeoutOpts object.
      #
      #   @return [ContextDev::Models::WebWebScrapeSitemapParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::WebWebScrapeSitemapParams::TimeoutOpts }

      # @!attribute url_regex
      #   Optional RE2-compatible regex pattern. Only URLs matching this pattern are
      #   returned and counted against maxLinks.
      #
      #   @return [String, nil]
      optional :url_regex, String

      # @!attribute zdr
      #   Set to enabled to bypass shared caches and omit request and response content
      #   from retained usage logs. Requires zero data retention to be enabled for your
      #   organization (contact support@context.dev), otherwise the request fails with
      #   ZDR_NOT_ENABLED. Successful ZDR responses include X-Context-ZDR: true.
      #
      #   @return [Symbol, ContextDev::Models::WebWebScrapeSitemapParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebWebScrapeSitemapParams::Zdr }

      # @!method initialize(domain:, headers: nil, include_subdomains: nil, max_links: nil, search: nil, sitemap_url: nil, tags: nil, timeout_opts: nil, url_regex: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebScrapeSitemapParams} for more details.
      #
      #   @param domain [String] Domain to build a sitemap for
      #
      #   @param headers [Hash{Symbol=>String}] Optional outbound HTTP headers forwarded only to the target URL, sent as deep-ob
      #
      #   @param include_subdomains [Boolean] When true, discover and include public pages and sitemaps on subdomains of the r
      #
      #   @param max_links [Integer] Maximum number of links to return from the sitemap crawl. Defaults to 10,000. Mi
      #
      #   @param search [String] Optional search phrase. When provided, the crawled sitemap is filtered to the pa
      #
      #   @param sitemap_url [String] Optional explicit sitemap URL. When provided, exactly this sitemap is crawled in
      #
      #   @param tags [Array<String>] Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50 charac
      #
      #   @param timeout_opts [ContextDev::Models::WebWebScrapeSitemapParams::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout
      #
      #   @param url_regex [String] Optional RE2-compatible regex pattern. Only URLs matching this pattern are retur
      #
      #   @param zdr [Symbol, ContextDev::Models::WebWebScrapeSitemapParams::Zdr] Set to enabled to bypass shared caches and omit request and response content fro
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        # @!attribute milliseconds
        #   Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        #
        #   @return [Integer]
        required :milliseconds, Integer

        # @!attribute behavior
        #   What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        #   credits. "return-partial" returns usable results collected so far; if none are
        #   available, the request still fails without charging credits. Partial results are
        #   not cached as complete results.
        #
        #   @return [Symbol, ContextDev::Models::WebWebScrapeSitemapParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::WebWebScrapeSitemapParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebScrapeSitemapParams::TimeoutOpts} for more details.
        #
        #   Optional request deadline and behavior on timeout. For GET requests, use
        #   timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        #   timeoutOpts object.
        #
        #   @param milliseconds [Integer] Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        #
        #   @param behavior [Symbol, ContextDev::Models::WebWebScrapeSitemapParams::TimeoutOpts::Behavior] What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results.
        #
        # @see ContextDev::Models::WebWebScrapeSitemapParams::TimeoutOpts#behavior
        module Behavior
          extend ContextDev::Internal::Type::Enum

          FAIL = :fail
          RETURN_PARTIAL = :"return-partial"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Requires zero data retention to be enabled for your
      # organization (contact support@context.dev), otherwise the request fails with
      # ZDR_NOT_ENABLED. Successful ZDR responses include X-Context-ZDR: true.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        ENABLED = :enabled
        DISABLED = :disabled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
