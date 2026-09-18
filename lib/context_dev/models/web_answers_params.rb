# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#answers
    class WebAnswersParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute task
      #   What to research and answer, in plain language. Naming a domain in the task (for
      #   example "pricing on context.dev") makes the agent read that site before it
      #   searches.
      #
      #   @return [String]
      required :task, String

      # @!attribute json_format
      #   An example object with placeholder values (for example {"pricing_page_url": "",
      #   "plans": [{"name": "", "price": 0}]}). Object keys and value types are
      #   preserved; unknown values may be null. Empty arrays accept any JSON items.
      #   Defaults to {"result": ""}. Maximum 8 levels, 500 values, and 16000 characters.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :json_format, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

      # @!attribute mode
      #   Research level: fast uses a smaller model and research budget for 10 credits;
      #   ultra uses deeper reasoning and research for 100 credits. Defaults to ultra.
      #   Only successful requests consume credits.
      #
      #   @return [Symbol, ContextDev::Models::WebAnswersParams::Mode, nil]
      optional :mode, enum: -> { ContextDev::WebAnswersParams::Mode }

      # @!attribute tags
      #   Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Optional request deadline and behavior on timeout. For GET requests, use
      #   timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
      #   timeoutOpts object.
      #
      #   @return [ContextDev::Models::WebAnswersParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::WebAnswersParams::TimeoutOpts }, api_name: :timeoutOpts

      # @!attribute zdr
      #   Set to enabled to bypass shared caches and omit request and response content
      #   from retained usage logs. Asset uploads are skipped, so hosted image URLs are
      #   omitted. Requires zero data retention to be enabled for your organization
      #   (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
      #   Successful ZDR responses include X-Context-ZDR: true.
      #
      #   @return [Symbol, ContextDev::Models::WebAnswersParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebAnswersParams::Zdr }

      # @!method initialize(task:, json_format: nil, mode: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebAnswersParams} for more details.
      #
      #   @param task [String] What to research and answer, in plain language. Naming a domain in the task (for
      #
      #   @param json_format [Hash{Symbol=>Object}] An example object with placeholder values (for example {"pricing_page_url": "",
      #
      #   @param mode [Symbol, ContextDev::Models::WebAnswersParams::Mode] Research level: fast uses a smaller model and research budget for 10 credits; ul
      #
      #   @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      #   @param timeout_opts [ContextDev::Models::WebAnswersParams::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout
      #
      #   @param zdr [Symbol, ContextDev::Models::WebAnswersParams::Zdr] Set to enabled to bypass shared caches and omit request and response content fro
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Research level: fast uses a smaller model and research budget for 10 credits;
      # ultra uses deeper reasoning and research for 100 credits. Defaults to ultra.
      # Only successful requests consume credits.
      module Mode
        extend ContextDev::Internal::Type::Enum

        FAST = :fast
        ULTRA = :ultra

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        # @!attribute milliseconds
        #   Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        #
        #   @return [Integer]
        required :milliseconds, Integer

        # @!attribute behavior
        #   What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        #   credits. "return-partial" returns usable results collected so far; if none are
        #   available, the request still fails without charging credits. Partial results are
        #   not cached as complete results.
        #
        #   @return [Symbol, ContextDev::Models::WebAnswersParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::WebAnswersParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebAnswersParams::TimeoutOpts} for more details.
        #
        #   Optional request deadline and behavior on timeout. For GET requests, use
        #   timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        #   timeoutOpts object.
        #
        #   @param milliseconds [Integer] Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        #
        #   @param behavior [Symbol, ContextDev::Models::WebAnswersParams::TimeoutOpts::Behavior] What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results.
        #
        # @see ContextDev::Models::WebAnswersParams::TimeoutOpts#behavior
        module Behavior
          extend ContextDev::Internal::Type::Enum

          FAIL = :fail
          RETURN_PARTIAL = :"return-partial"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Asset uploads are skipped, so hosted image URLs are
      # omitted. Requires zero data retention to be enabled for your organization
      # (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
      # Successful ZDR responses include X-Context-ZDR: true.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        ENABLED = :enabled
        DISABLED = :disabled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
