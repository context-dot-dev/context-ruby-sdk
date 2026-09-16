# typed: strong

module ContextDev
  module Models
    class WebWebScrapeHTMLParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::WebWebScrapeHTMLParams,
            ContextDev::Internal::AnyHash
          )
        end

      # Full URL to scrape (must include http:// or https:// protocol)
      sig { returns(String) }
      attr_accessor :url

      # Optional browser actions executed in array order after the page loads and before
      # content is captured. Requires a paid plan. Send a JSON array in the query
      # parameter. Maximum: 5 actions.
      sig do
        returns(
          T.nilable(
            T::Array[
              T.any(
                ContextDev::WebWebScrapeHTMLParams::Action::Wait,
                ContextDev::WebWebScrapeHTMLParams::Action::Perform,
                ContextDev::WebWebScrapeHTMLParams::Action::Scroll
              )
            ]
          )
        )
      end
      attr_accessor :actions

      # Fetch the target page through a residential proxy in this country (ISO 3166-1
      # alpha-2).
      sig do
        returns(
          T.nilable(ContextDev::WebWebScrapeHTMLParams::Country::OrSymbol)
        )
      end
      attr_reader :country

      sig do
        params(
          country: ContextDev::WebWebScrapeHTMLParams::Country::OrSymbol
        ).void
      end
      attr_writer :country

      # CSS selectors to remove from the result. Applied after includeSelectors.
      # Exclusion takes precedence: an element matching both is removed. Examples:
      # "nav", "footer", ".ad-banner", "[aria-hidden=true]".
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :exclude_selectors

      # Optional outbound HTTP headers forwarded only to the target URL, sent as
      # deep-object query params such as headers[X-Custom]=value. When provided, caching
      # is bypassed: the result is neither read from nor written to cache.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      # When true, iframes are rendered inline into the returned HTML.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_frames

      sig { params(include_frames: T::Boolean).void }
      attr_writer :include_frames

      # CSS selectors. When provided, only matching subtrees (and their descendants) are
      # kept and everything else is dropped. When omitted, the entire document is kept.
      # Examples: "article.main", "#content", "[role=main]".
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :include_selectors

      # Return a cached result if a prior scrape for the same parameters exists and is
      # younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
      # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_age_ms

      # PDF parsing controls. Use start/end to limit text extraction and embedded-image
      # detection/OCR to an inclusive 1-based page range.
      sig { returns(T.nilable(ContextDev::WebWebScrapeHTMLParams::Pdf)) }
      attr_reader :pdf

      sig { params(pdf: ContextDev::WebWebScrapeHTMLParams::Pdf::OrHash).void }
      attr_writer :pdf

      # When true, waits briefly for CSS and transition animations to settle before
      # extracting HTML. Defaults to false. This adds a bit of latency in exchange for
      # more stable output on animated pages.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :settle_animations

      sig { params(settle_animations: T::Boolean).void }
      attr_writer :settle_animations

      # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
      # characters.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Optional request deadline and behavior on timeout. For GET requests, use
      # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
      # timeoutOpts object.
      sig do
        returns(T.nilable(ContextDev::WebWebScrapeHTMLParams::TimeoutOpts))
      end
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts: ContextDev::WebWebScrapeHTMLParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      # When true, return only the page's main content in the HTML response, excluding
      # headers, footers, sidebars, and navigation when detectable.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :use_main_content_only

      sig { params(use_main_content_only: T::Boolean).void }
      attr_writer :use_main_content_only

      # Optional browser wait time in milliseconds after initial page load. Min: 0. Max:
      # 30000 (30 seconds). When combined with timeoutOpts, timeoutOpts.milliseconds
      # must be at least waitForMs + 10000 ms; a shorter deadline is rejected with 400
      # TIMEOUT_TOO_SHORT_FOR_WAIT.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :wait_for_ms

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Requires zero data retention to be enabled for your
      # organization (contact support@context.dev), otherwise the request fails with
      # ZDR_NOT_ENABLED. Successful ZDR responses include X-Context-ZDR: true.
      sig do
        returns(T.nilable(ContextDev::WebWebScrapeHTMLParams::Zdr::OrSymbol))
      end
      attr_reader :zdr

      sig do
        params(zdr: ContextDev::WebWebScrapeHTMLParams::Zdr::OrSymbol).void
      end
      attr_writer :zdr

      sig do
        params(
          url: String,
          actions:
            T.nilable(
              T::Array[
                T.any(
                  ContextDev::WebWebScrapeHTMLParams::Action::Wait::OrHash,
                  ContextDev::WebWebScrapeHTMLParams::Action::Perform::OrHash,
                  ContextDev::WebWebScrapeHTMLParams::Action::Scroll::OrHash
                )
              ]
            ),
          country: ContextDev::WebWebScrapeHTMLParams::Country::OrSymbol,
          exclude_selectors: T.nilable(T::Array[String]),
          headers: T::Hash[Symbol, String],
          include_frames: T::Boolean,
          include_selectors: T.nilable(T::Array[String]),
          max_age_ms: T.nilable(Integer),
          pdf: ContextDev::WebWebScrapeHTMLParams::Pdf::OrHash,
          settle_animations: T::Boolean,
          tags: T::Array[String],
          timeout_opts: ContextDev::WebWebScrapeHTMLParams::TimeoutOpts::OrHash,
          use_main_content_only: T::Boolean,
          wait_for_ms: T.nilable(Integer),
          zdr: ContextDev::WebWebScrapeHTMLParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Full URL to scrape (must include http:// or https:// protocol)
        url:,
        # Optional browser actions executed in array order after the page loads and before
        # content is captured. Requires a paid plan. Send a JSON array in the query
        # parameter. Maximum: 5 actions.
        actions: nil,
        # Fetch the target page through a residential proxy in this country (ISO 3166-1
        # alpha-2).
        country: nil,
        # CSS selectors to remove from the result. Applied after includeSelectors.
        # Exclusion takes precedence: an element matching both is removed. Examples:
        # "nav", "footer", ".ad-banner", "[aria-hidden=true]".
        exclude_selectors: nil,
        # Optional outbound HTTP headers forwarded only to the target URL, sent as
        # deep-object query params such as headers[X-Custom]=value. When provided, caching
        # is bypassed: the result is neither read from nor written to cache.
        headers: nil,
        # When true, iframes are rendered inline into the returned HTML.
        include_frames: nil,
        # CSS selectors. When provided, only matching subtrees (and their descendants) are
        # kept and everything else is dropped. When omitted, the entire document is kept.
        # Examples: "article.main", "#content", "[role=main]".
        include_selectors: nil,
        # Return a cached result if a prior scrape for the same parameters exists and is
        # younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
        # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
        max_age_ms: nil,
        # PDF parsing controls. Use start/end to limit text extraction and embedded-image
        # detection/OCR to an inclusive 1-based page range.
        pdf: nil,
        # When true, waits briefly for CSS and transition animations to settle before
        # extracting HTML. Defaults to false. This adds a bit of latency in exchange for
        # more stable output on animated pages.
        settle_animations: nil,
        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # When true, return only the page's main content in the HTML response, excluding
        # headers, footers, sidebars, and navigation when detectable.
        use_main_content_only: nil,
        # Optional browser wait time in milliseconds after initial page load. Min: 0. Max:
        # 30000 (30 seconds). When combined with timeoutOpts, timeoutOpts.milliseconds
        # must be at least waitForMs + 10000 ms; a shorter deadline is rejected with 400
        # TIMEOUT_TOO_SHORT_FOR_WAIT.
        wait_for_ms: nil,
        # Set to enabled to bypass shared caches and omit request and response content
        # from retained usage logs. Requires zero data retention to be enabled for your
        # organization (contact support@context.dev), otherwise the request fails with
        # ZDR_NOT_ENABLED. Successful ZDR responses include X-Context-ZDR: true.
        zdr: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            url: String,
            actions:
              T.nilable(
                T::Array[
                  T.any(
                    ContextDev::WebWebScrapeHTMLParams::Action::Wait,
                    ContextDev::WebWebScrapeHTMLParams::Action::Perform,
                    ContextDev::WebWebScrapeHTMLParams::Action::Scroll
                  )
                ]
              ),
            country: ContextDev::WebWebScrapeHTMLParams::Country::OrSymbol,
            exclude_selectors: T.nilable(T::Array[String]),
            headers: T::Hash[Symbol, String],
            include_frames: T::Boolean,
            include_selectors: T.nilable(T::Array[String]),
            max_age_ms: T.nilable(Integer),
            pdf: ContextDev::WebWebScrapeHTMLParams::Pdf,
            settle_animations: T::Boolean,
            tags: T::Array[String],
            timeout_opts: ContextDev::WebWebScrapeHTMLParams::TimeoutOpts,
            use_main_content_only: T::Boolean,
            wait_for_ms: T.nilable(Integer),
            zdr: ContextDev::WebWebScrapeHTMLParams::Zdr::OrSymbol,
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
              ContextDev::WebWebScrapeHTMLParams::Action::Wait,
              ContextDev::WebWebScrapeHTMLParams::Action::Perform,
              ContextDev::WebWebScrapeHTMLParams::Action::Scroll
            )
          end

        class Wait < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::WebWebScrapeHTMLParams::Action::Wait,
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
                ContextDev::WebWebScrapeHTMLParams::Action::Perform,
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
                ContextDev::WebWebScrapeHTMLParams::Action::Scroll,
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
                  ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Amount::OrSymbol
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
                  ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Amount::OrSymbol
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
                ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Direction::OrSymbol
              )
            )
          end
          attr_reader :direction

          sig do
            params(
              direction:
                ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Direction::OrSymbol
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
                  ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Amount::OrSymbol
                ),
              container: String,
              direction:
                ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Direction::OrSymbol,
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
                    ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Amount::OrSymbol
                  ),
                container: String,
                direction:
                  ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Direction::OrSymbol,
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
                  ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Amount::TaggedSymbol
                )
              end

            sig do
              override.returns(
                T::Array[
                  ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Amount::Variants
                ]
              )
            end
            def self.variants
            end

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Amount
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VIEWPORT =
              T.let(
                :viewport,
                ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Amount::TaggedSymbol
              )
            MAX =
              T.let(
                :max,
                ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Amount::TaggedSymbol
              )
          end

          # Direction to scroll. Defaults to down.
          module Direction
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Direction
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            UP =
              T.let(
                :up,
                ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Direction::TaggedSymbol
              )
            DOWN =
              T.let(
                :down,
                ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Direction::TaggedSymbol
              )
            LEFT =
              T.let(
                :left,
                ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Direction::TaggedSymbol
              )
            RIGHT =
              T.let(
                :right,
                ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Direction::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Direction::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[ContextDev::WebWebScrapeHTMLParams::Action::Variants]
          )
        end
        def self.variants
        end
      end

      # Fetch the target page through a residential proxy in this country (ISO 3166-1
      # alpha-2).
      module Country
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebWebScrapeHTMLParams::Country)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AD =
          T.let(:ad, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        AE =
          T.let(:ae, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        AF =
          T.let(:af, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        AG =
          T.let(:ag, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        AI =
          T.let(:ai, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        AL =
          T.let(:al, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        AM =
          T.let(:am, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        AO =
          T.let(:ao, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        AR =
          T.let(:ar, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        AT =
          T.let(:at, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        AU =
          T.let(:au, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        AW =
          T.let(:aw, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        AZ =
          T.let(:az, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BA =
          T.let(:ba, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BB =
          T.let(:bb, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BD =
          T.let(:bd, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BE =
          T.let(:be, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BF =
          T.let(:bf, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BG =
          T.let(:bg, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BH =
          T.let(:bh, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BI =
          T.let(:bi, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BJ =
          T.let(:bj, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BM =
          T.let(:bm, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BN =
          T.let(:bn, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BO =
          T.let(:bo, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BQ =
          T.let(:bq, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BR =
          T.let(:br, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BS =
          T.let(:bs, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BW =
          T.let(:bw, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BY =
          T.let(:by, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        BZ =
          T.let(:bz, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        CA =
          T.let(:ca, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        CD =
          T.let(:cd, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        CF =
          T.let(:cf, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        CG =
          T.let(:cg, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        CH =
          T.let(:ch, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        CI =
          T.let(:ci, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        CL =
          T.let(:cl, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        CM =
          T.let(:cm, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        CN =
          T.let(:cn, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        CO =
          T.let(:co, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        CR =
          T.let(:cr, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        CV =
          T.let(:cv, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        CW =
          T.let(:cw, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        CY =
          T.let(:cy, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        CZ =
          T.let(:cz, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        DE =
          T.let(:de, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        DJ =
          T.let(:dj, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        DK =
          T.let(:dk, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        DM =
          T.let(:dm, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        DO =
          T.let(:do, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        DZ =
          T.let(:dz, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        EC =
          T.let(:ec, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        EE =
          T.let(:ee, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        EG =
          T.let(:eg, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        ES =
          T.let(:es, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        ET =
          T.let(:et, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        FI =
          T.let(:fi, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        FJ =
          T.let(:fj, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        FR =
          T.let(:fr, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        GA =
          T.let(:ga, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        GB =
          T.let(:gb, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        GD =
          T.let(:gd, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        GE =
          T.let(:ge, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        GF =
          T.let(:gf, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        GG =
          T.let(:gg, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        GH =
          T.let(:gh, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        GM =
          T.let(:gm, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        GN =
          T.let(:gn, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        GP =
          T.let(:gp, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        GQ =
          T.let(:gq, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        GR =
          T.let(:gr, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        GT =
          T.let(:gt, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        GU =
          T.let(:gu, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        GW =
          T.let(:gw, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        GY =
          T.let(:gy, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        HK =
          T.let(:hk, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        HN =
          T.let(:hn, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        HR =
          T.let(:hr, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        HT =
          T.let(:ht, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        HU =
          T.let(:hu, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        ID =
          T.let(:id, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        IE =
          T.let(:ie, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        IL =
          T.let(:il, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        IM =
          T.let(:im, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        IN =
          T.let(:in, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        IQ =
          T.let(:iq, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        IR =
          T.let(:ir, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        IS =
          T.let(:is, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        IT =
          T.let(:it, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        JE =
          T.let(:je, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        JM =
          T.let(:jm, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        JO =
          T.let(:jo, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        JP =
          T.let(:jp, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        KE =
          T.let(:ke, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        KG =
          T.let(:kg, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        KH =
          T.let(:kh, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        KN =
          T.let(:kn, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        KR =
          T.let(:kr, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        KW =
          T.let(:kw, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        KY =
          T.let(:ky, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        KZ =
          T.let(:kz, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        LA =
          T.let(:la, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        LB =
          T.let(:lb, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        LC =
          T.let(:lc, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        LK =
          T.let(:lk, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        LR =
          T.let(:lr, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        LS =
          T.let(:ls, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        LT =
          T.let(:lt, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        LU =
          T.let(:lu, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        LV =
          T.let(:lv, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        LY =
          T.let(:ly, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MA =
          T.let(:ma, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MC =
          T.let(:mc, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MD =
          T.let(:md, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        ME =
          T.let(:me, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MF =
          T.let(:mf, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MG =
          T.let(:mg, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MK =
          T.let(:mk, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        ML =
          T.let(:ml, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MM =
          T.let(:mm, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MN =
          T.let(:mn, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MO =
          T.let(:mo, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MQ =
          T.let(:mq, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MR =
          T.let(:mr, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MT =
          T.let(:mt, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MU =
          T.let(:mu, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MV =
          T.let(:mv, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MW =
          T.let(:mw, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MX =
          T.let(:mx, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MY =
          T.let(:my, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        MZ =
          T.let(:mz, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        NA =
          T.let(:na, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        NC =
          T.let(:nc, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        NE =
          T.let(:ne, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        NG =
          T.let(:ng, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        NI =
          T.let(:ni, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        NL =
          T.let(:nl, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        NO =
          T.let(:no, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        NP =
          T.let(:np, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        NZ =
          T.let(:nz, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        OM =
          T.let(:om, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        PA =
          T.let(:pa, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        PE =
          T.let(:pe, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        PF =
          T.let(:pf, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        PG =
          T.let(:pg, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        PH =
          T.let(:ph, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        PK =
          T.let(:pk, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        PL =
          T.let(:pl, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        PR =
          T.let(:pr, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        PS =
          T.let(:ps, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        PT =
          T.let(:pt, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        PY =
          T.let(:py, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        QA =
          T.let(:qa, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        RE =
          T.let(:re, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        RO =
          T.let(:ro, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        RS =
          T.let(:rs, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        RU =
          T.let(:ru, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        RW =
          T.let(:rw, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        SA =
          T.let(:sa, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        SC =
          T.let(:sc, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        SD =
          T.let(:sd, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        SE =
          T.let(:se, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        SG =
          T.let(:sg, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        SI =
          T.let(:si, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        SK =
          T.let(:sk, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        SL =
          T.let(:sl, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        SM =
          T.let(:sm, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        SN =
          T.let(:sn, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        SO =
          T.let(:so, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        SR =
          T.let(:sr, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        SS =
          T.let(:ss, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        ST =
          T.let(:st, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        SV =
          T.let(:sv, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        SX =
          T.let(:sx, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        SY =
          T.let(:sy, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        SZ =
          T.let(:sz, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        TC =
          T.let(:tc, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        TD =
          T.let(:td, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        TG =
          T.let(:tg, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        TH =
          T.let(:th, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        TJ =
          T.let(:tj, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        TL =
          T.let(:tl, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        TM =
          T.let(:tm, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        TN =
          T.let(:tn, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        TR =
          T.let(:tr, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        TT =
          T.let(:tt, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        TW =
          T.let(:tw, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        TZ =
          T.let(:tz, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        UA =
          T.let(:ua, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        UG =
          T.let(:ug, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        US =
          T.let(:us, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        UY =
          T.let(:uy, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        UZ =
          T.let(:uz, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        VC =
          T.let(:vc, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        VE =
          T.let(:ve, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        VG =
          T.let(:vg, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        VI =
          T.let(:vi, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        VN =
          T.let(:vn, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        YE =
          T.let(:ye, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        YT =
          T.let(:yt, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        ZA =
          T.let(:za, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        ZM =
          T.let(:zm, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)
        ZW =
          T.let(:zw, ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::WebWebScrapeHTMLParams::Country::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Pdf < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebWebScrapeHTMLParams::Pdf,
              ContextDev::Internal::AnyHash
            )
          end

        # Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
        # Must be greater than or equal to start when both are provided.
        sig { returns(T.nilable(Integer)) }
        attr_reader :end_

        sig { params(end_: Integer).void }
        attr_writer :end_

        # When true, OCR the selected PDF pages that have no usable text layer (scans),
        # replacing each recovered page's text with the OCR result while pages with a real
        # text layer keep it. Billed at 1 credit per page OCR actually recovered, on top
        # of the base request cost. When false, no OCR runs.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :ocr

        sig { params(ocr: T::Boolean).void }
        attr_writer :ocr

        # When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
        # a 400 PDF_SKIPPED is returned.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :should_parse

        sig { params(should_parse: T::Boolean).void }
        attr_writer :should_parse

        # First 1-based PDF page to parse. When omitted, parsing starts at the first page.
        sig { returns(T.nilable(Integer)) }
        attr_reader :start

        sig { params(start: Integer).void }
        attr_writer :start

        # PDF parsing controls. Use start/end to limit text extraction and embedded-image
        # detection/OCR to an inclusive 1-based page range.
        sig do
          params(
            end_: Integer,
            ocr: T::Boolean,
            should_parse: T::Boolean,
            start: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
          # Must be greater than or equal to start when both are provided.
          end_: nil,
          # When true, OCR the selected PDF pages that have no usable text layer (scans),
          # replacing each recovered page's text with the OCR result while pages with a real
          # text layer keep it. Billed at 1 credit per page OCR actually recovered, on top
          # of the base request cost. When false, no OCR runs.
          ocr: nil,
          # When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
          # a 400 PDF_SKIPPED is returned.
          should_parse: nil,
          # First 1-based PDF page to parse. When omitted, parsing starts at the first page.
          start: nil
        )
        end

        sig do
          override.returns(
            {
              end_: Integer,
              ocr: T::Boolean,
              should_parse: T::Boolean,
              start: Integer
            }
          )
        end
        def to_hash
        end
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebWebScrapeHTMLParams::TimeoutOpts,
              ContextDev::Internal::AnyHash
            )
          end

        # Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        sig { returns(Integer) }
        attr_accessor :milliseconds

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results. "return-partial" requires milliseconds of at
        # least 5000.
        sig do
          returns(
            T.nilable(
              ContextDev::WebWebScrapeHTMLParams::TimeoutOpts::Behavior::OrSymbol
            )
          )
        end
        attr_reader :behavior

        sig do
          params(
            behavior:
              ContextDev::WebWebScrapeHTMLParams::TimeoutOpts::Behavior::OrSymbol
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
              ContextDev::WebWebScrapeHTMLParams::TimeoutOpts::Behavior::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Request deadline in milliseconds. Maximum: 300000 (5 minutes).
          milliseconds:,
          # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
          # credits. "return-partial" returns usable results collected so far; if none are
          # available, the request still fails without charging credits. Partial results are
          # not cached as complete results. "return-partial" requires milliseconds of at
          # least 5000.
          behavior: nil
        )
        end

        sig do
          override.returns(
            {
              milliseconds: Integer,
              behavior:
                ContextDev::WebWebScrapeHTMLParams::TimeoutOpts::Behavior::OrSymbol
            }
          )
        end
        def to_hash
        end

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results. "return-partial" requires milliseconds of at
        # least 5000.
        module Behavior
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::WebWebScrapeHTMLParams::TimeoutOpts::Behavior
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAIL =
            T.let(
              :fail,
              ContextDev::WebWebScrapeHTMLParams::TimeoutOpts::Behavior::TaggedSymbol
            )
          RETURN_PARTIAL =
            T.let(
              :"return-partial",
              ContextDev::WebWebScrapeHTMLParams::TimeoutOpts::Behavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebWebScrapeHTMLParams::TimeoutOpts::Behavior::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Requires zero data retention to be enabled for your
      # organization (contact support@context.dev), otherwise the request fails with
      # ZDR_NOT_ENABLED. Successful ZDR responses include X-Context-ZDR: true.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebWebScrapeHTMLParams::Zdr)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(:enabled, ContextDev::WebWebScrapeHTMLParams::Zdr::TaggedSymbol)
        DISABLED =
          T.let(
            :disabled,
            ContextDev::WebWebScrapeHTMLParams::Zdr::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::WebWebScrapeHTMLParams::Zdr::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
