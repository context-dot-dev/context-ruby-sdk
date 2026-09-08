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
      #   Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
      #   characters.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_ms
      #   Optional timeout in milliseconds for the request. If the request takes longer
      #   than this value, it will be aborted with a 408 status code. Maximum allowed
      #   value is 300000ms (5 minutes).
      #
      #   @return [Integer, nil]
      optional :timeout_ms, Integer

      # @!method initialize(domain:, num_competitors: nil, tags: nil, timeout_ms: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebExtractCompetitorsParams} for more details.
      #
      #   @param domain [String] Company domain to analyze, such as `stripe.com`. Full http(s) URLs are accepted
      #
      #   @param num_competitors [Integer] Exact number of direct competitors to return. Defaults to 5.
      #
      #   @param tags [Array<String>] Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50 charac
      #
      #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
