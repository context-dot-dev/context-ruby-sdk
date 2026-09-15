# typed: strong

module ContextDev
  module Resources
    class Industry
      # Classify any brand into 2022 NAICS industry codes from its domain or name.
      sig do
        params(
          input: String,
          max_results: Integer,
          min_results: Integer,
          tags: T::Array[String],
          timeout_opts:
            ContextDev::IndustryRetrieveNaicsParams::TimeoutOpts::OrHash,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::IndustryRetrieveNaicsResponse)
      end
      def retrieve_naics(
        # Brand domain or title to retrieve NAICS code for. If a valid domain is provided,
        # it will be used for classification, otherwise, we will search for the brand
        # using the provided title.
        input:,
        # Maximum number of NAICS codes to return. Must be between 1 and 10. Defaults
        # to 5.
        max_results: nil,
        # Minimum number of NAICS codes to return. Must be at least 1. Defaults to 1.
        min_results: nil,
        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        request_options: {}
      )
      end

      # Classify any brand into Standard Industrial Classification (SIC) codes from its
      # domain or name. Choose between the original SIC system (`original_sic`) or the
      # latest SIC list maintained by the SEC (`latest_sec`).
      sig do
        params(
          input: String,
          max_results: Integer,
          min_results: Integer,
          tags: T::Array[String],
          timeout_opts:
            ContextDev::IndustryRetrieveSicParams::TimeoutOpts::OrHash,
          type: ContextDev::IndustryRetrieveSicParams::Type::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::IndustryRetrieveSicResponse)
      end
      def retrieve_sic(
        # Brand domain or title to retrieve SIC code for. If a valid domain is provided,
        # it will be used for classification, otherwise, we will search for the brand
        # using the provided title.
        input:,
        # Maximum number of SIC codes to return. Must be between 1 and 10. Defaults to 5.
        max_results: nil,
        # Minimum number of SIC codes to return. Must be at least 1. Defaults to 1.
        min_results: nil,
        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # Which SIC dataset to classify against. `original_sic` uses the 1987 Standard
        # Industrial Classification system; `latest_sec` uses the current SIC list as
        # published by the SEC. Defaults to `original_sic`.
        type: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: ContextDev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
