# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::News#search
    class NewsSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute search_by
      #   What to search for: news about a specific company, or a natural-language query
      #   across all news.
      #
      #   @return [ContextDev::Models::NewsSearchParams::SearchBy::NaturalLanguage, ContextDev::Models::NewsSearchParams::SearchBy::Entity]
      required :search_by, union: -> { ContextDev::NewsSearchParams::SearchBy }, api_name: :searchBy

      # @!attribute cursor
      #   Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!attribute filter_by
      #   Filters for the results. Use at most one of `sourceDomain`, `sourceCountry`,
      #   `articleLanguage`, or `articleType`, optionally combined with `date`.
      #
      #   @return [ContextDev::Models::NewsSearchParams::FilterBy, nil]
      optional :filter_by, -> { ContextDev::NewsSearchParams::FilterBy }, api_name: :filterBy

      # @!attribute limit
      #   Maximum number of articles to return per page.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute policies
      #   Access policy IDs to apply; each URL must pass all of them. Requires access
      #   policies enabled for your organization; otherwise returns
      #   `ACCESS_POLICIES_NOT_ENABLED`.
      #
      #   @return [Array<String>, nil]
      optional :policies, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute sort_by
      #   How to order results. Company searches default to `newest`; natural-language
      #   searches always use `relevance`.
      #
      #   @return [ContextDev::Models::NewsSearchParams::SortBy, nil]
      optional :sort_by, -> { ContextDev::NewsSearchParams::SortBy }, api_name: :sortBy

      # @!attribute tags
      #   Labels for this request. Filter usage and request logs by them in the dashboard
      #   or with `GET /org/logs`.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!method initialize(search_by:, cursor: nil, filter_by: nil, limit: nil, policies: nil, sort_by: nil, tags: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::NewsSearchParams} for more details.
      #
      #   @param search_by [ContextDev::Models::NewsSearchParams::SearchBy::NaturalLanguage, ContextDev::Models::NewsSearchParams::SearchBy::Entity] What to search for: news about a specific company, or a natural-language query a
      #
      #   @param cursor [String, nil] Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      #   @param filter_by [ContextDev::Models::NewsSearchParams::FilterBy] Filters for the results. Use at most one of `sourceDomain`, `sourceCountry`, `ar
      #
      #   @param limit [Integer] Maximum number of articles to return per page.
      #
      #   @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
      #
      #   @param sort_by [ContextDev::Models::NewsSearchParams::SortBy] How to order results. Company searches default to `newest`; natural-language sea
      #
      #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # What to search for: news about a specific company, or a natural-language query
      # across all news.
      module SearchBy
        extend ContextDev::Internal::Type::Union

        discriminator :type

        # Search all news with a plain-language query. Returns up to 100 matches, ordered by relevance.
        variant :natural_language, -> { ContextDev::NewsSearchParams::SearchBy::NaturalLanguage }

        # Find news about a specific company.
        variant :entity, -> { ContextDev::NewsSearchParams::SearchBy::Entity }

        class NaturalLanguage < ContextDev::Internal::Type::BaseModel
          # @!attribute query
          #   What to search for, in plain language, such as
          #   `chip export restrictions to China`.
          #
          #   @return [String]
          required :query, String

          # @!attribute type
          #   Set to `natural_language` to search all news with a plain-language query.
          #
          #   @return [Symbol, :natural_language]
          required :type, const: :natural_language

          # @!method initialize(query:, type: :natural_language)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::NewsSearchParams::SearchBy::NaturalLanguage} for more
          #   details.
          #
          #   Search all news with a plain-language query. Returns up to 100 matches, ordered
          #   by relevance.
          #
          #   @param query [String] What to search for, in plain language, such as `chip export restrictions to Chin
          #
          #   @param type [Symbol, :natural_language] Set to `natural_language` to search all news with a plain-language query.
        end

        class Entity < ContextDev::Internal::Type::BaseModel
          # @!attribute entity
          #   The company to search news for, identified by name, domain, ticker, or ISIN.
          #
          #   @return [ContextDev::Models::NewsSearchParams::SearchBy::Entity::Entity::Name, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Entity::Domain, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Entity::Ticker, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Entity::Isin]
          required :entity, union: -> { ContextDev::NewsSearchParams::SearchBy::Entity::Entity }

          # @!attribute type
          #   Set to `entity` to find news about a specific company.
          #
          #   @return [Symbol, :entity]
          required :type, const: :entity

          # @!method initialize(entity:, type: :entity)
          #   Find news about a specific company.
          #
          #   @param entity [ContextDev::Models::NewsSearchParams::SearchBy::Entity::Entity::Name, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Entity::Domain, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Entity::Ticker, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Entity::Isin] The company to search news for, identified by name, domain, ticker, or ISIN.
          #
          #   @param type [Symbol, :entity] Set to `entity` to find news about a specific company.

          # The company to search news for, identified by name, domain, ticker, or ISIN.
          #
          # @see ContextDev::Models::NewsSearchParams::SearchBy::Entity#entity
          module Entity
            extend ContextDev::Internal::Type::Union

            discriminator :type

            # Identify the company by name.
            variant :name, -> { ContextDev::NewsSearchParams::SearchBy::Entity::Entity::Name }

            # Identify the company by website domain.
            variant :domain, -> { ContextDev::NewsSearchParams::SearchBy::Entity::Entity::Domain }

            # Identify the company by stock ticker, optionally on a specific exchange.
            variant :ticker, -> { ContextDev::NewsSearchParams::SearchBy::Entity::Entity::Ticker }

            # Identify the company by International Securities Identification Number (ISIN).
            variant :isin, -> { ContextDev::NewsSearchParams::SearchBy::Entity::Entity::Isin }

            class Name < ContextDev::Internal::Type::BaseModel
              # @!attribute name
              #   Company name, such as `Stripe`.
              #
              #   @return [String]
              required :name, String

              # @!attribute type
              #   Set to `name` to identify the company by name.
              #
              #   @return [Symbol, :name]
              required :type, const: :name

              # @!method initialize(name:, type: :name)
              #   Identify the company by name.
              #
              #   @param name [String] Company name, such as `Stripe`.
              #
              #   @param type [Symbol, :name] Set to `name` to identify the company by name.
            end

            class Domain < ContextDev::Internal::Type::BaseModel
              # @!attribute domain
              #   Company website domain, such as `apple.com`.
              #
              #   @return [String]
              required :domain, String

              # @!attribute type
              #   Set to `domain` to identify the company by website domain.
              #
              #   @return [Symbol, :domain]
              required :type, const: :domain

              # @!method initialize(domain:, type: :domain)
              #   Identify the company by website domain.
              #
              #   @param domain [String] Company website domain, such as `apple.com`.
              #
              #   @param type [Symbol, :domain] Set to `domain` to identify the company by website domain.
            end

            class Ticker < ContextDev::Internal::Type::BaseModel
              # @!attribute ticker
              #   Stock ticker symbol, such as `AAPL`.
              #
              #   @return [String]
              required :ticker, String

              # @!attribute type
              #   Set to `ticker` to identify a publicly traded company.
              #
              #   @return [Symbol, :ticker]
              required :type, const: :ticker

              # @!attribute exchange
              #   Exchange the ticker trades on. Use it when the same ticker is listed on more
              #   than one exchange.
              #
              #   @return [Symbol, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Entity::Ticker::Exchange, nil]
              optional :exchange, enum: -> { ContextDev::NewsSearchParams::SearchBy::Entity::Entity::Ticker::Exchange }

              # @!method initialize(ticker:, exchange: nil, type: :ticker)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::NewsSearchParams::SearchBy::Entity::Entity::Ticker} for
              #   more details.
              #
              #   Identify the company by stock ticker, optionally on a specific exchange.
              #
              #   @param ticker [String] Stock ticker symbol, such as `AAPL`.
              #
              #   @param exchange [Symbol, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Entity::Ticker::Exchange] Exchange the ticker trades on. Use it when the same ticker is listed on more tha
              #
              #   @param type [Symbol, :ticker] Set to `ticker` to identify a publicly traded company.

              # Exchange the ticker trades on. Use it when the same ticker is listed on more
              # than one exchange.
              #
              # @see ContextDev::Models::NewsSearchParams::SearchBy::Entity::Entity::Ticker#exchange
              module Exchange
                extend ContextDev::Internal::Type::Enum

                AMEX = :AMEX
                AMS = :AMS
                AQS = :AQS
                ASX = :ASX
                ATH = :ATH
                BER = :BER
                BME = :BME
                BRU = :BRU
                BSE = :BSE
                BUD = :BUD
                BUE = :BUE
                BVC = :BVC
                CBOE = :CBOE
                CNQ = :CNQ
                CPH = :CPH
                DFM = :DFM
                DOH = :DOH
                DUB = :DUB
                DUS = :DUS
                DXE = :DXE
                EGX = :EGX
                FSX = :FSX
                HAM = :HAM
                HEL = :HEL
                HKSE = :HKSE
                HOSE = :HOSE
                ICE = :ICE
                IOB = :IOB
                IST = :IST
                JKT = :JKT
                JNB = :JNB
                JPX = :JPX
                KLS = :KLS
                KOE = :KOE
                KSC = :KSC
                KUW = :KUW
                LIS = :LIS
                LSE = :LSE
                MCX = :MCX
                MEX = :MEX
                MIL = :MIL
                MUN = :MUN
                NASDAQ = :NASDAQ
                NEO = :NEO
                NSE = :NSE
                NYSE = :NYSE
                NZE = :NZE
                OSL = :OSL
                OTC = :OTC
                PAR = :PAR
                PNK = :PNK
                PRA = :PRA
                RIS = :RIS
                SAO = :SAO
                SAU = :SAU
                SES = :SES
                SET = :SET
                SGO = :SGO
                SHH = :SHH
                SHZ = :SHZ
                SIX = :SIX
                STO = :STO
                STU = :STU
                TAI = :TAI
                TAL = :TAL
                TLV = :TLV
                TSX = :TSX
                TSXV = :TSXV
                TWO = :TWO
                VIE = :VIE
                WSE = :WSE
                XETRA = :XETRA

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            class Isin < ContextDev::Internal::Type::BaseModel
              # @!attribute isin
              #   International Securities Identification Number, such as `US0378331005`.
              #
              #   @return [String]
              required :isin, String

              # @!attribute type
              #   Set to `isin` to identify the company by its International Securities
              #   Identification Number.
              #
              #   @return [Symbol, :isin]
              required :type, const: :isin

              # @!method initialize(isin:, type: :isin)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::NewsSearchParams::SearchBy::Entity::Entity::Isin} for more
              #   details.
              #
              #   Identify the company by International Securities Identification Number (ISIN).
              #
              #   @param isin [String] International Securities Identification Number, such as `US0378331005`.
              #
              #   @param type [Symbol, :isin] Set to `isin` to identify the company by its International Securities Identifica
            end

            # @!method self.variants
            #   @return [Array(ContextDev::Models::NewsSearchParams::SearchBy::Entity::Entity::Name, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Entity::Domain, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Entity::Ticker, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Entity::Isin)]
          end
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::NewsSearchParams::SearchBy::NaturalLanguage, ContextDev::Models::NewsSearchParams::SearchBy::Entity)]
      end

      class FilterBy < ContextDev::Internal::Type::BaseModel
        # @!attribute article_language
        #   Only return articles in these languages, as ISO 639 codes such as `en`.
        #
        #   @return [Array<Symbol, ContextDev::Models::NewsSearchParams::FilterBy::ArticleLanguage>, nil]
        optional :article_language,
                 -> {
                   ContextDev::Internal::Type::ArrayOf[enum: ContextDev::NewsSearchParams::FilterBy::ArticleLanguage]
                 },
                 api_name: :articleLanguage

        # @!attribute article_type
        #   Only return these types of coverage, such as `press_release`.
        #
        #   @return [Array<Symbol, ContextDev::Models::NewsSearchParams::FilterBy::ArticleType>, nil]
        optional :article_type,
                 -> {
                   ContextDev::Internal::Type::ArrayOf[enum: ContextDev::NewsSearchParams::FilterBy::ArticleType]
                 },
                 api_name: :articleType

        # @!attribute date
        #   Publish date range, in epoch milliseconds. `from` must not be later than `to`.
        #
        #   @return [ContextDev::Models::NewsSearchParams::FilterBy::Date, nil]
        optional :date, -> { ContextDev::NewsSearchParams::FilterBy::Date }

        # @!attribute source_country
        #   Only return articles from publishers in these countries, as ISO 3166-1 alpha-2
        #   codes such as `us`.
        #
        #   @return [Array<Symbol, ContextDev::Models::NewsSearchParams::FilterBy::SourceCountry>, nil]
        optional :source_country,
                 -> {
                   ContextDev::Internal::Type::ArrayOf[enum: ContextDev::NewsSearchParams::FilterBy::SourceCountry]
                 },
                 api_name: :sourceCountry

        # @!attribute source_domain
        #   Only return articles from these publisher domains, such as `reuters.com`.
        #
        #   @return [Array<String>, nil]
        optional :source_domain, ContextDev::Internal::Type::ArrayOf[String], api_name: :sourceDomain

        # @!method initialize(article_language: nil, article_type: nil, date: nil, source_country: nil, source_domain: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::NewsSearchParams::FilterBy} for more details.
        #
        #   Filters for the results. Use at most one of `sourceDomain`, `sourceCountry`,
        #   `articleLanguage`, or `articleType`, optionally combined with `date`.
        #
        #   @param article_language [Array<Symbol, ContextDev::Models::NewsSearchParams::FilterBy::ArticleLanguage>] Only return articles in these languages, as ISO 639 codes such as `en`.
        #
        #   @param article_type [Array<Symbol, ContextDev::Models::NewsSearchParams::FilterBy::ArticleType>] Only return these types of coverage, such as `press_release`.
        #
        #   @param date [ContextDev::Models::NewsSearchParams::FilterBy::Date] Publish date range, in epoch milliseconds. `from` must not be later than `to`.
        #
        #   @param source_country [Array<Symbol, ContextDev::Models::NewsSearchParams::FilterBy::SourceCountry>] Only return articles from publishers in these countries, as ISO 3166-1 alpha-2 c
        #
        #   @param source_domain [Array<String>] Only return articles from these publisher domains, such as `reuters.com`.

        module ArticleLanguage
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

        module ArticleType
          extend ContextDev::Internal::Type::Enum

          EDITORIAL = :editorial
          PRESS_RELEASE = :press_release
          REGULATORY_FILING = :regulatory_filing
          ADVISORY = :advisory

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::NewsSearchParams::FilterBy#date
        class Date < ContextDev::Internal::Type::BaseModel
          # @!attribute from
          #   Inclusive start of the publish date range, in epoch milliseconds.
          #
          #   @return [Integer, nil]
          optional :from, Integer

          # @!attribute to
          #   Inclusive end of the publish date range, in epoch milliseconds.
          #
          #   @return [Integer, nil]
          optional :to, Integer

          # @!method initialize(from: nil, to: nil)
          #   Publish date range, in epoch milliseconds. `from` must not be later than `to`.
          #
          #   @param from [Integer] Inclusive start of the publish date range, in epoch milliseconds.
          #
          #   @param to [Integer] Inclusive end of the publish date range, in epoch milliseconds.
        end

        module SourceCountry
          extend ContextDev::Internal::Type::Enum

          AE = :ae
          AR = :ar
          AU = :au
          CA = :ca
          CG = :cg
          CH = :ch
          CL = :cl
          CZ = :cz
          DE = :de
          FI = :fi
          FR = :fr
          GB = :gb
          HK = :hk
          IL = :il
          IN = :in
          JP = :jp
          KR = :kr
          MX = :mx
          NG = :ng
          NL = :nl
          PK = :pk
          QA = :qa
          SA = :sa
          SE = :se
          SG = :sg
          US = :us
          ZA = :za

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class SortBy < ContextDev::Internal::Type::BaseModel
        # @!attribute type
        #   `newest` puts the most recently published articles first; `relevance` puts the
        #   closest matches first.
        #
        #   @return [Symbol, ContextDev::Models::NewsSearchParams::SortBy::Type]
        required :type, enum: -> { ContextDev::NewsSearchParams::SortBy::Type }

        # @!method initialize(type:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::NewsSearchParams::SortBy} for more details.
        #
        #   How to order results. Company searches default to `newest`; natural-language
        #   searches always use `relevance`.
        #
        #   @param type [Symbol, ContextDev::Models::NewsSearchParams::SortBy::Type] `newest` puts the most recently published articles first; `relevance` puts the c

        # `newest` puts the most recently published articles first; `relevance` puts the
        # closest matches first.
        #
        # @see ContextDev::Models::NewsSearchParams::SortBy#type
        module Type
          extend ContextDev::Internal::Type::Enum

          RELEVANCE = :relevance
          NEWEST = :newest

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
