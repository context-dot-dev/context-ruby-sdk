# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#answers
    class WebAnswersParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute task
      #   What to research, in plain language, up to 2000 characters. Include domains or
      #   URLs to focus the research.
      #
      #   @return [String]
      required :task, String

      # @!attribute controls
      #   Limit which sites the research can search, read, and cite.
      #
      #   @return [ContextDev::Models::WebAnswersParams::Controls, nil]
      optional :controls, -> { ContextDev::WebAnswersParams::Controls }

      # @!attribute json_format
      #   Example of the answer object to return, not a JSON Schema. Up to 8 levels deep,
      #   500 values, and 16,000 characters. Values that cannot be found come back as
      #   `null`. Defaults to `{ "result": "" }`.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :json_format, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

      # @!attribute mode
      #   `fast` prioritizes speed and adds extra verification for people and companies;
      #   `ultra` searches and reads more sources for deeper research. Defaults to
      #   `ultra`.
      #
      #   @return [Symbol, ContextDev::Models::WebAnswersParams::Mode, nil]
      optional :mode, enum: -> { ContextDev::WebAnswersParams::Mode }

      # @!attribute policies
      #   Access policy IDs to apply; each URL must pass all of them. Requires access
      #   policies enabled for your organization; otherwise returns
      #   `ACCESS_POLICIES_NOT_ENABLED`.
      #
      #   @return [Array<String>, nil]
      optional :policies, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute tags
      #   Labels for this request. Filter usage and request logs by them in the dashboard
      #   or with `GET /org/logs`.
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

      # @!method initialize(task:, controls: nil, json_format: nil, mode: nil, policies: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebAnswersParams} for more details.
      #
      #   @param task [String] What to research, in plain language, up to 2000 characters. Include domains or U
      #
      #   @param controls [ContextDev::Models::WebAnswersParams::Controls] Limit which sites the research can search, read, and cite.
      #
      #   @param json_format [Hash{Symbol=>Object}] Example of the answer object to return, not a JSON Schema. Up to 8 levels deep,
      #
      #   @param mode [Symbol, ContextDev::Models::WebAnswersParams::Mode] `fast` prioritizes speed and adds extra verification for people and companies; `
      #
      #   @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
      #
      #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
      #
      #   @param timeout_opts [ContextDev::Models::WebAnswersParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      #   @param zdr [Symbol, ContextDev::Models::WebAnswersParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      class Controls < ContextDev::Internal::Type::BaseModel
        # @!attribute exclude_sources
        #   Never search, read, or cite these sites, sections, or pages. Same format as
        #   `sources`.
        #
        #   @return [Array<String>, nil]
        optional :exclude_sources, ContextDev::Internal::Type::ArrayOf[String], api_name: :excludeSources

        # @!attribute sources
        #   Only search, read, and cite these sites, sections, or pages. Each entry is a URL
        #   prefix: `example.com` covers the site and its subdomains, `example.com/docs`
        #   covers that section, and `example.com/docs/setup.html` is one page.
        #
        #   @return [Array<String>, nil]
        optional :sources, ContextDev::Internal::Type::ArrayOf[String]

        # @!method initialize(exclude_sources: nil, sources: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebAnswersParams::Controls} for more details.
        #
        #   Limit which sites the research can search, read, and cite.
        #
        #   @param exclude_sources [Array<String>] Never search, read, or cite these sites, sections, or pages. Same format as `sou
        #
        #   @param sources [Array<String>] Only search, read, and cite these sites, sections, or pages. Each entry is a URL
      end

      # `fast` prioritizes speed and adds extra verification for people and companies;
      # `ultra` searches and reads more sources for deeper research. Defaults to
      # `ultra`.
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
        #   `fail` returns 408 at the deadline. `return-partial` returns the results
        #   collected so far and marks the response as partial.
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
        #   @param behavior [Symbol, ContextDev::Models::WebAnswersParams::TimeoutOpts::Behavior] `fail` returns 408 at the deadline. `return-partial` returns the results collect

        # `fail` returns 408 at the deadline. `return-partial` returns the results
        # collected so far and marks the response as partial.
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
