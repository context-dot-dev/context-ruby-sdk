# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#web_scrape_md
    class WebWebScrapeMdParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute url
      #   Full URL to scrape into LLM usable Markdown (must include http:// or https://
      #   protocol)
      #
      #   @return [String]
      required :url, String

      # @!attribute country
      #   Two-letter ISO 3166-1 alpha-2 country code identifying a supported Context.dev
      #   residential proxy exit location. Must be one of Context.dev's supported
      #   countries. When provided, Context.dev fetches the target page from that country.
      #
      #   @return [Symbol, ContextDev::Models::WebWebScrapeMdParams::Country, nil]
      optional :country, enum: -> { ContextDev::WebWebScrapeMdParams::Country }

      # @!attribute exclude_selectors
      #   CSS selectors to remove before conversion to Markdown. Applied after
      #   includeSelectors. Exclusion takes precedence: an element matching both is
      #   removed. Examples: "nav", "footer", ".ad-banner", "[aria-hidden=true]".
      #
      #   @return [Array<String>, nil]
      optional :exclude_selectors, ContextDev::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute headers
      #   Optional outbound HTTP headers forwarded only to the target URL, sent as
      #   deep-object query params such as headers[X-Custom]=value. When provided, caching
      #   is bypassed: the result is neither read from nor written to cache.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, ContextDev::Internal::Type::HashOf[String]

      # @!attribute include_frames
      #   When true, the contents of iframes are rendered to Markdown.
      #
      #   @return [Boolean, Symbol, ContextDev::Models::WebWebScrapeMdParams::IncludeFrames, nil]
      optional :include_frames, union: -> { ContextDev::WebWebScrapeMdParams::IncludeFrames }

      # @!attribute include_images
      #   Include image references in Markdown output
      #
      #   @return [Boolean, Symbol, ContextDev::Models::WebWebScrapeMdParams::IncludeImages, nil]
      optional :include_images, union: -> { ContextDev::WebWebScrapeMdParams::IncludeImages }

      # @!attribute include_links
      #   Preserve hyperlinks in Markdown output
      #
      #   @return [Boolean, Symbol, ContextDev::Models::WebWebScrapeMdParams::IncludeLinks, nil]
      optional :include_links, union: -> { ContextDev::WebWebScrapeMdParams::IncludeLinks }

      # @!attribute include_selectors
      #   CSS selectors. When provided, only matching HTML subtrees (and their
      #   descendants) are kept before conversion to Markdown. When omitted, the entire
      #   document is kept. Examples: "article.main", "#content", "[role=main]".
      #
      #   @return [Array<String>, nil]
      optional :include_selectors, ContextDev::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute max_age_ms
      #   Return a cached result if a prior scrape for the same parameters exists and is
      #   younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
      #   omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer, nil?: true

      # @!attribute pdf
      #   PDF parsing controls. Use start/end to limit text extraction and embedded-image
      #   detection/OCR to an inclusive 1-based page range.
      #
      #   @return [ContextDev::Models::WebWebScrapeMdParams::Pdf, nil]
      optional :pdf, -> { ContextDev::WebWebScrapeMdParams::Pdf }

      # @!attribute settle_animations
      #   When true, waits briefly for CSS and transition animations to settle before
      #   converting to Markdown. Defaults to false. This adds a bit of latency in
      #   exchange for more stable output on animated pages.
      #
      #   @return [Boolean, Symbol, ContextDev::Models::WebWebScrapeMdParams::SettleAnimations, nil]
      optional :settle_animations, union: -> { ContextDev::WebWebScrapeMdParams::SettleAnimations }

      # @!attribute shorten_base64_images
      #   Shorten base64-encoded image data in the Markdown output
      #
      #   @return [Boolean, Symbol, ContextDev::Models::WebWebScrapeMdParams::ShortenBase64Images, nil]
      optional :shorten_base64_images, union: -> { ContextDev::WebWebScrapeMdParams::ShortenBase64Images }

      # @!attribute tags
      #   Optional comma-separated caller-defined tags for tracking this request. Tags are
      #   recorded on the request's usage log and can be used to filter usage on the
      #   dashboard usage page. Up to 20 tags, each 1-50 characters.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_ms
      #   Optional timeout in milliseconds for the request. If the request takes longer
      #   than this value, it will be aborted with a 408 status code. Maximum allowed
      #   value is 300000ms (5 minutes).
      #
      #   @return [Integer, nil]
      optional :timeout_ms, Integer

      # @!attribute use_main_content_only
      #   Extract only the main content of the page, excluding headers, footers, sidebars,
      #   and navigation
      #
      #   @return [Boolean, Symbol, ContextDev::Models::WebWebScrapeMdParams::UseMainContentOnly, nil]
      optional :use_main_content_only, union: -> { ContextDev::WebWebScrapeMdParams::UseMainContentOnly }

      # @!attribute wait_for_ms
      #   Optional browser wait time in milliseconds after initial page load before
      #   converting the page to Markdown. Min: 0. Max: 30000 (30 seconds).
      #
      #   @return [Integer, nil]
      optional :wait_for_ms, Integer, nil?: true

      # @!attribute zdr
      #   Set to enabled to bypass shared caches and omit request and response content
      #   from retained usage logs. Requires zero data retention to be enabled for your
      #   organization (contact support@context.dev), otherwise the request fails with
      #   ZDR_NOT_ENABLED. Successful ZDR responses include X-Context-ZDR: true.
      #
      #   @return [Symbol, ContextDev::Models::WebWebScrapeMdParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebWebScrapeMdParams::Zdr }

      # @!method initialize(url:, country: nil, exclude_selectors: nil, headers: nil, include_frames: nil, include_images: nil, include_links: nil, include_selectors: nil, max_age_ms: nil, pdf: nil, settle_animations: nil, shorten_base64_images: nil, tags: nil, timeout_ms: nil, use_main_content_only: nil, wait_for_ms: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebWebScrapeMdParams} for more details.
      #
      #   @param url [String] Full URL to scrape into LLM usable Markdown (must include http:// or https:// pr
      #
      #   @param country [Symbol, ContextDev::Models::WebWebScrapeMdParams::Country] Two-letter ISO 3166-1 alpha-2 country code identifying a supported Context.dev r
      #
      #   @param exclude_selectors [Array<String>, nil] CSS selectors to remove before conversion to Markdown. Applied after includeSele
      #
      #   @param headers [Hash{Symbol=>String}] Optional outbound HTTP headers forwarded only to the target URL, sent as deep-ob
      #
      #   @param include_frames [Boolean, Symbol, ContextDev::Models::WebWebScrapeMdParams::IncludeFrames] When true, the contents of iframes are rendered to Markdown.
      #
      #   @param include_images [Boolean, Symbol, ContextDev::Models::WebWebScrapeMdParams::IncludeImages] Include image references in Markdown output
      #
      #   @param include_links [Boolean, Symbol, ContextDev::Models::WebWebScrapeMdParams::IncludeLinks] Preserve hyperlinks in Markdown output
      #
      #   @param include_selectors [Array<String>, nil] CSS selectors. When provided, only matching HTML subtrees (and their descendants
      #
      #   @param max_age_ms [Integer, nil] Return a cached result if a prior scrape for the same parameters exists and is y
      #
      #   @param pdf [ContextDev::Models::WebWebScrapeMdParams::Pdf] PDF parsing controls. Use start/end to limit text extraction and embedded-image
      #
      #   @param settle_animations [Boolean, Symbol, ContextDev::Models::WebWebScrapeMdParams::SettleAnimations] When true, waits briefly for CSS and transition animations to settle before conv
      #
      #   @param shorten_base64_images [Boolean, Symbol, ContextDev::Models::WebWebScrapeMdParams::ShortenBase64Images] Shorten base64-encoded image data in the Markdown output
      #
      #   @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
      #
      #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      #   @param use_main_content_only [Boolean, Symbol, ContextDev::Models::WebWebScrapeMdParams::UseMainContentOnly] Extract only the main content of the page, excluding headers, footers, sidebars,
      #
      #   @param wait_for_ms [Integer, nil] Optional browser wait time in milliseconds after initial page load before conver
      #
      #   @param zdr [Symbol, ContextDev::Models::WebWebScrapeMdParams::Zdr] Set to enabled to bypass shared caches and omit request and response content fro
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

      # When true, the contents of iframes are rendered to Markdown.
      module IncludeFrames
        extend ContextDev::Internal::Type::Union

        variant ContextDev::Internal::Type::Boolean

        variant const: -> { ContextDev::Models::WebWebScrapeMdParams::IncludeFrames::TRUE }

        variant const: -> { ContextDev::Models::WebWebScrapeMdParams::IncludeFrames::FALSE }

        # @!method self.variants
        #   @return [Array(Boolean, Symbol)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(T::Boolean, ContextDev::WebWebScrapeMdParams::IncludeFrames::TaggedSymbol) }
        end

        # @!group

        TRUE = :true
        FALSE = :false

        # @!endgroup
      end

      # Include image references in Markdown output
      module IncludeImages
        extend ContextDev::Internal::Type::Union

        variant ContextDev::Internal::Type::Boolean

        variant const: -> { ContextDev::Models::WebWebScrapeMdParams::IncludeImages::TRUE }

        variant const: -> { ContextDev::Models::WebWebScrapeMdParams::IncludeImages::FALSE }

        # @!method self.variants
        #   @return [Array(Boolean, Symbol)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(T::Boolean, ContextDev::WebWebScrapeMdParams::IncludeImages::TaggedSymbol) }
        end

        # @!group

        TRUE = :true
        FALSE = :false

        # @!endgroup
      end

      # Preserve hyperlinks in Markdown output
      module IncludeLinks
        extend ContextDev::Internal::Type::Union

        variant ContextDev::Internal::Type::Boolean

        variant const: -> { ContextDev::Models::WebWebScrapeMdParams::IncludeLinks::TRUE }

        variant const: -> { ContextDev::Models::WebWebScrapeMdParams::IncludeLinks::FALSE }

        # @!method self.variants
        #   @return [Array(Boolean, Symbol)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(T::Boolean, ContextDev::WebWebScrapeMdParams::IncludeLinks::TaggedSymbol) }
        end

        # @!group

        TRUE = :true
        FALSE = :false

        # @!endgroup
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
        #   @return [Boolean, Symbol, ContextDev::Models::WebWebScrapeMdParams::Pdf::Ocr, nil]
        optional :ocr, union: -> { ContextDev::WebWebScrapeMdParams::Pdf::Ocr }

        # @!attribute should_parse
        #   When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
        #   a 400 WEBSITE_ACCESS_ERROR is returned.
        #
        #   @return [Boolean, Symbol, ContextDev::Models::WebWebScrapeMdParams::Pdf::ShouldParse, nil]
        optional :should_parse,
                 union: -> { ContextDev::WebWebScrapeMdParams::Pdf::ShouldParse },
                 api_name: :shouldParse

        # @!attribute start
        #   First 1-based PDF page to parse. When omitted, parsing starts at the first page.
        #
        #   @return [Integer, nil]
        optional :start, Integer

        # @!method initialize(end_: nil, ocr: nil, should_parse: nil, start: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebWebScrapeMdParams::Pdf} for more details.
        #
        #   PDF parsing controls. Use start/end to limit text extraction and embedded-image
        #   detection/OCR to an inclusive 1-based page range.
        #
        #   @param end_ [Integer] Last 1-based PDF page to parse. When omitted, parsing ends at the last page. Mus
        #
        #   @param ocr [Boolean, Symbol, ContextDev::Models::WebWebScrapeMdParams::Pdf::Ocr] When true, detect and OCR images embedded in the selected PDF pages, inserting r
        #
        #   @param should_parse [Boolean, Symbol, ContextDev::Models::WebWebScrapeMdParams::Pdf::ShouldParse] When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
        #
        #   @param start [Integer] First 1-based PDF page to parse. When omitted, parsing starts at the first page.

        # When true, detect and OCR images embedded in the selected PDF pages, inserting
        # recognized text at each image's position in page reading order while preserving
        # the PDF text layer. This is separate from automatic scanned-PDF OCR fallback.
        #
        # @see ContextDev::Models::WebWebScrapeMdParams::Pdf#ocr
        module Ocr
          extend ContextDev::Internal::Type::Union

          variant ContextDev::Internal::Type::Boolean

          variant const: -> { ContextDev::Models::WebWebScrapeMdParams::Pdf::Ocr::TRUE }

          variant const: -> { ContextDev::Models::WebWebScrapeMdParams::Pdf::Ocr::FALSE }

          # @!method self.variants
          #   @return [Array(Boolean, Symbol)]

          define_sorbet_constant!(:Variants) do
            T.type_alias { T.any(T::Boolean, ContextDev::WebWebScrapeMdParams::Pdf::Ocr::TaggedSymbol) }
          end

          # @!group

          TRUE = :true
          FALSE = :false

          # @!endgroup
        end

        # When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
        # a 400 WEBSITE_ACCESS_ERROR is returned.
        #
        # @see ContextDev::Models::WebWebScrapeMdParams::Pdf#should_parse
        module ShouldParse
          extend ContextDev::Internal::Type::Union

          variant ContextDev::Internal::Type::Boolean

          variant const: -> { ContextDev::Models::WebWebScrapeMdParams::Pdf::ShouldParse::TRUE }

          variant const: -> { ContextDev::Models::WebWebScrapeMdParams::Pdf::ShouldParse::FALSE }

          # @!method self.variants
          #   @return [Array(Boolean, Symbol)]

          define_sorbet_constant!(:Variants) do
            T.type_alias { T.any(T::Boolean, ContextDev::WebWebScrapeMdParams::Pdf::ShouldParse::TaggedSymbol) }
          end

          # @!group

          TRUE = :true
          FALSE = :false

          # @!endgroup
        end
      end

      # When true, waits briefly for CSS and transition animations to settle before
      # converting to Markdown. Defaults to false. This adds a bit of latency in
      # exchange for more stable output on animated pages.
      module SettleAnimations
        extend ContextDev::Internal::Type::Union

        variant ContextDev::Internal::Type::Boolean

        variant const: -> { ContextDev::Models::WebWebScrapeMdParams::SettleAnimations::TRUE }

        variant const: -> { ContextDev::Models::WebWebScrapeMdParams::SettleAnimations::FALSE }

        # @!method self.variants
        #   @return [Array(Boolean, Symbol)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(T::Boolean, ContextDev::WebWebScrapeMdParams::SettleAnimations::TaggedSymbol) }
        end

        # @!group

        TRUE = :true
        FALSE = :false

        # @!endgroup
      end

      # Shorten base64-encoded image data in the Markdown output
      module ShortenBase64Images
        extend ContextDev::Internal::Type::Union

        variant ContextDev::Internal::Type::Boolean

        variant const: -> { ContextDev::Models::WebWebScrapeMdParams::ShortenBase64Images::TRUE }

        variant const: -> { ContextDev::Models::WebWebScrapeMdParams::ShortenBase64Images::FALSE }

        # @!method self.variants
        #   @return [Array(Boolean, Symbol)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(T::Boolean, ContextDev::WebWebScrapeMdParams::ShortenBase64Images::TaggedSymbol) }
        end

        # @!group

        TRUE = :true
        FALSE = :false

        # @!endgroup
      end

      # Extract only the main content of the page, excluding headers, footers, sidebars,
      # and navigation
      module UseMainContentOnly
        extend ContextDev::Internal::Type::Union

        variant ContextDev::Internal::Type::Boolean

        variant const: -> { ContextDev::Models::WebWebScrapeMdParams::UseMainContentOnly::TRUE }

        variant const: -> { ContextDev::Models::WebWebScrapeMdParams::UseMainContentOnly::FALSE }

        # @!method self.variants
        #   @return [Array(Boolean, Symbol)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(T::Boolean, ContextDev::WebWebScrapeMdParams::UseMainContentOnly::TaggedSymbol) }
        end

        # @!group

        TRUE = :true
        FALSE = :false

        # @!endgroup
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
