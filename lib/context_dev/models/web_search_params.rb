# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#search
    class WebSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute query
      #   Search query. Accepts natural language and search operators such as `site:`,
      #   `-site:`, `inurl:`, `intitle:`, quoted phrases, and `OR`.
      #
      #   @return [String]
      required :query, String

      # @!attribute country
      #   Localize results to this country, as an ISO 3166-1 alpha-2 code such as `us` or
      #   `de`.
      #
      #   @return [Symbol, ContextDev::Models::WebSearchParams::Country, nil]
      optional :country, enum: -> { ContextDev::WebSearchParams::Country }

      # @!attribute description_max_characters
      #   Maximum length of each result's `description`, in characters.
      #
      #   @return [Integer, nil]
      optional :description_max_characters, Integer, api_name: :descriptionMaxCharacters, nil?: true

      # @!attribute exclude_domains
      #   Leave out results from these domains, such as `pinterest.com`.
      #
      #   @return [Array<String>, nil]
      optional :exclude_domains, ContextDev::Internal::Type::ArrayOf[String], api_name: :excludeDomains

      # @!attribute freshness
      #   Restrict results to content published within this window.
      #
      #   @return [Symbol, ContextDev::Models::WebSearchParams::Freshness, nil]
      optional :freshness, enum: -> { ContextDev::WebSearchParams::Freshness }

      # @!attribute highlights_options
      #   Return passages from each result page that are relevant to the query. Pages are
      #   read with the `markdownOptions` settings.
      #
      #   @return [ContextDev::Models::WebSearchParams::HighlightsOptions, nil]
      optional :highlights_options,
               -> { ContextDev::WebSearchParams::HighlightsOptions },
               api_name: :highlightsOptions,
               nil?: true

      # @!attribute include_domains
      #   Only return results from these domains, such as `arxiv.org`.
      #
      #   @return [Array<String>, nil]
      optional :include_domains, ContextDev::Internal::Type::ArrayOf[String], api_name: :includeDomains

      # @!attribute languages
      #   Languages to return results in, as BCP 47 codes such as `en` or `de`, or `all`
      #   for any language.
      #
      #   @return [Symbol, Array<Symbol, ContextDev::Models::WebSearchParams::Languages::UnionMember1>, ContextDev::Models::WebSearchParams::Languages, nil]
      optional :languages, union: -> { ContextDev::WebSearchParams::Languages }

      # @!attribute markdown_options
      #   Scrape each result page to Markdown. Set `enabled` to `true` to turn it on.
      #
      #   @return [ContextDev::Models::WebSearchParams::MarkdownOptions, nil]
      optional :markdown_options,
               -> { ContextDev::WebSearchParams::MarkdownOptions },
               api_name: :markdownOptions,
               nil?: true

      # @!attribute num_results
      #   Number of results to return.
      #
      #   @return [Integer, nil]
      optional :num_results, Integer, api_name: :numResults

      # @!attribute policies
      #   Access policy IDs to apply; each URL must pass all of them. Requires access
      #   policies enabled for your organization; otherwise returns
      #   `ACCESS_POLICIES_NOT_ENABLED`.
      #
      #   @return [Array<String>, nil]
      optional :policies, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute tags
      #   Labels for this request. Filter usage and request logs by them in the dashboard
      #   or with `GET /org/logs`.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Request deadline and what to return when it passes.
      #
      #   @return [ContextDev::Models::WebSearchParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::WebSearchParams::TimeoutOpts }, api_name: :timeoutOpts

      # @!attribute zdr
      #   `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      #   your organization has ZDR.
      #
      #   @return [Symbol, ContextDev::Models::WebSearchParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::WebSearchParams::Zdr }

      # @!method initialize(query:, country: nil, description_max_characters: nil, exclude_domains: nil, freshness: nil, highlights_options: nil, include_domains: nil, languages: nil, markdown_options: nil, num_results: nil, policies: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebSearchParams} for more details.
      #
      #   @param query [String] Search query. Accepts natural language and search operators such as `site:`, `-s
      #
      #   @param country [Symbol, ContextDev::Models::WebSearchParams::Country] Localize results to this country, as an ISO 3166-1 alpha-2 code such as `us` or
      #
      #   @param description_max_characters [Integer, nil] Maximum length of each result's `description`, in characters.
      #
      #   @param exclude_domains [Array<String>] Leave out results from these domains, such as `pinterest.com`.
      #
      #   @param freshness [Symbol, ContextDev::Models::WebSearchParams::Freshness] Restrict results to content published within this window.
      #
      #   @param highlights_options [ContextDev::Models::WebSearchParams::HighlightsOptions, nil] Return passages from each result page that are relevant to the query. Pages are
      #
      #   @param include_domains [Array<String>] Only return results from these domains, such as `arxiv.org`.
      #
      #   @param languages [Symbol, Array<Symbol, ContextDev::Models::WebSearchParams::Languages::UnionMember1>, ContextDev::Models::WebSearchParams::Languages] Languages to return results in, as BCP 47 codes such as `en` or `de`, or `all` f
      #
      #   @param markdown_options [ContextDev::Models::WebSearchParams::MarkdownOptions, nil] Scrape each result page to Markdown. Set `enabled` to `true` to turn it on.
      #
      #   @param num_results [Integer] Number of results to return.
      #
      #   @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
      #
      #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
      #
      #   @param timeout_opts [ContextDev::Models::WebSearchParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      #   @param zdr [Symbol, ContextDev::Models::WebSearchParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Localize results to this country, as an ISO 3166-1 alpha-2 code such as `us` or
      # `de`.
      module Country
        extend ContextDev::Internal::Type::Enum

        AF = :af
        AL = :al
        DZ = :dz
        AS = :as
        AD = :ad
        AO = :ao
        AI = :ai
        AQ = :aq
        AG = :ag
        AR = :ar
        AM = :am
        AW = :aw
        AU = :au
        AT = :at
        AZ = :az
        BS = :bs
        BH = :bh
        BD = :bd
        BB = :bb
        BY = :by
        BE = :be
        BZ = :bz
        BJ = :bj
        BM = :bm
        BT = :bt
        BO = :bo
        BA = :ba
        BW = :bw
        BV = :bv
        BR = :br
        IO = :io
        BN = :bn
        BG = :bg
        BF = :bf
        BI = :bi
        KH = :kh
        CM = :cm
        CA = :ca
        CV = :cv
        KY = :ky
        CF = :cf
        TD = :td
        CL = :cl
        CN = :cn
        CX = :cx
        CC = :cc
        CO = :co
        KM = :km
        CG = :cg
        CD = :cd
        CK = :ck
        CR = :cr
        CI = :ci
        HR = :hr
        CU = :cu
        CY = :cy
        CZ = :cz
        DK = :dk
        DJ = :dj
        DM = :dm
        DO = :do
        EC = :ec
        EG = :eg
        SV = :sv
        GQ = :gq
        ER = :er
        EE = :ee
        ET = :et
        FK = :fk
        FO = :fo
        FJ = :fj
        FI = :fi
        FR = :fr
        GF = :gf
        PF = :pf
        TF = :tf
        GA = :ga
        GM = :gm
        GE = :ge
        DE = :de
        GH = :gh
        GI = :gi
        GR = :gr
        GL = :gl
        GD = :gd
        GP = :gp
        GU = :gu
        GT = :gt
        GN = :gn
        GW = :gw
        GY = :gy
        HT = :ht
        HM = :hm
        VA = :va
        HN = :hn
        HK = :hk
        HU = :hu
        IS = :is
        IN = :in
        ID = :id
        IR = :ir
        IQ = :iq
        IE = :ie
        IL = :il
        IT = :it
        JM = :jm
        JP = :jp
        JO = :jo
        KZ = :kz
        KE = :ke
        KI = :ki
        KP = :kp
        KR = :kr
        KW = :kw
        KG = :kg
        LA = :la
        LV = :lv
        LB = :lb
        LS = :ls
        LR = :lr
        LY = :ly
        LI = :li
        LT = :lt
        LU = :lu
        MO = :mo
        MK = :mk
        MG = :mg
        MW = :mw
        MY = :my
        MV = :mv
        ML = :ml
        MT = :mt
        MH = :mh
        MQ = :mq
        MR = :mr
        MU = :mu
        YT = :yt
        MX = :mx
        FM = :fm
        MD = :md
        MC = :mc
        MN = :mn
        MS = :ms
        MA = :ma
        MZ = :mz
        MM = :mm
        NA = :na
        NR = :nr
        NP = :np
        NL = :nl
        AN = :an
        NC = :nc
        NZ = :nz
        NI = :ni
        NE = :ne
        NG = :ng
        NU = :nu
        NF = :nf
        MP = :mp
        NO = :no
        OM = :om
        PK = :pk
        PW = :pw
        PS = :ps
        PA = :pa
        PG = :pg
        PY = :py
        PE = :pe
        PH = :ph
        PN = :pn
        PL = :pl
        PT = :pt
        PR = :pr
        QA = :qa
        RE = :re
        RO = :ro
        RU = :ru
        RW = :rw
        SH = :sh
        KN = :kn
        LC = :lc
        PM = :pm
        VC = :vc
        WS = :ws
        SM = :sm
        ST = :st
        SA = :sa
        SN = :sn
        RS = :rs
        SC = :sc
        SL = :sl
        SG = :sg
        SK = :sk
        SI = :si
        SB = :sb
        SO = :so
        ZA = :za
        GS = :gs
        ES = :es
        LK = :lk
        SD = :sd
        SR = :sr
        SJ = :sj
        SZ = :sz
        SE = :se
        CH = :ch
        SY = :sy
        TW = :tw
        TJ = :tj
        TZ = :tz
        TH = :th
        TL = :tl
        TG = :tg
        TK = :tk
        TO = :to
        TT = :tt
        TN = :tn
        TR = :tr
        TM = :tm
        TC = :tc
        TV = :tv
        UG = :ug
        UA = :ua
        AE = :ae
        GB = :gb
        US = :us
        UM = :um
        UY = :uy
        UZ = :uz
        VU = :vu
        VE = :ve
        VN = :vn
        VG = :vg
        VI = :vi
        WF = :wf
        EH = :eh
        YE = :ye
        ZM = :zm
        ZW = :zw

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Restrict results to content published within this window.
      module Freshness
        extend ContextDev::Internal::Type::Enum

        LAST_24_HOURS = :last_24_hours
        LAST_WEEK = :last_week
        LAST_MONTH = :last_month
        LAST_YEAR = :last_year

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class HighlightsOptions < ContextDev::Internal::Type::BaseModel
        # @!attribute enabled
        #   Return relevant passages for each result. Adds 1 credit per 10 results.
        #
        #   @return [Boolean, nil]
        optional :enabled, ContextDev::Internal::Type::Boolean

        # @!attribute max_characters
        #   Maximum combined length of passages per result, in characters.
        #
        #   @return [Integer, nil]
        optional :max_characters, Integer, api_name: :maxCharacters

        # @!method initialize(enabled: nil, max_characters: nil)
        #   Return passages from each result page that are relevant to the query. Pages are
        #   read with the `markdownOptions` settings.
        #
        #   @param enabled [Boolean] Return relevant passages for each result. Adds 1 credit per 10 results.
        #
        #   @param max_characters [Integer] Maximum combined length of passages per result, in characters.
      end

      # Languages to return results in, as BCP 47 codes such as `en` or `de`, or `all`
      # for any language.
      module Languages
        extend ContextDev::Internal::Type::Union

        variant const: -> { ContextDev::Models::WebSearchParams::Languages::ALL }

        variant -> { ContextDev::Models::WebSearchParams::Languages::UnionMember1Array }

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
        #   @return [Array(Symbol, Array<Symbol, ContextDev::Models::WebSearchParams::Languages::UnionMember1>)]

        define_sorbet_constant!(:Variants) do
          T.type_alias do
            T.any(
              ContextDev::WebSearchParams::Languages::TaggedSymbol,
              T::Array[ContextDev::WebSearchParams::Languages::UnionMember1::TaggedSymbol]
            )
          end
        end

        # @!group

        ALL = :all

        # @!endgroup

        # @type [ContextDev::Internal::Type::Converter]
        UnionMember1Array =
          ContextDev::Internal::Type::ArrayOf[enum: -> {
            ContextDev::WebSearchParams::Languages::UnionMember1
          }]
      end

      class MarkdownOptions < ContextDev::Internal::Type::BaseModel
        # @!attribute enabled
        #   Scrape each result page to Markdown. Adds 1 credit per result that returns
        #   Markdown.
        #
        #   @return [Boolean, nil]
        optional :enabled, ContextDev::Internal::Type::Boolean

        # @!attribute include_frames
        #   Which iframe contents to include in the Markdown. `auto` inlines only iframes
        #   that hold page content, such as same-site documents, framesets, job boards,
        #   forms, and embedded documents, and skips ads and widgets. `true` inlines every
        #   iframe; `false` inlines none.
        #
        #   @return [Boolean, Symbol, ContextDev::Models::WebSearchParams::MarkdownOptions::IncludeFrames, nil]
        optional :include_frames,
                 union: -> { ContextDev::WebSearchParams::MarkdownOptions::IncludeFrames },
                 api_name: :includeFrames

        # @!attribute include_images
        #   Include image references in the Markdown.
        #
        #   @return [Boolean, nil]
        optional :include_images, ContextDev::Internal::Type::Boolean, api_name: :includeImages

        # @!attribute include_links
        #   Keep link URLs in the Markdown.
        #
        #   @return [Boolean, nil]
        optional :include_links, ContextDev::Internal::Type::Boolean, api_name: :includeLinks

        # @!attribute max_age_ms
        #   Maximum age of a cached result, in milliseconds. `0` always fetches fresh.
        #   Defaults to 180 days (15552000000 ms) with Markdown, or 365 days (31536000000
        #   ms) with highlights only.
        #
        #   @return [Integer, nil]
        optional :max_age_ms, Integer, api_name: :maxAgeMs, nil?: true

        # @!attribute pdf
        #   Whether to parse PDFs and which pages to read.
        #
        #   @return [ContextDev::Models::WebSearchParams::MarkdownOptions::Pdf, nil]
        optional :pdf, -> { ContextDev::WebSearchParams::MarkdownOptions::Pdf }

        # @!attribute shorten_base64_images
        #   Shorten inline base64 image data.
        #
        #   @return [Boolean, nil]
        optional :shorten_base64_images, ContextDev::Internal::Type::Boolean, api_name: :shortenBase64Images

        # @!attribute timeout_opts
        #   Request deadline and what to return when it passes.
        #
        #   @return [ContextDev::Models::WebSearchParams::MarkdownOptions::TimeoutOpts, nil]
        optional :timeout_opts,
                 -> { ContextDev::WebSearchParams::MarkdownOptions::TimeoutOpts },
                 api_name: :timeoutOpts

        # @!attribute use_main_content_only
        #   Keep only the main content, without navigation, headers, footers, or sidebars.
        #
        #   @return [Boolean, nil]
        optional :use_main_content_only, ContextDev::Internal::Type::Boolean, api_name: :useMainContentOnly

        # @!attribute wait_for_ms
        #   Time to wait after each result page loads before reading it, in milliseconds.
        #   `0` waits 500 ms. Helps with JavaScript-heavy pages.
        #
        #   @return [Integer, nil]
        optional :wait_for_ms, Integer, api_name: :waitForMs, nil?: true

        # @!method initialize(enabled: nil, include_frames: nil, include_images: nil, include_links: nil, max_age_ms: nil, pdf: nil, shorten_base64_images: nil, timeout_opts: nil, use_main_content_only: nil, wait_for_ms: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebSearchParams::MarkdownOptions} for more details.
        #
        #   Scrape each result page to Markdown. Set `enabled` to `true` to turn it on.
        #
        #   @param enabled [Boolean] Scrape each result page to Markdown. Adds 1 credit per result that returns Markd
        #
        #   @param include_frames [Boolean, Symbol, ContextDev::Models::WebSearchParams::MarkdownOptions::IncludeFrames] Which iframe contents to include in the Markdown. `auto` inlines only iframes th
        #
        #   @param include_images [Boolean] Include image references in the Markdown.
        #
        #   @param include_links [Boolean] Keep link URLs in the Markdown.
        #
        #   @param max_age_ms [Integer, nil] Maximum age of a cached result, in milliseconds. `0` always fetches fresh. Defau
        #
        #   @param pdf [ContextDev::Models::WebSearchParams::MarkdownOptions::Pdf] Whether to parse PDFs and which pages to read.
        #
        #   @param shorten_base64_images [Boolean] Shorten inline base64 image data.
        #
        #   @param timeout_opts [ContextDev::Models::WebSearchParams::MarkdownOptions::TimeoutOpts] Request deadline and what to return when it passes.
        #
        #   @param use_main_content_only [Boolean] Keep only the main content, without navigation, headers, footers, or sidebars.
        #
        #   @param wait_for_ms [Integer, nil] Time to wait after each result page loads before reading it, in milliseconds. `0

        # Which iframe contents to include in the Markdown. `auto` inlines only iframes
        # that hold page content, such as same-site documents, framesets, job boards,
        # forms, and embedded documents, and skips ads and widgets. `true` inlines every
        # iframe; `false` inlines none.
        #
        # @see ContextDev::Models::WebSearchParams::MarkdownOptions#include_frames
        module IncludeFrames
          extend ContextDev::Internal::Type::Union

          variant ContextDev::Internal::Type::Boolean

          variant const: -> { ContextDev::Models::WebSearchParams::MarkdownOptions::IncludeFrames::AUTO }

          # @!method self.variants
          #   @return [Array(Boolean, Symbol)]

          define_sorbet_constant!(:Variants) do
            T.type_alias { T.any(T::Boolean, ContextDev::WebSearchParams::MarkdownOptions::IncludeFrames::TaggedSymbol) }
          end

          # @!group

          AUTO = :auto

          # @!endgroup
        end

        # @see ContextDev::Models::WebSearchParams::MarkdownOptions#pdf
        class Pdf < ContextDev::Internal::Type::BaseModel
          # @!attribute end_
          #   Last page to parse. Defaults to the last page. Must be at least `start`.
          #
          #   @return [Integer, nil]
          optional :end_, Integer, api_name: :end

          # @!attribute should_parse
          #   Parse PDF results. When `false`, PDF results fail with `WEBSITE_ACCESS_ERROR`.
          #
          #   @return [Boolean, nil]
          optional :should_parse, ContextDev::Internal::Type::Boolean, api_name: :shouldParse

          # @!attribute start
          #   First page to parse, starting at 1.
          #
          #   @return [Integer, nil]
          optional :start, Integer

          # @!method initialize(end_: nil, should_parse: nil, start: nil)
          #   Whether to parse PDFs and which pages to read.
          #
          #   @param end_ [Integer] Last page to parse. Defaults to the last page. Must be at least `start`.
          #
          #   @param should_parse [Boolean] Parse PDF results. When `false`, PDF results fail with `WEBSITE_ACCESS_ERROR`.
          #
          #   @param start [Integer] First page to parse, starting at 1.
        end

        # @see ContextDev::Models::WebSearchParams::MarkdownOptions#timeout_opts
        class TimeoutOpts < ContextDev::Internal::Type::BaseModel
          # @!attribute milliseconds
          #   Deadline in milliseconds.
          #
          #   @return [Integer]
          required :milliseconds, Integer

          # @!attribute behavior
          #   `fail` returns 408 at the deadline. `return-partial` returns the results
          #   collected so far and marks the response as partial. `return-partial` requires at
          #   least 5000 ms. On `POST /web/scrape`, an output that is not ready in time fails
          #   with `REQUEST_TIMEOUT` inside a 200 response under either behavior; 408 means
          #   the whole request could not respond by the deadline.
          #
          #   @return [Symbol, ContextDev::Models::WebSearchParams::MarkdownOptions::TimeoutOpts::Behavior, nil]
          optional :behavior, enum: -> { ContextDev::WebSearchParams::MarkdownOptions::TimeoutOpts::Behavior }

          # @!method initialize(milliseconds:, behavior: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::WebSearchParams::MarkdownOptions::TimeoutOpts} for more
          #   details.
          #
          #   Request deadline and what to return when it passes.
          #
          #   @param milliseconds [Integer] Deadline in milliseconds.
          #
          #   @param behavior [Symbol, ContextDev::Models::WebSearchParams::MarkdownOptions::TimeoutOpts::Behavior] `fail` returns 408 at the deadline. `return-partial` returns the results collect

          # `fail` returns 408 at the deadline. `return-partial` returns the results
          # collected so far and marks the response as partial. `return-partial` requires at
          # least 5000 ms. On `POST /web/scrape`, an output that is not ready in time fails
          # with `REQUEST_TIMEOUT` inside a 200 response under either behavior; 408 means
          # the whole request could not respond by the deadline.
          #
          # @see ContextDev::Models::WebSearchParams::MarkdownOptions::TimeoutOpts#behavior
          module Behavior
            extend ContextDev::Internal::Type::Enum

            FAIL = :fail
            RETURN_PARTIAL = :"return-partial"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
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
        #   @return [Symbol, ContextDev::Models::WebSearchParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::WebSearchParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebSearchParams::TimeoutOpts} for more details.
        #
        #   Request deadline and what to return when it passes.
        #
        #   @param milliseconds [Integer] Deadline in milliseconds.
        #
        #   @param behavior [Symbol, ContextDev::Models::WebSearchParams::TimeoutOpts::Behavior] `fail` returns 408 at the deadline. `return-partial` returns the results collect

        # `fail` returns 408 at the deadline. `return-partial` returns the results
        # collected so far and marks the response as partial.
        #
        # @see ContextDev::Models::WebSearchParams::TimeoutOpts#behavior
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
