# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#web_crawl_md
    class WebWebCrawlMdParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute url
      #   Start URL, including `http://` or `https://`.
      #
      #   @return [String]
      required :url, String

      # @!attribute country
      #   Country to fetch from, as an ISO 3166-1 alpha-2 code.
      #
      #   @return [Symbol, ContextDev::Models::WebWebCrawlMdParams::Country, nil]
      optional :country, enum: -> { ContextDev::WebWebCrawlMdParams::Country }

      # @!attribute exclude_selectors
      #   Remove elements matching these CSS selectors. Overrides `includeSelectors`.
      #
      #   @return [Array<String>, nil]
      optional :exclude_selectors,
               ContextDev::Internal::Type::ArrayOf[String],
               api_name: :excludeSelectors,
               nil?: true

      # @!attribute exclude_url_regex
      #   Never follow or scrape URLs matching this regex, even when they match
      #   `urlRegex`. The start URL is always scraped.
      #
      #   @return [String, nil]
      optional :exclude_url_regex, String, api_name: :excludeUrlRegex

      # @!attribute follow_subdomains
      #   Follow links to subdomains of the start URL's domain, such as `docs.example.com`
      #   from `example.com`. `www` and the apex domain always count as the same site.
      #
      #   @return [Boolean, nil]
      optional :follow_subdomains, ContextDev::Internal::Type::Boolean, api_name: :followSubdomains

      # @!attribute include_frames
      #   Which iframe contents to include in each page's Markdown. `auto` inlines only
      #   iframes that hold page content, such as same-site documents, framesets, job
      #   boards, forms, and embedded documents, and skips ads and widgets. `true` inlines
      #   every iframe; `false` inlines none.
      #
      #   @return [Boolean, Symbol, ContextDev::Models::WebWebCrawlMdParams::IncludeFrames, nil]
      optional :include_frames,
               union: -> { ContextDev::WebWebCrawlMdParams::IncludeFrames },
               api_name: :includeFrames

      # @!attribute include_images
      #   Include image references in the Markdown (`html-conversion` only).
      #
      #   @return [Boolean, nil]
      optional :include_images, ContextDev::Internal::Type::Boolean, api_name: :includeImages

      # @!attribute include_links
      #   Keep link URLs in the Markdown (`html-conversion` only).
      #
      #   @return [Boolean, nil]
      optional :include_links, ContextDev::Internal::Type::Boolean, api_name: :includeLinks

      # @!attribute include_selectors
      #   Keep only elements matching these CSS selectors.
      #
      #   @return [Array<String>, nil]
      optional :include_selectors,
               ContextDev::Internal::Type::ArrayOf[String],
               api_name: :includeSelectors,
               nil?: true

      # @!attribute max_age_ms
      #   Maximum age of a cached result, in milliseconds. `0` always fetches fresh.
      #   Defaults to 1 day (86400000 ms). Maximum: 30 days (2592000000 ms).
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer, api_name: :maxAgeMs, nil?: true

      # @!attribute max_depth
      #   Maximum link depth from the start URL. `0` crawls only the start URL. Omit for
      #   no depth limit.
      #
      #   @return [Integer, nil]
      optional :max_depth, Integer, api_name: :maxDepth

      # @!attribute max_pages
      #   Maximum number of pages to crawl.
      #
      #   @return [Integer, nil]
      optional :max_pages, Integer, api_name: :maxPages

      # @!attribute pdf
      #   Whether to parse PDFs and which pages to read.
      #
      #   @return [ContextDev::Models::WebWebCrawlMdParams::Pdf, nil]
      optional :pdf, -> { ContextDev::WebWebCrawlMdParams::Pdf }

      # @!attribute policies
      #   Access policy IDs to apply; each URL must pass all of them. Requires access
      #   policies enabled for your organization; otherwise returns
      #   `ACCESS_POLICIES_NOT_ENABLED`.
      #
      #   @return [Array<String>, nil]
      optional :policies, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute settle_animations
      #   Wait briefly for CSS animations and transitions to settle before reading each
      #   page.
      #
      #   @return [Boolean, nil]
      optional :settle_animations, ContextDev::Internal::Type::Boolean, api_name: :settleAnimations

      # @!attribute shorten_base64_images
      #   Shorten inline base64 image data (`html-conversion` only).
      #
      #   @return [Boolean, nil]
      optional :shorten_base64_images, ContextDev::Internal::Type::Boolean, api_name: :shortenBase64Images

      # @!attribute source_preference
      #   Markdown sources in order of preference: `html-conversion` converts the page
      #   HTML, `markdown-direct` uses Markdown the site publishes.
      #
      #   @return [Array<Symbol, ContextDev::Models::WebWebCrawlMdParams::SourcePreference>, nil]
      optional :source_preference,
               -> {
                 ContextDev::Internal::Type::ArrayOf[enum: ContextDev::WebWebCrawlMdParams::SourcePreference]
               },
               api_name: :sourcePreference

      # @!attribute stop_after_ms
      #   Soft time budget for the crawl, in milliseconds. When it runs out, the crawl
      #   returns the pages collected so far. Larger values are capped at 110 seconds.
      #
      #   @return [Integer, nil]
      optional :stop_after_ms, Integer, api_name: :stopAfterMs

      # @!attribute tags
      #   Labels for this request. Filter usage and request logs by them in the dashboard
      #   or with `GET /org/logs`.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Request deadline and what to return when it passes.
      #
      #   @return [ContextDev::Models::WebWebCrawlMdParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::WebWebCrawlMdParams::TimeoutOpts }, api_name: :timeoutOpts

      # @!attribute url_regex
      #   Only follow and scrape URLs matching this regex. A prefix pattern of the form
      #   `^<start URL>` also follows a redirect of the start page.
      #
      #   @return [String, nil]
      optional :url_regex, String, api_name: :urlRegex

      # @!attribute use_main_content_only
      #   Keep only the main content, without navigation, headers, footers, or sidebars.
      #
      #   @return [Boolean, nil]
      optional :use_main_content_only, ContextDev::Internal::Type::Boolean, api_name: :useMainContentOnly

      # @!attribute wait_for_ms
      #   Time to wait after each page loads before reading it, in milliseconds. `0` waits
      #   500 ms. `timeoutOpts.milliseconds` must be at least `waitForMs` plus 10000 ms,
      #   or the request fails with `TIMEOUT_TOO_SHORT_FOR_WAIT`.
      #
      #   @return [Integer, nil]
      optional :wait_for_ms, Integer, api_name: :waitForMs, nil?: true

      # @!attribute zdr
      #   `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      #   your organization has ZDR.
      #
      #   @return [Symbol, ContextDev::Models::WebWebCrawlMdParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebWebCrawlMdParams::Zdr }

      # @!method initialize(url:, country: nil, exclude_selectors: nil, exclude_url_regex: nil, follow_subdomains: nil, include_frames: nil, include_images: nil, include_links: nil, include_selectors: nil, max_age_ms: nil, max_depth: nil, max_pages: nil, pdf: nil, policies: nil, settle_animations: nil, shorten_base64_images: nil, source_preference: nil, stop_after_ms: nil, tags: nil, timeout_opts: nil, url_regex: nil, use_main_content_only: nil, wait_for_ms: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebCrawlMdParams} for more details.
      #
      #   @param url [String] Start URL, including `http://` or `https://`.
      #
      #   @param country [Symbol, ContextDev::Models::WebWebCrawlMdParams::Country] Country to fetch from, as an ISO 3166-1 alpha-2 code.
      #
      #   @param exclude_selectors [Array<String>, nil] Remove elements matching these CSS selectors. Overrides `includeSelectors`.
      #
      #   @param exclude_url_regex [String] Never follow or scrape URLs matching this regex, even when they match `urlRegex`
      #
      #   @param follow_subdomains [Boolean] Follow links to subdomains of the start URL's domain, such as `docs.example.com`
      #
      #   @param include_frames [Boolean, Symbol, ContextDev::Models::WebWebCrawlMdParams::IncludeFrames] Which iframe contents to include in each page's Markdown. `auto` inlines only if
      #
      #   @param include_images [Boolean] Include image references in the Markdown (`html-conversion` only).
      #
      #   @param include_links [Boolean] Keep link URLs in the Markdown (`html-conversion` only).
      #
      #   @param include_selectors [Array<String>, nil] Keep only elements matching these CSS selectors.
      #
      #   @param max_age_ms [Integer, nil] Maximum age of a cached result, in milliseconds. `0` always fetches fresh. Defau
      #
      #   @param max_depth [Integer] Maximum link depth from the start URL. `0` crawls only the start URL. Omit for n
      #
      #   @param max_pages [Integer] Maximum number of pages to crawl.
      #
      #   @param pdf [ContextDev::Models::WebWebCrawlMdParams::Pdf] Whether to parse PDFs and which pages to read.
      #
      #   @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
      #
      #   @param settle_animations [Boolean] Wait briefly for CSS animations and transitions to settle before reading each pa
      #
      #   @param shorten_base64_images [Boolean] Shorten inline base64 image data (`html-conversion` only).
      #
      #   @param source_preference [Array<Symbol, ContextDev::Models::WebWebCrawlMdParams::SourcePreference>] Markdown sources in order of preference: `html-conversion` converts the page HTM
      #
      #   @param stop_after_ms [Integer] Soft time budget for the crawl, in milliseconds. When it runs out, the crawl ret
      #
      #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
      #
      #   @param timeout_opts [ContextDev::Models::WebWebCrawlMdParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      #   @param url_regex [String] Only follow and scrape URLs matching this regex. A prefix pattern of the form `^
      #
      #   @param use_main_content_only [Boolean] Keep only the main content, without navigation, headers, footers, or sidebars.
      #
      #   @param wait_for_ms [Integer, nil] Time to wait after each page loads before reading it, in milliseconds. `0` waits
      #
      #   @param zdr [Symbol, ContextDev::Models::WebWebCrawlMdParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

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

      # Which iframe contents to include in each page's Markdown. `auto` inlines only
      # iframes that hold page content, such as same-site documents, framesets, job
      # boards, forms, and embedded documents, and skips ads and widgets. `true` inlines
      # every iframe; `false` inlines none.
      module IncludeFrames
        extend ContextDev::Internal::Type::Union

        variant ContextDev::Internal::Type::Boolean

        variant const: -> { ContextDev::Models::WebWebCrawlMdParams::IncludeFrames::AUTO }

        # @!method self.variants
        #   @return [Array(Boolean, Symbol)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(T::Boolean, ContextDev::WebWebCrawlMdParams::IncludeFrames::TaggedSymbol) }
        end

        # @!group

        AUTO = :auto

        # @!endgroup
      end

      class Pdf < ContextDev::Internal::Type::BaseModel
        # @!attribute end_
        #   Last page to parse. Defaults to the last page. Must be at least `start`.
        #
        #   @return [Integer, nil]
        optional :end_, Integer, api_name: :end

        # @!attribute ocr
        #   Read scanned PDF pages with OCR. Pages that already have text are kept as is.
        #
        #   @return [Boolean, nil]
        optional :ocr, ContextDev::Internal::Type::Boolean

        # @!attribute should_parse
        #   Parse PDF pages. When `false`, PDFs are left out of the results and not counted
        #   as failures.
        #
        #   @return [Boolean, nil]
        optional :should_parse, ContextDev::Internal::Type::Boolean, api_name: :shouldParse

        # @!attribute start
        #   First page to parse, starting at 1.
        #
        #   @return [Integer, nil]
        optional :start, Integer

        # @!method initialize(end_: nil, ocr: nil, should_parse: nil, start: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebCrawlMdParams::Pdf} for more details.
        #
        #   Whether to parse PDFs and which pages to read.
        #
        #   @param end_ [Integer] Last page to parse. Defaults to the last page. Must be at least `start`.
        #
        #   @param ocr [Boolean] Read scanned PDF pages with OCR. Pages that already have text are kept as is.
        #
        #   @param should_parse [Boolean] Parse PDF pages. When `false`, PDFs are left out of the results and not counted
        #
        #   @param start [Integer] First page to parse, starting at 1.
      end

      module SourcePreference
        extend ContextDev::Internal::Type::Enum

        HTML_CONVERSION = :"html-conversion"
        MARKDOWN_DIRECT = :"markdown-direct"

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
        #   collected so far and marks the response as partial.
        #
        #   @return [Symbol, ContextDev::Models::WebWebCrawlMdParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::WebWebCrawlMdParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebCrawlMdParams::TimeoutOpts} for more details.
        #
        #   Request deadline and what to return when it passes.
        #
        #   @param milliseconds [Integer] Deadline in milliseconds.
        #
        #   @param behavior [Symbol, ContextDev::Models::WebWebCrawlMdParams::TimeoutOpts::Behavior] `fail` returns 408 at the deadline. `return-partial` returns the results collect

        # `fail` returns 408 at the deadline. `return-partial` returns the results
        # collected so far and marks the response as partial.
        #
        # @see ContextDev::Models::WebWebCrawlMdParams::TimeoutOpts#behavior
        module Behavior
          extend ContextDev::Internal::Type::Enum

          FAIL = :fail
          RETURN_PARTIAL = :"return-partial"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
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
