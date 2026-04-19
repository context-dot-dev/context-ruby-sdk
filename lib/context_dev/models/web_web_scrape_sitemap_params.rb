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

      # @!attribute max_links
      #   Maximum number of links to return from the sitemap crawl. Defaults to 10,000.
      #   Minimum is 1, maximum is 100,000.
      #
      #   @return [Integer, nil]
      optional :max_links, Integer

      # @!attribute url_regex
      #   Optional RE2-compatible regex pattern. Only URLs matching this pattern are
      #   returned and counted against maxLinks.
      #
      #   @return [String, nil]
      optional :url_regex, String

      # @!method initialize(domain:, max_links: nil, url_regex: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebScrapeSitemapParams} for more details.
      #
      #   @param domain [String] Domain to build a sitemap for
      #
      #   @param max_links [Integer] Maximum number of links to return from the sitemap crawl. Defaults to 10,000. Mi
      #
      #   @param url_regex [String] Optional RE2-compatible regex pattern. Only URLs matching this pattern are retur
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
