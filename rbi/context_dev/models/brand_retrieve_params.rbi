# typed: strong

module ContextDev
  module Models
    class BrandRetrieveParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::BrandRetrieveParams, ContextDev::Internal::AnyHash)
        end

      # One lookup, chosen by `type`.
      sig do
        returns(
          T.any(
            ContextDev::BrandRetrieveParams::Body::ByDomain,
            ContextDev::BrandRetrieveParams::Body::ByName,
            ContextDev::BrandRetrieveParams::Body::ByEmail,
            ContextDev::BrandRetrieveParams::Body::ByTicker,
            ContextDev::BrandRetrieveParams::Body::ByDirectURL,
            ContextDev::BrandRetrieveParams::Body::ByTransaction
          )
        )
      end
      attr_accessor :body

      sig do
        params(
          body:
            T.any(
              ContextDev::BrandRetrieveParams::Body::ByDomain::OrHash,
              ContextDev::BrandRetrieveParams::Body::ByName::OrHash,
              ContextDev::BrandRetrieveParams::Body::ByEmail::OrHash,
              ContextDev::BrandRetrieveParams::Body::ByTicker::OrHash,
              ContextDev::BrandRetrieveParams::Body::ByDirectURL::OrHash,
              ContextDev::BrandRetrieveParams::Body::ByTransaction::OrHash
            ),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # One lookup, chosen by `type`.
        body:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            body:
              T.any(
                ContextDev::BrandRetrieveParams::Body::ByDomain,
                ContextDev::BrandRetrieveParams::Body::ByName,
                ContextDev::BrandRetrieveParams::Body::ByEmail,
                ContextDev::BrandRetrieveParams::Body::ByTicker,
                ContextDev::BrandRetrieveParams::Body::ByDirectURL,
                ContextDev::BrandRetrieveParams::Body::ByTransaction
              ),
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # One lookup, chosen by `type`.
      module Body
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::BrandRetrieveParams::Body::ByDomain,
              ContextDev::BrandRetrieveParams::Body::ByName,
              ContextDev::BrandRetrieveParams::Body::ByEmail,
              ContextDev::BrandRetrieveParams::Body::ByTicker,
              ContextDev::BrandRetrieveParams::Body::ByDirectURL,
              ContextDev::BrandRetrieveParams::Body::ByTransaction
            )
          end

        class ByDomain < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::BrandRetrieveParams::Body::ByDomain,
                ContextDev::Internal::AnyHash
              )
            end

          # Domain name to retrieve brand data for (e.g., 'stripe.com').
          sig { returns(String) }
          attr_accessor :domain

          # Discriminator for domain-based brand retrieval.
          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::OrSymbol
              )
            )
          end
          attr_accessor :force_language

          # Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1
          # year. `0` refreshes.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_age_ms

          sig { params(max_age_ms: Integer).void }
          attr_writer :max_age_ms

          # Optional parameter to optimize the API call for maximum speed. When set to true,
          # the API will skip time-consuming operations for faster response at the cost of
          # less comprehensive data.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :max_speed

          sig { params(max_speed: T::Boolean).void }
          attr_writer :max_speed

          # Labels for filtering usage in the dashboard.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :tags

          sig { params(tags: T::Array[String]).void }
          attr_writer :tags

          # Request deadline and what to return when it passes.
          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::ByDomain::TimeoutOpts
              )
            )
          end
          attr_reader :timeout_opts

          sig do
            params(
              timeout_opts:
                ContextDev::BrandRetrieveParams::Body::ByDomain::TimeoutOpts::OrHash
            ).void
          end
          attr_writer :timeout_opts

          # Retrieve brand data by domain. Cannot be combined with name, email, or ticker.
          sig do
            params(
              domain: String,
              force_language:
                T.nilable(
                  ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::OrSymbol
                ),
              max_age_ms: Integer,
              max_speed: T::Boolean,
              tags: T::Array[String],
              timeout_opts:
                ContextDev::BrandRetrieveParams::Body::ByDomain::TimeoutOpts::OrHash,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Domain name to retrieve brand data for (e.g., 'stripe.com').
            domain:,
            force_language: nil,
            # Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1
            # year. `0` refreshes.
            max_age_ms: nil,
            # Optional parameter to optimize the API call for maximum speed. When set to true,
            # the API will skip time-consuming operations for faster response at the cost of
            # less comprehensive data.
            max_speed: nil,
            # Labels for filtering usage in the dashboard.
            tags: nil,
            # Request deadline and what to return when it passes.
            timeout_opts: nil,
            # Discriminator for domain-based brand retrieval.
            type: :by_domain
          )
          end

          sig do
            override.returns(
              {
                domain: String,
                type: Symbol,
                force_language:
                  T.nilable(
                    ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::OrSymbol
                  ),
                max_age_ms: Integer,
                max_speed: T::Boolean,
                tags: T::Array[String],
                timeout_opts:
                  ContextDev::BrandRetrieveParams::Body::ByDomain::TimeoutOpts
              }
            )
          end
          def to_hash
          end

          module ForceLanguage
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AFRIKAANS =
              T.let(
                :afrikaans,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            ALBANIAN =
              T.let(
                :albanian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            AMHARIC =
              T.let(
                :amharic,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            ARABIC =
              T.let(
                :arabic,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            ARMENIAN =
              T.let(
                :armenian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            ASSAMESE =
              T.let(
                :assamese,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            AYMARA =
              T.let(
                :aymara,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            AZERI =
              T.let(
                :azeri,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            BASQUE =
              T.let(
                :basque,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            BELARUSIAN =
              T.let(
                :belarusian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            BENGALI =
              T.let(
                :bengali,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            BOSNIAN =
              T.let(
                :bosnian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            BULGARIAN =
              T.let(
                :bulgarian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            BURMESE =
              T.let(
                :burmese,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            CANTONESE =
              T.let(
                :cantonese,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            CATALAN =
              T.let(
                :catalan,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            CEBUANO =
              T.let(
                :cebuano,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            CHINESE =
              T.let(
                :chinese,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            CORSICAN =
              T.let(
                :corsican,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            CROATIAN =
              T.let(
                :croatian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            CZECH =
              T.let(
                :czech,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            DANISH =
              T.let(
                :danish,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            DUTCH =
              T.let(
                :dutch,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            ENGLISH =
              T.let(
                :english,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            ESPERANTO =
              T.let(
                :esperanto,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            ESTONIAN =
              T.let(
                :estonian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            FARSI =
              T.let(
                :farsi,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            FIJIAN =
              T.let(
                :fijian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            FINNISH =
              T.let(
                :finnish,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            FRENCH =
              T.let(
                :french,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            GALICIAN =
              T.let(
                :galician,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            GEORGIAN =
              T.let(
                :georgian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            GERMAN =
              T.let(
                :german,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            GREEK =
              T.let(
                :greek,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            GUARANI =
              T.let(
                :guarani,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            GUJARATI =
              T.let(
                :gujarati,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            HAITIAN_CREOLE =
              T.let(
                :"haitian-creole",
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            HAUSA =
              T.let(
                :hausa,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            HAWAIIAN =
              T.let(
                :hawaiian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            HEBREW =
              T.let(
                :hebrew,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            HINDI =
              T.let(
                :hindi,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            HMONG =
              T.let(
                :hmong,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            HUNGARIAN =
              T.let(
                :hungarian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            ICELANDIC =
              T.let(
                :icelandic,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            IGBO =
              T.let(
                :igbo,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            INDONESIAN =
              T.let(
                :indonesian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            IRISH =
              T.let(
                :irish,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            ITALIAN =
              T.let(
                :italian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            JAPANESE =
              T.let(
                :japanese,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            JAVANESE =
              T.let(
                :javanese,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            KANNADA =
              T.let(
                :kannada,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            KAZAKH =
              T.let(
                :kazakh,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            KHMER =
              T.let(
                :khmer,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            KINYARWANDA =
              T.let(
                :kinyarwanda,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            KOREAN =
              T.let(
                :korean,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            KURDISH =
              T.let(
                :kurdish,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            KYRGYZ =
              T.let(
                :kyrgyz,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            LAO =
              T.let(
                :lao,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            LATIN =
              T.let(
                :latin,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            LATVIAN =
              T.let(
                :latvian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            LINGALA =
              T.let(
                :lingala,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            LITHUANIAN =
              T.let(
                :lithuanian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            LUXEMBOURGISH =
              T.let(
                :luxembourgish,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            MACEDONIAN =
              T.let(
                :macedonian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            MALAGASY =
              T.let(
                :malagasy,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            MALAY =
              T.let(
                :malay,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            MALAYALAM =
              T.let(
                :malayalam,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            MALTESE =
              T.let(
                :maltese,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            MAORI =
              T.let(
                :maori,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            MARATHI =
              T.let(
                :marathi,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            MONGOLIAN =
              T.let(
                :mongolian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            NEPALI =
              T.let(
                :nepali,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            NORWEGIAN =
              T.let(
                :norwegian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            ODIA =
              T.let(
                :odia,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            OROMO =
              T.let(
                :oromo,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            PASHTO =
              T.let(
                :pashto,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            PIDGIN =
              T.let(
                :pidgin,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            POLISH =
              T.let(
                :polish,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            PORTUGUESE =
              T.let(
                :portuguese,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            PUNJABI =
              T.let(
                :punjabi,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            QUECHUA =
              T.let(
                :quechua,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            ROMANIAN =
              T.let(
                :romanian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            RUSSIAN =
              T.let(
                :russian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            SAMOAN =
              T.let(
                :samoan,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            SCOTTISH_GAELIC =
              T.let(
                :"scottish-gaelic",
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            SERBIAN =
              T.let(
                :serbian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            SESOTHO =
              T.let(
                :sesotho,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            SHONA =
              T.let(
                :shona,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            SINDHI =
              T.let(
                :sindhi,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            SINHALA =
              T.let(
                :sinhala,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            SLOVAK =
              T.let(
                :slovak,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            SLOVENE =
              T.let(
                :slovene,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            SOMALI =
              T.let(
                :somali,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            SPANISH =
              T.let(
                :spanish,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            SUNDANESE =
              T.let(
                :sundanese,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            SWAHILI =
              T.let(
                :swahili,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            SWEDISH =
              T.let(
                :swedish,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            TAGALOG =
              T.let(
                :tagalog,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            TAJIK =
              T.let(
                :tajik,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            TAMIL =
              T.let(
                :tamil,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            TATAR =
              T.let(
                :tatar,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            TELUGU =
              T.let(
                :telugu,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            THAI =
              T.let(
                :thai,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            TIBETAN =
              T.let(
                :tibetan,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            TIGRINYA =
              T.let(
                :tigrinya,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            TONGAN =
              T.let(
                :tongan,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            TSWANA =
              T.let(
                :tswana,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            TURKISH =
              T.let(
                :turkish,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            TURKMEN =
              T.let(
                :turkmen,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            UKRAINIAN =
              T.let(
                :ukrainian,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            URDU =
              T.let(
                :urdu,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            UYGHUR =
              T.let(
                :uyghur,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            UZBEK =
              T.let(
                :uzbek,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            VIETNAMESE =
              T.let(
                :vietnamese,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            WELSH =
              T.let(
                :welsh,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            WOLOF =
              T.let(
                :wolof,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            XHOSA =
              T.let(
                :xhosa,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            YIDDISH =
              T.let(
                :yiddish,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            YORUBA =
              T.let(
                :yoruba,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )
            ZULU =
              T.let(
                :zulu,
                ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class TimeoutOpts < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::BrandRetrieveParams::Body::ByDomain::TimeoutOpts,
                  ContextDev::Internal::AnyHash
                )
              end

            # Deadline in milliseconds.
            sig { returns(Integer) }
            attr_accessor :milliseconds

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            sig do
              returns(
                T.nilable(
                  ContextDev::BrandRetrieveParams::Body::ByDomain::TimeoutOpts::Behavior::OrSymbol
                )
              )
            end
            attr_reader :behavior

            sig do
              params(
                behavior:
                  ContextDev::BrandRetrieveParams::Body::ByDomain::TimeoutOpts::Behavior::OrSymbol
              ).void
            end
            attr_writer :behavior

            # Request deadline and what to return when it passes.
            sig do
              params(
                milliseconds: Integer,
                behavior:
                  ContextDev::BrandRetrieveParams::Body::ByDomain::TimeoutOpts::Behavior::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Deadline in milliseconds.
              milliseconds:,
              # "fail" returns 408 at the deadline. "return-partial" returns available results;
              # inspect the response’s partial flag.
              behavior: nil
            )
            end

            sig do
              override.returns(
                {
                  milliseconds: Integer,
                  behavior:
                    ContextDev::BrandRetrieveParams::Body::ByDomain::TimeoutOpts::Behavior::OrSymbol
                }
              )
            end
            def to_hash
            end

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            module Behavior
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::BrandRetrieveParams::Body::ByDomain::TimeoutOpts::Behavior
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              FAIL =
                T.let(
                  :fail,
                  ContextDev::BrandRetrieveParams::Body::ByDomain::TimeoutOpts::Behavior::TaggedSymbol
                )
              RETURN_PARTIAL =
                T.let(
                  :"return-partial",
                  ContextDev::BrandRetrieveParams::Body::ByDomain::TimeoutOpts::Behavior::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::BrandRetrieveParams::Body::ByDomain::TimeoutOpts::Behavior::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class ByName < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::BrandRetrieveParams::Body::ByName,
                ContextDev::Internal::AnyHash
              )
            end

          # Company name to retrieve brand data for (e.g., 'Apple Inc').
          sig { returns(String) }
          attr_accessor :name

          # Discriminator for name-based brand retrieval.
          sig { returns(Symbol) }
          attr_accessor :type

          # Two-letter ISO 3166-1 alpha-2 country code (GL parameter) used to localize
          # search.
          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::OrSymbol
              )
            )
          end
          attr_reader :country_gl

          sig do
            params(
              country_gl:
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::OrSymbol
            ).void
          end
          attr_writer :country_gl

          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::OrSymbol
              )
            )
          end
          attr_accessor :force_language

          # Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1
          # year. `0` refreshes.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_age_ms

          sig { params(max_age_ms: Integer).void }
          attr_writer :max_age_ms

          # Optional parameter to optimize the API call for maximum speed. When set to true,
          # the API will skip time-consuming operations for faster response at the cost of
          # less comprehensive data.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :max_speed

          sig { params(max_speed: T::Boolean).void }
          attr_writer :max_speed

          # Labels for filtering usage in the dashboard.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :tags

          sig { params(tags: T::Array[String]).void }
          attr_writer :tags

          # Request deadline and what to return when it passes.
          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::ByName::TimeoutOpts
              )
            )
          end
          attr_reader :timeout_opts

          sig do
            params(
              timeout_opts:
                ContextDev::BrandRetrieveParams::Body::ByName::TimeoutOpts::OrHash
            ).void
          end
          attr_writer :timeout_opts

          # Retrieve brand data by company name. Cannot be combined with domain, email, or
          # ticker.
          sig do
            params(
              name: String,
              country_gl:
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::OrSymbol,
              force_language:
                T.nilable(
                  ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::OrSymbol
                ),
              max_age_ms: Integer,
              max_speed: T::Boolean,
              tags: T::Array[String],
              timeout_opts:
                ContextDev::BrandRetrieveParams::Body::ByName::TimeoutOpts::OrHash,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Company name to retrieve brand data for (e.g., 'Apple Inc').
            name:,
            # Two-letter ISO 3166-1 alpha-2 country code (GL parameter) used to localize
            # search.
            country_gl: nil,
            force_language: nil,
            # Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1
            # year. `0` refreshes.
            max_age_ms: nil,
            # Optional parameter to optimize the API call for maximum speed. When set to true,
            # the API will skip time-consuming operations for faster response at the cost of
            # less comprehensive data.
            max_speed: nil,
            # Labels for filtering usage in the dashboard.
            tags: nil,
            # Request deadline and what to return when it passes.
            timeout_opts: nil,
            # Discriminator for name-based brand retrieval.
            type: :by_name
          )
          end

          sig do
            override.returns(
              {
                name: String,
                type: Symbol,
                country_gl:
                  ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::OrSymbol,
                force_language:
                  T.nilable(
                    ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::OrSymbol
                  ),
                max_age_ms: Integer,
                max_speed: T::Boolean,
                tags: T::Array[String],
                timeout_opts:
                  ContextDev::BrandRetrieveParams::Body::ByName::TimeoutOpts
              }
            )
          end
          def to_hash
          end

          # Two-letter ISO 3166-1 alpha-2 country code (GL parameter) used to localize
          # search.
          module CountryGl
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::BrandRetrieveParams::Body::ByName::CountryGl
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AF =
              T.let(
                :af,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            AL =
              T.let(
                :al,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            DZ =
              T.let(
                :dz,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            AS =
              T.let(
                :as,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            AD =
              T.let(
                :ad,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            AO =
              T.let(
                :ao,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            AI =
              T.let(
                :ai,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            AQ =
              T.let(
                :aq,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            AG =
              T.let(
                :ag,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            AR =
              T.let(
                :ar,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            AM =
              T.let(
                :am,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            AW =
              T.let(
                :aw,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            AU =
              T.let(
                :au,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            AT =
              T.let(
                :at,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            AZ =
              T.let(
                :az,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BS =
              T.let(
                :bs,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BH =
              T.let(
                :bh,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BD =
              T.let(
                :bd,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BB =
              T.let(
                :bb,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BY =
              T.let(
                :by,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BE =
              T.let(
                :be,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BZ =
              T.let(
                :bz,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BJ =
              T.let(
                :bj,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BM =
              T.let(
                :bm,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BT =
              T.let(
                :bt,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BO =
              T.let(
                :bo,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BA =
              T.let(
                :ba,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BW =
              T.let(
                :bw,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BV =
              T.let(
                :bv,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BR =
              T.let(
                :br,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            IO =
              T.let(
                :io,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BN =
              T.let(
                :bn,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BG =
              T.let(
                :bg,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BF =
              T.let(
                :bf,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            BI =
              T.let(
                :bi,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            KH =
              T.let(
                :kh,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CM =
              T.let(
                :cm,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CA =
              T.let(
                :ca,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CV =
              T.let(
                :cv,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            KY =
              T.let(
                :ky,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CF =
              T.let(
                :cf,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            TD =
              T.let(
                :td,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CL =
              T.let(
                :cl,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CN =
              T.let(
                :cn,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CX =
              T.let(
                :cx,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CC =
              T.let(
                :cc,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CO =
              T.let(
                :co,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            KM =
              T.let(
                :km,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CG =
              T.let(
                :cg,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CD =
              T.let(
                :cd,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CK =
              T.let(
                :ck,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CR =
              T.let(
                :cr,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CI =
              T.let(
                :ci,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            HR =
              T.let(
                :hr,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CU =
              T.let(
                :cu,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CY =
              T.let(
                :cy,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CZ =
              T.let(
                :cz,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            DK =
              T.let(
                :dk,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            DJ =
              T.let(
                :dj,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            DM =
              T.let(
                :dm,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            DO =
              T.let(
                :do,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            EC =
              T.let(
                :ec,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            EG =
              T.let(
                :eg,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SV =
              T.let(
                :sv,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GQ =
              T.let(
                :gq,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            ER =
              T.let(
                :er,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            EE =
              T.let(
                :ee,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            ET =
              T.let(
                :et,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            FK =
              T.let(
                :fk,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            FO =
              T.let(
                :fo,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            FJ =
              T.let(
                :fj,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            FI =
              T.let(
                :fi,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            FR =
              T.let(
                :fr,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GF =
              T.let(
                :gf,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            PF =
              T.let(
                :pf,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            TF =
              T.let(
                :tf,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GA =
              T.let(
                :ga,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GM =
              T.let(
                :gm,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GE =
              T.let(
                :ge,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            DE =
              T.let(
                :de,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GH =
              T.let(
                :gh,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GI =
              T.let(
                :gi,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GR =
              T.let(
                :gr,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GL =
              T.let(
                :gl,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GD =
              T.let(
                :gd,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GP =
              T.let(
                :gp,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GU =
              T.let(
                :gu,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GT =
              T.let(
                :gt,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GN =
              T.let(
                :gn,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GW =
              T.let(
                :gw,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GY =
              T.let(
                :gy,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            HT =
              T.let(
                :ht,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            HM =
              T.let(
                :hm,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            VA =
              T.let(
                :va,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            HN =
              T.let(
                :hn,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            HK =
              T.let(
                :hk,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            HU =
              T.let(
                :hu,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            IS =
              T.let(
                :is,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            IN =
              T.let(
                :in,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            ID =
              T.let(
                :id,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            IR =
              T.let(
                :ir,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            IQ =
              T.let(
                :iq,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            IE =
              T.let(
                :ie,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            IL =
              T.let(
                :il,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            IT =
              T.let(
                :it,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            JM =
              T.let(
                :jm,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            JP =
              T.let(
                :jp,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            JO =
              T.let(
                :jo,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            KZ =
              T.let(
                :kz,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            KE =
              T.let(
                :ke,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            KI =
              T.let(
                :ki,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            KP =
              T.let(
                :kp,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            KR =
              T.let(
                :kr,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            KW =
              T.let(
                :kw,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            KG =
              T.let(
                :kg,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            LA =
              T.let(
                :la,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            LV =
              T.let(
                :lv,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            LB =
              T.let(
                :lb,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            LS =
              T.let(
                :ls,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            LR =
              T.let(
                :lr,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            LY =
              T.let(
                :ly,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            LI =
              T.let(
                :li,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            LT =
              T.let(
                :lt,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            LU =
              T.let(
                :lu,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MO =
              T.let(
                :mo,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MK =
              T.let(
                :mk,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MG =
              T.let(
                :mg,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MW =
              T.let(
                :mw,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MY =
              T.let(
                :my,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MV =
              T.let(
                :mv,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            ML =
              T.let(
                :ml,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MT =
              T.let(
                :mt,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MH =
              T.let(
                :mh,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MQ =
              T.let(
                :mq,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MR =
              T.let(
                :mr,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MU =
              T.let(
                :mu,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            YT =
              T.let(
                :yt,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MX =
              T.let(
                :mx,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            FM =
              T.let(
                :fm,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MD =
              T.let(
                :md,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MC =
              T.let(
                :mc,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MN =
              T.let(
                :mn,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MS =
              T.let(
                :ms,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MA =
              T.let(
                :ma,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MZ =
              T.let(
                :mz,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MM =
              T.let(
                :mm,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            NA =
              T.let(
                :na,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            NR =
              T.let(
                :nr,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            NP =
              T.let(
                :np,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            NL =
              T.let(
                :nl,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            AN =
              T.let(
                :an,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            NC =
              T.let(
                :nc,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            NZ =
              T.let(
                :nz,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            NI =
              T.let(
                :ni,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            NE =
              T.let(
                :ne,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            NG =
              T.let(
                :ng,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            NU =
              T.let(
                :nu,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            NF =
              T.let(
                :nf,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            MP =
              T.let(
                :mp,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            NO =
              T.let(
                :no,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            OM =
              T.let(
                :om,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            PK =
              T.let(
                :pk,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            PW =
              T.let(
                :pw,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            PS =
              T.let(
                :ps,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            PA =
              T.let(
                :pa,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            PG =
              T.let(
                :pg,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            PY =
              T.let(
                :py,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            PE =
              T.let(
                :pe,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            PH =
              T.let(
                :ph,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            PN =
              T.let(
                :pn,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            PL =
              T.let(
                :pl,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            PT =
              T.let(
                :pt,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            PR =
              T.let(
                :pr,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            QA =
              T.let(
                :qa,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            RE =
              T.let(
                :re,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            RO =
              T.let(
                :ro,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            RU =
              T.let(
                :ru,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            RW =
              T.let(
                :rw,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SH =
              T.let(
                :sh,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            KN =
              T.let(
                :kn,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            LC =
              T.let(
                :lc,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            PM =
              T.let(
                :pm,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            VC =
              T.let(
                :vc,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            WS =
              T.let(
                :ws,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SM =
              T.let(
                :sm,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            ST =
              T.let(
                :st,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SA =
              T.let(
                :sa,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SN =
              T.let(
                :sn,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            RS =
              T.let(
                :rs,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SC =
              T.let(
                :sc,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SL =
              T.let(
                :sl,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SG =
              T.let(
                :sg,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SK =
              T.let(
                :sk,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SI =
              T.let(
                :si,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SB =
              T.let(
                :sb,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SO =
              T.let(
                :so,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            ZA =
              T.let(
                :za,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GS =
              T.let(
                :gs,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            ES =
              T.let(
                :es,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            LK =
              T.let(
                :lk,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SD =
              T.let(
                :sd,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SR =
              T.let(
                :sr,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SJ =
              T.let(
                :sj,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SZ =
              T.let(
                :sz,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SE =
              T.let(
                :se,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            CH =
              T.let(
                :ch,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            SY =
              T.let(
                :sy,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            TW =
              T.let(
                :tw,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            TJ =
              T.let(
                :tj,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            TZ =
              T.let(
                :tz,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            TH =
              T.let(
                :th,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            TL =
              T.let(
                :tl,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            TG =
              T.let(
                :tg,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            TK =
              T.let(
                :tk,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            TO =
              T.let(
                :to,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            TT =
              T.let(
                :tt,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            TN =
              T.let(
                :tn,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            TR =
              T.let(
                :tr,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            TM =
              T.let(
                :tm,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            TC =
              T.let(
                :tc,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            TV =
              T.let(
                :tv,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            UG =
              T.let(
                :ug,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            UA =
              T.let(
                :ua,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            AE =
              T.let(
                :ae,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            GB =
              T.let(
                :gb,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            US =
              T.let(
                :us,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            UM =
              T.let(
                :um,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            UY =
              T.let(
                :uy,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            UZ =
              T.let(
                :uz,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            VU =
              T.let(
                :vu,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            VE =
              T.let(
                :ve,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            VN =
              T.let(
                :vn,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            VG =
              T.let(
                :vg,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            VI =
              T.let(
                :vi,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            WF =
              T.let(
                :wf,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            EH =
              T.let(
                :eh,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            YE =
              T.let(
                :ye,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            ZM =
              T.let(
                :zm,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )
            ZW =
              T.let(
                :zw,
                ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::BrandRetrieveParams::Body::ByName::CountryGl::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module ForceLanguage
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AFRIKAANS =
              T.let(
                :afrikaans,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            ALBANIAN =
              T.let(
                :albanian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            AMHARIC =
              T.let(
                :amharic,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            ARABIC =
              T.let(
                :arabic,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            ARMENIAN =
              T.let(
                :armenian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            ASSAMESE =
              T.let(
                :assamese,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            AYMARA =
              T.let(
                :aymara,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            AZERI =
              T.let(
                :azeri,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            BASQUE =
              T.let(
                :basque,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            BELARUSIAN =
              T.let(
                :belarusian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            BENGALI =
              T.let(
                :bengali,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            BOSNIAN =
              T.let(
                :bosnian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            BULGARIAN =
              T.let(
                :bulgarian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            BURMESE =
              T.let(
                :burmese,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            CANTONESE =
              T.let(
                :cantonese,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            CATALAN =
              T.let(
                :catalan,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            CEBUANO =
              T.let(
                :cebuano,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            CHINESE =
              T.let(
                :chinese,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            CORSICAN =
              T.let(
                :corsican,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            CROATIAN =
              T.let(
                :croatian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            CZECH =
              T.let(
                :czech,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            DANISH =
              T.let(
                :danish,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            DUTCH =
              T.let(
                :dutch,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            ENGLISH =
              T.let(
                :english,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            ESPERANTO =
              T.let(
                :esperanto,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            ESTONIAN =
              T.let(
                :estonian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            FARSI =
              T.let(
                :farsi,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            FIJIAN =
              T.let(
                :fijian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            FINNISH =
              T.let(
                :finnish,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            FRENCH =
              T.let(
                :french,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            GALICIAN =
              T.let(
                :galician,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            GEORGIAN =
              T.let(
                :georgian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            GERMAN =
              T.let(
                :german,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            GREEK =
              T.let(
                :greek,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            GUARANI =
              T.let(
                :guarani,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            GUJARATI =
              T.let(
                :gujarati,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            HAITIAN_CREOLE =
              T.let(
                :"haitian-creole",
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            HAUSA =
              T.let(
                :hausa,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            HAWAIIAN =
              T.let(
                :hawaiian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            HEBREW =
              T.let(
                :hebrew,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            HINDI =
              T.let(
                :hindi,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            HMONG =
              T.let(
                :hmong,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            HUNGARIAN =
              T.let(
                :hungarian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            ICELANDIC =
              T.let(
                :icelandic,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            IGBO =
              T.let(
                :igbo,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            INDONESIAN =
              T.let(
                :indonesian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            IRISH =
              T.let(
                :irish,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            ITALIAN =
              T.let(
                :italian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            JAPANESE =
              T.let(
                :japanese,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            JAVANESE =
              T.let(
                :javanese,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            KANNADA =
              T.let(
                :kannada,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            KAZAKH =
              T.let(
                :kazakh,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            KHMER =
              T.let(
                :khmer,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            KINYARWANDA =
              T.let(
                :kinyarwanda,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            KOREAN =
              T.let(
                :korean,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            KURDISH =
              T.let(
                :kurdish,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            KYRGYZ =
              T.let(
                :kyrgyz,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            LAO =
              T.let(
                :lao,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            LATIN =
              T.let(
                :latin,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            LATVIAN =
              T.let(
                :latvian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            LINGALA =
              T.let(
                :lingala,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            LITHUANIAN =
              T.let(
                :lithuanian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            LUXEMBOURGISH =
              T.let(
                :luxembourgish,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            MACEDONIAN =
              T.let(
                :macedonian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            MALAGASY =
              T.let(
                :malagasy,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            MALAY =
              T.let(
                :malay,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            MALAYALAM =
              T.let(
                :malayalam,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            MALTESE =
              T.let(
                :maltese,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            MAORI =
              T.let(
                :maori,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            MARATHI =
              T.let(
                :marathi,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            MONGOLIAN =
              T.let(
                :mongolian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            NEPALI =
              T.let(
                :nepali,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            NORWEGIAN =
              T.let(
                :norwegian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            ODIA =
              T.let(
                :odia,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            OROMO =
              T.let(
                :oromo,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            PASHTO =
              T.let(
                :pashto,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            PIDGIN =
              T.let(
                :pidgin,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            POLISH =
              T.let(
                :polish,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            PORTUGUESE =
              T.let(
                :portuguese,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            PUNJABI =
              T.let(
                :punjabi,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            QUECHUA =
              T.let(
                :quechua,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            ROMANIAN =
              T.let(
                :romanian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            RUSSIAN =
              T.let(
                :russian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            SAMOAN =
              T.let(
                :samoan,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            SCOTTISH_GAELIC =
              T.let(
                :"scottish-gaelic",
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            SERBIAN =
              T.let(
                :serbian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            SESOTHO =
              T.let(
                :sesotho,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            SHONA =
              T.let(
                :shona,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            SINDHI =
              T.let(
                :sindhi,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            SINHALA =
              T.let(
                :sinhala,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            SLOVAK =
              T.let(
                :slovak,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            SLOVENE =
              T.let(
                :slovene,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            SOMALI =
              T.let(
                :somali,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            SPANISH =
              T.let(
                :spanish,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            SUNDANESE =
              T.let(
                :sundanese,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            SWAHILI =
              T.let(
                :swahili,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            SWEDISH =
              T.let(
                :swedish,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            TAGALOG =
              T.let(
                :tagalog,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            TAJIK =
              T.let(
                :tajik,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            TAMIL =
              T.let(
                :tamil,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            TATAR =
              T.let(
                :tatar,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            TELUGU =
              T.let(
                :telugu,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            THAI =
              T.let(
                :thai,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            TIBETAN =
              T.let(
                :tibetan,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            TIGRINYA =
              T.let(
                :tigrinya,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            TONGAN =
              T.let(
                :tongan,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            TSWANA =
              T.let(
                :tswana,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            TURKISH =
              T.let(
                :turkish,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            TURKMEN =
              T.let(
                :turkmen,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            UKRAINIAN =
              T.let(
                :ukrainian,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            URDU =
              T.let(
                :urdu,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            UYGHUR =
              T.let(
                :uyghur,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            UZBEK =
              T.let(
                :uzbek,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            VIETNAMESE =
              T.let(
                :vietnamese,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            WELSH =
              T.let(
                :welsh,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            WOLOF =
              T.let(
                :wolof,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            XHOSA =
              T.let(
                :xhosa,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            YIDDISH =
              T.let(
                :yiddish,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            YORUBA =
              T.let(
                :yoruba,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )
            ZULU =
              T.let(
                :zulu,
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class TimeoutOpts < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::BrandRetrieveParams::Body::ByName::TimeoutOpts,
                  ContextDev::Internal::AnyHash
                )
              end

            # Deadline in milliseconds.
            sig { returns(Integer) }
            attr_accessor :milliseconds

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            sig do
              returns(
                T.nilable(
                  ContextDev::BrandRetrieveParams::Body::ByName::TimeoutOpts::Behavior::OrSymbol
                )
              )
            end
            attr_reader :behavior

            sig do
              params(
                behavior:
                  ContextDev::BrandRetrieveParams::Body::ByName::TimeoutOpts::Behavior::OrSymbol
              ).void
            end
            attr_writer :behavior

            # Request deadline and what to return when it passes.
            sig do
              params(
                milliseconds: Integer,
                behavior:
                  ContextDev::BrandRetrieveParams::Body::ByName::TimeoutOpts::Behavior::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Deadline in milliseconds.
              milliseconds:,
              # "fail" returns 408 at the deadline. "return-partial" returns available results;
              # inspect the response’s partial flag.
              behavior: nil
            )
            end

            sig do
              override.returns(
                {
                  milliseconds: Integer,
                  behavior:
                    ContextDev::BrandRetrieveParams::Body::ByName::TimeoutOpts::Behavior::OrSymbol
                }
              )
            end
            def to_hash
            end

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            module Behavior
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::BrandRetrieveParams::Body::ByName::TimeoutOpts::Behavior
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              FAIL =
                T.let(
                  :fail,
                  ContextDev::BrandRetrieveParams::Body::ByName::TimeoutOpts::Behavior::TaggedSymbol
                )
              RETURN_PARTIAL =
                T.let(
                  :"return-partial",
                  ContextDev::BrandRetrieveParams::Body::ByName::TimeoutOpts::Behavior::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::BrandRetrieveParams::Body::ByName::TimeoutOpts::Behavior::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class ByEmail < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::BrandRetrieveParams::Body::ByEmail,
                ContextDev::Internal::AnyHash
              )
            end

          # Email address to retrieve brand data for (e.g., 'jane@stripe.com').
          sig { returns(String) }
          attr_accessor :email

          # Discriminator for email-based brand retrieval.
          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::OrSymbol
              )
            )
          end
          attr_accessor :force_language

          # Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1
          # year. `0` refreshes.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_age_ms

          sig { params(max_age_ms: Integer).void }
          attr_writer :max_age_ms

          # Optional parameter to optimize the API call for maximum speed. When set to true,
          # the API will skip time-consuming operations for faster response at the cost of
          # less comprehensive data.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :max_speed

          sig { params(max_speed: T::Boolean).void }
          attr_writer :max_speed

          # Labels for filtering usage in the dashboard.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :tags

          sig { params(tags: T::Array[String]).void }
          attr_writer :tags

          # Request deadline and what to return when it passes.
          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::ByEmail::TimeoutOpts
              )
            )
          end
          attr_reader :timeout_opts

          sig do
            params(
              timeout_opts:
                ContextDev::BrandRetrieveParams::Body::ByEmail::TimeoutOpts::OrHash
            ).void
          end
          attr_writer :timeout_opts

          # Retrieve brand data by email address. The domain is extracted from the email.
          # Free and disposable email providers are rejected with 422. Cannot be combined
          # with domain, name, or ticker.
          sig do
            params(
              email: String,
              force_language:
                T.nilable(
                  ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::OrSymbol
                ),
              max_age_ms: Integer,
              max_speed: T::Boolean,
              tags: T::Array[String],
              timeout_opts:
                ContextDev::BrandRetrieveParams::Body::ByEmail::TimeoutOpts::OrHash,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Email address to retrieve brand data for (e.g., 'jane@stripe.com').
            email:,
            force_language: nil,
            # Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1
            # year. `0` refreshes.
            max_age_ms: nil,
            # Optional parameter to optimize the API call for maximum speed. When set to true,
            # the API will skip time-consuming operations for faster response at the cost of
            # less comprehensive data.
            max_speed: nil,
            # Labels for filtering usage in the dashboard.
            tags: nil,
            # Request deadline and what to return when it passes.
            timeout_opts: nil,
            # Discriminator for email-based brand retrieval.
            type: :by_email
          )
          end

          sig do
            override.returns(
              {
                email: String,
                type: Symbol,
                force_language:
                  T.nilable(
                    ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::OrSymbol
                  ),
                max_age_ms: Integer,
                max_speed: T::Boolean,
                tags: T::Array[String],
                timeout_opts:
                  ContextDev::BrandRetrieveParams::Body::ByEmail::TimeoutOpts
              }
            )
          end
          def to_hash
          end

          module ForceLanguage
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AFRIKAANS =
              T.let(
                :afrikaans,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            ALBANIAN =
              T.let(
                :albanian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            AMHARIC =
              T.let(
                :amharic,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            ARABIC =
              T.let(
                :arabic,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            ARMENIAN =
              T.let(
                :armenian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            ASSAMESE =
              T.let(
                :assamese,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            AYMARA =
              T.let(
                :aymara,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            AZERI =
              T.let(
                :azeri,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            BASQUE =
              T.let(
                :basque,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            BELARUSIAN =
              T.let(
                :belarusian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            BENGALI =
              T.let(
                :bengali,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            BOSNIAN =
              T.let(
                :bosnian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            BULGARIAN =
              T.let(
                :bulgarian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            BURMESE =
              T.let(
                :burmese,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            CANTONESE =
              T.let(
                :cantonese,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            CATALAN =
              T.let(
                :catalan,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            CEBUANO =
              T.let(
                :cebuano,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            CHINESE =
              T.let(
                :chinese,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            CORSICAN =
              T.let(
                :corsican,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            CROATIAN =
              T.let(
                :croatian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            CZECH =
              T.let(
                :czech,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            DANISH =
              T.let(
                :danish,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            DUTCH =
              T.let(
                :dutch,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            ENGLISH =
              T.let(
                :english,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            ESPERANTO =
              T.let(
                :esperanto,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            ESTONIAN =
              T.let(
                :estonian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            FARSI =
              T.let(
                :farsi,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            FIJIAN =
              T.let(
                :fijian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            FINNISH =
              T.let(
                :finnish,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            FRENCH =
              T.let(
                :french,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            GALICIAN =
              T.let(
                :galician,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            GEORGIAN =
              T.let(
                :georgian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            GERMAN =
              T.let(
                :german,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            GREEK =
              T.let(
                :greek,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            GUARANI =
              T.let(
                :guarani,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            GUJARATI =
              T.let(
                :gujarati,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            HAITIAN_CREOLE =
              T.let(
                :"haitian-creole",
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            HAUSA =
              T.let(
                :hausa,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            HAWAIIAN =
              T.let(
                :hawaiian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            HEBREW =
              T.let(
                :hebrew,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            HINDI =
              T.let(
                :hindi,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            HMONG =
              T.let(
                :hmong,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            HUNGARIAN =
              T.let(
                :hungarian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            ICELANDIC =
              T.let(
                :icelandic,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            IGBO =
              T.let(
                :igbo,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            INDONESIAN =
              T.let(
                :indonesian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            IRISH =
              T.let(
                :irish,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            ITALIAN =
              T.let(
                :italian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            JAPANESE =
              T.let(
                :japanese,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            JAVANESE =
              T.let(
                :javanese,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            KANNADA =
              T.let(
                :kannada,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            KAZAKH =
              T.let(
                :kazakh,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            KHMER =
              T.let(
                :khmer,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            KINYARWANDA =
              T.let(
                :kinyarwanda,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            KOREAN =
              T.let(
                :korean,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            KURDISH =
              T.let(
                :kurdish,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            KYRGYZ =
              T.let(
                :kyrgyz,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            LAO =
              T.let(
                :lao,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            LATIN =
              T.let(
                :latin,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            LATVIAN =
              T.let(
                :latvian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            LINGALA =
              T.let(
                :lingala,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            LITHUANIAN =
              T.let(
                :lithuanian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            LUXEMBOURGISH =
              T.let(
                :luxembourgish,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            MACEDONIAN =
              T.let(
                :macedonian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            MALAGASY =
              T.let(
                :malagasy,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            MALAY =
              T.let(
                :malay,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            MALAYALAM =
              T.let(
                :malayalam,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            MALTESE =
              T.let(
                :maltese,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            MAORI =
              T.let(
                :maori,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            MARATHI =
              T.let(
                :marathi,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            MONGOLIAN =
              T.let(
                :mongolian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            NEPALI =
              T.let(
                :nepali,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            NORWEGIAN =
              T.let(
                :norwegian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            ODIA =
              T.let(
                :odia,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            OROMO =
              T.let(
                :oromo,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            PASHTO =
              T.let(
                :pashto,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            PIDGIN =
              T.let(
                :pidgin,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            POLISH =
              T.let(
                :polish,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            PORTUGUESE =
              T.let(
                :portuguese,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            PUNJABI =
              T.let(
                :punjabi,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            QUECHUA =
              T.let(
                :quechua,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            ROMANIAN =
              T.let(
                :romanian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            RUSSIAN =
              T.let(
                :russian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            SAMOAN =
              T.let(
                :samoan,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            SCOTTISH_GAELIC =
              T.let(
                :"scottish-gaelic",
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            SERBIAN =
              T.let(
                :serbian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            SESOTHO =
              T.let(
                :sesotho,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            SHONA =
              T.let(
                :shona,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            SINDHI =
              T.let(
                :sindhi,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            SINHALA =
              T.let(
                :sinhala,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            SLOVAK =
              T.let(
                :slovak,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            SLOVENE =
              T.let(
                :slovene,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            SOMALI =
              T.let(
                :somali,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            SPANISH =
              T.let(
                :spanish,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            SUNDANESE =
              T.let(
                :sundanese,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            SWAHILI =
              T.let(
                :swahili,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            SWEDISH =
              T.let(
                :swedish,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            TAGALOG =
              T.let(
                :tagalog,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            TAJIK =
              T.let(
                :tajik,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            TAMIL =
              T.let(
                :tamil,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            TATAR =
              T.let(
                :tatar,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            TELUGU =
              T.let(
                :telugu,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            THAI =
              T.let(
                :thai,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            TIBETAN =
              T.let(
                :tibetan,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            TIGRINYA =
              T.let(
                :tigrinya,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            TONGAN =
              T.let(
                :tongan,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            TSWANA =
              T.let(
                :tswana,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            TURKISH =
              T.let(
                :turkish,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            TURKMEN =
              T.let(
                :turkmen,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            UKRAINIAN =
              T.let(
                :ukrainian,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            URDU =
              T.let(
                :urdu,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            UYGHUR =
              T.let(
                :uyghur,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            UZBEK =
              T.let(
                :uzbek,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            VIETNAMESE =
              T.let(
                :vietnamese,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            WELSH =
              T.let(
                :welsh,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            WOLOF =
              T.let(
                :wolof,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            XHOSA =
              T.let(
                :xhosa,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            YIDDISH =
              T.let(
                :yiddish,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            YORUBA =
              T.let(
                :yoruba,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )
            ZULU =
              T.let(
                :zulu,
                ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class TimeoutOpts < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::BrandRetrieveParams::Body::ByEmail::TimeoutOpts,
                  ContextDev::Internal::AnyHash
                )
              end

            # Deadline in milliseconds.
            sig { returns(Integer) }
            attr_accessor :milliseconds

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            sig do
              returns(
                T.nilable(
                  ContextDev::BrandRetrieveParams::Body::ByEmail::TimeoutOpts::Behavior::OrSymbol
                )
              )
            end
            attr_reader :behavior

            sig do
              params(
                behavior:
                  ContextDev::BrandRetrieveParams::Body::ByEmail::TimeoutOpts::Behavior::OrSymbol
              ).void
            end
            attr_writer :behavior

            # Request deadline and what to return when it passes.
            sig do
              params(
                milliseconds: Integer,
                behavior:
                  ContextDev::BrandRetrieveParams::Body::ByEmail::TimeoutOpts::Behavior::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Deadline in milliseconds.
              milliseconds:,
              # "fail" returns 408 at the deadline. "return-partial" returns available results;
              # inspect the response’s partial flag.
              behavior: nil
            )
            end

            sig do
              override.returns(
                {
                  milliseconds: Integer,
                  behavior:
                    ContextDev::BrandRetrieveParams::Body::ByEmail::TimeoutOpts::Behavior::OrSymbol
                }
              )
            end
            def to_hash
            end

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            module Behavior
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::BrandRetrieveParams::Body::ByEmail::TimeoutOpts::Behavior
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              FAIL =
                T.let(
                  :fail,
                  ContextDev::BrandRetrieveParams::Body::ByEmail::TimeoutOpts::Behavior::TaggedSymbol
                )
              RETURN_PARTIAL =
                T.let(
                  :"return-partial",
                  ContextDev::BrandRetrieveParams::Body::ByEmail::TimeoutOpts::Behavior::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::BrandRetrieveParams::Body::ByEmail::TimeoutOpts::Behavior::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class ByTicker < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::BrandRetrieveParams::Body::ByTicker,
                ContextDev::Internal::AnyHash
              )
            end

          # Stock ticker symbol to retrieve brand data for (e.g., 'AAPL').
          sig { returns(String) }
          attr_accessor :ticker

          # Discriminator for ticker-based brand retrieval.
          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::OrSymbol
              )
            )
          end
          attr_accessor :force_language

          # Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1
          # year. `0` refreshes.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_age_ms

          sig { params(max_age_ms: Integer).void }
          attr_writer :max_age_ms

          # Optional parameter to optimize the API call for maximum speed. When set to true,
          # the API will skip time-consuming operations for faster response at the cost of
          # less comprehensive data.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :max_speed

          sig { params(max_speed: T::Boolean).void }
          attr_writer :max_speed

          # Labels for filtering usage in the dashboard.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :tags

          sig { params(tags: T::Array[String]).void }
          attr_writer :tags

          # Stock exchange code.
          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::OrSymbol
              )
            )
          end
          attr_reader :ticker_exchange

          sig do
            params(
              ticker_exchange:
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::OrSymbol
            ).void
          end
          attr_writer :ticker_exchange

          # Request deadline and what to return when it passes.
          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::ByTicker::TimeoutOpts
              )
            )
          end
          attr_reader :timeout_opts

          sig do
            params(
              timeout_opts:
                ContextDev::BrandRetrieveParams::Body::ByTicker::TimeoutOpts::OrHash
            ).void
          end
          attr_writer :timeout_opts

          # Retrieve brand data by stock ticker. Cannot be combined with domain, name, or
          # email.
          sig do
            params(
              ticker: String,
              force_language:
                T.nilable(
                  ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::OrSymbol
                ),
              max_age_ms: Integer,
              max_speed: T::Boolean,
              tags: T::Array[String],
              ticker_exchange:
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::OrSymbol,
              timeout_opts:
                ContextDev::BrandRetrieveParams::Body::ByTicker::TimeoutOpts::OrHash,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Stock ticker symbol to retrieve brand data for (e.g., 'AAPL').
            ticker:,
            force_language: nil,
            # Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1
            # year. `0` refreshes.
            max_age_ms: nil,
            # Optional parameter to optimize the API call for maximum speed. When set to true,
            # the API will skip time-consuming operations for faster response at the cost of
            # less comprehensive data.
            max_speed: nil,
            # Labels for filtering usage in the dashboard.
            tags: nil,
            # Stock exchange code.
            ticker_exchange: nil,
            # Request deadline and what to return when it passes.
            timeout_opts: nil,
            # Discriminator for ticker-based brand retrieval.
            type: :by_ticker
          )
          end

          sig do
            override.returns(
              {
                ticker: String,
                type: Symbol,
                force_language:
                  T.nilable(
                    ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::OrSymbol
                  ),
                max_age_ms: Integer,
                max_speed: T::Boolean,
                tags: T::Array[String],
                ticker_exchange:
                  ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::OrSymbol,
                timeout_opts:
                  ContextDev::BrandRetrieveParams::Body::ByTicker::TimeoutOpts
              }
            )
          end
          def to_hash
          end

          module ForceLanguage
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AFRIKAANS =
              T.let(
                :afrikaans,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            ALBANIAN =
              T.let(
                :albanian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            AMHARIC =
              T.let(
                :amharic,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            ARABIC =
              T.let(
                :arabic,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            ARMENIAN =
              T.let(
                :armenian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            ASSAMESE =
              T.let(
                :assamese,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            AYMARA =
              T.let(
                :aymara,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            AZERI =
              T.let(
                :azeri,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            BASQUE =
              T.let(
                :basque,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            BELARUSIAN =
              T.let(
                :belarusian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            BENGALI =
              T.let(
                :bengali,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            BOSNIAN =
              T.let(
                :bosnian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            BULGARIAN =
              T.let(
                :bulgarian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            BURMESE =
              T.let(
                :burmese,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            CANTONESE =
              T.let(
                :cantonese,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            CATALAN =
              T.let(
                :catalan,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            CEBUANO =
              T.let(
                :cebuano,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            CHINESE =
              T.let(
                :chinese,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            CORSICAN =
              T.let(
                :corsican,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            CROATIAN =
              T.let(
                :croatian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            CZECH =
              T.let(
                :czech,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            DANISH =
              T.let(
                :danish,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            DUTCH =
              T.let(
                :dutch,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            ENGLISH =
              T.let(
                :english,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            ESPERANTO =
              T.let(
                :esperanto,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            ESTONIAN =
              T.let(
                :estonian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            FARSI =
              T.let(
                :farsi,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            FIJIAN =
              T.let(
                :fijian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            FINNISH =
              T.let(
                :finnish,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            FRENCH =
              T.let(
                :french,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            GALICIAN =
              T.let(
                :galician,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            GEORGIAN =
              T.let(
                :georgian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            GERMAN =
              T.let(
                :german,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            GREEK =
              T.let(
                :greek,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            GUARANI =
              T.let(
                :guarani,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            GUJARATI =
              T.let(
                :gujarati,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            HAITIAN_CREOLE =
              T.let(
                :"haitian-creole",
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            HAUSA =
              T.let(
                :hausa,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            HAWAIIAN =
              T.let(
                :hawaiian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            HEBREW =
              T.let(
                :hebrew,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            HINDI =
              T.let(
                :hindi,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            HMONG =
              T.let(
                :hmong,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            HUNGARIAN =
              T.let(
                :hungarian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            ICELANDIC =
              T.let(
                :icelandic,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            IGBO =
              T.let(
                :igbo,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            INDONESIAN =
              T.let(
                :indonesian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            IRISH =
              T.let(
                :irish,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            ITALIAN =
              T.let(
                :italian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            JAPANESE =
              T.let(
                :japanese,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            JAVANESE =
              T.let(
                :javanese,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            KANNADA =
              T.let(
                :kannada,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            KAZAKH =
              T.let(
                :kazakh,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            KHMER =
              T.let(
                :khmer,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            KINYARWANDA =
              T.let(
                :kinyarwanda,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            KOREAN =
              T.let(
                :korean,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            KURDISH =
              T.let(
                :kurdish,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            KYRGYZ =
              T.let(
                :kyrgyz,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            LAO =
              T.let(
                :lao,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            LATIN =
              T.let(
                :latin,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            LATVIAN =
              T.let(
                :latvian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            LINGALA =
              T.let(
                :lingala,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            LITHUANIAN =
              T.let(
                :lithuanian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            LUXEMBOURGISH =
              T.let(
                :luxembourgish,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            MACEDONIAN =
              T.let(
                :macedonian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            MALAGASY =
              T.let(
                :malagasy,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            MALAY =
              T.let(
                :malay,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            MALAYALAM =
              T.let(
                :malayalam,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            MALTESE =
              T.let(
                :maltese,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            MAORI =
              T.let(
                :maori,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            MARATHI =
              T.let(
                :marathi,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            MONGOLIAN =
              T.let(
                :mongolian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            NEPALI =
              T.let(
                :nepali,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            NORWEGIAN =
              T.let(
                :norwegian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            ODIA =
              T.let(
                :odia,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            OROMO =
              T.let(
                :oromo,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            PASHTO =
              T.let(
                :pashto,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            PIDGIN =
              T.let(
                :pidgin,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            POLISH =
              T.let(
                :polish,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            PORTUGUESE =
              T.let(
                :portuguese,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            PUNJABI =
              T.let(
                :punjabi,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            QUECHUA =
              T.let(
                :quechua,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            ROMANIAN =
              T.let(
                :romanian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            RUSSIAN =
              T.let(
                :russian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            SAMOAN =
              T.let(
                :samoan,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            SCOTTISH_GAELIC =
              T.let(
                :"scottish-gaelic",
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            SERBIAN =
              T.let(
                :serbian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            SESOTHO =
              T.let(
                :sesotho,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            SHONA =
              T.let(
                :shona,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            SINDHI =
              T.let(
                :sindhi,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            SINHALA =
              T.let(
                :sinhala,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            SLOVAK =
              T.let(
                :slovak,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            SLOVENE =
              T.let(
                :slovene,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            SOMALI =
              T.let(
                :somali,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            SPANISH =
              T.let(
                :spanish,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            SUNDANESE =
              T.let(
                :sundanese,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            SWAHILI =
              T.let(
                :swahili,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            SWEDISH =
              T.let(
                :swedish,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            TAGALOG =
              T.let(
                :tagalog,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            TAJIK =
              T.let(
                :tajik,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            TAMIL =
              T.let(
                :tamil,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            TATAR =
              T.let(
                :tatar,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            TELUGU =
              T.let(
                :telugu,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            THAI =
              T.let(
                :thai,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            TIBETAN =
              T.let(
                :tibetan,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            TIGRINYA =
              T.let(
                :tigrinya,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            TONGAN =
              T.let(
                :tongan,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            TSWANA =
              T.let(
                :tswana,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            TURKISH =
              T.let(
                :turkish,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            TURKMEN =
              T.let(
                :turkmen,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            UKRAINIAN =
              T.let(
                :ukrainian,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            URDU =
              T.let(
                :urdu,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            UYGHUR =
              T.let(
                :uyghur,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            UZBEK =
              T.let(
                :uzbek,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            VIETNAMESE =
              T.let(
                :vietnamese,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            WELSH =
              T.let(
                :welsh,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            WOLOF =
              T.let(
                :wolof,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            XHOSA =
              T.let(
                :xhosa,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            YIDDISH =
              T.let(
                :yiddish,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            YORUBA =
              T.let(
                :yoruba,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )
            ZULU =
              T.let(
                :zulu,
                ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Stock exchange code.
          module TickerExchange
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AMEX =
              T.let(
                :AMEX,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            AMS =
              T.let(
                :AMS,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            AQS =
              T.let(
                :AQS,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            ASX =
              T.let(
                :ASX,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            ATH =
              T.let(
                :ATH,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            BER =
              T.let(
                :BER,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            BME =
              T.let(
                :BME,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            BRU =
              T.let(
                :BRU,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            BSE =
              T.let(
                :BSE,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            BUD =
              T.let(
                :BUD,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            BUE =
              T.let(
                :BUE,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            BVC =
              T.let(
                :BVC,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            CBOE =
              T.let(
                :CBOE,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            CNQ =
              T.let(
                :CNQ,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            CPH =
              T.let(
                :CPH,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            DFM =
              T.let(
                :DFM,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            DOH =
              T.let(
                :DOH,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            DUB =
              T.let(
                :DUB,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            DUS =
              T.let(
                :DUS,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            DXE =
              T.let(
                :DXE,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            EGX =
              T.let(
                :EGX,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            FSX =
              T.let(
                :FSX,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            HAM =
              T.let(
                :HAM,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            HEL =
              T.let(
                :HEL,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            HKSE =
              T.let(
                :HKSE,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            HOSE =
              T.let(
                :HOSE,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            ICE =
              T.let(
                :ICE,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            IOB =
              T.let(
                :IOB,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            IST =
              T.let(
                :IST,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            JKT =
              T.let(
                :JKT,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            JNB =
              T.let(
                :JNB,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            JPX =
              T.let(
                :JPX,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            KLS =
              T.let(
                :KLS,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            KOE =
              T.let(
                :KOE,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            KSC =
              T.let(
                :KSC,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            KUW =
              T.let(
                :KUW,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            LIS =
              T.let(
                :LIS,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            LSE =
              T.let(
                :LSE,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            MCX =
              T.let(
                :MCX,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            MEX =
              T.let(
                :MEX,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            MIL =
              T.let(
                :MIL,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            MUN =
              T.let(
                :MUN,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            NASDAQ =
              T.let(
                :NASDAQ,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            NEO =
              T.let(
                :NEO,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            NSE =
              T.let(
                :NSE,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            NYSE =
              T.let(
                :NYSE,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            NZE =
              T.let(
                :NZE,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            OSL =
              T.let(
                :OSL,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            OTC =
              T.let(
                :OTC,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            PAR =
              T.let(
                :PAR,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            PNK =
              T.let(
                :PNK,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            PRA =
              T.let(
                :PRA,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            RIS =
              T.let(
                :RIS,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            SAO =
              T.let(
                :SAO,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            SAU =
              T.let(
                :SAU,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            SES =
              T.let(
                :SES,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            SET =
              T.let(
                :SET,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            SGO =
              T.let(
                :SGO,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            SHH =
              T.let(
                :SHH,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            SHZ =
              T.let(
                :SHZ,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            SIX =
              T.let(
                :SIX,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            STO =
              T.let(
                :STO,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            STU =
              T.let(
                :STU,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            TAI =
              T.let(
                :TAI,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            TAL =
              T.let(
                :TAL,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            TLV =
              T.let(
                :TLV,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            TSX =
              T.let(
                :TSX,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            TSXV =
              T.let(
                :TSXV,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            TWO =
              T.let(
                :TWO,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            VIE =
              T.let(
                :VIE,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            WSE =
              T.let(
                :WSE,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )
            XETRA =
              T.let(
                :XETRA,
                ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class TimeoutOpts < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::BrandRetrieveParams::Body::ByTicker::TimeoutOpts,
                  ContextDev::Internal::AnyHash
                )
              end

            # Deadline in milliseconds.
            sig { returns(Integer) }
            attr_accessor :milliseconds

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            sig do
              returns(
                T.nilable(
                  ContextDev::BrandRetrieveParams::Body::ByTicker::TimeoutOpts::Behavior::OrSymbol
                )
              )
            end
            attr_reader :behavior

            sig do
              params(
                behavior:
                  ContextDev::BrandRetrieveParams::Body::ByTicker::TimeoutOpts::Behavior::OrSymbol
              ).void
            end
            attr_writer :behavior

            # Request deadline and what to return when it passes.
            sig do
              params(
                milliseconds: Integer,
                behavior:
                  ContextDev::BrandRetrieveParams::Body::ByTicker::TimeoutOpts::Behavior::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Deadline in milliseconds.
              milliseconds:,
              # "fail" returns 408 at the deadline. "return-partial" returns available results;
              # inspect the response’s partial flag.
              behavior: nil
            )
            end

            sig do
              override.returns(
                {
                  milliseconds: Integer,
                  behavior:
                    ContextDev::BrandRetrieveParams::Body::ByTicker::TimeoutOpts::Behavior::OrSymbol
                }
              )
            end
            def to_hash
            end

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            module Behavior
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::BrandRetrieveParams::Body::ByTicker::TimeoutOpts::Behavior
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              FAIL =
                T.let(
                  :fail,
                  ContextDev::BrandRetrieveParams::Body::ByTicker::TimeoutOpts::Behavior::TaggedSymbol
                )
              RETURN_PARTIAL =
                T.let(
                  :"return-partial",
                  ContextDev::BrandRetrieveParams::Body::ByTicker::TimeoutOpts::Behavior::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::BrandRetrieveParams::Body::ByTicker::TimeoutOpts::Behavior::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class ByDirectURL < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::BrandRetrieveParams::Body::ByDirectURL,
                ContextDev::Internal::AnyHash
              )
            end

          # Full http(s) URL to fetch brand data from (e.g.,
          # 'https://stripe.com/enterprise'). Only this URL is fetched — not the entire
          # internet.
          sig { returns(String) }
          attr_accessor :direct_url

          # Discriminator for direct-URL-based brand retrieval.
          sig { returns(Symbol) }
          attr_accessor :type

          # Labels for filtering usage in the dashboard.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :tags

          sig { params(tags: T::Array[String]).void }
          attr_writer :tags

          # Request deadline and what to return when it passes.
          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts
              )
            )
          end
          attr_reader :timeout_opts

          sig do
            params(
              timeout_opts:
                ContextDev::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts::OrHash
            ).void
          end
          attr_writer :timeout_opts

          # Retrieve brand data from this exact URL. Cross-site enrichment and other lookup
          # identifiers are excluded.
          sig do
            params(
              direct_url: String,
              tags: T::Array[String],
              timeout_opts:
                ContextDev::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts::OrHash,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Full http(s) URL to fetch brand data from (e.g.,
            # 'https://stripe.com/enterprise'). Only this URL is fetched — not the entire
            # internet.
            direct_url:,
            # Labels for filtering usage in the dashboard.
            tags: nil,
            # Request deadline and what to return when it passes.
            timeout_opts: nil,
            # Discriminator for direct-URL-based brand retrieval.
            type: :by_direct_url
          )
          end

          sig do
            override.returns(
              {
                direct_url: String,
                type: Symbol,
                tags: T::Array[String],
                timeout_opts:
                  ContextDev::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts
              }
            )
          end
          def to_hash
          end

          class TimeoutOpts < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts,
                  ContextDev::Internal::AnyHash
                )
              end

            # Deadline in milliseconds.
            sig { returns(Integer) }
            attr_accessor :milliseconds

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            sig do
              returns(
                T.nilable(
                  ContextDev::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts::Behavior::OrSymbol
                )
              )
            end
            attr_reader :behavior

            sig do
              params(
                behavior:
                  ContextDev::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts::Behavior::OrSymbol
              ).void
            end
            attr_writer :behavior

            # Request deadline and what to return when it passes.
            sig do
              params(
                milliseconds: Integer,
                behavior:
                  ContextDev::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts::Behavior::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Deadline in milliseconds.
              milliseconds:,
              # "fail" returns 408 at the deadline. "return-partial" returns available results;
              # inspect the response’s partial flag.
              behavior: nil
            )
            end

            sig do
              override.returns(
                {
                  milliseconds: Integer,
                  behavior:
                    ContextDev::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts::Behavior::OrSymbol
                }
              )
            end
            def to_hash
            end

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            module Behavior
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts::Behavior
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              FAIL =
                T.let(
                  :fail,
                  ContextDev::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts::Behavior::TaggedSymbol
                )
              RETURN_PARTIAL =
                T.let(
                  :"return-partial",
                  ContextDev::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts::Behavior::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts::Behavior::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class ByTransaction < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::BrandRetrieveParams::Body::ByTransaction,
                ContextDev::Internal::AnyHash
              )
            end

          # Transaction information to identify the brand.
          sig { returns(String) }
          attr_accessor :transaction_info

          # Discriminator for transaction-based brand retrieval.
          sig { returns(Symbol) }
          attr_accessor :type

          # Optional city name to prioritize when searching for the brand.
          sig { returns(T.nilable(String)) }
          attr_reader :city

          sig { params(city: String).void }
          attr_writer :city

          # Two-letter ISO 3166-1 alpha-2 country code (GL parameter) used to localize
          # search.
          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::OrSymbol
              )
            )
          end
          attr_reader :country_gl

          sig do
            params(
              country_gl:
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::OrSymbol
            ).void
          end
          attr_writer :country_gl

          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::OrSymbol
              )
            )
          end
          attr_accessor :force_language

          # When set to true, the API performs additional verification to ensure the
          # identified brand matches the transaction with high confidence.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :high_confidence_only

          sig { params(high_confidence_only: T::Boolean).void }
          attr_writer :high_confidence_only

          # Optional parameter to optimize the API call for maximum speed. When set to true,
          # the API will skip time-consuming operations for faster response at the cost of
          # less comprehensive data.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :max_speed

          sig { params(max_speed: T::Boolean).void }
          attr_writer :max_speed

          # Optional Merchant Category Code (MCC) to help identify the business category or
          # industry.
          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::ByTransaction::Mcc::Variants
              )
            )
          end
          attr_reader :mcc

          sig do
            params(
              mcc:
                ContextDev::BrandRetrieveParams::Body::ByTransaction::Mcc::Variants
            ).void
          end
          attr_writer :mcc

          # Optional phone number from the transaction to help verify brand match.
          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::ByTransaction::Phone::Variants
              )
            )
          end
          attr_reader :phone

          sig do
            params(
              phone:
                ContextDev::BrandRetrieveParams::Body::ByTransaction::Phone::Variants
            ).void
          end
          attr_writer :phone

          # Labels for filtering usage in the dashboard.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :tags

          sig { params(tags: T::Array[String]).void }
          attr_writer :tags

          # Request deadline and what to return when it passes.
          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts
              )
            )
          end
          attr_reader :timeout_opts

          sig do
            params(
              timeout_opts:
                ContextDev::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts::OrHash
            ).void
          end
          attr_writer :timeout_opts

          # Identify brand data from a transaction descriptor. Cannot be combined with
          # domain, name, email, or ticker.
          sig do
            params(
              transaction_info: String,
              city: String,
              country_gl:
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::OrSymbol,
              force_language:
                T.nilable(
                  ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::OrSymbol
                ),
              high_confidence_only: T::Boolean,
              max_speed: T::Boolean,
              mcc:
                ContextDev::BrandRetrieveParams::Body::ByTransaction::Mcc::Variants,
              phone:
                ContextDev::BrandRetrieveParams::Body::ByTransaction::Phone::Variants,
              tags: T::Array[String],
              timeout_opts:
                ContextDev::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts::OrHash,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Transaction information to identify the brand.
            transaction_info:,
            # Optional city name to prioritize when searching for the brand.
            city: nil,
            # Two-letter ISO 3166-1 alpha-2 country code (GL parameter) used to localize
            # search.
            country_gl: nil,
            force_language: nil,
            # When set to true, the API performs additional verification to ensure the
            # identified brand matches the transaction with high confidence.
            high_confidence_only: nil,
            # Optional parameter to optimize the API call for maximum speed. When set to true,
            # the API will skip time-consuming operations for faster response at the cost of
            # less comprehensive data.
            max_speed: nil,
            # Optional Merchant Category Code (MCC) to help identify the business category or
            # industry.
            mcc: nil,
            # Optional phone number from the transaction to help verify brand match.
            phone: nil,
            # Labels for filtering usage in the dashboard.
            tags: nil,
            # Request deadline and what to return when it passes.
            timeout_opts: nil,
            # Discriminator for transaction-based brand retrieval.
            type: :by_transaction
          )
          end

          sig do
            override.returns(
              {
                transaction_info: String,
                type: Symbol,
                city: String,
                country_gl:
                  ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::OrSymbol,
                force_language:
                  T.nilable(
                    ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::OrSymbol
                  ),
                high_confidence_only: T::Boolean,
                max_speed: T::Boolean,
                mcc:
                  ContextDev::BrandRetrieveParams::Body::ByTransaction::Mcc::Variants,
                phone:
                  ContextDev::BrandRetrieveParams::Body::ByTransaction::Phone::Variants,
                tags: T::Array[String],
                timeout_opts:
                  ContextDev::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts
              }
            )
          end
          def to_hash
          end

          # Two-letter ISO 3166-1 alpha-2 country code (GL parameter) used to localize
          # search.
          module CountryGl
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AF =
              T.let(
                :af,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            AL =
              T.let(
                :al,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            DZ =
              T.let(
                :dz,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            AS =
              T.let(
                :as,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            AD =
              T.let(
                :ad,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            AO =
              T.let(
                :ao,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            AI =
              T.let(
                :ai,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            AQ =
              T.let(
                :aq,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            AG =
              T.let(
                :ag,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            AR =
              T.let(
                :ar,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            AM =
              T.let(
                :am,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            AW =
              T.let(
                :aw,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            AU =
              T.let(
                :au,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            AT =
              T.let(
                :at,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            AZ =
              T.let(
                :az,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BS =
              T.let(
                :bs,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BH =
              T.let(
                :bh,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BD =
              T.let(
                :bd,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BB =
              T.let(
                :bb,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BY =
              T.let(
                :by,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BE =
              T.let(
                :be,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BZ =
              T.let(
                :bz,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BJ =
              T.let(
                :bj,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BM =
              T.let(
                :bm,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BT =
              T.let(
                :bt,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BO =
              T.let(
                :bo,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BA =
              T.let(
                :ba,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BW =
              T.let(
                :bw,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BV =
              T.let(
                :bv,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BR =
              T.let(
                :br,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            IO =
              T.let(
                :io,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BN =
              T.let(
                :bn,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BG =
              T.let(
                :bg,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BF =
              T.let(
                :bf,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            BI =
              T.let(
                :bi,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            KH =
              T.let(
                :kh,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CM =
              T.let(
                :cm,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CA =
              T.let(
                :ca,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CV =
              T.let(
                :cv,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            KY =
              T.let(
                :ky,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CF =
              T.let(
                :cf,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            TD =
              T.let(
                :td,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CL =
              T.let(
                :cl,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CN =
              T.let(
                :cn,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CX =
              T.let(
                :cx,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CC =
              T.let(
                :cc,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CO =
              T.let(
                :co,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            KM =
              T.let(
                :km,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CG =
              T.let(
                :cg,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CD =
              T.let(
                :cd,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CK =
              T.let(
                :ck,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CR =
              T.let(
                :cr,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CI =
              T.let(
                :ci,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            HR =
              T.let(
                :hr,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CU =
              T.let(
                :cu,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CY =
              T.let(
                :cy,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CZ =
              T.let(
                :cz,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            DK =
              T.let(
                :dk,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            DJ =
              T.let(
                :dj,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            DM =
              T.let(
                :dm,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            DO =
              T.let(
                :do,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            EC =
              T.let(
                :ec,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            EG =
              T.let(
                :eg,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SV =
              T.let(
                :sv,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GQ =
              T.let(
                :gq,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            ER =
              T.let(
                :er,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            EE =
              T.let(
                :ee,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            ET =
              T.let(
                :et,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            FK =
              T.let(
                :fk,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            FO =
              T.let(
                :fo,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            FJ =
              T.let(
                :fj,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            FI =
              T.let(
                :fi,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            FR =
              T.let(
                :fr,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GF =
              T.let(
                :gf,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            PF =
              T.let(
                :pf,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            TF =
              T.let(
                :tf,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GA =
              T.let(
                :ga,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GM =
              T.let(
                :gm,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GE =
              T.let(
                :ge,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            DE =
              T.let(
                :de,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GH =
              T.let(
                :gh,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GI =
              T.let(
                :gi,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GR =
              T.let(
                :gr,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GL =
              T.let(
                :gl,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GD =
              T.let(
                :gd,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GP =
              T.let(
                :gp,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GU =
              T.let(
                :gu,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GT =
              T.let(
                :gt,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GN =
              T.let(
                :gn,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GW =
              T.let(
                :gw,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GY =
              T.let(
                :gy,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            HT =
              T.let(
                :ht,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            HM =
              T.let(
                :hm,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            VA =
              T.let(
                :va,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            HN =
              T.let(
                :hn,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            HK =
              T.let(
                :hk,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            HU =
              T.let(
                :hu,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            IS =
              T.let(
                :is,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            IN =
              T.let(
                :in,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            ID =
              T.let(
                :id,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            IR =
              T.let(
                :ir,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            IQ =
              T.let(
                :iq,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            IE =
              T.let(
                :ie,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            IL =
              T.let(
                :il,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            IT =
              T.let(
                :it,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            JM =
              T.let(
                :jm,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            JP =
              T.let(
                :jp,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            JO =
              T.let(
                :jo,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            KZ =
              T.let(
                :kz,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            KE =
              T.let(
                :ke,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            KI =
              T.let(
                :ki,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            KP =
              T.let(
                :kp,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            KR =
              T.let(
                :kr,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            KW =
              T.let(
                :kw,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            KG =
              T.let(
                :kg,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            LA =
              T.let(
                :la,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            LV =
              T.let(
                :lv,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            LB =
              T.let(
                :lb,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            LS =
              T.let(
                :ls,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            LR =
              T.let(
                :lr,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            LY =
              T.let(
                :ly,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            LI =
              T.let(
                :li,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            LT =
              T.let(
                :lt,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            LU =
              T.let(
                :lu,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MO =
              T.let(
                :mo,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MK =
              T.let(
                :mk,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MG =
              T.let(
                :mg,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MW =
              T.let(
                :mw,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MY =
              T.let(
                :my,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MV =
              T.let(
                :mv,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            ML =
              T.let(
                :ml,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MT =
              T.let(
                :mt,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MH =
              T.let(
                :mh,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MQ =
              T.let(
                :mq,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MR =
              T.let(
                :mr,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MU =
              T.let(
                :mu,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            YT =
              T.let(
                :yt,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MX =
              T.let(
                :mx,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            FM =
              T.let(
                :fm,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MD =
              T.let(
                :md,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MC =
              T.let(
                :mc,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MN =
              T.let(
                :mn,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MS =
              T.let(
                :ms,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MA =
              T.let(
                :ma,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MZ =
              T.let(
                :mz,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MM =
              T.let(
                :mm,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            NA =
              T.let(
                :na,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            NR =
              T.let(
                :nr,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            NP =
              T.let(
                :np,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            NL =
              T.let(
                :nl,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            AN =
              T.let(
                :an,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            NC =
              T.let(
                :nc,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            NZ =
              T.let(
                :nz,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            NI =
              T.let(
                :ni,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            NE =
              T.let(
                :ne,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            NG =
              T.let(
                :ng,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            NU =
              T.let(
                :nu,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            NF =
              T.let(
                :nf,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            MP =
              T.let(
                :mp,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            NO =
              T.let(
                :no,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            OM =
              T.let(
                :om,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            PK =
              T.let(
                :pk,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            PW =
              T.let(
                :pw,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            PS =
              T.let(
                :ps,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            PA =
              T.let(
                :pa,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            PG =
              T.let(
                :pg,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            PY =
              T.let(
                :py,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            PE =
              T.let(
                :pe,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            PH =
              T.let(
                :ph,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            PN =
              T.let(
                :pn,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            PL =
              T.let(
                :pl,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            PT =
              T.let(
                :pt,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            PR =
              T.let(
                :pr,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            QA =
              T.let(
                :qa,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            RE =
              T.let(
                :re,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            RO =
              T.let(
                :ro,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            RU =
              T.let(
                :ru,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            RW =
              T.let(
                :rw,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SH =
              T.let(
                :sh,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            KN =
              T.let(
                :kn,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            LC =
              T.let(
                :lc,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            PM =
              T.let(
                :pm,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            VC =
              T.let(
                :vc,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            WS =
              T.let(
                :ws,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SM =
              T.let(
                :sm,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            ST =
              T.let(
                :st,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SA =
              T.let(
                :sa,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SN =
              T.let(
                :sn,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            RS =
              T.let(
                :rs,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SC =
              T.let(
                :sc,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SL =
              T.let(
                :sl,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SG =
              T.let(
                :sg,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SK =
              T.let(
                :sk,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SI =
              T.let(
                :si,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SB =
              T.let(
                :sb,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SO =
              T.let(
                :so,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            ZA =
              T.let(
                :za,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GS =
              T.let(
                :gs,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            ES =
              T.let(
                :es,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            LK =
              T.let(
                :lk,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SD =
              T.let(
                :sd,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SR =
              T.let(
                :sr,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SJ =
              T.let(
                :sj,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SZ =
              T.let(
                :sz,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SE =
              T.let(
                :se,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            CH =
              T.let(
                :ch,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            SY =
              T.let(
                :sy,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            TW =
              T.let(
                :tw,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            TJ =
              T.let(
                :tj,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            TZ =
              T.let(
                :tz,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            TH =
              T.let(
                :th,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            TL =
              T.let(
                :tl,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            TG =
              T.let(
                :tg,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            TK =
              T.let(
                :tk,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            TO =
              T.let(
                :to,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            TT =
              T.let(
                :tt,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            TN =
              T.let(
                :tn,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            TR =
              T.let(
                :tr,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            TM =
              T.let(
                :tm,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            TC =
              T.let(
                :tc,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            TV =
              T.let(
                :tv,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            UG =
              T.let(
                :ug,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            UA =
              T.let(
                :ua,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            AE =
              T.let(
                :ae,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            GB =
              T.let(
                :gb,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            US =
              T.let(
                :us,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            UM =
              T.let(
                :um,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            UY =
              T.let(
                :uy,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            UZ =
              T.let(
                :uz,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            VU =
              T.let(
                :vu,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            VE =
              T.let(
                :ve,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            VN =
              T.let(
                :vn,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            VG =
              T.let(
                :vg,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            VI =
              T.let(
                :vi,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            WF =
              T.let(
                :wf,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            EH =
              T.let(
                :eh,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            YE =
              T.let(
                :ye,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            ZM =
              T.let(
                :zm,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )
            ZW =
              T.let(
                :zw,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module ForceLanguage
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AFRIKAANS =
              T.let(
                :afrikaans,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            ALBANIAN =
              T.let(
                :albanian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            AMHARIC =
              T.let(
                :amharic,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            ARABIC =
              T.let(
                :arabic,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            ARMENIAN =
              T.let(
                :armenian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            ASSAMESE =
              T.let(
                :assamese,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            AYMARA =
              T.let(
                :aymara,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            AZERI =
              T.let(
                :azeri,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            BASQUE =
              T.let(
                :basque,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            BELARUSIAN =
              T.let(
                :belarusian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            BENGALI =
              T.let(
                :bengali,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            BOSNIAN =
              T.let(
                :bosnian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            BULGARIAN =
              T.let(
                :bulgarian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            BURMESE =
              T.let(
                :burmese,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            CANTONESE =
              T.let(
                :cantonese,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            CATALAN =
              T.let(
                :catalan,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            CEBUANO =
              T.let(
                :cebuano,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            CHINESE =
              T.let(
                :chinese,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            CORSICAN =
              T.let(
                :corsican,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            CROATIAN =
              T.let(
                :croatian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            CZECH =
              T.let(
                :czech,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            DANISH =
              T.let(
                :danish,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            DUTCH =
              T.let(
                :dutch,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            ENGLISH =
              T.let(
                :english,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            ESPERANTO =
              T.let(
                :esperanto,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            ESTONIAN =
              T.let(
                :estonian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            FARSI =
              T.let(
                :farsi,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            FIJIAN =
              T.let(
                :fijian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            FINNISH =
              T.let(
                :finnish,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            FRENCH =
              T.let(
                :french,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            GALICIAN =
              T.let(
                :galician,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            GEORGIAN =
              T.let(
                :georgian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            GERMAN =
              T.let(
                :german,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            GREEK =
              T.let(
                :greek,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            GUARANI =
              T.let(
                :guarani,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            GUJARATI =
              T.let(
                :gujarati,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            HAITIAN_CREOLE =
              T.let(
                :"haitian-creole",
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            HAUSA =
              T.let(
                :hausa,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            HAWAIIAN =
              T.let(
                :hawaiian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            HEBREW =
              T.let(
                :hebrew,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            HINDI =
              T.let(
                :hindi,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            HMONG =
              T.let(
                :hmong,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            HUNGARIAN =
              T.let(
                :hungarian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            ICELANDIC =
              T.let(
                :icelandic,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            IGBO =
              T.let(
                :igbo,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            INDONESIAN =
              T.let(
                :indonesian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            IRISH =
              T.let(
                :irish,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            ITALIAN =
              T.let(
                :italian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            JAPANESE =
              T.let(
                :japanese,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            JAVANESE =
              T.let(
                :javanese,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            KANNADA =
              T.let(
                :kannada,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            KAZAKH =
              T.let(
                :kazakh,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            KHMER =
              T.let(
                :khmer,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            KINYARWANDA =
              T.let(
                :kinyarwanda,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            KOREAN =
              T.let(
                :korean,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            KURDISH =
              T.let(
                :kurdish,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            KYRGYZ =
              T.let(
                :kyrgyz,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            LAO =
              T.let(
                :lao,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            LATIN =
              T.let(
                :latin,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            LATVIAN =
              T.let(
                :latvian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            LINGALA =
              T.let(
                :lingala,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            LITHUANIAN =
              T.let(
                :lithuanian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            LUXEMBOURGISH =
              T.let(
                :luxembourgish,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            MACEDONIAN =
              T.let(
                :macedonian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            MALAGASY =
              T.let(
                :malagasy,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            MALAY =
              T.let(
                :malay,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            MALAYALAM =
              T.let(
                :malayalam,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            MALTESE =
              T.let(
                :maltese,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            MAORI =
              T.let(
                :maori,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            MARATHI =
              T.let(
                :marathi,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            MONGOLIAN =
              T.let(
                :mongolian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            NEPALI =
              T.let(
                :nepali,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            NORWEGIAN =
              T.let(
                :norwegian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            ODIA =
              T.let(
                :odia,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            OROMO =
              T.let(
                :oromo,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            PASHTO =
              T.let(
                :pashto,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            PIDGIN =
              T.let(
                :pidgin,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            POLISH =
              T.let(
                :polish,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            PORTUGUESE =
              T.let(
                :portuguese,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            PUNJABI =
              T.let(
                :punjabi,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            QUECHUA =
              T.let(
                :quechua,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            ROMANIAN =
              T.let(
                :romanian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            RUSSIAN =
              T.let(
                :russian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            SAMOAN =
              T.let(
                :samoan,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            SCOTTISH_GAELIC =
              T.let(
                :"scottish-gaelic",
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            SERBIAN =
              T.let(
                :serbian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            SESOTHO =
              T.let(
                :sesotho,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            SHONA =
              T.let(
                :shona,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            SINDHI =
              T.let(
                :sindhi,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            SINHALA =
              T.let(
                :sinhala,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            SLOVAK =
              T.let(
                :slovak,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            SLOVENE =
              T.let(
                :slovene,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            SOMALI =
              T.let(
                :somali,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            SPANISH =
              T.let(
                :spanish,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            SUNDANESE =
              T.let(
                :sundanese,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            SWAHILI =
              T.let(
                :swahili,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            SWEDISH =
              T.let(
                :swedish,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            TAGALOG =
              T.let(
                :tagalog,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            TAJIK =
              T.let(
                :tajik,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            TAMIL =
              T.let(
                :tamil,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            TATAR =
              T.let(
                :tatar,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            TELUGU =
              T.let(
                :telugu,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            THAI =
              T.let(
                :thai,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            TIBETAN =
              T.let(
                :tibetan,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            TIGRINYA =
              T.let(
                :tigrinya,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            TONGAN =
              T.let(
                :tongan,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            TSWANA =
              T.let(
                :tswana,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            TURKISH =
              T.let(
                :turkish,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            TURKMEN =
              T.let(
                :turkmen,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            UKRAINIAN =
              T.let(
                :ukrainian,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            URDU =
              T.let(
                :urdu,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            UYGHUR =
              T.let(
                :uyghur,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            UZBEK =
              T.let(
                :uzbek,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            VIETNAMESE =
              T.let(
                :vietnamese,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            WELSH =
              T.let(
                :welsh,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            WOLOF =
              T.let(
                :wolof,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            XHOSA =
              T.let(
                :xhosa,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            YIDDISH =
              T.let(
                :yiddish,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            YORUBA =
              T.let(
                :yoruba,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )
            ZULU =
              T.let(
                :zulu,
                ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Optional Merchant Category Code (MCC) to help identify the business category or
          # industry.
          module Mcc
            extend ContextDev::Internal::Type::Union

            Variants = T.type_alias { T.any(String, Float) }

            sig do
              override.returns(
                T::Array[
                  ContextDev::BrandRetrieveParams::Body::ByTransaction::Mcc::Variants
                ]
              )
            end
            def self.variants
            end
          end

          # Optional phone number from the transaction to help verify brand match.
          module Phone
            extend ContextDev::Internal::Type::Union

            Variants = T.type_alias { T.any(String, Float) }

            sig do
              override.returns(
                T::Array[
                  ContextDev::BrandRetrieveParams::Body::ByTransaction::Phone::Variants
                ]
              )
            end
            def self.variants
            end
          end

          class TimeoutOpts < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts,
                  ContextDev::Internal::AnyHash
                )
              end

            # Deadline in milliseconds.
            sig { returns(Integer) }
            attr_accessor :milliseconds

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            sig do
              returns(
                T.nilable(
                  ContextDev::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts::Behavior::OrSymbol
                )
              )
            end
            attr_reader :behavior

            sig do
              params(
                behavior:
                  ContextDev::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts::Behavior::OrSymbol
              ).void
            end
            attr_writer :behavior

            # Request deadline and what to return when it passes.
            sig do
              params(
                milliseconds: Integer,
                behavior:
                  ContextDev::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts::Behavior::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Deadline in milliseconds.
              milliseconds:,
              # "fail" returns 408 at the deadline. "return-partial" returns available results;
              # inspect the response’s partial flag.
              behavior: nil
            )
            end

            sig do
              override.returns(
                {
                  milliseconds: Integer,
                  behavior:
                    ContextDev::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts::Behavior::OrSymbol
                }
              )
            end
            def to_hash
            end

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            module Behavior
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts::Behavior
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              FAIL =
                T.let(
                  :fail,
                  ContextDev::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts::Behavior::TaggedSymbol
                )
              RETURN_PARTIAL =
                T.let(
                  :"return-partial",
                  ContextDev::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts::Behavior::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts::Behavior::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        sig do
          override.returns(
            T::Array[ContextDev::BrandRetrieveParams::Body::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
