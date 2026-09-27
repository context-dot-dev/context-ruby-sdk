# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#extract_competitors
    class WebExtractCompetitorsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute domain
      #   Company domain to analyze, such as `stripe.com`. Full http(s) URLs are accepted
      #   and normalized to their domain.
      #
      #   @return [String]
      required :domain, String

      # @!attribute num_competitors
      #   Exact number of direct competitors to return. Defaults to 5.
      #
      #   @return [Integer, nil]
      optional :num_competitors, Integer

      # @!attribute tags
      #   Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Request deadline and what to return when it passes.
      #
      #   @return [ContextDev::Models::WebExtractCompetitorsParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::WebExtractCompetitorsParams::TimeoutOpts }

      # @!attribute zdr
      #   `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      #   your organization has ZDR.
      #
      #   @return [Symbol, ContextDev::Models::WebExtractCompetitorsParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebExtractCompetitorsParams::Zdr }

      # @!method initialize(domain:, num_competitors: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebExtractCompetitorsParams} for more details.
      #
      #   @param domain [String] Company domain to analyze, such as `stripe.com`. Full http(s) URLs are accepted
      #
      #   @param num_competitors [Integer] Exact number of direct competitors to return. Defaults to 5.
      #
      #   @param tags [Array<String>] Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      #
      #   @param timeout_opts [ContextDev::Models::WebExtractCompetitorsParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      #   @param zdr [Symbol, ContextDev::Models::WebExtractCompetitorsParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
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
        #   @return [Symbol, ContextDev::Models::WebExtractCompetitorsParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::WebExtractCompetitorsParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebExtractCompetitorsParams::TimeoutOpts} for more details.
        #
        #   Request deadline and what to return when it passes.
        #
        #   @param milliseconds [Integer] Deadline in milliseconds.
        #
        #   @param behavior [Symbol, ContextDev::Models::WebExtractCompetitorsParams::TimeoutOpts::Behavior] "fail" returns 408 at the deadline. "return-partial" returns available results;

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag.
        #
        # @see ContextDev::Models::WebExtractCompetitorsParams::TimeoutOpts#behavior
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
