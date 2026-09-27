# typed: strong

module ContextDev
  module Models
    class WebAnswersParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::WebAnswersParams, ContextDev::Internal::AnyHash)
        end

      # Research task. The agent selects company/profile lookups, web searches, or page
      # reads. Include domains or URLs to focus the research.
      sig { returns(String) }
      attr_accessor :task

      # Example answer object, not JSON Schema. Up to 8 levels, 500 values, and 16000
      # characters; unknowns may be null.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :json_format

      sig { params(json_format: T::Hash[Symbol, T.anything]).void }
      attr_writer :json_format

      # `fast` prioritizes speed, with extra verification for people and companies;
      # `ultra` supports deeper research (default).
      sig { returns(T.nilable(ContextDev::WebAnswersParams::Mode::OrSymbol)) }
      attr_reader :mode

      sig { params(mode: ContextDev::WebAnswersParams::Mode::OrSymbol).void }
      attr_writer :mode

      # Labels for filtering usage in the dashboard.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Request deadline and what to return when it passes.
      sig { returns(T.nilable(ContextDev::WebAnswersParams::TimeoutOpts)) }
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts: ContextDev::WebAnswersParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      sig { returns(T.nilable(ContextDev::WebAnswersParams::Zdr::OrSymbol)) }
      attr_reader :zdr

      sig { params(zdr: ContextDev::WebAnswersParams::Zdr::OrSymbol).void }
      attr_writer :zdr

      sig do
        params(
          task: String,
          json_format: T::Hash[Symbol, T.anything],
          mode: ContextDev::WebAnswersParams::Mode::OrSymbol,
          tags: T::Array[String],
          timeout_opts: ContextDev::WebAnswersParams::TimeoutOpts::OrHash,
          zdr: ContextDev::WebAnswersParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Research task. The agent selects company/profile lookups, web searches, or page
        # reads. Include domains or URLs to focus the research.
        task:,
        # Example answer object, not JSON Schema. Up to 8 levels, 500 values, and 16000
        # characters; unknowns may be null.
        json_format: nil,
        # `fast` prioritizes speed, with extra verification for people and companies;
        # `ultra` supports deeper research (default).
        mode: nil,
        # Labels for filtering usage in the dashboard.
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
            task: String,
            json_format: T::Hash[Symbol, T.anything],
            mode: ContextDev::WebAnswersParams::Mode::OrSymbol,
            tags: T::Array[String],
            timeout_opts: ContextDev::WebAnswersParams::TimeoutOpts,
            zdr: ContextDev::WebAnswersParams::Zdr::OrSymbol,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # `fast` prioritizes speed, with extra verification for people and companies;
      # `ultra` supports deeper research (default).
      module Mode
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::WebAnswersParams::Mode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FAST = T.let(:fast, ContextDev::WebAnswersParams::Mode::TaggedSymbol)
        ULTRA = T.let(:ultra, ContextDev::WebAnswersParams::Mode::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::WebAnswersParams::Mode::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebAnswersParams::TimeoutOpts,
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
              ContextDev::WebAnswersParams::TimeoutOpts::Behavior::OrSymbol
            )
          )
        end
        attr_reader :behavior

        sig do
          params(
            behavior:
              ContextDev::WebAnswersParams::TimeoutOpts::Behavior::OrSymbol
          ).void
        end
        attr_writer :behavior

        # Request deadline and what to return when it passes.
        sig do
          params(
            milliseconds: Integer,
            behavior:
              ContextDev::WebAnswersParams::TimeoutOpts::Behavior::OrSymbol
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
                ContextDev::WebAnswersParams::TimeoutOpts::Behavior::OrSymbol
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
              T.all(Symbol, ContextDev::WebAnswersParams::TimeoutOpts::Behavior)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAIL =
            T.let(
              :fail,
              ContextDev::WebAnswersParams::TimeoutOpts::Behavior::TaggedSymbol
            )
          RETURN_PARTIAL =
            T.let(
              :"return-partial",
              ContextDev::WebAnswersParams::TimeoutOpts::Behavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebAnswersParams::TimeoutOpts::Behavior::TaggedSymbol
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
          T.type_alias { T.all(Symbol, ContextDev::WebAnswersParams::Zdr) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(:enabled, ContextDev::WebAnswersParams::Zdr::TaggedSymbol)
        DISABLED =
          T.let(:disabled, ContextDev::WebAnswersParams::Zdr::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::WebAnswersParams::Zdr::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
