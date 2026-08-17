# typed: strong

module ContextDev
  module Models
    class NewsSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::NewsSearchParams, ContextDev::Internal::AnyHash)
        end

      # What to search for.
      sig { returns(ContextDev::NewsSearchParams::SearchBy) }
      attr_reader :search_by

      sig do
        params(search_by: ContextDev::NewsSearchParams::SearchBy::OrHash).void
      end
      attr_writer :search_by

      # Opaque next_cursor from the previous response, or null for the first page.
      sig { returns(T.nilable(String)) }
      attr_accessor :cursor

      # Optional result filters.
      sig { returns(T.nilable(ContextDev::NewsSearchParams::FilterBy)) }
      attr_reader :filter_by

      sig do
        params(filter_by: ContextDev::NewsSearchParams::FilterBy::OrHash).void
      end
      attr_writer :filter_by

      # Maximum results to return. Defaults to 10.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Result ordering. Defaults to newest.
      sig { returns(T.nilable(ContextDev::NewsSearchParams::SortBy)) }
      attr_reader :sort_by

      sig { params(sort_by: ContextDev::NewsSearchParams::SortBy::OrHash).void }
      attr_writer :sort_by

      # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      sig do
        params(
          search_by: ContextDev::NewsSearchParams::SearchBy::OrHash,
          cursor: T.nilable(String),
          filter_by: ContextDev::NewsSearchParams::FilterBy::OrHash,
          limit: Integer,
          sort_by: ContextDev::NewsSearchParams::SortBy::OrHash,
          tags: T::Array[String],
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # What to search for.
        search_by:,
        # Opaque next_cursor from the previous response, or null for the first page.
        cursor: nil,
        # Optional result filters.
        filter_by: nil,
        # Maximum results to return. Defaults to 10.
        limit: nil,
        # Result ordering. Defaults to newest.
        sort_by: nil,
        # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
        tags: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            search_by: ContextDev::NewsSearchParams::SearchBy,
            cursor: T.nilable(String),
            filter_by: ContextDev::NewsSearchParams::FilterBy,
            limit: Integer,
            sort_by: ContextDev::NewsSearchParams::SortBy,
            tags: T::Array[String],
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class SearchBy < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::NewsSearchParams::SearchBy,
              ContextDev::Internal::AnyHash
            )
          end

        # The company to search news for, identified by name, domain, ticker, or ISIN.
        sig do
          returns(
            T.any(
              ContextDev::NewsSearchParams::SearchBy::Entity::Name,
              ContextDev::NewsSearchParams::SearchBy::Entity::Domain,
              ContextDev::NewsSearchParams::SearchBy::Entity::Ticker,
              ContextDev::NewsSearchParams::SearchBy::Entity::Isin
            )
          )
        end
        attr_accessor :entity

        # How to search. Only entity search is supported.
        sig { returns(ContextDev::NewsSearchParams::SearchBy::Type::OrSymbol) }
        attr_accessor :type

        # What to search for.
        sig do
          params(
            entity:
              T.any(
                ContextDev::NewsSearchParams::SearchBy::Entity::Name::OrHash,
                ContextDev::NewsSearchParams::SearchBy::Entity::Domain::OrHash,
                ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::OrHash,
                ContextDev::NewsSearchParams::SearchBy::Entity::Isin::OrHash
              ),
            type: ContextDev::NewsSearchParams::SearchBy::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The company to search news for, identified by name, domain, ticker, or ISIN.
          entity:,
          # How to search. Only entity search is supported.
          type:
        )
        end

        sig do
          override.returns(
            {
              entity:
                T.any(
                  ContextDev::NewsSearchParams::SearchBy::Entity::Name,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Domain,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Isin
                ),
              type: ContextDev::NewsSearchParams::SearchBy::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        # The company to search news for, identified by name, domain, ticker, or ISIN.
        module Entity
          extend ContextDev::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                ContextDev::NewsSearchParams::SearchBy::Entity::Name,
                ContextDev::NewsSearchParams::SearchBy::Entity::Domain,
                ContextDev::NewsSearchParams::SearchBy::Entity::Ticker,
                ContextDev::NewsSearchParams::SearchBy::Entity::Isin
              )
            end

          class Name < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::NewsSearchParams::SearchBy::Entity::Name,
                  ContextDev::Internal::AnyHash
                )
              end

            # Company name.
            sig { returns(String) }
            attr_accessor :name

            sig { returns(Symbol) }
            attr_accessor :type

            # Identify the company by name.
            sig { params(name: String, type: Symbol).returns(T.attached_class) }
            def self.new(
              # Company name.
              name:,
              type: :name
            )
            end

            sig { override.returns({ name: String, type: Symbol }) }
            def to_hash
            end
          end

          class Domain < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::NewsSearchParams::SearchBy::Entity::Domain,
                  ContextDev::Internal::AnyHash
                )
              end

            # Company website domain, such as apple.com.
            sig { returns(String) }
            attr_accessor :domain

            sig { returns(Symbol) }
            attr_accessor :type

            # Identify the company by website domain.
            sig do
              params(domain: String, type: Symbol).returns(T.attached_class)
            end
            def self.new(
              # Company website domain, such as apple.com.
              domain:,
              type: :domain
            )
            end

            sig { override.returns({ domain: String, type: Symbol }) }
            def to_hash
            end
          end

          class Ticker < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker,
                  ContextDev::Internal::AnyHash
                )
              end

            # Public-company ticker.
            sig { returns(String) }
            attr_accessor :ticker

            sig { returns(Symbol) }
            attr_accessor :type

            # Stock exchange the ticker trades on, used to disambiguate tickers listed on
            # multiple exchanges.
            sig do
              returns(
                T.nilable(
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::OrSymbol
                )
              )
            end
            attr_reader :exchange

            sig do
              params(
                exchange:
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::OrSymbol
              ).void
            end
            attr_writer :exchange

            # Identify the company by stock ticker, optionally scoped to an exchange.
            sig do
              params(
                ticker: String,
                exchange:
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::OrSymbol,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Public-company ticker.
              ticker:,
              # Stock exchange the ticker trades on, used to disambiguate tickers listed on
              # multiple exchanges.
              exchange: nil,
              type: :ticker
            )
            end

            sig do
              override.returns(
                {
                  ticker: String,
                  type: Symbol,
                  exchange:
                    ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::OrSymbol
                }
              )
            end
            def to_hash
            end

            # Stock exchange the ticker trades on, used to disambiguate tickers listed on
            # multiple exchanges.
            module Exchange
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AMEX =
                T.let(
                  :AMEX,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              AMS =
                T.let(
                  :AMS,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              AQS =
                T.let(
                  :AQS,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              ASX =
                T.let(
                  :ASX,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              ATH =
                T.let(
                  :ATH,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              BER =
                T.let(
                  :BER,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              BME =
                T.let(
                  :BME,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              BRU =
                T.let(
                  :BRU,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              BSE =
                T.let(
                  :BSE,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              BUD =
                T.let(
                  :BUD,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              BUE =
                T.let(
                  :BUE,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              BVC =
                T.let(
                  :BVC,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              CBOE =
                T.let(
                  :CBOE,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              CNQ =
                T.let(
                  :CNQ,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              CPH =
                T.let(
                  :CPH,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              DFM =
                T.let(
                  :DFM,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              DOH =
                T.let(
                  :DOH,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              DUB =
                T.let(
                  :DUB,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              DUS =
                T.let(
                  :DUS,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              DXE =
                T.let(
                  :DXE,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              EGX =
                T.let(
                  :EGX,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              FSX =
                T.let(
                  :FSX,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              HAM =
                T.let(
                  :HAM,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              HEL =
                T.let(
                  :HEL,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              HKSE =
                T.let(
                  :HKSE,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              HOSE =
                T.let(
                  :HOSE,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              ICE =
                T.let(
                  :ICE,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              IOB =
                T.let(
                  :IOB,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              IST =
                T.let(
                  :IST,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              JKT =
                T.let(
                  :JKT,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              JNB =
                T.let(
                  :JNB,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              JPX =
                T.let(
                  :JPX,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              KLS =
                T.let(
                  :KLS,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              KOE =
                T.let(
                  :KOE,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              KSC =
                T.let(
                  :KSC,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              KUW =
                T.let(
                  :KUW,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              LIS =
                T.let(
                  :LIS,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              LSE =
                T.let(
                  :LSE,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              MCX =
                T.let(
                  :MCX,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              MEX =
                T.let(
                  :MEX,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              MIL =
                T.let(
                  :MIL,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              MUN =
                T.let(
                  :MUN,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              NASDAQ =
                T.let(
                  :NASDAQ,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              NEO =
                T.let(
                  :NEO,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              NSE =
                T.let(
                  :NSE,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              NYSE =
                T.let(
                  :NYSE,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              NZE =
                T.let(
                  :NZE,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              OSL =
                T.let(
                  :OSL,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              OTC =
                T.let(
                  :OTC,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              PAR =
                T.let(
                  :PAR,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              PNK =
                T.let(
                  :PNK,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              PRA =
                T.let(
                  :PRA,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              RIS =
                T.let(
                  :RIS,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              SAO =
                T.let(
                  :SAO,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              SAU =
                T.let(
                  :SAU,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              SES =
                T.let(
                  :SES,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              SET =
                T.let(
                  :SET,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              SGO =
                T.let(
                  :SGO,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              SHH =
                T.let(
                  :SHH,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              SHZ =
                T.let(
                  :SHZ,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              SIX =
                T.let(
                  :SIX,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              STO =
                T.let(
                  :STO,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              STU =
                T.let(
                  :STU,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              TAI =
                T.let(
                  :TAI,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              TAL =
                T.let(
                  :TAL,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              TLV =
                T.let(
                  :TLV,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              TSX =
                T.let(
                  :TSX,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              TSXV =
                T.let(
                  :TSXV,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              TWO =
                T.let(
                  :TWO,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              VIE =
                T.let(
                  :VIE,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              WSE =
                T.let(
                  :WSE,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )
              XETRA =
                T.let(
                  :XETRA,
                  ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::NewsSearchParams::SearchBy::Entity::Ticker::Exchange::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Isin < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::NewsSearchParams::SearchBy::Entity::Isin,
                  ContextDev::Internal::AnyHash
                )
              end

            # International Securities Identification Number.
            sig { returns(String) }
            attr_accessor :isin

            sig { returns(Symbol) }
            attr_accessor :type

            # Identify the company by International Securities Identification Number.
            sig { params(isin: String, type: Symbol).returns(T.attached_class) }
            def self.new(
              # International Securities Identification Number.
              isin:,
              type: :isin
            )
            end

            sig { override.returns({ isin: String, type: Symbol }) }
            def to_hash
            end
          end

          sig do
            override.returns(
              T::Array[ContextDev::NewsSearchParams::SearchBy::Entity::Variants]
            )
          end
          def self.variants
          end
        end

        # How to search. Only entity search is supported.
        module Type
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::NewsSearchParams::SearchBy::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENTITY =
            T.let(
              :entity,
              ContextDev::NewsSearchParams::SearchBy::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::NewsSearchParams::SearchBy::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class FilterBy < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::NewsSearchParams::FilterBy,
              ContextDev::Internal::AnyHash
            )
          end

        # Article languages to include. Up to 3.
        sig do
          returns(
            T.nilable(
              T::Array[
                ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::OrSymbol
              ]
            )
          )
        end
        attr_reader :article_language

        sig do
          params(
            article_language:
              T::Array[
                ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::OrSymbol
              ]
          ).void
        end
        attr_writer :article_language

        # Article types to include. Up to 3.
        sig do
          returns(
            T.nilable(
              T::Array[
                ContextDev::NewsSearchParams::FilterBy::ArticleType::OrSymbol
              ]
            )
          )
        end
        attr_reader :article_type

        sig do
          params(
            article_type:
              T::Array[
                ContextDev::NewsSearchParams::FilterBy::ArticleType::OrSymbol
              ]
          ).void
        end
        attr_writer :article_type

        # Published-at window in epoch milliseconds.
        sig { returns(T.nilable(ContextDev::NewsSearchParams::FilterBy::Date)) }
        attr_reader :date

        sig do
          params(
            date: ContextDev::NewsSearchParams::FilterBy::Date::OrHash
          ).void
        end
        attr_writer :date

        # Publisher countries to include, as lowercase ISO 3166-1 alpha-2 codes. Up to 3.
        sig do
          returns(
            T.nilable(
              T::Array[
                ContextDev::NewsSearchParams::FilterBy::SourceCountry::OrSymbol
              ]
            )
          )
        end
        attr_reader :source_country

        sig do
          params(
            source_country:
              T::Array[
                ContextDev::NewsSearchParams::FilterBy::SourceCountry::OrSymbol
              ]
          ).void
        end
        attr_writer :source_country

        # Publisher domains to include. Up to 3.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :source_domain

        sig { params(source_domain: T::Array[String]).void }
        attr_writer :source_domain

        # Optional result filters.
        sig do
          params(
            article_language:
              T::Array[
                ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::OrSymbol
              ],
            article_type:
              T::Array[
                ContextDev::NewsSearchParams::FilterBy::ArticleType::OrSymbol
              ],
            date: ContextDev::NewsSearchParams::FilterBy::Date::OrHash,
            source_country:
              T::Array[
                ContextDev::NewsSearchParams::FilterBy::SourceCountry::OrSymbol
              ],
            source_domain: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          # Article languages to include. Up to 3.
          article_language: nil,
          # Article types to include. Up to 3.
          article_type: nil,
          # Published-at window in epoch milliseconds.
          date: nil,
          # Publisher countries to include, as lowercase ISO 3166-1 alpha-2 codes. Up to 3.
          source_country: nil,
          # Publisher domains to include. Up to 3.
          source_domain: nil
        )
        end

        sig do
          override.returns(
            {
              article_language:
                T::Array[
                  ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::OrSymbol
                ],
              article_type:
                T::Array[
                  ContextDev::NewsSearchParams::FilterBy::ArticleType::OrSymbol
                ],
              date: ContextDev::NewsSearchParams::FilterBy::Date,
              source_country:
                T::Array[
                  ContextDev::NewsSearchParams::FilterBy::SourceCountry::OrSymbol
                ],
              source_domain: T::Array[String]
            }
          )
        end
        def to_hash
        end

        module ArticleLanguage
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::NewsSearchParams::FilterBy::ArticleLanguage
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AR =
            T.let(
              :ar,
              ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::TaggedSymbol
            )
          DE =
            T.let(
              :de,
              ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::TaggedSymbol
            )
          EN =
            T.let(
              :en,
              ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::TaggedSymbol
            )
          ES =
            T.let(
              :es,
              ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::TaggedSymbol
            )
          FR =
            T.let(
              :fr,
              ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::TaggedSymbol
            )
          HI =
            T.let(
              :hi,
              ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::TaggedSymbol
            )
          IT =
            T.let(
              :it,
              ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::TaggedSymbol
            )
          JA =
            T.let(
              :ja,
              ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::TaggedSymbol
            )
          KO =
            T.let(
              :ko,
              ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::TaggedSymbol
            )
          NL =
            T.let(
              :nl,
              ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::TaggedSymbol
            )
          PT =
            T.let(
              :pt,
              ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::TaggedSymbol
            )
          RU =
            T.let(
              :ru,
              ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::TaggedSymbol
            )
          ZH =
            T.let(
              :zh,
              ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::NewsSearchParams::FilterBy::ArticleLanguage::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module ArticleType
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::NewsSearchParams::FilterBy::ArticleType)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EDITORIAL =
            T.let(
              :editorial,
              ContextDev::NewsSearchParams::FilterBy::ArticleType::TaggedSymbol
            )
          PRESS_RELEASE =
            T.let(
              :press_release,
              ContextDev::NewsSearchParams::FilterBy::ArticleType::TaggedSymbol
            )
          REGULATORY_FILING =
            T.let(
              :regulatory_filing,
              ContextDev::NewsSearchParams::FilterBy::ArticleType::TaggedSymbol
            )
          ADVISORY =
            T.let(
              :advisory,
              ContextDev::NewsSearchParams::FilterBy::ArticleType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::NewsSearchParams::FilterBy::ArticleType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Date < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::NewsSearchParams::FilterBy::Date,
                ContextDev::Internal::AnyHash
              )
            end

          # Inclusive start of the published-at window, in epoch milliseconds.
          sig { returns(T.nilable(Integer)) }
          attr_reader :from

          sig { params(from: Integer).void }
          attr_writer :from

          # Inclusive end of the published-at window, in epoch milliseconds.
          sig { returns(T.nilable(Integer)) }
          attr_reader :to

          sig { params(to: Integer).void }
          attr_writer :to

          # Published-at window in epoch milliseconds.
          sig { params(from: Integer, to: Integer).returns(T.attached_class) }
          def self.new(
            # Inclusive start of the published-at window, in epoch milliseconds.
            from: nil,
            # Inclusive end of the published-at window, in epoch milliseconds.
            to: nil
          )
          end

          sig { override.returns({ from: Integer, to: Integer }) }
          def to_hash
          end
        end

        module SourceCountry
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::NewsSearchParams::FilterBy::SourceCountry
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AE =
            T.let(
              :ae,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          AR =
            T.let(
              :ar,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          AU =
            T.let(
              :au,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          CA =
            T.let(
              :ca,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          CG =
            T.let(
              :cg,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          CH =
            T.let(
              :ch,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          CL =
            T.let(
              :cl,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          DE =
            T.let(
              :de,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          FI =
            T.let(
              :fi,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          FR =
            T.let(
              :fr,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          GB =
            T.let(
              :gb,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          HK =
            T.let(
              :hk,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          IL =
            T.let(
              :il,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          IN =
            T.let(
              :in,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          JP =
            T.let(
              :jp,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          KR =
            T.let(
              :kr,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          MX =
            T.let(
              :mx,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          NG =
            T.let(
              :ng,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          NL =
            T.let(
              :nl,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          QA =
            T.let(
              :qa,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          SA =
            T.let(
              :sa,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          SE =
            T.let(
              :se,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          SG =
            T.let(
              :sg,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          US =
            T.let(
              :us,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )
          ZA =
            T.let(
              :za,
              ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::NewsSearchParams::FilterBy::SourceCountry::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class SortBy < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::NewsSearchParams::SortBy,
              ContextDev::Internal::AnyHash
            )
          end

        # Result ordering.
        sig { returns(ContextDev::NewsSearchParams::SortBy::Type::OrSymbol) }
        attr_accessor :type

        # Result ordering. Defaults to newest.
        sig do
          params(
            type: ContextDev::NewsSearchParams::SortBy::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Result ordering.
          type:
        )
        end

        sig do
          override.returns(
            { type: ContextDev::NewsSearchParams::SortBy::Type::OrSymbol }
          )
        end
        def to_hash
        end

        # Result ordering.
        module Type
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::NewsSearchParams::SortBy::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          RELEVANCE =
            T.let(
              :relevance,
              ContextDev::NewsSearchParams::SortBy::Type::TaggedSymbol
            )
          NEWEST =
            T.let(
              :newest,
              ContextDev::NewsSearchParams::SortBy::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[ContextDev::NewsSearchParams::SortBy::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
