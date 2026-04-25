# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Industry#retrieve_sic
    class IndustryRetrieveSicParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute input
      #   Brand domain or title to retrieve SIC code for. If a valid domain is provided,
      #   it will be used for classification, otherwise, we will search for the brand
      #   using the provided title.
      #
      #   @return [String]
      required :input, String

      # @!attribute max_results
      #   Maximum number of SIC codes to return. Must be between 1 and 10. Defaults to 5.
      #
      #   @return [Integer, nil]
      optional :max_results, Integer

      # @!attribute min_results
      #   Minimum number of SIC codes to return. Must be at least 1. Defaults to 1.
      #
      #   @return [Integer, nil]
      optional :min_results, Integer

      # @!attribute timeout_ms
      #   Optional timeout in milliseconds for the request. If the request takes longer
      #   than this value, it will be aborted with a 408 status code. Maximum allowed
      #   value is 300000ms (5 minutes).
      #
      #   @return [Integer, nil]
      optional :timeout_ms, Integer

      # @!attribute type
      #   Which SIC dataset to classify against. `original_sic` uses the 1987 Standard
      #   Industrial Classification system; `latest_sec` uses the current SIC list as
      #   published by the SEC. Defaults to `original_sic`.
      #
      #   @return [Symbol, ContextDev::Models::IndustryRetrieveSicParams::Type, nil]
      optional :type, enum: -> { ContextDev::IndustryRetrieveSicParams::Type }

      # @!method initialize(input:, max_results: nil, min_results: nil, timeout_ms: nil, type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::IndustryRetrieveSicParams} for more details.
      #
      #   @param input [String] Brand domain or title to retrieve SIC code for. If a valid domain is provided, i
      #
      #   @param max_results [Integer] Maximum number of SIC codes to return. Must be between 1 and 10. Defaults to 5.
      #
      #   @param min_results [Integer] Minimum number of SIC codes to return. Must be at least 1. Defaults to 1.
      #
      #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      #   @param type [Symbol, ContextDev::Models::IndustryRetrieveSicParams::Type] Which SIC dataset to classify against. `original_sic` uses the 1987 Standard Ind
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Which SIC dataset to classify against. `original_sic` uses the 1987 Standard
      # Industrial Classification system; `latest_sec` uses the current SIC list as
      # published by the SEC. Defaults to `original_sic`.
      module Type
        extend ContextDev::Internal::Type::Enum

        ORIGINAL_SIC = :original_sic
        LATEST_SEC = :latest_sec

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
