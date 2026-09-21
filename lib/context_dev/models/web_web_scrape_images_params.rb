# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#web_scrape_images
    class WebWebScrapeImagesParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute url
      #   Page URL to inspect. Must include http:// or https://.
      #
      #   @return [String]
      required :url, String

      # @!attribute actions
      #   Optional browser actions executed in array order after the page loads and before
      #   content is captured. Requires a paid plan. Send a JSON array in the query
      #   parameter. Maximum: 5 actions.
      #
      #   @return [Array<ContextDev::Models::WebWebScrapeImagesParams::Action::Wait, ContextDev::Models::WebWebScrapeImagesParams::Action::Perform, ContextDev::Models::WebWebScrapeImagesParams::Action::Scroll>, nil]
      optional :actions,
               -> {
                 ContextDev::Internal::Type::ArrayOf[union: ContextDev::WebWebScrapeImagesParams::Action]
               },
               nil?: true

      # @!attribute country
      #   Fetch the target page through a residential proxy in this country (ISO 3166-1
      #   alpha-2).
      #
      #   @return [Symbol, ContextDev::Models::WebWebScrapeImagesParams::Country, nil]
      optional :country, enum: -> { ContextDev::WebWebScrapeImagesParams::Country }

      # @!attribute dedupe
      #   When true, visually duplicate images are removed: every image is loaded and
      #   perceptually hashed, and only the highest-resolution copy of each duplicate
      #   group is kept. Images that cannot be downloaded or hashed are kept. Default:
      #   false.
      #
      #   @return [Boolean, nil]
      optional :dedupe, ContextDev::Internal::Type::Boolean

      # @!attribute enrichment
      #   Optional per-image processing, sent as deep-object query params such as
      #   enrichment[resolution]=true.
      #
      #   @return [ContextDev::Models::WebWebScrapeImagesParams::Enrichment, nil]
      optional :enrichment, -> { ContextDev::WebWebScrapeImagesParams::Enrichment }, nil?: true

      # @!attribute headers
      #   Optional outbound HTTP headers forwarded only to the target URL, sent as
      #   deep-object query params such as headers[X-Custom]=value. When provided, caching
      #   is bypassed: the result is neither read from nor written to cache.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, ContextDev::Internal::Type::HashOf[String]

      # @!attribute max_age_ms
      #   Reuse a cached result this many milliseconds old or newer. Default: 86400000 (1
      #   day). Set to 0 to bypass cache. Maximum: 2592000000 (30 days).
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer, nil?: true

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
      #   @return [ContextDev::Models::WebWebScrapeImagesParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::WebWebScrapeImagesParams::TimeoutOpts }

      # @!attribute wait_for_ms
      #   Optional browser wait time in milliseconds after initial page load before
      #   collecting images. Min: 0. Max: 30000 (30 seconds). When combined with
      #   timeoutOpts, timeoutOpts.milliseconds must be at least waitForMs + 10000 ms; a
      #   shorter deadline is rejected with 400 TIMEOUT_TOO_SHORT_FOR_WAIT.
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
      #   @return [Symbol, ContextDev::Models::WebWebScrapeImagesParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebWebScrapeImagesParams::Zdr }

      # @!method initialize(url:, actions: nil, country: nil, dedupe: nil, enrichment: nil, headers: nil, max_age_ms: nil, tags: nil, timeout_opts: nil, wait_for_ms: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebScrapeImagesParams} for more details.
      #
      #   @param url [String] Page URL to inspect. Must include http:// or https://.
      #
      #   @param actions [Array<ContextDev::Models::WebWebScrapeImagesParams::Action::Wait, ContextDev::Models::WebWebScrapeImagesParams::Action::Perform, ContextDev::Models::WebWebScrapeImagesParams::Action::Scroll>, nil] Optional browser actions executed in array order after the page loads and before
      #
      #   @param country [Symbol, ContextDev::Models::WebWebScrapeImagesParams::Country] Fetch the target page through a residential proxy in this country (ISO 3166-1 al
      #
      #   @param dedupe [Boolean] When true, visually duplicate images are removed: every image is loaded and perc
      #
      #   @param enrichment [ContextDev::Models::WebWebScrapeImagesParams::Enrichment, nil] Optional per-image processing, sent as deep-object query params such as enrichme
      #
      #   @param headers [Hash{Symbol=>String}] Optional outbound HTTP headers forwarded only to the target URL, sent as deep-ob
      #
      #   @param max_age_ms [Integer, nil] Reuse a cached result this many milliseconds old or newer. Default: 86400000 (1
      #
      #   @param tags [Array<String>] Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50 charac
      #
      #   @param timeout_opts [ContextDev::Models::WebWebScrapeImagesParams::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout
      #
      #   @param wait_for_ms [Integer, nil] Optional browser wait time in milliseconds after initial page load before collec
      #
      #   @param zdr [Symbol, ContextDev::Models::WebWebScrapeImagesParams::Zdr] Set to enabled to bypass shared caches and omit request and response content fro
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Browser action discriminated by `do`. Each variant exposes only its applicable
      # fields.
      module Action
        extend ContextDev::Internal::Type::Union

        discriminator :do

        # Pause for a fixed number of milliseconds before continuing to the next action.
        variant :wait, -> { ContextDev::WebWebScrapeImagesParams::Action::Wait }

        # Resolve and perform one natural-language browser action.
        variant :perform, -> { ContextDev::WebWebScrapeImagesParams::Action::Perform }

        # Scroll the page or a selected scrollable container, waiting adaptively for content and dimensions to settle after each iteration.
        variant :scroll, -> { ContextDev::WebWebScrapeImagesParams::Action::Scroll }

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
          #   @return [Integer, Symbol, ContextDev::Models::WebWebScrapeImagesParams::Action::Scroll::Amount, nil]
          optional :amount, union: -> { ContextDev::WebWebScrapeImagesParams::Action::Scroll::Amount }

          # @!attribute container
          #   CSS selector for the first matching scroll container. Defaults to the page.
          #
          #   @return [String, nil]
          optional :container, String

          # @!attribute direction
          #   Direction to scroll. Defaults to down.
          #
          #   @return [Symbol, ContextDev::Models::WebWebScrapeImagesParams::Action::Scroll::Direction, nil]
          optional :direction, enum: -> { ContextDev::WebWebScrapeImagesParams::Action::Scroll::Direction }

          # @!attribute max_scrolls
          #   Maximum scroll iterations. Stops early when scrolling and scrollable extent stop
          #   changing. Defaults to 1.
          #
          #   @return [Integer, nil]
          optional :max_scrolls, Integer, api_name: :maxScrolls

          # @!method initialize(amount: nil, container: nil, direction: nil, max_scrolls: nil, do_: :scroll)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::WebWebScrapeImagesParams::Action::Scroll} for more details.
          #
          #   Scroll the page or a selected scrollable container, waiting adaptively for
          #   content and dimensions to settle after each iteration.
          #
          #   @param amount [Integer, Symbol, ContextDev::Models::WebWebScrapeImagesParams::Action::Scroll::Amount] Pixels per scroll, one visible viewport, or the current scroll boundary. Default
          #
          #   @param container [String] CSS selector for the first matching scroll container. Defaults to the page.
          #
          #   @param direction [Symbol, ContextDev::Models::WebWebScrapeImagesParams::Action::Scroll::Direction] Direction to scroll. Defaults to down.
          #
          #   @param max_scrolls [Integer] Maximum scroll iterations. Stops early when scrolling and scrollable extent stop
          #
          #   @param do_ [Symbol, :scroll]

          # Pixels per scroll, one visible viewport, or the current scroll boundary.
          # Defaults to viewport.
          #
          # @see ContextDev::Models::WebWebScrapeImagesParams::Action::Scroll#amount
          module Amount
            extend ContextDev::Internal::Type::Union

            variant Integer

            variant const: -> { ContextDev::Models::WebWebScrapeImagesParams::Action::Scroll::Amount::VIEWPORT }

            variant const: -> { ContextDev::Models::WebWebScrapeImagesParams::Action::Scroll::Amount::MAX }

            # @!method self.variants
            #   @return [Array(Integer, Symbol)]

            define_sorbet_constant!(:Variants) do
              T.type_alias { T.any(Integer, ContextDev::WebWebScrapeImagesParams::Action::Scroll::Amount::TaggedSymbol) }
            end

            # @!group

            VIEWPORT = :viewport
            MAX = :max

            # @!endgroup
          end

          # Direction to scroll. Defaults to down.
          #
          # @see ContextDev::Models::WebWebScrapeImagesParams::Action::Scroll#direction
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
        #   @return [Array(ContextDev::Models::WebWebScrapeImagesParams::Action::Wait, ContextDev::Models::WebWebScrapeImagesParams::Action::Perform, ContextDev::Models::WebWebScrapeImagesParams::Action::Scroll)]
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

      class Enrichment < ContextDev::Internal::Type::BaseModel
        # @!attribute classification
        #   Classify each image by visual asset type.
        #
        #   @return [Boolean, nil]
        optional :classification, ContextDev::Internal::Type::Boolean

        # @!attribute hosted_url
        #   Host materializable images on the Brand.dev CDN and return their URL and MIME
        #   type. Ignored when zero data retention is enabled.
        #
        #   @return [Boolean, nil]
        optional :hosted_url, ContextDev::Internal::Type::Boolean, api_name: :hostedUrl

        # @!attribute max_time_per_ms
        #   Per-image enrichment timeout in milliseconds. Default: 30000. Maximum: 60000.
        #
        #   @return [Integer, nil]
        optional :max_time_per_ms, Integer, api_name: :maxTimePerMs

        # @!attribute resolution
        #   Measure image width and height when possible.
        #
        #   @return [Boolean, nil]
        optional :resolution, ContextDev::Internal::Type::Boolean

        # @!method initialize(classification: nil, hosted_url: nil, max_time_per_ms: nil, resolution: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebScrapeImagesParams::Enrichment} for more details.
        #
        #   Optional per-image processing, sent as deep-object query params such as
        #   enrichment[resolution]=true.
        #
        #   @param classification [Boolean] Classify each image by visual asset type.
        #
        #   @param hosted_url [Boolean] Host materializable images on the Brand.dev CDN and return their URL and MIME ty
        #
        #   @param max_time_per_ms [Integer] Per-image enrichment timeout in milliseconds. Default: 30000. Maximum: 60000.
        #
        #   @param resolution [Boolean] Measure image width and height when possible.
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
        #   @return [Symbol, ContextDev::Models::WebWebScrapeImagesParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::WebWebScrapeImagesParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebScrapeImagesParams::TimeoutOpts} for more details.
        #
        #   Optional request deadline and behavior on timeout. For GET requests, use
        #   timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        #   timeoutOpts object.
        #
        #   @param milliseconds [Integer] Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        #
        #   @param behavior [Symbol, ContextDev::Models::WebWebScrapeImagesParams::TimeoutOpts::Behavior] What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results. "return-partial" requires milliseconds of at
        # least 5000.
        #
        # @see ContextDev::Models::WebWebScrapeImagesParams::TimeoutOpts#behavior
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
