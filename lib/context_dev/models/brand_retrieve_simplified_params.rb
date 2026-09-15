# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Brand#retrieve_simplified
    class BrandRetrieveSimplifiedParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute domain
      #   Domain name to retrieve simplified brand data for
      #
      #   @return [String]
      required :domain, String

      # @!attribute max_age_ms
      #   Maximum age in milliseconds for cached brand data before the API performs a hard
      #   refresh. Defaults to 3 months (7776000000 ms). Set to 0 to always perform a hard
      #   refresh. Negative values are clamped to 0; values above 1 year (31536000000 ms)
      #   are clamped to 1 year.
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer, nil?: true

      # @!attribute tags
      #   Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
      #   characters.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute theme
      #   Optional theme preference used when selecting brand assets.
      #
      #   @return [Symbol, ContextDev::Models::BrandRetrieveSimplifiedParams::Theme, nil]
      optional :theme, enum: -> { ContextDev::BrandRetrieveSimplifiedParams::Theme }

      # @!attribute timeout_opts
      #   Optional request deadline and behavior on timeout. For GET requests, use
      #   timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
      #   timeoutOpts object.
      #
      #   @return [ContextDev::Models::BrandRetrieveSimplifiedParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::BrandRetrieveSimplifiedParams::TimeoutOpts }

      # @!method initialize(domain:, max_age_ms: nil, tags: nil, theme: nil, timeout_opts: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BrandRetrieveSimplifiedParams} for more details.
      #
      #   @param domain [String] Domain name to retrieve simplified brand data for
      #
      #   @param max_age_ms [Integer, nil] Maximum age in milliseconds for cached brand data before the API performs a hard
      #
      #   @param tags [Array<String>] Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50 charac
      #
      #   @param theme [Symbol, ContextDev::Models::BrandRetrieveSimplifiedParams::Theme] Optional theme preference used when selecting brand assets.
      #
      #   @param timeout_opts [ContextDev::Models::BrandRetrieveSimplifiedParams::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Optional theme preference used when selecting brand assets.
      module Theme
        extend ContextDev::Internal::Type::Enum

        LIGHT = :light
        DARK = :dark

        # @!method self.values
        #   @return [Array<Symbol>]
      end

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
        #   @return [Symbol, ContextDev::Models::BrandRetrieveSimplifiedParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::BrandRetrieveSimplifiedParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::BrandRetrieveSimplifiedParams::TimeoutOpts} for more
        #   details.
        #
        #   Optional request deadline and behavior on timeout. For GET requests, use
        #   timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        #   timeoutOpts object.
        #
        #   @param milliseconds [Integer] Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        #
        #   @param behavior [Symbol, ContextDev::Models::BrandRetrieveSimplifiedParams::TimeoutOpts::Behavior] What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results.
        #
        # @see ContextDev::Models::BrandRetrieveSimplifiedParams::TimeoutOpts#behavior
        module Behavior
          extend ContextDev::Internal::Type::Enum

          FAIL = :fail
          RETURN_PARTIAL = :"return-partial"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
