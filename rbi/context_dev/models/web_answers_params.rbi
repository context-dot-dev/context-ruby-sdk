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

      # What to research and answer, in plain language. Naming a domain in the task (for
      # example "pricing on context.dev") makes the agent read that site before it
      # searches.
      sig { returns(String) }
      attr_accessor :task

      # An example object with placeholder values (for example {"pricing_page_url": "",
      # "plans": [{"name": "", "price": 0}]}). Object keys and value types are
      # preserved; unknown values may be null. Empty arrays accept any JSON items.
      # Defaults to {"result": ""}. Maximum 8 levels, 500 values, and 16000 characters.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :json_format

      sig { params(json_format: T::Hash[Symbol, T.anything]).void }
      attr_writer :json_format

      # Research level: fast uses a smaller model and research budget for 10 credits;
      # ultra uses deeper reasoning and research for 100 credits. Defaults to ultra.
      # Only successful requests consume credits.
      sig { returns(T.nilable(ContextDev::WebAnswersParams::Mode::OrSymbol)) }
      attr_reader :mode

      sig { params(mode: ContextDev::WebAnswersParams::Mode::OrSymbol).void }
      attr_writer :mode

      # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Optional request deadline and behavior on timeout. For GET requests, use
      # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
      # timeoutOpts object.
      sig { returns(T.nilable(ContextDev::WebAnswersParams::TimeoutOpts)) }
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts: ContextDev::WebAnswersParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      sig do
        params(
          task: String,
          json_format: T::Hash[Symbol, T.anything],
          mode: ContextDev::WebAnswersParams::Mode::OrSymbol,
          tags: T::Array[String],
          timeout_opts: ContextDev::WebAnswersParams::TimeoutOpts::OrHash,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # What to research and answer, in plain language. Naming a domain in the task (for
        # example "pricing on context.dev") makes the agent read that site before it
        # searches.
        task:,
        # An example object with placeholder values (for example {"pricing_page_url": "",
        # "plans": [{"name": "", "price": 0}]}). Object keys and value types are
        # preserved; unknown values may be null. Empty arrays accept any JSON items.
        # Defaults to {"result": ""}. Maximum 8 levels, 500 values, and 16000 characters.
        json_format: nil,
        # Research level: fast uses a smaller model and research budget for 10 credits;
        # ultra uses deeper reasoning and research for 100 credits. Defaults to ultra.
        # Only successful requests consume credits.
        mode: nil,
        # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
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
            task: String,
            json_format: T::Hash[Symbol, T.anything],
            mode: ContextDev::WebAnswersParams::Mode::OrSymbol,
            tags: T::Array[String],
            timeout_opts: ContextDev::WebAnswersParams::TimeoutOpts,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Research level: fast uses a smaller model and research budget for 10 credits;
      # ultra uses deeper reasoning and research for 100 credits. Defaults to ultra.
      # Only successful requests consume credits.
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

        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        sig do
          params(
            milliseconds: Integer,
            behavior:
              ContextDev::WebAnswersParams::TimeoutOpts::Behavior::OrSymbol
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
                ContextDev::WebAnswersParams::TimeoutOpts::Behavior::OrSymbol
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
    end
  end
end
