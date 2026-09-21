# typed: strong

module ContextDev
  module Models
    class WebWebScrapeImagesParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::WebWebScrapeImagesParams,
            ContextDev::Internal::AnyHash
          )
        end

      # Page URL to inspect. Must include http:// or https://.
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
                ContextDev::WebWebScrapeImagesParams::Action::Wait,
                ContextDev::WebWebScrapeImagesParams::Action::Perform,
                ContextDev::WebWebScrapeImagesParams::Action::Scroll
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
          T.nilable(ContextDev::WebWebScrapeImagesParams::Country::OrSymbol)
        )
      end
      attr_reader :country

      sig do
        params(
          country: ContextDev::WebWebScrapeImagesParams::Country::OrSymbol
        ).void
      end
      attr_writer :country

      # When true, visually duplicate images are removed: every image is loaded and
      # perceptually hashed, and only the highest-resolution copy of each duplicate
      # group is kept. Images that cannot be downloaded or hashed are kept. Default:
      # false.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :dedupe

      sig { params(dedupe: T::Boolean).void }
      attr_writer :dedupe

      # Optional per-image processing, sent as deep-object query params such as
      # enrichment[resolution]=true.
      sig do
        returns(T.nilable(ContextDev::WebWebScrapeImagesParams::Enrichment))
      end
      attr_reader :enrichment

      sig do
        params(
          enrichment:
            T.nilable(ContextDev::WebWebScrapeImagesParams::Enrichment::OrHash)
        ).void
      end
      attr_writer :enrichment

      # Optional outbound HTTP headers forwarded only to the target URL, sent as
      # deep-object query params such as headers[X-Custom]=value. When provided, caching
      # is bypassed: the result is neither read from nor written to cache.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      # Reuse a cached result this many milliseconds old or newer. Default: 86400000 (1
      # day). Set to 0 to bypass cache. Maximum: 2592000000 (30 days).
      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_age_ms

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
        returns(T.nilable(ContextDev::WebWebScrapeImagesParams::TimeoutOpts))
      end
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts:
            ContextDev::WebWebScrapeImagesParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      # Optional browser wait time in milliseconds after initial page load before
      # collecting images. Min: 0. Max: 30000 (30 seconds). When combined with
      # timeoutOpts, timeoutOpts.milliseconds must be at least waitForMs + 10000 ms; a
      # shorter deadline is rejected with 400 TIMEOUT_TOO_SHORT_FOR_WAIT.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :wait_for_ms

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Asset uploads are skipped, so hosted image URLs are
      # omitted. Requires zero data retention to be enabled for your organization
      # (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
      # Successful ZDR responses include X-Context-ZDR: true.
      sig do
        returns(T.nilable(ContextDev::WebWebScrapeImagesParams::Zdr::OrSymbol))
      end
      attr_reader :zdr

      sig do
        params(zdr: ContextDev::WebWebScrapeImagesParams::Zdr::OrSymbol).void
      end
      attr_writer :zdr

      sig do
        params(
          url: String,
          actions:
            T.nilable(
              T::Array[
                T.any(
                  ContextDev::WebWebScrapeImagesParams::Action::Wait::OrHash,
                  ContextDev::WebWebScrapeImagesParams::Action::Perform::OrHash,
                  ContextDev::WebWebScrapeImagesParams::Action::Scroll::OrHash
                )
              ]
            ),
          country: ContextDev::WebWebScrapeImagesParams::Country::OrSymbol,
          dedupe: T::Boolean,
          enrichment:
            T.nilable(ContextDev::WebWebScrapeImagesParams::Enrichment::OrHash),
          headers: T::Hash[Symbol, String],
          max_age_ms: T.nilable(Integer),
          tags: T::Array[String],
          timeout_opts:
            ContextDev::WebWebScrapeImagesParams::TimeoutOpts::OrHash,
          wait_for_ms: T.nilable(Integer),
          zdr: ContextDev::WebWebScrapeImagesParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Page URL to inspect. Must include http:// or https://.
        url:,
        # Optional browser actions executed in array order after the page loads and before
        # content is captured. Requires a paid plan. Send a JSON array in the query
        # parameter. Maximum: 5 actions.
        actions: nil,
        # Fetch the target page through a residential proxy in this country (ISO 3166-1
        # alpha-2).
        country: nil,
        # When true, visually duplicate images are removed: every image is loaded and
        # perceptually hashed, and only the highest-resolution copy of each duplicate
        # group is kept. Images that cannot be downloaded or hashed are kept. Default:
        # false.
        dedupe: nil,
        # Optional per-image processing, sent as deep-object query params such as
        # enrichment[resolution]=true.
        enrichment: nil,
        # Optional outbound HTTP headers forwarded only to the target URL, sent as
        # deep-object query params such as headers[X-Custom]=value. When provided, caching
        # is bypassed: the result is neither read from nor written to cache.
        headers: nil,
        # Reuse a cached result this many milliseconds old or newer. Default: 86400000 (1
        # day). Set to 0 to bypass cache. Maximum: 2592000000 (30 days).
        max_age_ms: nil,
        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # Optional browser wait time in milliseconds after initial page load before
        # collecting images. Min: 0. Max: 30000 (30 seconds). When combined with
        # timeoutOpts, timeoutOpts.milliseconds must be at least waitForMs + 10000 ms; a
        # shorter deadline is rejected with 400 TIMEOUT_TOO_SHORT_FOR_WAIT.
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
            url: String,
            actions:
              T.nilable(
                T::Array[
                  T.any(
                    ContextDev::WebWebScrapeImagesParams::Action::Wait,
                    ContextDev::WebWebScrapeImagesParams::Action::Perform,
                    ContextDev::WebWebScrapeImagesParams::Action::Scroll
                  )
                ]
              ),
            country: ContextDev::WebWebScrapeImagesParams::Country::OrSymbol,
            dedupe: T::Boolean,
            enrichment:
              T.nilable(ContextDev::WebWebScrapeImagesParams::Enrichment),
            headers: T::Hash[Symbol, String],
            max_age_ms: T.nilable(Integer),
            tags: T::Array[String],
            timeout_opts: ContextDev::WebWebScrapeImagesParams::TimeoutOpts,
            wait_for_ms: T.nilable(Integer),
            zdr: ContextDev::WebWebScrapeImagesParams::Zdr::OrSymbol,
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
              ContextDev::WebWebScrapeImagesParams::Action::Wait,
              ContextDev::WebWebScrapeImagesParams::Action::Perform,
              ContextDev::WebWebScrapeImagesParams::Action::Scroll
            )
          end

        class Wait < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::WebWebScrapeImagesParams::Action::Wait,
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
                ContextDev::WebWebScrapeImagesParams::Action::Perform,
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
                ContextDev::WebWebScrapeImagesParams::Action::Scroll,
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
                  ContextDev::WebWebScrapeImagesParams::Action::Scroll::Amount::OrSymbol
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
                  ContextDev::WebWebScrapeImagesParams::Action::Scroll::Amount::OrSymbol
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
                ContextDev::WebWebScrapeImagesParams::Action::Scroll::Direction::OrSymbol
              )
            )
          end
          attr_reader :direction

          sig do
            params(
              direction:
                ContextDev::WebWebScrapeImagesParams::Action::Scroll::Direction::OrSymbol
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
                  ContextDev::WebWebScrapeImagesParams::Action::Scroll::Amount::OrSymbol
                ),
              container: String,
              direction:
                ContextDev::WebWebScrapeImagesParams::Action::Scroll::Direction::OrSymbol,
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
                    ContextDev::WebWebScrapeImagesParams::Action::Scroll::Amount::OrSymbol
                  ),
                container: String,
                direction:
                  ContextDev::WebWebScrapeImagesParams::Action::Scroll::Direction::OrSymbol,
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
                  ContextDev::WebWebScrapeImagesParams::Action::Scroll::Amount::TaggedSymbol
                )
              end

            sig do
              override.returns(
                T::Array[
                  ContextDev::WebWebScrapeImagesParams::Action::Scroll::Amount::Variants
                ]
              )
            end
            def self.variants
            end

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::WebWebScrapeImagesParams::Action::Scroll::Amount
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VIEWPORT =
              T.let(
                :viewport,
                ContextDev::WebWebScrapeImagesParams::Action::Scroll::Amount::TaggedSymbol
              )
            MAX =
              T.let(
                :max,
                ContextDev::WebWebScrapeImagesParams::Action::Scroll::Amount::TaggedSymbol
              )
          end

          # Direction to scroll. Defaults to down.
          module Direction
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::WebWebScrapeImagesParams::Action::Scroll::Direction
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            UP =
              T.let(
                :up,
                ContextDev::WebWebScrapeImagesParams::Action::Scroll::Direction::TaggedSymbol
              )
            DOWN =
              T.let(
                :down,
                ContextDev::WebWebScrapeImagesParams::Action::Scroll::Direction::TaggedSymbol
              )
            LEFT =
              T.let(
                :left,
                ContextDev::WebWebScrapeImagesParams::Action::Scroll::Direction::TaggedSymbol
              )
            RIGHT =
              T.let(
                :right,
                ContextDev::WebWebScrapeImagesParams::Action::Scroll::Direction::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::WebWebScrapeImagesParams::Action::Scroll::Direction::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[ContextDev::WebWebScrapeImagesParams::Action::Variants]
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
            T.all(Symbol, ContextDev::WebWebScrapeImagesParams::Country)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AD =
          T.let(
            :ad,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        AE =
          T.let(
            :ae,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        AF =
          T.let(
            :af,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        AG =
          T.let(
            :ag,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        AI =
          T.let(
            :ai,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        AL =
          T.let(
            :al,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        AM =
          T.let(
            :am,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        AO =
          T.let(
            :ao,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        AR =
          T.let(
            :ar,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        AT =
          T.let(
            :at,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        AU =
          T.let(
            :au,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        AW =
          T.let(
            :aw,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        AZ =
          T.let(
            :az,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BA =
          T.let(
            :ba,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BB =
          T.let(
            :bb,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BD =
          T.let(
            :bd,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BE =
          T.let(
            :be,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BF =
          T.let(
            :bf,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BG =
          T.let(
            :bg,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BH =
          T.let(
            :bh,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BI =
          T.let(
            :bi,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BJ =
          T.let(
            :bj,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BM =
          T.let(
            :bm,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BN =
          T.let(
            :bn,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BO =
          T.let(
            :bo,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BQ =
          T.let(
            :bq,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BR =
          T.let(
            :br,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BS =
          T.let(
            :bs,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BW =
          T.let(
            :bw,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BY =
          T.let(
            :by,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        BZ =
          T.let(
            :bz,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        CA =
          T.let(
            :ca,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        CD =
          T.let(
            :cd,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        CF =
          T.let(
            :cf,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        CG =
          T.let(
            :cg,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        CH =
          T.let(
            :ch,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        CI =
          T.let(
            :ci,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        CL =
          T.let(
            :cl,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        CM =
          T.let(
            :cm,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        CN =
          T.let(
            :cn,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        CO =
          T.let(
            :co,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        CR =
          T.let(
            :cr,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        CV =
          T.let(
            :cv,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        CW =
          T.let(
            :cw,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        CY =
          T.let(
            :cy,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        CZ =
          T.let(
            :cz,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        DE =
          T.let(
            :de,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        DJ =
          T.let(
            :dj,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        DK =
          T.let(
            :dk,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        DM =
          T.let(
            :dm,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        DO =
          T.let(
            :do,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        DZ =
          T.let(
            :dz,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        EC =
          T.let(
            :ec,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        EE =
          T.let(
            :ee,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        EG =
          T.let(
            :eg,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        ES =
          T.let(
            :es,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        ET =
          T.let(
            :et,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        FI =
          T.let(
            :fi,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        FJ =
          T.let(
            :fj,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        FR =
          T.let(
            :fr,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        GA =
          T.let(
            :ga,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        GB =
          T.let(
            :gb,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        GD =
          T.let(
            :gd,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        GE =
          T.let(
            :ge,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        GF =
          T.let(
            :gf,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        GG =
          T.let(
            :gg,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        GH =
          T.let(
            :gh,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        GM =
          T.let(
            :gm,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        GN =
          T.let(
            :gn,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        GP =
          T.let(
            :gp,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        GQ =
          T.let(
            :gq,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        GR =
          T.let(
            :gr,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        GT =
          T.let(
            :gt,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        GU =
          T.let(
            :gu,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        GW =
          T.let(
            :gw,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        GY =
          T.let(
            :gy,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        HK =
          T.let(
            :hk,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        HN =
          T.let(
            :hn,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        HR =
          T.let(
            :hr,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        HT =
          T.let(
            :ht,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        HU =
          T.let(
            :hu,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        ID =
          T.let(
            :id,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        IE =
          T.let(
            :ie,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        IL =
          T.let(
            :il,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        IM =
          T.let(
            :im,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        IN =
          T.let(
            :in,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        IQ =
          T.let(
            :iq,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        IR =
          T.let(
            :ir,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        IS =
          T.let(
            :is,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        IT =
          T.let(
            :it,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        JE =
          T.let(
            :je,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        JM =
          T.let(
            :jm,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        JO =
          T.let(
            :jo,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        JP =
          T.let(
            :jp,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        KE =
          T.let(
            :ke,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        KG =
          T.let(
            :kg,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        KH =
          T.let(
            :kh,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        KN =
          T.let(
            :kn,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        KR =
          T.let(
            :kr,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        KW =
          T.let(
            :kw,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        KY =
          T.let(
            :ky,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        KZ =
          T.let(
            :kz,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        LA =
          T.let(
            :la,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        LB =
          T.let(
            :lb,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        LC =
          T.let(
            :lc,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        LK =
          T.let(
            :lk,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        LR =
          T.let(
            :lr,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        LS =
          T.let(
            :ls,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        LT =
          T.let(
            :lt,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        LU =
          T.let(
            :lu,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        LV =
          T.let(
            :lv,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        LY =
          T.let(
            :ly,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MA =
          T.let(
            :ma,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MC =
          T.let(
            :mc,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MD =
          T.let(
            :md,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        ME =
          T.let(
            :me,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MF =
          T.let(
            :mf,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MG =
          T.let(
            :mg,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MK =
          T.let(
            :mk,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        ML =
          T.let(
            :ml,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MM =
          T.let(
            :mm,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MN =
          T.let(
            :mn,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MO =
          T.let(
            :mo,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MQ =
          T.let(
            :mq,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MR =
          T.let(
            :mr,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MT =
          T.let(
            :mt,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MU =
          T.let(
            :mu,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MV =
          T.let(
            :mv,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MW =
          T.let(
            :mw,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MX =
          T.let(
            :mx,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MY =
          T.let(
            :my,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        MZ =
          T.let(
            :mz,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        NA =
          T.let(
            :na,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        NC =
          T.let(
            :nc,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        NE =
          T.let(
            :ne,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        NG =
          T.let(
            :ng,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        NI =
          T.let(
            :ni,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        NL =
          T.let(
            :nl,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        NO =
          T.let(
            :no,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        NP =
          T.let(
            :np,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        NZ =
          T.let(
            :nz,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        OM =
          T.let(
            :om,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        PA =
          T.let(
            :pa,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        PE =
          T.let(
            :pe,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        PF =
          T.let(
            :pf,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        PG =
          T.let(
            :pg,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        PH =
          T.let(
            :ph,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        PK =
          T.let(
            :pk,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        PL =
          T.let(
            :pl,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        PR =
          T.let(
            :pr,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        PS =
          T.let(
            :ps,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        PT =
          T.let(
            :pt,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        PY =
          T.let(
            :py,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        QA =
          T.let(
            :qa,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        RE =
          T.let(
            :re,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        RO =
          T.let(
            :ro,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        RS =
          T.let(
            :rs,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        RU =
          T.let(
            :ru,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        RW =
          T.let(
            :rw,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        SA =
          T.let(
            :sa,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        SC =
          T.let(
            :sc,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        SD =
          T.let(
            :sd,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        SE =
          T.let(
            :se,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        SG =
          T.let(
            :sg,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        SI =
          T.let(
            :si,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        SK =
          T.let(
            :sk,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        SL =
          T.let(
            :sl,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        SM =
          T.let(
            :sm,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        SN =
          T.let(
            :sn,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        SO =
          T.let(
            :so,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        SR =
          T.let(
            :sr,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        SS =
          T.let(
            :ss,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        ST =
          T.let(
            :st,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        SV =
          T.let(
            :sv,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        SX =
          T.let(
            :sx,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        SY =
          T.let(
            :sy,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        SZ =
          T.let(
            :sz,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        TC =
          T.let(
            :tc,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        TD =
          T.let(
            :td,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        TG =
          T.let(
            :tg,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        TH =
          T.let(
            :th,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        TJ =
          T.let(
            :tj,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        TL =
          T.let(
            :tl,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        TM =
          T.let(
            :tm,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        TN =
          T.let(
            :tn,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        TR =
          T.let(
            :tr,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        TT =
          T.let(
            :tt,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        TW =
          T.let(
            :tw,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        TZ =
          T.let(
            :tz,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        UA =
          T.let(
            :ua,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        UG =
          T.let(
            :ug,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        US =
          T.let(
            :us,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        UY =
          T.let(
            :uy,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        UZ =
          T.let(
            :uz,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        VC =
          T.let(
            :vc,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        VE =
          T.let(
            :ve,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        VG =
          T.let(
            :vg,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        VI =
          T.let(
            :vi,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        VN =
          T.let(
            :vn,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        YE =
          T.let(
            :ye,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        YT =
          T.let(
            :yt,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        ZA =
          T.let(
            :za,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        ZM =
          T.let(
            :zm,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )
        ZW =
          T.let(
            :zw,
            ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::WebWebScrapeImagesParams::Country::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Enrichment < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebWebScrapeImagesParams::Enrichment,
              ContextDev::Internal::AnyHash
            )
          end

        # Classify each image by visual asset type.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :classification

        sig { params(classification: T::Boolean).void }
        attr_writer :classification

        # Host materializable images on the Brand.dev CDN and return their URL and MIME
        # type. Ignored when zero data retention is enabled.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :hosted_url

        sig { params(hosted_url: T::Boolean).void }
        attr_writer :hosted_url

        # Per-image enrichment timeout in milliseconds. Default: 30000. Maximum: 60000.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_time_per_ms

        sig { params(max_time_per_ms: Integer).void }
        attr_writer :max_time_per_ms

        # Measure image width and height when possible.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :resolution

        sig { params(resolution: T::Boolean).void }
        attr_writer :resolution

        # Optional per-image processing, sent as deep-object query params such as
        # enrichment[resolution]=true.
        sig do
          params(
            classification: T::Boolean,
            hosted_url: T::Boolean,
            max_time_per_ms: Integer,
            resolution: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Classify each image by visual asset type.
          classification: nil,
          # Host materializable images on the Brand.dev CDN and return their URL and MIME
          # type. Ignored when zero data retention is enabled.
          hosted_url: nil,
          # Per-image enrichment timeout in milliseconds. Default: 30000. Maximum: 60000.
          max_time_per_ms: nil,
          # Measure image width and height when possible.
          resolution: nil
        )
        end

        sig do
          override.returns(
            {
              classification: T::Boolean,
              hosted_url: T::Boolean,
              max_time_per_ms: Integer,
              resolution: T::Boolean
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
              ContextDev::WebWebScrapeImagesParams::TimeoutOpts,
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
              ContextDev::WebWebScrapeImagesParams::TimeoutOpts::Behavior::OrSymbol
            )
          )
        end
        attr_reader :behavior

        sig do
          params(
            behavior:
              ContextDev::WebWebScrapeImagesParams::TimeoutOpts::Behavior::OrSymbol
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
              ContextDev::WebWebScrapeImagesParams::TimeoutOpts::Behavior::OrSymbol
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
                ContextDev::WebWebScrapeImagesParams::TimeoutOpts::Behavior::OrSymbol
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
                ContextDev::WebWebScrapeImagesParams::TimeoutOpts::Behavior
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAIL =
            T.let(
              :fail,
              ContextDev::WebWebScrapeImagesParams::TimeoutOpts::Behavior::TaggedSymbol
            )
          RETURN_PARTIAL =
            T.let(
              :"return-partial",
              ContextDev::WebWebScrapeImagesParams::TimeoutOpts::Behavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebWebScrapeImagesParams::TimeoutOpts::Behavior::TaggedSymbol
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
          T.type_alias do
            T.all(Symbol, ContextDev::WebWebScrapeImagesParams::Zdr)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(
            :enabled,
            ContextDev::WebWebScrapeImagesParams::Zdr::TaggedSymbol
          )
        DISABLED =
          T.let(
            :disabled,
            ContextDev::WebWebScrapeImagesParams::Zdr::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::WebWebScrapeImagesParams::Zdr::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
