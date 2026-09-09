# typed: strong

module ContextDev
  module Models
    class WebScreenshotParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::WebScreenshotParams, ContextDev::Internal::AnyHash)
        end

      # Optional parameter for comprehensive popup cleanup. If 'true', the browser
      # dismisses detected cookie/consent UI and clears other detected obstructive
      # popups and overlays before capture. If 'false' or not provided, this parameter
      # requests no cleanup; handleCookiePopup can still request cookie/consent handling
      # independently.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :clear_popups

      sig { params(clear_popups: T::Boolean).void }
      attr_writer :clear_popups

      # Optional parameter to choose the site's visual theme in the screenshot. Use
      # 'light' or 'dark' when the site offers both appearances.
      sig do
        returns(
          T.nilable(ContextDev::WebScreenshotParams::ColorScheme::OrSymbol)
        )
      end
      attr_reader :color_scheme

      sig do
        params(
          color_scheme: ContextDev::WebScreenshotParams::ColorScheme::OrSymbol
        ).void
      end
      attr_writer :color_scheme

      # Fetch the target page through a residential proxy in this country (ISO 3166-1
      # alpha-2).
      sig do
        returns(T.nilable(ContextDev::WebScreenshotParams::Country::OrSymbol))
      end
      attr_reader :country

      sig do
        params(country: ContextDev::WebScreenshotParams::Country::OrSymbol).void
      end
      attr_writer :country

      # A specific URL to screenshot directly, bypassing domain resolution (e.g.,
      # 'https://example.com/pricing'). When provided, the screenshot is taken of this
      # exact URL. You must provide either 'domain' or 'directUrl', but not both.
      sig { returns(T.nilable(String)) }
      attr_reader :direct_url

      sig { params(direct_url: String).void }
      attr_writer :direct_url

      # Domain name to take screenshot of (e.g., 'example.com', 'google.com'). The
      # domain will be automatically normalized and validated. You must provide either
      # 'domain' or 'directUrl', but not both.
      sig { returns(T.nilable(String)) }
      attr_reader :domain

      sig { params(domain: String).void }
      attr_writer :domain

      # Optional parameter to determine screenshot type. If 'true', takes a full page
      # screenshot capturing all content. If 'false' or not provided, takes a viewport
      # screenshot (standard browser view).
      sig do
        returns(
          T.nilable(ContextDev::WebScreenshotParams::FullScreenshot::OrSymbol)
        )
      end
      attr_reader :full_screenshot

      sig do
        params(
          full_screenshot:
            ContextDev::WebScreenshotParams::FullScreenshot::OrSymbol
        ).void
      end
      attr_writer :full_screenshot

      # Optional parameter to control cookie/consent popup handling. If 'true', we
      # dismiss cookie banner before capture. If 'false' or not provided, captures the
      # page without that step.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :handle_cookie_popup

      sig { params(handle_cookie_popup: T::Boolean).void }
      attr_writer :handle_cookie_popup

      # Return a cached screenshot if a prior screenshot for the same parameters exists
      # and is younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
      # omitted. Max is 30 days (2592000000 ms). Set to 0 to always capture fresh.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_age_ms

      # Optional parameter to specify which page type to screenshot. If provided, the
      # system will scrape the domain's links and use heuristics to find the most
      # appropriate URL for the specified page type (30 supported languages). If not
      # provided, screenshots the main domain landing page. Only applicable when using
      # 'domain', not 'directUrl'.
      sig do
        returns(T.nilable(ContextDev::WebScreenshotParams::Page::OrSymbol))
      end
      attr_reader :page

      sig { params(page: ContextDev::WebScreenshotParams::Page::OrSymbol).void }
      attr_writer :page

      # Optional vertical scroll offset in pixels for capturing a long page in
      # viewport-sized chunks. When provided, the full page is captured once and the
      # returned image is the viewport-sized slice that begins at this Y offset (e.g.
      # request scrollOffset=0, then 1080, then 2160 to walk a 1920x1080 landing page
      # top to bottom). The final slice may be shorter than the viewport height. Takes
      # precedence over fullScreenshot. Max: 100000.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :scroll_offset

      # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
      # characters.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Optional timeout in milliseconds for the request. If the request takes longer
      # than this value, it will be aborted with a 408 status code. Maximum allowed
      # value is 300000ms (5 minutes).
      sig { returns(T.nilable(Integer)) }
      attr_reader :timeout_ms

      sig { params(timeout_ms: Integer).void }
      attr_writer :timeout_ms

      # Optional browser viewport dimensions for the screenshot. Defaults to 1920x1080.
      sig { returns(T.nilable(ContextDev::WebScreenshotParams::Viewport)) }
      attr_reader :viewport

      sig do
        params(viewport: ContextDev::WebScreenshotParams::Viewport::OrHash).void
      end
      attr_writer :viewport

      # Optional browser wait time in milliseconds after initial page load before taking
      # the screenshot. Min: 0. Max: 30000 (30 seconds). Defaults to 3000 ms when
      # omitted. When combined with timeoutMS, timeoutMS must be at least waitForMs +
      # 10000 ms; a shorter deadline is rejected with 400 TIMEOUT_TOO_SHORT_FOR_WAIT.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :wait_for_ms

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Requires zero data retention to be enabled for your
      # organization (contact support@context.dev), otherwise the request fails with
      # ZDR_NOT_ENABLED. Successful ZDR responses include X-Context-ZDR: true.
      sig { returns(T.nilable(ContextDev::WebScreenshotParams::Zdr::OrSymbol)) }
      attr_reader :zdr

      sig { params(zdr: ContextDev::WebScreenshotParams::Zdr::OrSymbol).void }
      attr_writer :zdr

      sig do
        params(
          clear_popups: T::Boolean,
          color_scheme: ContextDev::WebScreenshotParams::ColorScheme::OrSymbol,
          country: ContextDev::WebScreenshotParams::Country::OrSymbol,
          direct_url: String,
          domain: String,
          full_screenshot:
            ContextDev::WebScreenshotParams::FullScreenshot::OrSymbol,
          handle_cookie_popup: T::Boolean,
          max_age_ms: T.nilable(Integer),
          page: ContextDev::WebScreenshotParams::Page::OrSymbol,
          scroll_offset: T.nilable(Integer),
          tags: T::Array[String],
          timeout_ms: Integer,
          viewport: ContextDev::WebScreenshotParams::Viewport::OrHash,
          wait_for_ms: T.nilable(Integer),
          zdr: ContextDev::WebScreenshotParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Optional parameter for comprehensive popup cleanup. If 'true', the browser
        # dismisses detected cookie/consent UI and clears other detected obstructive
        # popups and overlays before capture. If 'false' or not provided, this parameter
        # requests no cleanup; handleCookiePopup can still request cookie/consent handling
        # independently.
        clear_popups: nil,
        # Optional parameter to choose the site's visual theme in the screenshot. Use
        # 'light' or 'dark' when the site offers both appearances.
        color_scheme: nil,
        # Fetch the target page through a residential proxy in this country (ISO 3166-1
        # alpha-2).
        country: nil,
        # A specific URL to screenshot directly, bypassing domain resolution (e.g.,
        # 'https://example.com/pricing'). When provided, the screenshot is taken of this
        # exact URL. You must provide either 'domain' or 'directUrl', but not both.
        direct_url: nil,
        # Domain name to take screenshot of (e.g., 'example.com', 'google.com'). The
        # domain will be automatically normalized and validated. You must provide either
        # 'domain' or 'directUrl', but not both.
        domain: nil,
        # Optional parameter to determine screenshot type. If 'true', takes a full page
        # screenshot capturing all content. If 'false' or not provided, takes a viewport
        # screenshot (standard browser view).
        full_screenshot: nil,
        # Optional parameter to control cookie/consent popup handling. If 'true', we
        # dismiss cookie banner before capture. If 'false' or not provided, captures the
        # page without that step.
        handle_cookie_popup: nil,
        # Return a cached screenshot if a prior screenshot for the same parameters exists
        # and is younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
        # omitted. Max is 30 days (2592000000 ms). Set to 0 to always capture fresh.
        max_age_ms: nil,
        # Optional parameter to specify which page type to screenshot. If provided, the
        # system will scrape the domain's links and use heuristics to find the most
        # appropriate URL for the specified page type (30 supported languages). If not
        # provided, screenshots the main domain landing page. Only applicable when using
        # 'domain', not 'directUrl'.
        page: nil,
        # Optional vertical scroll offset in pixels for capturing a long page in
        # viewport-sized chunks. When provided, the full page is captured once and the
        # returned image is the viewport-sized slice that begins at this Y offset (e.g.
        # request scrollOffset=0, then 1080, then 2160 to walk a 1920x1080 landing page
        # top to bottom). The final slice may be shorter than the viewport height. Takes
        # precedence over fullScreenshot. Max: 100000.
        scroll_offset: nil,
        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        tags: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        # Optional browser viewport dimensions for the screenshot. Defaults to 1920x1080.
        viewport: nil,
        # Optional browser wait time in milliseconds after initial page load before taking
        # the screenshot. Min: 0. Max: 30000 (30 seconds). Defaults to 3000 ms when
        # omitted. When combined with timeoutMS, timeoutMS must be at least waitForMs +
        # 10000 ms; a shorter deadline is rejected with 400 TIMEOUT_TOO_SHORT_FOR_WAIT.
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
            clear_popups: T::Boolean,
            color_scheme:
              ContextDev::WebScreenshotParams::ColorScheme::OrSymbol,
            country: ContextDev::WebScreenshotParams::Country::OrSymbol,
            direct_url: String,
            domain: String,
            full_screenshot:
              ContextDev::WebScreenshotParams::FullScreenshot::OrSymbol,
            handle_cookie_popup: T::Boolean,
            max_age_ms: T.nilable(Integer),
            page: ContextDev::WebScreenshotParams::Page::OrSymbol,
            scroll_offset: T.nilable(Integer),
            tags: T::Array[String],
            timeout_ms: Integer,
            viewport: ContextDev::WebScreenshotParams::Viewport,
            wait_for_ms: T.nilable(Integer),
            zdr: ContextDev::WebScreenshotParams::Zdr::OrSymbol,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Optional parameter to choose the site's visual theme in the screenshot. Use
      # 'light' or 'dark' when the site offers both appearances.
      module ColorScheme
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebScreenshotParams::ColorScheme)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LIGHT =
          T.let(
            :light,
            ContextDev::WebScreenshotParams::ColorScheme::TaggedSymbol
          )
        DARK =
          T.let(
            :dark,
            ContextDev::WebScreenshotParams::ColorScheme::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::WebScreenshotParams::ColorScheme::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Fetch the target page through a residential proxy in this country (ISO 3166-1
      # alpha-2).
      module Country
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebScreenshotParams::Country)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AD = T.let(:ad, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        AE = T.let(:ae, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        AF = T.let(:af, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        AG = T.let(:ag, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        AI = T.let(:ai, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        AL = T.let(:al, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        AM = T.let(:am, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        AO = T.let(:ao, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        AR = T.let(:ar, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        AT = T.let(:at, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        AU = T.let(:au, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        AW = T.let(:aw, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        AZ = T.let(:az, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BA = T.let(:ba, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BB = T.let(:bb, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BD = T.let(:bd, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BE = T.let(:be, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BF = T.let(:bf, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BG = T.let(:bg, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BH = T.let(:bh, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BI = T.let(:bi, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BJ = T.let(:bj, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BM = T.let(:bm, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BN = T.let(:bn, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BO = T.let(:bo, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BQ = T.let(:bq, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BR = T.let(:br, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BS = T.let(:bs, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BW = T.let(:bw, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BY = T.let(:by, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        BZ = T.let(:bz, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        CA = T.let(:ca, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        CD = T.let(:cd, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        CF = T.let(:cf, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        CG = T.let(:cg, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        CH = T.let(:ch, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        CI = T.let(:ci, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        CL = T.let(:cl, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        CM = T.let(:cm, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        CN = T.let(:cn, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        CO = T.let(:co, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        CR = T.let(:cr, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        CV = T.let(:cv, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        CW = T.let(:cw, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        CY = T.let(:cy, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        CZ = T.let(:cz, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        DE = T.let(:de, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        DJ = T.let(:dj, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        DK = T.let(:dk, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        DM = T.let(:dm, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        DO = T.let(:do, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        DZ = T.let(:dz, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        EC = T.let(:ec, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        EE = T.let(:ee, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        EG = T.let(:eg, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        ES = T.let(:es, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        ET = T.let(:et, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        FI = T.let(:fi, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        FJ = T.let(:fj, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        FR = T.let(:fr, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        GA = T.let(:ga, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        GB = T.let(:gb, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        GD = T.let(:gd, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        GE = T.let(:ge, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        GF = T.let(:gf, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        GG = T.let(:gg, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        GH = T.let(:gh, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        GM = T.let(:gm, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        GN = T.let(:gn, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        GP = T.let(:gp, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        GQ = T.let(:gq, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        GR = T.let(:gr, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        GT = T.let(:gt, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        GU = T.let(:gu, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        GW = T.let(:gw, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        GY = T.let(:gy, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        HK = T.let(:hk, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        HN = T.let(:hn, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        HR = T.let(:hr, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        HT = T.let(:ht, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        HU = T.let(:hu, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        ID = T.let(:id, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        IE = T.let(:ie, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        IL = T.let(:il, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        IM = T.let(:im, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        IN = T.let(:in, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        IQ = T.let(:iq, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        IR = T.let(:ir, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        IS = T.let(:is, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        IT = T.let(:it, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        JE = T.let(:je, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        JM = T.let(:jm, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        JO = T.let(:jo, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        JP = T.let(:jp, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        KE = T.let(:ke, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        KG = T.let(:kg, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        KH = T.let(:kh, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        KN = T.let(:kn, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        KR = T.let(:kr, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        KW = T.let(:kw, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        KY = T.let(:ky, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        KZ = T.let(:kz, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        LA = T.let(:la, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        LB = T.let(:lb, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        LC = T.let(:lc, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        LK = T.let(:lk, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        LR = T.let(:lr, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        LS = T.let(:ls, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        LT = T.let(:lt, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        LU = T.let(:lu, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        LV = T.let(:lv, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        LY = T.let(:ly, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MA = T.let(:ma, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MC = T.let(:mc, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MD = T.let(:md, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        ME = T.let(:me, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MF = T.let(:mf, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MG = T.let(:mg, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MK = T.let(:mk, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        ML = T.let(:ml, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MM = T.let(:mm, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MN = T.let(:mn, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MO = T.let(:mo, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MQ = T.let(:mq, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MR = T.let(:mr, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MT = T.let(:mt, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MU = T.let(:mu, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MV = T.let(:mv, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MW = T.let(:mw, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MX = T.let(:mx, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MY = T.let(:my, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        MZ = T.let(:mz, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        NA = T.let(:na, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        NC = T.let(:nc, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        NE = T.let(:ne, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        NG = T.let(:ng, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        NI = T.let(:ni, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        NL = T.let(:nl, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        NO = T.let(:no, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        NP = T.let(:np, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        NZ = T.let(:nz, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        OM = T.let(:om, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        PA = T.let(:pa, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        PE = T.let(:pe, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        PF = T.let(:pf, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        PG = T.let(:pg, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        PH = T.let(:ph, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        PK = T.let(:pk, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        PL = T.let(:pl, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        PR = T.let(:pr, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        PS = T.let(:ps, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        PT = T.let(:pt, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        PY = T.let(:py, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        QA = T.let(:qa, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        RE = T.let(:re, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        RO = T.let(:ro, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        RS = T.let(:rs, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        RU = T.let(:ru, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        RW = T.let(:rw, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        SA = T.let(:sa, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        SC = T.let(:sc, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        SD = T.let(:sd, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        SE = T.let(:se, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        SG = T.let(:sg, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        SI = T.let(:si, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        SK = T.let(:sk, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        SL = T.let(:sl, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        SM = T.let(:sm, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        SN = T.let(:sn, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        SO = T.let(:so, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        SR = T.let(:sr, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        SS = T.let(:ss, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        ST = T.let(:st, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        SV = T.let(:sv, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        SX = T.let(:sx, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        SY = T.let(:sy, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        SZ = T.let(:sz, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        TC = T.let(:tc, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        TD = T.let(:td, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        TG = T.let(:tg, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        TH = T.let(:th, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        TJ = T.let(:tj, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        TL = T.let(:tl, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        TM = T.let(:tm, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        TN = T.let(:tn, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        TR = T.let(:tr, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        TT = T.let(:tt, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        TW = T.let(:tw, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        TZ = T.let(:tz, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        UA = T.let(:ua, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        UG = T.let(:ug, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        US = T.let(:us, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        UY = T.let(:uy, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        UZ = T.let(:uz, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        VC = T.let(:vc, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        VE = T.let(:ve, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        VG = T.let(:vg, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        VI = T.let(:vi, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        VN = T.let(:vn, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        YE = T.let(:ye, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        YT = T.let(:yt, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        ZA = T.let(:za, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        ZM = T.let(:zm, ContextDev::WebScreenshotParams::Country::TaggedSymbol)
        ZW = T.let(:zw, ContextDev::WebScreenshotParams::Country::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::WebScreenshotParams::Country::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Optional parameter to determine screenshot type. If 'true', takes a full page
      # screenshot capturing all content. If 'false' or not provided, takes a viewport
      # screenshot (standard browser view).
      module FullScreenshot
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebScreenshotParams::FullScreenshot)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            ContextDev::WebScreenshotParams::FullScreenshot::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            ContextDev::WebScreenshotParams::FullScreenshot::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::WebScreenshotParams::FullScreenshot::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Optional parameter to specify which page type to screenshot. If provided, the
      # system will scrape the domain's links and use heuristics to find the most
      # appropriate URL for the specified page type (30 supported languages). If not
      # provided, screenshots the main domain landing page. Only applicable when using
      # 'domain', not 'directUrl'.
      module Page
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::WebScreenshotParams::Page) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOGIN =
          T.let(:login, ContextDev::WebScreenshotParams::Page::TaggedSymbol)
        SIGNUP =
          T.let(:signup, ContextDev::WebScreenshotParams::Page::TaggedSymbol)
        BLOG = T.let(:blog, ContextDev::WebScreenshotParams::Page::TaggedSymbol)
        CAREERS =
          T.let(:careers, ContextDev::WebScreenshotParams::Page::TaggedSymbol)
        PRICING =
          T.let(:pricing, ContextDev::WebScreenshotParams::Page::TaggedSymbol)
        TERMS =
          T.let(:terms, ContextDev::WebScreenshotParams::Page::TaggedSymbol)
        PRIVACY =
          T.let(:privacy, ContextDev::WebScreenshotParams::Page::TaggedSymbol)
        CONTACT =
          T.let(:contact, ContextDev::WebScreenshotParams::Page::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::WebScreenshotParams::Page::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Viewport < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebScreenshotParams::Viewport,
              ContextDev::Internal::AnyHash
            )
          end

        # Viewport height in pixels.
        sig { returns(T.nilable(Integer)) }
        attr_reader :height

        sig { params(height: Integer).void }
        attr_writer :height

        # Viewport width in pixels.
        sig { returns(T.nilable(Integer)) }
        attr_reader :width

        sig { params(width: Integer).void }
        attr_writer :width

        # Optional browser viewport dimensions for the screenshot. Defaults to 1920x1080.
        sig do
          params(height: Integer, width: Integer).returns(T.attached_class)
        end
        def self.new(
          # Viewport height in pixels.
          height: nil,
          # Viewport width in pixels.
          width: nil
        )
        end

        sig { override.returns({ height: Integer, width: Integer }) }
        def to_hash
        end
      end

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Requires zero data retention to be enabled for your
      # organization (contact support@context.dev), otherwise the request fails with
      # ZDR_NOT_ENABLED. Successful ZDR responses include X-Context-ZDR: true.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::WebScreenshotParams::Zdr) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(:enabled, ContextDev::WebScreenshotParams::Zdr::TaggedSymbol)
        DISABLED =
          T.let(:disabled, ContextDev::WebScreenshotParams::Zdr::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::WebScreenshotParams::Zdr::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
