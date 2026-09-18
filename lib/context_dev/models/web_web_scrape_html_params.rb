# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#web_scrape_html
    class WebWebScrapeHTMLParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute url
      #   Full URL to scrape (must include http:// or https:// protocol)
      #
      #   @return [String]
      required :url, String

      # @!attribute actions
      #   Optional browser actions executed in array order after the page loads and before
      #   content is captured. Requires a paid plan. Send a JSON array in the query
      #   parameter. Maximum: 5 actions.
      #
      #   @return [Array<ContextDev::Models::WebWebScrapeHTMLParams::Action::Wait, ContextDev::Models::WebWebScrapeHTMLParams::Action::Perform, ContextDev::Models::WebWebScrapeHTMLParams::Action::Scroll>, nil]
      optional :actions,
               -> { ContextDev::Internal::Type::ArrayOf[union: ContextDev::WebWebScrapeHTMLParams::Action] },
               nil?: true

      # @!attribute country
      #   Fetch the target page through a residential proxy in this country (ISO 3166-1
      #   alpha-2).
      #
      #   @return [Symbol, ContextDev::Models::WebWebScrapeHTMLParams::Country, nil]
      optional :country, enum: -> { ContextDev::WebWebScrapeHTMLParams::Country }

      # @!attribute exclude_selectors
      #   CSS selectors to remove from the result. Applied after includeSelectors.
      #   Exclusion takes precedence: an element matching both is removed. Examples:
      #   "nav", "footer", ".ad-banner", "[aria-hidden=true]".
      #
      #   @return [Array<String>, nil]
      optional :exclude_selectors, ContextDev::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute extract_rules
      #   Optional CSS extraction rules applied to the returned HTML after selector and
      #   main-content filtering. Use selector strings ("h1", "a@href") or objects with
      #   selector, type (item or list), and output (text, html, @attribute, or nested
      #   rules). Text whitespace is normalized; html includes the matched element;
      #   attributes are returned as written. Missing items are null and missing lists are
      #   empty. CSS only; XPath is not supported. Maximum: 100 fields across 5 levels.
      #   Send a JSON-encoded string in the extractRules query parameter.
      #
      #   @return [Hash{Symbol=>String, ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1}, nil]
      optional :extract_rules,
               -> { ContextDev::Internal::Type::HashOf[union: ContextDev::WebWebScrapeHTMLParams::ExtractRule] }

      # @!attribute headers
      #   Optional outbound HTTP headers forwarded only to the target URL, sent as
      #   deep-object query params such as headers[X-Custom]=value. When provided, caching
      #   is bypassed: the result is neither read from nor written to cache.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, ContextDev::Internal::Type::HashOf[String]

      # @!attribute include_frames
      #   When true, iframes are rendered inline into the returned HTML.
      #
      #   @return [Boolean, nil]
      optional :include_frames, ContextDev::Internal::Type::Boolean

      # @!attribute include_selectors
      #   CSS selectors. When provided, only matching subtrees (and their descendants) are
      #   kept and everything else is dropped. When omitted, the entire document is kept.
      #   Examples: "article.main", "#content", "[role=main]".
      #
      #   @return [Array<String>, nil]
      optional :include_selectors, ContextDev::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute max_age_ms
      #   Return a cached result if a prior scrape for the same parameters exists and is
      #   younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
      #   omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer, nil?: true

      # @!attribute pdf
      #   PDF parsing controls. Use start/end to limit text extraction and embedded-image
      #   detection/OCR to an inclusive 1-based page range.
      #
      #   @return [ContextDev::Models::WebWebScrapeHTMLParams::Pdf, nil]
      optional :pdf, -> { ContextDev::WebWebScrapeHTMLParams::Pdf }

      # @!attribute settle_animations
      #   When true, waits briefly for CSS and transition animations to settle before
      #   extracting HTML. Defaults to false. This adds a bit of latency in exchange for
      #   more stable output on animated pages.
      #
      #   @return [Boolean, nil]
      optional :settle_animations, ContextDev::Internal::Type::Boolean

      # @!attribute tags
      #   Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
      #   characters.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Optional request deadline and behavior on timeout. For GET requests, use
      #   timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
      #   timeoutOpts object.
      #
      #   @return [ContextDev::Models::WebWebScrapeHTMLParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::WebWebScrapeHTMLParams::TimeoutOpts }

      # @!attribute use_main_content_only
      #   When true, return only the page's main content in the HTML response, excluding
      #   headers, footers, sidebars, and navigation when detectable.
      #
      #   @return [Boolean, nil]
      optional :use_main_content_only, ContextDev::Internal::Type::Boolean

      # @!attribute wait_for_ms
      #   Optional browser wait time in milliseconds after initial page load. Min: 0. Max:
      #   30000 (30 seconds). When combined with timeoutOpts, timeoutOpts.milliseconds
      #   must be at least waitForMs + 10000 ms; a shorter deadline is rejected with 400
      #   TIMEOUT_TOO_SHORT_FOR_WAIT.
      #
      #   @return [Integer, nil]
      optional :wait_for_ms, Integer, nil?: true

      # @!attribute zdr
      #   Set to enabled to bypass shared caches and omit request and response content
      #   from retained usage logs. Asset uploads are skipped, so hosted image URLs are
      #   omitted. Requires zero data retention to be enabled for your organization
      #   (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
      #   Successful ZDR responses include X-Context-ZDR: true.
      #
      #   @return [Symbol, ContextDev::Models::WebWebScrapeHTMLParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebWebScrapeHTMLParams::Zdr }

      # @!method initialize(url:, actions: nil, country: nil, exclude_selectors: nil, extract_rules: nil, headers: nil, include_frames: nil, include_selectors: nil, max_age_ms: nil, pdf: nil, settle_animations: nil, tags: nil, timeout_opts: nil, use_main_content_only: nil, wait_for_ms: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebScrapeHTMLParams} for more details.
      #
      #   @param url [String] Full URL to scrape (must include http:// or https:// protocol)
      #
      #   @param actions [Array<ContextDev::Models::WebWebScrapeHTMLParams::Action::Wait, ContextDev::Models::WebWebScrapeHTMLParams::Action::Perform, ContextDev::Models::WebWebScrapeHTMLParams::Action::Scroll>, nil] Optional browser actions executed in array order after the page loads and before
      #
      #   @param country [Symbol, ContextDev::Models::WebWebScrapeHTMLParams::Country] Fetch the target page through a residential proxy in this country (ISO 3166-1 al
      #
      #   @param exclude_selectors [Array<String>, nil] CSS selectors to remove from the result. Applied after includeSelectors. Exclusi
      #
      #   @param extract_rules [Hash{Symbol=>String, ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1}] Optional CSS extraction rules applied to the returned HTML after selector and ma
      #
      #   @param headers [Hash{Symbol=>String}] Optional outbound HTTP headers forwarded only to the target URL, sent as deep-ob
      #
      #   @param include_frames [Boolean] When true, iframes are rendered inline into the returned HTML.
      #
      #   @param include_selectors [Array<String>, nil] CSS selectors. When provided, only matching subtrees (and their descendants) are
      #
      #   @param max_age_ms [Integer, nil] Return a cached result if a prior scrape for the same parameters exists and is y
      #
      #   @param pdf [ContextDev::Models::WebWebScrapeHTMLParams::Pdf] PDF parsing controls. Use start/end to limit text extraction and embedded-image
      #
      #   @param settle_animations [Boolean] When true, waits briefly for CSS and transition animations to settle before extr
      #
      #   @param tags [Array<String>] Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50 charac
      #
      #   @param timeout_opts [ContextDev::Models::WebWebScrapeHTMLParams::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout
      #
      #   @param use_main_content_only [Boolean] When true, return only the page's main content in the HTML response, excluding h
      #
      #   @param wait_for_ms [Integer, nil] Optional browser wait time in milliseconds after initial page load. Min: 0. Max:
      #
      #   @param zdr [Symbol, ContextDev::Models::WebWebScrapeHTMLParams::Zdr] Set to enabled to bypass shared caches and omit request and response content fro
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Browser action discriminated by `do`. Each variant exposes only its applicable
      # fields.
      module Action
        extend ContextDev::Internal::Type::Union

        discriminator :do

        # Pause for a fixed number of milliseconds before continuing to the next action.
        variant :wait, -> { ContextDev::WebWebScrapeHTMLParams::Action::Wait }

        # Resolve and perform one natural-language browser action.
        variant :perform, -> { ContextDev::WebWebScrapeHTMLParams::Action::Perform }

        # Scroll the page or a selected scrollable container, waiting adaptively for content and dimensions to settle after each iteration.
        variant :scroll, -> { ContextDev::WebWebScrapeHTMLParams::Action::Scroll }

        class Wait < ContextDev::Internal::Type::BaseModel
          # @!attribute do_
          #
          #   @return [Symbol, :wait]
          required :do_, const: :wait, api_name: :do

          # @!attribute time_ms
          #
          #   @return [Integer]
          required :time_ms, Integer, api_name: :timeMs

          # @!method initialize(time_ms:, do_: :wait)
          #   Pause for a fixed number of milliseconds before continuing to the next action.
          #
          #   @param time_ms [Integer]
          #   @param do_ [Symbol, :wait]
        end

        class Perform < ContextDev::Internal::Type::BaseModel
          # @!attribute action
          #
          #   @return [String]
          required :action, String

          # @!attribute do_
          #
          #   @return [Symbol, :perform]
          required :do_, const: :perform, api_name: :do

          # @!method initialize(action:, do_: :perform)
          #   Resolve and perform one natural-language browser action.
          #
          #   @param action [String]
          #   @param do_ [Symbol, :perform]
        end

        class Scroll < ContextDev::Internal::Type::BaseModel
          # @!attribute do_
          #
          #   @return [Symbol, :scroll]
          required :do_, const: :scroll, api_name: :do

          # @!attribute amount
          #   Pixels per scroll, one visible viewport, or the current scroll boundary.
          #   Defaults to viewport.
          #
          #   @return [Integer, Symbol, ContextDev::Models::WebWebScrapeHTMLParams::Action::Scroll::Amount, nil]
          optional :amount, union: -> { ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Amount }

          # @!attribute container
          #   CSS selector for the first matching scroll container. Defaults to the page.
          #
          #   @return [String, nil]
          optional :container, String

          # @!attribute direction
          #   Direction to scroll. Defaults to down.
          #
          #   @return [Symbol, ContextDev::Models::WebWebScrapeHTMLParams::Action::Scroll::Direction, nil]
          optional :direction, enum: -> { ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Direction }

          # @!attribute max_scrolls
          #   Maximum scroll iterations. Stops early when scrolling and scrollable extent stop
          #   changing. Defaults to 1.
          #
          #   @return [Integer, nil]
          optional :max_scrolls, Integer, api_name: :maxScrolls

          # @!method initialize(amount: nil, container: nil, direction: nil, max_scrolls: nil, do_: :scroll)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::WebWebScrapeHTMLParams::Action::Scroll} for more details.
          #
          #   Scroll the page or a selected scrollable container, waiting adaptively for
          #   content and dimensions to settle after each iteration.
          #
          #   @param amount [Integer, Symbol, ContextDev::Models::WebWebScrapeHTMLParams::Action::Scroll::Amount] Pixels per scroll, one visible viewport, or the current scroll boundary. Default
          #
          #   @param container [String] CSS selector for the first matching scroll container. Defaults to the page.
          #
          #   @param direction [Symbol, ContextDev::Models::WebWebScrapeHTMLParams::Action::Scroll::Direction] Direction to scroll. Defaults to down.
          #
          #   @param max_scrolls [Integer] Maximum scroll iterations. Stops early when scrolling and scrollable extent stop
          #
          #   @param do_ [Symbol, :scroll]

          # Pixels per scroll, one visible viewport, or the current scroll boundary.
          # Defaults to viewport.
          #
          # @see ContextDev::Models::WebWebScrapeHTMLParams::Action::Scroll#amount
          module Amount
            extend ContextDev::Internal::Type::Union

            variant Integer

            variant const: -> { ContextDev::Models::WebWebScrapeHTMLParams::Action::Scroll::Amount::VIEWPORT }

            variant const: -> { ContextDev::Models::WebWebScrapeHTMLParams::Action::Scroll::Amount::MAX }

            # @!method self.variants
            #   @return [Array(Integer, Symbol)]

            define_sorbet_constant!(:Variants) do
              T.type_alias { T.any(Integer, ContextDev::WebWebScrapeHTMLParams::Action::Scroll::Amount::TaggedSymbol) }
            end

            # @!group

            VIEWPORT = :viewport
            MAX = :max

            # @!endgroup
          end

          # Direction to scroll. Defaults to down.
          #
          # @see ContextDev::Models::WebWebScrapeHTMLParams::Action::Scroll#direction
          module Direction
            extend ContextDev::Internal::Type::Enum

            UP = :up
            DOWN = :down
            LEFT = :left
            RIGHT = :right

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::WebWebScrapeHTMLParams::Action::Wait, ContextDev::Models::WebWebScrapeHTMLParams::Action::Perform, ContextDev::Models::WebWebScrapeHTMLParams::Action::Scroll)]
      end

      # Fetch the target page through a residential proxy in this country (ISO 3166-1
      # alpha-2).
      module Country
        extend ContextDev::Internal::Type::Enum

        AD = :ad
        AE = :ae
        AF = :af
        AG = :ag
        AI = :ai
        AL = :al
        AM = :am
        AO = :ao
        AR = :ar
        AT = :at
        AU = :au
        AW = :aw
        AZ = :az
        BA = :ba
        BB = :bb
        BD = :bd
        BE = :be
        BF = :bf
        BG = :bg
        BH = :bh
        BI = :bi
        BJ = :bj
        BM = :bm
        BN = :bn
        BO = :bo
        BQ = :bq
        BR = :br
        BS = :bs
        BW = :bw
        BY = :by
        BZ = :bz
        CA = :ca
        CD = :cd
        CF = :cf
        CG = :cg
        CH = :ch
        CI = :ci
        CL = :cl
        CM = :cm
        CN = :cn
        CO = :co
        CR = :cr
        CV = :cv
        CW = :cw
        CY = :cy
        CZ = :cz
        DE = :de
        DJ = :dj
        DK = :dk
        DM = :dm
        DO = :do
        DZ = :dz
        EC = :ec
        EE = :ee
        EG = :eg
        ES = :es
        ET = :et
        FI = :fi
        FJ = :fj
        FR = :fr
        GA = :ga
        GB = :gb
        GD = :gd
        GE = :ge
        GF = :gf
        GG = :gg
        GH = :gh
        GM = :gm
        GN = :gn
        GP = :gp
        GQ = :gq
        GR = :gr
        GT = :gt
        GU = :gu
        GW = :gw
        GY = :gy
        HK = :hk
        HN = :hn
        HR = :hr
        HT = :ht
        HU = :hu
        ID = :id
        IE = :ie
        IL = :il
        IM = :im
        IN = :in
        IQ = :iq
        IR = :ir
        IS = :is
        IT = :it
        JE = :je
        JM = :jm
        JO = :jo
        JP = :jp
        KE = :ke
        KG = :kg
        KH = :kh
        KN = :kn
        KR = :kr
        KW = :kw
        KY = :ky
        KZ = :kz
        LA = :la
        LB = :lb
        LC = :lc
        LK = :lk
        LR = :lr
        LS = :ls
        LT = :lt
        LU = :lu
        LV = :lv
        LY = :ly
        MA = :ma
        MC = :mc
        MD = :md
        ME = :me
        MF = :mf
        MG = :mg
        MK = :mk
        ML = :ml
        MM = :mm
        MN = :mn
        MO = :mo
        MQ = :mq
        MR = :mr
        MT = :mt
        MU = :mu
        MV = :mv
        MW = :mw
        MX = :mx
        MY = :my
        MZ = :mz
        NA = :na
        NC = :nc
        NE = :ne
        NG = :ng
        NI = :ni
        NL = :nl
        NO = :no
        NP = :np
        NZ = :nz
        OM = :om
        PA = :pa
        PE = :pe
        PF = :pf
        PG = :pg
        PH = :ph
        PK = :pk
        PL = :pl
        PR = :pr
        PS = :ps
        PT = :pt
        PY = :py
        QA = :qa
        RE = :re
        RO = :ro
        RS = :rs
        RU = :ru
        RW = :rw
        SA = :sa
        SC = :sc
        SD = :sd
        SE = :se
        SG = :sg
        SI = :si
        SK = :sk
        SL = :sl
        SM = :sm
        SN = :sn
        SO = :so
        SR = :sr
        SS = :ss
        ST = :st
        SV = :sv
        SX = :sx
        SY = :sy
        SZ = :sz
        TC = :tc
        TD = :td
        TG = :tg
        TH = :th
        TJ = :tj
        TL = :tl
        TM = :tm
        TN = :tn
        TR = :tr
        TT = :tt
        TW = :tw
        TZ = :tz
        UA = :ua
        UG = :ug
        US = :us
        UY = :uy
        UZ = :uz
        VC = :vc
        VE = :ve
        VG = :vg
        VI = :vi
        VN = :vn
        YE = :ye
        YT = :yt
        ZA = :za
        ZM = :zm
        ZW = :zw

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      module ExtractRule
        extend ContextDev::Internal::Type::Union

        variant String

        variant -> { ContextDev::WebWebScrapeHTMLParams::ExtractRule::UnionMember1 }

        class UnionMember1 < ContextDev::Internal::Type::BaseModel
          # @!attribute selector
          #
          #   @return [String]
          required :selector, String

          # @!attribute output
          #
          #   @return [Symbol, String, Hash{Symbol=>String, ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule::UnionMember1}, ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output, nil]
          optional :output, union: -> { ContextDev::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output }

          # @!attribute type
          #
          #   @return [Symbol, ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Type, nil]
          optional :type, enum: -> { ContextDev::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Type }

          # @!method initialize(selector:, output: nil, type: nil)
          #   @param selector [String]
          #   @param output [Symbol, String, Hash{Symbol=>String, ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule::UnionMember1}, ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output]
          #   @param type [Symbol, ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Type]

          # @see ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1#output
          module Output
            extend ContextDev::Internal::Type::Union

            variant const: -> { ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::TEXT }

            variant const: -> { ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTML }

            variant String

            variant -> { ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRuleMap }

            module HTMLExtractionRule
              extend ContextDev::Internal::Type::Union

              variant String

              variant -> { ContextDev::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule::UnionMember1 }

              class UnionMember1 < ContextDev::Internal::Type::BaseModel
                # @!attribute selector
                #
                #   @return [String]
                required :selector, String

                # @!attribute output
                #
                #   @return [Symbol, String, Object, ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule::UnionMember1::Output, nil]
                optional :output,
                         union: -> { ContextDev::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule::UnionMember1::Output }

                # @!attribute type
                #
                #   @return [Symbol, ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule::UnionMember1::Type, nil]
                optional :type,
                         enum: -> { ContextDev::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule::UnionMember1::Type }

                # @!method initialize(selector:, output: nil, type: nil)
                #   @param selector [String]
                #   @param output [Symbol, String, Object, ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule::UnionMember1::Output]
                #   @param type [Symbol, ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule::UnionMember1::Type]

                # @see ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule::UnionMember1#output
                module Output
                  extend ContextDev::Internal::Type::Union

                  variant const: -> { ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule::UnionMember1::Output::TEXT }

                  variant const: -> { ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule::UnionMember1::Output::HTML }

                  variant String

                  variant ContextDev::Internal::Type::Unknown

                  # @!method self.variants
                  #   @return [Array(Symbol, String, Object)]

                  define_sorbet_constant!(:Variants) do
                    T.type_alias do
                      T.any(
                        ContextDev::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule::UnionMember1::Output::TaggedSymbol,
                        String,
                        T.anything
                      )
                    end
                  end

                  # @!group

                  TEXT = :text
                  HTML = :html

                  # @!endgroup
                end

                # @see ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule::UnionMember1#type
                module Type
                  extend ContextDev::Internal::Type::Enum

                  ITEM = :item
                  LIST = :list

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # @!method self.variants
              #   @return [Array(String, ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule::UnionMember1)]
            end

            # @!method self.variants
            #   @return [Array(Symbol, String, Hash{Symbol=>String, ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule::UnionMember1})]

            define_sorbet_constant!(:Variants) do
              T.type_alias do
                T.any(
                  ContextDev::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::TaggedSymbol,
                  String,
                  T::Hash[Symbol, ContextDev::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule::Variants]
                )
              end
            end

            # @!group

            TEXT = :text
            HTML = :html

            # @!endgroup

            # @type [ContextDev::Internal::Type::Converter]
            HTMLExtractionRuleMap =
              ContextDev::Internal::Type::HashOf[union: -> {
                ContextDev::WebWebScrapeHTMLParams::ExtractRule::UnionMember1::Output::HTMLExtractionRule
              }]
          end

          # @see ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1#type
          module Type
            extend ContextDev::Internal::Type::Enum

            ITEM = :item
            LIST = :list

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(String, ContextDev::Models::WebWebScrapeHTMLParams::ExtractRule::UnionMember1)]
      end

      class Pdf < ContextDev::Internal::Type::BaseModel
        # @!attribute end_
        #   Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
        #   Must be greater than or equal to start when both are provided.
        #
        #   @return [Integer, nil]
        optional :end_, Integer, api_name: :end

        # @!attribute ocr
        #   When true, OCR the selected PDF pages that have no usable text layer (scans),
        #   replacing each recovered page's text with the OCR result while pages with a real
        #   text layer keep it. Billed at 1 credit per page OCR actually recovered, on top
        #   of the base request cost. When false, no OCR runs.
        #
        #   @return [Boolean, nil]
        optional :ocr, ContextDev::Internal::Type::Boolean

        # @!attribute should_parse
        #   When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
        #   a 400 PDF_SKIPPED is returned.
        #
        #   @return [Boolean, nil]
        optional :should_parse, ContextDev::Internal::Type::Boolean, api_name: :shouldParse

        # @!attribute start
        #   First 1-based PDF page to parse. When omitted, parsing starts at the first page.
        #
        #   @return [Integer, nil]
        optional :start, Integer

        # @!method initialize(end_: nil, ocr: nil, should_parse: nil, start: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebScrapeHTMLParams::Pdf} for more details.
        #
        #   PDF parsing controls. Use start/end to limit text extraction and embedded-image
        #   detection/OCR to an inclusive 1-based page range.
        #
        #   @param end_ [Integer] Last 1-based PDF page to parse. When omitted, parsing ends at the last page. Mus
        #
        #   @param ocr [Boolean] When true, OCR the selected PDF pages that have no usable text layer (scans), re
        #
        #   @param should_parse [Boolean] When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
        #
        #   @param start [Integer] First 1-based PDF page to parse. When omitted, parsing starts at the first page.
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
        #   not cached as complete results. "return-partial" requires milliseconds of at
        #   least 5000.
        #
        #   @return [Symbol, ContextDev::Models::WebWebScrapeHTMLParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::WebWebScrapeHTMLParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebScrapeHTMLParams::TimeoutOpts} for more details.
        #
        #   Optional request deadline and behavior on timeout. For GET requests, use
        #   timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        #   timeoutOpts object.
        #
        #   @param milliseconds [Integer] Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        #
        #   @param behavior [Symbol, ContextDev::Models::WebWebScrapeHTMLParams::TimeoutOpts::Behavior] What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results. "return-partial" requires milliseconds of at
        # least 5000.
        #
        # @see ContextDev::Models::WebWebScrapeHTMLParams::TimeoutOpts#behavior
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
