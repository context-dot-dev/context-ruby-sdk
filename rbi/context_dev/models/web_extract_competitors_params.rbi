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

      # Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Request deadline and what to return when it passes.
      sig do
        returns(T.nilable(ContextDev::WebExtractCompetitorsParams::TimeoutOpts))
      end
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts:
            ContextDev::WebExtractCompetitorsParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      sig do
        returns(
          T.nilable(ContextDev::WebExtractCompetitorsParams::Zdr::OrSymbol)
        )
      end
      attr_reader :zdr

      sig do
        params(zdr: ContextDev::WebExtractCompetitorsParams::Zdr::OrSymbol).void
      end
      attr_writer :zdr

      sig do
        params(
          domain: String,
          num_competitors: Integer,
          tags: T::Array[String],
          timeout_opts:
            ContextDev::WebExtractCompetitorsParams::TimeoutOpts::OrHash,
          zdr: ContextDev::WebExtractCompetitorsParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Company domain to analyze, such as `stripe.com`. Full http(s) URLs are accepted
        # and normalized to their domain.
        domain:,
        # Exact number of direct competitors to return. Defaults to 5.
        num_competitors: nil,
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

      sig do
        override.returns(
          {
            domain: String,
            num_competitors: Integer,
            tags: T::Array[String],
            timeout_opts: ContextDev::WebExtractCompetitorsParams::TimeoutOpts,
            zdr: ContextDev::WebExtractCompetitorsParams::Zdr::OrSymbol,
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
              ContextDev::WebExtractCompetitorsParams::TimeoutOpts,
              ContextDev::Internal::AnyHash
            )
          end

        # Deadline in milliseconds.
        sig { returns(Integer) }
        attr_accessor :milliseconds

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag.
        sig do
          returns(
            T.nilable(
              ContextDev::WebExtractCompetitorsParams::TimeoutOpts::Behavior::OrSymbol
            )
          )
        end
        attr_reader :behavior

        sig do
          params(
            behavior:
              ContextDev::WebExtractCompetitorsParams::TimeoutOpts::Behavior::OrSymbol
          ).void
        end
        attr_writer :behavior

        # Request deadline and what to return when it passes.
        sig do
          params(
            milliseconds: Integer,
            behavior:
              ContextDev::WebExtractCompetitorsParams::TimeoutOpts::Behavior::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Deadline in milliseconds.
          milliseconds:,
          # "fail" returns 408 at the deadline. "return-partial" returns available results;
          # inspect the response’s partial flag.
          behavior: nil
        )
        end

        sig do
          override.returns(
            {
              milliseconds: Integer,
              behavior:
                ContextDev::WebExtractCompetitorsParams::TimeoutOpts::Behavior::OrSymbol
            }
          )
        end
        def to_hash
        end

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag.
        module Behavior
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::WebExtractCompetitorsParams::TimeoutOpts::Behavior
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAIL =
            T.let(
              :fail,
              ContextDev::WebExtractCompetitorsParams::TimeoutOpts::Behavior::TaggedSymbol
            )
          RETURN_PARTIAL =
            T.let(
              :"return-partial",
              ContextDev::WebExtractCompetitorsParams::TimeoutOpts::Behavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebExtractCompetitorsParams::TimeoutOpts::Behavior::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebExtractCompetitorsParams::Zdr)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(
            :enabled,
            ContextDev::WebExtractCompetitorsParams::Zdr::TaggedSymbol
          )
        DISABLED =
          T.let(
            :disabled,
            ContextDev::WebExtractCompetitorsParams::Zdr::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::WebExtractCompetitorsParams::Zdr::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
