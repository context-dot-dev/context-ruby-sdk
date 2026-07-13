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

      # The starting URL for the crawl (must include http:// or https:// protocol)
      sig { returns(String) }
      attr_accessor :url

      # Two-letter ISO 3166-1 alpha-2 country code identifying a supported Context.dev
      # residential proxy exit location. Must be one of Context.dev's supported
      # countries. When provided, Context.dev fetches the target page from that country.
      sig do
        returns(T.nilable(ContextDev::WebWebCrawlMdParams::Country::OrSymbol))
      end
      attr_reader :country

      sig do
        params(country: ContextDev::WebWebCrawlMdParams::Country::OrSymbol).void
      end
      attr_writer :country

      # CSS selectors to remove before each crawled page is converted to Markdown.
      # Applied after includeSelectors. Exclusion takes precedence: an element matching
      # both is removed. Examples: "nav", "footer", ".ad-banner", "[aria-hidden=true]".
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :exclude_selectors

      sig { params(exclude_selectors: T::Array[String]).void }
      attr_writer :exclude_selectors

      # When true, follow links on subdomains of the starting URL's domain (e.g.
      # docs.example.com when starting from example.com). www and apex are always
      # treated as equivalent.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :follow_subdomains

      sig { params(follow_subdomains: T::Boolean).void }
      attr_writer :follow_subdomains

      # When true, the contents of iframes are rendered to Markdown for each crawled
      # page.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_frames

      sig { params(include_frames: T::Boolean).void }
      attr_writer :include_frames

      # Include image references in the Markdown output
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_images

      sig { params(include_images: T::Boolean).void }
      attr_writer :include_images

      # Preserve hyperlinks in the Markdown output
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_links

      sig { params(include_links: T::Boolean).void }
      attr_writer :include_links

      # CSS selectors. When provided, only matching HTML subtrees (and their
      # descendants) are kept before each crawled page is converted to Markdown. When
      # omitted, the entire document is kept. Examples: "article.main", "#content",
      # "[role=main]".
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :include_selectors

      sig { params(include_selectors: T::Array[String]).void }
      attr_writer :include_selectors

      # Return a cached result if a prior scrape for the same parameters exists and is
      # younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
      # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_age_ms

      sig { params(max_age_ms: Integer).void }
      attr_writer :max_age_ms

      # Maximum link depth from the starting URL (0 = only the starting page)
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_depth

      sig { params(max_depth: Integer).void }
      attr_writer :max_depth

      # Maximum number of pages to crawl. Hard cap: 500.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_pages

      sig { params(max_pages: Integer).void }
      attr_writer :max_pages

      # PDF parsing controls. Use start/end to limit text extraction and embedded-image
      # detection/OCR to an inclusive 1-based page range.
      sig { returns(T.nilable(ContextDev::WebWebCrawlMdParams::Pdf)) }
      attr_reader :pdf

      sig { params(pdf: ContextDev::WebWebCrawlMdParams::Pdf::OrHash).void }
      attr_writer :pdf

      # When true, waits briefly for CSS and transition animations to settle before
      # extracting each crawled page. Defaults to false. This adds a bit of latency in
      # exchange for more stable output on animated pages.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :settle_animations

      sig { params(settle_animations: T::Boolean).void }
      attr_writer :settle_animations

      # Truncate base64-encoded image data in the Markdown output
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :shorten_base64_images

      sig { params(shorten_base64_images: T::Boolean).void }
      attr_writer :shorten_base64_images

      # Soft time budget for the crawl in milliseconds. After each scrape, the crawler
      # checks the elapsed time and, if exceeded, returns the pages collected so far
      # instead of continuing. Min: 10000 (10s). Max: 110000 (110s). Default: 80000
      # (80s).
      sig { returns(T.nilable(Integer)) }
      attr_reader :stop_after_ms

      sig { params(stop_after_ms: Integer).void }
      attr_writer :stop_after_ms

      # Optional caller-defined tags for tracking this request. Tags are recorded on the
      # request's usage log and can be used to filter usage on the dashboard usage page.
      # Up to 20 tags, each 1-50 characters.
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

      # Regex pattern. Only URLs matching this pattern will be followed and scraped.
      sig { returns(T.nilable(String)) }
      attr_reader :url_regex

      sig { params(url_regex: String).void }
      attr_writer :url_regex

      # Extract only the main content, stripping headers, footers, sidebars, and
      # navigation
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :use_main_content_only

      sig { params(use_main_content_only: T::Boolean).void }
      attr_writer :use_main_content_only

      # Optional browser wait time in milliseconds after initial page load for each
      # crawled page. Min: 0. Max: 30000 (30 seconds).
      sig { returns(T.nilable(Integer)) }
      attr_reader :wait_for_ms

      sig { params(wait_for_ms: Integer).void }
      attr_writer :wait_for_ms

      sig do
        params(
          url: String,
          country: ContextDev::WebWebCrawlMdParams::Country::OrSymbol,
          exclude_selectors: T::Array[String],
          follow_subdomains: T::Boolean,
          include_frames: T::Boolean,
          include_images: T::Boolean,
          include_links: T::Boolean,
          include_selectors: T::Array[String],
          max_age_ms: Integer,
          max_depth: Integer,
          max_pages: Integer,
          pdf: ContextDev::WebWebCrawlMdParams::Pdf::OrHash,
          settle_animations: T::Boolean,
          shorten_base64_images: T::Boolean,
          stop_after_ms: Integer,
          tags: T::Array[String],
          timeout_ms: Integer,
          url_regex: String,
          use_main_content_only: T::Boolean,
          wait_for_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The starting URL for the crawl (must include http:// or https:// protocol)
        url:,
        # Two-letter ISO 3166-1 alpha-2 country code identifying a supported Context.dev
        # residential proxy exit location. Must be one of Context.dev's supported
        # countries. When provided, Context.dev fetches the target page from that country.
        country: nil,
        # CSS selectors to remove before each crawled page is converted to Markdown.
        # Applied after includeSelectors. Exclusion takes precedence: an element matching
        # both is removed. Examples: "nav", "footer", ".ad-banner", "[aria-hidden=true]".
        exclude_selectors: nil,
        # When true, follow links on subdomains of the starting URL's domain (e.g.
        # docs.example.com when starting from example.com). www and apex are always
        # treated as equivalent.
        follow_subdomains: nil,
        # When true, the contents of iframes are rendered to Markdown for each crawled
        # page.
        include_frames: nil,
        # Include image references in the Markdown output
        include_images: nil,
        # Preserve hyperlinks in the Markdown output
        include_links: nil,
        # CSS selectors. When provided, only matching HTML subtrees (and their
        # descendants) are kept before each crawled page is converted to Markdown. When
        # omitted, the entire document is kept. Examples: "article.main", "#content",
        # "[role=main]".
        include_selectors: nil,
        # Return a cached result if a prior scrape for the same parameters exists and is
        # younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
        # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
        max_age_ms: nil,
        # Maximum link depth from the starting URL (0 = only the starting page)
        max_depth: nil,
        # Maximum number of pages to crawl. Hard cap: 500.
        max_pages: nil,
        # PDF parsing controls. Use start/end to limit text extraction and embedded-image
        # detection/OCR to an inclusive 1-based page range.
        pdf: nil,
        # When true, waits briefly for CSS and transition animations to settle before
        # extracting each crawled page. Defaults to false. This adds a bit of latency in
        # exchange for more stable output on animated pages.
        settle_animations: nil,
        # Truncate base64-encoded image data in the Markdown output
        shorten_base64_images: nil,
        # Soft time budget for the crawl in milliseconds. After each scrape, the crawler
        # checks the elapsed time and, if exceeded, returns the pages collected so far
        # instead of continuing. Min: 10000 (10s). Max: 110000 (110s). Default: 80000
        # (80s).
        stop_after_ms: nil,
        # Optional caller-defined tags for tracking this request. Tags are recorded on the
        # request's usage log and can be used to filter usage on the dashboard usage page.
        # Up to 20 tags, each 1-50 characters.
        tags: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        # Regex pattern. Only URLs matching this pattern will be followed and scraped.
        url_regex: nil,
        # Extract only the main content, stripping headers, footers, sidebars, and
        # navigation
        use_main_content_only: nil,
        # Optional browser wait time in milliseconds after initial page load for each
        # crawled page. Min: 0. Max: 30000 (30 seconds).
        wait_for_ms: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            url: String,
            country: ContextDev::WebWebCrawlMdParams::Country::OrSymbol,
            exclude_selectors: T::Array[String],
            follow_subdomains: T::Boolean,
            include_frames: T::Boolean,
            include_images: T::Boolean,
            include_links: T::Boolean,
            include_selectors: T::Array[String],
            max_age_ms: Integer,
            max_depth: Integer,
            max_pages: Integer,
            pdf: ContextDev::WebWebCrawlMdParams::Pdf,
            settle_animations: T::Boolean,
            shorten_base64_images: T::Boolean,
            stop_after_ms: Integer,
            tags: T::Array[String],
            timeout_ms: Integer,
            url_regex: String,
            use_main_content_only: T::Boolean,
            wait_for_ms: Integer,
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

      class Pdf < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebWebCrawlMdParams::Pdf,
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
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :ocr

        sig { params(ocr: T::Boolean).void }
        attr_writer :ocr

        # When true, PDF pages are fetched and parsed. When false, PDF pages are skipped
        # entirely (not included in results and not counted as failures).
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :should_parse

        sig { params(should_parse: T::Boolean).void }
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
            ocr: T::Boolean,
            should_parse: T::Boolean,
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
          # When true, PDF pages are fetched and parsed. When false, PDF pages are skipped
          # entirely (not included in results and not counted as failures).
          should_parse: nil,
          # First 1-based PDF page to parse. When omitted, parsing starts at the first page.
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
    end
  end
end
