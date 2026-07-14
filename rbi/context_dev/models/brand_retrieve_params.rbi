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

      # Exactly one lookup type must be provided.
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
        # Exactly one lookup type must be provided.
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

      # Exactly one lookup type must be provided.
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

          # Maximum age in milliseconds for cached brand data before the API performs a hard
          # refresh. Defaults to 3 months (7776000000 ms). Values below 1 day (86400000 ms)
          # are clamped to 1 day; values above 1 year (31536000000 ms) are clamped to 1
          # year.
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

          # Optional caller-defined tags for tracking this request. Tags are recorded on the
          # request's usage log and can be used to filter usage on the dashboard usage page.
          # Up to 20 tags, each 1-50 characters.
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
              timeout_ms: Integer,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Domain name to retrieve brand data for (e.g., 'stripe.com').
            domain:,
            force_language: nil,
            # Maximum age in milliseconds for cached brand data before the API performs a hard
            # refresh. Defaults to 3 months (7776000000 ms). Values below 1 day (86400000 ms)
            # are clamped to 1 day; values above 1 year (31536000000 ms) are clamped to 1
            # year.
            max_age_ms: nil,
            # Optional parameter to optimize the API call for maximum speed. When set to true,
            # the API will skip time-consuming operations for faster response at the cost of
            # less comprehensive data.
            max_speed: nil,
            # Optional caller-defined tags for tracking this request. Tags are recorded on the
            # request's usage log and can be used to filter usage on the dashboard usage page.
            # Up to 20 tags, each 1-50 characters.
            tags: nil,
            # Optional timeout in milliseconds for the request. If the request takes longer
            # than this value, it will be aborted with a 408 status code. Maximum allowed
            # value is 300000ms (5 minutes).
            timeout_ms: nil,
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
                timeout_ms: Integer
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

          # Optional country code hint (GL parameter) to specify the country when looking up
          # by company name.
          sig { returns(T.nilable(String)) }
          attr_reader :country_gl

          sig { params(country_gl: String).void }
          attr_writer :country_gl

          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::OrSymbol
              )
            )
          end
          attr_accessor :force_language

          # Maximum age in milliseconds for cached brand data before the API performs a hard
          # refresh. Defaults to 3 months (7776000000 ms). Values below 1 day (86400000 ms)
          # are clamped to 1 day; values above 1 year (31536000000 ms) are clamped to 1
          # year.
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

          # Optional caller-defined tags for tracking this request. Tags are recorded on the
          # request's usage log and can be used to filter usage on the dashboard usage page.
          # Up to 20 tags, each 1-50 characters.
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

          # Retrieve brand data by company name. Cannot be combined with domain, email, or
          # ticker.
          sig do
            params(
              name: String,
              country_gl: String,
              force_language:
                T.nilable(
                  ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::OrSymbol
                ),
              max_age_ms: Integer,
              max_speed: T::Boolean,
              tags: T::Array[String],
              timeout_ms: Integer,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Company name to retrieve brand data for (e.g., 'Apple Inc').
            name:,
            # Optional country code hint (GL parameter) to specify the country when looking up
            # by company name.
            country_gl: nil,
            force_language: nil,
            # Maximum age in milliseconds for cached brand data before the API performs a hard
            # refresh. Defaults to 3 months (7776000000 ms). Values below 1 day (86400000 ms)
            # are clamped to 1 day; values above 1 year (31536000000 ms) are clamped to 1
            # year.
            max_age_ms: nil,
            # Optional parameter to optimize the API call for maximum speed. When set to true,
            # the API will skip time-consuming operations for faster response at the cost of
            # less comprehensive data.
            max_speed: nil,
            # Optional caller-defined tags for tracking this request. Tags are recorded on the
            # request's usage log and can be used to filter usage on the dashboard usage page.
            # Up to 20 tags, each 1-50 characters.
            tags: nil,
            # Optional timeout in milliseconds for the request. If the request takes longer
            # than this value, it will be aborted with a 408 status code. Maximum allowed
            # value is 300000ms (5 minutes).
            timeout_ms: nil,
            # Discriminator for name-based brand retrieval.
            type: :by_name
          )
          end

          sig do
            override.returns(
              {
                name: String,
                type: Symbol,
                country_gl: String,
                force_language:
                  T.nilable(
                    ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage::OrSymbol
                  ),
                max_age_ms: Integer,
                max_speed: T::Boolean,
                tags: T::Array[String],
                timeout_ms: Integer
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

          # Maximum age in milliseconds for cached brand data before the API performs a hard
          # refresh. Defaults to 3 months (7776000000 ms). Values below 1 day (86400000 ms)
          # are clamped to 1 day; values above 1 year (31536000000 ms) are clamped to 1
          # year.
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

          # Optional caller-defined tags for tracking this request. Tags are recorded on the
          # request's usage log and can be used to filter usage on the dashboard usage page.
          # Up to 20 tags, each 1-50 characters.
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
              timeout_ms: Integer,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Email address to retrieve brand data for (e.g., 'jane@stripe.com').
            email:,
            force_language: nil,
            # Maximum age in milliseconds for cached brand data before the API performs a hard
            # refresh. Defaults to 3 months (7776000000 ms). Values below 1 day (86400000 ms)
            # are clamped to 1 day; values above 1 year (31536000000 ms) are clamped to 1
            # year.
            max_age_ms: nil,
            # Optional parameter to optimize the API call for maximum speed. When set to true,
            # the API will skip time-consuming operations for faster response at the cost of
            # less comprehensive data.
            max_speed: nil,
            # Optional caller-defined tags for tracking this request. Tags are recorded on the
            # request's usage log and can be used to filter usage on the dashboard usage page.
            # Up to 20 tags, each 1-50 characters.
            tags: nil,
            # Optional timeout in milliseconds for the request. If the request takes longer
            # than this value, it will be aborted with a 408 status code. Maximum allowed
            # value is 300000ms (5 minutes).
            timeout_ms: nil,
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
                timeout_ms: Integer
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

          # Maximum age in milliseconds for cached brand data before the API performs a hard
          # refresh. Defaults to 3 months (7776000000 ms). Values below 1 day (86400000 ms)
          # are clamped to 1 day; values above 1 year (31536000000 ms) are clamped to 1
          # year.
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

          # Optional caller-defined tags for tracking this request. Tags are recorded on the
          # request's usage log and can be used to filter usage on the dashboard usage page.
          # Up to 20 tags, each 1-50 characters.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :tags

          sig { params(tags: T::Array[String]).void }
          attr_writer :tags

          # Optional stock exchange for the ticker. Defaults to NASDAQ if not specified.
          sig { returns(T.nilable(String)) }
          attr_reader :ticker_exchange

          sig { params(ticker_exchange: String).void }
          attr_writer :ticker_exchange

          # Optional timeout in milliseconds for the request. If the request takes longer
          # than this value, it will be aborted with a 408 status code. Maximum allowed
          # value is 300000ms (5 minutes).
          sig { returns(T.nilable(Integer)) }
          attr_reader :timeout_ms

          sig { params(timeout_ms: Integer).void }
          attr_writer :timeout_ms

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
              ticker_exchange: String,
              timeout_ms: Integer,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Stock ticker symbol to retrieve brand data for (e.g., 'AAPL').
            ticker:,
            force_language: nil,
            # Maximum age in milliseconds for cached brand data before the API performs a hard
            # refresh. Defaults to 3 months (7776000000 ms). Values below 1 day (86400000 ms)
            # are clamped to 1 day; values above 1 year (31536000000 ms) are clamped to 1
            # year.
            max_age_ms: nil,
            # Optional parameter to optimize the API call for maximum speed. When set to true,
            # the API will skip time-consuming operations for faster response at the cost of
            # less comprehensive data.
            max_speed: nil,
            # Optional caller-defined tags for tracking this request. Tags are recorded on the
            # request's usage log and can be used to filter usage on the dashboard usage page.
            # Up to 20 tags, each 1-50 characters.
            tags: nil,
            # Optional stock exchange for the ticker. Defaults to NASDAQ if not specified.
            ticker_exchange: nil,
            # Optional timeout in milliseconds for the request. If the request takes longer
            # than this value, it will be aborted with a 408 status code. Maximum allowed
            # value is 300000ms (5 minutes).
            timeout_ms: nil,
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
                ticker_exchange: String,
                timeout_ms: Integer
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

          # Optional caller-defined tags for tracking this request. Tags are recorded on the
          # request's usage log and can be used to filter usage on the dashboard usage page.
          # Up to 20 tags, each 1-50 characters.
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

          # Retrieve brand data by fetching the provided URL directly. Note: if you use
          # this, brand data is fetched only from the provided URL — not from the entire
          # internet — so results are limited to what that single page contains. No domain
          # resolution, database lookup, or cross-source enrichment is performed. Cannot be
          # combined with domain, name, email, or ticker.
          sig do
            params(
              direct_url: String,
              tags: T::Array[String],
              timeout_ms: Integer,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Full http(s) URL to fetch brand data from (e.g.,
            # 'https://stripe.com/enterprise'). Only this URL is fetched — not the entire
            # internet.
            direct_url:,
            # Optional caller-defined tags for tracking this request. Tags are recorded on the
            # request's usage log and can be used to filter usage on the dashboard usage page.
            # Up to 20 tags, each 1-50 characters.
            tags: nil,
            # Optional timeout in milliseconds for the request. If the request takes longer
            # than this value, it will be aborted with a 408 status code. Maximum allowed
            # value is 300000ms (5 minutes).
            timeout_ms: nil,
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
                timeout_ms: Integer
              }
            )
          end
          def to_hash
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

          # Optional country code hint (GL parameter) to specify the country when
          # identifying a transaction.
          sig { returns(T.nilable(String)) }
          attr_reader :country_gl

          sig { params(country_gl: String).void }
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

          # Optional caller-defined tags for tracking this request. Tags are recorded on the
          # request's usage log and can be used to filter usage on the dashboard usage page.
          # Up to 20 tags, each 1-50 characters.
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

          # Identify brand data from a transaction descriptor. Cannot be combined with
          # domain, name, email, or ticker.
          sig do
            params(
              transaction_info: String,
              city: String,
              country_gl: String,
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
              timeout_ms: Integer,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Transaction information to identify the brand.
            transaction_info:,
            # Optional city name to prioritize when searching for the brand.
            city: nil,
            # Optional country code hint (GL parameter) to specify the country when
            # identifying a transaction.
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
            # Optional caller-defined tags for tracking this request. Tags are recorded on the
            # request's usage log and can be used to filter usage on the dashboard usage page.
            # Up to 20 tags, each 1-50 characters.
            tags: nil,
            # Optional timeout in milliseconds for the request. If the request takes longer
            # than this value, it will be aborted with a 408 status code. Maximum allowed
            # value is 300000ms (5 minutes).
            timeout_ms: nil,
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
                country_gl: String,
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
                timeout_ms: Integer
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
