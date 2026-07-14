# typed: strong

module ContextDev
  module Models
    class WebWebScrapeMdParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::WebWebScrapeMdParams, ContextDev::Internal::AnyHash)
        end

      # Full URL to scrape into LLM usable Markdown (must include http:// or https://
      # protocol)
      sig { returns(String) }
      attr_accessor :url

      # Two-letter ISO 3166-1 alpha-2 country code identifying a supported Context.dev
      # residential proxy exit location. Must be one of Context.dev's supported
      # countries. When provided, Context.dev fetches the target page from that country.
      sig do
        returns(T.nilable(ContextDev::WebWebScrapeMdParams::Country::OrSymbol))
      end
      attr_reader :country

      sig do
        params(
          country: ContextDev::WebWebScrapeMdParams::Country::OrSymbol
        ).void
      end
      attr_writer :country

      # CSS selectors to remove before conversion to Markdown. Applied after
      # includeSelectors. Exclusion takes precedence: an element matching both is
      # removed. Examples: "nav", "footer", ".ad-banner", "[aria-hidden=true]".
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :exclude_selectors

      # Optional outbound HTTP headers forwarded only to the target URL, sent as
      # deep-object query params such as headers[X-Custom]=value. When provided, caching
      # is bypassed: the result is neither read from nor written to cache.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      # When true, the contents of iframes are rendered to Markdown.
      sig do
        returns(
          T.nilable(
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::IncludeFrames::OrSymbol
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
              ContextDev::WebWebScrapeMdParams::IncludeFrames::OrSymbol
            )
        ).void
      end
      attr_writer :include_frames

      # Include image references in Markdown output
      sig do
        returns(
          T.nilable(
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::IncludeImages::OrSymbol
            )
          )
        )
      end
      attr_reader :include_images

      sig do
        params(
          include_images:
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::IncludeImages::OrSymbol
            )
        ).void
      end
      attr_writer :include_images

      # Preserve hyperlinks in Markdown output
      sig do
        returns(
          T.nilable(
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::IncludeLinks::OrSymbol
            )
          )
        )
      end
      attr_reader :include_links

      sig do
        params(
          include_links:
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::IncludeLinks::OrSymbol
            )
        ).void
      end
      attr_writer :include_links

      # CSS selectors. When provided, only matching HTML subtrees (and their
      # descendants) are kept before conversion to Markdown. When omitted, the entire
      # document is kept. Examples: "article.main", "#content", "[role=main]".
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :include_selectors

      # Return a cached result if a prior scrape for the same parameters exists and is
      # younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
      # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_age_ms

      # PDF parsing controls. Use start/end to limit text extraction and embedded-image
      # detection/OCR to an inclusive 1-based page range.
      sig { returns(T.nilable(ContextDev::WebWebScrapeMdParams::Pdf)) }
      attr_reader :pdf

      sig { params(pdf: ContextDev::WebWebScrapeMdParams::Pdf::OrHash).void }
      attr_writer :pdf

      # When true, waits briefly for CSS and transition animations to settle before
      # converting to Markdown. Defaults to false. This adds a bit of latency in
      # exchange for more stable output on animated pages.
      sig do
        returns(
          T.nilable(
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::SettleAnimations::OrSymbol
            )
          )
        )
      end
      attr_reader :settle_animations

      sig do
        params(
          settle_animations:
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::SettleAnimations::OrSymbol
            )
        ).void
      end
      attr_writer :settle_animations

      # Shorten base64-encoded image data in the Markdown output
      sig do
        returns(
          T.nilable(
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::ShortenBase64Images::OrSymbol
            )
          )
        )
      end
      attr_reader :shorten_base64_images

      sig do
        params(
          shorten_base64_images:
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::ShortenBase64Images::OrSymbol
            )
        ).void
      end
      attr_writer :shorten_base64_images

      # Optional comma-separated caller-defined tags for tracking this request. Tags are
      # recorded on the request's usage log and can be used to filter usage on the
      # dashboard usage page. Up to 20 tags, each 1-50 characters.
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

      # Extract only the main content of the page, excluding headers, footers, sidebars,
      # and navigation
      sig do
        returns(
          T.nilable(
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::UseMainContentOnly::OrSymbol
            )
          )
        )
      end
      attr_reader :use_main_content_only

      sig do
        params(
          use_main_content_only:
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::UseMainContentOnly::OrSymbol
            )
        ).void
      end
      attr_writer :use_main_content_only

      # Optional browser wait time in milliseconds after initial page load before
      # converting the page to Markdown. Min: 0. Max: 30000 (30 seconds).
      sig { returns(T.nilable(Integer)) }
      attr_accessor :wait_for_ms

      sig do
        params(
          url: String,
          country: ContextDev::WebWebScrapeMdParams::Country::OrSymbol,
          exclude_selectors: T.nilable(T::Array[String]),
          headers: T::Hash[Symbol, String],
          include_frames:
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::IncludeFrames::OrSymbol
            ),
          include_images:
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::IncludeImages::OrSymbol
            ),
          include_links:
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::IncludeLinks::OrSymbol
            ),
          include_selectors: T.nilable(T::Array[String]),
          max_age_ms: T.nilable(Integer),
          pdf: ContextDev::WebWebScrapeMdParams::Pdf::OrHash,
          settle_animations:
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::SettleAnimations::OrSymbol
            ),
          shorten_base64_images:
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::ShortenBase64Images::OrSymbol
            ),
          tags: T::Array[String],
          timeout_ms: Integer,
          use_main_content_only:
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::UseMainContentOnly::OrSymbol
            ),
          wait_for_ms: T.nilable(Integer),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Full URL to scrape into LLM usable Markdown (must include http:// or https://
        # protocol)
        url:,
        # Two-letter ISO 3166-1 alpha-2 country code identifying a supported Context.dev
        # residential proxy exit location. Must be one of Context.dev's supported
        # countries. When provided, Context.dev fetches the target page from that country.
        country: nil,
        # CSS selectors to remove before conversion to Markdown. Applied after
        # includeSelectors. Exclusion takes precedence: an element matching both is
        # removed. Examples: "nav", "footer", ".ad-banner", "[aria-hidden=true]".
        exclude_selectors: nil,
        # Optional outbound HTTP headers forwarded only to the target URL, sent as
        # deep-object query params such as headers[X-Custom]=value. When provided, caching
        # is bypassed: the result is neither read from nor written to cache.
        headers: nil,
        # When true, the contents of iframes are rendered to Markdown.
        include_frames: nil,
        # Include image references in Markdown output
        include_images: nil,
        # Preserve hyperlinks in Markdown output
        include_links: nil,
        # CSS selectors. When provided, only matching HTML subtrees (and their
        # descendants) are kept before conversion to Markdown. When omitted, the entire
        # document is kept. Examples: "article.main", "#content", "[role=main]".
        include_selectors: nil,
        # Return a cached result if a prior scrape for the same parameters exists and is
        # younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
        # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
        max_age_ms: nil,
        # PDF parsing controls. Use start/end to limit text extraction and embedded-image
        # detection/OCR to an inclusive 1-based page range.
        pdf: nil,
        # When true, waits briefly for CSS and transition animations to settle before
        # converting to Markdown. Defaults to false. This adds a bit of latency in
        # exchange for more stable output on animated pages.
        settle_animations: nil,
        # Shorten base64-encoded image data in the Markdown output
        shorten_base64_images: nil,
        # Optional comma-separated caller-defined tags for tracking this request. Tags are
        # recorded on the request's usage log and can be used to filter usage on the
        # dashboard usage page. Up to 20 tags, each 1-50 characters.
        tags: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        # Extract only the main content of the page, excluding headers, footers, sidebars,
        # and navigation
        use_main_content_only: nil,
        # Optional browser wait time in milliseconds after initial page load before
        # converting the page to Markdown. Min: 0. Max: 30000 (30 seconds).
        wait_for_ms: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            url: String,
            country: ContextDev::WebWebScrapeMdParams::Country::OrSymbol,
            exclude_selectors: T.nilable(T::Array[String]),
            headers: T::Hash[Symbol, String],
            include_frames:
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeMdParams::IncludeFrames::OrSymbol
              ),
            include_images:
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeMdParams::IncludeImages::OrSymbol
              ),
            include_links:
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeMdParams::IncludeLinks::OrSymbol
              ),
            include_selectors: T.nilable(T::Array[String]),
            max_age_ms: T.nilable(Integer),
            pdf: ContextDev::WebWebScrapeMdParams::Pdf,
            settle_animations:
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeMdParams::SettleAnimations::OrSymbol
              ),
            shorten_base64_images:
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeMdParams::ShortenBase64Images::OrSymbol
              ),
            tags: T::Array[String],
            timeout_ms: Integer,
            use_main_content_only:
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeMdParams::UseMainContentOnly::OrSymbol
              ),
            wait_for_ms: T.nilable(Integer),
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
            T.all(Symbol, ContextDev::WebWebScrapeMdParams::Country)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AD = T.let(:ad, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        AE = T.let(:ae, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        AF = T.let(:af, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        AG = T.let(:ag, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        AI = T.let(:ai, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        AL = T.let(:al, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        AM = T.let(:am, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        AO = T.let(:ao, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        AR = T.let(:ar, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        AT = T.let(:at, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        AU = T.let(:au, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        AW = T.let(:aw, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        AZ = T.let(:az, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BA = T.let(:ba, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BB = T.let(:bb, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BD = T.let(:bd, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BE = T.let(:be, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BF = T.let(:bf, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BG = T.let(:bg, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BH = T.let(:bh, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BI = T.let(:bi, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BJ = T.let(:bj, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BM = T.let(:bm, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BN = T.let(:bn, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BO = T.let(:bo, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BQ = T.let(:bq, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BR = T.let(:br, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BS = T.let(:bs, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BW = T.let(:bw, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BY = T.let(:by, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        BZ = T.let(:bz, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        CA = T.let(:ca, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        CD = T.let(:cd, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        CF = T.let(:cf, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        CG = T.let(:cg, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        CH = T.let(:ch, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        CI = T.let(:ci, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        CL = T.let(:cl, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        CM = T.let(:cm, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        CN = T.let(:cn, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        CO = T.let(:co, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        CR = T.let(:cr, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        CV = T.let(:cv, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        CW = T.let(:cw, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        CY = T.let(:cy, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        CZ = T.let(:cz, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        DE = T.let(:de, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        DJ = T.let(:dj, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        DK = T.let(:dk, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        DM = T.let(:dm, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        DO = T.let(:do, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        DZ = T.let(:dz, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        EC = T.let(:ec, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        EE = T.let(:ee, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        EG = T.let(:eg, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        ES = T.let(:es, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        ET = T.let(:et, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        FI = T.let(:fi, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        FJ = T.let(:fj, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        FR = T.let(:fr, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        GA = T.let(:ga, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        GB = T.let(:gb, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        GD = T.let(:gd, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        GE = T.let(:ge, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        GF = T.let(:gf, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        GG = T.let(:gg, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        GH = T.let(:gh, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        GM = T.let(:gm, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        GN = T.let(:gn, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        GP = T.let(:gp, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        GQ = T.let(:gq, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        GR = T.let(:gr, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        GT = T.let(:gt, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        GU = T.let(:gu, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        GW = T.let(:gw, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        GY = T.let(:gy, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        HK = T.let(:hk, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        HN = T.let(:hn, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        HR = T.let(:hr, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        HT = T.let(:ht, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        HU = T.let(:hu, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        ID = T.let(:id, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        IE = T.let(:ie, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        IL = T.let(:il, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        IM = T.let(:im, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        IN = T.let(:in, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        IQ = T.let(:iq, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        IR = T.let(:ir, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        IS = T.let(:is, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        IT = T.let(:it, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        JE = T.let(:je, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        JM = T.let(:jm, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        JO = T.let(:jo, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        JP = T.let(:jp, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        KE = T.let(:ke, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        KG = T.let(:kg, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        KH = T.let(:kh, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        KN = T.let(:kn, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        KR = T.let(:kr, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        KW = T.let(:kw, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        KY = T.let(:ky, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        KZ = T.let(:kz, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        LA = T.let(:la, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        LB = T.let(:lb, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        LC = T.let(:lc, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        LK = T.let(:lk, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        LR = T.let(:lr, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        LS = T.let(:ls, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        LT = T.let(:lt, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        LU = T.let(:lu, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        LV = T.let(:lv, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        LY = T.let(:ly, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MA = T.let(:ma, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MC = T.let(:mc, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MD = T.let(:md, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        ME = T.let(:me, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MF = T.let(:mf, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MG = T.let(:mg, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MK = T.let(:mk, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        ML = T.let(:ml, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MM = T.let(:mm, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MN = T.let(:mn, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MO = T.let(:mo, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MQ = T.let(:mq, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MR = T.let(:mr, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MT = T.let(:mt, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MU = T.let(:mu, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MV = T.let(:mv, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MW = T.let(:mw, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MX = T.let(:mx, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MY = T.let(:my, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        MZ = T.let(:mz, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        NA = T.let(:na, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        NC = T.let(:nc, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        NE = T.let(:ne, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        NG = T.let(:ng, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        NI = T.let(:ni, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        NL = T.let(:nl, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        NO = T.let(:no, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        NP = T.let(:np, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        NZ = T.let(:nz, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        OM = T.let(:om, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        PA = T.let(:pa, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        PE = T.let(:pe, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        PF = T.let(:pf, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        PG = T.let(:pg, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        PH = T.let(:ph, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        PK = T.let(:pk, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        PL = T.let(:pl, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        PR = T.let(:pr, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        PS = T.let(:ps, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        PT = T.let(:pt, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        PY = T.let(:py, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        QA = T.let(:qa, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        RE = T.let(:re, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        RO = T.let(:ro, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        RS = T.let(:rs, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        RU = T.let(:ru, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        RW = T.let(:rw, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        SA = T.let(:sa, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        SC = T.let(:sc, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        SD = T.let(:sd, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        SE = T.let(:se, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        SG = T.let(:sg, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        SI = T.let(:si, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        SK = T.let(:sk, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        SL = T.let(:sl, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        SM = T.let(:sm, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        SN = T.let(:sn, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        SO = T.let(:so, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        SR = T.let(:sr, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        SS = T.let(:ss, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        ST = T.let(:st, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        SV = T.let(:sv, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        SX = T.let(:sx, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        SY = T.let(:sy, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        SZ = T.let(:sz, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        TC = T.let(:tc, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        TD = T.let(:td, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        TG = T.let(:tg, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        TH = T.let(:th, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        TJ = T.let(:tj, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        TL = T.let(:tl, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        TM = T.let(:tm, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        TN = T.let(:tn, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        TR = T.let(:tr, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        TT = T.let(:tt, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        TW = T.let(:tw, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        TZ = T.let(:tz, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        UA = T.let(:ua, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        UG = T.let(:ug, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        US = T.let(:us, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        UY = T.let(:uy, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        UZ = T.let(:uz, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        VC = T.let(:vc, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        VE = T.let(:ve, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        VG = T.let(:vg, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        VI = T.let(:vi, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        VN = T.let(:vn, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        YE = T.let(:ye, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        YT = T.let(:yt, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        ZA = T.let(:za, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        ZM = T.let(:zm, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)
        ZW = T.let(:zw, ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::WebWebScrapeMdParams::Country::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # When true, the contents of iframes are rendered to Markdown.
      module IncludeFrames
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::IncludeFrames::TaggedSymbol
            )
          end

        sig do
          override.returns(
            T::Array[ContextDev::WebWebScrapeMdParams::IncludeFrames::Variants]
          )
        end
        def self.variants
        end

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebWebScrapeMdParams::IncludeFrames)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            ContextDev::WebWebScrapeMdParams::IncludeFrames::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            ContextDev::WebWebScrapeMdParams::IncludeFrames::TaggedSymbol
          )
      end

      # Include image references in Markdown output
      module IncludeImages
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::IncludeImages::TaggedSymbol
            )
          end

        sig do
          override.returns(
            T::Array[ContextDev::WebWebScrapeMdParams::IncludeImages::Variants]
          )
        end
        def self.variants
        end

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebWebScrapeMdParams::IncludeImages)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            ContextDev::WebWebScrapeMdParams::IncludeImages::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            ContextDev::WebWebScrapeMdParams::IncludeImages::TaggedSymbol
          )
      end

      # Preserve hyperlinks in Markdown output
      module IncludeLinks
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::IncludeLinks::TaggedSymbol
            )
          end

        sig do
          override.returns(
            T::Array[ContextDev::WebWebScrapeMdParams::IncludeLinks::Variants]
          )
        end
        def self.variants
        end

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebWebScrapeMdParams::IncludeLinks)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            ContextDev::WebWebScrapeMdParams::IncludeLinks::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            ContextDev::WebWebScrapeMdParams::IncludeLinks::TaggedSymbol
          )
      end

      class Pdf < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebWebScrapeMdParams::Pdf,
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
        sig do
          returns(
            T.nilable(
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeMdParams::Pdf::Ocr::OrSymbol
              )
            )
          )
        end
        attr_reader :ocr

        sig do
          params(
            ocr:
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeMdParams::Pdf::Ocr::OrSymbol
              )
          ).void
        end
        attr_writer :ocr

        # When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
        # a 400 WEBSITE_ACCESS_ERROR is returned.
        sig do
          returns(
            T.nilable(
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeMdParams::Pdf::ShouldParse::OrSymbol
              )
            )
          )
        end
        attr_reader :should_parse

        sig do
          params(
            should_parse:
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeMdParams::Pdf::ShouldParse::OrSymbol
              )
          ).void
        end
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
            ocr:
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeMdParams::Pdf::Ocr::OrSymbol
              ),
            should_parse:
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeMdParams::Pdf::ShouldParse::OrSymbol
              ),
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
          # When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
          # a 400 WEBSITE_ACCESS_ERROR is returned.
          should_parse: nil,
          # First 1-based PDF page to parse. When omitted, parsing starts at the first page.
          start: nil
        )
        end

        sig do
          override.returns(
            {
              end_: Integer,
              ocr:
                T.any(
                  T::Boolean,
                  ContextDev::WebWebScrapeMdParams::Pdf::Ocr::OrSymbol
                ),
              should_parse:
                T.any(
                  T::Boolean,
                  ContextDev::WebWebScrapeMdParams::Pdf::ShouldParse::OrSymbol
                ),
              start: Integer
            }
          )
        end
        def to_hash
        end

        # When true, detect and OCR images embedded in the selected PDF pages, inserting
        # recognized text at each image's position in page reading order while preserving
        # the PDF text layer. This is separate from automatic scanned-PDF OCR fallback.
        module Ocr
          extend ContextDev::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeMdParams::Pdf::Ocr::TaggedSymbol
              )
            end

          sig do
            override.returns(
              T::Array[ContextDev::WebWebScrapeMdParams::Pdf::Ocr::Variants]
            )
          end
          def self.variants
          end

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::WebWebScrapeMdParams::Pdf::Ocr)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TRUE =
            T.let(
              :true,
              ContextDev::WebWebScrapeMdParams::Pdf::Ocr::TaggedSymbol
            )
          FALSE =
            T.let(
              :false,
              ContextDev::WebWebScrapeMdParams::Pdf::Ocr::TaggedSymbol
            )
        end

        # When true, PDF URLs are fetched and parsed. When false, PDF URLs are skipped and
        # a 400 WEBSITE_ACCESS_ERROR is returned.
        module ShouldParse
          extend ContextDev::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                T::Boolean,
                ContextDev::WebWebScrapeMdParams::Pdf::ShouldParse::TaggedSymbol
              )
            end

          sig do
            override.returns(
              T::Array[
                ContextDev::WebWebScrapeMdParams::Pdf::ShouldParse::Variants
              ]
            )
          end
          def self.variants
          end

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::WebWebScrapeMdParams::Pdf::ShouldParse)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TRUE =
            T.let(
              :true,
              ContextDev::WebWebScrapeMdParams::Pdf::ShouldParse::TaggedSymbol
            )
          FALSE =
            T.let(
              :false,
              ContextDev::WebWebScrapeMdParams::Pdf::ShouldParse::TaggedSymbol
            )
        end
      end

      # When true, waits briefly for CSS and transition animations to settle before
      # converting to Markdown. Defaults to false. This adds a bit of latency in
      # exchange for more stable output on animated pages.
      module SettleAnimations
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::SettleAnimations::TaggedSymbol
            )
          end

        sig do
          override.returns(
            T::Array[
              ContextDev::WebWebScrapeMdParams::SettleAnimations::Variants
            ]
          )
        end
        def self.variants
        end

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebWebScrapeMdParams::SettleAnimations)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            ContextDev::WebWebScrapeMdParams::SettleAnimations::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            ContextDev::WebWebScrapeMdParams::SettleAnimations::TaggedSymbol
          )
      end

      # Shorten base64-encoded image data in the Markdown output
      module ShortenBase64Images
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::ShortenBase64Images::TaggedSymbol
            )
          end

        sig do
          override.returns(
            T::Array[
              ContextDev::WebWebScrapeMdParams::ShortenBase64Images::Variants
            ]
          )
        end
        def self.variants
        end

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebWebScrapeMdParams::ShortenBase64Images)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            ContextDev::WebWebScrapeMdParams::ShortenBase64Images::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            ContextDev::WebWebScrapeMdParams::ShortenBase64Images::TaggedSymbol
          )
      end

      # Extract only the main content of the page, excluding headers, footers, sidebars,
      # and navigation
      module UseMainContentOnly
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              T::Boolean,
              ContextDev::WebWebScrapeMdParams::UseMainContentOnly::TaggedSymbol
            )
          end

        sig do
          override.returns(
            T::Array[
              ContextDev::WebWebScrapeMdParams::UseMainContentOnly::Variants
            ]
          )
        end
        def self.variants
        end

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebWebScrapeMdParams::UseMainContentOnly)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            ContextDev::WebWebScrapeMdParams::UseMainContentOnly::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            ContextDev::WebWebScrapeMdParams::UseMainContentOnly::TaggedSymbol
          )
      end
    end
  end
end
