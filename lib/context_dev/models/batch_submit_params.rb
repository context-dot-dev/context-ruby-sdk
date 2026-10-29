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

      # @!attribute policies
      #   Access policy IDs to apply to every page. A URL must pass every policy.
      #
      #   @return [Array<String>, nil]
      optional :policies, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute tags
      #   Tags stored on the batch. Filter the batch list by them later.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute webhook
      #   Where to send the batch's final-status event. Omit `retry` for one attempt; `{}`
      #   uses the default retry schedule.
      #
      #   @return [ContextDev::Models::BatchSubmitParams::Webhook, nil]
      optional :webhook, -> { ContextDev::BatchSubmitParams::Webhook }

      # @!attribute webhook_url
      #   Legacy URL notified when the batch finishes. Preserves one best-effort attempt.
      #   Cannot be combined with webhook.
      #
      #   @return [String, nil]
      optional :webhook_url, String, api_name: :webhookUrl

      # @!attribute idempotency_key
      #   Unique key per submission. Retrying with the same key and body returns the
      #   original batch; a different body returns `409`.
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(input:, policies: nil, tags: nil, webhook: nil, webhook_url: nil, idempotency_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchSubmitParams} for more details.
      #
      #   @param input [ContextDev::Models::BatchSubmitParams::Input::Scrape, ContextDev::Models::BatchSubmitParams::Input::Crawl] Choose a URL list or a site crawl.
      #
      #   @param policies [Array<String>] Access policy IDs to apply to every page. A URL must pass every policy.
      #
      #   @param tags [Array<String>] Tags stored on the batch. Filter the batch list by them later.
      #
      #   @param webhook [ContextDev::Models::BatchSubmitParams::Webhook] Where to send the batch's final-status event. Omit `retry` for one attempt; `{}`
      #
      #   @param webhook_url [String] Legacy URL notified when the batch finishes. Preserves one best-effort attempt.
      #
      #   @param idempotency_key [String] Unique key per submission. Retrying with the same key and body returns the origi
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Choose a URL list or a site crawl.
      module Input
        extend ContextDev::Internal::Type::Union

        discriminator :mode

        # Scrape a list of up to 100,000 URLs.
        variant :scrape, -> { ContextDev::BatchSubmitParams::Input::Scrape }

        # Crawl pages starting from a URL or from a domain's sitemap.
        variant :crawl, -> { ContextDev::BatchSubmitParams::Input::Crawl }

        class Scrape < ContextDev::Internal::Type::BaseModel
          # @!attribute data
          #   Pages to scrape and their output format.
          #
          #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData]
          required :data, union: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data }

          # @!attribute mode
          #   Scrape the pages in `data.urls`.
          #
          #   @return [Symbol, :scrape]
          required :mode, const: :scrape

          # @!method initialize(data:, mode: :scrape)
          #   Scrape a list of up to 100,000 URLs.
          #
          #   @param data [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData] Pages to scrape and their output format.
          #
          #   @param mode [Symbol, :scrape] Scrape the pages in `data.urls`.

          # Pages to scrape and their output format.
          #
          # @see ContextDev::Models::BatchSubmitParams::Input::Scrape#data
          module Data
            extend ContextDev::Internal::Type::Union

            # Scrape the listed pages as Markdown.
            variant -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown }

            # Scrape the listed pages as HTML.
            variant -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML }

            # Use the same formats and parameters as POST /web/scrape, replacing url with urls. Options apply to every page.
            variant -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData }

            # @deprecated
            class Markdown < ContextDev::Internal::Type::BaseModel
              # @!attribute format_
              #   Return page content as Markdown.
              #
              #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Format]
              required :format_,
                       enum: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Format },
                       api_name: :format

              # @!attribute urls
              #   Pages to scrape. Maximum 100000.
              #
              #   @return [Array<ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::URL>]
              required :urls,
                       -> { ContextDev::Internal::Type::ArrayOf[ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::URL] }

              # @!attribute options
              #   Options for Markdown output.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options, nil]
              optional :options, -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options }

              # @!method initialize(format_:, urls:, options: nil)
              #   Scrape the listed pages as Markdown.
              #
              #   @param format_ [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Format] Return page content as Markdown.
              #
              #   @param urls [Array<ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::URL>] Pages to scrape. Maximum 100000.
              #
              #   @param options [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options] Options for Markdown output.

              # Return page content as Markdown.
              #
              # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown#format_
              module Format
                extend ContextDev::Internal::Type::Enum

                MARKDOWN = :markdown

                # @!method self.values
                #   @return [Array<Symbol>]
              end

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
                #   Fetch from this country (ISO 3166-1 alpha-2).
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
                #   Also return each page's HTML in `html`.
                #
                #   @return [Boolean, nil]
                optional :include_html, ContextDev::Internal::Type::Boolean, api_name: :includeHTML

                # @!attribute include_images
                #   Include image references in the Markdown (`html-conversion` only).
                #
                #   @return [Boolean, nil]
                optional :include_images, ContextDev::Internal::Type::Boolean, api_name: :includeImages

                # @!attribute include_links
                #   Include links in the Markdown (`html-conversion` only).
                #
                #   @return [Boolean, nil]
                optional :include_links, ContextDev::Internal::Type::Boolean, api_name: :includeLinks

                # @!attribute include_selectors
                #   Keep only elements matching these CSS selectors. Filtered pages ignore
                #   `maxAgeMs`.
                #
                #   @return [Array<String>, nil]
                optional :include_selectors,
                         ContextDev::Internal::Type::ArrayOf[String],
                         api_name: :includeSelectors,
                         nil?: true

                # @!attribute max_age_ms
                #   Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                #   year (31536000000 ms). `0` fetches fresh.
                #
                #   @return [Integer, nil]
                optional :max_age_ms, Integer, api_name: :maxAgeMs, nil?: true

                # @!attribute pdf
                #   PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                #
                #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf, nil]
                optional :pdf, -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf }

                # @!attribute settle_animations
                #   Wait for CSS animations to finish before extracting, on browser-rendered pages.
                #
                #   @return [Boolean, nil]
                optional :settle_animations, ContextDev::Internal::Type::Boolean, api_name: :settleAnimations

                # @!attribute shorten_base64_images
                #   Shorten inline base64 image data (`html-conversion` only).
                #
                #   @return [Boolean, nil]
                optional :shorten_base64_images,
                         ContextDev::Internal::Type::Boolean,
                         api_name: :shortenBase64Images

                # @!attribute source_preference
                #   Markdown sources in order of preference: `html-conversion` converts the page
                #   HTML, `markdown-direct` uses Markdown the site publishes.
                #
                #   @return [Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::SourcePreference>, nil]
                optional :source_preference,
                         -> {
                           ContextDev::Internal::Type::ArrayOf[enum: ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::SourcePreference]
                         },
                         api_name: :sourcePreference

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

                # @!method initialize(country: nil, exclude_selectors: nil, include_html: nil, include_images: nil, include_links: nil, include_selectors: nil, max_age_ms: nil, pdf: nil, settle_animations: nil, shorten_base64_images: nil, source_preference: nil, use_main_content_only: nil, wait_for_ms: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options}
                #   for more details.
                #
                #   Options for Markdown output.
                #
                #   @param country [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country] Fetch from this country (ISO 3166-1 alpha-2).
                #
                #   @param exclude_selectors [Array<String>, nil] Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                #
                #   @param include_html [Boolean] Also return each page's HTML in `html`.
                #
                #   @param include_images [Boolean] Include image references in the Markdown (`html-conversion` only).
                #
                #   @param include_links [Boolean] Include links in the Markdown (`html-conversion` only).
                #
                #   @param include_selectors [Array<String>, nil] Keep only elements matching these CSS selectors. Filtered pages ignore `maxAgeMs
                #
                #   @param max_age_ms [Integer, nil] Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                #
                #   @param pdf [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf] PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                #
                #   @param settle_animations [Boolean] Wait for CSS animations to finish before extracting, on browser-rendered pages.
                #
                #   @param shorten_base64_images [Boolean] Shorten inline base64 image data (`html-conversion` only).
                #
                #   @param source_preference [Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::SourcePreference>] Markdown sources in order of preference: `html-conversion` converts the page HTM
                #
                #   @param use_main_content_only [Boolean] Return the main content without navigation or footers.
                #
                #   @param wait_for_ms [Integer] How long to wait after initial page load, in milliseconds. `0` waits 500 ms.

                # Fetch from this country (ISO 3166-1 alpha-2).
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
                  #   Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
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
                  #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf}
                  #   for more details.
                  #
                  #   PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                  #
                  #   @param end_ [Integer] Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must be
                  #
                  #   @param ocr [Boolean] Read scanned PDF pages with OCR; preserve pages that already have text.
                  #
                  #   @param should_parse [Boolean] Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
                  #
                  #   @param start [Integer] First 1-based PDF page to parse.
                end

                module SourcePreference
                  extend ContextDev::Internal::Type::Enum

                  HTML_CONVERSION = :"html-conversion"
                  MARKDOWN_DIRECT = :"markdown-direct"

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end
            end

            # @deprecated
            class HTML < ContextDev::Internal::Type::BaseModel
              # @!attribute format_
              #   Return page content as HTML.
              #
              #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Format]
              required :format_,
                       enum: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Format },
                       api_name: :format

              # @!attribute urls
              #   Pages to scrape. Maximum 100000.
              #
              #   @return [Array<ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::URL>]
              required :urls,
                       -> { ContextDev::Internal::Type::ArrayOf[ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::URL] }

              # @!attribute options
              #   Options for HTML output.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options, nil]
              optional :options, -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options }

              # @!method initialize(format_:, urls:, options: nil)
              #   Scrape the listed pages as HTML.
              #
              #   @param format_ [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Format] Return page content as HTML.
              #
              #   @param urls [Array<ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::URL>] Pages to scrape. Maximum 100000.
              #
              #   @param options [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options] Options for HTML output.

              # Return page content as HTML.
              #
              # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML#format_
              module Format
                extend ContextDev::Internal::Type::Enum

                HTML = :html

                # @!method self.values
                #   @return [Array<Symbol>]
              end

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
                #   Fetch from this country (ISO 3166-1 alpha-2).
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
                #   Keep only elements matching these CSS selectors. Filtered pages ignore
                #   `maxAgeMs`.
                #
                #   @return [Array<String>, nil]
                optional :include_selectors,
                         ContextDev::Internal::Type::ArrayOf[String],
                         api_name: :includeSelectors,
                         nil?: true

                # @!attribute max_age_ms
                #   Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                #   year (31536000000 ms). `0` fetches fresh.
                #
                #   @return [Integer, nil]
                optional :max_age_ms, Integer, api_name: :maxAgeMs, nil?: true

                # @!attribute pdf
                #   PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                #
                #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf, nil]
                optional :pdf, -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf }

                # @!attribute settle_animations
                #   Wait for CSS animations to finish before extracting, on browser-rendered pages.
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
                #   @param country [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country] Fetch from this country (ISO 3166-1 alpha-2).
                #
                #   @param exclude_selectors [Array<String>, nil] Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                #
                #   @param include_selectors [Array<String>, nil] Keep only elements matching these CSS selectors. Filtered pages ignore `maxAgeMs
                #
                #   @param max_age_ms [Integer, nil] Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                #
                #   @param pdf [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf] PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                #
                #   @param settle_animations [Boolean] Wait for CSS animations to finish before extracting, on browser-rendered pages.
                #
                #   @param use_main_content_only [Boolean] Return the main content without navigation or footers.
                #
                #   @param wait_for_ms [Integer] How long to wait after initial page load, in milliseconds. `0` waits 500 ms.

                # Fetch from this country (ISO 3166-1 alpha-2).
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
                  #   Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
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
                  #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf}
                  #   for more details.
                  #
                  #   PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                  #
                  #   @param end_ [Integer] Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must be
                  #
                  #   @param ocr [Boolean] Read scanned PDF pages with OCR; preserve pages that already have text.
                  #
                  #   @param should_parse [Boolean] Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
                  #
                  #   @param start [Integer] First 1-based PDF page to parse.
                end
              end
            end

            class BatchUnifiedScrapeData < ContextDev::Internal::Type::BaseModel
              # @!attribute formats
              #   Outputs to return. Set at least one to `true`.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Formats]
              required :formats,
                       -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Formats }

              # @!attribute urls
              #   Pages to scrape. Maximum 100000.
              #
              #   @return [Array<ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::URL>]
              required :urls,
                       -> { ContextDev::Internal::Type::ArrayOf[ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::URL] }

              # @!attribute highlights_params
              #   Requires `formats.highlights: true`; required when it is set.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::HighlightsParams, nil]
              optional :highlights_params,
                       -> {
                         ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::HighlightsParams
                       },
                       api_name: :highlightsParams

              # @!attribute image_params
              #   Image options. Requires formats.images: true.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams, nil]
              optional :image_params,
                       -> {
                         ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams
                       },
                       api_name: :imageParams

              # @!attribute json_params
              #   Requires `formats.json: true`; required when it is set.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::JsonParams, nil]
              optional :json_params,
                       -> {
                         ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::JsonParams
                       },
                       api_name: :jsonParams

              # @!attribute markdown_params
              #   Markdown options. Requires `formats.markdown`.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams, nil]
              optional :markdown_params,
                       -> {
                         ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams
                       },
                       api_name: :markdownParams

              # @!attribute max_age_ms
              #   Maximum age of a cached output, in milliseconds. `0` fetches fresh. Defaults to
              #   3 days (259200000 ms). Maximum: 1 year (31536000000 ms).
              #
              #   @return [Integer, nil]
              optional :max_age_ms, Integer, api_name: :maxAgeMs

              # @!attribute parse_params
              #   Requires `formats.parse: true`; required when it is set.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser, nil]
              optional :parse_params,
                       union: -> {
                         ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams
                       },
                       api_name: :parseParams

              # @!attribute product_params
              #   Product options. Requires formats.product: true.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ProductParams, nil]
              optional :product_params,
                       -> {
                         ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ProductParams
                       },
                       api_name: :productParams

              # @!attribute screenshot_params
              #   Screenshot options. Requires formats.screenshot: true.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams, nil]
              optional :screenshot_params,
                       -> {
                         ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams
                       },
                       api_name: :screenshotParams

              # @!attribute shared_params
              #   Browser and content settings shared by all outputs.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams, nil]
              optional :shared_params,
                       -> {
                         ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams
                       },
                       api_name: :sharedParams

              # @!attribute tags
              #   Labels for filtering usage in the dashboard.
              #
              #   @return [Array<String>, nil]
              optional :tags, ContextDev::Internal::Type::ArrayOf[String]

              # @!attribute timeout_opts
              #   Deadline for each page, using the same behavior and defaults as POST
              #   /web/scrape.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts, nil]
              optional :timeout_opts,
                       -> {
                         ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts
                       },
                       api_name: :timeoutOpts

              # @!attribute zdr
              #   Batches persist their results. Only disabled is supported; enabled returns
              #   ZDR_NOT_SUPPORTED.
              #
              #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Zdr, nil]
              optional :zdr,
                       enum: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Zdr }

              # @!method initialize(formats:, urls:, highlights_params: nil, image_params: nil, json_params: nil, markdown_params: nil, max_age_ms: nil, parse_params: nil, product_params: nil, screenshot_params: nil, shared_params: nil, tags: nil, timeout_opts: nil, zdr: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData}
              #   for more details.
              #
              #   Use the same formats and parameters as POST /web/scrape, replacing url with
              #   urls. Options apply to every page.
              #
              #   @param formats [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Formats] Outputs to return. Set at least one to `true`.
              #
              #   @param urls [Array<ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::URL>] Pages to scrape. Maximum 100000.
              #
              #   @param highlights_params [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::HighlightsParams] Requires `formats.highlights: true`; required when it is set.
              #
              #   @param image_params [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams] Image options. Requires formats.images: true.
              #
              #   @param json_params [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::JsonParams] Requires `formats.json: true`; required when it is set.
              #
              #   @param markdown_params [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams] Markdown options. Requires `formats.markdown`.
              #
              #   @param max_age_ms [Integer] Maximum age of a cached output, in milliseconds. `0` fetches fresh. Defaults to
              #
              #   @param parse_params [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser] Requires `formats.parse: true`; required when it is set.
              #
              #   @param product_params [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ProductParams] Product options. Requires formats.product: true.
              #
              #   @param screenshot_params [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams] Screenshot options. Requires formats.screenshot: true.
              #
              #   @param shared_params [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams] Browser and content settings shared by all outputs.
              #
              #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
              #
              #   @param timeout_opts [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts] Deadline for each page, using the same behavior and defaults as POST /web/scrape
              #
              #   @param zdr [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Zdr] Batches persist their results. Only disabled is supported; enabled returns ZDR_N

              # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData#formats
              class Formats < ContextDev::Internal::Type::BaseModel
                # @!attribute bytes
                #   The original HTTP response body.
                #
                #   @return [Boolean, nil]
                optional :bytes, ContextDev::Internal::Type::Boolean

                # @!attribute highlights
                #   Markdown excerpts relevant to `highlightsParams.query`.
                #
                #   @return [Boolean, nil]
                optional :highlights, ContextDev::Internal::Type::Boolean

                # @!attribute html
                #   Rendered HTML.
                #
                #   @return [Boolean, nil]
                optional :html, ContextDev::Internal::Type::Boolean

                # @!attribute images
                #   Images found on the page.
                #
                #   @return [Boolean, nil]
                optional :images, ContextDev::Internal::Type::Boolean

                # @!attribute json
                #   An object matching `jsonParams.schema`, extracted from the page.
                #
                #   @return [Boolean, nil]
                optional :json, ContextDev::Internal::Type::Boolean

                # @!attribute markdown
                #   Page content as Markdown.
                #
                #   @return [Boolean, nil]
                optional :markdown, ContextDev::Internal::Type::Boolean

                # @!attribute parse
                #   Fields extracted with custom rules or a prebuilt parser, returned as `parsed`.
                #
                #   @return [Boolean, nil]
                optional :parse, ContextDev::Internal::Type::Boolean

                # @!attribute product
                #   Product details such as name, price, and availability.
                #
                #   @return [Boolean, nil]
                optional :product, ContextDev::Internal::Type::Boolean

                # @!attribute screenshot
                #   A screenshot of the page.
                #
                #   @return [Boolean, nil]
                optional :screenshot, ContextDev::Internal::Type::Boolean

                # @!method initialize(bytes: nil, highlights: nil, html: nil, images: nil, json: nil, markdown: nil, parse: nil, product: nil, screenshot: nil)
                #   Outputs to return. Set at least one to `true`.
                #
                #   @param bytes [Boolean] The original HTTP response body.
                #
                #   @param highlights [Boolean] Markdown excerpts relevant to `highlightsParams.query`.
                #
                #   @param html [Boolean] Rendered HTML.
                #
                #   @param images [Boolean] Images found on the page.
                #
                #   @param json [Boolean] An object matching `jsonParams.schema`, extracted from the page.
                #
                #   @param markdown [Boolean] Page content as Markdown.
                #
                #   @param parse [Boolean] Fields extracted with custom rules or a prebuilt parser, returned as `parsed`.
                #
                #   @param product [Boolean] Product details such as name, price, and availability.
                #
                #   @param screenshot [Boolean] A screenshot of the page.
              end

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
                #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::URL}
                #   for more details.
                #
                #   A page to scrape, with optional data for matching results.
                #
                #   @param url [String] Page URL to scrape.
                #
                #   @param item_id [String] Your ID for this page, returned with its result. The same URL can use different
                #
                #   @param meta [Hash{Symbol=>Object}] Custom JSON returned unchanged with this page result.
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData#highlights_params
              class HighlightsParams < ContextDev::Internal::Type::BaseModel
                # @!attribute query
                #   The question or topic to find passages for.
                #
                #   @return [String]
                required :query, String

                # @!attribute max_characters
                #   Maximum combined length of returned passages.
                #
                #   @return [Integer, nil]
                optional :max_characters, Integer, api_name: :maxCharacters

                # @!method initialize(query:, max_characters: nil)
                #   Requires `formats.highlights: true`; required when it is set.
                #
                #   @param query [String] The question or topic to find passages for.
                #
                #   @param max_characters [Integer] Maximum combined length of returned passages.
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData#image_params
              class ImageParams < ContextDev::Internal::Type::BaseModel
                # @!attribute dedupe
                #   Set `visual` to drop visual duplicates, keeping the largest copy.
                #
                #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Dedupe, nil]
                optional :dedupe,
                         enum: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Dedupe }

                # @!attribute enrich
                #   Extra data per image: `dimensions`, `classification`, or a hosted `file` URL.
                #
                #   @return [Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Enrich>, nil]
                optional :enrich,
                         -> { ContextDev::Internal::Type::ArrayOf[enum: ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Enrich] }

                # @!method initialize(dedupe: nil, enrich: nil)
                #   Image options. Requires formats.images: true.
                #
                #   @param dedupe [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Dedupe] Set `visual` to drop visual duplicates, keeping the largest copy.
                #
                #   @param enrich [Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Enrich>] Extra data per image: `dimensions`, `classification`, or a hosted `file` URL.

                # Set `visual` to drop visual duplicates, keeping the largest copy.
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams#dedupe
                module Dedupe
                  extend ContextDev::Internal::Type::Enum

                  NONE = :none
                  VISUAL = :visual

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                module Enrich
                  extend ContextDev::Internal::Type::Enum

                  DIMENSIONS = :dimensions
                  CLASSIFICATION = :classification
                  FILE = :file

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData#json_params
              class JsonParams < ContextDev::Internal::Type::BaseModel
                # @!attribute schema
                #   JSON Schema (not an example object) for a top-level object, up to 50 KB. Use
                #   optional or nullable fields for missing facts.
                #
                #   @return [Hash{Symbol=>Object}]
                required :schema, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

                # @!attribute instructions
                #   Extra guidance, such as which facts to prefer or how to read a field.
                #
                #   @return [String, nil]
                optional :instructions, String

                # @!method initialize(schema:, instructions: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::JsonParams}
                #   for more details.
                #
                #   Requires `formats.json: true`; required when it is set.
                #
                #   @param schema [Hash{Symbol=>Object}] JSON Schema (not an example object) for a top-level object, up to 50 KB. Use opt
                #
                #   @param instructions [String] Extra guidance, such as which facts to prefer or how to read a field.
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData#markdown_params
              class MarkdownParams < ContextDev::Internal::Type::BaseModel
                # @!attribute include_images
                #   Include images in the Markdown (`html-conversion` only).
                #
                #   @return [Boolean, nil]
                optional :include_images, ContextDev::Internal::Type::Boolean, api_name: :includeImages

                # @!attribute include_links
                #   Keep link URLs in the Markdown (`html-conversion` only).
                #
                #   @return [Boolean, nil]
                optional :include_links, ContextDev::Internal::Type::Boolean, api_name: :includeLinks

                # @!attribute inline_images
                #   How base64 images appear when `includeImages` is set (`html-conversion` only).
                #
                #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::InlineImages, nil]
                optional :inline_images,
                         enum: -> {
                           ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::InlineImages
                         },
                         api_name: :inlineImages

                # @!attribute source_preference
                #   Markdown sources in order of preference: `html-conversion` converts the page
                #   HTML, `markdown-direct` uses Markdown the site publishes.
                #
                #   @return [Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::SourcePreference>, nil]
                optional :source_preference,
                         -> do
                           ContextDev::Internal::Type::ArrayOf[
                             enum: ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::SourcePreference
                           ]
                         end,
                         api_name: :sourcePreference

                # @!method initialize(include_images: nil, include_links: nil, inline_images: nil, source_preference: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams}
                #   for more details.
                #
                #   Markdown options. Requires `formats.markdown`.
                #
                #   @param include_images [Boolean] Include images in the Markdown (`html-conversion` only).
                #
                #   @param include_links [Boolean] Keep link URLs in the Markdown (`html-conversion` only).
                #
                #   @param inline_images [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::InlineImages] How base64 images appear when `includeImages` is set (`html-conversion` only).
                #
                #   @param source_preference [Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::SourcePreference>] Markdown sources in order of preference: `html-conversion` converts the page HTM

                # How base64 images appear when `includeImages` is set (`html-conversion` only).
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams#inline_images
                module InlineImages
                  extend ContextDev::Internal::Type::Enum

                  PLACEHOLDER = :placeholder
                  PRESERVE = :preserve

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                module SourcePreference
                  extend ContextDev::Internal::Type::Enum

                  HTML_CONVERSION = :"html-conversion"
                  MARKDOWN_DIRECT = :"markdown-direct"

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # Requires `formats.parse: true`; required when it is set.
              #
              # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData#parse_params
              module ParseParams
                extend ContextDev::Internal::Type::Union

                variant -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser }

                variant -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser }

                class CustomParser < ContextDev::Internal::Type::BaseModel
                  # @!attribute rules
                  #   Field names mapped to CSS selectors (`h1`, `a@href`) or rule objects. Max 100
                  #   fields, 5 levels.
                  #
                  #   @return [Hash{Symbol=>String, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1}]
                  required :rules,
                           -> do
                             ContextDev::Internal::Type::HashOf[
                               union: ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule
                             ]
                           end

                  # @!attribute type
                  #   Extract fields using custom CSS rules. This is the default when type is omitted.
                  #
                  #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Type, nil]
                  optional :type,
                           enum: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Type }

                  # @!method initialize(rules:, type: nil)
                  #   Some parameter documentations has been truncated, see
                  #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser}
                  #   for more details.
                  #
                  #   @param rules [Hash{Symbol=>String, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1}] Field names mapped to CSS selectors (`h1`, `a@href`) or rule objects. Max 100 fi
                  #
                  #   @param type [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Type] Extract fields using custom CSS rules. This is the default when type is omitted.

                  module Rule
                    extend ContextDev::Internal::Type::Union

                    variant String

                    variant -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1 }

                    class UnionMember1 < ContextDev::Internal::Type::BaseModel
                      # @!attribute selector
                      #   CSS selector to match within the current page or parent rule.
                      #
                      #   @return [String]
                      required :selector, String

                      # @!attribute output
                      #   Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
                      #   to text.
                      #
                      #   @return [Symbol, String, Object, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Output, nil]
                      optional :output,
                               union: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Output }

                      # @!attribute type
                      #   Return the first match with `item` or all matches with `list`.
                      #
                      #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Type, nil]
                      optional :type,
                               enum: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Type }

                      # @!method initialize(selector:, output: nil, type: nil)
                      #   Some parameter documentations has been truncated, see
                      #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1}
                      #   for more details.
                      #
                      #   @param selector [String] CSS selector to match within the current page or parent rule.
                      #
                      #   @param output [Symbol, String, Object, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Output] Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
                      #
                      #   @param type [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Type] Return the first match with `item` or all matches with `list`.

                      # Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
                      # to text.
                      #
                      # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1#output
                      module Output
                        extend ContextDev::Internal::Type::Union

                        variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Output::TEXT }

                        variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Output::HTML }

                        variant String

                        variant ContextDev::Internal::Type::Unknown

                        # @!method self.variants
                        #   @return [Array(Symbol, String, Object)]

                        define_sorbet_constant!(:Variants) do
                          T.type_alias do
                            T.any(
                              ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Output::TaggedSymbol,
                              String,
                              T.anything
                            )
                          end
                        end

                        # @!group

                        TEXT = :text
                        HTML = :html

                        # @!endgroup
                      end

                      # Return the first match with `item` or all matches with `list`.
                      #
                      # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1#type
                      module Type
                        extend ContextDev::Internal::Type::Enum

                        ITEM = :item
                        LIST = :list

                        # @!method self.values
                        #   @return [Array<Symbol>]
                      end
                    end

                    # @!method self.variants
                    #   @return [Array(String, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1)]
                  end

                  # Extract fields using custom CSS rules. This is the default when type is omitted.
                  #
                  # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser#type
                  module Type
                    extend ContextDev::Internal::Type::Enum

                    CUSTOM = :custom

                    # @!method self.values
                    #   @return [Array<Symbol>]
                  end
                end

                class PrebuiltParser < ContextDev::Internal::Type::BaseModel
                  # @!attribute parser
                  #   google-maps parses Google Maps business data into data.results. Accepts Maps
                  #   place, search, and internal data URLs. Uses a US exit and English labels
                  #   regardless of hl or Accept-Language. google-maps-reviews returns the reviews of
                  #   a place in data.reviews, in the same shape as the Serper reviews API (rating,
                  #   date, isoDate, snippet, translatedSnippet, likes, user, media, response, link,
                  #   id), plus language, guided ratings in details, and user.isLocalGuide; data also
                  #   carries the place featureId, cid, and sort. sort and limit pick the order and
                  #   count, and oldest is exact. It accepts Maps place, search, and ?cid= URLs, plus
                  #   search.google.com/local/reviews URLs, so the google_maps_url and
                  #   google_reviews_url fields of google-maps results work as input. An unknown place
                  #   returns no reviews. google-play parses a Play Store app into data: details,
                  #   developer contact, ratings, price, permissions, and data safety.
                  #   google-play-reviews returns the 200 newest reviews of the app, with developer
                  #   replies, in data.reviews. Both Play parsers accept app details URLs
                  #   (play.google.com/store/apps/details?id=…); hl and gl set the language and
                  #   storefront, defaulting to en and us. app-store parses an App Store app into
                  #   data: details, developer, ratings, price, version, and screenshots.
                  #   app-store-reviews returns up to the 500 newest reviews in data.reviews. Both App
                  #   Store parsers accept app URLs (apps.apple.com/us/app/…/id…); the country in the
                  #   path sets the storefront, defaulting to us. g2-reviews returns the 25 most
                  #   recently published reviews of a G2 product in data.reviews (rating, title,
                  #   likes, dislikes, problems_solved, reviewer role, company size, and industry),
                  #   plus data.product. It accepts G2 product URLs (g2.com/products/…), follows
                  #   renamed products, and keeps star-rating filters from the URL
                  #   (filters[nps_score][]=1 to 5); other filters, sort orders, and pages are
                  #   ignored. instagram-profile parses a public profile (instagram.com/{username})
                  #   into data: bio, links, follower and post counts, category, business address,
                  #   similar_accounts, and latest_posts (up to the 12 posts at the top of the
                  #   profile, newest first). Instagram lists pinned posts there ahead of newer ones,
                  #   so posts with is_pinned true can be older; when Instagram shows only a rounded
                  #   post count (32K), post_count is that rounded number and is_post_count_rounded is
                  #   true. instagram-post parses a post or reel (/p/…, /reel/…) into data: caption,
                  #   hashtags, mentions, like, comment, and view counts (like_count and view_count
                  #   are null when the owner hides them), media URLs, tagged users, collaborators,
                  #   location, and the top ~14 comments in data.comments. instagram-feed returns the
                  #   top posts for a hashtag or keyword (/explore/tags/…, /popular/…) or the recent
                  #   posts at a location (/explore/locations/{id}/…) in data.posts; keyword posts
                  #   carry only the shortcode, owner, thumbnail, and views, plus the caption when
                  #   Instagram shows it. All three Instagram parsers read public data without logging
                  #   in, so private accounts return no posts and follower lists are unavailable.
                  #   tiktok-profile parses a public profile (tiktok.com/@{username}) into data:
                  #   nickname, bio, bio link, follower, following, like, and video counts, verified,
                  #   private, and business flags, and business category; it does not list videos.
                  #   tiktok-video parses a video or photo post (/@{username}/video/{id} or
                  #   /@{username}/photo/{id}) into data: caption, hashtags, mentions, author, view,
                  #   like, comment, share, save, and repost counts, duration, thumbnail, a video_url
                  #   that downloads without cookies, image_urls for photo posts, music, location, and
                  #   ad, paid-partnership, and AI-generated flags. tiktok-feed returns videos in the
                  #   tiktok-video shape as data.videos: the latest 15 from a profile URL, the top 30
                  #   from a hashtag URL (/tag/{name}), or the top 12 from a search URL
                  #   (/search?q={query}). tiktok-comments returns the first 20 comments of a video or
                  #   photo post as data.comments: text, posted_at, like and reply counts, whether the
                  #   author liked it, and the commenter. tiktok-followers and tiktok-following return
                  #   up to 30 accounts of a profile as data.users, in the tiktok-profile shape.
                  #   tiktok-user-search returns the top 10 accounts for a user search URL
                  #   (/search/user?q={query}) as data.users: id, username, nickname, biography,
                  #   avatar_url, sec_uid, follower_count, like_count, and is_verified. The TikTok
                  #   parsers accept tiktok.com, www.tiktok.com, and m.tiktok.com URLs but not short
                  #   links (vm.tiktok.com, vt.tiktok.com, tiktok.com/t/…). emails accepts any page
                  #   and returns its email addresses as data.emails ([{ email }]), read from mailto
                  #   links, Cloudflare-protected addresses, and visible text. phone-numbers accepts
                  #   any page and returns its valid phone numbers in E.164 as data.phone_numbers ([{
                  #   phone }]), read from tel links and visible text; numbers without a country code
                  #   are read for the country of the site TLD, defaulting to US. links accepts any
                  #   page and returns its unique http(s) links as data.links ([{ url, text }]), with
                  #   absolute URLs; text falls back to aria-label or image alt and is null when a
                  #   link has none. The emails parser reads the rendered page and respects content
                  #   filters; the other prebuilt parsers read their data independently of DOM
                  #   filters.
                  #
                  #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser]
                  required :parser,
                           enum: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser }

                  # @!attribute type
                  #   Use a prebuilt parser instead of custom rules.
                  #
                  #   @return [Symbol, :prebuilt]
                  required :type, const: :prebuilt

                  # @!attribute limit
                  #   google-maps-reviews only. Maximum number of reviews to return. Defaults to 100;
                  #   maximum 1000.
                  #
                  #   @return [Integer, nil]
                  optional :limit, Integer

                  # @!attribute sort
                  #   google-maps-reviews only. Order of data.reviews. newest, relevant, highest, and
                  #   lowest follow Google; oldest returns the earliest reviews first, which Google
                  #   itself does not offer.
                  #
                  #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Sort, nil]
                  optional :sort,
                           enum: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Sort }

                  # @!method initialize(parser:, limit: nil, sort: nil, type: :prebuilt)
                  #   Some parameter documentations has been truncated, see
                  #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser}
                  #   for more details.
                  #
                  #   @param parser [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser] google-maps parses Google Maps business data into data.results. Accepts Maps pla
                  #
                  #   @param limit [Integer] google-maps-reviews only. Maximum number of reviews to return. Defaults to 100;
                  #
                  #   @param sort [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Sort] google-maps-reviews only. Order of data.reviews. newest, relevant, highest, and
                  #
                  #   @param type [Symbol, :prebuilt] Use a prebuilt parser instead of custom rules.

                  # google-maps parses Google Maps business data into data.results. Accepts Maps
                  # place, search, and internal data URLs. Uses a US exit and English labels
                  # regardless of hl or Accept-Language. google-maps-reviews returns the reviews of
                  # a place in data.reviews, in the same shape as the Serper reviews API (rating,
                  # date, isoDate, snippet, translatedSnippet, likes, user, media, response, link,
                  # id), plus language, guided ratings in details, and user.isLocalGuide; data also
                  # carries the place featureId, cid, and sort. sort and limit pick the order and
                  # count, and oldest is exact. It accepts Maps place, search, and ?cid= URLs, plus
                  # search.google.com/local/reviews URLs, so the google_maps_url and
                  # google_reviews_url fields of google-maps results work as input. An unknown place
                  # returns no reviews. google-play parses a Play Store app into data: details,
                  # developer contact, ratings, price, permissions, and data safety.
                  # google-play-reviews returns the 200 newest reviews of the app, with developer
                  # replies, in data.reviews. Both Play parsers accept app details URLs
                  # (play.google.com/store/apps/details?id=…); hl and gl set the language and
                  # storefront, defaulting to en and us. app-store parses an App Store app into
                  # data: details, developer, ratings, price, version, and screenshots.
                  # app-store-reviews returns up to the 500 newest reviews in data.reviews. Both App
                  # Store parsers accept app URLs (apps.apple.com/us/app/…/id…); the country in the
                  # path sets the storefront, defaulting to us. g2-reviews returns the 25 most
                  # recently published reviews of a G2 product in data.reviews (rating, title,
                  # likes, dislikes, problems_solved, reviewer role, company size, and industry),
                  # plus data.product. It accepts G2 product URLs (g2.com/products/…), follows
                  # renamed products, and keeps star-rating filters from the URL
                  # (filters[nps_score][]=1 to 5); other filters, sort orders, and pages are
                  # ignored. instagram-profile parses a public profile (instagram.com/{username})
                  # into data: bio, links, follower and post counts, category, business address,
                  # similar_accounts, and latest_posts (up to the 12 posts at the top of the
                  # profile, newest first). Instagram lists pinned posts there ahead of newer ones,
                  # so posts with is_pinned true can be older; when Instagram shows only a rounded
                  # post count (32K), post_count is that rounded number and is_post_count_rounded is
                  # true. instagram-post parses a post or reel (/p/…, /reel/…) into data: caption,
                  # hashtags, mentions, like, comment, and view counts (like_count and view_count
                  # are null when the owner hides them), media URLs, tagged users, collaborators,
                  # location, and the top ~14 comments in data.comments. instagram-feed returns the
                  # top posts for a hashtag or keyword (/explore/tags/…, /popular/…) or the recent
                  # posts at a location (/explore/locations/{id}/…) in data.posts; keyword posts
                  # carry only the shortcode, owner, thumbnail, and views, plus the caption when
                  # Instagram shows it. All three Instagram parsers read public data without logging
                  # in, so private accounts return no posts and follower lists are unavailable.
                  # tiktok-profile parses a public profile (tiktok.com/@{username}) into data:
                  # nickname, bio, bio link, follower, following, like, and video counts, verified,
                  # private, and business flags, and business category; it does not list videos.
                  # tiktok-video parses a video or photo post (/@{username}/video/{id} or
                  # /@{username}/photo/{id}) into data: caption, hashtags, mentions, author, view,
                  # like, comment, share, save, and repost counts, duration, thumbnail, a video_url
                  # that downloads without cookies, image_urls for photo posts, music, location, and
                  # ad, paid-partnership, and AI-generated flags. tiktok-feed returns videos in the
                  # tiktok-video shape as data.videos: the latest 15 from a profile URL, the top 30
                  # from a hashtag URL (/tag/{name}), or the top 12 from a search URL
                  # (/search?q={query}). tiktok-comments returns the first 20 comments of a video or
                  # photo post as data.comments: text, posted_at, like and reply counts, whether the
                  # author liked it, and the commenter. tiktok-followers and tiktok-following return
                  # up to 30 accounts of a profile as data.users, in the tiktok-profile shape.
                  # tiktok-user-search returns the top 10 accounts for a user search URL
                  # (/search/user?q={query}) as data.users: id, username, nickname, biography,
                  # avatar_url, sec_uid, follower_count, like_count, and is_verified. The TikTok
                  # parsers accept tiktok.com, www.tiktok.com, and m.tiktok.com URLs but not short
                  # links (vm.tiktok.com, vt.tiktok.com, tiktok.com/t/…). emails accepts any page
                  # and returns its email addresses as data.emails ([{ email }]), read from mailto
                  # links, Cloudflare-protected addresses, and visible text. phone-numbers accepts
                  # any page and returns its valid phone numbers in E.164 as data.phone_numbers ([{
                  # phone }]), read from tel links and visible text; numbers without a country code
                  # are read for the country of the site TLD, defaulting to US. links accepts any
                  # page and returns its unique http(s) links as data.links ([{ url, text }]), with
                  # absolute URLs; text falls back to aria-label or image alt and is null when a
                  # link has none. The emails parser reads the rendered page and respects content
                  # filters; the other prebuilt parsers read their data independently of DOM
                  # filters.
                  #
                  # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser#parser
                  module Parser
                    extend ContextDev::Internal::Type::Enum

                    GOOGLE_MAPS = :"google-maps"
                    GOOGLE_MAPS_REVIEWS = :"google-maps-reviews"
                    GOOGLE_PLAY = :"google-play"
                    GOOGLE_PLAY_REVIEWS = :"google-play-reviews"
                    APP_STORE = :"app-store"
                    APP_STORE_REVIEWS = :"app-store-reviews"
                    G2_REVIEWS = :"g2-reviews"
                    INSTAGRAM_PROFILE = :"instagram-profile"
                    INSTAGRAM_POST = :"instagram-post"
                    INSTAGRAM_FEED = :"instagram-feed"
                    TIKTOK_PROFILE = :"tiktok-profile"
                    TIKTOK_VIDEO = :"tiktok-video"
                    TIKTOK_FEED = :"tiktok-feed"
                    TIKTOK_COMMENTS = :"tiktok-comments"
                    TIKTOK_FOLLOWERS = :"tiktok-followers"
                    TIKTOK_FOLLOWING = :"tiktok-following"
                    TIKTOK_USER_SEARCH = :"tiktok-user-search"
                    EMAILS = :emails
                    PHONE_NUMBERS = :"phone-numbers"
                    LINKS = :links

                    # @!method self.values
                    #   @return [Array<Symbol>]
                  end

                  # google-maps-reviews only. Order of data.reviews. newest, relevant, highest, and
                  # lowest follow Google; oldest returns the earliest reviews first, which Google
                  # itself does not offer.
                  #
                  # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser#sort
                  module Sort
                    extend ContextDev::Internal::Type::Enum

                    NEWEST = :newest
                    OLDEST = :oldest
                    RELEVANT = :relevant
                    HIGHEST = :highest
                    LOWEST = :lowest

                    # @!method self.values
                    #   @return [Array<Symbol>]
                  end
                end

                # @!method self.variants
                #   @return [Array(ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser)]
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData#product_params
              class ProductParams < ContextDev::Internal::Type::BaseModel
                # @!attribute dedupe_images
                #   Drop visually duplicate product images, keeping the largest copy.
                #
                #   @return [Boolean, nil]
                optional :dedupe_images, ContextDev::Internal::Type::Boolean, api_name: :dedupeImages

                # @!attribute use_ai_fallback
                #   @deprecated
                #
                #   Ignored. The AI fallback runs automatically.
                #
                #   @return [Boolean, nil]
                optional :use_ai_fallback, ContextDev::Internal::Type::Boolean, api_name: :useAIFallback

                # @!method initialize(dedupe_images: nil, use_ai_fallback: nil)
                #   Product options. Requires formats.product: true.
                #
                #   @param dedupe_images [Boolean] Drop visually duplicate product images, keeping the largest copy.
                #
                #   @param use_ai_fallback [Boolean] Ignored. The AI fallback runs automatically.
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData#screenshot_params
              class ScreenshotParams < ContextDev::Internal::Type::BaseModel
                # @!attribute area
                #   What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40
                #   megapixels.
                #
                #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Page, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Element, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Rectangle, nil]
                optional :area,
                         union: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area }

                # @!attribute format_
                #   Image format for the screenshot.
                #
                #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Format, nil]
                optional :format_,
                         enum: -> {
                           ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Format
                         },
                         api_name: :format

                # @!method initialize(area: nil, format_: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams}
                #   for more details.
                #
                #   Screenshot options. Requires formats.screenshot: true.
                #
                #   @param area [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Page, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Element, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Rectangle] What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40 meg
                #
                #   @param format_ [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Format] Image format for the screenshot.

                # What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40
                # megapixels.
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams#area
                module Area
                  extend ContextDev::Internal::Type::Union

                  variant enum: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Page }

                  variant -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Element }

                  # Pixels from the document origin.
                  variant -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Rectangle }

                  module Page
                    extend ContextDev::Internal::Type::Enum

                    VIEWPORT = :viewport
                    FULL_PAGE = :fullPage

                    # @!method self.values
                    #   @return [Array<Symbol>]
                  end

                  class Element < ContextDev::Internal::Type::BaseModel
                    # @!attribute selector
                    #   CSS selector matching exactly one visible element.
                    #
                    #   @return [String]
                    required :selector, String

                    # @!method initialize(selector:)
                    #   @param selector [String] CSS selector matching exactly one visible element.
                  end

                  class Rectangle < ContextDev::Internal::Type::BaseModel
                    # @!attribute height
                    #   Height of the capture in pixels.
                    #
                    #   @return [Integer]
                    required :height, Integer

                    # @!attribute width
                    #   Width of the capture in pixels.
                    #
                    #   @return [Integer]
                    required :width, Integer

                    # @!attribute x
                    #   Left edge of the capture, in pixels from the document origin.
                    #
                    #   @return [Integer]
                    required :x, Integer

                    # @!attribute y_
                    #   Top edge of the capture, in pixels from the document origin.
                    #
                    #   @return [Integer]
                    required :y_, Integer, api_name: :y

                    # @!method initialize(height:, width:, x:, y_:)
                    #   Pixels from the document origin.
                    #
                    #   @param height [Integer] Height of the capture in pixels.
                    #
                    #   @param width [Integer] Width of the capture in pixels.
                    #
                    #   @param x [Integer] Left edge of the capture, in pixels from the document origin.
                    #
                    #   @param y_ [Integer] Top edge of the capture, in pixels from the document origin.
                  end

                  # @!method self.variants
                  #   @return [Array(Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Page, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Element, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Rectangle)]
                end

                # Image format for the screenshot.
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams#format_
                module Format
                  extend ContextDev::Internal::Type::Enum

                  PNG = :png
                  JPEG = :jpeg
                  WEBP = :webp

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData#shared_params
              class SharedParams < ContextDev::Internal::Type::BaseModel
                # @!attribute actions
                #   Browser steps run in order before capture. Requires a paid plan. Skips the
                #   cache.
                #
                #   @return [Array<ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Perform, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Wait, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::WaitFor>, nil]
                optional :actions,
                         -> { ContextDev::Internal::Type::ArrayOf[union: ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action] }

                # @!attribute country
                #   Proxy country as a two-letter code, such as `US`. Case-insensitive.
                #
                #   @return [String, nil]
                optional :country, String

                # @!attribute dismiss_cookies
                #   Accept cookie banners before actions and capture.
                #
                #   @return [Boolean, nil]
                optional :dismiss_cookies, ContextDev::Internal::Type::Boolean, api_name: :dismissCookies

                # @!attribute dismiss_popups
                #   Close other popups before actions and capture.
                #
                #   @return [Boolean, nil]
                optional :dismiss_popups, ContextDev::Internal::Type::Boolean, api_name: :dismissPopups

                # @!attribute exclude_selectors
                #   Remove elements matching these CSS selectors. Overrides `includeSelectors`.
                #
                #   @return [Array<String>, nil]
                optional :exclude_selectors,
                         ContextDev::Internal::Type::ArrayOf[String],
                         api_name: :excludeSelectors

                # @!attribute headers
                #   HTTP headers to send to the target site. Requests with headers skip the cache.
                #
                #   @return [Hash{Symbol=>String}, nil]
                optional :headers, ContextDev::Internal::Type::HashOf[String]

                # @!attribute include_frames
                #   Include iframe content in HTML and text outputs. Screenshots always show visible
                #   frames.
                #
                #   @return [Boolean, nil]
                optional :include_frames, ContextDev::Internal::Type::Boolean, api_name: :includeFrames

                # @!attribute include_selectors
                #   Keep only elements matching these CSS selectors.
                #
                #   @return [Array<String>, nil]
                optional :include_selectors,
                         ContextDev::Internal::Type::ArrayOf[String],
                         api_name: :includeSelectors

                # @!attribute main_content_only
                #   Keep only the main content. Doesn't affect `screenshot`, `bytes`, or `product`.
                #
                #   @return [Boolean, nil]
                optional :main_content_only, ContextDev::Internal::Type::Boolean, api_name: :mainContentOnly

                # @!attribute parsers
                #   Document parsing options.
                #
                #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers, nil]
                optional :parsers,
                         -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers }

                # @!attribute profile
                #   Create or reuse an authenticated browser profile. Requires a paid plan and an
                #   HTTPS target. Profiles persist session state, bypass shared caches, and cannot
                #   be combined with ZDR, custom headers, raw bytes, or prebuilt parsers.
                #
                #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::Existing, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::New, nil]
                optional :profile,
                         union: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile }

                # @!attribute settle_animations
                #   Wait for CSS animations to finish before capture. Defaults to `true` when
                #   `screenshot` is requested.
                #
                #   @return [Boolean, nil]
                optional :settle_animations, ContextDev::Internal::Type::Boolean, api_name: :settleAnimations

                # @!attribute theme
                #   Emulate a light or dark color scheme.
                #
                #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Theme, nil]
                optional :theme,
                         enum: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Theme }

                # @!attribute viewport
                #   Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
                #   default to 1440 × 900.
                #
                #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Viewport, nil]
                optional :viewport,
                         -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Viewport }

                # @!attribute wait_for
                #   Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500
                #   (2000 with frames or XML).
                #
                #   @return [Integer, String, nil]
                optional :wait_for,
                         union: -> {
                           ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::WaitFor
                         },
                         api_name: :waitFor

                # @!method initialize(actions: nil, country: nil, dismiss_cookies: nil, dismiss_popups: nil, exclude_selectors: nil, headers: nil, include_frames: nil, include_selectors: nil, main_content_only: nil, parsers: nil, profile: nil, settle_animations: nil, theme: nil, viewport: nil, wait_for: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams}
                #   for more details.
                #
                #   Browser and content settings shared by all outputs.
                #
                #   @param actions [Array<ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Perform, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Wait, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::WaitFor>] Browser steps run in order before capture. Requires a paid plan. Skips the cache
                #
                #   @param country [String] Proxy country as a two-letter code, such as `US`. Case-insensitive.
                #
                #   @param dismiss_cookies [Boolean] Accept cookie banners before actions and capture.
                #
                #   @param dismiss_popups [Boolean] Close other popups before actions and capture.
                #
                #   @param exclude_selectors [Array<String>] Remove elements matching these CSS selectors. Overrides `includeSelectors`.
                #
                #   @param headers [Hash{Symbol=>String}] HTTP headers to send to the target site. Requests with headers skip the cache.
                #
                #   @param include_frames [Boolean] Include iframe content in HTML and text outputs. Screenshots always show visible
                #
                #   @param include_selectors [Array<String>] Keep only elements matching these CSS selectors.
                #
                #   @param main_content_only [Boolean] Keep only the main content. Doesn't affect `screenshot`, `bytes`, or `product`.
                #
                #   @param parsers [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers] Document parsing options.
                #
                #   @param profile [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::Existing, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::New] Create or reuse an authenticated browser profile. Requires a paid plan and an HT
                #
                #   @param settle_animations [Boolean] Wait for CSS animations to finish before capture. Defaults to `true` when `scree
                #
                #   @param theme [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Theme] Emulate a light or dark color scheme.
                #
                #   @param viewport [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Viewport] Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
                #
                #   @param wait_for [Integer, String] Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500 (200

                module Action
                  extend ContextDev::Internal::Type::Union

                  discriminator :type

                  variant :perform,
                          -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Perform }

                  variant :scroll,
                          -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll }

                  variant :wait,
                          -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Wait }

                  variant :waitFor,
                          -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::WaitFor }

                  class Perform < ContextDev::Internal::Type::BaseModel
                    # @!attribute action
                    #   One browser instruction, such as clicking a button or entering text.
                    #
                    #   @return [String]
                    required :action, String

                    # @!attribute type
                    #   Use `perform` for a plain-language browser instruction.
                    #
                    #   @return [Symbol, :perform]
                    required :type, const: :perform

                    # @!method initialize(action:, type: :perform)
                    #   @param action [String] One browser instruction, such as clicking a button or entering text.
                    #
                    #   @param type [Symbol, :perform] Use `perform` for a plain-language browser instruction.
                  end

                  class Scroll < ContextDev::Internal::Type::BaseModel
                    # @!attribute type
                    #   Use `scroll` to move through the page or a container.
                    #
                    #   @return [Symbol, :scroll]
                    required :type, const: :scroll

                    # @!attribute amount
                    #   Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
                    #
                    #   @return [Integer, Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Amount, nil]
                    optional :amount,
                             union: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Amount }

                    # @!attribute direction
                    #   Direction to scroll.
                    #
                    #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Direction, nil]
                    optional :direction,
                             enum: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Direction }

                    # @!attribute max_scrolls
                    #   Maximum number of scroll steps for this action.
                    #
                    #   @return [Integer, nil]
                    optional :max_scrolls, Integer, api_name: :maxScrolls

                    # @!attribute selector
                    #   Scroll this container. Omit to scroll the page.
                    #
                    #   @return [String, nil]
                    optional :selector, String

                    # @!method initialize(amount: nil, direction: nil, max_scrolls: nil, selector: nil, type: :scroll)
                    #   @param amount [Integer, Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Amount] Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
                    #
                    #   @param direction [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Direction] Direction to scroll.
                    #
                    #   @param max_scrolls [Integer] Maximum number of scroll steps for this action.
                    #
                    #   @param selector [String] Scroll this container. Omit to scroll the page.
                    #
                    #   @param type [Symbol, :scroll] Use `scroll` to move through the page or a container.

                    # Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
                    #
                    # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll#amount
                    module Amount
                      extend ContextDev::Internal::Type::Union

                      variant Integer

                      variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Amount::VIEWPORT }

                      variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Amount::MAX }

                      # @!method self.variants
                      #   @return [Array(Integer, Symbol)]

                      define_sorbet_constant!(:Variants) do
                        T.type_alias do
                          T.any(
                            Integer,
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Amount::TaggedSymbol
                          )
                        end
                      end

                      # @!group

                      VIEWPORT = :viewport
                      MAX = :max

                      # @!endgroup
                    end

                    # Direction to scroll.
                    #
                    # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll#direction
                    module Direction
                      extend ContextDev::Internal::Type::Enum

                      DOWN = :down
                      UP = :up
                      LEFT = :left
                      RIGHT = :right

                      # @!method self.values
                      #   @return [Array<Symbol>]
                    end
                  end

                  class Wait < ContextDev::Internal::Type::BaseModel
                    # @!attribute milliseconds
                    #   Time to pause in milliseconds before the next action.
                    #
                    #   @return [Integer]
                    required :milliseconds, Integer

                    # @!attribute type
                    #   Use `wait` to pause for a fixed duration.
                    #
                    #   @return [Symbol, :wait]
                    required :type, const: :wait

                    # @!method initialize(milliseconds:, type: :wait)
                    #   @param milliseconds [Integer] Time to pause in milliseconds before the next action.
                    #
                    #   @param type [Symbol, :wait] Use `wait` to pause for a fixed duration.
                  end

                  class WaitFor < ContextDev::Internal::Type::BaseModel
                    # @!attribute selector
                    #   CSS selector to wait for before continuing.
                    #
                    #   @return [String]
                    required :selector, String

                    # @!attribute type
                    #   Use `waitFor` to wait for a matching element.
                    #
                    #   @return [Symbol, :waitFor]
                    required :type, const: :waitFor

                    # @!method initialize(selector:, type: :waitFor)
                    #   @param selector [String] CSS selector to wait for before continuing.
                    #
                    #   @param type [Symbol, :waitFor] Use `waitFor` to wait for a matching element.
                  end

                  # @!method self.variants
                  #   @return [Array(ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Perform, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Wait, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::WaitFor)]
                end

                # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams#parsers
                class Parsers < ContextDev::Internal::Type::BaseModel
                  # @!attribute pdf
                  #   PDF page range and OCR.
                  #
                  #   @return [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf, nil]
                  optional :pdf,
                           -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf }

                  # @!method initialize(pdf: nil)
                  #   Document parsing options.
                  #
                  #   @param pdf [ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf] PDF page range and OCR.

                  # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers#pdf
                  class Pdf < ContextDev::Internal::Type::BaseModel
                    # @!attribute end_page
                    #   Last page to parse. Must be at least `startPage`.
                    #
                    #   @return [Integer, nil]
                    optional :end_page, Integer, api_name: :endPage

                    # @!attribute include_numbered_pages
                    #   Start each page in the Markdown with a `<!-- page N -->` line using its original
                    #   1-based page number; these responses are never served from cache.
                    #
                    #   @return [Boolean, nil]
                    optional :include_numbered_pages,
                             ContextDev::Internal::Type::Boolean,
                             api_name: :includeNumberedPages

                    # @!attribute ocr
                    #   Set `auto` to read scanned pages with OCR.
                    #
                    #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf::Ocr, nil]
                    optional :ocr,
                             enum: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf::Ocr }

                    # @!attribute start_page
                    #   First page to parse, starting at 1.
                    #
                    #   @return [Integer, nil]
                    optional :start_page, Integer, api_name: :startPage

                    # @!method initialize(end_page: nil, include_numbered_pages: nil, ocr: nil, start_page: nil)
                    #   Some parameter documentations has been truncated, see
                    #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf}
                    #   for more details.
                    #
                    #   PDF page range and OCR.
                    #
                    #   @param end_page [Integer] Last page to parse. Must be at least `startPage`.
                    #
                    #   @param include_numbered_pages [Boolean] Start each page in the Markdown with a `<!-- page N -->` line using its original
                    #
                    #   @param ocr [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf::Ocr] Set `auto` to read scanned pages with OCR.
                    #
                    #   @param start_page [Integer] First page to parse, starting at 1.

                    # Set `auto` to read scanned pages with OCR.
                    #
                    # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf#ocr
                    module Ocr
                      extend ContextDev::Internal::Type::Enum

                      OFF = :off
                      AUTO = :auto

                      # @!method self.values
                      #   @return [Array<Symbol>]
                    end
                  end
                end

                # Create or reuse an authenticated browser profile. Requires a paid plan and an
                # HTTPS target. Profiles persist session state, bypass shared caches, and cannot
                # be combined with ZDR, custom headers, raw bytes, or prebuilt parsers.
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams#profile
                module Profile
                  extend ContextDev::Internal::Type::Union

                  discriminator :type

                  variant :existing,
                          -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::Existing }

                  variant :new,
                          -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::New }

                  class Existing < ContextDev::Internal::Type::BaseModel
                    # @!attribute profile_id
                    #   The ID returned in profile.id by an earlier scrape.
                    #
                    #   @return [String]
                    required :profile_id, String, api_name: :profileId

                    # @!attribute type
                    #   Reuse a saved browser profile.
                    #
                    #   @return [Symbol, :existing]
                    required :type, const: :existing

                    # @!method initialize(profile_id:, type: :existing)
                    #   @param profile_id [String] The ID returned in profile.id by an earlier scrape.
                    #
                    #   @param type [Symbol, :existing] Reuse a saved browser profile.
                  end

                  class New < ContextDev::Internal::Type::BaseModel
                    # @!attribute identifier
                    #   Username or email for the target website.
                    #
                    #   @return [String]
                    required :identifier, String

                    # @!attribute type
                    #   Sign in and create a browser profile.
                    #
                    #   @return [Symbol, :new]
                    required :type, const: :new

                    # @!attribute description
                    #   Optional label shown when listing profiles with `GET /org/browser/profiles`.
                    #
                    #   @return [String, nil]
                    optional :description, String

                    request_only do
                      # @!attribute password
                      #   Password used to sign in. It is never stored in the profile.
                      #
                      #   @return [String]
                      required :password, String
                    end

                    # @!method initialize(identifier:, password:, description: nil, type: :new)
                    #   @param identifier [String] Username or email for the target website.
                    #
                    #   @param password [String] Password used to sign in. It is never stored in the profile.
                    #
                    #   @param description [String] Optional label shown when listing profiles with `GET /org/browser/profiles`.
                    #
                    #   @param type [Symbol, :new] Sign in and create a browser profile.
                  end

                  # @!method self.variants
                  #   @return [Array(ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::Existing, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::New)]
                end

                # Emulate a light or dark color scheme.
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams#theme
                module Theme
                  extend ContextDev::Internal::Type::Enum

                  LIGHT = :light
                  DARK = :dark

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams#viewport
                class Viewport < ContextDev::Internal::Type::BaseModel
                  # @!attribute height
                  #   Browser viewport height in pixels.
                  #
                  #   @return [Integer, nil]
                  optional :height, Integer

                  # @!attribute width
                  #   Browser viewport width in pixels.
                  #
                  #   @return [Integer, nil]
                  optional :width, Integer

                  # @!method initialize(height: nil, width: nil)
                  #   Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
                  #   default to 1440 × 900.
                  #
                  #   @param height [Integer] Browser viewport height in pixels.
                  #
                  #   @param width [Integer] Browser viewport width in pixels.
                end

                # Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500
                # (2000 with frames or XML).
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams#wait_for
                module WaitFor
                  extend ContextDev::Internal::Type::Union

                  variant Integer

                  variant String

                  # @!method self.variants
                  #   @return [Array(Integer, String)]
                end
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData#timeout_opts
              class TimeoutOpts < ContextDev::Internal::Type::BaseModel
                # @!attribute milliseconds
                #   Deadline in milliseconds.
                #
                #   @return [Integer]
                required :milliseconds, Integer

                # @!attribute behavior
                #   "fail" returns 408 at the deadline. "return-partial" returns available results;
                #   inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
                #
                #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts::Behavior, nil]
                optional :behavior,
                         enum: -> { ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts::Behavior }

                # @!method initialize(milliseconds:, behavior: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts}
                #   for more details.
                #
                #   Deadline for each page, using the same behavior and defaults as POST
                #   /web/scrape.
                #
                #   @param milliseconds [Integer] Deadline in milliseconds.
                #
                #   @param behavior [Symbol, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts::Behavior] "fail" returns 408 at the deadline. "return-partial" returns available results;

                # "fail" returns 408 at the deadline. "return-partial" returns available results;
                # inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts#behavior
                module Behavior
                  extend ContextDev::Internal::Type::Enum

                  FAIL = :fail
                  RETURN_PARTIAL = :"return-partial"

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # Batches persist their results. Only disabled is supported; enabled returns
              # ZDR_NOT_SUPPORTED.
              #
              # @see ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData#zdr
              module Zdr
                extend ContextDev::Internal::Type::Enum

                DISABLED = :disabled

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @!method self.variants
            #   @return [Array(ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::Markdown, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::HTML, ContextDev::Models::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData)]
          end
        end

        class Crawl < ContextDev::Internal::Type::BaseModel
          # @!attribute data
          #   Crawl source and output format.
          #
          #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData]
          required :data, union: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data }

          # @!attribute mode
          #   Discover and scrape pages from `data.source`.
          #
          #   @return [Symbol, :crawl]
          required :mode, const: :crawl

          # @!method initialize(data:, mode: :crawl)
          #   Crawl pages starting from a URL or from a domain's sitemap.
          #
          #   @param data [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData] Crawl source and output format.
          #
          #   @param mode [Symbol, :crawl] Discover and scrape pages from `data.source`.

          # Crawl source and output format.
          #
          # @see ContextDev::Models::BatchSubmitParams::Input::Crawl#data
          module Data
            extend ContextDev::Internal::Type::Union

            # Crawl pages and return Markdown.
            variant -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown }

            # Crawl pages and return HTML.
            variant -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML }

            # Use the same formats and parameters as POST /web/scrape, replacing url with source. Options apply to every page.
            variant -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData }

            # @deprecated
            class Markdown < ContextDev::Internal::Type::BaseModel
              # @!attribute format_
              #   Return page content as Markdown.
              #
              #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Format]
              required :format_,
                       enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Format },
                       api_name: :format

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

              # @!method initialize(format_:, source:, options: nil)
              #   Crawl pages and return Markdown.
              #
              #   @param format_ [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Format] Return page content as Markdown.
              #
              #   @param source [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap] How to find pages to crawl.
              #
              #   @param options [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options] Options for Markdown output.

              # Return page content as Markdown.
              #
              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown#format_
              module Format
                extend ContextDev::Internal::Type::Enum

                MARKDOWN = :markdown

                # @!method self.values
                #   @return [Array<Symbol>]
              end

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
                    # @!attribute exclude_regex
                    #   Regex pattern for URLs to exclude, even when they match `regex`. The `start_url`
                    #   itself is always included.
                    #
                    #   @return [String, nil]
                    optional :exclude_regex, String, api_name: :excludeRegex

                    # @!attribute follow_subdomains
                    #   Follow links to subdomains.
                    #
                    #   @return [Boolean, nil]
                    optional :follow_subdomains,
                             ContextDev::Internal::Type::Boolean,
                             api_name: :followSubdomains

                    # @!attribute languages
                    #   Only follow pages in these languages, or `same_as_start_url`; all languages when
                    #   omitted.
                    #
                    #   @return [Symbol, Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1>, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages, nil]
                    optional :languages,
                             union: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages }

                    # @!attribute max_depth
                    #   Maximum link depth. Source pages are depth 0. No limit when omitted.
                    #
                    #   @return [Integer, nil]
                    optional :max_depth, Integer, api_name: :maxDepth

                    # @!attribute max_urls
                    #   Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    #
                    #   @return [Integer, nil]
                    optional :max_urls, Integer, api_name: :maxUrls

                    # @!attribute regex
                    #   Regex pattern for URLs to include. The `start_url` itself is always included.
                    #
                    #   @return [String, nil]
                    optional :regex, String

                    # @!method initialize(exclude_regex: nil, follow_subdomains: nil, languages: nil, max_depth: nil, max_urls: nil, regex: nil)
                    #   Some parameter documentations has been truncated, see
                    #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls}
                    #   for more details.
                    #
                    #   Limits and filters for page discovery.
                    #
                    #   @param exclude_regex [String] Regex pattern for URLs to exclude, even when they match `regex`. The `start_url`
                    #
                    #   @param follow_subdomains [Boolean] Follow links to subdomains.
                    #
                    #   @param languages [Symbol, Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1>, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages] Only follow pages in these languages, or `same_as_start_url`; all languages when
                    #
                    #   @param max_depth [Integer] Maximum link depth. Source pages are depth 0. No limit when omitted.
                    #
                    #   @param max_urls [Integer] Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    #
                    #   @param regex [String] Regex pattern for URLs to include. The `start_url` itself is always included.

                    # Only follow pages in these languages, or `same_as_start_url`; all languages when
                    # omitted.
                    #
                    # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls#languages
                    module Languages
                      extend ContextDev::Internal::Type::Union

                      variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::SAME_AS_START_URL }

                      variant -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1Array }

                      module UnionMember1
                        extend ContextDev::Internal::Type::Enum

                        AM = :am
                        AR = :ar
                        AZ = :az
                        BE = :be
                        BG = :bg
                        BN = :bn
                        CA = :ca
                        CEB = :ceb
                        CS = :cs
                        CY = :cy
                        DA = :da
                        DE = :de
                        EL = :el
                        EN = :en
                        ES = :es
                        ET = :et
                        EU = :eu
                        FA = :fa
                        FI = :fi
                        FR = :fr
                        GU = :gu
                        HA = :ha
                        HAW = :haw
                        HE = :he
                        HI = :hi
                        HR = :hr
                        HU = :hu
                        HY = :hy
                        ID = :id
                        IS = :is
                        IT = :it
                        JA = :ja
                        KA = :ka
                        KK = :kk
                        KN = :kn
                        KO = :ko
                        KU = :ku
                        KY = :ky
                        LO = :lo
                        LT = :lt
                        LV = :lv
                        MK = :mk
                        ML = :ml
                        MN = :mn
                        MR = :mr
                        MS = :ms
                        NE = :ne
                        NL = :nl
                        NO = :no
                        OR = :or
                        PA = :pa
                        PL = :pl
                        PS = :ps
                        PT = :pt
                        RO = :ro
                        RU = :ru
                        SK = :sk
                        SL = :sl
                        SO = :so
                        SQ = :sq
                        SR = :sr
                        SV = :sv
                        SW = :sw
                        TA = :ta
                        TE = :te
                        TH = :th
                        TL = :tl
                        TR = :tr
                        UK = :uk
                        UR = :ur
                        UZ = :uz
                        VI = :vi
                        YO = :yo
                        ZH = :zh

                        # @!method self.values
                        #   @return [Array<Symbol>]
                      end

                      # @!method self.variants
                      #   @return [Array(Symbol, Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1>)]

                      define_sorbet_constant!(:Variants) do
                        T.type_alias do
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::TaggedSymbol,
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                            ]
                          )
                        end
                      end

                      # @!group

                      SAME_AS_START_URL = :same_as_start_url

                      # @!endgroup

                      # @type [ContextDev::Internal::Type::Converter]
                      UnionMember1Array =
                        ContextDev::Internal::Type::ArrayOf[
                          enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1 }
                        ]
                    end
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
                    # @!attribute exclude_regex
                    #   Regex pattern; sitemap URLs matching it are not scraped, even when they match
                    #   `regex`.
                    #
                    #   @return [String, nil]
                    optional :exclude_regex, String, api_name: :excludeRegex

                    # @!attribute max_urls
                    #   Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    #
                    #   @return [Integer, nil]
                    optional :max_urls, Integer, api_name: :maxUrls

                    # @!attribute regex
                    #   Regex pattern; only sitemap URLs matching it are scraped.
                    #
                    #   @return [String, nil]
                    optional :regex, String

                    # @!method initialize(exclude_regex: nil, max_urls: nil, regex: nil)
                    #   Some parameter documentations has been truncated, see
                    #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap::Controls}
                    #   for more details.
                    #
                    #   Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                    #   URLs and never follows links off them, so there is no crawl depth here.
                    #
                    #   @param exclude_regex [String] Regex pattern; sitemap URLs matching it are not scraped, even when they match `r
                    #
                    #   @param max_urls [Integer] Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    #
                    #   @param regex [String] Regex pattern; only sitemap URLs matching it are scraped.
                  end
                end

                # @!method self.variants
                #   @return [Array(ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap)]
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown#options
              class Options < ContextDev::Internal::Type::BaseModel
                # @!attribute country
                #   Fetch from this country (ISO 3166-1 alpha-2).
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
                #   Also return each page's HTML in `html`.
                #
                #   @return [Boolean, nil]
                optional :include_html, ContextDev::Internal::Type::Boolean, api_name: :includeHTML

                # @!attribute include_images
                #   Include image references in the Markdown (`html-conversion` only).
                #
                #   @return [Boolean, nil]
                optional :include_images, ContextDev::Internal::Type::Boolean, api_name: :includeImages

                # @!attribute include_links
                #   Include links in the Markdown (`html-conversion` only).
                #
                #   @return [Boolean, nil]
                optional :include_links, ContextDev::Internal::Type::Boolean, api_name: :includeLinks

                # @!attribute include_selectors
                #   Keep only elements matching these CSS selectors. Filtered pages ignore
                #   `maxAgeMs`.
                #
                #   @return [Array<String>, nil]
                optional :include_selectors,
                         ContextDev::Internal::Type::ArrayOf[String],
                         api_name: :includeSelectors,
                         nil?: true

                # @!attribute max_age_ms
                #   Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                #   year (31536000000 ms). `0` fetches fresh.
                #
                #   @return [Integer, nil]
                optional :max_age_ms, Integer, api_name: :maxAgeMs, nil?: true

                # @!attribute pdf
                #   PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                #
                #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf, nil]
                optional :pdf, -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf }

                # @!attribute settle_animations
                #   Wait for CSS animations to finish before extracting, on browser-rendered pages.
                #
                #   @return [Boolean, nil]
                optional :settle_animations, ContextDev::Internal::Type::Boolean, api_name: :settleAnimations

                # @!attribute shorten_base64_images
                #   Shorten inline base64 image data (`html-conversion` only).
                #
                #   @return [Boolean, nil]
                optional :shorten_base64_images,
                         ContextDev::Internal::Type::Boolean,
                         api_name: :shortenBase64Images

                # @!attribute source_preference
                #   Markdown sources in order of preference: `html-conversion` converts the page
                #   HTML, `markdown-direct` uses Markdown the site publishes.
                #
                #   @return [Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::SourcePreference>, nil]
                optional :source_preference,
                         -> {
                           ContextDev::Internal::Type::ArrayOf[enum: ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::SourcePreference]
                         },
                         api_name: :sourcePreference

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

                # @!method initialize(country: nil, exclude_selectors: nil, include_html: nil, include_images: nil, include_links: nil, include_selectors: nil, max_age_ms: nil, pdf: nil, settle_animations: nil, shorten_base64_images: nil, source_preference: nil, use_main_content_only: nil, wait_for_ms: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options}
                #   for more details.
                #
                #   Options for Markdown output.
                #
                #   @param country [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country] Fetch from this country (ISO 3166-1 alpha-2).
                #
                #   @param exclude_selectors [Array<String>, nil] Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                #
                #   @param include_html [Boolean] Also return each page's HTML in `html`.
                #
                #   @param include_images [Boolean] Include image references in the Markdown (`html-conversion` only).
                #
                #   @param include_links [Boolean] Include links in the Markdown (`html-conversion` only).
                #
                #   @param include_selectors [Array<String>, nil] Keep only elements matching these CSS selectors. Filtered pages ignore `maxAgeMs
                #
                #   @param max_age_ms [Integer, nil] Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                #
                #   @param pdf [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf] PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                #
                #   @param settle_animations [Boolean] Wait for CSS animations to finish before extracting, on browser-rendered pages.
                #
                #   @param shorten_base64_images [Boolean] Shorten inline base64 image data (`html-conversion` only).
                #
                #   @param source_preference [Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::SourcePreference>] Markdown sources in order of preference: `html-conversion` converts the page HTM
                #
                #   @param use_main_content_only [Boolean] Return the main content without navigation or footers.
                #
                #   @param wait_for_ms [Integer] How long to wait after initial page load, in milliseconds. `0` waits 500 ms.

                # Fetch from this country (ISO 3166-1 alpha-2).
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
                  #   Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
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
                  #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf}
                  #   for more details.
                  #
                  #   PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                  #
                  #   @param end_ [Integer] Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must be
                  #
                  #   @param ocr [Boolean] Read scanned PDF pages with OCR; preserve pages that already have text.
                  #
                  #   @param should_parse [Boolean] Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
                  #
                  #   @param start [Integer] First 1-based PDF page to parse.
                end

                module SourcePreference
                  extend ContextDev::Internal::Type::Enum

                  HTML_CONVERSION = :"html-conversion"
                  MARKDOWN_DIRECT = :"markdown-direct"

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end
            end

            # @deprecated
            class HTML < ContextDev::Internal::Type::BaseModel
              # @!attribute format_
              #   Return page content as HTML.
              #
              #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Format]
              required :format_,
                       enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Format },
                       api_name: :format

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

              # @!method initialize(format_:, source:, options: nil)
              #   Crawl pages and return HTML.
              #
              #   @param format_ [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Format] Return page content as HTML.
              #
              #   @param source [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap] How to find pages to crawl.
              #
              #   @param options [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options] Options for HTML output.

              # Return page content as HTML.
              #
              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML#format_
              module Format
                extend ContextDev::Internal::Type::Enum

                HTML = :html

                # @!method self.values
                #   @return [Array<Symbol>]
              end

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
                    # @!attribute exclude_regex
                    #   Regex pattern for URLs to exclude, even when they match `regex`. The `start_url`
                    #   itself is always included.
                    #
                    #   @return [String, nil]
                    optional :exclude_regex, String, api_name: :excludeRegex

                    # @!attribute follow_subdomains
                    #   Follow links to subdomains.
                    #
                    #   @return [Boolean, nil]
                    optional :follow_subdomains,
                             ContextDev::Internal::Type::Boolean,
                             api_name: :followSubdomains

                    # @!attribute languages
                    #   Only follow pages in these languages, or `same_as_start_url`; all languages when
                    #   omitted.
                    #
                    #   @return [Symbol, Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1>, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages, nil]
                    optional :languages,
                             union: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages }

                    # @!attribute max_depth
                    #   Maximum link depth. Source pages are depth 0. No limit when omitted.
                    #
                    #   @return [Integer, nil]
                    optional :max_depth, Integer, api_name: :maxDepth

                    # @!attribute max_urls
                    #   Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    #
                    #   @return [Integer, nil]
                    optional :max_urls, Integer, api_name: :maxUrls

                    # @!attribute regex
                    #   Regex pattern for URLs to include. The `start_url` itself is always included.
                    #
                    #   @return [String, nil]
                    optional :regex, String

                    # @!method initialize(exclude_regex: nil, follow_subdomains: nil, languages: nil, max_depth: nil, max_urls: nil, regex: nil)
                    #   Some parameter documentations has been truncated, see
                    #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls}
                    #   for more details.
                    #
                    #   Limits and filters for page discovery.
                    #
                    #   @param exclude_regex [String] Regex pattern for URLs to exclude, even when they match `regex`. The `start_url`
                    #
                    #   @param follow_subdomains [Boolean] Follow links to subdomains.
                    #
                    #   @param languages [Symbol, Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1>, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages] Only follow pages in these languages, or `same_as_start_url`; all languages when
                    #
                    #   @param max_depth [Integer] Maximum link depth. Source pages are depth 0. No limit when omitted.
                    #
                    #   @param max_urls [Integer] Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    #
                    #   @param regex [String] Regex pattern for URLs to include. The `start_url` itself is always included.

                    # Only follow pages in these languages, or `same_as_start_url`; all languages when
                    # omitted.
                    #
                    # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls#languages
                    module Languages
                      extend ContextDev::Internal::Type::Union

                      variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::SAME_AS_START_URL }

                      variant -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1Array }

                      module UnionMember1
                        extend ContextDev::Internal::Type::Enum

                        AM = :am
                        AR = :ar
                        AZ = :az
                        BE = :be
                        BG = :bg
                        BN = :bn
                        CA = :ca
                        CEB = :ceb
                        CS = :cs
                        CY = :cy
                        DA = :da
                        DE = :de
                        EL = :el
                        EN = :en
                        ES = :es
                        ET = :et
                        EU = :eu
                        FA = :fa
                        FI = :fi
                        FR = :fr
                        GU = :gu
                        HA = :ha
                        HAW = :haw
                        HE = :he
                        HI = :hi
                        HR = :hr
                        HU = :hu
                        HY = :hy
                        ID = :id
                        IS = :is
                        IT = :it
                        JA = :ja
                        KA = :ka
                        KK = :kk
                        KN = :kn
                        KO = :ko
                        KU = :ku
                        KY = :ky
                        LO = :lo
                        LT = :lt
                        LV = :lv
                        MK = :mk
                        ML = :ml
                        MN = :mn
                        MR = :mr
                        MS = :ms
                        NE = :ne
                        NL = :nl
                        NO = :no
                        OR = :or
                        PA = :pa
                        PL = :pl
                        PS = :ps
                        PT = :pt
                        RO = :ro
                        RU = :ru
                        SK = :sk
                        SL = :sl
                        SO = :so
                        SQ = :sq
                        SR = :sr
                        SV = :sv
                        SW = :sw
                        TA = :ta
                        TE = :te
                        TH = :th
                        TL = :tl
                        TR = :tr
                        UK = :uk
                        UR = :ur
                        UZ = :uz
                        VI = :vi
                        YO = :yo
                        ZH = :zh

                        # @!method self.values
                        #   @return [Array<Symbol>]
                      end

                      # @!method self.variants
                      #   @return [Array(Symbol, Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1>)]

                      define_sorbet_constant!(:Variants) do
                        T.type_alias do
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::TaggedSymbol,
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                            ]
                          )
                        end
                      end

                      # @!group

                      SAME_AS_START_URL = :same_as_start_url

                      # @!endgroup

                      # @type [ContextDev::Internal::Type::Converter]
                      UnionMember1Array =
                        ContextDev::Internal::Type::ArrayOf[
                          enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1 }
                        ]
                    end
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
                    # @!attribute exclude_regex
                    #   Regex pattern; sitemap URLs matching it are not scraped, even when they match
                    #   `regex`.
                    #
                    #   @return [String, nil]
                    optional :exclude_regex, String, api_name: :excludeRegex

                    # @!attribute max_urls
                    #   Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    #
                    #   @return [Integer, nil]
                    optional :max_urls, Integer, api_name: :maxUrls

                    # @!attribute regex
                    #   Regex pattern; only sitemap URLs matching it are scraped.
                    #
                    #   @return [String, nil]
                    optional :regex, String

                    # @!method initialize(exclude_regex: nil, max_urls: nil, regex: nil)
                    #   Some parameter documentations has been truncated, see
                    #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap::Controls}
                    #   for more details.
                    #
                    #   Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                    #   URLs and never follows links off them, so there is no crawl depth here.
                    #
                    #   @param exclude_regex [String] Regex pattern; sitemap URLs matching it are not scraped, even when they match `r
                    #
                    #   @param max_urls [Integer] Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    #
                    #   @param regex [String] Regex pattern; only sitemap URLs matching it are scraped.
                  end
                end

                # @!method self.variants
                #   @return [Array(ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap)]
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML#options
              class Options < ContextDev::Internal::Type::BaseModel
                # @!attribute country
                #   Fetch from this country (ISO 3166-1 alpha-2).
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
                #   Keep only elements matching these CSS selectors. Filtered pages ignore
                #   `maxAgeMs`.
                #
                #   @return [Array<String>, nil]
                optional :include_selectors,
                         ContextDev::Internal::Type::ArrayOf[String],
                         api_name: :includeSelectors,
                         nil?: true

                # @!attribute max_age_ms
                #   Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                #   year (31536000000 ms). `0` fetches fresh.
                #
                #   @return [Integer, nil]
                optional :max_age_ms, Integer, api_name: :maxAgeMs, nil?: true

                # @!attribute pdf
                #   PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                #
                #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf, nil]
                optional :pdf, -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf }

                # @!attribute settle_animations
                #   Wait for CSS animations to finish before extracting, on browser-rendered pages.
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
                #   @param country [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country] Fetch from this country (ISO 3166-1 alpha-2).
                #
                #   @param exclude_selectors [Array<String>, nil] Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                #
                #   @param include_selectors [Array<String>, nil] Keep only elements matching these CSS selectors. Filtered pages ignore `maxAgeMs
                #
                #   @param max_age_ms [Integer, nil] Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                #
                #   @param pdf [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf] PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                #
                #   @param settle_animations [Boolean] Wait for CSS animations to finish before extracting, on browser-rendered pages.
                #
                #   @param use_main_content_only [Boolean] Return the main content without navigation or footers.
                #
                #   @param wait_for_ms [Integer] How long to wait after initial page load, in milliseconds. `0` waits 500 ms.

                # Fetch from this country (ISO 3166-1 alpha-2).
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
                  #   Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
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
                  #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf}
                  #   for more details.
                  #
                  #   PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                  #
                  #   @param end_ [Integer] Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must be
                  #
                  #   @param ocr [Boolean] Read scanned PDF pages with OCR; preserve pages that already have text.
                  #
                  #   @param should_parse [Boolean] Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
                  #
                  #   @param start [Integer] First 1-based PDF page to parse.
                end
              end
            end

            class BatchUnifiedCrawlData < ContextDev::Internal::Type::BaseModel
              # @!attribute formats
              #   Outputs to return. Set at least one to `true`.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Formats]
              required :formats,
                       -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Formats }

              # @!attribute source
              #   How to find pages to crawl.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap]
              required :source,
                       union: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source }

              # @!attribute highlights_params
              #   Requires `formats.highlights: true`; required when it is set.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::HighlightsParams, nil]
              optional :highlights_params,
                       -> {
                         ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::HighlightsParams
                       },
                       api_name: :highlightsParams

              # @!attribute image_params
              #   Image options. Requires formats.images: true.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams, nil]
              optional :image_params,
                       -> {
                         ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams
                       },
                       api_name: :imageParams

              # @!attribute json_params
              #   Requires `formats.json: true`; required when it is set.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::JsonParams, nil]
              optional :json_params,
                       -> {
                         ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::JsonParams
                       },
                       api_name: :jsonParams

              # @!attribute markdown_params
              #   Markdown options. Requires `formats.markdown`.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams, nil]
              optional :markdown_params,
                       -> {
                         ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams
                       },
                       api_name: :markdownParams

              # @!attribute max_age_ms
              #   Maximum age of a cached output, in milliseconds. `0` fetches fresh. Defaults to
              #   3 days (259200000 ms). Maximum: 1 year (31536000000 ms).
              #
              #   @return [Integer, nil]
              optional :max_age_ms, Integer, api_name: :maxAgeMs

              # @!attribute parse_params
              #   Requires `formats.parse: true`; required when it is set.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser, nil]
              optional :parse_params,
                       union: -> {
                         ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams
                       },
                       api_name: :parseParams

              # @!attribute product_params
              #   Product options. Requires formats.product: true.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ProductParams, nil]
              optional :product_params,
                       -> {
                         ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ProductParams
                       },
                       api_name: :productParams

              # @!attribute screenshot_params
              #   Screenshot options. Requires formats.screenshot: true.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams, nil]
              optional :screenshot_params,
                       -> {
                         ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams
                       },
                       api_name: :screenshotParams

              # @!attribute shared_params
              #   Browser and content settings shared by all outputs.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams, nil]
              optional :shared_params,
                       -> {
                         ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams
                       },
                       api_name: :sharedParams

              # @!attribute tags
              #   Labels for filtering usage in the dashboard.
              #
              #   @return [Array<String>, nil]
              optional :tags, ContextDev::Internal::Type::ArrayOf[String]

              # @!attribute timeout_opts
              #   Deadline for each page, using the same behavior and defaults as POST
              #   /web/scrape.
              #
              #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts, nil]
              optional :timeout_opts,
                       -> {
                         ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts
                       },
                       api_name: :timeoutOpts

              # @!attribute zdr
              #   Batches persist their results. Only disabled is supported; enabled returns
              #   ZDR_NOT_SUPPORTED.
              #
              #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Zdr, nil]
              optional :zdr, enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Zdr }

              # @!method initialize(formats:, source:, highlights_params: nil, image_params: nil, json_params: nil, markdown_params: nil, max_age_ms: nil, parse_params: nil, product_params: nil, screenshot_params: nil, shared_params: nil, tags: nil, timeout_opts: nil, zdr: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData}
              #   for more details.
              #
              #   Use the same formats and parameters as POST /web/scrape, replacing url with
              #   source. Options apply to every page.
              #
              #   @param formats [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Formats] Outputs to return. Set at least one to `true`.
              #
              #   @param source [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap] How to find pages to crawl.
              #
              #   @param highlights_params [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::HighlightsParams] Requires `formats.highlights: true`; required when it is set.
              #
              #   @param image_params [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams] Image options. Requires formats.images: true.
              #
              #   @param json_params [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::JsonParams] Requires `formats.json: true`; required when it is set.
              #
              #   @param markdown_params [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams] Markdown options. Requires `formats.markdown`.
              #
              #   @param max_age_ms [Integer] Maximum age of a cached output, in milliseconds. `0` fetches fresh. Defaults to
              #
              #   @param parse_params [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser] Requires `formats.parse: true`; required when it is set.
              #
              #   @param product_params [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ProductParams] Product options. Requires formats.product: true.
              #
              #   @param screenshot_params [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams] Screenshot options. Requires formats.screenshot: true.
              #
              #   @param shared_params [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams] Browser and content settings shared by all outputs.
              #
              #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
              #
              #   @param timeout_opts [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts] Deadline for each page, using the same behavior and defaults as POST /web/scrape
              #
              #   @param zdr [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Zdr] Batches persist their results. Only disabled is supported; enabled returns ZDR_N

              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData#formats
              class Formats < ContextDev::Internal::Type::BaseModel
                # @!attribute bytes
                #   The original HTTP response body.
                #
                #   @return [Boolean, nil]
                optional :bytes, ContextDev::Internal::Type::Boolean

                # @!attribute highlights
                #   Markdown excerpts relevant to `highlightsParams.query`.
                #
                #   @return [Boolean, nil]
                optional :highlights, ContextDev::Internal::Type::Boolean

                # @!attribute html
                #   Rendered HTML.
                #
                #   @return [Boolean, nil]
                optional :html, ContextDev::Internal::Type::Boolean

                # @!attribute images
                #   Images found on the page.
                #
                #   @return [Boolean, nil]
                optional :images, ContextDev::Internal::Type::Boolean

                # @!attribute json
                #   An object matching `jsonParams.schema`, extracted from the page.
                #
                #   @return [Boolean, nil]
                optional :json, ContextDev::Internal::Type::Boolean

                # @!attribute markdown
                #   Page content as Markdown.
                #
                #   @return [Boolean, nil]
                optional :markdown, ContextDev::Internal::Type::Boolean

                # @!attribute parse
                #   Fields extracted with custom rules or a prebuilt parser, returned as `parsed`.
                #
                #   @return [Boolean, nil]
                optional :parse, ContextDev::Internal::Type::Boolean

                # @!attribute product
                #   Product details such as name, price, and availability.
                #
                #   @return [Boolean, nil]
                optional :product, ContextDev::Internal::Type::Boolean

                # @!attribute screenshot
                #   A screenshot of the page.
                #
                #   @return [Boolean, nil]
                optional :screenshot, ContextDev::Internal::Type::Boolean

                # @!method initialize(bytes: nil, highlights: nil, html: nil, images: nil, json: nil, markdown: nil, parse: nil, product: nil, screenshot: nil)
                #   Outputs to return. Set at least one to `true`.
                #
                #   @param bytes [Boolean] The original HTTP response body.
                #
                #   @param highlights [Boolean] Markdown excerpts relevant to `highlightsParams.query`.
                #
                #   @param html [Boolean] Rendered HTML.
                #
                #   @param images [Boolean] Images found on the page.
                #
                #   @param json [Boolean] An object matching `jsonParams.schema`, extracted from the page.
                #
                #   @param markdown [Boolean] Page content as Markdown.
                #
                #   @param parse [Boolean] Fields extracted with custom rules or a prebuilt parser, returned as `parsed`.
                #
                #   @param product [Boolean] Product details such as name, price, and availability.
                #
                #   @param screenshot [Boolean] A screenshot of the page.
              end

              # How to find pages to crawl.
              #
              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData#source
              module Source
                extend ContextDev::Internal::Type::Union

                discriminator :type

                # Discover pages by following links from one URL.
                variant :start_url,
                        -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL }

                # Scrape the pages listed in a domain's sitemap. Links on those pages are not followed.
                variant :sitemap,
                        -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap }

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
                  #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls, nil]
                  optional :controls,
                           -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls }

                  # @!method initialize(url:, controls: nil, type: :start_url)
                  #   Discover pages by following links from one URL.
                  #
                  #   @param url [String] Page where crawling begins. A URL without a scheme is read as https://.
                  #
                  #   @param controls [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls] Limits and filters for page discovery.
                  #
                  #   @param type [Symbol, :start_url] Start from one page.

                  # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL#controls
                  class Controls < ContextDev::Internal::Type::BaseModel
                    # @!attribute exclude_regex
                    #   Regex pattern for URLs to exclude, even when they match `regex`. The `start_url`
                    #   itself is always included.
                    #
                    #   @return [String, nil]
                    optional :exclude_regex, String, api_name: :excludeRegex

                    # @!attribute follow_subdomains
                    #   Follow links to subdomains.
                    #
                    #   @return [Boolean, nil]
                    optional :follow_subdomains,
                             ContextDev::Internal::Type::Boolean,
                             api_name: :followSubdomains

                    # @!attribute languages
                    #   Only follow pages in these languages, or `same_as_start_url`; all languages when
                    #   omitted.
                    #
                    #   @return [Symbol, Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1>, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages, nil]
                    optional :languages,
                             union: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages }

                    # @!attribute max_depth
                    #   Maximum link depth. Source pages are depth 0. No limit when omitted.
                    #
                    #   @return [Integer, nil]
                    optional :max_depth, Integer, api_name: :maxDepth

                    # @!attribute max_urls
                    #   Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    #
                    #   @return [Integer, nil]
                    optional :max_urls, Integer, api_name: :maxUrls

                    # @!attribute regex
                    #   Regex pattern for URLs to include. The `start_url` itself is always included.
                    #
                    #   @return [String, nil]
                    optional :regex, String

                    # @!method initialize(exclude_regex: nil, follow_subdomains: nil, languages: nil, max_depth: nil, max_urls: nil, regex: nil)
                    #   Some parameter documentations has been truncated, see
                    #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls}
                    #   for more details.
                    #
                    #   Limits and filters for page discovery.
                    #
                    #   @param exclude_regex [String] Regex pattern for URLs to exclude, even when they match `regex`. The `start_url`
                    #
                    #   @param follow_subdomains [Boolean] Follow links to subdomains.
                    #
                    #   @param languages [Symbol, Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1>, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages] Only follow pages in these languages, or `same_as_start_url`; all languages when
                    #
                    #   @param max_depth [Integer] Maximum link depth. Source pages are depth 0. No limit when omitted.
                    #
                    #   @param max_urls [Integer] Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    #
                    #   @param regex [String] Regex pattern for URLs to include. The `start_url` itself is always included.

                    # Only follow pages in these languages, or `same_as_start_url`; all languages when
                    # omitted.
                    #
                    # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls#languages
                    module Languages
                      extend ContextDev::Internal::Type::Union

                      variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::SAME_AS_START_URL }

                      variant -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1Array }

                      module UnionMember1
                        extend ContextDev::Internal::Type::Enum

                        AM = :am
                        AR = :ar
                        AZ = :az
                        BE = :be
                        BG = :bg
                        BN = :bn
                        CA = :ca
                        CEB = :ceb
                        CS = :cs
                        CY = :cy
                        DA = :da
                        DE = :de
                        EL = :el
                        EN = :en
                        ES = :es
                        ET = :et
                        EU = :eu
                        FA = :fa
                        FI = :fi
                        FR = :fr
                        GU = :gu
                        HA = :ha
                        HAW = :haw
                        HE = :he
                        HI = :hi
                        HR = :hr
                        HU = :hu
                        HY = :hy
                        ID = :id
                        IS = :is
                        IT = :it
                        JA = :ja
                        KA = :ka
                        KK = :kk
                        KN = :kn
                        KO = :ko
                        KU = :ku
                        KY = :ky
                        LO = :lo
                        LT = :lt
                        LV = :lv
                        MK = :mk
                        ML = :ml
                        MN = :mn
                        MR = :mr
                        MS = :ms
                        NE = :ne
                        NL = :nl
                        NO = :no
                        OR = :or
                        PA = :pa
                        PL = :pl
                        PS = :ps
                        PT = :pt
                        RO = :ro
                        RU = :ru
                        SK = :sk
                        SL = :sl
                        SO = :so
                        SQ = :sq
                        SR = :sr
                        SV = :sv
                        SW = :sw
                        TA = :ta
                        TE = :te
                        TH = :th
                        TL = :tl
                        TR = :tr
                        UK = :uk
                        UR = :ur
                        UZ = :uz
                        VI = :vi
                        YO = :yo
                        ZH = :zh

                        # @!method self.values
                        #   @return [Array<Symbol>]
                      end

                      # @!method self.variants
                      #   @return [Array(Symbol, Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1>)]

                      define_sorbet_constant!(:Variants) do
                        T.type_alias do
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::TaggedSymbol,
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                            ]
                          )
                        end
                      end

                      # @!group

                      SAME_AS_START_URL = :same_as_start_url

                      # @!endgroup

                      # @type [ContextDev::Internal::Type::Converter]
                      UnionMember1Array =
                        ContextDev::Internal::Type::ArrayOf[
                          enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1 }
                        ]
                    end
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
                  #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap::Controls, nil]
                  optional :controls,
                           -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap::Controls }

                  # @!method initialize(domain:, controls: nil, type: :sitemap)
                  #   Some parameter documentations has been truncated, see
                  #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap}
                  #   for more details.
                  #
                  #   Scrape the pages listed in a domain's sitemap. Links on those pages are not
                  #   followed.
                  #
                  #   @param domain [String] Domain whose sitemap lists the pages to scrape. A full URL is reduced to its dom
                  #
                  #   @param controls [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap::Controls] Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those U
                  #
                  #   @param type [Symbol, :sitemap] Scrape the URLs in the domain's sitemap.

                  # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap#controls
                  class Controls < ContextDev::Internal::Type::BaseModel
                    # @!attribute exclude_regex
                    #   Regex pattern; sitemap URLs matching it are not scraped, even when they match
                    #   `regex`.
                    #
                    #   @return [String, nil]
                    optional :exclude_regex, String, api_name: :excludeRegex

                    # @!attribute max_urls
                    #   Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    #
                    #   @return [Integer, nil]
                    optional :max_urls, Integer, api_name: :maxUrls

                    # @!attribute regex
                    #   Regex pattern; only sitemap URLs matching it are scraped.
                    #
                    #   @return [String, nil]
                    optional :regex, String

                    # @!method initialize(exclude_regex: nil, max_urls: nil, regex: nil)
                    #   Some parameter documentations has been truncated, see
                    #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap::Controls}
                    #   for more details.
                    #
                    #   Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                    #   URLs and never follows links off them, so there is no crawl depth here.
                    #
                    #   @param exclude_regex [String] Regex pattern; sitemap URLs matching it are not scraped, even when they match `r
                    #
                    #   @param max_urls [Integer] Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    #
                    #   @param regex [String] Regex pattern; only sitemap URLs matching it are scraped.
                  end
                end

                # @!method self.variants
                #   @return [Array(ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap)]
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData#highlights_params
              class HighlightsParams < ContextDev::Internal::Type::BaseModel
                # @!attribute query
                #   The question or topic to find passages for.
                #
                #   @return [String]
                required :query, String

                # @!attribute max_characters
                #   Maximum combined length of returned passages.
                #
                #   @return [Integer, nil]
                optional :max_characters, Integer, api_name: :maxCharacters

                # @!method initialize(query:, max_characters: nil)
                #   Requires `formats.highlights: true`; required when it is set.
                #
                #   @param query [String] The question or topic to find passages for.
                #
                #   @param max_characters [Integer] Maximum combined length of returned passages.
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData#image_params
              class ImageParams < ContextDev::Internal::Type::BaseModel
                # @!attribute dedupe
                #   Set `visual` to drop visual duplicates, keeping the largest copy.
                #
                #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Dedupe, nil]
                optional :dedupe,
                         enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Dedupe }

                # @!attribute enrich
                #   Extra data per image: `dimensions`, `classification`, or a hosted `file` URL.
                #
                #   @return [Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Enrich>, nil]
                optional :enrich,
                         -> { ContextDev::Internal::Type::ArrayOf[enum: ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Enrich] }

                # @!method initialize(dedupe: nil, enrich: nil)
                #   Image options. Requires formats.images: true.
                #
                #   @param dedupe [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Dedupe] Set `visual` to drop visual duplicates, keeping the largest copy.
                #
                #   @param enrich [Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Enrich>] Extra data per image: `dimensions`, `classification`, or a hosted `file` URL.

                # Set `visual` to drop visual duplicates, keeping the largest copy.
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams#dedupe
                module Dedupe
                  extend ContextDev::Internal::Type::Enum

                  NONE = :none
                  VISUAL = :visual

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                module Enrich
                  extend ContextDev::Internal::Type::Enum

                  DIMENSIONS = :dimensions
                  CLASSIFICATION = :classification
                  FILE = :file

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData#json_params
              class JsonParams < ContextDev::Internal::Type::BaseModel
                # @!attribute schema
                #   JSON Schema (not an example object) for a top-level object, up to 50 KB. Use
                #   optional or nullable fields for missing facts.
                #
                #   @return [Hash{Symbol=>Object}]
                required :schema, ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]

                # @!attribute instructions
                #   Extra guidance, such as which facts to prefer or how to read a field.
                #
                #   @return [String, nil]
                optional :instructions, String

                # @!method initialize(schema:, instructions: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::JsonParams}
                #   for more details.
                #
                #   Requires `formats.json: true`; required when it is set.
                #
                #   @param schema [Hash{Symbol=>Object}] JSON Schema (not an example object) for a top-level object, up to 50 KB. Use opt
                #
                #   @param instructions [String] Extra guidance, such as which facts to prefer or how to read a field.
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData#markdown_params
              class MarkdownParams < ContextDev::Internal::Type::BaseModel
                # @!attribute include_images
                #   Include images in the Markdown (`html-conversion` only).
                #
                #   @return [Boolean, nil]
                optional :include_images, ContextDev::Internal::Type::Boolean, api_name: :includeImages

                # @!attribute include_links
                #   Keep link URLs in the Markdown (`html-conversion` only).
                #
                #   @return [Boolean, nil]
                optional :include_links, ContextDev::Internal::Type::Boolean, api_name: :includeLinks

                # @!attribute inline_images
                #   How base64 images appear when `includeImages` is set (`html-conversion` only).
                #
                #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::InlineImages, nil]
                optional :inline_images,
                         enum: -> {
                           ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::InlineImages
                         },
                         api_name: :inlineImages

                # @!attribute source_preference
                #   Markdown sources in order of preference: `html-conversion` converts the page
                #   HTML, `markdown-direct` uses Markdown the site publishes.
                #
                #   @return [Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::SourcePreference>, nil]
                optional :source_preference,
                         -> do
                           ContextDev::Internal::Type::ArrayOf[
                             enum: ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::SourcePreference
                           ]
                         end,
                         api_name: :sourcePreference

                # @!method initialize(include_images: nil, include_links: nil, inline_images: nil, source_preference: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams}
                #   for more details.
                #
                #   Markdown options. Requires `formats.markdown`.
                #
                #   @param include_images [Boolean] Include images in the Markdown (`html-conversion` only).
                #
                #   @param include_links [Boolean] Keep link URLs in the Markdown (`html-conversion` only).
                #
                #   @param inline_images [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::InlineImages] How base64 images appear when `includeImages` is set (`html-conversion` only).
                #
                #   @param source_preference [Array<Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::SourcePreference>] Markdown sources in order of preference: `html-conversion` converts the page HTM

                # How base64 images appear when `includeImages` is set (`html-conversion` only).
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams#inline_images
                module InlineImages
                  extend ContextDev::Internal::Type::Enum

                  PLACEHOLDER = :placeholder
                  PRESERVE = :preserve

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                module SourcePreference
                  extend ContextDev::Internal::Type::Enum

                  HTML_CONVERSION = :"html-conversion"
                  MARKDOWN_DIRECT = :"markdown-direct"

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # Requires `formats.parse: true`; required when it is set.
              #
              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData#parse_params
              module ParseParams
                extend ContextDev::Internal::Type::Union

                variant -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser }

                variant -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser }

                class CustomParser < ContextDev::Internal::Type::BaseModel
                  # @!attribute rules
                  #   Field names mapped to CSS selectors (`h1`, `a@href`) or rule objects. Max 100
                  #   fields, 5 levels.
                  #
                  #   @return [Hash{Symbol=>String, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1}]
                  required :rules,
                           -> do
                             ContextDev::Internal::Type::HashOf[
                               union: ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule
                             ]
                           end

                  # @!attribute type
                  #   Extract fields using custom CSS rules. This is the default when type is omitted.
                  #
                  #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Type, nil]
                  optional :type,
                           enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Type }

                  # @!method initialize(rules:, type: nil)
                  #   Some parameter documentations has been truncated, see
                  #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser}
                  #   for more details.
                  #
                  #   @param rules [Hash{Symbol=>String, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1}] Field names mapped to CSS selectors (`h1`, `a@href`) or rule objects. Max 100 fi
                  #
                  #   @param type [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Type] Extract fields using custom CSS rules. This is the default when type is omitted.

                  module Rule
                    extend ContextDev::Internal::Type::Union

                    variant String

                    variant -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1 }

                    class UnionMember1 < ContextDev::Internal::Type::BaseModel
                      # @!attribute selector
                      #   CSS selector to match within the current page or parent rule.
                      #
                      #   @return [String]
                      required :selector, String

                      # @!attribute output
                      #   Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
                      #   to text.
                      #
                      #   @return [Symbol, String, Object, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Output, nil]
                      optional :output,
                               union: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Output }

                      # @!attribute type
                      #   Return the first match with `item` or all matches with `list`.
                      #
                      #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Type, nil]
                      optional :type,
                               enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Type }

                      # @!method initialize(selector:, output: nil, type: nil)
                      #   Some parameter documentations has been truncated, see
                      #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1}
                      #   for more details.
                      #
                      #   @param selector [String] CSS selector to match within the current page or parent rule.
                      #
                      #   @param output [Symbol, String, Object, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Output] Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
                      #
                      #   @param type [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Type] Return the first match with `item` or all matches with `list`.

                      # Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
                      # to text.
                      #
                      # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1#output
                      module Output
                        extend ContextDev::Internal::Type::Union

                        variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Output::TEXT }

                        variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Output::HTML }

                        variant String

                        variant ContextDev::Internal::Type::Unknown

                        # @!method self.variants
                        #   @return [Array(Symbol, String, Object)]

                        define_sorbet_constant!(:Variants) do
                          T.type_alias do
                            T.any(
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Output::TaggedSymbol,
                              String,
                              T.anything
                            )
                          end
                        end

                        # @!group

                        TEXT = :text
                        HTML = :html

                        # @!endgroup
                      end

                      # Return the first match with `item` or all matches with `list`.
                      #
                      # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1#type
                      module Type
                        extend ContextDev::Internal::Type::Enum

                        ITEM = :item
                        LIST = :list

                        # @!method self.values
                        #   @return [Array<Symbol>]
                      end
                    end

                    # @!method self.variants
                    #   @return [Array(String, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1)]
                  end

                  # Extract fields using custom CSS rules. This is the default when type is omitted.
                  #
                  # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser#type
                  module Type
                    extend ContextDev::Internal::Type::Enum

                    CUSTOM = :custom

                    # @!method self.values
                    #   @return [Array<Symbol>]
                  end
                end

                class PrebuiltParser < ContextDev::Internal::Type::BaseModel
                  # @!attribute parser
                  #   google-maps parses Google Maps business data into data.results. Accepts Maps
                  #   place, search, and internal data URLs. Uses a US exit and English labels
                  #   regardless of hl or Accept-Language. google-maps-reviews returns the reviews of
                  #   a place in data.reviews, in the same shape as the Serper reviews API (rating,
                  #   date, isoDate, snippet, translatedSnippet, likes, user, media, response, link,
                  #   id), plus language, guided ratings in details, and user.isLocalGuide; data also
                  #   carries the place featureId, cid, and sort. sort and limit pick the order and
                  #   count, and oldest is exact. It accepts Maps place, search, and ?cid= URLs, plus
                  #   search.google.com/local/reviews URLs, so the google_maps_url and
                  #   google_reviews_url fields of google-maps results work as input. An unknown place
                  #   returns no reviews. google-play parses a Play Store app into data: details,
                  #   developer contact, ratings, price, permissions, and data safety.
                  #   google-play-reviews returns the 200 newest reviews of the app, with developer
                  #   replies, in data.reviews. Both Play parsers accept app details URLs
                  #   (play.google.com/store/apps/details?id=…); hl and gl set the language and
                  #   storefront, defaulting to en and us. app-store parses an App Store app into
                  #   data: details, developer, ratings, price, version, and screenshots.
                  #   app-store-reviews returns up to the 500 newest reviews in data.reviews. Both App
                  #   Store parsers accept app URLs (apps.apple.com/us/app/…/id…); the country in the
                  #   path sets the storefront, defaulting to us. g2-reviews returns the 25 most
                  #   recently published reviews of a G2 product in data.reviews (rating, title,
                  #   likes, dislikes, problems_solved, reviewer role, company size, and industry),
                  #   plus data.product. It accepts G2 product URLs (g2.com/products/…), follows
                  #   renamed products, and keeps star-rating filters from the URL
                  #   (filters[nps_score][]=1 to 5); other filters, sort orders, and pages are
                  #   ignored. instagram-profile parses a public profile (instagram.com/{username})
                  #   into data: bio, links, follower and post counts, category, business address,
                  #   similar_accounts, and latest_posts (up to the 12 posts at the top of the
                  #   profile, newest first). Instagram lists pinned posts there ahead of newer ones,
                  #   so posts with is_pinned true can be older; when Instagram shows only a rounded
                  #   post count (32K), post_count is that rounded number and is_post_count_rounded is
                  #   true. instagram-post parses a post or reel (/p/…, /reel/…) into data: caption,
                  #   hashtags, mentions, like, comment, and view counts (like_count and view_count
                  #   are null when the owner hides them), media URLs, tagged users, collaborators,
                  #   location, and the top ~14 comments in data.comments. instagram-feed returns the
                  #   top posts for a hashtag or keyword (/explore/tags/…, /popular/…) or the recent
                  #   posts at a location (/explore/locations/{id}/…) in data.posts; keyword posts
                  #   carry only the shortcode, owner, thumbnail, and views, plus the caption when
                  #   Instagram shows it. All three Instagram parsers read public data without logging
                  #   in, so private accounts return no posts and follower lists are unavailable.
                  #   tiktok-profile parses a public profile (tiktok.com/@{username}) into data:
                  #   nickname, bio, bio link, follower, following, like, and video counts, verified,
                  #   private, and business flags, and business category; it does not list videos.
                  #   tiktok-video parses a video or photo post (/@{username}/video/{id} or
                  #   /@{username}/photo/{id}) into data: caption, hashtags, mentions, author, view,
                  #   like, comment, share, save, and repost counts, duration, thumbnail, a video_url
                  #   that downloads without cookies, image_urls for photo posts, music, location, and
                  #   ad, paid-partnership, and AI-generated flags. tiktok-feed returns videos in the
                  #   tiktok-video shape as data.videos: the latest 15 from a profile URL, the top 30
                  #   from a hashtag URL (/tag/{name}), or the top 12 from a search URL
                  #   (/search?q={query}). tiktok-comments returns the first 20 comments of a video or
                  #   photo post as data.comments: text, posted_at, like and reply counts, whether the
                  #   author liked it, and the commenter. tiktok-followers and tiktok-following return
                  #   up to 30 accounts of a profile as data.users, in the tiktok-profile shape.
                  #   tiktok-user-search returns the top 10 accounts for a user search URL
                  #   (/search/user?q={query}) as data.users: id, username, nickname, biography,
                  #   avatar_url, sec_uid, follower_count, like_count, and is_verified. The TikTok
                  #   parsers accept tiktok.com, www.tiktok.com, and m.tiktok.com URLs but not short
                  #   links (vm.tiktok.com, vt.tiktok.com, tiktok.com/t/…). emails accepts any page
                  #   and returns its email addresses as data.emails ([{ email }]), read from mailto
                  #   links, Cloudflare-protected addresses, and visible text. phone-numbers accepts
                  #   any page and returns its valid phone numbers in E.164 as data.phone_numbers ([{
                  #   phone }]), read from tel links and visible text; numbers without a country code
                  #   are read for the country of the site TLD, defaulting to US. links accepts any
                  #   page and returns its unique http(s) links as data.links ([{ url, text }]), with
                  #   absolute URLs; text falls back to aria-label or image alt and is null when a
                  #   link has none. The emails parser reads the rendered page and respects content
                  #   filters; the other prebuilt parsers read their data independently of DOM
                  #   filters.
                  #
                  #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser]
                  required :parser,
                           enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser }

                  # @!attribute type
                  #   Use a prebuilt parser instead of custom rules.
                  #
                  #   @return [Symbol, :prebuilt]
                  required :type, const: :prebuilt

                  # @!attribute limit
                  #   google-maps-reviews only. Maximum number of reviews to return. Defaults to 100;
                  #   maximum 1000.
                  #
                  #   @return [Integer, nil]
                  optional :limit, Integer

                  # @!attribute sort
                  #   google-maps-reviews only. Order of data.reviews. newest, relevant, highest, and
                  #   lowest follow Google; oldest returns the earliest reviews first, which Google
                  #   itself does not offer.
                  #
                  #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Sort, nil]
                  optional :sort,
                           enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Sort }

                  # @!method initialize(parser:, limit: nil, sort: nil, type: :prebuilt)
                  #   Some parameter documentations has been truncated, see
                  #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser}
                  #   for more details.
                  #
                  #   @param parser [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser] google-maps parses Google Maps business data into data.results. Accepts Maps pla
                  #
                  #   @param limit [Integer] google-maps-reviews only. Maximum number of reviews to return. Defaults to 100;
                  #
                  #   @param sort [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Sort] google-maps-reviews only. Order of data.reviews. newest, relevant, highest, and
                  #
                  #   @param type [Symbol, :prebuilt] Use a prebuilt parser instead of custom rules.

                  # google-maps parses Google Maps business data into data.results. Accepts Maps
                  # place, search, and internal data URLs. Uses a US exit and English labels
                  # regardless of hl or Accept-Language. google-maps-reviews returns the reviews of
                  # a place in data.reviews, in the same shape as the Serper reviews API (rating,
                  # date, isoDate, snippet, translatedSnippet, likes, user, media, response, link,
                  # id), plus language, guided ratings in details, and user.isLocalGuide; data also
                  # carries the place featureId, cid, and sort. sort and limit pick the order and
                  # count, and oldest is exact. It accepts Maps place, search, and ?cid= URLs, plus
                  # search.google.com/local/reviews URLs, so the google_maps_url and
                  # google_reviews_url fields of google-maps results work as input. An unknown place
                  # returns no reviews. google-play parses a Play Store app into data: details,
                  # developer contact, ratings, price, permissions, and data safety.
                  # google-play-reviews returns the 200 newest reviews of the app, with developer
                  # replies, in data.reviews. Both Play parsers accept app details URLs
                  # (play.google.com/store/apps/details?id=…); hl and gl set the language and
                  # storefront, defaulting to en and us. app-store parses an App Store app into
                  # data: details, developer, ratings, price, version, and screenshots.
                  # app-store-reviews returns up to the 500 newest reviews in data.reviews. Both App
                  # Store parsers accept app URLs (apps.apple.com/us/app/…/id…); the country in the
                  # path sets the storefront, defaulting to us. g2-reviews returns the 25 most
                  # recently published reviews of a G2 product in data.reviews (rating, title,
                  # likes, dislikes, problems_solved, reviewer role, company size, and industry),
                  # plus data.product. It accepts G2 product URLs (g2.com/products/…), follows
                  # renamed products, and keeps star-rating filters from the URL
                  # (filters[nps_score][]=1 to 5); other filters, sort orders, and pages are
                  # ignored. instagram-profile parses a public profile (instagram.com/{username})
                  # into data: bio, links, follower and post counts, category, business address,
                  # similar_accounts, and latest_posts (up to the 12 posts at the top of the
                  # profile, newest first). Instagram lists pinned posts there ahead of newer ones,
                  # so posts with is_pinned true can be older; when Instagram shows only a rounded
                  # post count (32K), post_count is that rounded number and is_post_count_rounded is
                  # true. instagram-post parses a post or reel (/p/…, /reel/…) into data: caption,
                  # hashtags, mentions, like, comment, and view counts (like_count and view_count
                  # are null when the owner hides them), media URLs, tagged users, collaborators,
                  # location, and the top ~14 comments in data.comments. instagram-feed returns the
                  # top posts for a hashtag or keyword (/explore/tags/…, /popular/…) or the recent
                  # posts at a location (/explore/locations/{id}/…) in data.posts; keyword posts
                  # carry only the shortcode, owner, thumbnail, and views, plus the caption when
                  # Instagram shows it. All three Instagram parsers read public data without logging
                  # in, so private accounts return no posts and follower lists are unavailable.
                  # tiktok-profile parses a public profile (tiktok.com/@{username}) into data:
                  # nickname, bio, bio link, follower, following, like, and video counts, verified,
                  # private, and business flags, and business category; it does not list videos.
                  # tiktok-video parses a video or photo post (/@{username}/video/{id} or
                  # /@{username}/photo/{id}) into data: caption, hashtags, mentions, author, view,
                  # like, comment, share, save, and repost counts, duration, thumbnail, a video_url
                  # that downloads without cookies, image_urls for photo posts, music, location, and
                  # ad, paid-partnership, and AI-generated flags. tiktok-feed returns videos in the
                  # tiktok-video shape as data.videos: the latest 15 from a profile URL, the top 30
                  # from a hashtag URL (/tag/{name}), or the top 12 from a search URL
                  # (/search?q={query}). tiktok-comments returns the first 20 comments of a video or
                  # photo post as data.comments: text, posted_at, like and reply counts, whether the
                  # author liked it, and the commenter. tiktok-followers and tiktok-following return
                  # up to 30 accounts of a profile as data.users, in the tiktok-profile shape.
                  # tiktok-user-search returns the top 10 accounts for a user search URL
                  # (/search/user?q={query}) as data.users: id, username, nickname, biography,
                  # avatar_url, sec_uid, follower_count, like_count, and is_verified. The TikTok
                  # parsers accept tiktok.com, www.tiktok.com, and m.tiktok.com URLs but not short
                  # links (vm.tiktok.com, vt.tiktok.com, tiktok.com/t/…). emails accepts any page
                  # and returns its email addresses as data.emails ([{ email }]), read from mailto
                  # links, Cloudflare-protected addresses, and visible text. phone-numbers accepts
                  # any page and returns its valid phone numbers in E.164 as data.phone_numbers ([{
                  # phone }]), read from tel links and visible text; numbers without a country code
                  # are read for the country of the site TLD, defaulting to US. links accepts any
                  # page and returns its unique http(s) links as data.links ([{ url, text }]), with
                  # absolute URLs; text falls back to aria-label or image alt and is null when a
                  # link has none. The emails parser reads the rendered page and respects content
                  # filters; the other prebuilt parsers read their data independently of DOM
                  # filters.
                  #
                  # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser#parser
                  module Parser
                    extend ContextDev::Internal::Type::Enum

                    GOOGLE_MAPS = :"google-maps"
                    GOOGLE_MAPS_REVIEWS = :"google-maps-reviews"
                    GOOGLE_PLAY = :"google-play"
                    GOOGLE_PLAY_REVIEWS = :"google-play-reviews"
                    APP_STORE = :"app-store"
                    APP_STORE_REVIEWS = :"app-store-reviews"
                    G2_REVIEWS = :"g2-reviews"
                    INSTAGRAM_PROFILE = :"instagram-profile"
                    INSTAGRAM_POST = :"instagram-post"
                    INSTAGRAM_FEED = :"instagram-feed"
                    TIKTOK_PROFILE = :"tiktok-profile"
                    TIKTOK_VIDEO = :"tiktok-video"
                    TIKTOK_FEED = :"tiktok-feed"
                    TIKTOK_COMMENTS = :"tiktok-comments"
                    TIKTOK_FOLLOWERS = :"tiktok-followers"
                    TIKTOK_FOLLOWING = :"tiktok-following"
                    TIKTOK_USER_SEARCH = :"tiktok-user-search"
                    EMAILS = :emails
                    PHONE_NUMBERS = :"phone-numbers"
                    LINKS = :links

                    # @!method self.values
                    #   @return [Array<Symbol>]
                  end

                  # google-maps-reviews only. Order of data.reviews. newest, relevant, highest, and
                  # lowest follow Google; oldest returns the earliest reviews first, which Google
                  # itself does not offer.
                  #
                  # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser#sort
                  module Sort
                    extend ContextDev::Internal::Type::Enum

                    NEWEST = :newest
                    OLDEST = :oldest
                    RELEVANT = :relevant
                    HIGHEST = :highest
                    LOWEST = :lowest

                    # @!method self.values
                    #   @return [Array<Symbol>]
                  end
                end

                # @!method self.variants
                #   @return [Array(ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser)]
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData#product_params
              class ProductParams < ContextDev::Internal::Type::BaseModel
                # @!attribute dedupe_images
                #   Drop visually duplicate product images, keeping the largest copy.
                #
                #   @return [Boolean, nil]
                optional :dedupe_images, ContextDev::Internal::Type::Boolean, api_name: :dedupeImages

                # @!attribute use_ai_fallback
                #   @deprecated
                #
                #   Ignored. The AI fallback runs automatically.
                #
                #   @return [Boolean, nil]
                optional :use_ai_fallback, ContextDev::Internal::Type::Boolean, api_name: :useAIFallback

                # @!method initialize(dedupe_images: nil, use_ai_fallback: nil)
                #   Product options. Requires formats.product: true.
                #
                #   @param dedupe_images [Boolean] Drop visually duplicate product images, keeping the largest copy.
                #
                #   @param use_ai_fallback [Boolean] Ignored. The AI fallback runs automatically.
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData#screenshot_params
              class ScreenshotParams < ContextDev::Internal::Type::BaseModel
                # @!attribute area
                #   What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40
                #   megapixels.
                #
                #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Page, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Element, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Rectangle, nil]
                optional :area,
                         union: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area }

                # @!attribute format_
                #   Image format for the screenshot.
                #
                #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Format, nil]
                optional :format_,
                         enum: -> {
                           ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Format
                         },
                         api_name: :format

                # @!method initialize(area: nil, format_: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams}
                #   for more details.
                #
                #   Screenshot options. Requires formats.screenshot: true.
                #
                #   @param area [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Page, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Element, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Rectangle] What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40 meg
                #
                #   @param format_ [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Format] Image format for the screenshot.

                # What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40
                # megapixels.
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams#area
                module Area
                  extend ContextDev::Internal::Type::Union

                  variant enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Page }

                  variant -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Element }

                  # Pixels from the document origin.
                  variant -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Rectangle }

                  module Page
                    extend ContextDev::Internal::Type::Enum

                    VIEWPORT = :viewport
                    FULL_PAGE = :fullPage

                    # @!method self.values
                    #   @return [Array<Symbol>]
                  end

                  class Element < ContextDev::Internal::Type::BaseModel
                    # @!attribute selector
                    #   CSS selector matching exactly one visible element.
                    #
                    #   @return [String]
                    required :selector, String

                    # @!method initialize(selector:)
                    #   @param selector [String] CSS selector matching exactly one visible element.
                  end

                  class Rectangle < ContextDev::Internal::Type::BaseModel
                    # @!attribute height
                    #   Height of the capture in pixels.
                    #
                    #   @return [Integer]
                    required :height, Integer

                    # @!attribute width
                    #   Width of the capture in pixels.
                    #
                    #   @return [Integer]
                    required :width, Integer

                    # @!attribute x
                    #   Left edge of the capture, in pixels from the document origin.
                    #
                    #   @return [Integer]
                    required :x, Integer

                    # @!attribute y_
                    #   Top edge of the capture, in pixels from the document origin.
                    #
                    #   @return [Integer]
                    required :y_, Integer, api_name: :y

                    # @!method initialize(height:, width:, x:, y_:)
                    #   Pixels from the document origin.
                    #
                    #   @param height [Integer] Height of the capture in pixels.
                    #
                    #   @param width [Integer] Width of the capture in pixels.
                    #
                    #   @param x [Integer] Left edge of the capture, in pixels from the document origin.
                    #
                    #   @param y_ [Integer] Top edge of the capture, in pixels from the document origin.
                  end

                  # @!method self.variants
                  #   @return [Array(Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Page, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Element, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Rectangle)]
                end

                # Image format for the screenshot.
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams#format_
                module Format
                  extend ContextDev::Internal::Type::Enum

                  PNG = :png
                  JPEG = :jpeg
                  WEBP = :webp

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData#shared_params
              class SharedParams < ContextDev::Internal::Type::BaseModel
                # @!attribute actions
                #   Browser steps run in order before capture. Requires a paid plan. Skips the
                #   cache.
                #
                #   @return [Array<ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Perform, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Wait, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::WaitFor>, nil]
                optional :actions,
                         -> { ContextDev::Internal::Type::ArrayOf[union: ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action] }

                # @!attribute country
                #   Proxy country as a two-letter code, such as `US`. Case-insensitive.
                #
                #   @return [String, nil]
                optional :country, String

                # @!attribute dismiss_cookies
                #   Accept cookie banners before actions and capture.
                #
                #   @return [Boolean, nil]
                optional :dismiss_cookies, ContextDev::Internal::Type::Boolean, api_name: :dismissCookies

                # @!attribute dismiss_popups
                #   Close other popups before actions and capture.
                #
                #   @return [Boolean, nil]
                optional :dismiss_popups, ContextDev::Internal::Type::Boolean, api_name: :dismissPopups

                # @!attribute exclude_selectors
                #   Remove elements matching these CSS selectors. Overrides `includeSelectors`.
                #
                #   @return [Array<String>, nil]
                optional :exclude_selectors,
                         ContextDev::Internal::Type::ArrayOf[String],
                         api_name: :excludeSelectors

                # @!attribute headers
                #   HTTP headers to send to the target site. Requests with headers skip the cache.
                #
                #   @return [Hash{Symbol=>String}, nil]
                optional :headers, ContextDev::Internal::Type::HashOf[String]

                # @!attribute include_frames
                #   Include iframe content in HTML and text outputs. Screenshots always show visible
                #   frames.
                #
                #   @return [Boolean, nil]
                optional :include_frames, ContextDev::Internal::Type::Boolean, api_name: :includeFrames

                # @!attribute include_selectors
                #   Keep only elements matching these CSS selectors.
                #
                #   @return [Array<String>, nil]
                optional :include_selectors,
                         ContextDev::Internal::Type::ArrayOf[String],
                         api_name: :includeSelectors

                # @!attribute main_content_only
                #   Keep only the main content. Doesn't affect `screenshot`, `bytes`, or `product`.
                #
                #   @return [Boolean, nil]
                optional :main_content_only, ContextDev::Internal::Type::Boolean, api_name: :mainContentOnly

                # @!attribute parsers
                #   Document parsing options.
                #
                #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers, nil]
                optional :parsers,
                         -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers }

                # @!attribute profile
                #   Create or reuse an authenticated browser profile. Requires a paid plan and an
                #   HTTPS target. Profiles persist session state, bypass shared caches, and cannot
                #   be combined with ZDR, custom headers, raw bytes, or prebuilt parsers.
                #
                #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::Existing, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::New, nil]
                optional :profile,
                         union: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile }

                # @!attribute settle_animations
                #   Wait for CSS animations to finish before capture. Defaults to `true` when
                #   `screenshot` is requested.
                #
                #   @return [Boolean, nil]
                optional :settle_animations, ContextDev::Internal::Type::Boolean, api_name: :settleAnimations

                # @!attribute theme
                #   Emulate a light or dark color scheme.
                #
                #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Theme, nil]
                optional :theme,
                         enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Theme }

                # @!attribute viewport
                #   Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
                #   default to 1440 × 900.
                #
                #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Viewport, nil]
                optional :viewport,
                         -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Viewport }

                # @!attribute wait_for
                #   Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500
                #   (2000 with frames or XML).
                #
                #   @return [Integer, String, nil]
                optional :wait_for,
                         union: -> {
                           ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::WaitFor
                         },
                         api_name: :waitFor

                # @!method initialize(actions: nil, country: nil, dismiss_cookies: nil, dismiss_popups: nil, exclude_selectors: nil, headers: nil, include_frames: nil, include_selectors: nil, main_content_only: nil, parsers: nil, profile: nil, settle_animations: nil, theme: nil, viewport: nil, wait_for: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams}
                #   for more details.
                #
                #   Browser and content settings shared by all outputs.
                #
                #   @param actions [Array<ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Perform, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Wait, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::WaitFor>] Browser steps run in order before capture. Requires a paid plan. Skips the cache
                #
                #   @param country [String] Proxy country as a two-letter code, such as `US`. Case-insensitive.
                #
                #   @param dismiss_cookies [Boolean] Accept cookie banners before actions and capture.
                #
                #   @param dismiss_popups [Boolean] Close other popups before actions and capture.
                #
                #   @param exclude_selectors [Array<String>] Remove elements matching these CSS selectors. Overrides `includeSelectors`.
                #
                #   @param headers [Hash{Symbol=>String}] HTTP headers to send to the target site. Requests with headers skip the cache.
                #
                #   @param include_frames [Boolean] Include iframe content in HTML and text outputs. Screenshots always show visible
                #
                #   @param include_selectors [Array<String>] Keep only elements matching these CSS selectors.
                #
                #   @param main_content_only [Boolean] Keep only the main content. Doesn't affect `screenshot`, `bytes`, or `product`.
                #
                #   @param parsers [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers] Document parsing options.
                #
                #   @param profile [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::Existing, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::New] Create or reuse an authenticated browser profile. Requires a paid plan and an HT
                #
                #   @param settle_animations [Boolean] Wait for CSS animations to finish before capture. Defaults to `true` when `scree
                #
                #   @param theme [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Theme] Emulate a light or dark color scheme.
                #
                #   @param viewport [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Viewport] Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
                #
                #   @param wait_for [Integer, String] Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500 (200

                module Action
                  extend ContextDev::Internal::Type::Union

                  discriminator :type

                  variant :perform,
                          -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Perform }

                  variant :scroll,
                          -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll }

                  variant :wait,
                          -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Wait }

                  variant :waitFor,
                          -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::WaitFor }

                  class Perform < ContextDev::Internal::Type::BaseModel
                    # @!attribute action
                    #   One browser instruction, such as clicking a button or entering text.
                    #
                    #   @return [String]
                    required :action, String

                    # @!attribute type
                    #   Use `perform` for a plain-language browser instruction.
                    #
                    #   @return [Symbol, :perform]
                    required :type, const: :perform

                    # @!method initialize(action:, type: :perform)
                    #   @param action [String] One browser instruction, such as clicking a button or entering text.
                    #
                    #   @param type [Symbol, :perform] Use `perform` for a plain-language browser instruction.
                  end

                  class Scroll < ContextDev::Internal::Type::BaseModel
                    # @!attribute type
                    #   Use `scroll` to move through the page or a container.
                    #
                    #   @return [Symbol, :scroll]
                    required :type, const: :scroll

                    # @!attribute amount
                    #   Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
                    #
                    #   @return [Integer, Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Amount, nil]
                    optional :amount,
                             union: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Amount }

                    # @!attribute direction
                    #   Direction to scroll.
                    #
                    #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Direction, nil]
                    optional :direction,
                             enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Direction }

                    # @!attribute max_scrolls
                    #   Maximum number of scroll steps for this action.
                    #
                    #   @return [Integer, nil]
                    optional :max_scrolls, Integer, api_name: :maxScrolls

                    # @!attribute selector
                    #   Scroll this container. Omit to scroll the page.
                    #
                    #   @return [String, nil]
                    optional :selector, String

                    # @!method initialize(amount: nil, direction: nil, max_scrolls: nil, selector: nil, type: :scroll)
                    #   @param amount [Integer, Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Amount] Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
                    #
                    #   @param direction [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Direction] Direction to scroll.
                    #
                    #   @param max_scrolls [Integer] Maximum number of scroll steps for this action.
                    #
                    #   @param selector [String] Scroll this container. Omit to scroll the page.
                    #
                    #   @param type [Symbol, :scroll] Use `scroll` to move through the page or a container.

                    # Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
                    #
                    # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll#amount
                    module Amount
                      extend ContextDev::Internal::Type::Union

                      variant Integer

                      variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Amount::VIEWPORT }

                      variant const: -> { ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Amount::MAX }

                      # @!method self.variants
                      #   @return [Array(Integer, Symbol)]

                      define_sorbet_constant!(:Variants) do
                        T.type_alias do
                          T.any(
                            Integer,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Amount::TaggedSymbol
                          )
                        end
                      end

                      # @!group

                      VIEWPORT = :viewport
                      MAX = :max

                      # @!endgroup
                    end

                    # Direction to scroll.
                    #
                    # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll#direction
                    module Direction
                      extend ContextDev::Internal::Type::Enum

                      DOWN = :down
                      UP = :up
                      LEFT = :left
                      RIGHT = :right

                      # @!method self.values
                      #   @return [Array<Symbol>]
                    end
                  end

                  class Wait < ContextDev::Internal::Type::BaseModel
                    # @!attribute milliseconds
                    #   Time to pause in milliseconds before the next action.
                    #
                    #   @return [Integer]
                    required :milliseconds, Integer

                    # @!attribute type
                    #   Use `wait` to pause for a fixed duration.
                    #
                    #   @return [Symbol, :wait]
                    required :type, const: :wait

                    # @!method initialize(milliseconds:, type: :wait)
                    #   @param milliseconds [Integer] Time to pause in milliseconds before the next action.
                    #
                    #   @param type [Symbol, :wait] Use `wait` to pause for a fixed duration.
                  end

                  class WaitFor < ContextDev::Internal::Type::BaseModel
                    # @!attribute selector
                    #   CSS selector to wait for before continuing.
                    #
                    #   @return [String]
                    required :selector, String

                    # @!attribute type
                    #   Use `waitFor` to wait for a matching element.
                    #
                    #   @return [Symbol, :waitFor]
                    required :type, const: :waitFor

                    # @!method initialize(selector:, type: :waitFor)
                    #   @param selector [String] CSS selector to wait for before continuing.
                    #
                    #   @param type [Symbol, :waitFor] Use `waitFor` to wait for a matching element.
                  end

                  # @!method self.variants
                  #   @return [Array(ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Perform, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Wait, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::WaitFor)]
                end

                # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams#parsers
                class Parsers < ContextDev::Internal::Type::BaseModel
                  # @!attribute pdf
                  #   PDF page range and OCR.
                  #
                  #   @return [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf, nil]
                  optional :pdf,
                           -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf }

                  # @!method initialize(pdf: nil)
                  #   Document parsing options.
                  #
                  #   @param pdf [ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf] PDF page range and OCR.

                  # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers#pdf
                  class Pdf < ContextDev::Internal::Type::BaseModel
                    # @!attribute end_page
                    #   Last page to parse. Must be at least `startPage`.
                    #
                    #   @return [Integer, nil]
                    optional :end_page, Integer, api_name: :endPage

                    # @!attribute include_numbered_pages
                    #   Start each page in the Markdown with a `<!-- page N -->` line using its original
                    #   1-based page number; these responses are never served from cache.
                    #
                    #   @return [Boolean, nil]
                    optional :include_numbered_pages,
                             ContextDev::Internal::Type::Boolean,
                             api_name: :includeNumberedPages

                    # @!attribute ocr
                    #   Set `auto` to read scanned pages with OCR.
                    #
                    #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf::Ocr, nil]
                    optional :ocr,
                             enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf::Ocr }

                    # @!attribute start_page
                    #   First page to parse, starting at 1.
                    #
                    #   @return [Integer, nil]
                    optional :start_page, Integer, api_name: :startPage

                    # @!method initialize(end_page: nil, include_numbered_pages: nil, ocr: nil, start_page: nil)
                    #   Some parameter documentations has been truncated, see
                    #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf}
                    #   for more details.
                    #
                    #   PDF page range and OCR.
                    #
                    #   @param end_page [Integer] Last page to parse. Must be at least `startPage`.
                    #
                    #   @param include_numbered_pages [Boolean] Start each page in the Markdown with a `<!-- page N -->` line using its original
                    #
                    #   @param ocr [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf::Ocr] Set `auto` to read scanned pages with OCR.
                    #
                    #   @param start_page [Integer] First page to parse, starting at 1.

                    # Set `auto` to read scanned pages with OCR.
                    #
                    # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf#ocr
                    module Ocr
                      extend ContextDev::Internal::Type::Enum

                      OFF = :off
                      AUTO = :auto

                      # @!method self.values
                      #   @return [Array<Symbol>]
                    end
                  end
                end

                # Create or reuse an authenticated browser profile. Requires a paid plan and an
                # HTTPS target. Profiles persist session state, bypass shared caches, and cannot
                # be combined with ZDR, custom headers, raw bytes, or prebuilt parsers.
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams#profile
                module Profile
                  extend ContextDev::Internal::Type::Union

                  discriminator :type

                  variant :existing,
                          -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::Existing }

                  variant :new,
                          -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::New }

                  class Existing < ContextDev::Internal::Type::BaseModel
                    # @!attribute profile_id
                    #   The ID returned in profile.id by an earlier scrape.
                    #
                    #   @return [String]
                    required :profile_id, String, api_name: :profileId

                    # @!attribute type
                    #   Reuse a saved browser profile.
                    #
                    #   @return [Symbol, :existing]
                    required :type, const: :existing

                    # @!method initialize(profile_id:, type: :existing)
                    #   @param profile_id [String] The ID returned in profile.id by an earlier scrape.
                    #
                    #   @param type [Symbol, :existing] Reuse a saved browser profile.
                  end

                  class New < ContextDev::Internal::Type::BaseModel
                    # @!attribute identifier
                    #   Username or email for the target website.
                    #
                    #   @return [String]
                    required :identifier, String

                    # @!attribute type
                    #   Sign in and create a browser profile.
                    #
                    #   @return [Symbol, :new]
                    required :type, const: :new

                    # @!attribute description
                    #   Optional label shown when listing profiles with `GET /org/browser/profiles`.
                    #
                    #   @return [String, nil]
                    optional :description, String

                    request_only do
                      # @!attribute password
                      #   Password used to sign in. It is never stored in the profile.
                      #
                      #   @return [String]
                      required :password, String
                    end

                    # @!method initialize(identifier:, password:, description: nil, type: :new)
                    #   @param identifier [String] Username or email for the target website.
                    #
                    #   @param password [String] Password used to sign in. It is never stored in the profile.
                    #
                    #   @param description [String] Optional label shown when listing profiles with `GET /org/browser/profiles`.
                    #
                    #   @param type [Symbol, :new] Sign in and create a browser profile.
                  end

                  # @!method self.variants
                  #   @return [Array(ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::Existing, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::New)]
                end

                # Emulate a light or dark color scheme.
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams#theme
                module Theme
                  extend ContextDev::Internal::Type::Enum

                  LIGHT = :light
                  DARK = :dark

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams#viewport
                class Viewport < ContextDev::Internal::Type::BaseModel
                  # @!attribute height
                  #   Browser viewport height in pixels.
                  #
                  #   @return [Integer, nil]
                  optional :height, Integer

                  # @!attribute width
                  #   Browser viewport width in pixels.
                  #
                  #   @return [Integer, nil]
                  optional :width, Integer

                  # @!method initialize(height: nil, width: nil)
                  #   Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
                  #   default to 1440 × 900.
                  #
                  #   @param height [Integer] Browser viewport height in pixels.
                  #
                  #   @param width [Integer] Browser viewport width in pixels.
                end

                # Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500
                # (2000 with frames or XML).
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams#wait_for
                module WaitFor
                  extend ContextDev::Internal::Type::Union

                  variant Integer

                  variant String

                  # @!method self.variants
                  #   @return [Array(Integer, String)]
                end
              end

              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData#timeout_opts
              class TimeoutOpts < ContextDev::Internal::Type::BaseModel
                # @!attribute milliseconds
                #   Deadline in milliseconds.
                #
                #   @return [Integer]
                required :milliseconds, Integer

                # @!attribute behavior
                #   "fail" returns 408 at the deadline. "return-partial" returns available results;
                #   inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
                #
                #   @return [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts::Behavior, nil]
                optional :behavior,
                         enum: -> { ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts::Behavior }

                # @!method initialize(milliseconds:, behavior: nil)
                #   Some parameter documentations has been truncated, see
                #   {ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts}
                #   for more details.
                #
                #   Deadline for each page, using the same behavior and defaults as POST
                #   /web/scrape.
                #
                #   @param milliseconds [Integer] Deadline in milliseconds.
                #
                #   @param behavior [Symbol, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts::Behavior] "fail" returns 408 at the deadline. "return-partial" returns available results;

                # "fail" returns 408 at the deadline. "return-partial" returns available results;
                # inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
                #
                # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts#behavior
                module Behavior
                  extend ContextDev::Internal::Type::Enum

                  FAIL = :fail
                  RETURN_PARTIAL = :"return-partial"

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # Batches persist their results. Only disabled is supported; enabled returns
              # ZDR_NOT_SUPPORTED.
              #
              # @see ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData#zdr
              module Zdr
                extend ContextDev::Internal::Type::Enum

                DISABLED = :disabled

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @!method self.variants
            #   @return [Array(ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::Markdown, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::HTML, ContextDev::Models::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData)]
          end
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::BatchSubmitParams::Input::Scrape, ContextDev::Models::BatchSubmitParams::Input::Crawl)]
      end

      class Webhook < ContextDev::Internal::Type::BaseModel
        # @!attribute url
        #   Public HTTP(S) URL that receives batch completion, failure, or cancellation
        #   events.
        #
        #   @return [String]
        required :url, String

        # @!attribute retry_
        #   Webhook retry settings. Use {} for the default schedule.
        #
        #   @return [ContextDev::Models::RetryConfig, nil]
        optional :retry_, -> { ContextDev::RetryConfig }, api_name: :retry

        # @!method initialize(url:, retry_: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::BatchSubmitParams::Webhook} for more details.
        #
        #   Where to send the batch's final-status event. Omit `retry` for one attempt; `{}`
        #   uses the default retry schedule.
        #
        #   @param url [String] Public HTTP(S) URL that receives batch completion, failure, or cancellation even
        #
        #   @param retry_ [ContextDev::Models::RetryConfig] Webhook retry settings. Use {} for the default schedule.
      end
    end
  end
end
