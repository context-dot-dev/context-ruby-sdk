# typed: strong

module ContextDev
  module Models
    class BrandRetrieveSimplifiedParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::BrandRetrieveSimplifiedParams,
            ContextDev::Internal::AnyHash
          )
        end

      # Domain name to retrieve simplified brand data for
      sig { returns(String) }
      attr_accessor :domain

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

      # Optional theme preference used when selecting brand assets.
      sig do
        returns(
          T.nilable(ContextDev::BrandRetrieveSimplifiedParams::Theme::OrSymbol)
        )
      end
      attr_reader :theme

      sig do
        params(
          theme: ContextDev::BrandRetrieveSimplifiedParams::Theme::OrSymbol
        ).void
      end
      attr_writer :theme

      # Optional request deadline and behavior on timeout. For GET requests, use
      # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
      # timeoutOpts object.
      sig do
        returns(
          T.nilable(ContextDev::BrandRetrieveSimplifiedParams::TimeoutOpts)
        )
      end
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts:
            ContextDev::BrandRetrieveSimplifiedParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      sig do
        params(
          domain: String,
          max_age_ms: T.nilable(Integer),
          tags: T::Array[String],
          theme: ContextDev::BrandRetrieveSimplifiedParams::Theme::OrSymbol,
          timeout_opts:
            ContextDev::BrandRetrieveSimplifiedParams::TimeoutOpts::OrHash,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Domain name to retrieve simplified brand data for
        domain:,
        # Maximum age in milliseconds for cached brand data before the API performs a hard
        # refresh. Defaults to 3 months (7776000000 ms). Set to 0 to always perform a hard
        # refresh. Negative values are clamped to 0; values above 1 year (31536000000 ms)
        # are clamped to 1 year.
        max_age_ms: nil,
        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        tags: nil,
        # Optional theme preference used when selecting brand assets.
        theme: nil,
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
            domain: String,
            max_age_ms: T.nilable(Integer),
            tags: T::Array[String],
            theme: ContextDev::BrandRetrieveSimplifiedParams::Theme::OrSymbol,
            timeout_opts:
              ContextDev::BrandRetrieveSimplifiedParams::TimeoutOpts,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Optional theme preference used when selecting brand assets.
      module Theme
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::BrandRetrieveSimplifiedParams::Theme)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LIGHT =
          T.let(
            :light,
            ContextDev::BrandRetrieveSimplifiedParams::Theme::TaggedSymbol
          )
        DARK =
          T.let(
            :dark,
            ContextDev::BrandRetrieveSimplifiedParams::Theme::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::BrandRetrieveSimplifiedParams::Theme::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::BrandRetrieveSimplifiedParams::TimeoutOpts,
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
              ContextDev::BrandRetrieveSimplifiedParams::TimeoutOpts::Behavior::OrSymbol
            )
          )
        end
        attr_reader :behavior

        sig do
          params(
            behavior:
              ContextDev::BrandRetrieveSimplifiedParams::TimeoutOpts::Behavior::OrSymbol
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
              ContextDev::BrandRetrieveSimplifiedParams::TimeoutOpts::Behavior::OrSymbol
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
                ContextDev::BrandRetrieveSimplifiedParams::TimeoutOpts::Behavior::OrSymbol
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
                ContextDev::BrandRetrieveSimplifiedParams::TimeoutOpts::Behavior
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAIL =
            T.let(
              :fail,
              ContextDev::BrandRetrieveSimplifiedParams::TimeoutOpts::Behavior::TaggedSymbol
            )
          RETURN_PARTIAL =
            T.let(
              :"return-partial",
              ContextDev::BrandRetrieveSimplifiedParams::TimeoutOpts::Behavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::BrandRetrieveSimplifiedParams::TimeoutOpts::Behavior::TaggedSymbol
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
