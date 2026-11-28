# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#screenshot
    class WebScreenshotParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute clear_popups
      #   Dismiss cookie banners and close other popups and overlays before capture.
      #
      #   @return [Boolean, nil]
      optional :clear_popups, ContextDev::Internal::Type::Boolean

      # @!attribute color_scheme
      #   Emulate a light or dark color scheme.
      #
      #   @return [Symbol, ContextDev::Models::WebScreenshotParams::ColorScheme, nil]
      optional :color_scheme, enum: -> { ContextDev::WebScreenshotParams::ColorScheme }

      # @!attribute country
      #   Country to fetch from, as an ISO 3166-1 alpha-2 code.
      #
      #   @return [Symbol, ContextDev::Models::WebScreenshotParams::Country, nil]
      optional :country, enum: -> { ContextDev::WebScreenshotParams::Country }

      # @!attribute direct_url
      #   Exact URL to capture, such as `https://example.com/pricing`. Provide either
      #   `domain` or `directUrl`, not both.
      #
      #   @return [String, nil]
      optional :direct_url, String

      # @!attribute domain
      #   Domain to capture, such as `stripe.com`. Provide either `domain` or `directUrl`,
      #   not both.
      #
      #   @return [String, nil]
      optional :domain, String

      # @!attribute full_screenshot
      #   Capture the full scrollable page instead of only the viewport.
      #
      #   @return [Symbol, ContextDev::Models::WebScreenshotParams::FullScreenshot, nil]
      optional :full_screenshot, enum: -> { ContextDev::WebScreenshotParams::FullScreenshot }

      # @!attribute handle_cookie_popup
      #   Dismiss cookie consent banners before capture.
      #
      #   @return [Boolean, nil]
      optional :handle_cookie_popup, ContextDev::Internal::Type::Boolean

      # @!attribute headers
      #   HTTP headers to send to the target origin, such as
      #   `headers[Authorization]=Bearer token`. Requests with headers skip the cache and
      #   return the image as a data URL.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, ContextDev::Internal::Type::HashOf[String]

      # @!attribute max_age_ms
      #   Maximum age of a cached result, in milliseconds. `0` always fetches fresh.
      #   Defaults to 1 day (86400000 ms). Maximum: 30 days (2592000000 ms).
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer, nil?: true

      # @!attribute page
      #   Capture this type of page instead of the home page. Context.dev finds it among
      #   the domain's links, in 30 languages. Only with `domain`.
      #
      #   @return [Symbol, ContextDev::Models::WebScreenshotParams::Page, nil]
      optional :page, enum: -> { ContextDev::WebScreenshotParams::Page }

      # @!attribute scroll_offset
      #   Return the viewport-sized slice of the full page that starts this many pixels
      #   from the top. Step by the viewport height, such as `0`, `1080`, `2160`, to walk
      #   a long page. The last slice can be shorter. Overrides `fullScreenshot`.
      #
      #   @return [Integer, nil]
      optional :scroll_offset, Integer, nil?: true

      # @!attribute tags
      #   Comma-separated labels for this request, such as `production,team-alpha`. Filter
      #   usage and request logs by them.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Request deadline and what to return when it passes.
      #
      #   @return [ContextDev::Models::WebScreenshotParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::WebScreenshotParams::TimeoutOpts }

      # @!attribute viewport
      #   Browser viewport size in pixels.
      #
      #   @return [ContextDev::Models::WebScreenshotParams::Viewport, nil]
      optional :viewport, -> { ContextDev::WebScreenshotParams::Viewport }

      # @!attribute wait_for_ms
      #   Time to wait after the page loads before capturing, in milliseconds. `0` waits
      #   500 ms. `timeoutOpts.milliseconds` must be at least `waitForMs` plus 10000 ms,
      #   or the request fails with `TIMEOUT_TOO_SHORT_FOR_WAIT`.
      #
      #   @return [Integer, nil]
      optional :wait_for_ms, Integer, nil?: true

      # @!attribute zdr
      #   `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      #   your organization has ZDR.
      #
      #   @return [Symbol, ContextDev::Models::WebScreenshotParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebScreenshotParams::Zdr }

      # @!method initialize(clear_popups: nil, color_scheme: nil, country: nil, direct_url: nil, domain: nil, full_screenshot: nil, handle_cookie_popup: nil, headers: nil, max_age_ms: nil, page: nil, scroll_offset: nil, tags: nil, timeout_opts: nil, viewport: nil, wait_for_ms: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebScreenshotParams} for more details.
      #
      #   @param clear_popups [Boolean] Dismiss cookie banners and close other popups and overlays before capture.
      #
      #   @param color_scheme [Symbol, ContextDev::Models::WebScreenshotParams::ColorScheme] Emulate a light or dark color scheme.
      #
      #   @param country [Symbol, ContextDev::Models::WebScreenshotParams::Country] Country to fetch from, as an ISO 3166-1 alpha-2 code.
      #
      #   @param direct_url [String] Exact URL to capture, such as `https://example.com/pricing`. Provide either `dom
      #
      #   @param domain [String] Domain to capture, such as `stripe.com`. Provide either `domain` or `directUrl`,
      #
      #   @param full_screenshot [Symbol, ContextDev::Models::WebScreenshotParams::FullScreenshot] Capture the full scrollable page instead of only the viewport.
      #
      #   @param handle_cookie_popup [Boolean] Dismiss cookie consent banners before capture.
      #
      #   @param headers [Hash{Symbol=>String}] HTTP headers to send to the target origin, such as `headers[Authorization]=Beare
      #
      #   @param max_age_ms [Integer, nil] Maximum age of a cached result, in milliseconds. `0` always fetches fresh. Defau
      #
      #   @param page [Symbol, ContextDev::Models::WebScreenshotParams::Page] Capture this type of page instead of the home page. Context.dev finds it among t
      #
      #   @param scroll_offset [Integer, nil] Return the viewport-sized slice of the full page that starts this many pixels fr
      #
      #   @param tags [Array<String>] Comma-separated labels for this request, such as `production,team-alpha`. Filter
      #
      #   @param timeout_opts [ContextDev::Models::WebScreenshotParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      #   @param viewport [ContextDev::Models::WebScreenshotParams::Viewport] Browser viewport size in pixels.
      #
      #   @param wait_for_ms [Integer, nil] Time to wait after the page loads before capturing, in milliseconds. `0` waits 5
      #
      #   @param zdr [Symbol, ContextDev::Models::WebScreenshotParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Emulate a light or dark color scheme.
      module ColorScheme
        extend ContextDev::Internal::Type::Enum

        LIGHT = :light
        DARK = :dark

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Country to fetch from, as an ISO 3166-1 alpha-2 code.
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

      # Capture the full scrollable page instead of only the viewport.
      module FullScreenshot
        extend ContextDev::Internal::Type::Enum

        TRUE = :true
        FALSE = :false

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Capture this type of page instead of the home page. Context.dev finds it among
      # the domain's links, in 30 languages. Only with `domain`.
      module Page
        extend ContextDev::Internal::Type::Enum

        LOGIN = :login
        SIGNUP = :signup
        BLOG = :blog
        CAREERS = :careers
        PRICING = :pricing
        TERMS = :terms
        PRIVACY = :privacy
        CONTACT = :contact

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
        #   collected so far and marks the response as partial. `return-partial` requires at
        #   least 5000 ms. On `POST /web/scrape`, an output that is not ready in time fails
        #   with `REQUEST_TIMEOUT` inside a 200 response under either behavior; 408 means
        #   the whole request could not respond by the deadline.
        #
        #   @return [Symbol, ContextDev::Models::WebScreenshotParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::WebScreenshotParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebScreenshotParams::TimeoutOpts} for more details.
        #
        #   Request deadline and what to return when it passes.
        #
        #   @param milliseconds [Integer] Deadline in milliseconds.
        #
        #   @param behavior [Symbol, ContextDev::Models::WebScreenshotParams::TimeoutOpts::Behavior] `fail` returns 408 at the deadline. `return-partial` returns the results collect

        # `fail` returns 408 at the deadline. `return-partial` returns the results
        # collected so far and marks the response as partial. `return-partial` requires at
        # least 5000 ms. On `POST /web/scrape`, an output that is not ready in time fails
        # with `REQUEST_TIMEOUT` inside a 200 response under either behavior; 408 means
        # the whole request could not respond by the deadline.
        #
        # @see ContextDev::Models::WebScreenshotParams::TimeoutOpts#behavior
        module Behavior
          extend ContextDev::Internal::Type::Enum

          FAIL = :fail
          RETURN_PARTIAL = :"return-partial"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Viewport < ContextDev::Internal::Type::BaseModel
        # @!attribute height
        #   Viewport height in pixels.
        #
        #   @return [Integer, nil]
        optional :height, Integer

        # @!attribute width
        #   Viewport width in pixels.
        #
        #   @return [Integer, nil]
        optional :width, Integer

        # @!method initialize(height: nil, width: nil)
        #   Browser viewport size in pixels.
        #
        #   @param height [Integer] Viewport height in pixels.
        #
        #   @param width [Integer] Viewport width in pixels.
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
