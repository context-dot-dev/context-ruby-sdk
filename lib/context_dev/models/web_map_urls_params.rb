# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#map_urls
    class WebMapURLsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute domain
      #   Domain to map, e.g. `stripe.com`.
      #
      #   @return [String]
      required :domain, String

      # @!attribute headers
      #   HTTP headers for the target origin. Non-empty headers bypass caching.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, ContextDev::Internal::Type::HashOf[String]

      # @!attribute include_subdomains
      #   Include URLs on subdomains.
      #
      #   @return [Boolean, nil]
      optional :include_subdomains, ContextDev::Internal::Type::Boolean

      # @!attribute max_links
      #   Maximum number of URLs to return.
      #
      #   @return [Integer, nil]
      optional :max_links, Integer

      # @!attribute search
      #   Filter URLs by a topic or phrase, most relevant first.
      #
      #   @return [String, nil]
      optional :search, String

      # @!attribute sitemap_url
      #   Fetch this sitemap instead of discovering sitemaps. Must belong to the domain or
      #   a subdomain.
      #
      #   @return [String, nil]
      optional :sitemap_url, String

      # @!attribute tags
      #   Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Request deadline and what to return when it passes.
      #
      #   @return [ContextDev::Models::WebMapURLsParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::WebMapURLsParams::TimeoutOpts }

      # @!attribute url_regex
      #   Optional RE2-compatible regex pattern. Only URLs matching this pattern are
      #   returned and counted against maxLinks.
      #
      #   @return [String, nil]
      optional :url_regex, String

      # @!attribute zdr
      #   `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      #   your organization has ZDR.
      #
      #   @return [Symbol, ContextDev::Models::WebMapURLsParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebMapURLsParams::Zdr }

      # @!method initialize(domain:, headers: nil, include_subdomains: nil, max_links: nil, search: nil, sitemap_url: nil, tags: nil, timeout_opts: nil, url_regex: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebMapURLsParams} for more details.
      #
      #   @param domain [String] Domain to map, e.g. `stripe.com`.
      #
      #   @param headers [Hash{Symbol=>String}] HTTP headers for the target origin. Non-empty headers bypass caching.
      #
      #   @param include_subdomains [Boolean] Include URLs on subdomains.
      #
      #   @param max_links [Integer] Maximum number of URLs to return.
      #
      #   @param search [String] Filter URLs by a topic or phrase, most relevant first.
      #
      #   @param sitemap_url [String] Fetch this sitemap instead of discovering sitemaps. Must belong to the domain or
      #
      #   @param tags [Array<String>] Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      #
      #   @param timeout_opts [ContextDev::Models::WebMapURLsParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      #   @param url_regex [String] Optional RE2-compatible regex pattern. Only URLs matching this pattern are retur
      #
      #   @param zdr [Symbol, ContextDev::Models::WebMapURLsParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        # @!attribute milliseconds
        #   Deadline in milliseconds.
        #
        #   @return [Integer]
        required :milliseconds, Integer

        # @!attribute behavior
        #   "fail" returns 408 at the deadline. "return-partial" returns available results;
        #   inspect the response’s partial flag.
        #
        #   @return [Symbol, ContextDev::Models::WebMapURLsParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::WebMapURLsParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebMapURLsParams::TimeoutOpts} for more details.
        #
        #   Request deadline and what to return when it passes.
        #
        #   @param milliseconds [Integer] Deadline in milliseconds.
        #
        #   @param behavior [Symbol, ContextDev::Models::WebMapURLsParams::TimeoutOpts::Behavior] "fail" returns 408 at the deadline. "return-partial" returns available results;

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag.
        #
        # @see ContextDev::Models::WebMapURLsParams::TimeoutOpts#behavior
        module Behavior
          extend ContextDev::Internal::Type::Enum

          FAIL = :fail
          RETURN_PARTIAL = :"return-partial"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
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
