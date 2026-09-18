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
      #   @return [ContextDev::Models::IndustryRetrieveNaicsParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::IndustryRetrieveNaicsParams::TimeoutOpts }

      # @!attribute zdr
      #   Set to enabled to bypass shared caches and omit request and response content
      #   from retained usage logs. Asset uploads are skipped, so hosted image URLs are
      #   omitted. Requires zero data retention to be enabled for your organization
      #   (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
      #   Successful ZDR responses include X-Context-ZDR: true.
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
      #   @param tags [Array<String>] Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50 charac
      #
      #   @param timeout_opts [ContextDev::Models::IndustryRetrieveNaicsParams::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout
      #
      #   @param zdr [Symbol, ContextDev::Models::IndustryRetrieveNaicsParams::Zdr] Set to enabled to bypass shared caches and omit request and response content fro
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
        #   @return [Symbol, ContextDev::Models::IndustryRetrieveNaicsParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::IndustryRetrieveNaicsParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::IndustryRetrieveNaicsParams::TimeoutOpts} for more details.
        #
        #   Optional request deadline and behavior on timeout. For GET requests, use
        #   timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        #   timeoutOpts object.
        #
        #   @param milliseconds [Integer] Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        #
        #   @param behavior [Symbol, ContextDev::Models::IndustryRetrieveNaicsParams::TimeoutOpts::Behavior] What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results.
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

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Asset uploads are skipped, so hosted image URLs are
      # omitted. Requires zero data retention to be enabled for your organization
      # (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
      # Successful ZDR responses include X-Context-ZDR: true.
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
