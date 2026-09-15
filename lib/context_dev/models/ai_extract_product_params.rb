# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::AI#extract_product
    class AIExtractProductParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute url
      #   The product page URL to extract product data from.
      #
      #   @return [String]
      required :url, String

      # @!attribute max_age_ms
      #   Return a cached result if a prior scrape for the same parameters exists and is
      #   younger than this many milliseconds. Defaults to 7 days (604800000 ms) when
      #   omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer, api_name: :maxAgeMs

      # @!attribute tags
      #   Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Optional request deadline and behavior on timeout. For GET requests, use
      #   timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
      #   timeoutOpts object.
      #
      #   @return [ContextDev::Models::AIExtractProductParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::AIExtractProductParams::TimeoutOpts }, api_name: :timeoutOpts

      # @!method initialize(url:, max_age_ms: nil, tags: nil, timeout_opts: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::AIExtractProductParams} for more details.
      #
      #   @param url [String] The product page URL to extract product data from.
      #
      #   @param max_age_ms [Integer] Return a cached result if a prior scrape for the same parameters exists and is y
      #
      #   @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      #   @param timeout_opts [ContextDev::Models::AIExtractProductParams::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout
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
        #   @return [Symbol, ContextDev::Models::AIExtractProductParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::AIExtractProductParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::AIExtractProductParams::TimeoutOpts} for more details.
        #
        #   Optional request deadline and behavior on timeout. For GET requests, use
        #   timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        #   timeoutOpts object.
        #
        #   @param milliseconds [Integer] Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        #
        #   @param behavior [Symbol, ContextDev::Models::AIExtractProductParams::TimeoutOpts::Behavior] What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results.
        #
        # @see ContextDev::Models::AIExtractProductParams::TimeoutOpts#behavior
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
