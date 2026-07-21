# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#web_crawl_md
    class WebWebCrawlMdParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute url
      #   The starting URL for the crawl (must include http:// or https:// protocol)
      #
      #   @return [String]
      required :url, String

      # @!attribute country
      #   Two-letter ISO 3166-1 alpha-2 country code identifying a supported Context.dev
      #   residential proxy exit location. Must be one of Context.dev's supported
      #   countries. When provided, Context.dev fetches the target page from that country.
      #
      #   @return [Symbol, ContextDev::Models::WebWebCrawlMdParams::Country, nil]
      optional :country, enum: -> { ContextDev::WebWebCrawlMdParams::Country }

      # @!attribute exclude_selectors
      #   CSS selectors to remove before each crawled page is converted to Markdown.
      #   Applied after includeSelectors. Exclusion takes precedence: an element matching
      #   both is removed. Examples: "nav", "footer", ".ad-banner", "[aria-hidden=true]".
      #
      #   @return [Array<String>, nil]
      optional :exclude_selectors, ContextDev::Internal::Type::ArrayOf[String], api_name: :excludeSelectors

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
      #   CSS selectors. When provided, only matching HTML subtrees (and their
      #   descendants) are kept before each crawled page is converted to Markdown. When
      #   omitted, the entire document is kept. Examples: "article.main", "#content",
      #   "[role=main]".
      #
      #   @return [Array<String>, nil]
      optional :include_selectors, ContextDev::Internal::Type::ArrayOf[String], api_name: :includeSelectors

      # @!attribute max_age_ms
      #   Return a cached result if a prior scrape for the same parameters exists and is
      #   younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
      #   omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer, api_name: :maxAgeMs

      # @!attribute max_depth
      #   Maximum link depth from the starting URL (0 = only the starting page)
      #
      #   @return [Integer, nil]
      optional :max_depth, Integer, api_name: :maxDepth

      # @!attribute max_pages
      #   Maximum number of pages to crawl. Hard cap: 500.
      #
      #   @return [Integer, nil]
      optional :max_pages, Integer, api_name: :maxPages

      # @!attribute pdf
      #   PDF parsing controls. Use start/end to limit text extraction and embedded-image
      #   detection/OCR to an inclusive 1-based page range.
      #
      #   @return [ContextDev::Models::WebWebCrawlMdParams::Pdf, nil]
      optional :pdf, -> { ContextDev::WebWebCrawlMdParams::Pdf }

      # @!attribute settle_animations
      #   When true, waits briefly for CSS and transition animations to settle before
      #   extracting each crawled page. Defaults to false. This adds a bit of latency in
      #   exchange for more stable output on animated pages.
      #
      #   @return [Boolean, nil]
      optional :settle_animations, ContextDev::Internal::Type::Boolean, api_name: :settleAnimations

      # @!attribute shorten_base64_images
      #   Truncate base64-encoded image data in the Markdown output
      #
      #   @return [Boolean, nil]
      optional :shorten_base64_images, ContextDev::Internal::Type::Boolean, api_name: :shortenBase64Images

      # @!attribute stop_after_ms
      #   Soft time budget for the crawl in milliseconds. After each scrape, the crawler
      #   checks the elapsed time and, if exceeded, returns the pages collected so far
      #   instead of continuing. Min: 10000 (10s). Max: 110000 (110s). Default: 80000
      #   (80s).
      #
      #   @return [Integer, nil]
      optional :stop_after_ms, Integer, api_name: :stopAfterMs

      # @!attribute tags
      #   Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_ms
      #   Optional timeout in milliseconds for the request. If the request takes longer
      #   than this value, it will be aborted with a 408 status code. Maximum allowed
      #   value is 300000ms (5 minutes).
      #
      #   @return [Integer, nil]
      optional :timeout_ms, Integer, api_name: :timeoutMS

      # @!attribute url_regex
      #   Regex pattern. Only URLs matching this pattern will be followed and scraped.
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
      #   Optional browser wait time in milliseconds after initial page load for each
      #   crawled page. Min: 0. Max: 30000 (30 seconds).
      #
      #   @return [Integer, nil]
      optional :wait_for_ms, Integer, api_name: :waitForMs

      # @!attribute zdr
      #   Set to enabled to bypass shared caches and omit request and response content
      #   from retained usage logs. Requires zero data retention to be enabled for your
      #   organization (contact support@context.dev), otherwise the request fails with
      #   ZDR_NOT_ENABLED. Successful ZDR responses include X-Context-ZDR: true.
      #
      #   @return [Symbol, ContextDev::Models::WebWebCrawlMdParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebWebCrawlMdParams::Zdr }

      # @!method initialize(url:, country: nil, exclude_selectors: nil, follow_subdomains: nil, include_frames: nil, include_images: nil, include_links: nil, include_selectors: nil, max_age_ms: nil, max_depth: nil, max_pages: nil, pdf: nil, settle_animations: nil, shorten_base64_images: nil, stop_after_ms: nil, tags: nil, timeout_ms: nil, url_regex: nil, use_main_content_only: nil, wait_for_ms: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebCrawlMdParams} for more details.
      #
      #   @param url [String] The starting URL for the crawl (must include http:// or https:// protocol)
      #
      #   @param country [Symbol, ContextDev::Models::WebWebCrawlMdParams::Country] Two-letter ISO 3166-1 alpha-2 country code identifying a supported Context.dev r
      #
      #   @param exclude_selectors [Array<String>] CSS selectors to remove before each crawled page is converted to Markdown. Appli
      #
      #   @param follow_subdomains [Boolean] When true, follow links on subdomains of the starting URL's domain (e.g. docs.ex
      #
      #   @param include_frames [Boolean] When true, the contents of iframes are rendered to Markdown for each crawled pag
      #
      #   @param include_images [Boolean] Include image references in the Markdown output
      #
      #   @param include_links [Boolean] Preserve hyperlinks in the Markdown output
      #
      #   @param include_selectors [Array<String>] CSS selectors. When provided, only matching HTML subtrees (and their descendants
      #
      #   @param max_age_ms [Integer] Return a cached result if a prior scrape for the same parameters exists and is y
      #
      #   @param max_depth [Integer] Maximum link depth from the starting URL (0 = only the starting page)
      #
      #   @param max_pages [Integer] Maximum number of pages to crawl. Hard cap: 500.
      #
      #   @param pdf [ContextDev::Models::WebWebCrawlMdParams::Pdf] PDF parsing controls. Use start/end to limit text extraction and embedded-image
      #
      #   @param settle_animations [Boolean] When true, waits briefly for CSS and transition animations to settle before extr
      #
      #   @param shorten_base64_images [Boolean] Truncate base64-encoded image data in the Markdown output
      #
      #   @param stop_after_ms [Integer] Soft time budget for the crawl in milliseconds. After each scrape, the crawler c
      #
      #   @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      #   @param url_regex [String] Regex pattern. Only URLs matching this pattern will be followed and scraped.
      #
      #   @param use_main_content_only [Boolean] Extract only the main content, stripping headers, footers, sidebars, and navigat
      #
      #   @param wait_for_ms [Integer] Optional browser wait time in milliseconds after initial page load for each craw
      #
      #   @param zdr [Symbol, ContextDev::Models::WebWebCrawlMdParams::Zdr] Set to enabled to bypass shared caches and omit request and response content fro
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Two-letter ISO 3166-1 alpha-2 country code identifying a supported Context.dev
      # residential proxy exit location. Must be one of Context.dev's supported
      # countries. When provided, Context.dev fetches the target page from that country.
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
        #   Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
        #   Must be greater than or equal to start when both are provided.
        #
        #   @return [Integer, nil]
        optional :end_, Integer, api_name: :end

        # @!attribute ocr
        #   When true, detect and OCR images embedded in the selected PDF pages, inserting
        #   recognized text at each image's position in page reading order while preserving
        #   the PDF text layer. This is separate from automatic scanned-PDF OCR fallback.
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
        #   First 1-based PDF page to parse. When omitted, parsing starts at the first page.
        #
        #   @return [Integer, nil]
        optional :start, Integer

        # @!method initialize(end_: nil, ocr: nil, should_parse: nil, start: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebCrawlMdParams::Pdf} for more details.
        #
        #   PDF parsing controls. Use start/end to limit text extraction and embedded-image
        #   detection/OCR to an inclusive 1-based page range.
        #
        #   @param end_ [Integer] Last 1-based PDF page to parse. When omitted, parsing ends at the last page. Mus
        #
        #   @param ocr [Boolean] When true, detect and OCR images embedded in the selected PDF pages, inserting r
        #
        #   @param should_parse [Boolean] When true, PDF pages are fetched and parsed. When false, PDF pages are skipped e
        #
        #   @param start [Integer] First 1-based PDF page to parse. When omitted, parsing starts at the first page.
      end

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Requires zero data retention to be enabled for your
      # organization (contact support@context.dev), otherwise the request fails with
      # ZDR_NOT_ENABLED. Successful ZDR responses include X-Context-ZDR: true.
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
