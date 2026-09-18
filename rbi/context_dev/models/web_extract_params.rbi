# typed: strong

module ContextDev
  module Models
    class WebExtractParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::WebExtractParams, ContextDev::Internal::AnyHash)
        end

      # JSON Schema for the returned data object. Image fields such as `image_urls` or
      # `product_photos` automatically make page image references available to
      # extraction, so product data and photos can be returned in one call. TypeScript
      # Zod users can pass a JSON Schema generated from a Zod object; Python users can
      # pass the equivalent JSON Schema object.
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :schema

      # The starting website URL to crawl and extract from. Must include http:// or
      # https://.
      sig { returns(String) }
      attr_accessor :url

      # Optional browser actions executed in order on the requested page after it loads,
      # before links are discovered or additional pages are crawled. Requires a paid
      # plan. When actions are provided and stopAfterMs is omitted, the crawl budget
      # defaults to 110000 ms.
      sig do
        returns(
          T.nilable(
            T::Array[
              T.any(
                ContextDev::WebExtractParams::Action::Wait,
                ContextDev::WebExtractParams::Action::Perform,
                ContextDev::WebExtractParams::Action::Scroll
              )
            ]
          )
        )
      end
      attr_reader :actions

      sig do
        params(
          actions:
            T::Array[
              T.any(
                ContextDev::WebExtractParams::Action::Wait::OrHash,
                ContextDev::WebExtractParams::Action::Perform::OrHash,
                ContextDev::WebExtractParams::Action::Scroll::OrHash
              )
            ]
        ).void
      end
      attr_writer :actions

      # When true, every returned value must be grounded in facts stated on the page;
      # fields that cannot be supported by the page are returned as null/empty. When
      # false (default), the model may make reasonable inferences and derivations from
      # the page content (e.g. ideal customer, competitor analysis, recommendations)
      # while keeping verifiable specifics (names, quotes, URLs, dates, metrics)
      # faithful to the source.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :fact_check

      sig { params(fact_check: T::Boolean).void }
      attr_writer :fact_check

      # When true, follow links on subdomains of the starting URL's domain.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :follow_subdomains

      sig { params(follow_subdomains: T::Boolean).void }
      attr_writer :follow_subdomains

      # When true, iframe contents are included in Markdown before extraction.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_frames

      sig { params(include_frames: T::Boolean).void }
      attr_writer :include_frames

      # Optional extraction guidance, such as which facts to prioritize or how to
      # interpret fields in the schema.
      sig { returns(T.nilable(String)) }
      attr_reader :instructions

      sig { params(instructions: String).void }
      attr_writer :instructions

      # Return cached scrape results if a prior scrape for the same parameters is
      # younger than this many milliseconds. Defaults to 7 days (604800000 ms).
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_age_ms

      sig { params(max_age_ms: Integer).void }
      attr_writer :max_age_ms

      # Optional maximum link depth from the starting URL (0 = only the starting page).
      # If omitted, there is no crawl depth limit.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_depth

      sig { params(max_depth: Integer).void }
      attr_writer :max_depth

      # Maximum number of pages to analyze for extraction. Hard cap: 50. Defaults to 5.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_pages

      sig { params(max_pages: Integer).void }
      attr_writer :max_pages

      sig { returns(T.nilable(ContextDev::WebExtractParams::Pdf)) }
      attr_reader :pdf

      sig { params(pdf: ContextDev::WebExtractParams::Pdf::OrHash).void }
      attr_writer :pdf

      # When true, waits briefly for CSS and transition animations to settle before
      # extracting each crawled page. Defaults to false. This adds a bit of latency in
      # exchange for more stable output on animated pages.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :settle_animations

      sig { params(settle_animations: T::Boolean).void }
      attr_writer :settle_animations

      # Soft time budget for the crawl in milliseconds. Min: 10000 (10s). Max: 110000
      # (110s). Defaults to 80000 (80s), or 110000 (110s) when browser actions are
      # provided.
      sig { returns(T.nilable(Integer)) }
      attr_reader :stop_after_ms

      sig { params(stop_after_ms: Integer).void }
      attr_writer :stop_after_ms

      # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Optional request deadline and behavior on timeout. For GET requests, use
      # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
      # timeoutOpts object.
      sig { returns(T.nilable(ContextDev::WebExtractParams::TimeoutOpts)) }
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts: ContextDev::WebExtractParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      # Optional browser wait time in milliseconds after initial page load for each
      # crawled page.
      sig { returns(T.nilable(Integer)) }
      attr_reader :wait_for_ms

      sig { params(wait_for_ms: Integer).void }
      attr_writer :wait_for_ms

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Asset uploads are skipped, so hosted image URLs are
      # omitted. Requires zero data retention to be enabled for your organization
      # (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
      # Successful ZDR responses include X-Context-ZDR: true.
      sig { returns(T.nilable(ContextDev::WebExtractParams::Zdr::OrSymbol)) }
      attr_reader :zdr

      sig { params(zdr: ContextDev::WebExtractParams::Zdr::OrSymbol).void }
      attr_writer :zdr

      sig do
        params(
          schema: T::Hash[Symbol, T.anything],
          url: String,
          actions:
            T::Array[
              T.any(
                ContextDev::WebExtractParams::Action::Wait::OrHash,
                ContextDev::WebExtractParams::Action::Perform::OrHash,
                ContextDev::WebExtractParams::Action::Scroll::OrHash
              )
            ],
          fact_check: T::Boolean,
          follow_subdomains: T::Boolean,
          include_frames: T::Boolean,
          instructions: String,
          max_age_ms: Integer,
          max_depth: Integer,
          max_pages: Integer,
          pdf: ContextDev::WebExtractParams::Pdf::OrHash,
          settle_animations: T::Boolean,
          stop_after_ms: Integer,
          tags: T::Array[String],
          timeout_opts: ContextDev::WebExtractParams::TimeoutOpts::OrHash,
          wait_for_ms: Integer,
          zdr: ContextDev::WebExtractParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # JSON Schema for the returned data object. Image fields such as `image_urls` or
        # `product_photos` automatically make page image references available to
        # extraction, so product data and photos can be returned in one call. TypeScript
        # Zod users can pass a JSON Schema generated from a Zod object; Python users can
        # pass the equivalent JSON Schema object.
        schema:,
        # The starting website URL to crawl and extract from. Must include http:// or
        # https://.
        url:,
        # Optional browser actions executed in order on the requested page after it loads,
        # before links are discovered or additional pages are crawled. Requires a paid
        # plan. When actions are provided and stopAfterMs is omitted, the crawl budget
        # defaults to 110000 ms.
        actions: nil,
        # When true, every returned value must be grounded in facts stated on the page;
        # fields that cannot be supported by the page are returned as null/empty. When
        # false (default), the model may make reasonable inferences and derivations from
        # the page content (e.g. ideal customer, competitor analysis, recommendations)
        # while keeping verifiable specifics (names, quotes, URLs, dates, metrics)
        # faithful to the source.
        fact_check: nil,
        # When true, follow links on subdomains of the starting URL's domain.
        follow_subdomains: nil,
        # When true, iframe contents are included in Markdown before extraction.
        include_frames: nil,
        # Optional extraction guidance, such as which facts to prioritize or how to
        # interpret fields in the schema.
        instructions: nil,
        # Return cached scrape results if a prior scrape for the same parameters is
        # younger than this many milliseconds. Defaults to 7 days (604800000 ms).
        max_age_ms: nil,
        # Optional maximum link depth from the starting URL (0 = only the starting page).
        # If omitted, there is no crawl depth limit.
        max_depth: nil,
        # Maximum number of pages to analyze for extraction. Hard cap: 50. Defaults to 5.
        max_pages: nil,
        pdf: nil,
        # When true, waits briefly for CSS and transition animations to settle before
        # extracting each crawled page. Defaults to false. This adds a bit of latency in
        # exchange for more stable output on animated pages.
        settle_animations: nil,
        # Soft time budget for the crawl in milliseconds. Min: 10000 (10s). Max: 110000
        # (110s). Defaults to 80000 (80s), or 110000 (110s) when browser actions are
        # provided.
        stop_after_ms: nil,
        # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # Optional browser wait time in milliseconds after initial page load for each
        # crawled page.
        wait_for_ms: nil,
        # Set to enabled to bypass shared caches and omit request and response content
        # from retained usage logs. Asset uploads are skipped, so hosted image URLs are
        # omitted. Requires zero data retention to be enabled for your organization
        # (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
        # Successful ZDR responses include X-Context-ZDR: true.
        zdr: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            schema: T::Hash[Symbol, T.anything],
            url: String,
            actions:
              T::Array[
                T.any(
                  ContextDev::WebExtractParams::Action::Wait,
                  ContextDev::WebExtractParams::Action::Perform,
                  ContextDev::WebExtractParams::Action::Scroll
                )
              ],
            fact_check: T::Boolean,
            follow_subdomains: T::Boolean,
            include_frames: T::Boolean,
            instructions: String,
            max_age_ms: Integer,
            max_depth: Integer,
            max_pages: Integer,
            pdf: ContextDev::WebExtractParams::Pdf,
            settle_animations: T::Boolean,
            stop_after_ms: Integer,
            tags: T::Array[String],
            timeout_opts: ContextDev::WebExtractParams::TimeoutOpts,
            wait_for_ms: Integer,
            zdr: ContextDev::WebExtractParams::Zdr::OrSymbol,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Browser action discriminated by `do`. Each variant exposes only its applicable
      # fields.
      module Action
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::WebExtractParams::Action::Wait,
              ContextDev::WebExtractParams::Action::Perform,
              ContextDev::WebExtractParams::Action::Scroll
            )
          end

        class Wait < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::WebExtractParams::Action::Wait,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :do_

          sig { returns(Integer) }
          attr_accessor :time_ms

          # Pause for a fixed number of milliseconds before continuing to the next action.
          sig do
            params(time_ms: Integer, do_: Symbol).returns(T.attached_class)
          end
          def self.new(time_ms:, do_: :wait)
          end

          sig { override.returns({ do_: Symbol, time_ms: Integer }) }
          def to_hash
          end
        end

        class Perform < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::WebExtractParams::Action::Perform,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :action

          sig { returns(Symbol) }
          attr_accessor :do_

          # Resolve and perform one natural-language browser action.
          sig { params(action: String, do_: Symbol).returns(T.attached_class) }
          def self.new(action:, do_: :perform)
          end

          sig { override.returns({ action: String, do_: Symbol }) }
          def to_hash
          end
        end

        class Scroll < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::WebExtractParams::Action::Scroll,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :do_

          # Pixels per scroll, one visible viewport, or the current scroll boundary.
          # Defaults to viewport.
          sig do
            returns(
              T.nilable(
                T.any(
                  Integer,
                  ContextDev::WebExtractParams::Action::Scroll::Amount::OrSymbol
                )
              )
            )
          end
          attr_reader :amount

          sig do
            params(
              amount:
                T.any(
                  Integer,
                  ContextDev::WebExtractParams::Action::Scroll::Amount::OrSymbol
                )
            ).void
          end
          attr_writer :amount

          # CSS selector for the first matching scroll container. Defaults to the page.
          sig { returns(T.nilable(String)) }
          attr_reader :container

          sig { params(container: String).void }
          attr_writer :container

          # Direction to scroll. Defaults to down.
          sig do
            returns(
              T.nilable(
                ContextDev::WebExtractParams::Action::Scroll::Direction::OrSymbol
              )
            )
          end
          attr_reader :direction

          sig do
            params(
              direction:
                ContextDev::WebExtractParams::Action::Scroll::Direction::OrSymbol
            ).void
          end
          attr_writer :direction

          # Maximum scroll iterations. Stops early when scrolling and scrollable extent stop
          # changing. Defaults to 1.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_scrolls

          sig { params(max_scrolls: Integer).void }
          attr_writer :max_scrolls

          # Scroll the page or a selected scrollable container, waiting adaptively for
          # content and dimensions to settle after each iteration.
          sig do
            params(
              amount:
                T.any(
                  Integer,
                  ContextDev::WebExtractParams::Action::Scroll::Amount::OrSymbol
                ),
              container: String,
              direction:
                ContextDev::WebExtractParams::Action::Scroll::Direction::OrSymbol,
              max_scrolls: Integer,
              do_: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Pixels per scroll, one visible viewport, or the current scroll boundary.
            # Defaults to viewport.
            amount: nil,
            # CSS selector for the first matching scroll container. Defaults to the page.
            container: nil,
            # Direction to scroll. Defaults to down.
            direction: nil,
            # Maximum scroll iterations. Stops early when scrolling and scrollable extent stop
            # changing. Defaults to 1.
            max_scrolls: nil,
            do_: :scroll
          )
          end

          sig do
            override.returns(
              {
                do_: Symbol,
                amount:
                  T.any(
                    Integer,
                    ContextDev::WebExtractParams::Action::Scroll::Amount::OrSymbol
                  ),
                container: String,
                direction:
                  ContextDev::WebExtractParams::Action::Scroll::Direction::OrSymbol,
                max_scrolls: Integer
              }
            )
          end
          def to_hash
          end

          # Pixels per scroll, one visible viewport, or the current scroll boundary.
          # Defaults to viewport.
          module Amount
            extend ContextDev::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Integer,
                  ContextDev::WebExtractParams::Action::Scroll::Amount::TaggedSymbol
                )
              end

            sig do
              override.returns(
                T::Array[
                  ContextDev::WebExtractParams::Action::Scroll::Amount::Variants
                ]
              )
            end
            def self.variants
            end

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::WebExtractParams::Action::Scroll::Amount
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VIEWPORT =
              T.let(
                :viewport,
                ContextDev::WebExtractParams::Action::Scroll::Amount::TaggedSymbol
              )
            MAX =
              T.let(
                :max,
                ContextDev::WebExtractParams::Action::Scroll::Amount::TaggedSymbol
              )
          end

          # Direction to scroll. Defaults to down.
          module Direction
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::WebExtractParams::Action::Scroll::Direction
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            UP =
              T.let(
                :up,
                ContextDev::WebExtractParams::Action::Scroll::Direction::TaggedSymbol
              )
            DOWN =
              T.let(
                :down,
                ContextDev::WebExtractParams::Action::Scroll::Direction::TaggedSymbol
              )
            LEFT =
              T.let(
                :left,
                ContextDev::WebExtractParams::Action::Scroll::Direction::TaggedSymbol
              )
            RIGHT =
              T.let(
                :right,
                ContextDev::WebExtractParams::Action::Scroll::Direction::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::WebExtractParams::Action::Scroll::Direction::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[ContextDev::WebExtractParams::Action::Variants]
          )
        end
        def self.variants
        end
      end

      class Pdf < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebExtractParams::Pdf,
              ContextDev::Internal::AnyHash
            )
          end

        # Last 1-based PDF page to parse. Must be greater than or equal to start when both
        # are provided.
        sig { returns(T.nilable(Integer)) }
        attr_reader :end_

        sig { params(end_: Integer).void }
        attr_writer :end_

        # When true, PDF pages are fetched and parsed. When false, PDF pages are skipped.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :should_parse

        sig { params(should_parse: T::Boolean).void }
        attr_writer :should_parse

        # First 1-based PDF page to parse.
        sig { returns(T.nilable(Integer)) }
        attr_reader :start

        sig { params(start: Integer).void }
        attr_writer :start

        sig do
          params(
            end_: Integer,
            should_parse: T::Boolean,
            start: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Last 1-based PDF page to parse. Must be greater than or equal to start when both
          # are provided.
          end_: nil,
          # When true, PDF pages are fetched and parsed. When false, PDF pages are skipped.
          should_parse: nil,
          # First 1-based PDF page to parse.
          start: nil
        )
        end

        sig do
          override.returns(
            { end_: Integer, should_parse: T::Boolean, start: Integer }
          )
        end
        def to_hash
        end
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebExtractParams::TimeoutOpts,
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
              ContextDev::WebExtractParams::TimeoutOpts::Behavior::OrSymbol
            )
          )
        end
        attr_reader :behavior

        sig do
          params(
            behavior:
              ContextDev::WebExtractParams::TimeoutOpts::Behavior::OrSymbol
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
              ContextDev::WebExtractParams::TimeoutOpts::Behavior::OrSymbol
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
                ContextDev::WebExtractParams::TimeoutOpts::Behavior::OrSymbol
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
              T.all(Symbol, ContextDev::WebExtractParams::TimeoutOpts::Behavior)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAIL =
            T.let(
              :fail,
              ContextDev::WebExtractParams::TimeoutOpts::Behavior::TaggedSymbol
            )
          RETURN_PARTIAL =
            T.let(
              :"return-partial",
              ContextDev::WebExtractParams::TimeoutOpts::Behavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebExtractParams::TimeoutOpts::Behavior::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Asset uploads are skipped, so hosted image URLs are
      # omitted. Requires zero data retention to be enabled for your organization
      # (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
      # Successful ZDR responses include X-Context-ZDR: true.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::WebExtractParams::Zdr) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(:enabled, ContextDev::WebExtractParams::Zdr::TaggedSymbol)
        DISABLED =
          T.let(:disabled, ContextDev::WebExtractParams::Zdr::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::WebExtractParams::Zdr::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
