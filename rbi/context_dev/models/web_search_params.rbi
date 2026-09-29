# typed: strong

module ContextDev
  module Models
    class WebSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::WebSearchParams, ContextDev::Internal::AnyHash)
        end

      # Search query. Accepts natural language as well as Google-style search operators
      # such as `site:`, `-site:`, `inurl:`, `intitle:`, quoted phrases, and `OR`.
      sig { returns(String) }
      attr_accessor :query

      # Two-letter ISO 3166-1 alpha-2 country code to localize results to a specific
      # country (maps to Google's `gl` parameter). Example: "us", "gb", "de".
      sig { returns(T.nilable(ContextDev::WebSearchParams::Country::OrSymbol)) }
      attr_reader :country

      sig do
        params(country: ContextDev::WebSearchParams::Country::OrSymbol).void
      end
      attr_writer :country

      # Blocklist — drop results from these domains. Up to 100 domains. Example:
      # ["pinterest.com", "reddit.com"].
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :exclude_domains

      sig { params(exclude_domains: T::Array[String]).void }
      attr_writer :exclude_domains

      # Restrict results to content published within this window.
      sig do
        returns(T.nilable(ContextDev::WebSearchParams::Freshness::OrSymbol))
      end
      attr_reader :freshness

      sig do
        params(freshness: ContextDev::WebSearchParams::Freshness::OrSymbol).void
      end
      attr_writer :freshness

      # Passages from each result page that are relevant to the query. Pages are read
      # with the `markdownOptions` settings.
      sig { returns(T.nilable(ContextDev::WebSearchParams::HighlightsOptions)) }
      attr_reader :highlights_options

      sig do
        params(
          highlights_options:
            ContextDev::WebSearchParams::HighlightsOptions::OrHash
        ).void
      end
      attr_writer :highlights_options

      # Allowlist — only return results from these domains. Up to 100 domains. Example:
      # ["arxiv.org", "github.com"].
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :include_domains

      sig { params(include_domains: T::Array[String]).void }
      attr_writer :include_domains

      # Inline Markdown scraping for each result. Set `enabled: true` to activate.
      sig { returns(T.nilable(ContextDev::WebSearchParams::MarkdownOptions)) }
      attr_reader :markdown_options

      sig do
        params(
          markdown_options: ContextDev::WebSearchParams::MarkdownOptions::OrHash
        ).void
      end
      attr_writer :markdown_options

      # Number of results to request and return (10–100). Defaults to 10.
      sig { returns(T.nilable(Integer)) }
      attr_reader :num_results

      sig { params(num_results: Integer).void }
      attr_writer :num_results

      # Currently has no effect.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :query_fanout

      sig { params(query_fanout: T::Boolean).void }
      attr_writer :query_fanout

      # Labels for filtering usage in the dashboard.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Request deadline and what to return when it passes.
      sig { returns(T.nilable(ContextDev::WebSearchParams::TimeoutOpts)) }
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts: ContextDev::WebSearchParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      sig { returns(T.nilable(ContextDev::WebSearchParams::Zdr::OrSymbol)) }
      attr_reader :zdr

      sig { params(zdr: ContextDev::WebSearchParams::Zdr::OrSymbol).void }
      attr_writer :zdr

      sig do
        params(
          query: String,
          country: ContextDev::WebSearchParams::Country::OrSymbol,
          exclude_domains: T::Array[String],
          freshness: ContextDev::WebSearchParams::Freshness::OrSymbol,
          highlights_options:
            ContextDev::WebSearchParams::HighlightsOptions::OrHash,
          include_domains: T::Array[String],
          markdown_options:
            ContextDev::WebSearchParams::MarkdownOptions::OrHash,
          num_results: Integer,
          query_fanout: T::Boolean,
          tags: T::Array[String],
          timeout_opts: ContextDev::WebSearchParams::TimeoutOpts::OrHash,
          zdr: ContextDev::WebSearchParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Search query. Accepts natural language as well as Google-style search operators
        # such as `site:`, `-site:`, `inurl:`, `intitle:`, quoted phrases, and `OR`.
        query:,
        # Two-letter ISO 3166-1 alpha-2 country code to localize results to a specific
        # country (maps to Google's `gl` parameter). Example: "us", "gb", "de".
        country: nil,
        # Blocklist — drop results from these domains. Up to 100 domains. Example:
        # ["pinterest.com", "reddit.com"].
        exclude_domains: nil,
        # Restrict results to content published within this window.
        freshness: nil,
        # Passages from each result page that are relevant to the query. Pages are read
        # with the `markdownOptions` settings.
        highlights_options: nil,
        # Allowlist — only return results from these domains. Up to 100 domains. Example:
        # ["arxiv.org", "github.com"].
        include_domains: nil,
        # Inline Markdown scraping for each result. Set `enabled: true` to activate.
        markdown_options: nil,
        # Number of results to request and return (10–100). Defaults to 10.
        num_results: nil,
        # Currently has no effect.
        query_fanout: nil,
        # Labels for filtering usage in the dashboard.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            query: String,
            country: ContextDev::WebSearchParams::Country::OrSymbol,
            exclude_domains: T::Array[String],
            freshness: ContextDev::WebSearchParams::Freshness::OrSymbol,
            highlights_options: ContextDev::WebSearchParams::HighlightsOptions,
            include_domains: T::Array[String],
            markdown_options: ContextDev::WebSearchParams::MarkdownOptions,
            num_results: Integer,
            query_fanout: T::Boolean,
            tags: T::Array[String],
            timeout_opts: ContextDev::WebSearchParams::TimeoutOpts,
            zdr: ContextDev::WebSearchParams::Zdr::OrSymbol,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Two-letter ISO 3166-1 alpha-2 country code to localize results to a specific
      # country (maps to Google's `gl` parameter). Example: "us", "gb", "de".
      module Country
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::WebSearchParams::Country) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AF = T.let(:af, ContextDev::WebSearchParams::Country::TaggedSymbol)
        AL = T.let(:al, ContextDev::WebSearchParams::Country::TaggedSymbol)
        DZ = T.let(:dz, ContextDev::WebSearchParams::Country::TaggedSymbol)
        AS = T.let(:as, ContextDev::WebSearchParams::Country::TaggedSymbol)
        AD = T.let(:ad, ContextDev::WebSearchParams::Country::TaggedSymbol)
        AO = T.let(:ao, ContextDev::WebSearchParams::Country::TaggedSymbol)
        AI = T.let(:ai, ContextDev::WebSearchParams::Country::TaggedSymbol)
        AQ = T.let(:aq, ContextDev::WebSearchParams::Country::TaggedSymbol)
        AG = T.let(:ag, ContextDev::WebSearchParams::Country::TaggedSymbol)
        AR = T.let(:ar, ContextDev::WebSearchParams::Country::TaggedSymbol)
        AM = T.let(:am, ContextDev::WebSearchParams::Country::TaggedSymbol)
        AW = T.let(:aw, ContextDev::WebSearchParams::Country::TaggedSymbol)
        AU = T.let(:au, ContextDev::WebSearchParams::Country::TaggedSymbol)
        AT = T.let(:at, ContextDev::WebSearchParams::Country::TaggedSymbol)
        AZ = T.let(:az, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BS = T.let(:bs, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BH = T.let(:bh, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BD = T.let(:bd, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BB = T.let(:bb, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BY = T.let(:by, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BE = T.let(:be, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BZ = T.let(:bz, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BJ = T.let(:bj, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BM = T.let(:bm, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BT = T.let(:bt, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BO = T.let(:bo, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BA = T.let(:ba, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BW = T.let(:bw, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BV = T.let(:bv, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BR = T.let(:br, ContextDev::WebSearchParams::Country::TaggedSymbol)
        IO = T.let(:io, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BN = T.let(:bn, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BG = T.let(:bg, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BF = T.let(:bf, ContextDev::WebSearchParams::Country::TaggedSymbol)
        BI = T.let(:bi, ContextDev::WebSearchParams::Country::TaggedSymbol)
        KH = T.let(:kh, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CM = T.let(:cm, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CA = T.let(:ca, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CV = T.let(:cv, ContextDev::WebSearchParams::Country::TaggedSymbol)
        KY = T.let(:ky, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CF = T.let(:cf, ContextDev::WebSearchParams::Country::TaggedSymbol)
        TD = T.let(:td, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CL = T.let(:cl, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CN = T.let(:cn, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CX = T.let(:cx, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CC = T.let(:cc, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CO = T.let(:co, ContextDev::WebSearchParams::Country::TaggedSymbol)
        KM = T.let(:km, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CG = T.let(:cg, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CD = T.let(:cd, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CK = T.let(:ck, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CR = T.let(:cr, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CI = T.let(:ci, ContextDev::WebSearchParams::Country::TaggedSymbol)
        HR = T.let(:hr, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CU = T.let(:cu, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CY = T.let(:cy, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CZ = T.let(:cz, ContextDev::WebSearchParams::Country::TaggedSymbol)
        DK = T.let(:dk, ContextDev::WebSearchParams::Country::TaggedSymbol)
        DJ = T.let(:dj, ContextDev::WebSearchParams::Country::TaggedSymbol)
        DM = T.let(:dm, ContextDev::WebSearchParams::Country::TaggedSymbol)
        DO = T.let(:do, ContextDev::WebSearchParams::Country::TaggedSymbol)
        EC = T.let(:ec, ContextDev::WebSearchParams::Country::TaggedSymbol)
        EG = T.let(:eg, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SV = T.let(:sv, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GQ = T.let(:gq, ContextDev::WebSearchParams::Country::TaggedSymbol)
        ER = T.let(:er, ContextDev::WebSearchParams::Country::TaggedSymbol)
        EE = T.let(:ee, ContextDev::WebSearchParams::Country::TaggedSymbol)
        ET = T.let(:et, ContextDev::WebSearchParams::Country::TaggedSymbol)
        FK = T.let(:fk, ContextDev::WebSearchParams::Country::TaggedSymbol)
        FO = T.let(:fo, ContextDev::WebSearchParams::Country::TaggedSymbol)
        FJ = T.let(:fj, ContextDev::WebSearchParams::Country::TaggedSymbol)
        FI = T.let(:fi, ContextDev::WebSearchParams::Country::TaggedSymbol)
        FR = T.let(:fr, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GF = T.let(:gf, ContextDev::WebSearchParams::Country::TaggedSymbol)
        PF = T.let(:pf, ContextDev::WebSearchParams::Country::TaggedSymbol)
        TF = T.let(:tf, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GA = T.let(:ga, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GM = T.let(:gm, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GE = T.let(:ge, ContextDev::WebSearchParams::Country::TaggedSymbol)
        DE = T.let(:de, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GH = T.let(:gh, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GI = T.let(:gi, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GR = T.let(:gr, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GL = T.let(:gl, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GD = T.let(:gd, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GP = T.let(:gp, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GU = T.let(:gu, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GT = T.let(:gt, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GN = T.let(:gn, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GW = T.let(:gw, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GY = T.let(:gy, ContextDev::WebSearchParams::Country::TaggedSymbol)
        HT = T.let(:ht, ContextDev::WebSearchParams::Country::TaggedSymbol)
        HM = T.let(:hm, ContextDev::WebSearchParams::Country::TaggedSymbol)
        VA = T.let(:va, ContextDev::WebSearchParams::Country::TaggedSymbol)
        HN = T.let(:hn, ContextDev::WebSearchParams::Country::TaggedSymbol)
        HK = T.let(:hk, ContextDev::WebSearchParams::Country::TaggedSymbol)
        HU = T.let(:hu, ContextDev::WebSearchParams::Country::TaggedSymbol)
        IS = T.let(:is, ContextDev::WebSearchParams::Country::TaggedSymbol)
        IN = T.let(:in, ContextDev::WebSearchParams::Country::TaggedSymbol)
        ID = T.let(:id, ContextDev::WebSearchParams::Country::TaggedSymbol)
        IR = T.let(:ir, ContextDev::WebSearchParams::Country::TaggedSymbol)
        IQ = T.let(:iq, ContextDev::WebSearchParams::Country::TaggedSymbol)
        IE = T.let(:ie, ContextDev::WebSearchParams::Country::TaggedSymbol)
        IL = T.let(:il, ContextDev::WebSearchParams::Country::TaggedSymbol)
        IT = T.let(:it, ContextDev::WebSearchParams::Country::TaggedSymbol)
        JM = T.let(:jm, ContextDev::WebSearchParams::Country::TaggedSymbol)
        JP = T.let(:jp, ContextDev::WebSearchParams::Country::TaggedSymbol)
        JO = T.let(:jo, ContextDev::WebSearchParams::Country::TaggedSymbol)
        KZ = T.let(:kz, ContextDev::WebSearchParams::Country::TaggedSymbol)
        KE = T.let(:ke, ContextDev::WebSearchParams::Country::TaggedSymbol)
        KI = T.let(:ki, ContextDev::WebSearchParams::Country::TaggedSymbol)
        KP = T.let(:kp, ContextDev::WebSearchParams::Country::TaggedSymbol)
        KR = T.let(:kr, ContextDev::WebSearchParams::Country::TaggedSymbol)
        KW = T.let(:kw, ContextDev::WebSearchParams::Country::TaggedSymbol)
        KG = T.let(:kg, ContextDev::WebSearchParams::Country::TaggedSymbol)
        LA = T.let(:la, ContextDev::WebSearchParams::Country::TaggedSymbol)
        LV = T.let(:lv, ContextDev::WebSearchParams::Country::TaggedSymbol)
        LB = T.let(:lb, ContextDev::WebSearchParams::Country::TaggedSymbol)
        LS = T.let(:ls, ContextDev::WebSearchParams::Country::TaggedSymbol)
        LR = T.let(:lr, ContextDev::WebSearchParams::Country::TaggedSymbol)
        LY = T.let(:ly, ContextDev::WebSearchParams::Country::TaggedSymbol)
        LI = T.let(:li, ContextDev::WebSearchParams::Country::TaggedSymbol)
        LT = T.let(:lt, ContextDev::WebSearchParams::Country::TaggedSymbol)
        LU = T.let(:lu, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MO = T.let(:mo, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MK = T.let(:mk, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MG = T.let(:mg, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MW = T.let(:mw, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MY = T.let(:my, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MV = T.let(:mv, ContextDev::WebSearchParams::Country::TaggedSymbol)
        ML = T.let(:ml, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MT = T.let(:mt, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MH = T.let(:mh, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MQ = T.let(:mq, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MR = T.let(:mr, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MU = T.let(:mu, ContextDev::WebSearchParams::Country::TaggedSymbol)
        YT = T.let(:yt, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MX = T.let(:mx, ContextDev::WebSearchParams::Country::TaggedSymbol)
        FM = T.let(:fm, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MD = T.let(:md, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MC = T.let(:mc, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MN = T.let(:mn, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MS = T.let(:ms, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MA = T.let(:ma, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MZ = T.let(:mz, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MM = T.let(:mm, ContextDev::WebSearchParams::Country::TaggedSymbol)
        NA = T.let(:na, ContextDev::WebSearchParams::Country::TaggedSymbol)
        NR = T.let(:nr, ContextDev::WebSearchParams::Country::TaggedSymbol)
        NP = T.let(:np, ContextDev::WebSearchParams::Country::TaggedSymbol)
        NL = T.let(:nl, ContextDev::WebSearchParams::Country::TaggedSymbol)
        AN = T.let(:an, ContextDev::WebSearchParams::Country::TaggedSymbol)
        NC = T.let(:nc, ContextDev::WebSearchParams::Country::TaggedSymbol)
        NZ = T.let(:nz, ContextDev::WebSearchParams::Country::TaggedSymbol)
        NI = T.let(:ni, ContextDev::WebSearchParams::Country::TaggedSymbol)
        NE = T.let(:ne, ContextDev::WebSearchParams::Country::TaggedSymbol)
        NG = T.let(:ng, ContextDev::WebSearchParams::Country::TaggedSymbol)
        NU = T.let(:nu, ContextDev::WebSearchParams::Country::TaggedSymbol)
        NF = T.let(:nf, ContextDev::WebSearchParams::Country::TaggedSymbol)
        MP = T.let(:mp, ContextDev::WebSearchParams::Country::TaggedSymbol)
        NO = T.let(:no, ContextDev::WebSearchParams::Country::TaggedSymbol)
        OM = T.let(:om, ContextDev::WebSearchParams::Country::TaggedSymbol)
        PK = T.let(:pk, ContextDev::WebSearchParams::Country::TaggedSymbol)
        PW = T.let(:pw, ContextDev::WebSearchParams::Country::TaggedSymbol)
        PS = T.let(:ps, ContextDev::WebSearchParams::Country::TaggedSymbol)
        PA = T.let(:pa, ContextDev::WebSearchParams::Country::TaggedSymbol)
        PG = T.let(:pg, ContextDev::WebSearchParams::Country::TaggedSymbol)
        PY = T.let(:py, ContextDev::WebSearchParams::Country::TaggedSymbol)
        PE = T.let(:pe, ContextDev::WebSearchParams::Country::TaggedSymbol)
        PH = T.let(:ph, ContextDev::WebSearchParams::Country::TaggedSymbol)
        PN = T.let(:pn, ContextDev::WebSearchParams::Country::TaggedSymbol)
        PL = T.let(:pl, ContextDev::WebSearchParams::Country::TaggedSymbol)
        PT = T.let(:pt, ContextDev::WebSearchParams::Country::TaggedSymbol)
        PR = T.let(:pr, ContextDev::WebSearchParams::Country::TaggedSymbol)
        QA = T.let(:qa, ContextDev::WebSearchParams::Country::TaggedSymbol)
        RE = T.let(:re, ContextDev::WebSearchParams::Country::TaggedSymbol)
        RO = T.let(:ro, ContextDev::WebSearchParams::Country::TaggedSymbol)
        RU = T.let(:ru, ContextDev::WebSearchParams::Country::TaggedSymbol)
        RW = T.let(:rw, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SH = T.let(:sh, ContextDev::WebSearchParams::Country::TaggedSymbol)
        KN = T.let(:kn, ContextDev::WebSearchParams::Country::TaggedSymbol)
        LC = T.let(:lc, ContextDev::WebSearchParams::Country::TaggedSymbol)
        PM = T.let(:pm, ContextDev::WebSearchParams::Country::TaggedSymbol)
        VC = T.let(:vc, ContextDev::WebSearchParams::Country::TaggedSymbol)
        WS = T.let(:ws, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SM = T.let(:sm, ContextDev::WebSearchParams::Country::TaggedSymbol)
        ST = T.let(:st, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SA = T.let(:sa, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SN = T.let(:sn, ContextDev::WebSearchParams::Country::TaggedSymbol)
        RS = T.let(:rs, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SC = T.let(:sc, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SL = T.let(:sl, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SG = T.let(:sg, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SK = T.let(:sk, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SI = T.let(:si, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SB = T.let(:sb, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SO = T.let(:so, ContextDev::WebSearchParams::Country::TaggedSymbol)
        ZA = T.let(:za, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GS = T.let(:gs, ContextDev::WebSearchParams::Country::TaggedSymbol)
        ES = T.let(:es, ContextDev::WebSearchParams::Country::TaggedSymbol)
        LK = T.let(:lk, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SD = T.let(:sd, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SR = T.let(:sr, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SJ = T.let(:sj, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SZ = T.let(:sz, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SE = T.let(:se, ContextDev::WebSearchParams::Country::TaggedSymbol)
        CH = T.let(:ch, ContextDev::WebSearchParams::Country::TaggedSymbol)
        SY = T.let(:sy, ContextDev::WebSearchParams::Country::TaggedSymbol)
        TW = T.let(:tw, ContextDev::WebSearchParams::Country::TaggedSymbol)
        TJ = T.let(:tj, ContextDev::WebSearchParams::Country::TaggedSymbol)
        TZ = T.let(:tz, ContextDev::WebSearchParams::Country::TaggedSymbol)
        TH = T.let(:th, ContextDev::WebSearchParams::Country::TaggedSymbol)
        TL = T.let(:tl, ContextDev::WebSearchParams::Country::TaggedSymbol)
        TG = T.let(:tg, ContextDev::WebSearchParams::Country::TaggedSymbol)
        TK = T.let(:tk, ContextDev::WebSearchParams::Country::TaggedSymbol)
        TO = T.let(:to, ContextDev::WebSearchParams::Country::TaggedSymbol)
        TT = T.let(:tt, ContextDev::WebSearchParams::Country::TaggedSymbol)
        TN = T.let(:tn, ContextDev::WebSearchParams::Country::TaggedSymbol)
        TR = T.let(:tr, ContextDev::WebSearchParams::Country::TaggedSymbol)
        TM = T.let(:tm, ContextDev::WebSearchParams::Country::TaggedSymbol)
        TC = T.let(:tc, ContextDev::WebSearchParams::Country::TaggedSymbol)
        TV = T.let(:tv, ContextDev::WebSearchParams::Country::TaggedSymbol)
        UG = T.let(:ug, ContextDev::WebSearchParams::Country::TaggedSymbol)
        UA = T.let(:ua, ContextDev::WebSearchParams::Country::TaggedSymbol)
        AE = T.let(:ae, ContextDev::WebSearchParams::Country::TaggedSymbol)
        GB = T.let(:gb, ContextDev::WebSearchParams::Country::TaggedSymbol)
        US = T.let(:us, ContextDev::WebSearchParams::Country::TaggedSymbol)
        UM = T.let(:um, ContextDev::WebSearchParams::Country::TaggedSymbol)
        UY = T.let(:uy, ContextDev::WebSearchParams::Country::TaggedSymbol)
        UZ = T.let(:uz, ContextDev::WebSearchParams::Country::TaggedSymbol)
        VU = T.let(:vu, ContextDev::WebSearchParams::Country::TaggedSymbol)
        VE = T.let(:ve, ContextDev::WebSearchParams::Country::TaggedSymbol)
        VN = T.let(:vn, ContextDev::WebSearchParams::Country::TaggedSymbol)
        VG = T.let(:vg, ContextDev::WebSearchParams::Country::TaggedSymbol)
        VI = T.let(:vi, ContextDev::WebSearchParams::Country::TaggedSymbol)
        WF = T.let(:wf, ContextDev::WebSearchParams::Country::TaggedSymbol)
        EH = T.let(:eh, ContextDev::WebSearchParams::Country::TaggedSymbol)
        YE = T.let(:ye, ContextDev::WebSearchParams::Country::TaggedSymbol)
        ZM = T.let(:zm, ContextDev::WebSearchParams::Country::TaggedSymbol)
        ZW = T.let(:zw, ContextDev::WebSearchParams::Country::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::WebSearchParams::Country::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Restrict results to content published within this window.
      module Freshness
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::WebSearchParams::Freshness) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LAST_24_HOURS =
          T.let(
            :last_24_hours,
            ContextDev::WebSearchParams::Freshness::TaggedSymbol
          )
        LAST_WEEK =
          T.let(
            :last_week,
            ContextDev::WebSearchParams::Freshness::TaggedSymbol
          )
        LAST_MONTH =
          T.let(
            :last_month,
            ContextDev::WebSearchParams::Freshness::TaggedSymbol
          )
        LAST_YEAR =
          T.let(
            :last_year,
            ContextDev::WebSearchParams::Freshness::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::WebSearchParams::Freshness::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class HighlightsOptions < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebSearchParams::HighlightsOptions,
              ContextDev::Internal::AnyHash
            )
          end

        # Return relevant passages for each result. Adds 1 credit per 10 results.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :enabled

        sig { params(enabled: T::Boolean).void }
        attr_writer :enabled

        # Maximum combined length of passages per result.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_characters

        sig { params(max_characters: Integer).void }
        attr_writer :max_characters

        # Passages from each result page that are relevant to the query. Pages are read
        # with the `markdownOptions` settings.
        sig do
          params(enabled: T::Boolean, max_characters: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Return relevant passages for each result. Adds 1 credit per 10 results.
          enabled: nil,
          # Maximum combined length of passages per result.
          max_characters: nil
        )
        end

        sig do
          override.returns({ enabled: T::Boolean, max_characters: Integer })
        end
        def to_hash
        end
      end

      class MarkdownOptions < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebSearchParams::MarkdownOptions,
              ContextDev::Internal::AnyHash
            )
          end

        # Scrape each result to Markdown. Adds 1 credit per 10 results.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :enabled

        sig { params(enabled: T::Boolean).void }
        attr_writer :enabled

        # Render iframe contents into the Markdown.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_frames

        sig { params(include_frames: T::Boolean).void }
        attr_writer :include_frames

        # Emit image references in the Markdown.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_images

        sig { params(include_images: T::Boolean).void }
        attr_writer :include_images

        # Keep hyperlinks in the Markdown.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_links

        sig { params(include_links: T::Boolean).void }
        attr_writer :include_links

        # Maximum cache age in milliseconds for result page content. Defaults to 180 days
        # (15552000000 ms) when Markdown is requested, or 365 days (31536000000 ms) when
        # only highlights are requested. Explicit values override either default. Maximum:
        # 365 days. Set to 0 to force a fresh scrape.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_age_ms

        sig { params(max_age_ms: Integer).void }
        attr_writer :max_age_ms

        # PDF handling. Use start/end to bound text extraction and OCR to a page range.
        sig do
          returns(T.nilable(ContextDev::WebSearchParams::MarkdownOptions::Pdf))
        end
        attr_reader :pdf

        sig do
          params(
            pdf: ContextDev::WebSearchParams::MarkdownOptions::Pdf::OrHash
          ).void
        end
        attr_writer :pdf

        # Truncate inline base64 image payloads to keep responses small.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :shorten_base64_images

        sig { params(shorten_base64_images: T::Boolean).void }
        attr_writer :shorten_base64_images

        # Request deadline and what to return when it passes.
        sig do
          returns(
            T.nilable(ContextDev::WebSearchParams::MarkdownOptions::TimeoutOpts)
          )
        end
        attr_reader :timeout_opts

        sig do
          params(
            timeout_opts:
              ContextDev::WebSearchParams::MarkdownOptions::TimeoutOpts::OrHash
          ).void
        end
        attr_writer :timeout_opts

        # Strip nav, header, footer, and sidebar — keep only the primary article content.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :use_main_content_only

        sig { params(use_main_content_only: T::Boolean).void }
        attr_writer :use_main_content_only

        # Extra wait after page load before rendering, in ms (0–30000). Useful for
        # JS-heavy pages.
        sig { returns(T.nilable(Integer)) }
        attr_reader :wait_for_ms

        sig { params(wait_for_ms: Integer).void }
        attr_writer :wait_for_ms

        # Inline Markdown scraping for each result. Set `enabled: true` to activate.
        sig do
          params(
            enabled: T::Boolean,
            include_frames: T::Boolean,
            include_images: T::Boolean,
            include_links: T::Boolean,
            max_age_ms: Integer,
            pdf: ContextDev::WebSearchParams::MarkdownOptions::Pdf::OrHash,
            shorten_base64_images: T::Boolean,
            timeout_opts:
              ContextDev::WebSearchParams::MarkdownOptions::TimeoutOpts::OrHash,
            use_main_content_only: T::Boolean,
            wait_for_ms: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Scrape each result to Markdown. Adds 1 credit per 10 results.
          enabled: nil,
          # Render iframe contents into the Markdown.
          include_frames: nil,
          # Emit image references in the Markdown.
          include_images: nil,
          # Keep hyperlinks in the Markdown.
          include_links: nil,
          # Maximum cache age in milliseconds for result page content. Defaults to 180 days
          # (15552000000 ms) when Markdown is requested, or 365 days (31536000000 ms) when
          # only highlights are requested. Explicit values override either default. Maximum:
          # 365 days. Set to 0 to force a fresh scrape.
          max_age_ms: nil,
          # PDF handling. Use start/end to bound text extraction and OCR to a page range.
          pdf: nil,
          # Truncate inline base64 image payloads to keep responses small.
          shorten_base64_images: nil,
          # Request deadline and what to return when it passes.
          timeout_opts: nil,
          # Strip nav, header, footer, and sidebar — keep only the primary article content.
          use_main_content_only: nil,
          # Extra wait after page load before rendering, in ms (0–30000). Useful for
          # JS-heavy pages.
          wait_for_ms: nil
        )
        end

        sig do
          override.returns(
            {
              enabled: T::Boolean,
              include_frames: T::Boolean,
              include_images: T::Boolean,
              include_links: T::Boolean,
              max_age_ms: Integer,
              pdf: ContextDev::WebSearchParams::MarkdownOptions::Pdf,
              shorten_base64_images: T::Boolean,
              timeout_opts:
                ContextDev::WebSearchParams::MarkdownOptions::TimeoutOpts,
              use_main_content_only: T::Boolean,
              wait_for_ms: Integer
            }
          )
        end
        def to_hash
        end

        class Pdf < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::WebSearchParams::MarkdownOptions::Pdf,
                ContextDev::Internal::AnyHash
              )
            end

          # Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must
          # be >= start.
          sig { returns(T.nilable(Integer)) }
          attr_reader :end_

          sig { params(end_: Integer).void }
          attr_writer :end_

          # Parse PDF URLs. When false, PDF results are skipped with WEBSITE_ACCESS_ERROR.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :should_parse

          sig { params(should_parse: T::Boolean).void }
          attr_writer :should_parse

          # First PDF page to parse (1-based, inclusive). Defaults to page 1.
          sig { returns(T.nilable(Integer)) }
          attr_reader :start

          sig { params(start: Integer).void }
          attr_writer :start

          # PDF handling. Use start/end to bound text extraction and OCR to a page range.
          sig do
            params(
              end_: Integer,
              should_parse: T::Boolean,
              start: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must
            # be >= start.
            end_: nil,
            # Parse PDF URLs. When false, PDF results are skipped with WEBSITE_ACCESS_ERROR.
            should_parse: nil,
            # First PDF page to parse (1-based, inclusive). Defaults to page 1.
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
                ContextDev::WebSearchParams::MarkdownOptions::TimeoutOpts,
                ContextDev::Internal::AnyHash
              )
            end

          # Deadline in milliseconds.
          sig { returns(Integer) }
          attr_accessor :milliseconds

          # "fail" returns 408 at the deadline. "return-partial" returns available results;
          # inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
          sig do
            returns(
              T.nilable(
                ContextDev::WebSearchParams::MarkdownOptions::TimeoutOpts::Behavior::OrSymbol
              )
            )
          end
          attr_reader :behavior

          sig do
            params(
              behavior:
                ContextDev::WebSearchParams::MarkdownOptions::TimeoutOpts::Behavior::OrSymbol
            ).void
          end
          attr_writer :behavior

          # Request deadline and what to return when it passes.
          sig do
            params(
              milliseconds: Integer,
              behavior:
                ContextDev::WebSearchParams::MarkdownOptions::TimeoutOpts::Behavior::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Deadline in milliseconds.
            milliseconds:,
            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
            behavior: nil
          )
          end

          sig do
            override.returns(
              {
                milliseconds: Integer,
                behavior:
                  ContextDev::WebSearchParams::MarkdownOptions::TimeoutOpts::Behavior::OrSymbol
              }
            )
          end
          def to_hash
          end

          # "fail" returns 408 at the deadline. "return-partial" returns available results;
          # inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
          module Behavior
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::WebSearchParams::MarkdownOptions::TimeoutOpts::Behavior
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FAIL =
              T.let(
                :fail,
                ContextDev::WebSearchParams::MarkdownOptions::TimeoutOpts::Behavior::TaggedSymbol
              )
            RETURN_PARTIAL =
              T.let(
                :"return-partial",
                ContextDev::WebSearchParams::MarkdownOptions::TimeoutOpts::Behavior::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::WebSearchParams::MarkdownOptions::TimeoutOpts::Behavior::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebSearchParams::TimeoutOpts,
              ContextDev::Internal::AnyHash
            )
          end

        # Deadline in milliseconds.
        sig { returns(Integer) }
        attr_accessor :milliseconds

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag.
        sig do
          returns(
            T.nilable(
              ContextDev::WebSearchParams::TimeoutOpts::Behavior::OrSymbol
            )
          )
        end
        attr_reader :behavior

        sig do
          params(
            behavior:
              ContextDev::WebSearchParams::TimeoutOpts::Behavior::OrSymbol
          ).void
        end
        attr_writer :behavior

        # Request deadline and what to return when it passes.
        sig do
          params(
            milliseconds: Integer,
            behavior:
              ContextDev::WebSearchParams::TimeoutOpts::Behavior::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Deadline in milliseconds.
          milliseconds:,
          # "fail" returns 408 at the deadline. "return-partial" returns available results;
          # inspect the response’s partial flag.
          behavior: nil
        )
        end

        sig do
          override.returns(
            {
              milliseconds: Integer,
              behavior:
                ContextDev::WebSearchParams::TimeoutOpts::Behavior::OrSymbol
            }
          )
        end
        def to_hash
        end

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag.
        module Behavior
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::WebSearchParams::TimeoutOpts::Behavior)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAIL =
            T.let(
              :fail,
              ContextDev::WebSearchParams::TimeoutOpts::Behavior::TaggedSymbol
            )
          RETURN_PARTIAL =
            T.let(
              :"return-partial",
              ContextDev::WebSearchParams::TimeoutOpts::Behavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebSearchParams::TimeoutOpts::Behavior::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::WebSearchParams::Zdr) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(:enabled, ContextDev::WebSearchParams::Zdr::TaggedSymbol)
        DISABLED =
          T.let(:disabled, ContextDev::WebSearchParams::Zdr::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::WebSearchParams::Zdr::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
