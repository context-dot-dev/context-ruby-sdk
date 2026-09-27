# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Industry#retrieve_naics
    class IndustryRetrieveNaicsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute input
      #   Brand domain or title to retrieve NAICS code for. If a valid domain is provided,
      #   it will be used for classification, otherwise, we will search for the brand
      #   using the provided title.
      #
      #   @return [String]
      required :input, String

      # @!attribute max_results
      #   Maximum number of NAICS codes to return. Must be between 1 and 10. Defaults
      #   to 5.
      #
      #   @return [Integer, nil]
      optional :max_results, Integer

      # @!attribute min_results
      #   Minimum number of NAICS codes to return. Must be at least 1. Defaults to 1.
      #
      #   @return [Integer, nil]
      optional :min_results, Integer

      # @!attribute tags
      #   Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Request deadline and what to return when it passes.
      #
      #   @return [ContextDev::Models::IndustryRetrieveNaicsParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::IndustryRetrieveNaicsParams::TimeoutOpts }

      # @!attribute zdr
      #   `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      #   your organization has ZDR.
      #
      #   @return [Symbol, ContextDev::Models::IndustryRetrieveNaicsParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::IndustryRetrieveNaicsParams::Zdr }

      # @!method initialize(input:, max_results: nil, min_results: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::IndustryRetrieveNaicsParams} for more details.
      #
      #   @param input [String] Brand domain or title to retrieve NAICS code for. If a valid domain is provided,
      #
      #   @param max_results [Integer] Maximum number of NAICS codes to return. Must be between 1 and 10. Defaults to 5
      #
      #   @param min_results [Integer] Minimum number of NAICS codes to return. Must be at least 1. Defaults to 1.
      #
      #   @param tags [Array<String>] Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      #
      #   @param timeout_opts [ContextDev::Models::IndustryRetrieveNaicsParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      #   @param zdr [Symbol, ContextDev::Models::IndustryRetrieveNaicsParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
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
        #   @return [Symbol, ContextDev::Models::IndustryRetrieveNaicsParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::IndustryRetrieveNaicsParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::IndustryRetrieveNaicsParams::TimeoutOpts} for more details.
        #
        #   Request deadline and what to return when it passes.
        #
        #   @param milliseconds [Integer] Deadline in milliseconds.
        #
        #   @param behavior [Symbol, ContextDev::Models::IndustryRetrieveNaicsParams::TimeoutOpts::Behavior] "fail" returns 408 at the deadline. "return-partial" returns available results;

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag.
        #
        # @see ContextDev::Models::IndustryRetrieveNaicsParams::TimeoutOpts#behavior
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
