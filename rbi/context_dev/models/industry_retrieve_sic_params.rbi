# typed: strong

module ContextDev
  module Models
    class IndustryRetrieveSicParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::IndustryRetrieveSicParams,
            ContextDev::Internal::AnyHash
          )
        end

      # Brand domain or title to retrieve SIC code for. If a valid domain is provided,
      # it will be used for classification, otherwise, we will search for the brand
      # using the provided title.
      sig { returns(String) }
      attr_accessor :input

      # Maximum number of SIC codes to return. Must be between 1 and 10. Defaults to 5.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_results

      sig { params(max_results: Integer).void }
      attr_writer :max_results

      # Minimum number of SIC codes to return. Must be at least 1. Defaults to 1.
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_results

      sig { params(min_results: Integer).void }
      attr_writer :min_results

      # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
      # characters.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Optional request deadline and behavior on timeout. For GET requests, use
      # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
      # timeoutOpts object.
      sig do
        returns(T.nilable(ContextDev::IndustryRetrieveSicParams::TimeoutOpts))
      end
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts:
            ContextDev::IndustryRetrieveSicParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      # Which SIC dataset to classify against. `original_sic` uses the 1987 Standard
      # Industrial Classification system; `latest_sec` uses the current SIC list as
      # published by the SEC. Defaults to `original_sic`.
      sig do
        returns(
          T.nilable(ContextDev::IndustryRetrieveSicParams::Type::OrSymbol)
        )
      end
      attr_reader :type

      sig do
        params(type: ContextDev::IndustryRetrieveSicParams::Type::OrSymbol).void
      end
      attr_writer :type

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Asset uploads are skipped, so hosted image URLs are
      # omitted. Requires zero data retention to be enabled for your organization
      # (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
      # Successful ZDR responses include X-Context-ZDR: true.
      sig do
        returns(T.nilable(ContextDev::IndustryRetrieveSicParams::Zdr::OrSymbol))
      end
      attr_reader :zdr

      sig do
        params(zdr: ContextDev::IndustryRetrieveSicParams::Zdr::OrSymbol).void
      end
      attr_writer :zdr

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
        ).returns(T.attached_class)
      end
      def self.new(
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
        # Set to enabled to bypass shared caches and omit request and response content
        # from retained usage logs. Asset uploads are skipped, so hosted image URLs are
        # omitted. Requires zero data retention to be enabled for your organization
        # (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
        # Successful ZDR responses include X-Context-ZDR: true.
        zdr: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            input: String,
            max_results: Integer,
            min_results: Integer,
            tags: T::Array[String],
            timeout_opts: ContextDev::IndustryRetrieveSicParams::TimeoutOpts,
            type: ContextDev::IndustryRetrieveSicParams::Type::OrSymbol,
            zdr: ContextDev::IndustryRetrieveSicParams::Zdr::OrSymbol,
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
              ContextDev::IndustryRetrieveSicParams::TimeoutOpts,
              ContextDev::Internal::AnyHash
            )
          end

        # Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        sig { returns(Integer) }
        attr_accessor :milliseconds

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results.
        sig do
          returns(
            T.nilable(
              ContextDev::IndustryRetrieveSicParams::TimeoutOpts::Behavior::OrSymbol
            )
          )
        end
        attr_reader :behavior

        sig do
          params(
            behavior:
              ContextDev::IndustryRetrieveSicParams::TimeoutOpts::Behavior::OrSymbol
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
              ContextDev::IndustryRetrieveSicParams::TimeoutOpts::Behavior::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Request deadline in milliseconds. Maximum: 300000 (5 minutes).
          milliseconds:,
          # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
          # credits. "return-partial" returns usable results collected so far; if none are
          # available, the request still fails without charging credits. Partial results are
          # not cached as complete results.
          behavior: nil
        )
        end

        sig do
          override.returns(
            {
              milliseconds: Integer,
              behavior:
                ContextDev::IndustryRetrieveSicParams::TimeoutOpts::Behavior::OrSymbol
            }
          )
        end
        def to_hash
        end

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results.
        module Behavior
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::IndustryRetrieveSicParams::TimeoutOpts::Behavior
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAIL =
            T.let(
              :fail,
              ContextDev::IndustryRetrieveSicParams::TimeoutOpts::Behavior::TaggedSymbol
            )
          RETURN_PARTIAL =
            T.let(
              :"return-partial",
              ContextDev::IndustryRetrieveSicParams::TimeoutOpts::Behavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::IndustryRetrieveSicParams::TimeoutOpts::Behavior::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Which SIC dataset to classify against. `original_sic` uses the 1987 Standard
      # Industrial Classification system; `latest_sec` uses the current SIC list as
      # published by the SEC. Defaults to `original_sic`.
      module Type
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::IndustryRetrieveSicParams::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ORIGINAL_SIC =
          T.let(
            :original_sic,
            ContextDev::IndustryRetrieveSicParams::Type::TaggedSymbol
          )
        LATEST_SEC =
          T.let(
            :latest_sec,
            ContextDev::IndustryRetrieveSicParams::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::IndustryRetrieveSicParams::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Asset uploads are skipped, so hosted image URLs are
      # omitted. Requires zero data retention to be enabled for your organization
      # (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
      # Successful ZDR responses include X-Context-ZDR: true.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::IndustryRetrieveSicParams::Zdr)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(
            :enabled,
            ContextDev::IndustryRetrieveSicParams::Zdr::TaggedSymbol
          )
        DISABLED =
          T.let(
            :disabled,
            ContextDev::IndustryRetrieveSicParams::Zdr::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::IndustryRetrieveSicParams::Zdr::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
