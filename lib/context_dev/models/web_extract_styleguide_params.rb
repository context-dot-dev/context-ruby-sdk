# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#extract_styleguide
    class WebExtractStyleguideParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute color_scheme
      #   Emulate a light or dark color scheme. Each scheme is cached separately.
      #
      #   @return [Symbol, ContextDev::Models::WebExtractStyleguideParams::ColorScheme, nil]
      optional :color_scheme, enum: -> { ContextDev::WebExtractStyleguideParams::ColorScheme }

      # @!attribute direct_url
      #   Exact page URL to analyze. Provide either `domain` or `directUrl`, not both.
      #
      #   @return [String, nil]
      optional :direct_url, String

      # @!attribute domain
      #   Domain to analyze, such as `stripe.com`. Provide either `domain` or `directUrl`,
      #   not both.
      #
      #   @return [String, nil]
      optional :domain, String

      # @!attribute max_age_ms
      #   Maximum age of a cached result, in milliseconds. `0` always fetches fresh.
      #   Defaults to 90 days (7776000000 ms). Values above 1 year (31536000000 ms) are
      #   capped at 1 year.
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer, nil?: true

      # @!attribute policies
      #   Comma-separated access policy IDs to apply; each URL must pass all of them.
      #   Requires access policies enabled for your organization; otherwise returns
      #   `ACCESS_POLICIES_NOT_ENABLED`.
      #
      #   @return [Array<String>, nil]
      optional :policies, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute tags
      #   Comma-separated labels for this request, such as `production,team-alpha`. Filter
      #   usage and request logs by them.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Request deadline and what to return when it passes.
      #
      #   @return [ContextDev::Models::WebExtractStyleguideParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::WebExtractStyleguideParams::TimeoutOpts }

      # @!attribute zdr
      #   `enabled` turns off request logs and traces and keeps request and response
      #   content out of usage logs. Brand data and hosted assets may still be stored.
      #   Returns 403 `ZDR_NOT_ENABLED` unless your organization has ZDR.
      #
      #   @return [Symbol, ContextDev::Models::WebExtractStyleguideParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebExtractStyleguideParams::Zdr }

      # @!method initialize(color_scheme: nil, direct_url: nil, domain: nil, max_age_ms: nil, policies: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebExtractStyleguideParams} for more details.
      #
      #   @param color_scheme [Symbol, ContextDev::Models::WebExtractStyleguideParams::ColorScheme] Emulate a light or dark color scheme. Each scheme is cached separately.
      #
      #   @param direct_url [String] Exact page URL to analyze. Provide either `domain` or `directUrl`, not both.
      #
      #   @param domain [String] Domain to analyze, such as `stripe.com`. Provide either `domain` or `directUrl`,
      #
      #   @param max_age_ms [Integer, nil] Maximum age of a cached result, in milliseconds. `0` always fetches fresh. Defau
      #
      #   @param policies [Array<String>] Comma-separated access policy IDs to apply; each URL must pass all of them. Requ
      #
      #   @param tags [Array<String>] Comma-separated labels for this request, such as `production,team-alpha`. Filter
      #
      #   @param timeout_opts [ContextDev::Models::WebExtractStyleguideParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      #   @param zdr [Symbol, ContextDev::Models::WebExtractStyleguideParams::Zdr] `enabled` turns off request logs and traces and keeps request and response conte
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Emulate a light or dark color scheme. Each scheme is cached separately.
      module ColorScheme
        extend ContextDev::Internal::Type::Enum

        LIGHT = :light
        DARK = :dark

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        # @!attribute milliseconds
        #   Deadline in milliseconds.
        #
        #   @return [Integer]
        required :milliseconds, Integer

        # @!attribute behavior
        #   `fail` returns 408 at the deadline. `return-partial` returns the results
        #   collected so far and marks the response as partial. `return-partial` requires at
        #   least 5000 ms. On `POST /web/scrape`, an output that is not ready in time fails
        #   with `REQUEST_TIMEOUT` inside a 200 response under either behavior; 408 means
        #   the whole request could not respond by the deadline.
        #
        #   @return [Symbol, ContextDev::Models::WebExtractStyleguideParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::WebExtractStyleguideParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebExtractStyleguideParams::TimeoutOpts} for more details.
        #
        #   Request deadline and what to return when it passes.
        #
        #   @param milliseconds [Integer] Deadline in milliseconds.
        #
        #   @param behavior [Symbol, ContextDev::Models::WebExtractStyleguideParams::TimeoutOpts::Behavior] `fail` returns 408 at the deadline. `return-partial` returns the results collect

        # `fail` returns 408 at the deadline. `return-partial` returns the results
        # collected so far and marks the response as partial. `return-partial` requires at
        # least 5000 ms. On `POST /web/scrape`, an output that is not ready in time fails
        # with `REQUEST_TIMEOUT` inside a 200 response under either behavior; 408 means
        # the whole request could not respond by the deadline.
        #
        # @see ContextDev::Models::WebExtractStyleguideParams::TimeoutOpts#behavior
        module Behavior
          extend ContextDev::Internal::Type::Enum

          FAIL = :fail
          RETURN_PARTIAL = :"return-partial"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # `enabled` turns off request logs and traces and keeps request and response
      # content out of usage logs. Brand data and hosted assets may still be stored.
      # Returns 403 `ZDR_NOT_ENABLED` unless your organization has ZDR.
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
