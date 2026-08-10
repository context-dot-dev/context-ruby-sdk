# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#submit
    class BatchSubmitParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute input
      #   Choose a URL list or a site crawl.
      #
      #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape, ContextDev::Models::BatchSubmitParams::Input::Crawl]
      required :input, union: -> { ContextDev::BatchSubmitParams::Input }

      # @!attribute tags
      #   Tags stored on the batch. Filter the batch list by them later.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute webhook_url
      #   URL notified when the batch finishes.
      #
      #   @return [String, nil]
      optional :webhook_url, String, api_name: :webhookUrl

      # @!attribute idempotency_key
      #   Any string unique to this submission. Retries with the same key return the
      #   original batch.
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(input:, tags: nil, webhook_url: nil, idempotency_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchSubmitParams} for more details.
      #
      #   @param input [ContextDev::Models::BatchSubmitParams::Input::Scrape, ContextDev::Models::BatchSubmitParams::Input::Crawl] Choose a URL list or a site crawl.
      #
      #   @param tags [Array<String>] Tags stored on the batch. Filter the batch list by them later.
      #
      #   @param webhook_url [String] URL notified when the batch finishes.
      #
      #   @param idempotency_key [String] Any string unique to this submission. Retries with the same key return the origi
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Choose a URL list or a site crawl.
      module Input
        extend ContextDev::Internal::Type::Union

        discriminator :mode

        # Scrape up to 25K URLs in one batch.
        variant :scrape, -> { ContextDev::BatchSubmitParams::Input::Scrape }

        # Crawl pages starting from a URL or from a domain's sitemap.
        variant :crawl, -> { ContextDev::BatchSubmitParams::Input::Crawl }

        class Scrape < ContextDev::Internal::Type::BaseModel
          # @!attribute data
          #   Pages to scrape and their output format.
          #
          #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML]
          required :data, union: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data }

          # @!attribute mode
          #   Scrape the pages in `data.urls`.
          #
          #   @return [Symbol, :scrape]
          required :mode, const: :scrape

          # @!method initialize(data:, mode: :scrape)
          #   Scrape up to 25K URLs in one batch.
          #
          #   @param data [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML] Pages to scrape and their output format.
          #
          #   @param mode [Symbol, :scrape] Scrape the pages in `data.urls`.

          # Pages to scrape and their output format.
          #
          # @see ContextDev::Models::BatchSubmitParams::Input::Scrape#data
          module Data
            extend ContextDev::Internal::Type::Union

            discriminator :format

            # Scrape the listed pages as Markdown.
            variant :markdown, -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown }

            # Scrape the listed pages as HTML.
            variant :html, -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML }

            class Markdown < ContextDev::Internal::Type::BaseModel
              # @!attribute format_
              #   Return page content as Markdown.
              #
              #   @return [Symbol, :markdown]
              required :format_, const: :markdown, api_name: :format

              # @!attribute urls
              #   Pages to scrape. Maximum 25000.
              #
              #   @return [Array<ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::URL>]
              required :urls,
                       -> { ContextDev::Internal::Type::ArrayOf[ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::URL] }

              # @!attribute options
              #   Options for Markdown output.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options, nil]
              optional :options, -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options }

              # @!method initialize(urls:, options: nil, format_: :markdown)
              #   Scrape the listed pages as Markdown.
              #
              #   @param urls [Array<ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::URL>] Pages to scrape. Maximum 25000.
              #
              #   @param options [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options] Options for Markdown output.
              #
              #   @param format_ [Symbol, :markdown] Return page content as Markdown.

              class URL < ContextDev::Internal::Type::BaseModel
                # @!attribute url
                #   Page URL to scrape.
                #
                #   @return [String]
                required :url, String

                # @!attribute item_id
                #   Your ID for this page, returned with its result. The same URL can use different
                #   IDs.
                #
                #   @return [String, nil]
                optional :item_id, String, api_name: :itemId

                # @!attribute meta
                #   Custom JSON returned unchanged with this page result.
                #
                #   @return [Hash{Symbol=>Object}, nil]
                optional :meta, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

                # @!method initialize(url:, item_id: nil, meta: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::URL} for
                #   more details.
                #
                #   A page to scrape, with optional data for matching results.
                #
                #   @param url [String] Page URL to scrape.
                #
                #   @param item_id [String] Your ID for this page, returned with its result. The same URL can use different
                #
                #   @param meta [Hash{Symbol=>Object}] Custom JSON returned unchanged with this page result.
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown#options
              class Options < ContextDev::Internal::Type::BaseModel
                # @!attribute country
                #   Fetch the target page through a residential proxy in this country (ISO 3166-1
                #   alpha-2).
                #
                #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country, nil]
                optional :country,
                         enum: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country }

                # @!attribute exclude_selectors
                #   Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                #   so an element matching both is removed.
                #
                #   @return [Array<String>, nil]
                optional :exclude_selectors,
                         ContextDev::Internal::Type::ArrayOf[String],
                         api_name: :excludeSelectors,
                         nil?: true

                # @!attribute include_html
                #   Also include each page's HTML in its result record, as an `html` field alongside
                #   the Markdown.
                #
                #   @return [Boolean, nil]
                optional :include_html, ContextDev::Internal::Type::Boolean, api_name: :includeHTML

                # @!attribute include_images
                #   Include image references in the Markdown.
                #
                #   @return [Boolean, nil]
                optional :include_images, ContextDev::Internal::Type::Boolean, api_name: :includeImages

                # @!attribute include_links
                #   Include links in the Markdown.
                #
                #   @return [Boolean, nil]
                optional :include_links, ContextDev::Internal::Type::Boolean, api_name: :includeLinks

                # @!attribute include_selectors
                #   Keep only the subtrees matching these CSS selectors. Filtered pages are always
                #   fetched fresh, ignoring `maxAgeMs`.
                #
                #   @return [Array<String>, nil]
                optional :include_selectors,
                         ContextDev::Internal::Type::ArrayOf[String],
                         api_name: :includeSelectors,
                         nil?: true

                # @!attribute max_age_ms
                #   Return a cached result if a prior scrape for the same parameters exists and is
                #   younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
                #   omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
                #
                #   @return [Integer, nil]
                optional :max_age_ms, Integer, api_name: :maxAgeMs, nil?: true

                # @!attribute pdf
                #   PDF parsing controls. Use start/end to limit text extraction and embedded-image
                #   detection/OCR to an inclusive 1-based page range.
                #
                #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf, nil]
                optional :pdf, -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf }

                # @!attribute settle_animations
                #   Wait briefly for CSS and transition animations to settle before extraction, on
                #   pages that render in a browser.
                #
                #   @return [Boolean, nil]
                optional :settle_animations, ContextDev::Internal::Type::Boolean, api_name: :settleAnimations

                # @!attribute shorten_base64_images
                #   Shorten inline base64 image data.
                #
                #   @return [Boolean, nil]
                optional :shorten_base64_images,
                         ContextDev::Internal::Type::Boolean,
                         api_name: :shortenBase64Images

                # @!attribute use_main_content_only
                #   Return the main content without navigation or footers.
                #
                #   @return [Boolean, nil]
                optional :use_main_content_only,
                         ContextDev::Internal::Type::Boolean,
                         api_name: :useMainContentOnly

                # @!attribute wait_for_ms
                #   How long to wait after initial page load, in milliseconds. `0` waits 500 ms.
                #
                #   @return [Integer, nil]
                optional :wait_for_ms, Integer, api_name: :waitForMs

                # @!method initialize(country: nil, exclude_selectors: nil, include_html: nil, include_images: nil, include_links: nil, include_selectors: nil, max_age_ms: nil, pdf: nil, settle_animations: nil, shorten_base64_images: nil, use_main_content_only: nil, wait_for_ms: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options}
                #   for more details.
                #
                #   Options for Markdown output.
                #
                #   @param country [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country] Fetch the target page through a residential proxy in this country (ISO 3166-1 al
                #
                #   @param exclude_selectors [Array<String>, nil] Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                #
                #   @param include_html [Boolean] Also include each page's HTML in its result record, as an `html` field alongside
                #
                #   @param include_images [Boolean] Include image references in the Markdown.
                #
                #   @param include_links [Boolean] Include links in the Markdown.
                #
                #   @param include_selectors [Array<String>, nil] Keep only the subtrees matching these CSS selectors. Filtered pages are always f
                #
                #   @param max_age_ms [Integer, nil] Return a cached result if a prior scrape for the same parameters exists and is y
                #
                #   @param pdf [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf] PDF parsing controls. Use start/end to limit text extraction and embedded-image
                #
                #   @param settle_animations [Boolean] Wait briefly for CSS and transition animations to settle before extraction, on p
                #
                #   @param shorten_base64_images [Boolean] Shorten inline base64 image data.
                #
                #   @param use_main_content_only [Boolean] Return the main content without navigation or footers.
                #
                #   @param wait_for_ms [Integer] How long to wait after initial page load, in milliseconds. `0` waits 500 ms.

                # Fetch the target page through a residential proxy in this country (ISO 3166-1
                # alpha-2).
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options#country
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

                # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options#pdf
                class Pdf < ContextDev::Internal::Type::BaseModel
                  # @!attribute end_
                  #   Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
                  #   Must be greater than or equal to start when both are provided.
                  #
                  #   @return [Integer, nil]
                  optional :end_, Integer, api_name: :end

                  # @!attribute ocr
                  #   When true, OCR the selected PDF pages that have no usable text layer (scans),
                  #   replacing each recovered page's text with the OCR result while pages with a real
                  #   text layer keep it. Billed at 1 credit per page OCR actually recovered, on top
                  #   of the base request cost. When false, no OCR runs.
                  #
                  #   @return [Boolean, Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf::Ocr, nil]
                  optional :ocr,
                           union: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf::Ocr }

                  # @!attribute should_parse
                  #   When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
                  #   a 400 PDF_SKIPPED is returned.
                  #
                  #   @return [Boolean, Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf::ShouldParse, nil]
                  optional :should_parse,
                           union: -> {
                             ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf::ShouldParse
                           },
                           api_name: :shouldParse

                  # @!attribute start
                  #   First 1-based PDF page to parse. When omitted, parsing starts at the first page.
                  #
                  #   @return [Integer, nil]
                  optional :start, Integer

                  # @!method initialize(end_: nil, ocr: nil, should_parse: nil, start: nil)
                  #   Some parameter documentations has been truncated, see
                  #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf}
                  #   for more details.
                  #
                  #   PDF parsing controls. Use start/end to limit text extraction and embedded-image
                  #   detection/OCR to an inclusive 1-based page range.
                  #
                  #   @param end_ [Integer] Last 1-based PDF page to parse. When omitted, parsing ends at the last page. Mus
                  #
                  #   @param ocr [Boolean, Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf::Ocr] When true, OCR the selected PDF pages that have no usable text layer (scans), re
                  #
                  #   @param should_parse [Boolean, Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf::ShouldParse] When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
                  #
                  #   @param start [Integer] First 1-based PDF page to parse. When omitted, parsing starts at the first page.

                  # When true, OCR the selected PDF pages that have no usable text layer (scans),
                  # replacing each recovered page's text with the OCR result while pages with a real
                  # text layer keep it. Billed at 1 credit per page OCR actually recovered, on top
                  # of the base request cost. When false, no OCR runs.
                  #
                  # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf#ocr
                  module Ocr
                    extend ContextDev::Internal::Type::Union

                    variant ContextDev::Internal::Type::Boolean

                    variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf::Ocr::TRUE }

                    variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf::Ocr::FALSE }

                    # @!method self.variants
                    #   @return [Array(Boolean, Symbol)]

                    define_sorbet_constant!(:Variants) do
                      T.type_alias do
                        T.any(
                          T::Boolean,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf::Ocr::TaggedSymbol
                        )
                      end
                    end

                    # @!group

                    TRUE = :true
                    FALSE = :false

                    # @!endgroup
                  end

                  # When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
                  # a 400 PDF_SKIPPED is returned.
                  #
                  # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf#should_parse
                  module ShouldParse
                    extend ContextDev::Internal::Type::Union

                    variant ContextDev::Internal::Type::Boolean

                    variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf::ShouldParse::TRUE }

                    variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf::ShouldParse::FALSE }

                    # @!method self.variants
                    #   @return [Array(Boolean, Symbol)]

                    define_sorbet_constant!(:Variants) do
                      T.type_alias do
                        T.any(
                          T::Boolean,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf::ShouldParse::TaggedSymbol
                        )
                      end
                    end

                    # @!group

                    TRUE = :true
                    FALSE = :false

                    # @!endgroup
                  end
                end
              end
            end

            class HTML < ContextDev::Internal::Type::BaseModel
              # @!attribute format_
              #   Return page content as HTML.
              #
              #   @return [Symbol, :html]
              required :format_, const: :html, api_name: :format

              # @!attribute urls
              #   Pages to scrape. Maximum 25000.
              #
              #   @return [Array<ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::URL>]
              required :urls,
                       -> { ContextDev::Internal::Type::ArrayOf[ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::URL] }

              # @!attribute options
              #   Options for HTML output.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options, nil]
              optional :options, -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options }

              # @!method initialize(urls:, options: nil, format_: :html)
              #   Scrape the listed pages as HTML.
              #
              #   @param urls [Array<ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::URL>] Pages to scrape. Maximum 25000.
              #
              #   @param options [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options] Options for HTML output.
              #
              #   @param format_ [Symbol, :html] Return page content as HTML.

              class URL < ContextDev::Internal::Type::BaseModel
                # @!attribute url
                #   Page URL to scrape.
                #
                #   @return [String]
                required :url, String

                # @!attribute item_id
                #   Your ID for this page, returned with its result. The same URL can use different
                #   IDs.
                #
                #   @return [String, nil]
                optional :item_id, String, api_name: :itemId

                # @!attribute meta
                #   Custom JSON returned unchanged with this page result.
                #
                #   @return [Hash{Symbol=>Object}, nil]
                optional :meta, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

                # @!method initialize(url:, item_id: nil, meta: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::URL} for more
                #   details.
                #
                #   A page to scrape, with optional data for matching results.
                #
                #   @param url [String] Page URL to scrape.
                #
                #   @param item_id [String] Your ID for this page, returned with its result. The same URL can use different
                #
                #   @param meta [Hash{Symbol=>Object}] Custom JSON returned unchanged with this page result.
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML#options
              class Options < ContextDev::Internal::Type::BaseModel
                # @!attribute country
                #   Fetch the target page through a residential proxy in this country (ISO 3166-1
                #   alpha-2).
                #
                #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country, nil]
                optional :country, enum: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country }

                # @!attribute exclude_selectors
                #   Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                #   so an element matching both is removed.
                #
                #   @return [Array<String>, nil]
                optional :exclude_selectors,
                         ContextDev::Internal::Type::ArrayOf[String],
                         api_name: :excludeSelectors,
                         nil?: true

                # @!attribute include_selectors
                #   Keep only the subtrees matching these CSS selectors. Filtered pages are always
                #   fetched fresh, ignoring `maxAgeMs`.
                #
                #   @return [Array<String>, nil]
                optional :include_selectors,
                         ContextDev::Internal::Type::ArrayOf[String],
                         api_name: :includeSelectors,
                         nil?: true

                # @!attribute max_age_ms
                #   Return a cached result if a prior scrape for the same parameters exists and is
                #   younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
                #   omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
                #
                #   @return [Integer, nil]
                optional :max_age_ms, Integer, api_name: :maxAgeMs, nil?: true

                # @!attribute pdf
                #   PDF parsing controls. Use start/end to limit text extraction and embedded-image
                #   detection/OCR to an inclusive 1-based page range.
                #
                #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf, nil]
                optional :pdf, -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf }

                # @!attribute settle_animations
                #   Wait briefly for CSS and transition animations to settle before extraction, on
                #   pages that render in a browser.
                #
                #   @return [Boolean, nil]
                optional :settle_animations, ContextDev::Internal::Type::Boolean, api_name: :settleAnimations

                # @!attribute use_main_content_only
                #   Return the main content without navigation or footers.
                #
                #   @return [Boolean, nil]
                optional :use_main_content_only,
                         ContextDev::Internal::Type::Boolean,
                         api_name: :useMainContentOnly

                # @!attribute wait_for_ms
                #   How long to wait after initial page load, in milliseconds. `0` waits 500 ms.
                #
                #   @return [Integer, nil]
                optional :wait_for_ms, Integer, api_name: :waitForMs

                # @!method initialize(country: nil, exclude_selectors: nil, include_selectors: nil, max_age_ms: nil, pdf: nil, settle_animations: nil, use_main_content_only: nil, wait_for_ms: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options} for
                #   more details.
                #
                #   Options for HTML output.
                #
                #   @param country [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country] Fetch the target page through a residential proxy in this country (ISO 3166-1 al
                #
                #   @param exclude_selectors [Array<String>, nil] Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                #
                #   @param include_selectors [Array<String>, nil] Keep only the subtrees matching these CSS selectors. Filtered pages are always f
                #
                #   @param max_age_ms [Integer, nil] Return a cached result if a prior scrape for the same parameters exists and is y
                #
                #   @param pdf [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf] PDF parsing controls. Use start/end to limit text extraction and embedded-image
                #
                #   @param settle_animations [Boolean] Wait briefly for CSS and transition animations to settle before extraction, on p
                #
                #   @param use_main_content_only [Boolean] Return the main content without navigation or footers.
                #
                #   @param wait_for_ms [Integer] How long to wait after initial page load, in milliseconds. `0` waits 500 ms.

                # Fetch the target page through a residential proxy in this country (ISO 3166-1
                # alpha-2).
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options#country
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

                # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options#pdf
                class Pdf < ContextDev::Internal::Type::BaseModel
                  # @!attribute end_
                  #   Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
                  #   Must be greater than or equal to start when both are provided.
                  #
                  #   @return [Integer, nil]
                  optional :end_, Integer, api_name: :end

                  # @!attribute ocr
                  #   When true, OCR the selected PDF pages that have no usable text layer (scans),
                  #   replacing each recovered page's text with the OCR result while pages with a real
                  #   text layer keep it. Billed at 1 credit per page OCR actually recovered, on top
                  #   of the base request cost. When false, no OCR runs.
                  #
                  #   @return [Boolean, Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf::Ocr, nil]
                  optional :ocr, union: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf::Ocr }

                  # @!attribute should_parse
                  #   When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
                  #   a 400 PDF_SKIPPED is returned.
                  #
                  #   @return [Boolean, Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf::ShouldParse, nil]
                  optional :should_parse,
                           union: -> {
                             ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf::ShouldParse
                           },
                           api_name: :shouldParse

                  # @!attribute start
                  #   First 1-based PDF page to parse. When omitted, parsing starts at the first page.
                  #
                  #   @return [Integer, nil]
                  optional :start, Integer

                  # @!method initialize(end_: nil, ocr: nil, should_parse: nil, start: nil)
                  #   Some parameter documentations has been truncated, see
                  #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf}
                  #   for more details.
                  #
                  #   PDF parsing controls. Use start/end to limit text extraction and embedded-image
                  #   detection/OCR to an inclusive 1-based page range.
                  #
                  #   @param end_ [Integer] Last 1-based PDF page to parse. When omitted, parsing ends at the last page. Mus
                  #
                  #   @param ocr [Boolean, Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf::Ocr] When true, OCR the selected PDF pages that have no usable text layer (scans), re
                  #
                  #   @param should_parse [Boolean, Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf::ShouldParse] When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
                  #
                  #   @param start [Integer] First 1-based PDF page to parse. When omitted, parsing starts at the first page.

                  # When true, OCR the selected PDF pages that have no usable text layer (scans),
                  # replacing each recovered page's text with the OCR result while pages with a real
                  # text layer keep it. Billed at 1 credit per page OCR actually recovered, on top
                  # of the base request cost. When false, no OCR runs.
                  #
                  # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf#ocr
                  module Ocr
                    extend ContextDev::Internal::Type::Union

                    variant ContextDev::Internal::Type::Boolean

                    variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf::Ocr::TRUE }

                    variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf::Ocr::FALSE }

                    # @!method self.variants
                    #   @return [Array(Boolean, Symbol)]

                    define_sorbet_constant!(:Variants) do
                      T.type_alias do
                        T.any(
                          T::Boolean,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf::Ocr::TaggedSymbol
                        )
                      end
                    end

                    # @!group

                    TRUE = :true
                    FALSE = :false

                    # @!endgroup
                  end

                  # When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
                  # a 400 PDF_SKIPPED is returned.
                  #
                  # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf#should_parse
                  module ShouldParse
                    extend ContextDev::Internal::Type::Union

                    variant ContextDev::Internal::Type::Boolean

                    variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf::ShouldParse::TRUE }

                    variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf::ShouldParse::FALSE }

                    # @!method self.variants
                    #   @return [Array(Boolean, Symbol)]

                    define_sorbet_constant!(:Variants) do
                      T.type_alias do
                        T.any(
                          T::Boolean,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf::ShouldParse::TaggedSymbol
                        )
                      end
                    end

                    # @!group

                    TRUE = :true
                    FALSE = :false

                    # @!endgroup
                  end
                end
              end
            end

            # @!method self.variants
            #   @return [Array(ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML)]
          end
        end

        class Crawl < ContextDev::Internal::Type::BaseModel
          # @!attribute data
          #   Crawl source and output format.
          #
          #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML]
          required :data, union: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data }

          # @!attribute mode
          #   Discover and scrape pages from `data.source`.
          #
          #   @return [Symbol, :crawl]
          required :mode, const: :crawl

          # @!method initialize(data:, mode: :crawl)
          #   Crawl pages starting from a URL or from a domain's sitemap.
          #
          #   @param data [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML] Crawl source and output format.
          #
          #   @param mode [Symbol, :crawl] Discover and scrape pages from `data.source`.

          # Crawl source and output format.
          #
          # @see ContextDev::Models::BatchSubmitParams::Input::Crawl#data
          module Data
            extend ContextDev::Internal::Type::Union

            discriminator :format

            # Crawl pages and return Markdown.
            variant :markdown, -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown }

            # Crawl pages and return HTML.
            variant :html, -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML }

            class Markdown < ContextDev::Internal::Type::BaseModel
              # @!attribute format_
              #   Return page content as Markdown.
              #
              #   @return [Symbol, :markdown]
              required :format_, const: :markdown, api_name: :format

              # @!attribute source
              #   How to find pages to crawl.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap]
              required :source, union: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source }

              # @!attribute options
              #   Options for Markdown output.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options, nil]
              optional :options, -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options }

              # @!method initialize(source:, options: nil, format_: :markdown)
              #   Crawl pages and return Markdown.
              #
              #   @param source [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap] How to find pages to crawl.
              #
              #   @param options [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options] Options for Markdown output.
              #
              #   @param format_ [Symbol, :markdown] Return page content as Markdown.

              # How to find pages to crawl.
              #
              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown#source
              module Source
                extend ContextDev::Internal::Type::Union

                discriminator :type

                # Discover pages by following links from one URL.
                variant :start_url, -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL }

                # Scrape the pages listed in a domain's sitemap. Links on those pages are not followed.
                variant :sitemap, -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap }

                class StartURL < ContextDev::Internal::Type::BaseModel
                  # @!attribute type
                  #   Start from one page.
                  #
                  #   @return [Symbol, :start_url]
                  required :type, const: :start_url

                  # @!attribute url
                  #   Page where crawling begins. A URL without a scheme is read as https://.
                  #
                  #   @return [String]
                  required :url, String

                  # @!attribute controls
                  #   Limits and filters for page discovery.
                  #
                  #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls, nil]
                  optional :controls,
                           -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls }

                  # @!method initialize(url:, controls: nil, type: :start_url)
                  #   Discover pages by following links from one URL.
                  #
                  #   @param url [String] Page where crawling begins. A URL without a scheme is read as https://.
                  #
                  #   @param controls [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls] Limits and filters for page discovery.
                  #
                  #   @param type [Symbol, :start_url] Start from one page.

                  # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL#controls
                  class Controls < ContextDev::Internal::Type::BaseModel
                    # @!attribute follow_subdomains
                    #   Follow links to subdomains.
                    #
                    #   @return [Boolean, nil]
                    optional :follow_subdomains,
                             ContextDev::Internal::Type::Boolean,
                             api_name: :followSubdomains

                    # @!attribute max_depth
                    #   Maximum link depth. Source pages are depth 0. No limit when omitted.
                    #
                    #   @return [Integer, nil]
                    optional :max_depth, Integer, api_name: :maxDepth

                    # @!attribute max_urls
                    #   Maximum pages to fetch. Unused reserved credits are refunded. Maximum 25000.
                    #
                    #   @return [Integer, nil]
                    optional :max_urls, Integer, api_name: :maxUrls

                    # @!attribute regex
                    #   RE2 pattern for URLs to include. The `start_url` itself is always included.
                    #
                    #   @return [String, nil]
                    optional :regex, String

                    # @!method initialize(follow_subdomains: nil, max_depth: nil, max_urls: nil, regex: nil)
                    #   Limits and filters for page discovery.
                    #
                    #   @param follow_subdomains [Boolean] Follow links to subdomains.
                    #
                    #   @param max_depth [Integer] Maximum link depth. Source pages are depth 0. No limit when omitted.
                    #
                    #   @param max_urls [Integer] Maximum pages to fetch. Unused reserved credits are refunded. Maximum 25000.
                    #
                    #   @param regex [String] RE2 pattern for URLs to include. The `start_url` itself is always included.
                  end
                end

                class Sitemap < ContextDev::Internal::Type::BaseModel
                  # @!attribute domain
                  #   Domain whose sitemap lists the pages to scrape. A full URL is reduced to its
                  #   domain.
                  #
                  #   @return [String]
                  required :domain, String

                  # @!attribute type
                  #   Scrape the URLs in the domain's sitemap.
                  #
                  #   @return [Symbol, :sitemap]
                  required :type, const: :sitemap

                  # @!attribute controls
                  #   Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                  #   URLs and never follows links off them, so there is no crawl depth here.
                  #
                  #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap::Controls, nil]
                  optional :controls,
                           -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap::Controls }

                  # @!method initialize(domain:, controls: nil, type: :sitemap)
                  #   Some parameter documentations has been truncated, see
                  #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap}
                  #   for more details.
                  #
                  #   Scrape the pages listed in a domain's sitemap. Links on those pages are not
                  #   followed.
                  #
                  #   @param domain [String] Domain whose sitemap lists the pages to scrape. A full URL is reduced to its dom
                  #
                  #   @param controls [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap::Controls] Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those U
                  #
                  #   @param type [Symbol, :sitemap] Scrape the URLs in the domain's sitemap.

                  # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap#controls
                  class Controls < ContextDev::Internal::Type::BaseModel
                    # @!attribute max_urls
                    #   Maximum pages to fetch. Unused reserved credits are refunded. Maximum 25000.
                    #
                    #   @return [Integer, nil]
                    optional :max_urls, Integer, api_name: :maxUrls

                    # @!attribute regex
                    #   RE2 pattern; only sitemap URLs matching it are scraped.
                    #
                    #   @return [String, nil]
                    optional :regex, String

                    # @!method initialize(max_urls: nil, regex: nil)
                    #   Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                    #   URLs and never follows links off them, so there is no crawl depth here.
                    #
                    #   @param max_urls [Integer] Maximum pages to fetch. Unused reserved credits are refunded. Maximum 25000.
                    #
                    #   @param regex [String] RE2 pattern; only sitemap URLs matching it are scraped.
                  end
                end

                # @!method self.variants
                #   @return [Array(ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap)]
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown#options
              class Options < ContextDev::Internal::Type::BaseModel
                # @!attribute country
                #   Fetch the target page through a residential proxy in this country (ISO 3166-1
                #   alpha-2).
                #
                #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country, nil]
                optional :country,
                         enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country }

                # @!attribute exclude_selectors
                #   Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                #   so an element matching both is removed.
                #
                #   @return [Array<String>, nil]
                optional :exclude_selectors,
                         ContextDev::Internal::Type::ArrayOf[String],
                         api_name: :excludeSelectors,
                         nil?: true

                # @!attribute include_html
                #   Also include each page's HTML in its result record, as an `html` field alongside
                #   the Markdown.
                #
                #   @return [Boolean, nil]
                optional :include_html, ContextDev::Internal::Type::Boolean, api_name: :includeHTML

                # @!attribute include_images
                #   Include image references in the Markdown.
                #
                #   @return [Boolean, nil]
                optional :include_images, ContextDev::Internal::Type::Boolean, api_name: :includeImages

                # @!attribute include_links
                #   Include links in the Markdown.
                #
                #   @return [Boolean, nil]
                optional :include_links, ContextDev::Internal::Type::Boolean, api_name: :includeLinks

                # @!attribute include_selectors
                #   Keep only the subtrees matching these CSS selectors. Filtered pages are always
                #   fetched fresh, ignoring `maxAgeMs`.
                #
                #   @return [Array<String>, nil]
                optional :include_selectors,
                         ContextDev::Internal::Type::ArrayOf[String],
                         api_name: :includeSelectors,
                         nil?: true

                # @!attribute max_age_ms
                #   Return a cached result if a prior scrape for the same parameters exists and is
                #   younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
                #   omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
                #
                #   @return [Integer, nil]
                optional :max_age_ms, Integer, api_name: :maxAgeMs, nil?: true

                # @!attribute pdf
                #   PDF parsing controls. Use start/end to limit text extraction and embedded-image
                #   detection/OCR to an inclusive 1-based page range.
                #
                #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf, nil]
                optional :pdf, -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf }

                # @!attribute settle_animations
                #   Wait briefly for CSS and transition animations to settle before extraction, on
                #   pages that render in a browser.
                #
                #   @return [Boolean, nil]
                optional :settle_animations, ContextDev::Internal::Type::Boolean, api_name: :settleAnimations

                # @!attribute shorten_base64_images
                #   Shorten inline base64 image data.
                #
                #   @return [Boolean, nil]
                optional :shorten_base64_images,
                         ContextDev::Internal::Type::Boolean,
                         api_name: :shortenBase64Images

                # @!attribute use_main_content_only
                #   Return the main content without navigation or footers.
                #
                #   @return [Boolean, nil]
                optional :use_main_content_only,
                         ContextDev::Internal::Type::Boolean,
                         api_name: :useMainContentOnly

                # @!attribute wait_for_ms
                #   How long to wait after initial page load, in milliseconds. `0` waits 500 ms.
                #
                #   @return [Integer, nil]
                optional :wait_for_ms, Integer, api_name: :waitForMs

                # @!method initialize(country: nil, exclude_selectors: nil, include_html: nil, include_images: nil, include_links: nil, include_selectors: nil, max_age_ms: nil, pdf: nil, settle_animations: nil, shorten_base64_images: nil, use_main_content_only: nil, wait_for_ms: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options}
                #   for more details.
                #
                #   Options for Markdown output.
                #
                #   @param country [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country] Fetch the target page through a residential proxy in this country (ISO 3166-1 al
                #
                #   @param exclude_selectors [Array<String>, nil] Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                #
                #   @param include_html [Boolean] Also include each page's HTML in its result record, as an `html` field alongside
                #
                #   @param include_images [Boolean] Include image references in the Markdown.
                #
                #   @param include_links [Boolean] Include links in the Markdown.
                #
                #   @param include_selectors [Array<String>, nil] Keep only the subtrees matching these CSS selectors. Filtered pages are always f
                #
                #   @param max_age_ms [Integer, nil] Return a cached result if a prior scrape for the same parameters exists and is y
                #
                #   @param pdf [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf] PDF parsing controls. Use start/end to limit text extraction and embedded-image
                #
                #   @param settle_animations [Boolean] Wait briefly for CSS and transition animations to settle before extraction, on p
                #
                #   @param shorten_base64_images [Boolean] Shorten inline base64 image data.
                #
                #   @param use_main_content_only [Boolean] Return the main content without navigation or footers.
                #
                #   @param wait_for_ms [Integer] How long to wait after initial page load, in milliseconds. `0` waits 500 ms.

                # Fetch the target page through a residential proxy in this country (ISO 3166-1
                # alpha-2).
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options#country
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

                # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options#pdf
                class Pdf < ContextDev::Internal::Type::BaseModel
                  # @!attribute end_
                  #   Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
                  #   Must be greater than or equal to start when both are provided.
                  #
                  #   @return [Integer, nil]
                  optional :end_, Integer, api_name: :end

                  # @!attribute ocr
                  #   When true, OCR the selected PDF pages that have no usable text layer (scans),
                  #   replacing each recovered page's text with the OCR result while pages with a real
                  #   text layer keep it. Billed at 1 credit per page OCR actually recovered, on top
                  #   of the base request cost. When false, no OCR runs.
                  #
                  #   @return [Boolean, Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf::Ocr, nil]
                  optional :ocr,
                           union: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf::Ocr }

                  # @!attribute should_parse
                  #   When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
                  #   a 400 PDF_SKIPPED is returned.
                  #
                  #   @return [Boolean, Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf::ShouldParse, nil]
                  optional :should_parse,
                           union: -> {
                             ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf::ShouldParse
                           },
                           api_name: :shouldParse

                  # @!attribute start
                  #   First 1-based PDF page to parse. When omitted, parsing starts at the first page.
                  #
                  #   @return [Integer, nil]
                  optional :start, Integer

                  # @!method initialize(end_: nil, ocr: nil, should_parse: nil, start: nil)
                  #   Some parameter documentations has been truncated, see
                  #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf}
                  #   for more details.
                  #
                  #   PDF parsing controls. Use start/end to limit text extraction and embedded-image
                  #   detection/OCR to an inclusive 1-based page range.
                  #
                  #   @param end_ [Integer] Last 1-based PDF page to parse. When omitted, parsing ends at the last page. Mus
                  #
                  #   @param ocr [Boolean, Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf::Ocr] When true, OCR the selected PDF pages that have no usable text layer (scans), re
                  #
                  #   @param should_parse [Boolean, Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf::ShouldParse] When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
                  #
                  #   @param start [Integer] First 1-based PDF page to parse. When omitted, parsing starts at the first page.

                  # When true, OCR the selected PDF pages that have no usable text layer (scans),
                  # replacing each recovered page's text with the OCR result while pages with a real
                  # text layer keep it. Billed at 1 credit per page OCR actually recovered, on top
                  # of the base request cost. When false, no OCR runs.
                  #
                  # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf#ocr
                  module Ocr
                    extend ContextDev::Internal::Type::Union

                    variant ContextDev::Internal::Type::Boolean

                    variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf::Ocr::TRUE }

                    variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf::Ocr::FALSE }

                    # @!method self.variants
                    #   @return [Array(Boolean, Symbol)]

                    define_sorbet_constant!(:Variants) do
                      T.type_alias do
                        T.any(
                          T::Boolean,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf::Ocr::TaggedSymbol
                        )
                      end
                    end

                    # @!group

                    TRUE = :true
                    FALSE = :false

                    # @!endgroup
                  end

                  # When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
                  # a 400 PDF_SKIPPED is returned.
                  #
                  # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf#should_parse
                  module ShouldParse
                    extend ContextDev::Internal::Type::Union

                    variant ContextDev::Internal::Type::Boolean

                    variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf::ShouldParse::TRUE }

                    variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf::ShouldParse::FALSE }

                    # @!method self.variants
                    #   @return [Array(Boolean, Symbol)]

                    define_sorbet_constant!(:Variants) do
                      T.type_alias do
                        T.any(
                          T::Boolean,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf::ShouldParse::TaggedSymbol
                        )
                      end
                    end

                    # @!group

                    TRUE = :true
                    FALSE = :false

                    # @!endgroup
                  end
                end
              end
            end

            class HTML < ContextDev::Internal::Type::BaseModel
              # @!attribute format_
              #   Return page content as HTML.
              #
              #   @return [Symbol, :html]
              required :format_, const: :html, api_name: :format

              # @!attribute source
              #   How to find pages to crawl.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap]
              required :source, union: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source }

              # @!attribute options
              #   Options for HTML output.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options, nil]
              optional :options, -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options }

              # @!method initialize(source:, options: nil, format_: :html)
              #   Crawl pages and return HTML.
              #
              #   @param source [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap] How to find pages to crawl.
              #
              #   @param options [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options] Options for HTML output.
              #
              #   @param format_ [Symbol, :html] Return page content as HTML.

              # How to find pages to crawl.
              #
              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML#source
              module Source
                extend ContextDev::Internal::Type::Union

                discriminator :type

                # Discover pages by following links from one URL.
                variant :start_url, -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL }

                # Scrape the pages listed in a domain's sitemap. Links on those pages are not followed.
                variant :sitemap, -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap }

                class StartURL < ContextDev::Internal::Type::BaseModel
                  # @!attribute type
                  #   Start from one page.
                  #
                  #   @return [Symbol, :start_url]
                  required :type, const: :start_url

                  # @!attribute url
                  #   Page where crawling begins. A URL without a scheme is read as https://.
                  #
                  #   @return [String]
                  required :url, String

                  # @!attribute controls
                  #   Limits and filters for page discovery.
                  #
                  #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls, nil]
                  optional :controls,
                           -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls }

                  # @!method initialize(url:, controls: nil, type: :start_url)
                  #   Discover pages by following links from one URL.
                  #
                  #   @param url [String] Page where crawling begins. A URL without a scheme is read as https://.
                  #
                  #   @param controls [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls] Limits and filters for page discovery.
                  #
                  #   @param type [Symbol, :start_url] Start from one page.

                  # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL#controls
                  class Controls < ContextDev::Internal::Type::BaseModel
                    # @!attribute follow_subdomains
                    #   Follow links to subdomains.
                    #
                    #   @return [Boolean, nil]
                    optional :follow_subdomains,
                             ContextDev::Internal::Type::Boolean,
                             api_name: :followSubdomains

                    # @!attribute max_depth
                    #   Maximum link depth. Source pages are depth 0. No limit when omitted.
                    #
                    #   @return [Integer, nil]
                    optional :max_depth, Integer, api_name: :maxDepth

                    # @!attribute max_urls
                    #   Maximum pages to fetch. Unused reserved credits are refunded. Maximum 25000.
                    #
                    #   @return [Integer, nil]
                    optional :max_urls, Integer, api_name: :maxUrls

                    # @!attribute regex
                    #   RE2 pattern for URLs to include. The `start_url` itself is always included.
                    #
                    #   @return [String, nil]
                    optional :regex, String

                    # @!method initialize(follow_subdomains: nil, max_depth: nil, max_urls: nil, regex: nil)
                    #   Limits and filters for page discovery.
                    #
                    #   @param follow_subdomains [Boolean] Follow links to subdomains.
                    #
                    #   @param max_depth [Integer] Maximum link depth. Source pages are depth 0. No limit when omitted.
                    #
                    #   @param max_urls [Integer] Maximum pages to fetch. Unused reserved credits are refunded. Maximum 25000.
                    #
                    #   @param regex [String] RE2 pattern for URLs to include. The `start_url` itself is always included.
                  end
                end

                class Sitemap < ContextDev::Internal::Type::BaseModel
                  # @!attribute domain
                  #   Domain whose sitemap lists the pages to scrape. A full URL is reduced to its
                  #   domain.
                  #
                  #   @return [String]
                  required :domain, String

                  # @!attribute type
                  #   Scrape the URLs in the domain's sitemap.
                  #
                  #   @return [Symbol, :sitemap]
                  required :type, const: :sitemap

                  # @!attribute controls
                  #   Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                  #   URLs and never follows links off them, so there is no crawl depth here.
                  #
                  #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap::Controls, nil]
                  optional :controls,
                           -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap::Controls }

                  # @!method initialize(domain:, controls: nil, type: :sitemap)
                  #   Some parameter documentations has been truncated, see
                  #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap}
                  #   for more details.
                  #
                  #   Scrape the pages listed in a domain's sitemap. Links on those pages are not
                  #   followed.
                  #
                  #   @param domain [String] Domain whose sitemap lists the pages to scrape. A full URL is reduced to its dom
                  #
                  #   @param controls [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap::Controls] Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those U
                  #
                  #   @param type [Symbol, :sitemap] Scrape the URLs in the domain's sitemap.

                  # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap#controls
                  class Controls < ContextDev::Internal::Type::BaseModel
                    # @!attribute max_urls
                    #   Maximum pages to fetch. Unused reserved credits are refunded. Maximum 25000.
                    #
                    #   @return [Integer, nil]
                    optional :max_urls, Integer, api_name: :maxUrls

                    # @!attribute regex
                    #   RE2 pattern; only sitemap URLs matching it are scraped.
                    #
                    #   @return [String, nil]
                    optional :regex, String

                    # @!method initialize(max_urls: nil, regex: nil)
                    #   Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                    #   URLs and never follows links off them, so there is no crawl depth here.
                    #
                    #   @param max_urls [Integer] Maximum pages to fetch. Unused reserved credits are refunded. Maximum 25000.
                    #
                    #   @param regex [String] RE2 pattern; only sitemap URLs matching it are scraped.
                  end
                end

                # @!method self.variants
                #   @return [Array(ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap)]
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML#options
              class Options < ContextDev::Internal::Type::BaseModel
                # @!attribute country
                #   Fetch the target page through a residential proxy in this country (ISO 3166-1
                #   alpha-2).
                #
                #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country, nil]
                optional :country, enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country }

                # @!attribute exclude_selectors
                #   Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                #   so an element matching both is removed.
                #
                #   @return [Array<String>, nil]
                optional :exclude_selectors,
                         ContextDev::Internal::Type::ArrayOf[String],
                         api_name: :excludeSelectors,
                         nil?: true

                # @!attribute include_selectors
                #   Keep only the subtrees matching these CSS selectors. Filtered pages are always
                #   fetched fresh, ignoring `maxAgeMs`.
                #
                #   @return [Array<String>, nil]
                optional :include_selectors,
                         ContextDev::Internal::Type::ArrayOf[String],
                         api_name: :includeSelectors,
                         nil?: true

                # @!attribute max_age_ms
                #   Return a cached result if a prior scrape for the same parameters exists and is
                #   younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
                #   omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
                #
                #   @return [Integer, nil]
                optional :max_age_ms, Integer, api_name: :maxAgeMs, nil?: true

                # @!attribute pdf
                #   PDF parsing controls. Use start/end to limit text extraction and embedded-image
                #   detection/OCR to an inclusive 1-based page range.
                #
                #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf, nil]
                optional :pdf, -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf }

                # @!attribute settle_animations
                #   Wait briefly for CSS and transition animations to settle before extraction, on
                #   pages that render in a browser.
                #
                #   @return [Boolean, nil]
                optional :settle_animations, ContextDev::Internal::Type::Boolean, api_name: :settleAnimations

                # @!attribute use_main_content_only
                #   Return the main content without navigation or footers.
                #
                #   @return [Boolean, nil]
                optional :use_main_content_only,
                         ContextDev::Internal::Type::Boolean,
                         api_name: :useMainContentOnly

                # @!attribute wait_for_ms
                #   How long to wait after initial page load, in milliseconds. `0` waits 500 ms.
                #
                #   @return [Integer, nil]
                optional :wait_for_ms, Integer, api_name: :waitForMs

                # @!method initialize(country: nil, exclude_selectors: nil, include_selectors: nil, max_age_ms: nil, pdf: nil, settle_animations: nil, use_main_content_only: nil, wait_for_ms: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options} for
                #   more details.
                #
                #   Options for HTML output.
                #
                #   @param country [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country] Fetch the target page through a residential proxy in this country (ISO 3166-1 al
                #
                #   @param exclude_selectors [Array<String>, nil] Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                #
                #   @param include_selectors [Array<String>, nil] Keep only the subtrees matching these CSS selectors. Filtered pages are always f
                #
                #   @param max_age_ms [Integer, nil] Return a cached result if a prior scrape for the same parameters exists and is y
                #
                #   @param pdf [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf] PDF parsing controls. Use start/end to limit text extraction and embedded-image
                #
                #   @param settle_animations [Boolean] Wait briefly for CSS and transition animations to settle before extraction, on p
                #
                #   @param use_main_content_only [Boolean] Return the main content without navigation or footers.
                #
                #   @param wait_for_ms [Integer] How long to wait after initial page load, in milliseconds. `0` waits 500 ms.

                # Fetch the target page through a residential proxy in this country (ISO 3166-1
                # alpha-2).
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options#country
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

                # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options#pdf
                class Pdf < ContextDev::Internal::Type::BaseModel
                  # @!attribute end_
                  #   Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
                  #   Must be greater than or equal to start when both are provided.
                  #
                  #   @return [Integer, nil]
                  optional :end_, Integer, api_name: :end

                  # @!attribute ocr
                  #   When true, OCR the selected PDF pages that have no usable text layer (scans),
                  #   replacing each recovered page's text with the OCR result while pages with a real
                  #   text layer keep it. Billed at 1 credit per page OCR actually recovered, on top
                  #   of the base request cost. When false, no OCR runs.
                  #
                  #   @return [Boolean, Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf::Ocr, nil]
                  optional :ocr, union: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf::Ocr }

                  # @!attribute should_parse
                  #   When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
                  #   a 400 PDF_SKIPPED is returned.
                  #
                  #   @return [Boolean, Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf::ShouldParse, nil]
                  optional :should_parse,
                           union: -> {
                             ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf::ShouldParse
                           },
                           api_name: :shouldParse

                  # @!attribute start
                  #   First 1-based PDF page to parse. When omitted, parsing starts at the first page.
                  #
                  #   @return [Integer, nil]
                  optional :start, Integer

                  # @!method initialize(end_: nil, ocr: nil, should_parse: nil, start: nil)
                  #   Some parameter documentations has been truncated, see
                  #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf}
                  #   for more details.
                  #
                  #   PDF parsing controls. Use start/end to limit text extraction and embedded-image
                  #   detection/OCR to an inclusive 1-based page range.
                  #
                  #   @param end_ [Integer] Last 1-based PDF page to parse. When omitted, parsing ends at the last page. Mus
                  #
                  #   @param ocr [Boolean, Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf::Ocr] When true, OCR the selected PDF pages that have no usable text layer (scans), re
                  #
                  #   @param should_parse [Boolean, Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf::ShouldParse] When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
                  #
                  #   @param start [Integer] First 1-based PDF page to parse. When omitted, parsing starts at the first page.

                  # When true, OCR the selected PDF pages that have no usable text layer (scans),
                  # replacing each recovered page's text with the OCR result while pages with a real
                  # text layer keep it. Billed at 1 credit per page OCR actually recovered, on top
                  # of the base request cost. When false, no OCR runs.
                  #
                  # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf#ocr
                  module Ocr
                    extend ContextDev::Internal::Type::Union

                    variant ContextDev::Internal::Type::Boolean

                    variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf::Ocr::TRUE }

                    variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf::Ocr::FALSE }

                    # @!method self.variants
                    #   @return [Array(Boolean, Symbol)]

                    define_sorbet_constant!(:Variants) do
                      T.type_alias do
                        T.any(
                          T::Boolean,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf::Ocr::TaggedSymbol
                        )
                      end
                    end

                    # @!group

                    TRUE = :true
                    FALSE = :false

                    # @!endgroup
                  end

                  # When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
                  # a 400 PDF_SKIPPED is returned.
                  #
                  # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf#should_parse
                  module ShouldParse
                    extend ContextDev::Internal::Type::Union

                    variant ContextDev::Internal::Type::Boolean

                    variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf::ShouldParse::TRUE }

                    variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf::ShouldParse::FALSE }

                    # @!method self.variants
                    #   @return [Array(Boolean, Symbol)]

                    define_sorbet_constant!(:Variants) do
                      T.type_alias do
                        T.any(
                          T::Boolean,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf::ShouldParse::TaggedSymbol
                        )
                      end
                    end

                    # @!group

                    TRUE = :true
                    FALSE = :false

                    # @!endgroup
                  end
                end
              end
            end

            # @!method self.variants
            #   @return [Array(ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML)]
          end
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::BatchSubmitParams::Input::Scrape, ContextDev::Models::BatchSubmitParams::Input::Crawl)]
      end
    end
  end
end
