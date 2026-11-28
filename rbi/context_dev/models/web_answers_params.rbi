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

      # What to research, in plain language, up to 2000 characters. Include domains or
      # URLs to focus the research.
      sig { returns(String) }
      attr_accessor :task

      # Limit which sites the research can search, read, and cite.
      sig { returns(T.nilable(ContextDev::WebAnswersParams::Controls)) }
      attr_reader :controls

      sig do
        params(controls: ContextDev::WebAnswersParams::Controls::OrHash).void
      end
      attr_writer :controls

      # Example of the answer object to return, not a JSON Schema. Up to 8 levels deep,
      # 500 values, and 16,000 characters. Values that cannot be found come back as
      # `null`. Defaults to `{ "result": "" }`.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :json_format

      sig { params(json_format: T::Hash[Symbol, T.anything]).void }
      attr_writer :json_format

      # `fast` prioritizes speed and adds extra verification for people and companies;
      # `ultra` searches and reads more sources for deeper research. Defaults to
      # `ultra`.
      sig { returns(T.nilable(ContextDev::WebAnswersParams::Mode::OrSymbol)) }
      attr_reader :mode

      sig { params(mode: ContextDev::WebAnswersParams::Mode::OrSymbol).void }
      attr_writer :mode

      # Access policy IDs to apply; each URL must pass all of them. Requires access
      # policies enabled for your organization; otherwise returns
      # `ACCESS_POLICIES_NOT_ENABLED`.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :policies

      sig { params(policies: T::Array[String]).void }
      attr_writer :policies

      # Labels for this request. Filter usage and request logs by them in the dashboard
      # or with `GET /org/logs`.
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
          controls: ContextDev::WebAnswersParams::Controls::OrHash,
          json_format: T::Hash[Symbol, T.anything],
          mode: ContextDev::WebAnswersParams::Mode::OrSymbol,
          policies: T::Array[String],
          tags: T::Array[String],
          timeout_opts: ContextDev::WebAnswersParams::TimeoutOpts::OrHash,
          zdr: ContextDev::WebAnswersParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # What to research, in plain language, up to 2000 characters. Include domains or
        # URLs to focus the research.
        task:,
        # Limit which sites the research can search, read, and cite.
        controls: nil,
        # Example of the answer object to return, not a JSON Schema. Up to 8 levels deep,
        # 500 values, and 16,000 characters. Values that cannot be found come back as
        # `null`. Defaults to `{ "result": "" }`.
        json_format: nil,
        # `fast` prioritizes speed and adds extra verification for people and companies;
        # `ultra` searches and reads more sources for deeper research. Defaults to
        # `ultra`.
        mode: nil,
        # Access policy IDs to apply; each URL must pass all of them. Requires access
        # policies enabled for your organization; otherwise returns
        # `ACCESS_POLICIES_NOT_ENABLED`.
        policies: nil,
        # Labels for this request. Filter usage and request logs by them in the dashboard
        # or with `GET /org/logs`.
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
            controls: ContextDev::WebAnswersParams::Controls,
            json_format: T::Hash[Symbol, T.anything],
            mode: ContextDev::WebAnswersParams::Mode::OrSymbol,
            policies: T::Array[String],
            tags: T::Array[String],
            timeout_opts: ContextDev::WebAnswersParams::TimeoutOpts,
            zdr: ContextDev::WebAnswersParams::Zdr::OrSymbol,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Controls < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebAnswersParams::Controls,
              ContextDev::Internal::AnyHash
            )
          end

        # Never search, read, or cite these sites, sections, or pages. Same format as
        # `sources`.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :exclude_sources

        sig { params(exclude_sources: T::Array[String]).void }
        attr_writer :exclude_sources

        # Only search, read, and cite these sites, sections, or pages. Each entry is a URL
        # prefix: `example.com` covers the site and its subdomains, `example.com/docs`
        # covers that section, and `example.com/docs/setup.html` is one page.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :sources

        sig { params(sources: T::Array[String]).void }
        attr_writer :sources

        # Limit which sites the research can search, read, and cite.
        sig do
          params(
            exclude_sources: T::Array[String],
            sources: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          # Never search, read, or cite these sites, sections, or pages. Same format as
          # `sources`.
          exclude_sources: nil,
          # Only search, read, and cite these sites, sections, or pages. Each entry is a URL
          # prefix: `example.com` covers the site and its subdomains, `example.com/docs`
          # covers that section, and `example.com/docs/setup.html` is one page.
          sources: nil
        )
        end

        sig do
          override.returns(
            { exclude_sources: T::Array[String], sources: T::Array[String] }
          )
        end
        def to_hash
        end
      end

      # `fast` prioritizes speed and adds extra verification for people and companies;
      # `ultra` searches and reads more sources for deeper research. Defaults to
      # `ultra`.
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

        # `fail` returns 408 at the deadline. `return-partial` returns the results
        # collected so far and marks the response as partial.
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
          # `fail` returns 408 at the deadline. `return-partial` returns the results
          # collected so far and marks the response as partial.
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

        # `fail` returns 408 at the deadline. `return-partial` returns the results
        # collected so far and marks the response as partial.
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
