# typed: strong

module ContextDev
  module Resources
    class Industry
      # Classify a company into NAICS industry codes.
      sig do
        params(
          input: String,
          max_results: Integer,
          min_results: Integer,
          tags: T::Array[String],
          timeout_opts:
            ContextDev::IndustryRetrieveNaicsParams::TimeoutOpts::OrHash,
          zdr: ContextDev::IndustryRetrieveNaicsParams::Zdr::OrSymbol,
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
        # Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      # Classify a company into SIC industry codes.
      sig do
        params(
          input: String,
          max_results: Integer,
          min_results: Integer,
          tags: T::Array[String],
          timeout_opts:
            ContextDev::IndustryRetrieveSicParams::TimeoutOpts::OrHash,
          type: ContextDev::IndustryRetrieveSicParams::Type::OrSymbol,
          zdr: ContextDev::IndustryRetrieveSicParams::Zdr::OrSymbol,
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
        # Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # SIC dataset: `original_sic` (1987) or `latest_sec` (current SEC list).
        type: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
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
