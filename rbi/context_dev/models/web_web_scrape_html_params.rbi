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

      # Two-letter ISO 3166-1 alpha-2 country code identifying a supported Context.dev
      # residential proxy exit location. Must be one of Context.dev's supported
      # countries. When provided, Context.dev fetches the target page from that country.
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
      sig do
        returns(
          T.nilable(
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeHTMLParams::IncludeFrames::OrSymbol
            )
          )
        )
      end
      attr_reader :include_frames

      sig do
        params(
          include_frames:
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeHTMLParams::IncludeFrames::OrSymbol
            )
        ).void
      end
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
      sig do
        returns(
          T.nilable(
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeHTMLParams::SettleAnimations::OrSymbol
            )
          )
        )
      end
      attr_reader :settle_animations

      sig do
        params(
          settle_animations:
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeHTMLParams::SettleAnimations::OrSymbol
            )
        ).void
      end
      attr_writer :settle_animations

      # Optional comma-separated caller-defined tags for tracking this request. Tags are
      # recorded on the request's usage log and can be used to filter usage on the
      # dashboard usage page. Up to 20 tags, each 1-50 characters.
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

      # When true, return only the page's main content in the HTML response, excluding
      # headers, footers, sidebars, and navigation when detectable.
      sig do
        returns(
          T.nilable(
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeHTMLParams::UseMainContentOnly::OrSymbol
            )
          )
        )
      end
      attr_reader :use_main_content_only

      sig do
        params(
          use_main_content_only:
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeHTMLParams::UseMainContentOnly::OrSymbol
            )
        ).void
      end
      attr_writer :use_main_content_only

      # Optional browser wait time in milliseconds after initial page load. Min: 0. Max:
      # 30000 (30 seconds).
      sig { returns(T.nilable(Integer)) }
      attr_accessor :wait_for_ms

      sig do
        params(
          url: String,
          country: ContextDev::WebWebScrapeHTMLParams::Country::OrSymbol,
          exclude_selectors: T.nilable(T::Array[String]),
          headers: T::Hash[Symbol, String],
          include_frames:
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeHTMLParams::IncludeFrames::OrSymbol
            ),
          include_selectors: T.nilable(T::Array[String]),
          max_age_ms: T.nilable(Integer),
          pdf: ContextDev::WebWebScrapeHTMLParams::Pdf::OrHash,
          settle_animations:
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeHTMLParams::SettleAnimations::OrSymbol
            ),
          tags: T::Array[String],
          timeout_ms: Integer,
          use_main_content_only:
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeHTMLParams::UseMainContentOnly::OrSymbol
            ),
          wait_for_ms: T.nilable(Integer),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Full URL to scrape (must include http:// or https:// protocol)
        url:,
        # Two-letter ISO 3166-1 alpha-2 country code identifying a supported Context.dev
        # residential proxy exit location. Must be one of Context.dev's supported
        # countries. When provided, Context.dev fetches the target page from that country.
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
        # Optional comma-separated caller-defined tags for tracking this request. Tags are
        # recorded on the request's usage log and can be used to filter usage on the
        # dashboard usage page. Up to 20 tags, each 1-50 characters.
        tags: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        # When true, return only the page's main content in the HTML response, excluding
        # headers, footers, sidebars, and navigation when detectable.
        use_main_content_only: nil,
        # Optional browser wait time in milliseconds after initial page load. Min: 0. Max:
        # 30000 (30 seconds).
        wait_for_ms: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            url: String,
            country: ContextDev::WebWebScrapeHTMLParams::Country::OrSymbol,
            exclude_selectors: T.nilable(T::Array[String]),
            headers: T::Hash[Symbol, String],
            include_frames:
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeHTMLParams::IncludeFrames::OrSymbol
              ),
            include_selectors: T.nilable(T::Array[String]),
            max_age_ms: T.nilable(Integer),
            pdf: ContextDev::WebWebScrapeHTMLParams::Pdf,
            settle_animations:
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeHTMLParams::SettleAnimations::OrSymbol
              ),
            tags: T::Array[String],
            timeout_ms: Integer,
            use_main_content_only:
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeHTMLParams::UseMainContentOnly::OrSymbol
              ),
            wait_for_ms: T.nilable(Integer),
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Two-letter ISO 3166-1 alpha-2 country code identifying a supported Context.dev
      # residential proxy exit location. Must be one of Context.dev's supported
      # countries. When provided, Context.dev fetches the target page from that country.
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

      # When true, iframes are rendered inline into the returned HTML.
      module IncludeFrames
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeHTMLParams::IncludeFrames::TaggedSymbol
            )
          end

        sig do
          override.returns(
            T::Array[
              ContextDev::WebWebScrapeHTMLParams::IncludeFrames::Variants
            ]
          )
        end
        def self.variants
        end

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebWebScrapeHTMLParams::IncludeFrames)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            ContextDev::WebWebScrapeHTMLParams::IncludeFrames::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            ContextDev::WebWebScrapeHTMLParams::IncludeFrames::TaggedSymbol
          )
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

        # When true, detect and OCR images embedded in the selected PDF pages, inserting
        # recognized text at each image's position in page reading order while preserving
        # the PDF text layer. This is separate from automatic scanned-PDF OCR fallback.
        sig do
          returns(
            T.nilable(
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeHTMLParams::Pdf::Ocr::OrSymbol
              )
            )
          )
        end
        attr_reader :ocr

        sig do
          params(
            ocr:
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeHTMLParams::Pdf::Ocr::OrSymbol
              )
          ).void
        end
        attr_writer :ocr

        # When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
        # a 400 WEBSITE_ACCESS_ERROR is returned.
        sig do
          returns(
            T.nilable(
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeHTMLParams::Pdf::ShouldParse::OrSymbol
              )
            )
          )
        end
        attr_reader :should_parse

        sig do
          params(
            should_parse:
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeHTMLParams::Pdf::ShouldParse::OrSymbol
              )
          ).void
        end
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
            ocr:
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeHTMLParams::Pdf::Ocr::OrSymbol
              ),
            should_parse:
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeHTMLParams::Pdf::ShouldParse::OrSymbol
              ),
            start: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
          # Must be greater than or equal to start when both are provided.
          end_: nil,
          # When true, detect and OCR images embedded in the selected PDF pages, inserting
          # recognized text at each image's position in page reading order while preserving
          # the PDF text layer. This is separate from automatic scanned-PDF OCR fallback.
          ocr: nil,
          # When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
          # a 400 WEBSITE_ACCESS_ERROR is returned.
          should_parse: nil,
          # First 1-based PDF page to parse. When omitted, parsing starts at the first page.
          start: nil
        )
        end

        sig do
          override.returns(
            {
              end_: Integer,
              ocr:
                T.any(
                  T::Boolean,
                  ContextDev::WebWebScrapeHTMLParams::Pdf::Ocr::OrSymbol
                ),
              should_parse:
                T.any(
                  T::Boolean,
                  ContextDev::WebWebScrapeHTMLParams::Pdf::ShouldParse::OrSymbol
                ),
              start: Integer
            }
          )
        end
        def to_hash
        end

        # When true, detect and OCR images embedded in the selected PDF pages, inserting
        # recognized text at each image's position in page reading order while preserving
        # the PDF text layer. This is separate from automatic scanned-PDF OCR fallback.
        module Ocr
          extend ContextDev::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeHTMLParams::Pdf::Ocr::TaggedSymbol
              )
            end

          sig do
            override.returns(
              T::Array[ContextDev::WebWebScrapeHTMLParams::Pdf::Ocr::Variants]
            )
          end
          def self.variants
          end

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::WebWebScrapeHTMLParams::Pdf::Ocr)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TRUE =
            T.let(
              :true,
              ContextDev::WebWebScrapeHTMLParams::Pdf::Ocr::TaggedSymbol
            )
          FALSE =
            T.let(
              :false,
              ContextDev::WebWebScrapeHTMLParams::Pdf::Ocr::TaggedSymbol
            )
        end

        # When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
        # a 400 WEBSITE_ACCESS_ERROR is returned.
        module ShouldParse
          extend ContextDev::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeHTMLParams::Pdf::ShouldParse::TaggedSymbol
              )
            end

          sig do
            override.returns(
              T::Array[
                ContextDev::WebWebScrapeHTMLParams::Pdf::ShouldParse::Variants
              ]
            )
          end
          def self.variants
          end

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::WebWebScrapeHTMLParams::Pdf::ShouldParse
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TRUE =
            T.let(
              :true,
              ContextDev::WebWebScrapeHTMLParams::Pdf::ShouldParse::TaggedSymbol
            )
          FALSE =
            T.let(
              :false,
              ContextDev::WebWebScrapeHTMLParams::Pdf::ShouldParse::TaggedSymbol
            )
        end
      end

      # When true, waits briefly for CSS and transition animations to settle before
      # extracting HTML. Defaults to false. This adds a bit of latency in exchange for
      # more stable output on animated pages.
      module SettleAnimations
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeHTMLParams::SettleAnimations::TaggedSymbol
            )
          end

        sig do
          override.returns(
            T::Array[
              ContextDev::WebWebScrapeHTMLParams::SettleAnimations::Variants
            ]
          )
        end
        def self.variants
        end

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebWebScrapeHTMLParams::SettleAnimations)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            ContextDev::WebWebScrapeHTMLParams::SettleAnimations::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            ContextDev::WebWebScrapeHTMLParams::SettleAnimations::TaggedSymbol
          )
      end

      # When true, return only the page's main content in the HTML response, excluding
      # headers, footers, sidebars, and navigation when detectable.
      module UseMainContentOnly
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeHTMLParams::UseMainContentOnly::TaggedSymbol
            )
          end

        sig do
          override.returns(
            T::Array[
              ContextDev::WebWebScrapeHTMLParams::UseMainContentOnly::Variants
            ]
          )
        end
        def self.variants
        end

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              ContextDev::WebWebScrapeHTMLParams::UseMainContentOnly
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            ContextDev::WebWebScrapeHTMLParams::UseMainContentOnly::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            ContextDev::WebWebScrapeHTMLParams::UseMainContentOnly::TaggedSymbol
          )
      end
    end
  end
end
