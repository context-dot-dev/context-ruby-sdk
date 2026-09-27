# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::News#search
    class NewsSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute search_by
      #   What to search for.
      #
      #   @return [ContextDev::Models::NewsSearchParams::SearchBy]
      required :search_by, -> { ContextDev::NewsSearchParams::SearchBy }, api_name: :searchBy

      # @!attribute cursor
      #   Opaque next_cursor from the previous response, or null for the first page.
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!attribute filter_by
      #   Optional result filters. Use at most one of sourceDomain, sourceCountry,
      #   articleLanguage, or articleType. A date range may accompany that category;
      #   date.from must not exceed date.to.
      #
      #   @return [ContextDev::Models::NewsSearchParams::FilterBy, nil]
      optional :filter_by, -> { ContextDev::NewsSearchParams::FilterBy }, api_name: :filterBy

      # @!attribute limit
      #   Maximum results to return. Defaults to 10.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute sort_by
      #   Result ordering. Defaults to newest.
      #
      #   @return [ContextDev::Models::NewsSearchParams::SortBy, nil]
      optional :sort_by, -> { ContextDev::NewsSearchParams::SortBy }, api_name: :sortBy

      # @!attribute tags
      #   Labels for filtering usage in the dashboard.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!method initialize(search_by:, cursor: nil, filter_by: nil, limit: nil, sort_by: nil, tags: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::NewsSearchParams} for more details.
      #
      #   @param search_by [ContextDev::Models::NewsSearchParams::SearchBy] What to search for.
      #
      #   @param cursor [String, nil] Opaque next_cursor from the previous response, or null for the first page.
      #
      #   @param filter_by [ContextDev::Models::NewsSearchParams::FilterBy] Optional result filters. Use at most one of sourceDomain, sourceCountry, article
      #
      #   @param limit [Integer] Maximum results to return. Defaults to 10.
      #
      #   @param sort_by [ContextDev::Models::NewsSearchParams::SortBy] Result ordering. Defaults to newest.
      #
      #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      class SearchBy < ContextDev::Internal::Type::BaseModel
        # @!attribute entity
        #   The company to search news for, identified by name, domain, ticker, or ISIN.
        #
        #   @return [ContextDev::Models::NewsSearchParams::SearchBy::Entity::Name, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Domain, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Ticker, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Isin]
        required :entity, union: -> { ContextDev::NewsSearchParams::SearchBy::Entity }

        # @!attribute type
        #   How to search. Only entity search is supported.
        #
        #   @return [Symbol, ContextDev::Models::NewsSearchParams::SearchBy::Type]
        required :type, enum: -> { ContextDev::NewsSearchParams::SearchBy::Type }

        # @!method initialize(entity:, type:)
        #   What to search for.
        #
        #   @param entity [ContextDev::Models::NewsSearchParams::SearchBy::Entity::Name, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Domain, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Ticker, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Isin] The company to search news for, identified by name, domain, ticker, or ISIN.
        #
        #   @param type [Symbol, ContextDev::Models::NewsSearchParams::SearchBy::Type] How to search. Only entity search is supported.

        # The company to search news for, identified by name, domain, ticker, or ISIN.
        #
        # @see ContextDev::Models::NewsSearchParams::SearchBy#entity
        module Entity
          extend ContextDev::Internal::Type::Union

          discriminator :type

          # Identify the company by name.
          variant :name, -> { ContextDev::NewsSearchParams::SearchBy::Entity::Name }

          # Identify the company by website domain.
          variant :domain, -> { ContextDev::NewsSearchParams::SearchBy::Entity::Domain }

          # Identify the company by stock ticker, optionally scoped to an exchange.
          variant :ticker, -> { ContextDev::NewsSearchParams::SearchBy::Entity::Ticker }

          # Identify the company by International Securities Identification Number.
          variant :isin, -> { ContextDev::NewsSearchParams::SearchBy::Entity::Isin }

          class Name < ContextDev::Internal::Type::BaseModel
            # @!attribute name
            #   Company name.
            #
            #   @return [String]
            required :name, String

            # @!attribute type
            #   Use `name` to identify the company by name.
            #
            #   @return [Symbol, :name]
            required :type, const: :name

            # @!method initialize(name:, type: :name)
            #   Identify the company by name.
            #
            #   @param name [String] Company name.
            #
            #   @param type [Symbol, :name] Use `name` to identify the company by name.
          end

          class Domain < ContextDev::Internal::Type::BaseModel
            # @!attribute domain
            #   Company website domain, such as apple.com.
            #
            #   @return [String]
            required :domain, String

            # @!attribute type
            #   Use `domain` to identify the company by website domain.
            #
            #   @return [Symbol, :domain]
            required :type, const: :domain

            # @!method initialize(domain:, type: :domain)
            #   Identify the company by website domain.
            #
            #   @param domain [String] Company website domain, such as apple.com.
            #
            #   @param type [Symbol, :domain] Use `domain` to identify the company by website domain.
          end

          class Ticker < ContextDev::Internal::Type::BaseModel
            # @!attribute ticker
            #   Public-company ticker.
            #
            #   @return [String]
            required :ticker, String

            # @!attribute type
            #   Use `ticker` to identify a publicly traded company.
            #
            #   @return [Symbol, :ticker]
            required :type, const: :ticker

            # @!attribute exchange
            #   Stock exchange the ticker trades on, used to disambiguate tickers listed on
            #   multiple exchanges.
            #
            #   @return [Symbol, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Ticker::Exchange, nil]
            optional :exchange, enum: -> { ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange }

            # @!method initialize(ticker:, exchange: nil, type: :ticker)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::NewsSearchParams::SearchBy::Entity::Ticker} for more
            #   details.
            #
            #   Identify the company by stock ticker, optionally scoped to an exchange.
            #
            #   @param ticker [String] Public-company ticker.
            #
            #   @param exchange [Symbol, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Ticker::Exchange] Stock exchange the ticker trades on, used to disambiguate tickers listed on mult
            #
            #   @param type [Symbol, :ticker] Use `ticker` to identify a publicly traded company.

            # Stock exchange the ticker trades on, used to disambiguate tickers listed on
            # multiple exchanges.
            #
            # @see ContextDev::Models::NewsSearchParams::SearchBy::Entity::Ticker#exchange
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
            #   International Securities Identification Number.
            #
            #   @return [String]
            required :isin, String

            # @!attribute type
            #   Use `isin` to identify the company by its securities identifier.
            #
            #   @return [Symbol, :isin]
            required :type, const: :isin

            # @!method initialize(isin:, type: :isin)
            #   Identify the company by International Securities Identification Number.
            #
            #   @param isin [String] International Securities Identification Number.
            #
            #   @param type [Symbol, :isin] Use `isin` to identify the company by its securities identifier.
          end

          # @!method self.variants
          #   @return [Array(ContextDev::Models::NewsSearchParams::SearchBy::Entity::Name, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Domain, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Ticker, ContextDev::Models::NewsSearchParams::SearchBy::Entity::Isin)]
        end

        # How to search. Only entity search is supported.
        #
        # @see ContextDev::Models::NewsSearchParams::SearchBy#type
        module Type
          extend ContextDev::Internal::Type::Enum

          ENTITY = :entity

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class FilterBy < ContextDev::Internal::Type::BaseModel
        # @!attribute article_language
        #   Article languages to include. Up to 3.
        #
        #   @return [Array<Symbol, ContextDev::Models::NewsSearchParams::FilterBy::ArticleLanguage>, nil]
        optional :article_language,
                 -> {
                   ContextDev::Internal::Type::ArrayOf[enum: ContextDev::NewsSearchParams::FilterBy::ArticleLanguage]
                 },
                 api_name: :articleLanguage

        # @!attribute article_type
        #   Article types to include. Up to 3.
        #
        #   @return [Array<Symbol, ContextDev::Models::NewsSearchParams::FilterBy::ArticleType>, nil]
        optional :article_type,
                 -> {
                   ContextDev::Internal::Type::ArrayOf[enum: ContextDev::NewsSearchParams::FilterBy::ArticleType]
                 },
                 api_name: :articleType

        # @!attribute date
        #   Published-at window in epoch milliseconds. from must be before or equal to to.
        #
        #   @return [ContextDev::Models::NewsSearchParams::FilterBy::Date, nil]
        optional :date, -> { ContextDev::NewsSearchParams::FilterBy::Date }

        # @!attribute source_country
        #   Publisher countries to include, as lowercase ISO 3166-1 alpha-2 codes. Up to 3.
        #
        #   @return [Array<Symbol, ContextDev::Models::NewsSearchParams::FilterBy::SourceCountry>, nil]
        optional :source_country,
                 -> {
                   ContextDev::Internal::Type::ArrayOf[enum: ContextDev::NewsSearchParams::FilterBy::SourceCountry]
                 },
                 api_name: :sourceCountry

        # @!attribute source_domain
        #   Publisher domains to include. Up to 3.
        #
        #   @return [Array<String>, nil]
        optional :source_domain, ContextDev::Internal::Type::ArrayOf[String], api_name: :sourceDomain

        # @!method initialize(article_language: nil, article_type: nil, date: nil, source_country: nil, source_domain: nil)
        #   Optional result filters. Use at most one of sourceDomain, sourceCountry,
        #   articleLanguage, or articleType. A date range may accompany that category;
        #   date.from must not exceed date.to.
        #
        #   @param article_language [Array<Symbol, ContextDev::Models::NewsSearchParams::FilterBy::ArticleLanguage>] Article languages to include. Up to 3.
        #
        #   @param article_type [Array<Symbol, ContextDev::Models::NewsSearchParams::FilterBy::ArticleType>] Article types to include. Up to 3.
        #
        #   @param date [ContextDev::Models::NewsSearchParams::FilterBy::Date] Published-at window in epoch milliseconds. from must be before or equal to to.
        #
        #   @param source_country [Array<Symbol, ContextDev::Models::NewsSearchParams::FilterBy::SourceCountry>] Publisher countries to include, as lowercase ISO 3166-1 alpha-2 codes. Up to 3.
        #
        #   @param source_domain [Array<String>] Publisher domains to include. Up to 3.

        module ArticleLanguage
          extend ContextDev::Internal::Type::Enum

          AR = :ar
          DE = :de
          EN = :en
          ES = :es
          FR = :fr
          HI = :hi
          IT = :it
          JA = :ja
          KO = :ko
          NL = :nl
          PT = :pt
          RU = :ru
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
          #   Inclusive start of the published-at window, in epoch milliseconds.
          #
          #   @return [Integer, nil]
          optional :from, Integer

          # @!attribute to
          #   Inclusive end of the published-at window, in epoch milliseconds.
          #
          #   @return [Integer, nil]
          optional :to, Integer

          # @!method initialize(from: nil, to: nil)
          #   Published-at window in epoch milliseconds. from must be before or equal to to.
          #
          #   @param from [Integer] Inclusive start of the published-at window, in epoch milliseconds.
          #
          #   @param to [Integer] Inclusive end of the published-at window, in epoch milliseconds.
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
        #   Result ordering.
        #
        #   @return [Symbol, ContextDev::Models::NewsSearchParams::SortBy::Type]
        required :type, enum: -> { ContextDev::NewsSearchParams::SortBy::Type }

        # @!method initialize(type:)
        #   Result ordering. Defaults to newest.
        #
        #   @param type [Symbol, ContextDev::Models::NewsSearchParams::SortBy::Type] Result ordering.

        # Result ordering.
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
