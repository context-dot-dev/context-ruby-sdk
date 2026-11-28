# frozen_string_literal: true

module ContextDev
  module Models
    class CrawlControls < ContextDev::Internal::Type::BaseModel
      # @!attribute exclude
      #   Matchers for the pages the crawl skipped. `null` when it skipped none.
      #
      #   @return [Array<ContextDev::Models::CrawlControls::Exclude::Regex, ContextDev::Models::CrawlControls::Exclude::Product>, nil]
      required :exclude,
               -> { ContextDev::Internal::Type::ArrayOf[union: ContextDev::CrawlControls::Exclude] },
               nil?: true

      # @!attribute exclude_url_pattern
      #   Regex that excluded matching URLs from the crawl. `null` when the crawl set
      #   none.
      #
      #   @return [String, nil]
      required :exclude_url_pattern, String, nil?: true

      # @!attribute follow
      #   Matchers for the links the crawl followed. `null` when it followed every link.
      #
      #   @return [Array<ContextDev::Models::CrawlControls::Follow::Regex, ContextDev::Models::CrawlControls::Follow::Pagination, ContextDev::Models::CrawlControls::Follow::Product>, nil]
      required :follow,
               -> { ContextDev::Internal::Type::ArrayOf[union: ContextDev::CrawlControls::Follow] },
               nil?: true

      # @!attribute follow_subdomains
      #   Whether links to subdomains were followed. Always `false` for a sitemap crawl.
      #
      #   @return [Boolean]
      required :follow_subdomains, ContextDev::Internal::Type::Boolean

      # @!attribute languages
      #   Languages whose pages were followed. `null` when all languages were.
      #
      #   @return [Symbol, Array<Symbol, ContextDev::Models::CrawlControls::Languages::UnionMember1>, ContextDev::Models::CrawlControls::Languages, nil]
      required :languages, union: -> { ContextDev::CrawlControls::Languages }, nil?: true

      # @!attribute max_depth
      #   Maximum link depth. Always `0` for a sitemap crawl; `null` when a `start_url`
      #   crawl set no limit.
      #
      #   @return [Integer, nil]
      required :max_depth, Integer, nil?: true

      # @!attribute max_pages
      #   The `maxUrls` submitted with the crawl. A sitemap crawl scrapes only the URLs
      #   its sitemap lists, up to this many, so `input.reserved` can be lower.
      #
      #   @return [Integer]
      required :max_pages, Integer

      # @!attribute scrape
      #   Matchers for the pages the crawl returned. `null` when it returned every fetched
      #   page.
      #
      #   @return [Array<ContextDev::Models::CrawlControls::Scrape::Regex, ContextDev::Models::CrawlControls::Scrape::Product>, nil]
      required :scrape,
               -> { ContextDev::Internal::Type::ArrayOf[union: ContextDev::CrawlControls::Scrape] },
               nil?: true

      # @!attribute source
      #   Where the crawl started.
      #
      #   @return [ContextDev::Models::CrawlControls::Source::StartURL, ContextDev::Models::CrawlControls::Source::Sitemap]
      required :source, union: -> { ContextDev::CrawlControls::Source }

      # @!attribute url_pattern
      #   Regex that URLs had to match to be crawled. `null` when the crawl set none.
      #
      #   @return [String, nil]
      required :url_pattern, String, nil?: true

      # @!method initialize(exclude:, exclude_url_pattern:, follow:, follow_subdomains:, languages:, max_depth:, max_pages:, scrape:, source:, url_pattern:)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::CrawlControls} for more details.
      #
      #   Crawl settings as submitted.
      #
      #   @param exclude [Array<ContextDev::Models::CrawlControls::Exclude::Regex, ContextDev::Models::CrawlControls::Exclude::Product>, nil] Matchers for the pages the crawl skipped. `null` when it skipped none.
      #
      #   @param exclude_url_pattern [String, nil] Regex that excluded matching URLs from the crawl. `null` when the crawl set none
      #
      #   @param follow [Array<ContextDev::Models::CrawlControls::Follow::Regex, ContextDev::Models::CrawlControls::Follow::Pagination, ContextDev::Models::CrawlControls::Follow::Product>, nil] Matchers for the links the crawl followed. `null` when it followed every link.
      #
      #   @param follow_subdomains [Boolean] Whether links to subdomains were followed. Always `false` for a sitemap crawl.
      #
      #   @param languages [Symbol, Array<Symbol, ContextDev::Models::CrawlControls::Languages::UnionMember1>, ContextDev::Models::CrawlControls::Languages, nil] Languages whose pages were followed. `null` when all languages were.
      #
      #   @param max_depth [Integer, nil] Maximum link depth. Always `0` for a sitemap crawl; `null` when a `start_url` cr
      #
      #   @param max_pages [Integer] The `maxUrls` submitted with the crawl. A sitemap crawl scrapes only the URLs it
      #
      #   @param scrape [Array<ContextDev::Models::CrawlControls::Scrape::Regex, ContextDev::Models::CrawlControls::Scrape::Product>, nil] Matchers for the pages the crawl returned. `null` when it returned every fetched
      #
      #   @param source [ContextDev::Models::CrawlControls::Source::StartURL, ContextDev::Models::CrawlControls::Source::Sitemap] Where the crawl started.
      #
      #   @param url_pattern [String, nil] Regex that URLs had to match to be crawled. `null` when the crawl set none.

      # Selects pages by URL pattern or by kind of page.
      module Exclude
        extend ContextDev::Internal::Type::Union

        discriminator :kind

        # Pages whose URL matches a regex pattern.
        variant :regex, -> { ContextDev::CrawlControls::Exclude::Regex }

        # Product detail pages.
        variant :product, -> { ContextDev::CrawlControls::Exclude::Product }

        class Regex < ContextDev::Internal::Type::BaseModel
          # @!attribute kind
          #   Match pages by URL pattern.
          #
          #   @return [Symbol, :regex]
          required :kind, const: :regex

          # @!attribute pattern
          #   Regular expression matched against the page URL.
          #
          #   @return [String]
          required :pattern, String

          # @!method initialize(pattern:, kind: :regex)
          #   Pages whose URL matches a regex pattern.
          #
          #   @param pattern [String] Regular expression matched against the page URL.
          #
          #   @param kind [Symbol, :regex] Match pages by URL pattern.
        end

        class Product < ContextDev::Internal::Type::BaseModel
          # @!attribute kind
          #   Match product detail pages.
          #
          #   @return [Symbol, :product]
          required :kind, const: :product

          # @!method initialize(kind: :product)
          #   Product detail pages.
          #
          #   @param kind [Symbol, :product] Match product detail pages.
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::CrawlControls::Exclude::Regex, ContextDev::Models::CrawlControls::Exclude::Product)]
      end

      # Selects links by URL pattern, by kind of page, or as the next page of a list.
      module Follow
        extend ContextDev::Internal::Type::Union

        discriminator :kind

        # Pages whose URL matches a regex pattern.
        variant :regex, -> { ContextDev::CrawlControls::Follow::Regex }

        # Further pages of a paginated list, such as page 2 of a catalog.
        variant :pagination, -> { ContextDev::CrawlControls::Follow::Pagination }

        # Product detail pages.
        variant :product, -> { ContextDev::CrawlControls::Follow::Product }

        class Regex < ContextDev::Internal::Type::BaseModel
          # @!attribute kind
          #   Match pages by URL pattern.
          #
          #   @return [Symbol, :regex]
          required :kind, const: :regex

          # @!attribute pattern
          #   Regular expression matched against the page URL.
          #
          #   @return [String]
          required :pattern, String

          # @!method initialize(pattern:, kind: :regex)
          #   Pages whose URL matches a regex pattern.
          #
          #   @param pattern [String] Regular expression matched against the page URL.
          #
          #   @param kind [Symbol, :regex] Match pages by URL pattern.
        end

        class Pagination < ContextDev::Internal::Type::BaseModel
          # @!attribute kind
          #   Match the further pages of a paginated list.
          #
          #   @return [Symbol, :pagination]
          required :kind, const: :pagination

          # @!method initialize(kind: :pagination)
          #   Further pages of a paginated list, such as page 2 of a catalog.
          #
          #   @param kind [Symbol, :pagination] Match the further pages of a paginated list.
        end

        class Product < ContextDev::Internal::Type::BaseModel
          # @!attribute kind
          #   Match product detail pages.
          #
          #   @return [Symbol, :product]
          required :kind, const: :product

          # @!method initialize(kind: :product)
          #   Product detail pages.
          #
          #   @param kind [Symbol, :product] Match product detail pages.
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::CrawlControls::Follow::Regex, ContextDev::Models::CrawlControls::Follow::Pagination, ContextDev::Models::CrawlControls::Follow::Product)]
      end

      # Languages whose pages were followed. `null` when all languages were.
      #
      # @see ContextDev::Models::CrawlControls#languages
      module Languages
        extend ContextDev::Internal::Type::Union

        variant const: -> { ContextDev::Models::CrawlControls::Languages::SAME_AS_START_URL }

        variant -> { ContextDev::Models::CrawlControls::Languages::UnionMember1Array }

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
        #   @return [Array(Symbol, Array<Symbol, ContextDev::Models::CrawlControls::Languages::UnionMember1>)]

        define_sorbet_constant!(:Variants) do
          T.type_alias do
            T.any(
              ContextDev::CrawlControls::Languages::TaggedSymbol,
              T::Array[ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol]
            )
          end
        end

        # @!group

        SAME_AS_START_URL = :same_as_start_url

        # @!endgroup

        # @type [ContextDev::Internal::Type::Converter]
        UnionMember1Array =
          ContextDev::Internal::Type::ArrayOf[enum: -> { ContextDev::CrawlControls::Languages::UnionMember1 }]
      end

      # Selects pages by URL pattern or by kind of page.
      module Scrape
        extend ContextDev::Internal::Type::Union

        discriminator :kind

        # Pages whose URL matches a regex pattern.
        variant :regex, -> { ContextDev::CrawlControls::Scrape::Regex }

        # Product detail pages.
        variant :product, -> { ContextDev::CrawlControls::Scrape::Product }

        class Regex < ContextDev::Internal::Type::BaseModel
          # @!attribute kind
          #   Match pages by URL pattern.
          #
          #   @return [Symbol, :regex]
          required :kind, const: :regex

          # @!attribute pattern
          #   Regular expression matched against the page URL.
          #
          #   @return [String]
          required :pattern, String

          # @!method initialize(pattern:, kind: :regex)
          #   Pages whose URL matches a regex pattern.
          #
          #   @param pattern [String] Regular expression matched against the page URL.
          #
          #   @param kind [Symbol, :regex] Match pages by URL pattern.
        end

        class Product < ContextDev::Internal::Type::BaseModel
          # @!attribute kind
          #   Match product detail pages.
          #
          #   @return [Symbol, :product]
          required :kind, const: :product

          # @!method initialize(kind: :product)
          #   Product detail pages.
          #
          #   @param kind [Symbol, :product] Match product detail pages.
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::CrawlControls::Scrape::Regex, ContextDev::Models::CrawlControls::Scrape::Product)]
      end

      # Where the crawl started.
      #
      # @see ContextDev::Models::CrawlControls#source
      module Source
        extend ContextDev::Internal::Type::Union

        # The crawl discovered pages by following links from one URL.
        variant -> { ContextDev::CrawlControls::Source::StartURL }

        # The crawl scraped the pages listed in the domain's sitemap.
        variant -> { ContextDev::CrawlControls::Source::Sitemap }

        class StartURL < ContextDev::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, ContextDev::Models::CrawlControls::Source::StartURL::Type]
          required :type, enum: -> { ContextDev::CrawlControls::Source::StartURL::Type }

          # @!attribute url
          #   Page the crawl started from.
          #
          #   @return [String]
          required :url, String

          # @!method initialize(type:, url:)
          #   The crawl discovered pages by following links from one URL.
          #
          #   @param type [Symbol, ContextDev::Models::CrawlControls::Source::StartURL::Type]
          #
          #   @param url [String] Page the crawl started from.

          # @see ContextDev::Models::CrawlControls::Source::StartURL#type
          module Type
            extend ContextDev::Internal::Type::Enum

            START_URL = :start_url

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class Sitemap < ContextDev::Internal::Type::BaseModel
          # @!attribute domain
          #   Domain whose sitemap supplied the pages.
          #
          #   @return [String]
          required :domain, String

          # @!attribute type
          #
          #   @return [Symbol, ContextDev::Models::CrawlControls::Source::Sitemap::Type]
          required :type, enum: -> { ContextDev::CrawlControls::Source::Sitemap::Type }

          # @!method initialize(domain:, type:)
          #   The crawl scraped the pages listed in the domain's sitemap.
          #
          #   @param domain [String] Domain whose sitemap supplied the pages.
          #
          #   @param type [Symbol, ContextDev::Models::CrawlControls::Source::Sitemap::Type]

          # @see ContextDev::Models::CrawlControls::Source::Sitemap#type
          module Type
            extend ContextDev::Internal::Type::Enum

            SITEMAP = :sitemap

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::CrawlControls::Source::StartURL, ContextDev::Models::CrawlControls::Source::Sitemap)]
      end
    end
  end
end
