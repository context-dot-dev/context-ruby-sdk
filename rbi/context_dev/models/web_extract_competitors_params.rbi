# typed: strong

module ContextDev
  module Models
    class WebExtractCompetitorsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::WebExtractCompetitorsParams,
            ContextDev::Internal::AnyHash
          )
        end

      # Company domain to analyze, such as `stripe.com`. Full http(s) URLs are accepted
      # and normalized to their domain.
      sig { returns(String) }
      attr_accessor :domain

      # Exact number of direct competitors to return. Defaults to 5.
      sig { returns(T.nilable(Integer)) }
      attr_reader :num_competitors

      sig { params(num_competitors: Integer).void }
      attr_writer :num_competitors

      # Optional timeout in milliseconds for the request. If the request takes longer
      # than this value, it will be aborted with a 408 status code. Maximum allowed
      # value is 300000ms (5 minutes).
      sig { returns(T.nilable(Integer)) }
      attr_reader :timeout_ms

      sig { params(timeout_ms: Integer).void }
      attr_writer :timeout_ms

      sig do
        params(
          domain: String,
          num_competitors: Integer,
          timeout_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Company domain to analyze, such as `stripe.com`. Full http(s) URLs are accepted
        # and normalized to their domain.
        domain:,
        # Exact number of direct competitors to return. Defaults to 5.
        num_competitors: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            domain: String,
            num_competitors: Integer,
            timeout_ms: Integer,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
