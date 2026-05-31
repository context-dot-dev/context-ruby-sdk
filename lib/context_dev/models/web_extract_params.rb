# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#extract
    class WebExtractParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute schema
      #   JSON Schema for the returned data object. TypeScript Zod users can pass a JSON
      #   Schema generated from a Zod object; Python users can pass the equivalent JSON
      #   Schema object.
      #
      #   @return [Hash{Symbol=>Object}]
      required :schema, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

      # @!attribute url
      #   The starting website URL to crawl and extract from. Must include http:// or
      #   https://.
      #
      #   @return [String]
      required :url, String

      # @!attribute fact_check
      #   When true (default), every returned value must be grounded in facts stated on
      #   the page; fields that cannot be supported by the page are returned as
      #   null/empty. When false, the model may make reasonable inferences and derivations
      #   from the page content (e.g. ideal customer, competitor analysis,
      #   recommendations) while keeping verifiable specifics (names, quotes, URLs, dates,
      #   metrics) faithful to the source.
      #
      #   @return [Boolean, nil]
      optional :fact_check, ContextDev::Internal::Type::Boolean, api_name: :factCheck

      # @!attribute follow_subdomains
      #   When true, follow links on subdomains of the starting URL's domain.
      #
      #   @return [Boolean, nil]
      optional :follow_subdomains, ContextDev::Internal::Type::Boolean, api_name: :followSubdomains

      # @!attribute include_frames
      #   When true, iframe contents are included in Markdown before extraction.
      #
      #   @return [Boolean, nil]
      optional :include_frames, ContextDev::Internal::Type::Boolean, api_name: :includeFrames

      # @!attribute instructions
      #   Optional extraction guidance, such as which facts to prioritize or how to
      #   interpret fields in the schema.
      #
      #   @return [String, nil]
      optional :instructions, String

      # @!attribute max_age_ms
      #   Return cached scrape results if a prior scrape for the same parameters is
      #   younger than this many milliseconds.
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer, api_name: :maxAgeMs

      # @!attribute pdf
      #
      #   @return [ContextDev::Models::WebExtractParams::Pdf, nil]
      optional :pdf, -> { ContextDev::WebExtractParams::Pdf }

      # @!attribute stop_after_ms
      #   Soft time budget for the crawl in milliseconds.
      #
      #   @return [Integer, nil]
      optional :stop_after_ms, Integer, api_name: :stopAfterMs

      # @!attribute timeout_ms
      #   Optional timeout in milliseconds for the request. If the request takes longer
      #   than this value, it will be aborted with a 408 status code. Maximum allowed
      #   value is 300000ms (5 minutes).
      #
      #   @return [Integer, nil]
      optional :timeout_ms, Integer, api_name: :timeoutMS

      # @!attribute wait_for_ms
      #   Optional browser wait time in milliseconds after initial page load for each
      #   crawled page.
      #
      #   @return [Integer, nil]
      optional :wait_for_ms, Integer, api_name: :waitForMs

      # @!method initialize(schema:, url:, fact_check: nil, follow_subdomains: nil, include_frames: nil, instructions: nil, max_age_ms: nil, pdf: nil, stop_after_ms: nil, timeout_ms: nil, wait_for_ms: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebExtractParams} for more details.
      #
      #   @param schema [Hash{Symbol=>Object}] JSON Schema for the returned data object. TypeScript Zod users can pass a JSON S
      #
      #   @param url [String] The starting website URL to crawl and extract from. Must include http:// or http
      #
      #   @param fact_check [Boolean] When true (default), every returned value must be grounded in facts stated on th
      #
      #   @param follow_subdomains [Boolean] When true, follow links on subdomains of the starting URL's domain.
      #
      #   @param include_frames [Boolean] When true, iframe contents are included in Markdown before extraction.
      #
      #   @param instructions [String] Optional extraction guidance, such as which facts to prioritize or how to interp
      #
      #   @param max_age_ms [Integer] Return cached scrape results if a prior scrape for the same parameters is younge
      #
      #   @param pdf [ContextDev::Models::WebExtractParams::Pdf]
      #
      #   @param stop_after_ms [Integer] Soft time budget for the crawl in milliseconds.
      #
      #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      #   @param wait_for_ms [Integer] Optional browser wait time in milliseconds after initial page load for each craw
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      class Pdf < ContextDev::Internal::Type::BaseModel
        # @!attribute end_
        #   Last 1-based PDF page to parse. Must be greater than or equal to start when both
        #   are provided.
        #
        #   @return [Integer, nil]
        optional :end_, Integer, api_name: :end

        # @!attribute should_parse
        #   When true, PDF pages are fetched and parsed. When false, PDF pages are skipped.
        #
        #   @return [Boolean, nil]
        optional :should_parse, ContextDev::Internal::Type::Boolean, api_name: :shouldParse

        # @!attribute start
        #   First 1-based PDF page to parse.
        #
        #   @return [Integer, nil]
        optional :start, Integer

        # @!method initialize(end_: nil, should_parse: nil, start: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebExtractParams::Pdf} for more details.
        #
        #   @param end_ [Integer] Last 1-based PDF page to parse. Must be greater than or equal to start when both
        #
        #   @param should_parse [Boolean] When true, PDF pages are fetched and parsed. When false, PDF pages are skipped.
        #
        #   @param start [Integer] First 1-based PDF page to parse.
      end
    end
  end
end
