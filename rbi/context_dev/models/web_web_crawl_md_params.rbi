# typed: strong

module ContextDev
  module Models
    class WebWebCrawlMdParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::WebWebCrawlMdParams, ContextDev::Internal::AnyHash)
        end

      # Start URL, including `http://` or `https://`.
      sig { returns(String) }
      attr_accessor :url

      # Country to fetch from, as an ISO 3166-1 alpha-2 code.
      sig do
        returns(T.nilable(ContextDev::WebWebCrawlMdParams::Country::OrSymbol))
      end
      attr_reader :country

      sig do
        params(country: ContextDev::WebWebCrawlMdParams::Country::OrSymbol).void
      end
      attr_writer :country

      # Remove elements matching these CSS selectors. Overrides `includeSelectors`.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :exclude_selectors

      # Never follow or scrape URLs matching this regex, even when they match
      # `urlRegex`. The start URL is always scraped.
      sig { returns(T.nilable(String)) }
      attr_reader :exclude_url_regex

      sig { params(exclude_url_regex: String).void }
      attr_writer :exclude_url_regex

      # Follow links to subdomains of the start URL's domain, such as `docs.example.com`
      # from `example.com`. `www` and the apex domain always count as the same site.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :follow_subdomains

      sig { params(follow_subdomains: T::Boolean).void }
      attr_writer :follow_subdomains

      # Which iframe contents to include in each page's Markdown. `auto` inlines only
      # iframes that hold page content, such as same-site documents, framesets, job
      # boards, forms, and embedded documents, and skips ads and widgets. `true` inlines
      # every iframe; `false` inlines none.
      sig do
        returns(
          T.nilable(
            T.any(
              T::Boolean,
              ContextDev::WebWebCrawlMdParams::IncludeFrames::OrSymbol
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
              ContextDev::WebWebCrawlMdParams::IncludeFrames::OrSymbol
            )
        ).void
      end
      attr_writer :include_frames

      # Include image references in the Markdown (`html-conversion` only).
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_images

      sig { params(include_images: T::Boolean).void }
      attr_writer :include_images

      # Keep link URLs in the Markdown (`html-conversion` only).
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_links

      sig { params(include_links: T::Boolean).void }
      attr_writer :include_links

      # Keep only elements matching these CSS selectors.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :include_selectors

      # Maximum age of a cached result, in milliseconds. `0` always fetches fresh.
      # Defaults to 1 day (86400000 ms). Maximum: 30 days (2592000000 ms).
      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_age_ms

      # Maximum link depth from the start URL. `0` crawls only the start URL. Omit for
      # no depth limit.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_depth

      sig { params(max_depth: Integer).void }
      attr_writer :max_depth

      # Maximum number of pages to crawl.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_pages

      sig { params(max_pages: Integer).void }
      attr_writer :max_pages

      # Whether to parse PDFs and which pages to read.
      sig { returns(T.nilable(ContextDev::WebWebCrawlMdParams::Pdf)) }
      attr_reader :pdf

      sig { params(pdf: ContextDev::WebWebCrawlMdParams::Pdf::OrHash).void }
      attr_writer :pdf

      # Access policy IDs to apply; each URL must pass all of them. Requires access
      # policies enabled for your organization; otherwise returns
      # `ACCESS_POLICIES_NOT_ENABLED`.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :policies

      sig { params(policies: T::Array[String]).void }
      attr_writer :policies

      # Wait briefly for CSS animations and transitions to settle before reading each
      # page.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :settle_animations

      sig { params(settle_animations: T::Boolean).void }
      attr_writer :settle_animations

      # Shorten inline base64 image data (`html-conversion` only).
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :shorten_base64_images

      sig { params(shorten_base64_images: T::Boolean).void }
      attr_writer :shorten_base64_images

      # Markdown sources in order of preference: `html-conversion` converts the page
      # HTML, `markdown-direct` uses Markdown the site publishes.
      sig do
        returns(
          T.nilable(
            T::Array[
              ContextDev::WebWebCrawlMdParams::SourcePreference::OrSymbol
            ]
          )
        )
      end
      attr_reader :source_preference

      sig do
        params(
          source_preference:
            T::Array[
              ContextDev::WebWebCrawlMdParams::SourcePreference::OrSymbol
            ]
        ).void
      end
      attr_writer :source_preference

      # Soft time budget for the crawl, in milliseconds. When it runs out, the crawl
      # returns the pages collected so far. Larger values are capped at 110 seconds.
      sig { returns(T.nilable(Integer)) }
      attr_reader :stop_after_ms

      sig { params(stop_after_ms: Integer).void }
      attr_writer :stop_after_ms

      # Labels for this request. Filter usage and request logs by them in the dashboard
      # or with `GET /org/logs`.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Request deadline and what to return when it passes.
      sig { returns(T.nilable(ContextDev::WebWebCrawlMdParams::TimeoutOpts)) }
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts: ContextDev::WebWebCrawlMdParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      # Only follow and scrape URLs matching this regex. A prefix pattern of the form
      # `^<start URL>` also follows a redirect of the start page.
      sig { returns(T.nilable(String)) }
      attr_reader :url_regex

      sig { params(url_regex: String).void }
      attr_writer :url_regex

      # Keep only the main content, without navigation, headers, footers, or sidebars.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :use_main_content_only

      sig { params(use_main_content_only: T::Boolean).void }
      attr_writer :use_main_content_only

      # Time to wait after each page loads before reading it, in milliseconds. `0` waits
      # 500 ms. `timeoutOpts.milliseconds` must be at least `waitForMs` plus 10000 ms,
      # or the request fails with `TIMEOUT_TOO_SHORT_FOR_WAIT`.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :wait_for_ms

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      sig { returns(T.nilable(ContextDev::WebWebCrawlMdParams::Zdr::OrSymbol)) }
      attr_reader :zdr

      sig { params(zdr: ContextDev::WebWebCrawlMdParams::Zdr::OrSymbol).void }
      attr_writer :zdr

      sig do
        params(
          url: String,
          country: ContextDev::WebWebCrawlMdParams::Country::OrSymbol,
          exclude_selectors: T.nilable(T::Array[String]),
          exclude_url_regex: String,
          follow_subdomains: T::Boolean,
          include_frames:
            T.any(
              T::Boolean,
              ContextDev::WebWebCrawlMdParams::IncludeFrames::OrSymbol
            ),
          include_images: T::Boolean,
          include_links: T::Boolean,
          include_selectors: T.nilable(T::Array[String]),
          max_age_ms: T.nilable(Integer),
          max_depth: Integer,
          max_pages: Integer,
          pdf: ContextDev::WebWebCrawlMdParams::Pdf::OrHash,
          policies: T::Array[String],
          settle_animations: T::Boolean,
          shorten_base64_images: T::Boolean,
          source_preference:
            T::Array[
              ContextDev::WebWebCrawlMdParams::SourcePreference::OrSymbol
            ],
          stop_after_ms: Integer,
          tags: T::Array[String],
          timeout_opts: ContextDev::WebWebCrawlMdParams::TimeoutOpts::OrHash,
          url_regex: String,
          use_main_content_only: T::Boolean,
          wait_for_ms: T.nilable(Integer),
          zdr: ContextDev::WebWebCrawlMdParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Start URL, including `http://` or `https://`.
        url:,
        # Country to fetch from, as an ISO 3166-1 alpha-2 code.
        country: nil,
        # Remove elements matching these CSS selectors. Overrides `includeSelectors`.
        exclude_selectors: nil,
        # Never follow or scrape URLs matching this regex, even when they match
        # `urlRegex`. The start URL is always scraped.
        exclude_url_regex: nil,
        # Follow links to subdomains of the start URL's domain, such as `docs.example.com`
        # from `example.com`. `www` and the apex domain always count as the same site.
        follow_subdomains: nil,
        # Which iframe contents to include in each page's Markdown. `auto` inlines only
        # iframes that hold page content, such as same-site documents, framesets, job
        # boards, forms, and embedded documents, and skips ads and widgets. `true` inlines
        # every iframe; `false` inlines none.
        include_frames: nil,
        # Include image references in the Markdown (`html-conversion` only).
        include_images: nil,
        # Keep link URLs in the Markdown (`html-conversion` only).
        include_links: nil,
        # Keep only elements matching these CSS selectors.
        include_selectors: nil,
        # Maximum age of a cached result, in milliseconds. `0` always fetches fresh.
        # Defaults to 1 day (86400000 ms). Maximum: 30 days (2592000000 ms).
        max_age_ms: nil,
        # Maximum link depth from the start URL. `0` crawls only the start URL. Omit for
        # no depth limit.
        max_depth: nil,
        # Maximum number of pages to crawl.
        max_pages: nil,
        # Whether to parse PDFs and which pages to read.
        pdf: nil,
        # Access policy IDs to apply; each URL must pass all of them. Requires access
        # policies enabled for your organization; otherwise returns
        # `ACCESS_POLICIES_NOT_ENABLED`.
        policies: nil,
        # Wait briefly for CSS animations and transitions to settle before reading each
        # page.
        settle_animations: nil,
        # Shorten inline base64 image data (`html-conversion` only).
        shorten_base64_images: nil,
        # Markdown sources in order of preference: `html-conversion` converts the page
        # HTML, `markdown-direct` uses Markdown the site publishes.
        source_preference: nil,
        # Soft time budget for the crawl, in milliseconds. When it runs out, the crawl
        # returns the pages collected so far. Larger values are capped at 110 seconds.
        stop_after_ms: nil,
        # Labels for this request. Filter usage and request logs by them in the dashboard
        # or with `GET /org/logs`.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # Only follow and scrape URLs matching this regex. A prefix pattern of the form
        # `^<start URL>` also follows a redirect of the start page.
        url_regex: nil,
        # Keep only the main content, without navigation, headers, footers, or sidebars.
        use_main_content_only: nil,
        # Time to wait after each page loads before reading it, in milliseconds. `0` waits
        # 500 ms. `timeoutOpts.milliseconds` must be at least `waitForMs` plus 10000 ms,
        # or the request fails with `TIMEOUT_TOO_SHORT_FOR_WAIT`.
        wait_for_ms: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            url: String,
            country: ContextDev::WebWebCrawlMdParams::Country::OrSymbol,
            exclude_selectors: T.nilable(T::Array[String]),
            exclude_url_regex: String,
            follow_subdomains: T::Boolean,
            include_frames:
              T.any(
                T::Boolean,
                ContextDev::WebWebCrawlMdParams::IncludeFrames::OrSymbol
              ),
            include_images: T::Boolean,
            include_links: T::Boolean,
            include_selectors: T.nilable(T::Array[String]),
            max_age_ms: T.nilable(Integer),
            max_depth: Integer,
            max_pages: Integer,
            pdf: ContextDev::WebWebCrawlMdParams::Pdf,
            policies: T::Array[String],
            settle_animations: T::Boolean,
            shorten_base64_images: T::Boolean,
            source_preference:
              T::Array[
                ContextDev::WebWebCrawlMdParams::SourcePreference::OrSymbol
              ],
            stop_after_ms: Integer,
            tags: T::Array[String],
            timeout_opts: ContextDev::WebWebCrawlMdParams::TimeoutOpts,
            url_regex: String,
            use_main_content_only: T::Boolean,
            wait_for_ms: T.nilable(Integer),
            zdr: ContextDev::WebWebCrawlMdParams::Zdr::OrSymbol,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Country to fetch from, as an ISO 3166-1 alpha-2 code.
      module Country
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebWebCrawlMdParams::Country)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AD = T.let(:ad, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        AE = T.let(:ae, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        AF = T.let(:af, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        AG = T.let(:ag, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        AI = T.let(:ai, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        AL = T.let(:al, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        AM = T.let(:am, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        AO = T.let(:ao, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        AR = T.let(:ar, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        AT = T.let(:at, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        AU = T.let(:au, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        AW = T.let(:aw, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        AZ = T.let(:az, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BA = T.let(:ba, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BB = T.let(:bb, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BD = T.let(:bd, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BE = T.let(:be, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BF = T.let(:bf, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BG = T.let(:bg, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BH = T.let(:bh, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BI = T.let(:bi, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BJ = T.let(:bj, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BM = T.let(:bm, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BN = T.let(:bn, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BO = T.let(:bo, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BQ = T.let(:bq, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BR = T.let(:br, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BS = T.let(:bs, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BW = T.let(:bw, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BY = T.let(:by, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        BZ = T.let(:bz, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        CA = T.let(:ca, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        CD = T.let(:cd, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        CF = T.let(:cf, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        CG = T.let(:cg, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        CH = T.let(:ch, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        CI = T.let(:ci, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        CL = T.let(:cl, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        CM = T.let(:cm, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        CN = T.let(:cn, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        CO = T.let(:co, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        CR = T.let(:cr, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        CV = T.let(:cv, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        CW = T.let(:cw, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        CY = T.let(:cy, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        CZ = T.let(:cz, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        DE = T.let(:de, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        DJ = T.let(:dj, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        DK = T.let(:dk, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        DM = T.let(:dm, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        DO = T.let(:do, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        DZ = T.let(:dz, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        EC = T.let(:ec, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        EE = T.let(:ee, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        EG = T.let(:eg, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        ES = T.let(:es, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        ET = T.let(:et, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        FI = T.let(:fi, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        FJ = T.let(:fj, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        FR = T.let(:fr, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        GA = T.let(:ga, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        GB = T.let(:gb, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        GD = T.let(:gd, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        GE = T.let(:ge, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        GF = T.let(:gf, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        GG = T.let(:gg, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        GH = T.let(:gh, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        GM = T.let(:gm, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        GN = T.let(:gn, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        GP = T.let(:gp, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        GQ = T.let(:gq, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        GR = T.let(:gr, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        GT = T.let(:gt, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        GU = T.let(:gu, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        GW = T.let(:gw, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        GY = T.let(:gy, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        HK = T.let(:hk, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        HN = T.let(:hn, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        HR = T.let(:hr, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        HT = T.let(:ht, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        HU = T.let(:hu, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        ID = T.let(:id, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        IE = T.let(:ie, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        IL = T.let(:il, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        IM = T.let(:im, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        IN = T.let(:in, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        IQ = T.let(:iq, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        IR = T.let(:ir, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        IS = T.let(:is, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        IT = T.let(:it, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        JE = T.let(:je, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        JM = T.let(:jm, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        JO = T.let(:jo, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        JP = T.let(:jp, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        KE = T.let(:ke, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        KG = T.let(:kg, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        KH = T.let(:kh, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        KN = T.let(:kn, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        KR = T.let(:kr, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        KW = T.let(:kw, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        KY = T.let(:ky, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        KZ = T.let(:kz, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        LA = T.let(:la, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        LB = T.let(:lb, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        LC = T.let(:lc, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        LK = T.let(:lk, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        LR = T.let(:lr, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        LS = T.let(:ls, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        LT = T.let(:lt, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        LU = T.let(:lu, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        LV = T.let(:lv, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        LY = T.let(:ly, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MA = T.let(:ma, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MC = T.let(:mc, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MD = T.let(:md, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        ME = T.let(:me, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MF = T.let(:mf, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MG = T.let(:mg, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MK = T.let(:mk, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        ML = T.let(:ml, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MM = T.let(:mm, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MN = T.let(:mn, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MO = T.let(:mo, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MQ = T.let(:mq, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MR = T.let(:mr, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MT = T.let(:mt, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MU = T.let(:mu, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MV = T.let(:mv, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MW = T.let(:mw, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MX = T.let(:mx, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MY = T.let(:my, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        MZ = T.let(:mz, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        NA = T.let(:na, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        NC = T.let(:nc, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        NE = T.let(:ne, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        NG = T.let(:ng, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        NI = T.let(:ni, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        NL = T.let(:nl, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        NO = T.let(:no, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        NP = T.let(:np, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        NZ = T.let(:nz, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        OM = T.let(:om, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        PA = T.let(:pa, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        PE = T.let(:pe, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        PF = T.let(:pf, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        PG = T.let(:pg, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        PH = T.let(:ph, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        PK = T.let(:pk, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        PL = T.let(:pl, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        PR = T.let(:pr, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        PS = T.let(:ps, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        PT = T.let(:pt, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        PY = T.let(:py, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        QA = T.let(:qa, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        RE = T.let(:re, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        RO = T.let(:ro, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        RS = T.let(:rs, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        RU = T.let(:ru, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        RW = T.let(:rw, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        SA = T.let(:sa, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        SC = T.let(:sc, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        SD = T.let(:sd, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        SE = T.let(:se, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        SG = T.let(:sg, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        SI = T.let(:si, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        SK = T.let(:sk, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        SL = T.let(:sl, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        SM = T.let(:sm, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        SN = T.let(:sn, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        SO = T.let(:so, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        SR = T.let(:sr, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        SS = T.let(:ss, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        ST = T.let(:st, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        SV = T.let(:sv, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        SX = T.let(:sx, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        SY = T.let(:sy, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        SZ = T.let(:sz, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        TC = T.let(:tc, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        TD = T.let(:td, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        TG = T.let(:tg, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        TH = T.let(:th, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        TJ = T.let(:tj, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        TL = T.let(:tl, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        TM = T.let(:tm, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        TN = T.let(:tn, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        TR = T.let(:tr, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        TT = T.let(:tt, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        TW = T.let(:tw, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        TZ = T.let(:tz, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        UA = T.let(:ua, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        UG = T.let(:ug, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        US = T.let(:us, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        UY = T.let(:uy, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        UZ = T.let(:uz, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        VC = T.let(:vc, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        VE = T.let(:ve, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        VG = T.let(:vg, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        VI = T.let(:vi, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        VN = T.let(:vn, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        YE = T.let(:ye, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        YT = T.let(:yt, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        ZA = T.let(:za, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        ZM = T.let(:zm, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)
        ZW = T.let(:zw, ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::WebWebCrawlMdParams::Country::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Which iframe contents to include in each page's Markdown. `auto` inlines only
      # iframes that hold page content, such as same-site documents, framesets, job
      # boards, forms, and embedded documents, and skips ads and widgets. `true` inlines
      # every iframe; `false` inlines none.
      module IncludeFrames
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              T::Boolean,
              ContextDev::WebWebCrawlMdParams::IncludeFrames::TaggedSymbol
            )
          end

        sig do
          override.returns(
            T::Array[ContextDev::WebWebCrawlMdParams::IncludeFrames::Variants]
          )
        end
        def self.variants
        end

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebWebCrawlMdParams::IncludeFrames)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO =
          T.let(
            :auto,
            ContextDev::WebWebCrawlMdParams::IncludeFrames::TaggedSymbol
          )
      end

      class Pdf < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebWebCrawlMdParams::Pdf,
              ContextDev::Internal::AnyHash
            )
          end

        # Last page to parse. Defaults to the last page. Must be at least `start`.
        sig { returns(T.nilable(Integer)) }
        attr_reader :end_

        sig { params(end_: Integer).void }
        attr_writer :end_

        # Read scanned PDF pages with OCR. Pages that already have text are kept as is.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :ocr

        sig { params(ocr: T::Boolean).void }
        attr_writer :ocr

        # Parse PDF pages. When `false`, PDFs are left out of the results and not counted
        # as failures.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :should_parse

        sig { params(should_parse: T::Boolean).void }
        attr_writer :should_parse

        # First page to parse, starting at 1.
        sig { returns(T.nilable(Integer)) }
        attr_reader :start

        sig { params(start: Integer).void }
        attr_writer :start

        # Whether to parse PDFs and which pages to read.
        sig do
          params(
            end_: Integer,
            ocr: T::Boolean,
            should_parse: T::Boolean,
            start: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Last page to parse. Defaults to the last page. Must be at least `start`.
          end_: nil,
          # Read scanned PDF pages with OCR. Pages that already have text are kept as is.
          ocr: nil,
          # Parse PDF pages. When `false`, PDFs are left out of the results and not counted
          # as failures.
          should_parse: nil,
          # First page to parse, starting at 1.
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

      module SourcePreference
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebWebCrawlMdParams::SourcePreference)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        HTML_CONVERSION =
          T.let(
            :"html-conversion",
            ContextDev::WebWebCrawlMdParams::SourcePreference::TaggedSymbol
          )
        MARKDOWN_DIRECT =
          T.let(
            :"markdown-direct",
            ContextDev::WebWebCrawlMdParams::SourcePreference::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::WebWebCrawlMdParams::SourcePreference::TaggedSymbol
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
              ContextDev::WebWebCrawlMdParams::TimeoutOpts,
              ContextDev::Internal::AnyHash
            )
          end

        # Deadline in milliseconds.
        sig { returns(Integer) }
        attr_accessor :milliseconds

        # `fail` returns 408 at the deadline. `return-partial` returns the results
        # collected so far and marks the response as partial.
        sig do
          returns(
            T.nilable(
              ContextDev::WebWebCrawlMdParams::TimeoutOpts::Behavior::OrSymbol
            )
          )
        end
        attr_reader :behavior

        sig do
          params(
            behavior:
              ContextDev::WebWebCrawlMdParams::TimeoutOpts::Behavior::OrSymbol
          ).void
        end
        attr_writer :behavior

        # Request deadline and what to return when it passes.
        sig do
          params(
            milliseconds: Integer,
            behavior:
              ContextDev::WebWebCrawlMdParams::TimeoutOpts::Behavior::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Deadline in milliseconds.
          milliseconds:,
          # `fail` returns 408 at the deadline. `return-partial` returns the results
          # collected so far and marks the response as partial.
          behavior: nil
        )
        end

        sig do
          override.returns(
            {
              milliseconds: Integer,
              behavior:
                ContextDev::WebWebCrawlMdParams::TimeoutOpts::Behavior::OrSymbol
            }
          )
        end
        def to_hash
        end

        # `fail` returns 408 at the deadline. `return-partial` returns the results
        # collected so far and marks the response as partial.
        module Behavior
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::WebWebCrawlMdParams::TimeoutOpts::Behavior
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAIL =
            T.let(
              :fail,
              ContextDev::WebWebCrawlMdParams::TimeoutOpts::Behavior::TaggedSymbol
            )
          RETURN_PARTIAL =
            T.let(
              :"return-partial",
              ContextDev::WebWebCrawlMdParams::TimeoutOpts::Behavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebWebCrawlMdParams::TimeoutOpts::Behavior::TaggedSymbol
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
          T.type_alias { T.all(Symbol, ContextDev::WebWebCrawlMdParams::Zdr) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(:enabled, ContextDev::WebWebCrawlMdParams::Zdr::TaggedSymbol)
        DISABLED =
          T.let(:disabled, ContextDev::WebWebCrawlMdParams::Zdr::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::WebWebCrawlMdParams::Zdr::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
