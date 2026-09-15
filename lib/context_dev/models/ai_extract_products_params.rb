# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::AI#extract_products
    class AIExtractProductsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [ContextDev::Models::AIExtractProductsParams::Body::ByDomain, ContextDev::Models::AIExtractProductsParams::Body::ByDirectURL]
      required :body, union: -> { ContextDev::AIExtractProductsParams::Body }

      # @!method initialize(body:, request_options: {})
      #   @param body [ContextDev::Models::AIExtractProductsParams::Body::ByDomain, ContextDev::Models::AIExtractProductsParams::Body::ByDirectURL]
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      module Body
        extend ContextDev::Internal::Type::Union

        variant -> { ContextDev::AIExtractProductsParams::Body::ByDomain }

        variant -> { ContextDev::AIExtractProductsParams::Body::ByDirectURL }

        class ByDomain < ContextDev::Internal::Type::BaseModel
          # @!attribute domain
          #   The domain name to analyze.
          #
          #   @return [String]
          required :domain, String

          # @!attribute max_age_ms
          #   Return a cached result if a prior scrape for the same parameters exists and is
          #   younger than this many milliseconds. Defaults to 7 days (604800000 ms) when
          #   omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
          #
          #   @return [Integer, nil]
          optional :max_age_ms, Integer, api_name: :maxAgeMs

          # @!attribute max_products
          #   Maximum number of products to extract.
          #
          #   @return [Integer, nil]
          optional :max_products, Integer, api_name: :maxProducts

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
          #   @return [ContextDev::Models::AIExtractProductsParams::Body::ByDomain::TimeoutOpts, nil]
          optional :timeout_opts,
                   -> { ContextDev::AIExtractProductsParams::Body::ByDomain::TimeoutOpts },
                   api_name: :timeoutOpts

          # @!method initialize(domain:, max_age_ms: nil, max_products: nil, tags: nil, timeout_opts: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::AIExtractProductsParams::Body::ByDomain} for more details.
          #
          #   @param domain [String] The domain name to analyze.
          #
          #   @param max_age_ms [Integer] Return a cached result if a prior scrape for the same parameters exists and is y
          #
          #   @param max_products [Integer] Maximum number of products to extract.
          #
          #   @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
          #
          #   @param timeout_opts [ContextDev::Models::AIExtractProductsParams::Body::ByDomain::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout

          # @see ContextDev::Models::AIExtractProductsParams::Body::ByDomain#timeout_opts
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
            #   @return [Symbol, ContextDev::Models::AIExtractProductsParams::Body::ByDomain::TimeoutOpts::Behavior, nil]
            optional :behavior,
                     enum: -> { ContextDev::AIExtractProductsParams::Body::ByDomain::TimeoutOpts::Behavior }

            # @!method initialize(milliseconds:, behavior: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::AIExtractProductsParams::Body::ByDomain::TimeoutOpts} for
            #   more details.
            #
            #   Optional request deadline and behavior on timeout. For GET requests, use
            #   timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
            #   timeoutOpts object.
            #
            #   @param milliseconds [Integer] Request deadline in milliseconds. Maximum: 300000 (5 minutes).
            #
            #   @param behavior [Symbol, ContextDev::Models::AIExtractProductsParams::Body::ByDomain::TimeoutOpts::Behavior] What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging

            # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
            # credits. "return-partial" returns usable results collected so far; if none are
            # available, the request still fails without charging credits. Partial results are
            # not cached as complete results.
            #
            # @see ContextDev::Models::AIExtractProductsParams::Body::ByDomain::TimeoutOpts#behavior
            module Behavior
              extend ContextDev::Internal::Type::Enum

              FAIL = :fail
              RETURN_PARTIAL = :"return-partial"

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end

        class ByDirectURL < ContextDev::Internal::Type::BaseModel
          # @!attribute direct_url
          #   A specific URL to use directly as the starting point for extraction without
          #   domain resolution.
          #
          #   @return [String]
          required :direct_url, String, api_name: :directUrl

          # @!attribute max_age_ms
          #   Return a cached result if a prior scrape for the same parameters exists and is
          #   younger than this many milliseconds. Defaults to 7 days (604800000 ms) when
          #   omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
          #
          #   @return [Integer, nil]
          optional :max_age_ms, Integer, api_name: :maxAgeMs

          # @!attribute max_products
          #   Maximum number of products to extract.
          #
          #   @return [Integer, nil]
          optional :max_products, Integer, api_name: :maxProducts

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
          #   @return [ContextDev::Models::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts, nil]
          optional :timeout_opts,
                   -> { ContextDev::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts },
                   api_name: :timeoutOpts

          # @!method initialize(direct_url:, max_age_ms: nil, max_products: nil, tags: nil, timeout_opts: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::AIExtractProductsParams::Body::ByDirectURL} for more
          #   details.
          #
          #   @param direct_url [String] A specific URL to use directly as the starting point for extraction without doma
          #
          #   @param max_age_ms [Integer] Return a cached result if a prior scrape for the same parameters exists and is y
          #
          #   @param max_products [Integer] Maximum number of products to extract.
          #
          #   @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
          #
          #   @param timeout_opts [ContextDev::Models::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout

          # @see ContextDev::Models::AIExtractProductsParams::Body::ByDirectURL#timeout_opts
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
            #   @return [Symbol, ContextDev::Models::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts::Behavior, nil]
            optional :behavior,
                     enum: -> { ContextDev::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts::Behavior }

            # @!method initialize(milliseconds:, behavior: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts}
            #   for more details.
            #
            #   Optional request deadline and behavior on timeout. For GET requests, use
            #   timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
            #   timeoutOpts object.
            #
            #   @param milliseconds [Integer] Request deadline in milliseconds. Maximum: 300000 (5 minutes).
            #
            #   @param behavior [Symbol, ContextDev::Models::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts::Behavior] What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging

            # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
            # credits. "return-partial" returns usable results collected so far; if none are
            # available, the request still fails without charging credits. Partial results are
            # not cached as complete results.
            #
            # @see ContextDev::Models::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts#behavior
            module Behavior
              extend ContextDev::Internal::Type::Enum

              FAIL = :fail
              RETURN_PARTIAL = :"return-partial"

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::AIExtractProductsParams::Body::ByDomain, ContextDev::Models::AIExtractProductsParams::Body::ByDirectURL)]
      end
    end
  end
end
