# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#extract_styleguide
    class WebExtractStyleguideParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute color_scheme
      #   Optional browser color scheme to emulate for websites that respond to
      #   prefers-color-scheme. This value is part of the styleguide cache key.
      #
      #   @return [Symbol, ContextDev::Models::WebExtractStyleguideParams::ColorScheme, nil]
      optional :color_scheme, enum: -> { ContextDev::WebExtractStyleguideParams::ColorScheme }

      # @!attribute direct_url
      #   Exact URL to inspect. Provide either `domain` or `directUrl`, not both.
      #
      #   @return [String, nil]
      optional :direct_url, String

      # @!attribute domain
      #   Domain name to extract styleguide from (e.g., 'example.com', 'google.com'). The
      #   domain will be automatically normalized and validated. You must provide either
      #   'domain' or 'directUrl', but not both.
      #
      #   @return [String, nil]
      optional :domain, String

      # @!attribute max_age_ms
      #   Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1
      #   year. `0` refreshes.
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer, nil?: true

      # @!attribute tags
      #   Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Request deadline and what to return when it passes.
      #
      #   @return [ContextDev::Models::WebExtractStyleguideParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::WebExtractStyleguideParams::TimeoutOpts }

      # @!attribute zdr
      #   `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      #   your organization has ZDR.
      #
      #   @return [Symbol, ContextDev::Models::WebExtractStyleguideParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebExtractStyleguideParams::Zdr }

      # @!method initialize(color_scheme: nil, direct_url: nil, domain: nil, max_age_ms: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebExtractStyleguideParams} for more details.
      #
      #   @param color_scheme [Symbol, ContextDev::Models::WebExtractStyleguideParams::ColorScheme] Optional browser color scheme to emulate for websites that respond to prefers-co
      #
      #   @param direct_url [String] Exact URL to inspect. Provide either `domain` or `directUrl`, not both.
      #
      #   @param domain [String] Domain name to extract styleguide from (e.g., 'example.com', 'google.com'). The
      #
      #   @param max_age_ms [Integer, nil] Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1 yea
      #
      #   @param tags [Array<String>] Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      #
      #   @param timeout_opts [ContextDev::Models::WebExtractStyleguideParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      #   @param zdr [Symbol, ContextDev::Models::WebExtractStyleguideParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Optional browser color scheme to emulate for websites that respond to
      # prefers-color-scheme. This value is part of the styleguide cache key.
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
        #   "fail" returns 408 at the deadline. "return-partial" returns available results;
        #   inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
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
        #   @param behavior [Symbol, ContextDev::Models::WebExtractStyleguideParams::TimeoutOpts::Behavior] "fail" returns 408 at the deadline. "return-partial" returns available results;

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
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
