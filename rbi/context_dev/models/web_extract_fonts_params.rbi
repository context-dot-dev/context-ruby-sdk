# typed: strong

module ContextDev
  module Models
    class WebExtractFontsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::WebExtractFontsParams,
            ContextDev::Internal::AnyHash
          )
        end

      # A specific URL to fetch fonts from directly, bypassing domain resolution (e.g.,
      # 'https://example.com/design-system'). When provided, fonts are extracted from
      # this exact URL. You must provide either 'domain' or 'directUrl', but not both.
      sig { returns(T.nilable(String)) }
      attr_reader :direct_url

      sig { params(direct_url: String).void }
      attr_writer :direct_url

      # Domain name to extract fonts from (e.g., 'example.com', 'google.com'). The
      # domain will be automatically normalized and validated. You must provide either
      # 'domain' or 'directUrl', but not both.
      sig { returns(T.nilable(String)) }
      attr_reader :domain

      sig { params(domain: String).void }
      attr_writer :domain

      # Maximum age in milliseconds for cached brand data before the API performs a hard
      # refresh. Defaults to 3 months (7776000000 ms). Set to 0 to always perform a hard
      # refresh. Negative values are clamped to 0; values above 1 year (31536000000 ms)
      # are clamped to 1 year.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_age_ms

      # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
      # characters.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Optional request deadline and behavior on timeout. For GET requests, use
      # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
      # timeoutOpts object.
      sig { returns(T.nilable(ContextDev::WebExtractFontsParams::TimeoutOpts)) }
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts: ContextDev::WebExtractFontsParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      sig do
        params(
          direct_url: String,
          domain: String,
          max_age_ms: T.nilable(Integer),
          tags: T::Array[String],
          timeout_opts: ContextDev::WebExtractFontsParams::TimeoutOpts::OrHash,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A specific URL to fetch fonts from directly, bypassing domain resolution (e.g.,
        # 'https://example.com/design-system'). When provided, fonts are extracted from
        # this exact URL. You must provide either 'domain' or 'directUrl', but not both.
        direct_url: nil,
        # Domain name to extract fonts from (e.g., 'example.com', 'google.com'). The
        # domain will be automatically normalized and validated. You must provide either
        # 'domain' or 'directUrl', but not both.
        domain: nil,
        # Maximum age in milliseconds for cached brand data before the API performs a hard
        # refresh. Defaults to 3 months (7776000000 ms). Set to 0 to always perform a hard
        # refresh. Negative values are clamped to 0; values above 1 year (31536000000 ms)
        # are clamped to 1 year.
        max_age_ms: nil,
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

      sig do
        override.returns(
          {
            direct_url: String,
            domain: String,
            max_age_ms: T.nilable(Integer),
            tags: T::Array[String],
            timeout_opts: ContextDev::WebExtractFontsParams::TimeoutOpts,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebExtractFontsParams::TimeoutOpts,
              ContextDev::Internal::AnyHash
            )
          end

        # Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        sig { returns(Integer) }
        attr_accessor :milliseconds

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results. "return-partial" requires milliseconds of at
        # least 5000.
        sig do
          returns(
            T.nilable(
              ContextDev::WebExtractFontsParams::TimeoutOpts::Behavior::OrSymbol
            )
          )
        end
        attr_reader :behavior

        sig do
          params(
            behavior:
              ContextDev::WebExtractFontsParams::TimeoutOpts::Behavior::OrSymbol
          ).void
        end
        attr_writer :behavior

        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        sig do
          params(
            milliseconds: Integer,
            behavior:
              ContextDev::WebExtractFontsParams::TimeoutOpts::Behavior::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Request deadline in milliseconds. Maximum: 300000 (5 minutes).
          milliseconds:,
          # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
          # credits. "return-partial" returns usable results collected so far; if none are
          # available, the request still fails without charging credits. Partial results are
          # not cached as complete results. "return-partial" requires milliseconds of at
          # least 5000.
          behavior: nil
        )
        end

        sig do
          override.returns(
            {
              milliseconds: Integer,
              behavior:
                ContextDev::WebExtractFontsParams::TimeoutOpts::Behavior::OrSymbol
            }
          )
        end
        def to_hash
        end

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results. "return-partial" requires milliseconds of at
        # least 5000.
        module Behavior
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::WebExtractFontsParams::TimeoutOpts::Behavior
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAIL =
            T.let(
              :fail,
              ContextDev::WebExtractFontsParams::TimeoutOpts::Behavior::TaggedSymbol
            )
          RETURN_PARTIAL =
            T.let(
              :"return-partial",
              ContextDev::WebExtractFontsParams::TimeoutOpts::Behavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebExtractFontsParams::TimeoutOpts::Behavior::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
