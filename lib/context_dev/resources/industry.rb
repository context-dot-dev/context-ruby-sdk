# frozen_string_literal: true

module ContextDev
  module Resources
    class Industry
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::IndustryRetrieveNaicsParams} for more details.
      #
      # Classify a company into NAICS industry codes.
      #
      # @overload retrieve_naics(input:, max_results: nil, min_results: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #
      # @param input [String] Brand domain or title to retrieve NAICS code for. If a valid domain is provided,
      #
      # @param max_results [Integer] Maximum number of NAICS codes to return. Must be between 1 and 10. Defaults to 5
      #
      # @param min_results [Integer] Minimum number of NAICS codes to return. Must be at least 1. Defaults to 1.
      #
      # @param tags [Array<String>] Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      #
      # @param timeout_opts [ContextDev::Models::IndustryRetrieveNaicsParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      # @param zdr [Symbol, ContextDev::Models::IndustryRetrieveNaicsParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::IndustryRetrieveNaicsResponse]
      #
      # @see ContextDev::Models::IndustryRetrieveNaicsParams
      def retrieve_naics(params)
        parsed, options = ContextDev::IndustryRetrieveNaicsParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "web/naics",
          query: query.transform_keys(
            max_results: "maxResults",
            min_results: "minResults",
            timeout_opts: "timeoutOpts"
          ),
          model: ContextDev::Models::IndustryRetrieveNaicsResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::IndustryRetrieveSicParams} for more details.
      #
      # Classify a company into SIC industry codes.
      #
      # @overload retrieve_sic(input:, max_results: nil, min_results: nil, tags: nil, timeout_opts: nil, type: nil, zdr: nil, request_options: {})
      #
      # @param input [String] Brand domain or title to retrieve SIC code for. If a valid domain is provided, i
      #
      # @param max_results [Integer] Maximum number of SIC codes to return. Must be between 1 and 10. Defaults to 5.
      #
      # @param min_results [Integer] Minimum number of SIC codes to return. Must be at least 1. Defaults to 1.
      #
      # @param tags [Array<String>] Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      #
      # @param timeout_opts [ContextDev::Models::IndustryRetrieveSicParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      # @param type [Symbol, ContextDev::Models::IndustryRetrieveSicParams::Type] SIC dataset: `original_sic` (1987) or `latest_sec` (current SEC list).
      #
      # @param zdr [Symbol, ContextDev::Models::IndustryRetrieveSicParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::IndustryRetrieveSicResponse]
      #
      # @see ContextDev::Models::IndustryRetrieveSicParams
      def retrieve_sic(params)
        parsed, options = ContextDev::IndustryRetrieveSicParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "web/sic",
          query: query.transform_keys(
            max_results: "maxResults",
            min_results: "minResults",
            timeout_opts: "timeoutOpts"
          ),
          model: ContextDev::Models::IndustryRetrieveSicResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [ContextDev::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
