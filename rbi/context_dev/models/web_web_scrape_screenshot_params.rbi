# typed: strong

module ContextDev
  module Models
    class WebWebScrapeScreenshotParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::WebWebScrapeScreenshotParams,
            ContextDev::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :url

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
          T.nilable(
            ContextDev::WebWebScrapeScreenshotParams::ColorScheme::OrSymbol
          )
        )
      end
      attr_reader :color_scheme

      sig do
        params(
          color_scheme:
            ContextDev::WebWebScrapeScreenshotParams::ColorScheme::OrSymbol
        ).void
      end
      attr_writer :color_scheme

      # Fetch the target page through a residential proxy in this country (ISO 3166-1
      # alpha-2).
      sig do
        returns(
          T.nilable(ContextDev::WebWebScrapeScreenshotParams::Country::OrSymbol)
        )
      end
      attr_reader :country

      sig do
        params(
          country: ContextDev::WebWebScrapeScreenshotParams::Country::OrSymbol
        ).void
      end
      attr_writer :country

      # Optional parameter to determine screenshot type. If 'true', takes a full page
      # screenshot capturing all content. If 'false' or not provided, takes a viewport
      # screenshot (standard browser view).
      sig do
        returns(
          T.nilable(
            ContextDev::WebWebScrapeScreenshotParams::FullScreenshot::OrSymbol
          )
        )
      end
      attr_reader :full_screenshot

      sig do
        params(
          full_screenshot:
            ContextDev::WebWebScrapeScreenshotParams::FullScreenshot::OrSymbol
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

      # Optional outbound HTTP headers, using the same JSON object or deep-object query
      # format as other scrape endpoints (for example headers[Authorization]=Bearer
      # token). Headers are scoped to the target origin during capture. For domain/page
      # requests, discovery receives no custom headers and only pages on the resolved
      # origin are eligible. Non-empty headers bypass screenshot caching and return an
      # in-memory data URL; no screenshot is uploaded. Empty objects behave like omitted
      # headers.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      # Return a cached screenshot if a prior screenshot for the same parameters exists
      # and is younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
      # omitted. Max is 30 days (2592000000 ms). Set to 0 to always capture fresh.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_age_ms

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

      # Optional request deadline and behavior on timeout. For GET requests, use
      # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
      # timeoutOpts object.
      sig do
        returns(
          T.nilable(ContextDev::WebWebScrapeScreenshotParams::TimeoutOpts)
        )
      end
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts:
            ContextDev::WebWebScrapeScreenshotParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      # Optional browser viewport dimensions for the screenshot. Defaults to 1920x1080.
      sig do
        returns(T.nilable(ContextDev::WebWebScrapeScreenshotParams::Viewport))
      end
      attr_reader :viewport

      sig do
        params(
          viewport: ContextDev::WebWebScrapeScreenshotParams::Viewport::OrHash
        ).void
      end
      attr_writer :viewport

      # Optional browser wait time in milliseconds after initial page load before taking
      # the screenshot. Min: 0. Max: 30000 (30 seconds). Defaults to 3000 ms when
      # omitted. When combined with timeoutOpts, timeoutOpts.milliseconds must be at
      # least waitForMs + 10000 ms; a shorter deadline is rejected with 400
      # TIMEOUT_TOO_SHORT_FOR_WAIT.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :wait_for_ms

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Asset uploads are skipped, so hosted image URLs are
      # omitted. Requires zero data retention to be enabled for your organization
      # (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
      # Successful ZDR responses include X-Context-ZDR: true.
      sig do
        returns(
          T.nilable(ContextDev::WebWebScrapeScreenshotParams::Zdr::OrSymbol)
        )
      end
      attr_reader :zdr

      sig do
        params(
          zdr: ContextDev::WebWebScrapeScreenshotParams::Zdr::OrSymbol
        ).void
      end
      attr_writer :zdr

      sig do
        params(
          url: String,
          clear_popups: T::Boolean,
          color_scheme:
            ContextDev::WebWebScrapeScreenshotParams::ColorScheme::OrSymbol,
          country: ContextDev::WebWebScrapeScreenshotParams::Country::OrSymbol,
          full_screenshot:
            ContextDev::WebWebScrapeScreenshotParams::FullScreenshot::OrSymbol,
          handle_cookie_popup: T::Boolean,
          headers: T::Hash[Symbol, String],
          max_age_ms: T.nilable(Integer),
          scroll_offset: T.nilable(Integer),
          tags: T::Array[String],
          timeout_opts:
            ContextDev::WebWebScrapeScreenshotParams::TimeoutOpts::OrHash,
          viewport: ContextDev::WebWebScrapeScreenshotParams::Viewport::OrHash,
          wait_for_ms: T.nilable(Integer),
          zdr: ContextDev::WebWebScrapeScreenshotParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        url:,
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
        # Optional parameter to determine screenshot type. If 'true', takes a full page
        # screenshot capturing all content. If 'false' or not provided, takes a viewport
        # screenshot (standard browser view).
        full_screenshot: nil,
        # Optional parameter to control cookie/consent popup handling. If 'true', we
        # dismiss cookie banner before capture. If 'false' or not provided, captures the
        # page without that step.
        handle_cookie_popup: nil,
        # Optional outbound HTTP headers, using the same JSON object or deep-object query
        # format as other scrape endpoints (for example headers[Authorization]=Bearer
        # token). Headers are scoped to the target origin during capture. For domain/page
        # requests, discovery receives no custom headers and only pages on the resolved
        # origin are eligible. Non-empty headers bypass screenshot caching and return an
        # in-memory data URL; no screenshot is uploaded. Empty objects behave like omitted
        # headers.
        headers: nil,
        # Return a cached screenshot if a prior screenshot for the same parameters exists
        # and is younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
        # omitted. Max is 30 days (2592000000 ms). Set to 0 to always capture fresh.
        max_age_ms: nil,
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
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # Optional browser viewport dimensions for the screenshot. Defaults to 1920x1080.
        viewport: nil,
        # Optional browser wait time in milliseconds after initial page load before taking
        # the screenshot. Min: 0. Max: 30000 (30 seconds). Defaults to 3000 ms when
        # omitted. When combined with timeoutOpts, timeoutOpts.milliseconds must be at
        # least waitForMs + 10000 ms; a shorter deadline is rejected with 400
        # TIMEOUT_TOO_SHORT_FOR_WAIT.
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
            clear_popups: T::Boolean,
            color_scheme:
              ContextDev::WebWebScrapeScreenshotParams::ColorScheme::OrSymbol,
            country:
              ContextDev::WebWebScrapeScreenshotParams::Country::OrSymbol,
            full_screenshot:
              ContextDev::WebWebScrapeScreenshotParams::FullScreenshot::OrSymbol,
            handle_cookie_popup: T::Boolean,
            headers: T::Hash[Symbol, String],
            max_age_ms: T.nilable(Integer),
            scroll_offset: T.nilable(Integer),
            tags: T::Array[String],
            timeout_opts: ContextDev::WebWebScrapeScreenshotParams::TimeoutOpts,
            viewport: ContextDev::WebWebScrapeScreenshotParams::Viewport,
            wait_for_ms: T.nilable(Integer),
            zdr: ContextDev::WebWebScrapeScreenshotParams::Zdr::OrSymbol,
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
            T.all(Symbol, ContextDev::WebWebScrapeScreenshotParams::ColorScheme)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LIGHT =
          T.let(
            :light,
            ContextDev::WebWebScrapeScreenshotParams::ColorScheme::TaggedSymbol
          )
        DARK =
          T.let(
            :dark,
            ContextDev::WebWebScrapeScreenshotParams::ColorScheme::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::WebWebScrapeScreenshotParams::ColorScheme::TaggedSymbol
            ]
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
            T.all(Symbol, ContextDev::WebWebScrapeScreenshotParams::Country)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AD =
          T.let(
            :ad,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        AE =
          T.let(
            :ae,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        AF =
          T.let(
            :af,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        AG =
          T.let(
            :ag,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        AI =
          T.let(
            :ai,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        AL =
          T.let(
            :al,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        AM =
          T.let(
            :am,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        AO =
          T.let(
            :ao,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        AR =
          T.let(
            :ar,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        AT =
          T.let(
            :at,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        AU =
          T.let(
            :au,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        AW =
          T.let(
            :aw,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        AZ =
          T.let(
            :az,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BA =
          T.let(
            :ba,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BB =
          T.let(
            :bb,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BD =
          T.let(
            :bd,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BE =
          T.let(
            :be,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BF =
          T.let(
            :bf,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BG =
          T.let(
            :bg,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BH =
          T.let(
            :bh,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BI =
          T.let(
            :bi,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BJ =
          T.let(
            :bj,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BM =
          T.let(
            :bm,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BN =
          T.let(
            :bn,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BO =
          T.let(
            :bo,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BQ =
          T.let(
            :bq,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BR =
          T.let(
            :br,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BS =
          T.let(
            :bs,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BW =
          T.let(
            :bw,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BY =
          T.let(
            :by,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        BZ =
          T.let(
            :bz,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        CA =
          T.let(
            :ca,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        CD =
          T.let(
            :cd,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        CF =
          T.let(
            :cf,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        CG =
          T.let(
            :cg,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        CH =
          T.let(
            :ch,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        CI =
          T.let(
            :ci,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        CL =
          T.let(
            :cl,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        CM =
          T.let(
            :cm,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        CN =
          T.let(
            :cn,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        CO =
          T.let(
            :co,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        CR =
          T.let(
            :cr,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        CV =
          T.let(
            :cv,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        CW =
          T.let(
            :cw,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        CY =
          T.let(
            :cy,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        CZ =
          T.let(
            :cz,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        DE =
          T.let(
            :de,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        DJ =
          T.let(
            :dj,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        DK =
          T.let(
            :dk,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        DM =
          T.let(
            :dm,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        DO =
          T.let(
            :do,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        DZ =
          T.let(
            :dz,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        EC =
          T.let(
            :ec,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        EE =
          T.let(
            :ee,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        EG =
          T.let(
            :eg,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        ES =
          T.let(
            :es,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        ET =
          T.let(
            :et,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        FI =
          T.let(
            :fi,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        FJ =
          T.let(
            :fj,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        FR =
          T.let(
            :fr,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        GA =
          T.let(
            :ga,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        GB =
          T.let(
            :gb,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        GD =
          T.let(
            :gd,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        GE =
          T.let(
            :ge,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        GF =
          T.let(
            :gf,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        GG =
          T.let(
            :gg,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        GH =
          T.let(
            :gh,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        GM =
          T.let(
            :gm,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        GN =
          T.let(
            :gn,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        GP =
          T.let(
            :gp,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        GQ =
          T.let(
            :gq,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        GR =
          T.let(
            :gr,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        GT =
          T.let(
            :gt,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        GU =
          T.let(
            :gu,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        GW =
          T.let(
            :gw,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        GY =
          T.let(
            :gy,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        HK =
          T.let(
            :hk,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        HN =
          T.let(
            :hn,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        HR =
          T.let(
            :hr,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        HT =
          T.let(
            :ht,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        HU =
          T.let(
            :hu,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        ID =
          T.let(
            :id,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        IE =
          T.let(
            :ie,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        IL =
          T.let(
            :il,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        IM =
          T.let(
            :im,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        IN =
          T.let(
            :in,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        IQ =
          T.let(
            :iq,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        IR =
          T.let(
            :ir,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        IS =
          T.let(
            :is,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        IT =
          T.let(
            :it,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        JE =
          T.let(
            :je,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        JM =
          T.let(
            :jm,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        JO =
          T.let(
            :jo,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        JP =
          T.let(
            :jp,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        KE =
          T.let(
            :ke,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        KG =
          T.let(
            :kg,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        KH =
          T.let(
            :kh,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        KN =
          T.let(
            :kn,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        KR =
          T.let(
            :kr,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        KW =
          T.let(
            :kw,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        KY =
          T.let(
            :ky,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        KZ =
          T.let(
            :kz,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        LA =
          T.let(
            :la,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        LB =
          T.let(
            :lb,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        LC =
          T.let(
            :lc,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        LK =
          T.let(
            :lk,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        LR =
          T.let(
            :lr,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        LS =
          T.let(
            :ls,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        LT =
          T.let(
            :lt,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        LU =
          T.let(
            :lu,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        LV =
          T.let(
            :lv,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        LY =
          T.let(
            :ly,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MA =
          T.let(
            :ma,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MC =
          T.let(
            :mc,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MD =
          T.let(
            :md,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        ME =
          T.let(
            :me,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MF =
          T.let(
            :mf,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MG =
          T.let(
            :mg,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MK =
          T.let(
            :mk,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        ML =
          T.let(
            :ml,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MM =
          T.let(
            :mm,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MN =
          T.let(
            :mn,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MO =
          T.let(
            :mo,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MQ =
          T.let(
            :mq,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MR =
          T.let(
            :mr,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MT =
          T.let(
            :mt,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MU =
          T.let(
            :mu,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MV =
          T.let(
            :mv,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MW =
          T.let(
            :mw,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MX =
          T.let(
            :mx,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MY =
          T.let(
            :my,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        MZ =
          T.let(
            :mz,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        NA =
          T.let(
            :na,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        NC =
          T.let(
            :nc,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        NE =
          T.let(
            :ne,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        NG =
          T.let(
            :ng,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        NI =
          T.let(
            :ni,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        NL =
          T.let(
            :nl,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        NO =
          T.let(
            :no,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        NP =
          T.let(
            :np,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        NZ =
          T.let(
            :nz,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        OM =
          T.let(
            :om,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        PA =
          T.let(
            :pa,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        PE =
          T.let(
            :pe,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        PF =
          T.let(
            :pf,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        PG =
          T.let(
            :pg,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        PH =
          T.let(
            :ph,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        PK =
          T.let(
            :pk,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        PL =
          T.let(
            :pl,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        PR =
          T.let(
            :pr,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        PS =
          T.let(
            :ps,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        PT =
          T.let(
            :pt,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        PY =
          T.let(
            :py,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        QA =
          T.let(
            :qa,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        RE =
          T.let(
            :re,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        RO =
          T.let(
            :ro,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        RS =
          T.let(
            :rs,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        RU =
          T.let(
            :ru,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        RW =
          T.let(
            :rw,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        SA =
          T.let(
            :sa,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        SC =
          T.let(
            :sc,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        SD =
          T.let(
            :sd,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        SE =
          T.let(
            :se,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        SG =
          T.let(
            :sg,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        SI =
          T.let(
            :si,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        SK =
          T.let(
            :sk,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        SL =
          T.let(
            :sl,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        SM =
          T.let(
            :sm,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        SN =
          T.let(
            :sn,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        SO =
          T.let(
            :so,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        SR =
          T.let(
            :sr,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        SS =
          T.let(
            :ss,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        ST =
          T.let(
            :st,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        SV =
          T.let(
            :sv,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        SX =
          T.let(
            :sx,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        SY =
          T.let(
            :sy,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        SZ =
          T.let(
            :sz,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        TC =
          T.let(
            :tc,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        TD =
          T.let(
            :td,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        TG =
          T.let(
            :tg,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        TH =
          T.let(
            :th,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        TJ =
          T.let(
            :tj,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        TL =
          T.let(
            :tl,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        TM =
          T.let(
            :tm,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        TN =
          T.let(
            :tn,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        TR =
          T.let(
            :tr,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        TT =
          T.let(
            :tt,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        TW =
          T.let(
            :tw,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        TZ =
          T.let(
            :tz,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        UA =
          T.let(
            :ua,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        UG =
          T.let(
            :ug,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        US =
          T.let(
            :us,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        UY =
          T.let(
            :uy,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        UZ =
          T.let(
            :uz,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        VC =
          T.let(
            :vc,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        VE =
          T.let(
            :ve,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        VG =
          T.let(
            :vg,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        VI =
          T.let(
            :vi,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        VN =
          T.let(
            :vn,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        YE =
          T.let(
            :ye,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        YT =
          T.let(
            :yt,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        ZA =
          T.let(
            :za,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        ZM =
          T.let(
            :zm,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )
        ZW =
          T.let(
            :zw,
            ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::WebWebScrapeScreenshotParams::Country::TaggedSymbol
            ]
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
            T.all(
              Symbol,
              ContextDev::WebWebScrapeScreenshotParams::FullScreenshot
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            ContextDev::WebWebScrapeScreenshotParams::FullScreenshot::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            ContextDev::WebWebScrapeScreenshotParams::FullScreenshot::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::WebWebScrapeScreenshotParams::FullScreenshot::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebWebScrapeScreenshotParams::TimeoutOpts,
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
              ContextDev::WebWebScrapeScreenshotParams::TimeoutOpts::Behavior::OrSymbol
            )
          )
        end
        attr_reader :behavior

        sig do
          params(
            behavior:
              ContextDev::WebWebScrapeScreenshotParams::TimeoutOpts::Behavior::OrSymbol
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
              ContextDev::WebWebScrapeScreenshotParams::TimeoutOpts::Behavior::OrSymbol
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
                ContextDev::WebWebScrapeScreenshotParams::TimeoutOpts::Behavior::OrSymbol
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
                ContextDev::WebWebScrapeScreenshotParams::TimeoutOpts::Behavior
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAIL =
            T.let(
              :fail,
              ContextDev::WebWebScrapeScreenshotParams::TimeoutOpts::Behavior::TaggedSymbol
            )
          RETURN_PARTIAL =
            T.let(
              :"return-partial",
              ContextDev::WebWebScrapeScreenshotParams::TimeoutOpts::Behavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebWebScrapeScreenshotParams::TimeoutOpts::Behavior::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Viewport < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebWebScrapeScreenshotParams::Viewport,
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
      # from retained usage logs. Asset uploads are skipped, so hosted image URLs are
      # omitted. Requires zero data retention to be enabled for your organization
      # (contact support@context.dev), otherwise the request fails with ZDR_NOT_ENABLED.
      # Successful ZDR responses include X-Context-ZDR: true.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebWebScrapeScreenshotParams::Zdr)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(
            :enabled,
            ContextDev::WebWebScrapeScreenshotParams::Zdr::TaggedSymbol
          )
        DISABLED =
          T.let(
            :disabled,
            ContextDev::WebWebScrapeScreenshotParams::Zdr::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::WebWebScrapeScreenshotParams::Zdr::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
