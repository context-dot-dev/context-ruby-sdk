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

      # Optional timeout in milliseconds for the request. If the request takes longer
      # than this value, it will be aborted with a 408 status code. Maximum allowed
      # value is 300000ms (5 minutes).
      sig { returns(T.nilable(Integer)) }
      attr_reader :timeout_ms

      sig { params(timeout_ms: Integer).void }
      attr_writer :timeout_ms

      sig do
        params(
          task: String,
          json_format: T::Hash[Symbol, T.anything],
          mode: ContextDev::WebAnswersParams::Mode::OrSymbol,
          tags: T::Array[String],
          timeout_ms: Integer,
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
            task: String,
            json_format: T::Hash[Symbol, T.anything],
            mode: ContextDev::WebAnswersParams::Mode::OrSymbol,
            tags: T::Array[String],
            timeout_ms: Integer,
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
    end
  end
end
