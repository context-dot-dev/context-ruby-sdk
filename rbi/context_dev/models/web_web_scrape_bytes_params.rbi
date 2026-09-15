# typed: strong

module ContextDev
  module Models
    class WebWebScrapeBytesParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::WebWebScrapeBytesParams,
            ContextDev::Internal::AnyHash
          )
        end

      # Full HTTP(S) URL of the resource to download, such as an image, PDF, or page.
      sig { returns(String) }
      attr_accessor :url

      # Fetch the target page through a residential proxy in this country (ISO 3166-1
      # alpha-2).
      sig do
        returns(
          T.nilable(ContextDev::WebWebScrapeBytesParams::Country::OrSymbol)
        )
      end
      attr_reader :country

      sig do
        params(
          country: ContextDev::WebWebScrapeBytesParams::Country::OrSymbol
        ).void
      end
      attr_writer :country

      # Optional outbound HTTP headers, such as Referer, Cookie, or Authorization. Send
      # as a JSON object or deep-object query params such as
      # headers[Referer]=https://example.com/. Host, Content-Length, and hop-by-hop
      # transport headers are rejected. Authorization and cookies are removed when a
      # redirect changes origin.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

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
        returns(T.nilable(ContextDev::WebWebScrapeBytesParams::TimeoutOpts))
      end
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts: ContextDev::WebWebScrapeBytesParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Requires zero data retention to be enabled for your
      # organization (contact support@context.dev), otherwise the request fails with
      # ZDR_NOT_ENABLED. Successful ZDR responses include X-Context-ZDR: true.
      sig do
        returns(T.nilable(ContextDev::WebWebScrapeBytesParams::Zdr::OrSymbol))
      end
      attr_reader :zdr

      sig do
        params(zdr: ContextDev::WebWebScrapeBytesParams::Zdr::OrSymbol).void
      end
      attr_writer :zdr

      sig do
        params(
          url: String,
          country: ContextDev::WebWebScrapeBytesParams::Country::OrSymbol,
          headers: T::Hash[Symbol, String],
          tags: T::Array[String],
          timeout_opts:
            ContextDev::WebWebScrapeBytesParams::TimeoutOpts::OrHash,
          zdr: ContextDev::WebWebScrapeBytesParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Full HTTP(S) URL of the resource to download, such as an image, PDF, or page.
        url:,
        # Fetch the target page through a residential proxy in this country (ISO 3166-1
        # alpha-2).
        country: nil,
        # Optional outbound HTTP headers, such as Referer, Cookie, or Authorization. Send
        # as a JSON object or deep-object query params such as
        # headers[Referer]=https://example.com/. Host, Content-Length, and hop-by-hop
        # transport headers are rejected. Authorization and cookies are removed when a
        # redirect changes origin.
        headers: nil,
        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
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
            country: ContextDev::WebWebScrapeBytesParams::Country::OrSymbol,
            headers: T::Hash[Symbol, String],
            tags: T::Array[String],
            timeout_opts: ContextDev::WebWebScrapeBytesParams::TimeoutOpts,
            zdr: ContextDev::WebWebScrapeBytesParams::Zdr::OrSymbol,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Fetch the target page through a residential proxy in this country (ISO 3166-1
      # alpha-2).
      module Country
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebWebScrapeBytesParams::Country)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AD =
          T.let(:ad, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        AE =
          T.let(:ae, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        AF =
          T.let(:af, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        AG =
          T.let(:ag, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        AI =
          T.let(:ai, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        AL =
          T.let(:al, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        AM =
          T.let(:am, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        AO =
          T.let(:ao, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        AR =
          T.let(:ar, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        AT =
          T.let(:at, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        AU =
          T.let(:au, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        AW =
          T.let(:aw, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        AZ =
          T.let(:az, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BA =
          T.let(:ba, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BB =
          T.let(:bb, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BD =
          T.let(:bd, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BE =
          T.let(:be, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BF =
          T.let(:bf, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BG =
          T.let(:bg, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BH =
          T.let(:bh, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BI =
          T.let(:bi, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BJ =
          T.let(:bj, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BM =
          T.let(:bm, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BN =
          T.let(:bn, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BO =
          T.let(:bo, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BQ =
          T.let(:bq, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BR =
          T.let(:br, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BS =
          T.let(:bs, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BW =
          T.let(:bw, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BY =
          T.let(:by, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        BZ =
          T.let(:bz, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        CA =
          T.let(:ca, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        CD =
          T.let(:cd, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        CF =
          T.let(:cf, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        CG =
          T.let(:cg, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        CH =
          T.let(:ch, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        CI =
          T.let(:ci, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        CL =
          T.let(:cl, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        CM =
          T.let(:cm, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        CN =
          T.let(:cn, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        CO =
          T.let(:co, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        CR =
          T.let(:cr, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        CV =
          T.let(:cv, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        CW =
          T.let(:cw, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        CY =
          T.let(:cy, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        CZ =
          T.let(:cz, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        DE =
          T.let(:de, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        DJ =
          T.let(:dj, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        DK =
          T.let(:dk, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        DM =
          T.let(:dm, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        DO =
          T.let(:do, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        DZ =
          T.let(:dz, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        EC =
          T.let(:ec, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        EE =
          T.let(:ee, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        EG =
          T.let(:eg, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        ES =
          T.let(:es, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        ET =
          T.let(:et, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        FI =
          T.let(:fi, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        FJ =
          T.let(:fj, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        FR =
          T.let(:fr, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        GA =
          T.let(:ga, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        GB =
          T.let(:gb, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        GD =
          T.let(:gd, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        GE =
          T.let(:ge, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        GF =
          T.let(:gf, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        GG =
          T.let(:gg, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        GH =
          T.let(:gh, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        GM =
          T.let(:gm, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        GN =
          T.let(:gn, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        GP =
          T.let(:gp, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        GQ =
          T.let(:gq, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        GR =
          T.let(:gr, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        GT =
          T.let(:gt, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        GU =
          T.let(:gu, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        GW =
          T.let(:gw, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        GY =
          T.let(:gy, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        HK =
          T.let(:hk, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        HN =
          T.let(:hn, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        HR =
          T.let(:hr, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        HT =
          T.let(:ht, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        HU =
          T.let(:hu, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        ID =
          T.let(:id, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        IE =
          T.let(:ie, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        IL =
          T.let(:il, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        IM =
          T.let(:im, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        IN =
          T.let(:in, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        IQ =
          T.let(:iq, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        IR =
          T.let(:ir, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        IS =
          T.let(:is, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        IT =
          T.let(:it, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        JE =
          T.let(:je, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        JM =
          T.let(:jm, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        JO =
          T.let(:jo, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        JP =
          T.let(:jp, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        KE =
          T.let(:ke, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        KG =
          T.let(:kg, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        KH =
          T.let(:kh, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        KN =
          T.let(:kn, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        KR =
          T.let(:kr, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        KW =
          T.let(:kw, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        KY =
          T.let(:ky, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        KZ =
          T.let(:kz, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        LA =
          T.let(:la, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        LB =
          T.let(:lb, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        LC =
          T.let(:lc, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        LK =
          T.let(:lk, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        LR =
          T.let(:lr, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        LS =
          T.let(:ls, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        LT =
          T.let(:lt, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        LU =
          T.let(:lu, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        LV =
          T.let(:lv, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        LY =
          T.let(:ly, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MA =
          T.let(:ma, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MC =
          T.let(:mc, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MD =
          T.let(:md, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        ME =
          T.let(:me, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MF =
          T.let(:mf, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MG =
          T.let(:mg, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MK =
          T.let(:mk, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        ML =
          T.let(:ml, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MM =
          T.let(:mm, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MN =
          T.let(:mn, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MO =
          T.let(:mo, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MQ =
          T.let(:mq, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MR =
          T.let(:mr, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MT =
          T.let(:mt, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MU =
          T.let(:mu, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MV =
          T.let(:mv, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MW =
          T.let(:mw, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MX =
          T.let(:mx, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MY =
          T.let(:my, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        MZ =
          T.let(:mz, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        NA =
          T.let(:na, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        NC =
          T.let(:nc, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        NE =
          T.let(:ne, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        NG =
          T.let(:ng, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        NI =
          T.let(:ni, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        NL =
          T.let(:nl, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        NO =
          T.let(:no, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        NP =
          T.let(:np, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        NZ =
          T.let(:nz, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        OM =
          T.let(:om, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        PA =
          T.let(:pa, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        PE =
          T.let(:pe, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        PF =
          T.let(:pf, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        PG =
          T.let(:pg, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        PH =
          T.let(:ph, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        PK =
          T.let(:pk, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        PL =
          T.let(:pl, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        PR =
          T.let(:pr, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        PS =
          T.let(:ps, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        PT =
          T.let(:pt, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        PY =
          T.let(:py, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        QA =
          T.let(:qa, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        RE =
          T.let(:re, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        RO =
          T.let(:ro, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        RS =
          T.let(:rs, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        RU =
          T.let(:ru, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        RW =
          T.let(:rw, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        SA =
          T.let(:sa, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        SC =
          T.let(:sc, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        SD =
          T.let(:sd, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        SE =
          T.let(:se, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        SG =
          T.let(:sg, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        SI =
          T.let(:si, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        SK =
          T.let(:sk, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        SL =
          T.let(:sl, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        SM =
          T.let(:sm, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        SN =
          T.let(:sn, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        SO =
          T.let(:so, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        SR =
          T.let(:sr, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        SS =
          T.let(:ss, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        ST =
          T.let(:st, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        SV =
          T.let(:sv, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        SX =
          T.let(:sx, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        SY =
          T.let(:sy, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        SZ =
          T.let(:sz, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        TC =
          T.let(:tc, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        TD =
          T.let(:td, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        TG =
          T.let(:tg, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        TH =
          T.let(:th, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        TJ =
          T.let(:tj, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        TL =
          T.let(:tl, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        TM =
          T.let(:tm, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        TN =
          T.let(:tn, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        TR =
          T.let(:tr, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        TT =
          T.let(:tt, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        TW =
          T.let(:tw, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        TZ =
          T.let(:tz, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        UA =
          T.let(:ua, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        UG =
          T.let(:ug, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        US =
          T.let(:us, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        UY =
          T.let(:uy, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        UZ =
          T.let(:uz, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        VC =
          T.let(:vc, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        VE =
          T.let(:ve, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        VG =
          T.let(:vg, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        VI =
          T.let(:vi, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        VN =
          T.let(:vn, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        YE =
          T.let(:ye, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        YT =
          T.let(:yt, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        ZA =
          T.let(:za, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        ZM =
          T.let(:zm, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)
        ZW =
          T.let(:zw, ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::WebWebScrapeBytesParams::Country::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebWebScrapeBytesParams::TimeoutOpts,
              ContextDev::Internal::AnyHash
            )
          end

        # Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        sig { returns(Integer) }
        attr_accessor :milliseconds

        # What to do at the deadline. This endpoint supports "fail": return 408
        # REQUEST_TIMEOUT without charging credits.
        sig do
          returns(
            T.nilable(
              ContextDev::WebWebScrapeBytesParams::TimeoutOpts::Behavior::OrSymbol
            )
          )
        end
        attr_reader :behavior

        sig do
          params(
            behavior:
              ContextDev::WebWebScrapeBytesParams::TimeoutOpts::Behavior::OrSymbol
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
              ContextDev::WebWebScrapeBytesParams::TimeoutOpts::Behavior::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Request deadline in milliseconds. Maximum: 300000 (5 minutes).
          milliseconds:,
          # What to do at the deadline. This endpoint supports "fail": return 408
          # REQUEST_TIMEOUT without charging credits.
          behavior: nil
        )
        end

        sig do
          override.returns(
            {
              milliseconds: Integer,
              behavior:
                ContextDev::WebWebScrapeBytesParams::TimeoutOpts::Behavior::OrSymbol
            }
          )
        end
        def to_hash
        end

        # What to do at the deadline. This endpoint supports "fail": return 408
        # REQUEST_TIMEOUT without charging credits.
        module Behavior
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::WebWebScrapeBytesParams::TimeoutOpts::Behavior
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAIL =
            T.let(
              :fail,
              ContextDev::WebWebScrapeBytesParams::TimeoutOpts::Behavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebWebScrapeBytesParams::TimeoutOpts::Behavior::TaggedSymbol
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
            T.all(Symbol, ContextDev::WebWebScrapeBytesParams::Zdr)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(
            :enabled,
            ContextDev::WebWebScrapeBytesParams::Zdr::TaggedSymbol
          )
        DISABLED =
          T.let(
            :disabled,
            ContextDev::WebWebScrapeBytesParams::Zdr::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::WebWebScrapeBytesParams::Zdr::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
