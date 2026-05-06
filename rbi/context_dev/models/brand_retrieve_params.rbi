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

      # Domain name to retrieve brand data for (e.g., 'example.com', 'google.com').
      # Cannot be used with name or ticker parameters.
      sig { returns(String) }
      attr_accessor :domain

      # Optional parameter to force the language of the retrieved brand data.
      sig do
        returns(
          T.nilable(ContextDev::BrandRetrieveParams::ForceLanguage::OrSymbol)
        )
      end
      attr_reader :force_language

      sig do
        params(
          force_language:
            ContextDev::BrandRetrieveParams::ForceLanguage::OrSymbol
        ).void
      end
      attr_writer :force_language

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
      # less comprehensive data. Works with all three lookup methods.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :max_speed

      sig { params(max_speed: T::Boolean).void }
      attr_writer :max_speed

      # Optional timeout in milliseconds for the request. If the request takes longer
      # than this value, it will be aborted with a 408 status code. Maximum allowed
      # value is 300000ms (5 minutes).
      sig { returns(T.nilable(Integer)) }
      attr_reader :timeout_ms

      sig { params(timeout_ms: Integer).void }
      attr_writer :timeout_ms

      sig do
        params(
          domain: String,
          force_language:
            ContextDev::BrandRetrieveParams::ForceLanguage::OrSymbol,
          max_age_ms: Integer,
          max_speed: T::Boolean,
          timeout_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Domain name to retrieve brand data for (e.g., 'example.com', 'google.com').
        # Cannot be used with name or ticker parameters.
        domain:,
        # Optional parameter to force the language of the retrieved brand data.
        force_language: nil,
        # Maximum age in milliseconds for cached brand data before the API performs a hard
        # refresh. Defaults to 3 months (7776000000 ms). Values below 1 day (86400000 ms)
        # are clamped to 1 day; values above 1 year (31536000000 ms) are clamped to 1
        # year.
        max_age_ms: nil,
        # Optional parameter to optimize the API call for maximum speed. When set to true,
        # the API will skip time-consuming operations for faster response at the cost of
        # less comprehensive data. Works with all three lookup methods.
        max_speed: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            domain: String,
            force_language:
              ContextDev::BrandRetrieveParams::ForceLanguage::OrSymbol,
            max_age_ms: Integer,
            max_speed: T::Boolean,
            timeout_ms: Integer,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Optional parameter to force the language of the retrieved brand data.
      module ForceLanguage
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::BrandRetrieveParams::ForceLanguage)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AFRIKAANS =
          T.let(
            :afrikaans,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        ALBANIAN =
          T.let(
            :albanian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        AMHARIC =
          T.let(
            :amharic,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        ARABIC =
          T.let(
            :arabic,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        ARMENIAN =
          T.let(
            :armenian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        ASSAMESE =
          T.let(
            :assamese,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        AYMARA =
          T.let(
            :aymara,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        AZERI =
          T.let(
            :azeri,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        BASQUE =
          T.let(
            :basque,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        BELARUSIAN =
          T.let(
            :belarusian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        BENGALI =
          T.let(
            :bengali,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        BOSNIAN =
          T.let(
            :bosnian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        BULGARIAN =
          T.let(
            :bulgarian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        BURMESE =
          T.let(
            :burmese,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        CANTONESE =
          T.let(
            :cantonese,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        CATALAN =
          T.let(
            :catalan,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        CEBUANO =
          T.let(
            :cebuano,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        CHINESE =
          T.let(
            :chinese,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        CORSICAN =
          T.let(
            :corsican,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        CROATIAN =
          T.let(
            :croatian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        CZECH =
          T.let(
            :czech,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        DANISH =
          T.let(
            :danish,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        DUTCH =
          T.let(
            :dutch,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        ENGLISH =
          T.let(
            :english,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        ESPERANTO =
          T.let(
            :esperanto,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        ESTONIAN =
          T.let(
            :estonian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        FARSI =
          T.let(
            :farsi,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        FIJIAN =
          T.let(
            :fijian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        FINNISH =
          T.let(
            :finnish,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        FRENCH =
          T.let(
            :french,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        GALICIAN =
          T.let(
            :galician,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        GEORGIAN =
          T.let(
            :georgian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        GERMAN =
          T.let(
            :german,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        GREEK =
          T.let(
            :greek,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        GUARANI =
          T.let(
            :guarani,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        GUJARATI =
          T.let(
            :gujarati,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        HAITIAN_CREOLE =
          T.let(
            :"haitian-creole",
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        HAUSA =
          T.let(
            :hausa,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        HAWAIIAN =
          T.let(
            :hawaiian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        HEBREW =
          T.let(
            :hebrew,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        HINDI =
          T.let(
            :hindi,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        HMONG =
          T.let(
            :hmong,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        HUNGARIAN =
          T.let(
            :hungarian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        ICELANDIC =
          T.let(
            :icelandic,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        IGBO =
          T.let(
            :igbo,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        INDONESIAN =
          T.let(
            :indonesian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        IRISH =
          T.let(
            :irish,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        ITALIAN =
          T.let(
            :italian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        JAPANESE =
          T.let(
            :japanese,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        JAVANESE =
          T.let(
            :javanese,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        KANNADA =
          T.let(
            :kannada,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        KAZAKH =
          T.let(
            :kazakh,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        KHMER =
          T.let(
            :khmer,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        KINYARWANDA =
          T.let(
            :kinyarwanda,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        KOREAN =
          T.let(
            :korean,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        KURDISH =
          T.let(
            :kurdish,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        KYRGYZ =
          T.let(
            :kyrgyz,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        LAO =
          T.let(
            :lao,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        LATIN =
          T.let(
            :latin,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        LATVIAN =
          T.let(
            :latvian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        LINGALA =
          T.let(
            :lingala,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        LITHUANIAN =
          T.let(
            :lithuanian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        LUXEMBOURGISH =
          T.let(
            :luxembourgish,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        MACEDONIAN =
          T.let(
            :macedonian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        MALAGASY =
          T.let(
            :malagasy,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        MALAY =
          T.let(
            :malay,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        MALAYALAM =
          T.let(
            :malayalam,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        MALTESE =
          T.let(
            :maltese,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        MAORI =
          T.let(
            :maori,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        MARATHI =
          T.let(
            :marathi,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        MONGOLIAN =
          T.let(
            :mongolian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        NEPALI =
          T.let(
            :nepali,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        NORWEGIAN =
          T.let(
            :norwegian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        ODIA =
          T.let(
            :odia,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        OROMO =
          T.let(
            :oromo,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        PASHTO =
          T.let(
            :pashto,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        PIDGIN =
          T.let(
            :pidgin,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        POLISH =
          T.let(
            :polish,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        PORTUGUESE =
          T.let(
            :portuguese,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        PUNJABI =
          T.let(
            :punjabi,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        QUECHUA =
          T.let(
            :quechua,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        ROMANIAN =
          T.let(
            :romanian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        RUSSIAN =
          T.let(
            :russian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        SAMOAN =
          T.let(
            :samoan,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        SCOTTISH_GAELIC =
          T.let(
            :"scottish-gaelic",
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        SERBIAN =
          T.let(
            :serbian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        SESOTHO =
          T.let(
            :sesotho,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        SHONA =
          T.let(
            :shona,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        SINDHI =
          T.let(
            :sindhi,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        SINHALA =
          T.let(
            :sinhala,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        SLOVAK =
          T.let(
            :slovak,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        SLOVENE =
          T.let(
            :slovene,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        SOMALI =
          T.let(
            :somali,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        SPANISH =
          T.let(
            :spanish,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        SUNDANESE =
          T.let(
            :sundanese,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        SWAHILI =
          T.let(
            :swahili,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        SWEDISH =
          T.let(
            :swedish,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        TAGALOG =
          T.let(
            :tagalog,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        TAJIK =
          T.let(
            :tajik,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        TAMIL =
          T.let(
            :tamil,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        TATAR =
          T.let(
            :tatar,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        TELUGU =
          T.let(
            :telugu,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        THAI =
          T.let(
            :thai,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        TIBETAN =
          T.let(
            :tibetan,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        TIGRINYA =
          T.let(
            :tigrinya,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        TONGAN =
          T.let(
            :tongan,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        TSWANA =
          T.let(
            :tswana,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        TURKISH =
          T.let(
            :turkish,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        TURKMEN =
          T.let(
            :turkmen,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        UKRAINIAN =
          T.let(
            :ukrainian,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        URDU =
          T.let(
            :urdu,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        UYGHUR =
          T.let(
            :uyghur,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        UZBEK =
          T.let(
            :uzbek,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        VIETNAMESE =
          T.let(
            :vietnamese,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        WELSH =
          T.let(
            :welsh,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        WOLOF =
          T.let(
            :wolof,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        XHOSA =
          T.let(
            :xhosa,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        YIDDISH =
          T.let(
            :yiddish,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        YORUBA =
          T.let(
            :yoruba,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )
        ZULU =
          T.let(
            :zulu,
            ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::BrandRetrieveParams::ForceLanguage::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
