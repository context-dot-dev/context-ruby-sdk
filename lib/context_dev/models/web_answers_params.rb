# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#answers
    class WebAnswersParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute task
      #   Research task. The agent selects company/profile lookups, web searches, or page
      #   reads. Include domains or URLs to focus the research.
      #
      #   @return [String]
      required :task, String

      # @!attribute json_format
      #   Example answer object, not JSON Schema. Up to 8 levels, 500 values, and 16000
      #   characters; unknowns may be null.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :json_format, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

      # @!attribute mode
      #   `fast` prioritizes speed, with extra verification for people and companies;
      #   `ultra` supports deeper research (default).
      #
      #   @return [Symbol, ContextDev::Models::WebAnswersParams::Mode, nil]
      optional :mode, enum: -> { ContextDev::WebAnswersParams::Mode }

      # @!attribute tags
      #   Labels for filtering usage in the dashboard.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Request deadline and what to return when it passes.
      #
      #   @return [ContextDev::Models::WebAnswersParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::WebAnswersParams::TimeoutOpts }, api_name: :timeoutOpts

      # @!attribute zdr
      #   `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      #   your organization has ZDR.
      #
      #   @return [Symbol, ContextDev::Models::WebAnswersParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebAnswersParams::Zdr }

      # @!method initialize(task:, json_format: nil, mode: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebAnswersParams} for more details.
      #
      #   @param task [String] Research task. The agent selects company/profile lookups, web searches, or page
      #
      #   @param json_format [Hash{Symbol=>Object}] Example answer object, not JSON Schema. Up to 8 levels, 500 values, and 16000 ch
      #
      #   @param mode [Symbol, ContextDev::Models::WebAnswersParams::Mode] `fast` prioritizes speed, with extra verification for people and companies; `ult
      #
      #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
      #
      #   @param timeout_opts [ContextDev::Models::WebAnswersParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      #   @param zdr [Symbol, ContextDev::Models::WebAnswersParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # `fast` prioritizes speed, with extra verification for people and companies;
      # `ultra` supports deeper research (default).
      module Mode
        extend ContextDev::Internal::Type::Enum

        FAST = :fast
        ULTRA = :ultra

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        # @!attribute milliseconds
        #   Deadline in milliseconds.
        #
        #   @return [Integer]
        required :milliseconds, Integer

        # @!attribute behavior
        #   "fail" returns 408 at the deadline. "return-partial" returns available results;
        #   inspect the response’s partial flag.
        #
        #   @return [Symbol, ContextDev::Models::WebAnswersParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::WebAnswersParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebAnswersParams::TimeoutOpts} for more details.
        #
        #   Request deadline and what to return when it passes.
        #
        #   @param milliseconds [Integer] Deadline in milliseconds.
        #
        #   @param behavior [Symbol, ContextDev::Models::WebAnswersParams::TimeoutOpts::Behavior] "fail" returns 408 at the deadline. "return-partial" returns available results;

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag.
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

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
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
