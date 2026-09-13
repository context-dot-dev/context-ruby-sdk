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

      # @!attribute timeout_ms
      #   Optional timeout in milliseconds for the request. If the request takes longer
      #   than this value, it will be aborted with a 408 status code. Maximum allowed
      #   value is 300000ms (5 minutes).
      #
      #   @return [Integer, nil]
      optional :timeout_ms, Integer, api_name: :timeoutMS

      # @!method initialize(task:, json_format: nil, mode: nil, tags: nil, timeout_ms: nil, request_options: {})
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
      #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
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
    end
  end
end
