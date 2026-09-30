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
      #   Fetch from this country (ISO 3166-1 alpha-2).
      #
      #   @return [Symbol, ContextDev::Models::WebWebCrawlMdParams::Country, nil]
      optional :country, enum: -> { ContextDev::WebWebCrawlMdParams::Country }

      # @!attribute exclude_selectors
      #   Remove matching elements after inclusions. Exclusions take precedence.
      #
      #   @return [Array<String>, nil]
      optional :exclude_selectors,
               ContextDev::Internal::Type::ArrayOf[String],
               api_name: :excludeSelectors,
               nil?: true

      # @!attribute follow_subdomains
      #   When true, follow links on subdomains of the starting URL's domain (e.g.
      #   docs.example.com when starting from example.com). www and apex are always
      #   treated as equivalent.
      #
      #   @return [Boolean, nil]
      optional :follow_subdomains, ContextDev::Internal::Type::Boolean, api_name: :followSubdomains

      # @!attribute include_frames
      #   When true, the contents of iframes are rendered to Markdown for each crawled
      #   page.
      #
      #   @return [Boolean, nil]
      optional :include_frames, ContextDev::Internal::Type::Boolean, api_name: :includeFrames

      # @!attribute include_images
      #   Include image references in the Markdown output
      #
      #   @return [Boolean, nil]
      optional :include_images, ContextDev::Internal::Type::Boolean, api_name: :includeImages

      # @!attribute include_links
      #   Preserve hyperlinks in the Markdown output
      #
      #   @return [Boolean, nil]
      optional :include_links, ContextDev::Internal::Type::Boolean, api_name: :includeLinks

      # @!attribute include_selectors
      #   Keep matching HTML subtrees before converting each page to Markdown.
      #
      #   @return [Array<String>, nil]
      optional :include_selectors,
               ContextDev::Internal::Type::ArrayOf[String],
               api_name: :includeSelectors,
               nil?: true

      # @!attribute max_age_ms
      #   Maximum cache age in milliseconds. Defaults to 1 day; `0` fetches fresh.
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer, api_name: :maxAgeMs, nil?: true

      # @!attribute max_depth
      #   Maximum link depth from the starting URL (0 = only the starting page)
      #
      #   @return [Integer, nil]
      optional :max_depth, Integer, api_name: :maxDepth

      # @!attribute max_pages
      #   Maximum pages to crawl.
      #
      #   @return [Integer, nil]
      optional :max_pages, Integer, api_name: :maxPages

      # @!attribute pdf
      #   PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
      #
      #   @return [ContextDev::Models::WebWebCrawlMdParams::Pdf, nil]
      optional :pdf, -> { ContextDev::WebWebCrawlMdParams::Pdf }

      # @!attribute settle_animations
      #   Wait briefly for CSS animations and transitions to settle before reading each
      #   page.
      #
      #   @return [Boolean, nil]
      optional :settle_animations, ContextDev::Internal::Type::Boolean, api_name: :settleAnimations

      # @!attribute shorten_base64_images
      #   Truncate base64-encoded image data in the Markdown output
      #
      #   @return [Boolean, nil]
      optional :shorten_base64_images, ContextDev::Internal::Type::Boolean, api_name: :shortenBase64Images

      # @!attribute stop_after_ms
      #   Soft crawl deadline in milliseconds. Returns pages collected before the next
      #   deadline check.
      #
      #   @return [Integer, nil]
      optional :stop_after_ms, Integer, api_name: :stopAfterMs

      # @!attribute tags
      #   Labels for filtering usage in the dashboard.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Request deadline and what to return when it passes.
      #
      #   @return [ContextDev::Models::WebWebCrawlMdParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::WebWebCrawlMdParams::TimeoutOpts }, api_name: :timeoutOpts

      # @!attribute url_regex
      #   Regex pattern. Only URLs matching this pattern will be followed and scraped. An
      #   automatic prefix scope in the form ^<starting URL> follows a redirect of the
      #   starting page.
      #
      #   @return [String, nil]
      optional :url_regex, String, api_name: :urlRegex

      # @!attribute use_main_content_only
      #   Extract only the main content, stripping headers, footers, sidebars, and
      #   navigation
      #
      #   @return [Boolean, nil]
      optional :use_main_content_only, ContextDev::Internal::Type::Boolean, api_name: :useMainContentOnly

      # @!attribute wait_for_ms
      #   Browser wait time in milliseconds after initial page load for each crawled page.
      #   Defaults to 3500 (3.5 seconds). Min: 0. Max: 30000 (30 seconds).
      #
      #   @return [Integer, nil]
      optional :wait_for_ms, Integer, api_name: :waitForMs, nil?: true

      # @!attribute zdr
      #   `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      #   your organization has ZDR.
      #
      #   @return [Symbol, ContextDev::Models::WebWebCrawlMdParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebWebCrawlMdParams::Zdr }

      # @!method initialize(url:, country: nil, exclude_selectors: nil, follow_subdomains: nil, include_frames: nil, include_images: nil, include_links: nil, include_selectors: nil, max_age_ms: nil, max_depth: nil, max_pages: nil, pdf: nil, settle_animations: nil, shorten_base64_images: nil, stop_after_ms: nil, tags: nil, timeout_opts: nil, url_regex: nil, use_main_content_only: nil, wait_for_ms: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebCrawlMdParams} for more details.
      #
      #   @param url [String] Start URL, including `http://` or `https://`.
      #
      #   @param country [Symbol, ContextDev::Models::WebWebCrawlMdParams::Country] Fetch from this country (ISO 3166-1 alpha-2).
      #
      #   @param exclude_selectors [Array<String>, nil] Remove matching elements after inclusions. Exclusions take precedence.
      #
      #   @param follow_subdomains [Boolean] When true, follow links on subdomains of the starting URL's domain (e.g. docs.ex
      #
      #   @param include_frames [Boolean] When true, the contents of iframes are rendered to Markdown for each crawled pag
      #
      #   @param include_images [Boolean] Include image references in the Markdown output
      #
      #   @param include_links [Boolean] Preserve hyperlinks in the Markdown output
      #
      #   @param include_selectors [Array<String>, nil] Keep matching HTML subtrees before converting each page to Markdown.
      #
      #   @param max_age_ms [Integer, nil] Maximum cache age in milliseconds. Defaults to 1 day; `0` fetches fresh.
      #
      #   @param max_depth [Integer] Maximum link depth from the starting URL (0 = only the starting page)
      #
      #   @param max_pages [Integer] Maximum pages to crawl.
      #
      #   @param pdf [ContextDev::Models::WebWebCrawlMdParams::Pdf] PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
      #
      #   @param settle_animations [Boolean] Wait briefly for CSS animations and transitions to settle before reading each pa
      #
      #   @param shorten_base64_images [Boolean] Truncate base64-encoded image data in the Markdown output
      #
      #   @param stop_after_ms [Integer] Soft crawl deadline in milliseconds. Returns pages collected before the next dea
      #
      #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
      #
      #   @param timeout_opts [ContextDev::Models::WebWebCrawlMdParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      #   @param url_regex [String] Regex pattern. Only URLs matching this pattern will be followed and scraped. An
      #
      #   @param use_main_content_only [Boolean] Extract only the main content, stripping headers, footers, sidebars, and navigat
      #
      #   @param wait_for_ms [Integer, nil] Browser wait time in milliseconds after initial page load for each crawled page.
      #
      #   @param zdr [Symbol, ContextDev::Models::WebWebCrawlMdParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Fetch from this country (ISO 3166-1 alpha-2).
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

      class Pdf < ContextDev::Internal::Type::BaseModel
        # @!attribute end_
        #   Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must
        #   be >= start.
        #
        #   @return [Integer, nil]
        optional :end_, Integer, api_name: :end

        # @!attribute ocr
        #   Read scanned PDF pages with OCR; preserve pages that already have text.
        #
        #   @return [Boolean, nil]
        optional :ocr, ContextDev::Internal::Type::Boolean

        # @!attribute should_parse
        #   When true, PDF pages are fetched and parsed. When false, PDF pages are skipped
        #   entirely (not included in results and not counted as failures).
        #
        #   @return [Boolean, nil]
        optional :should_parse, ContextDev::Internal::Type::Boolean, api_name: :shouldParse

        # @!attribute start
        #   First 1-based PDF page to parse.
        #
        #   @return [Integer, nil]
        optional :start, Integer

        # @!method initialize(end_: nil, ocr: nil, should_parse: nil, start: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebCrawlMdParams::Pdf} for more details.
        #
        #   PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
        #
        #   @param end_ [Integer] Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must be
        #
        #   @param ocr [Boolean] Read scanned PDF pages with OCR; preserve pages that already have text.
        #
        #   @param should_parse [Boolean] When true, PDF pages are fetched and parsed. When false, PDF pages are skipped e
        #
        #   @param start [Integer] First 1-based PDF page to parse.
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        # @!attribute milliseconds
        #   Deadline in milliseconds.
        #
        #   @return [Integer]
        required :milliseconds, Integer

        # @!attribute behavior
        #   "fail" returns 408 at the deadline. "return-partial" returns available results;
        #   inspect the response’s partial flag.
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
        #   @param behavior [Symbol, ContextDev::Models::WebWebCrawlMdParams::TimeoutOpts::Behavior] "fail" returns 408 at the deadline. "return-partial" returns available results;

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag.
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
