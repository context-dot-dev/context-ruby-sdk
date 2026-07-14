# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Brand#retrieve
    class BrandRetrieveParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute body
      #   Exactly one lookup type must be provided.
      #
      #   @return [ContextDev::Models::BrandRetrieveParams::Body::ByDomain, ContextDev::Models::BrandRetrieveParams::Body::ByName, ContextDev::Models::BrandRetrieveParams::Body::ByEmail, ContextDev::Models::BrandRetrieveParams::Body::ByTicker, ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction]
      required :body, union: -> { ContextDev::BrandRetrieveParams::Body }

      # @!method initialize(body:, request_options: {})
      #   @param body [ContextDev::Models::BrandRetrieveParams::Body::ByDomain, ContextDev::Models::BrandRetrieveParams::Body::ByName, ContextDev::Models::BrandRetrieveParams::Body::ByEmail, ContextDev::Models::BrandRetrieveParams::Body::ByTicker, ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction] Exactly one lookup type must be provided.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Exactly one lookup type must be provided.
      module Body
        extend ContextDev::Internal::Type::Union

        discriminator :type

        # Retrieve brand data by domain. Cannot be combined with name, email, or ticker.
        variant :by_domain, -> { ContextDev::BrandRetrieveParams::Body::ByDomain }

        # Retrieve brand data by company name. Cannot be combined with domain, email, or ticker.
        variant :by_name, -> { ContextDev::BrandRetrieveParams::Body::ByName }

        # Retrieve brand data by email address. The domain is extracted from the email. Free and disposable email providers are rejected with 422. Cannot be combined with domain, name, or ticker.
        variant :by_email, -> { ContextDev::BrandRetrieveParams::Body::ByEmail }

        # Retrieve brand data by stock ticker. Cannot be combined with domain, name, or email.
        variant :by_ticker, -> { ContextDev::BrandRetrieveParams::Body::ByTicker }

        # Retrieve brand data by fetching the provided URL directly. Note: if you use this, brand data is fetched only from the provided URL — not from the entire internet — so results are limited to what that single page contains. No domain resolution, database lookup, or cross-source enrichment is performed. Cannot be combined with domain, name, email, or ticker.
        variant :by_direct_url, -> { ContextDev::BrandRetrieveParams::Body::ByDirectURL }

        # Identify brand data from a transaction descriptor. Cannot be combined with domain, name, email, or ticker.
        variant :by_transaction, -> { ContextDev::BrandRetrieveParams::Body::ByTransaction }

        class ByDomain < ContextDev::Internal::Type::BaseModel
          # @!attribute domain
          #   Domain name to retrieve brand data for (e.g., 'stripe.com').
          #
          #   @return [String]
          required :domain, String

          # @!attribute type
          #   Discriminator for domain-based brand retrieval.
          #
          #   @return [Symbol, :by_domain]
          required :type, const: :by_domain

          # @!attribute force_language
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByDomain::ForceLanguage, nil]
          optional :force_language,
                   enum: -> { ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage },
                   nil?: true

          # @!attribute max_age_ms
          #   Maximum age in milliseconds for cached brand data before the API performs a hard
          #   refresh. Defaults to 3 months (7776000000 ms). Values below 1 day (86400000 ms)
          #   are clamped to 1 day; values above 1 year (31536000000 ms) are clamped to 1
          #   year.
          #
          #   @return [Integer, nil]
          optional :max_age_ms, Integer, api_name: :maxAgeMs

          # @!attribute max_speed
          #   Optional parameter to optimize the API call for maximum speed. When set to true,
          #   the API will skip time-consuming operations for faster response at the cost of
          #   less comprehensive data.
          #
          #   @return [Boolean, nil]
          optional :max_speed, ContextDev::Internal::Type::Boolean, api_name: :maxSpeed

          # @!attribute tags
          #   Optional caller-defined tags for tracking this request. Tags are recorded on the
          #   request's usage log and can be used to filter usage on the dashboard usage page.
          #   Up to 20 tags, each 1-50 characters.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute timeout_ms
          #   Optional timeout in milliseconds for the request. If the request takes longer
          #   than this value, it will be aborted with a 408 status code. Maximum allowed
          #   value is 300000ms (5 minutes).
          #
          #   @return [Integer, nil]
          optional :timeout_ms, Integer, api_name: :timeoutMS

          # @!method initialize(domain:, force_language: nil, max_age_ms: nil, max_speed: nil, tags: nil, timeout_ms: nil, type: :by_domain)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::ByDomain} for more details.
          #
          #   Retrieve brand data by domain. Cannot be combined with name, email, or ticker.
          #
          #   @param domain [String] Domain name to retrieve brand data for (e.g., 'stripe.com').
          #
          #   @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByDomain::ForceLanguage, nil]
          #
          #   @param max_age_ms [Integer] Maximum age in milliseconds for cached brand data before the API performs a hard
          #
          #   @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
          #
          #   @param tags [Array<String>] Optional caller-defined tags for tracking this request. Tags are recorded on the
          #
          #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
          #
          #   @param type [Symbol, :by_domain] Discriminator for domain-based brand retrieval.

          # @see ContextDev::Models::BrandRetrieveParams::Body::ByDomain#force_language
          module ForceLanguage
            extend ContextDev::Internal::Type::Enum

            AFRIKAANS = :afrikaans
            ALBANIAN = :albanian
            AMHARIC = :amharic
            ARABIC = :arabic
            ARMENIAN = :armenian
            ASSAMESE = :assamese
            AYMARA = :aymara
            AZERI = :azeri
            BASQUE = :basque
            BELARUSIAN = :belarusian
            BENGALI = :bengali
            BOSNIAN = :bosnian
            BULGARIAN = :bulgarian
            BURMESE = :burmese
            CANTONESE = :cantonese
            CATALAN = :catalan
            CEBUANO = :cebuano
            CHINESE = :chinese
            CORSICAN = :corsican
            CROATIAN = :croatian
            CZECH = :czech
            DANISH = :danish
            DUTCH = :dutch
            ENGLISH = :english
            ESPERANTO = :esperanto
            ESTONIAN = :estonian
            FARSI = :farsi
            FIJIAN = :fijian
            FINNISH = :finnish
            FRENCH = :french
            GALICIAN = :galician
            GEORGIAN = :georgian
            GERMAN = :german
            GREEK = :greek
            GUARANI = :guarani
            GUJARATI = :gujarati
            HAITIAN_CREOLE = :"haitian-creole"
            HAUSA = :hausa
            HAWAIIAN = :hawaiian
            HEBREW = :hebrew
            HINDI = :hindi
            HMONG = :hmong
            HUNGARIAN = :hungarian
            ICELANDIC = :icelandic
            IGBO = :igbo
            INDONESIAN = :indonesian
            IRISH = :irish
            ITALIAN = :italian
            JAPANESE = :japanese
            JAVANESE = :javanese
            KANNADA = :kannada
            KAZAKH = :kazakh
            KHMER = :khmer
            KINYARWANDA = :kinyarwanda
            KOREAN = :korean
            KURDISH = :kurdish
            KYRGYZ = :kyrgyz
            LAO = :lao
            LATIN = :latin
            LATVIAN = :latvian
            LINGALA = :lingala
            LITHUANIAN = :lithuanian
            LUXEMBOURGISH = :luxembourgish
            MACEDONIAN = :macedonian
            MALAGASY = :malagasy
            MALAY = :malay
            MALAYALAM = :malayalam
            MALTESE = :maltese
            MAORI = :maori
            MARATHI = :marathi
            MONGOLIAN = :mongolian
            NEPALI = :nepali
            NORWEGIAN = :norwegian
            ODIA = :odia
            OROMO = :oromo
            PASHTO = :pashto
            PIDGIN = :pidgin
            POLISH = :polish
            PORTUGUESE = :portuguese
            PUNJABI = :punjabi
            QUECHUA = :quechua
            ROMANIAN = :romanian
            RUSSIAN = :russian
            SAMOAN = :samoan
            SCOTTISH_GAELIC = :"scottish-gaelic"
            SERBIAN = :serbian
            SESOTHO = :sesotho
            SHONA = :shona
            SINDHI = :sindhi
            SINHALA = :sinhala
            SLOVAK = :slovak
            SLOVENE = :slovene
            SOMALI = :somali
            SPANISH = :spanish
            SUNDANESE = :sundanese
            SWAHILI = :swahili
            SWEDISH = :swedish
            TAGALOG = :tagalog
            TAJIK = :tajik
            TAMIL = :tamil
            TATAR = :tatar
            TELUGU = :telugu
            THAI = :thai
            TIBETAN = :tibetan
            TIGRINYA = :tigrinya
            TONGAN = :tongan
            TSWANA = :tswana
            TURKISH = :turkish
            TURKMEN = :turkmen
            UKRAINIAN = :ukrainian
            URDU = :urdu
            UYGHUR = :uyghur
            UZBEK = :uzbek
            VIETNAMESE = :vietnamese
            WELSH = :welsh
            WOLOF = :wolof
            XHOSA = :xhosa
            YIDDISH = :yiddish
            YORUBA = :yoruba
            ZULU = :zulu

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class ByName < ContextDev::Internal::Type::BaseModel
          # @!attribute name
          #   Company name to retrieve brand data for (e.g., 'Apple Inc').
          #
          #   @return [String]
          required :name, String

          # @!attribute type
          #   Discriminator for name-based brand retrieval.
          #
          #   @return [Symbol, :by_name]
          required :type, const: :by_name

          # @!attribute country_gl
          #   Optional country code hint (GL parameter) to specify the country when looking up
          #   by company name.
          #
          #   @return [String, nil]
          optional :country_gl, String

          # @!attribute force_language
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByName::ForceLanguage, nil]
          optional :force_language,
                   enum: -> { ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage },
                   nil?: true

          # @!attribute max_age_ms
          #   Maximum age in milliseconds for cached brand data before the API performs a hard
          #   refresh. Defaults to 3 months (7776000000 ms). Values below 1 day (86400000 ms)
          #   are clamped to 1 day; values above 1 year (31536000000 ms) are clamped to 1
          #   year.
          #
          #   @return [Integer, nil]
          optional :max_age_ms, Integer, api_name: :maxAgeMs

          # @!attribute max_speed
          #   Optional parameter to optimize the API call for maximum speed. When set to true,
          #   the API will skip time-consuming operations for faster response at the cost of
          #   less comprehensive data.
          #
          #   @return [Boolean, nil]
          optional :max_speed, ContextDev::Internal::Type::Boolean, api_name: :maxSpeed

          # @!attribute tags
          #   Optional caller-defined tags for tracking this request. Tags are recorded on the
          #   request's usage log and can be used to filter usage on the dashboard usage page.
          #   Up to 20 tags, each 1-50 characters.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute timeout_ms
          #   Optional timeout in milliseconds for the request. If the request takes longer
          #   than this value, it will be aborted with a 408 status code. Maximum allowed
          #   value is 300000ms (5 minutes).
          #
          #   @return [Integer, nil]
          optional :timeout_ms, Integer, api_name: :timeoutMS

          # @!method initialize(name:, country_gl: nil, force_language: nil, max_age_ms: nil, max_speed: nil, tags: nil, timeout_ms: nil, type: :by_name)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::ByName} for more details.
          #
          #   Retrieve brand data by company name. Cannot be combined with domain, email, or
          #   ticker.
          #
          #   @param name [String] Company name to retrieve brand data for (e.g., 'Apple Inc').
          #
          #   @param country_gl [String] Optional country code hint (GL parameter) to specify the country when looking up
          #
          #   @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByName::ForceLanguage, nil]
          #
          #   @param max_age_ms [Integer] Maximum age in milliseconds for cached brand data before the API performs a hard
          #
          #   @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
          #
          #   @param tags [Array<String>] Optional caller-defined tags for tracking this request. Tags are recorded on the
          #
          #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
          #
          #   @param type [Symbol, :by_name] Discriminator for name-based brand retrieval.

          # @see ContextDev::Models::BrandRetrieveParams::Body::ByName#force_language
          module ForceLanguage
            extend ContextDev::Internal::Type::Enum

            AFRIKAANS = :afrikaans
            ALBANIAN = :albanian
            AMHARIC = :amharic
            ARABIC = :arabic
            ARMENIAN = :armenian
            ASSAMESE = :assamese
            AYMARA = :aymara
            AZERI = :azeri
            BASQUE = :basque
            BELARUSIAN = :belarusian
            BENGALI = :bengali
            BOSNIAN = :bosnian
            BULGARIAN = :bulgarian
            BURMESE = :burmese
            CANTONESE = :cantonese
            CATALAN = :catalan
            CEBUANO = :cebuano
            CHINESE = :chinese
            CORSICAN = :corsican
            CROATIAN = :croatian
            CZECH = :czech
            DANISH = :danish
            DUTCH = :dutch
            ENGLISH = :english
            ESPERANTO = :esperanto
            ESTONIAN = :estonian
            FARSI = :farsi
            FIJIAN = :fijian
            FINNISH = :finnish
            FRENCH = :french
            GALICIAN = :galician
            GEORGIAN = :georgian
            GERMAN = :german
            GREEK = :greek
            GUARANI = :guarani
            GUJARATI = :gujarati
            HAITIAN_CREOLE = :"haitian-creole"
            HAUSA = :hausa
            HAWAIIAN = :hawaiian
            HEBREW = :hebrew
            HINDI = :hindi
            HMONG = :hmong
            HUNGARIAN = :hungarian
            ICELANDIC = :icelandic
            IGBO = :igbo
            INDONESIAN = :indonesian
            IRISH = :irish
            ITALIAN = :italian
            JAPANESE = :japanese
            JAVANESE = :javanese
            KANNADA = :kannada
            KAZAKH = :kazakh
            KHMER = :khmer
            KINYARWANDA = :kinyarwanda
            KOREAN = :korean
            KURDISH = :kurdish
            KYRGYZ = :kyrgyz
            LAO = :lao
            LATIN = :latin
            LATVIAN = :latvian
            LINGALA = :lingala
            LITHUANIAN = :lithuanian
            LUXEMBOURGISH = :luxembourgish
            MACEDONIAN = :macedonian
            MALAGASY = :malagasy
            MALAY = :malay
            MALAYALAM = :malayalam
            MALTESE = :maltese
            MAORI = :maori
            MARATHI = :marathi
            MONGOLIAN = :mongolian
            NEPALI = :nepali
            NORWEGIAN = :norwegian
            ODIA = :odia
            OROMO = :oromo
            PASHTO = :pashto
            PIDGIN = :pidgin
            POLISH = :polish
            PORTUGUESE = :portuguese
            PUNJABI = :punjabi
            QUECHUA = :quechua
            ROMANIAN = :romanian
            RUSSIAN = :russian
            SAMOAN = :samoan
            SCOTTISH_GAELIC = :"scottish-gaelic"
            SERBIAN = :serbian
            SESOTHO = :sesotho
            SHONA = :shona
            SINDHI = :sindhi
            SINHALA = :sinhala
            SLOVAK = :slovak
            SLOVENE = :slovene
            SOMALI = :somali
            SPANISH = :spanish
            SUNDANESE = :sundanese
            SWAHILI = :swahili
            SWEDISH = :swedish
            TAGALOG = :tagalog
            TAJIK = :tajik
            TAMIL = :tamil
            TATAR = :tatar
            TELUGU = :telugu
            THAI = :thai
            TIBETAN = :tibetan
            TIGRINYA = :tigrinya
            TONGAN = :tongan
            TSWANA = :tswana
            TURKISH = :turkish
            TURKMEN = :turkmen
            UKRAINIAN = :ukrainian
            URDU = :urdu
            UYGHUR = :uyghur
            UZBEK = :uzbek
            VIETNAMESE = :vietnamese
            WELSH = :welsh
            WOLOF = :wolof
            XHOSA = :xhosa
            YIDDISH = :yiddish
            YORUBA = :yoruba
            ZULU = :zulu

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class ByEmail < ContextDev::Internal::Type::BaseModel
          # @!attribute email
          #   Email address to retrieve brand data for (e.g., 'jane@stripe.com').
          #
          #   @return [String]
          required :email, String

          # @!attribute type
          #   Discriminator for email-based brand retrieval.
          #
          #   @return [Symbol, :by_email]
          required :type, const: :by_email

          # @!attribute force_language
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByEmail::ForceLanguage, nil]
          optional :force_language,
                   enum: -> { ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage },
                   nil?: true

          # @!attribute max_age_ms
          #   Maximum age in milliseconds for cached brand data before the API performs a hard
          #   refresh. Defaults to 3 months (7776000000 ms). Values below 1 day (86400000 ms)
          #   are clamped to 1 day; values above 1 year (31536000000 ms) are clamped to 1
          #   year.
          #
          #   @return [Integer, nil]
          optional :max_age_ms, Integer, api_name: :maxAgeMs

          # @!attribute max_speed
          #   Optional parameter to optimize the API call for maximum speed. When set to true,
          #   the API will skip time-consuming operations for faster response at the cost of
          #   less comprehensive data.
          #
          #   @return [Boolean, nil]
          optional :max_speed, ContextDev::Internal::Type::Boolean, api_name: :maxSpeed

          # @!attribute tags
          #   Optional caller-defined tags for tracking this request. Tags are recorded on the
          #   request's usage log and can be used to filter usage on the dashboard usage page.
          #   Up to 20 tags, each 1-50 characters.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute timeout_ms
          #   Optional timeout in milliseconds for the request. If the request takes longer
          #   than this value, it will be aborted with a 408 status code. Maximum allowed
          #   value is 300000ms (5 minutes).
          #
          #   @return [Integer, nil]
          optional :timeout_ms, Integer, api_name: :timeoutMS

          # @!method initialize(email:, force_language: nil, max_age_ms: nil, max_speed: nil, tags: nil, timeout_ms: nil, type: :by_email)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::ByEmail} for more details.
          #
          #   Retrieve brand data by email address. The domain is extracted from the email.
          #   Free and disposable email providers are rejected with 422. Cannot be combined
          #   with domain, name, or ticker.
          #
          #   @param email [String] Email address to retrieve brand data for (e.g., 'jane@stripe.com').
          #
          #   @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByEmail::ForceLanguage, nil]
          #
          #   @param max_age_ms [Integer] Maximum age in milliseconds for cached brand data before the API performs a hard
          #
          #   @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
          #
          #   @param tags [Array<String>] Optional caller-defined tags for tracking this request. Tags are recorded on the
          #
          #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
          #
          #   @param type [Symbol, :by_email] Discriminator for email-based brand retrieval.

          # @see ContextDev::Models::BrandRetrieveParams::Body::ByEmail#force_language
          module ForceLanguage
            extend ContextDev::Internal::Type::Enum

            AFRIKAANS = :afrikaans
            ALBANIAN = :albanian
            AMHARIC = :amharic
            ARABIC = :arabic
            ARMENIAN = :armenian
            ASSAMESE = :assamese
            AYMARA = :aymara
            AZERI = :azeri
            BASQUE = :basque
            BELARUSIAN = :belarusian
            BENGALI = :bengali
            BOSNIAN = :bosnian
            BULGARIAN = :bulgarian
            BURMESE = :burmese
            CANTONESE = :cantonese
            CATALAN = :catalan
            CEBUANO = :cebuano
            CHINESE = :chinese
            CORSICAN = :corsican
            CROATIAN = :croatian
            CZECH = :czech
            DANISH = :danish
            DUTCH = :dutch
            ENGLISH = :english
            ESPERANTO = :esperanto
            ESTONIAN = :estonian
            FARSI = :farsi
            FIJIAN = :fijian
            FINNISH = :finnish
            FRENCH = :french
            GALICIAN = :galician
            GEORGIAN = :georgian
            GERMAN = :german
            GREEK = :greek
            GUARANI = :guarani
            GUJARATI = :gujarati
            HAITIAN_CREOLE = :"haitian-creole"
            HAUSA = :hausa
            HAWAIIAN = :hawaiian
            HEBREW = :hebrew
            HINDI = :hindi
            HMONG = :hmong
            HUNGARIAN = :hungarian
            ICELANDIC = :icelandic
            IGBO = :igbo
            INDONESIAN = :indonesian
            IRISH = :irish
            ITALIAN = :italian
            JAPANESE = :japanese
            JAVANESE = :javanese
            KANNADA = :kannada
            KAZAKH = :kazakh
            KHMER = :khmer
            KINYARWANDA = :kinyarwanda
            KOREAN = :korean
            KURDISH = :kurdish
            KYRGYZ = :kyrgyz
            LAO = :lao
            LATIN = :latin
            LATVIAN = :latvian
            LINGALA = :lingala
            LITHUANIAN = :lithuanian
            LUXEMBOURGISH = :luxembourgish
            MACEDONIAN = :macedonian
            MALAGASY = :malagasy
            MALAY = :malay
            MALAYALAM = :malayalam
            MALTESE = :maltese
            MAORI = :maori
            MARATHI = :marathi
            MONGOLIAN = :mongolian
            NEPALI = :nepali
            NORWEGIAN = :norwegian
            ODIA = :odia
            OROMO = :oromo
            PASHTO = :pashto
            PIDGIN = :pidgin
            POLISH = :polish
            PORTUGUESE = :portuguese
            PUNJABI = :punjabi
            QUECHUA = :quechua
            ROMANIAN = :romanian
            RUSSIAN = :russian
            SAMOAN = :samoan
            SCOTTISH_GAELIC = :"scottish-gaelic"
            SERBIAN = :serbian
            SESOTHO = :sesotho
            SHONA = :shona
            SINDHI = :sindhi
            SINHALA = :sinhala
            SLOVAK = :slovak
            SLOVENE = :slovene
            SOMALI = :somali
            SPANISH = :spanish
            SUNDANESE = :sundanese
            SWAHILI = :swahili
            SWEDISH = :swedish
            TAGALOG = :tagalog
            TAJIK = :tajik
            TAMIL = :tamil
            TATAR = :tatar
            TELUGU = :telugu
            THAI = :thai
            TIBETAN = :tibetan
            TIGRINYA = :tigrinya
            TONGAN = :tongan
            TSWANA = :tswana
            TURKISH = :turkish
            TURKMEN = :turkmen
            UKRAINIAN = :ukrainian
            URDU = :urdu
            UYGHUR = :uyghur
            UZBEK = :uzbek
            VIETNAMESE = :vietnamese
            WELSH = :welsh
            WOLOF = :wolof
            XHOSA = :xhosa
            YIDDISH = :yiddish
            YORUBA = :yoruba
            ZULU = :zulu

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class ByTicker < ContextDev::Internal::Type::BaseModel
          # @!attribute ticker
          #   Stock ticker symbol to retrieve brand data for (e.g., 'AAPL').
          #
          #   @return [String]
          required :ticker, String

          # @!attribute type
          #   Discriminator for ticker-based brand retrieval.
          #
          #   @return [Symbol, :by_ticker]
          required :type, const: :by_ticker

          # @!attribute force_language
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTicker::ForceLanguage, nil]
          optional :force_language,
                   enum: -> { ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage },
                   nil?: true

          # @!attribute max_age_ms
          #   Maximum age in milliseconds for cached brand data before the API performs a hard
          #   refresh. Defaults to 3 months (7776000000 ms). Values below 1 day (86400000 ms)
          #   are clamped to 1 day; values above 1 year (31536000000 ms) are clamped to 1
          #   year.
          #
          #   @return [Integer, nil]
          optional :max_age_ms, Integer, api_name: :maxAgeMs

          # @!attribute max_speed
          #   Optional parameter to optimize the API call for maximum speed. When set to true,
          #   the API will skip time-consuming operations for faster response at the cost of
          #   less comprehensive data.
          #
          #   @return [Boolean, nil]
          optional :max_speed, ContextDev::Internal::Type::Boolean, api_name: :maxSpeed

          # @!attribute tags
          #   Optional caller-defined tags for tracking this request. Tags are recorded on the
          #   request's usage log and can be used to filter usage on the dashboard usage page.
          #   Up to 20 tags, each 1-50 characters.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute ticker_exchange
          #   Optional stock exchange for the ticker. Defaults to NASDAQ if not specified.
          #
          #   @return [String, nil]
          optional :ticker_exchange, String

          # @!attribute timeout_ms
          #   Optional timeout in milliseconds for the request. If the request takes longer
          #   than this value, it will be aborted with a 408 status code. Maximum allowed
          #   value is 300000ms (5 minutes).
          #
          #   @return [Integer, nil]
          optional :timeout_ms, Integer, api_name: :timeoutMS

          # @!method initialize(ticker:, force_language: nil, max_age_ms: nil, max_speed: nil, tags: nil, ticker_exchange: nil, timeout_ms: nil, type: :by_ticker)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::ByTicker} for more details.
          #
          #   Retrieve brand data by stock ticker. Cannot be combined with domain, name, or
          #   email.
          #
          #   @param ticker [String] Stock ticker symbol to retrieve brand data for (e.g., 'AAPL').
          #
          #   @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTicker::ForceLanguage, nil]
          #
          #   @param max_age_ms [Integer] Maximum age in milliseconds for cached brand data before the API performs a hard
          #
          #   @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
          #
          #   @param tags [Array<String>] Optional caller-defined tags for tracking this request. Tags are recorded on the
          #
          #   @param ticker_exchange [String] Optional stock exchange for the ticker. Defaults to NASDAQ if not specified.
          #
          #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
          #
          #   @param type [Symbol, :by_ticker] Discriminator for ticker-based brand retrieval.

          # @see ContextDev::Models::BrandRetrieveParams::Body::ByTicker#force_language
          module ForceLanguage
            extend ContextDev::Internal::Type::Enum

            AFRIKAANS = :afrikaans
            ALBANIAN = :albanian
            AMHARIC = :amharic
            ARABIC = :arabic
            ARMENIAN = :armenian
            ASSAMESE = :assamese
            AYMARA = :aymara
            AZERI = :azeri
            BASQUE = :basque
            BELARUSIAN = :belarusian
            BENGALI = :bengali
            BOSNIAN = :bosnian
            BULGARIAN = :bulgarian
            BURMESE = :burmese
            CANTONESE = :cantonese
            CATALAN = :catalan
            CEBUANO = :cebuano
            CHINESE = :chinese
            CORSICAN = :corsican
            CROATIAN = :croatian
            CZECH = :czech
            DANISH = :danish
            DUTCH = :dutch
            ENGLISH = :english
            ESPERANTO = :esperanto
            ESTONIAN = :estonian
            FARSI = :farsi
            FIJIAN = :fijian
            FINNISH = :finnish
            FRENCH = :french
            GALICIAN = :galician
            GEORGIAN = :georgian
            GERMAN = :german
            GREEK = :greek
            GUARANI = :guarani
            GUJARATI = :gujarati
            HAITIAN_CREOLE = :"haitian-creole"
            HAUSA = :hausa
            HAWAIIAN = :hawaiian
            HEBREW = :hebrew
            HINDI = :hindi
            HMONG = :hmong
            HUNGARIAN = :hungarian
            ICELANDIC = :icelandic
            IGBO = :igbo
            INDONESIAN = :indonesian
            IRISH = :irish
            ITALIAN = :italian
            JAPANESE = :japanese
            JAVANESE = :javanese
            KANNADA = :kannada
            KAZAKH = :kazakh
            KHMER = :khmer
            KINYARWANDA = :kinyarwanda
            KOREAN = :korean
            KURDISH = :kurdish
            KYRGYZ = :kyrgyz
            LAO = :lao
            LATIN = :latin
            LATVIAN = :latvian
            LINGALA = :lingala
            LITHUANIAN = :lithuanian
            LUXEMBOURGISH = :luxembourgish
            MACEDONIAN = :macedonian
            MALAGASY = :malagasy
            MALAY = :malay
            MALAYALAM = :malayalam
            MALTESE = :maltese
            MAORI = :maori
            MARATHI = :marathi
            MONGOLIAN = :mongolian
            NEPALI = :nepali
            NORWEGIAN = :norwegian
            ODIA = :odia
            OROMO = :oromo
            PASHTO = :pashto
            PIDGIN = :pidgin
            POLISH = :polish
            PORTUGUESE = :portuguese
            PUNJABI = :punjabi
            QUECHUA = :quechua
            ROMANIAN = :romanian
            RUSSIAN = :russian
            SAMOAN = :samoan
            SCOTTISH_GAELIC = :"scottish-gaelic"
            SERBIAN = :serbian
            SESOTHO = :sesotho
            SHONA = :shona
            SINDHI = :sindhi
            SINHALA = :sinhala
            SLOVAK = :slovak
            SLOVENE = :slovene
            SOMALI = :somali
            SPANISH = :spanish
            SUNDANESE = :sundanese
            SWAHILI = :swahili
            SWEDISH = :swedish
            TAGALOG = :tagalog
            TAJIK = :tajik
            TAMIL = :tamil
            TATAR = :tatar
            TELUGU = :telugu
            THAI = :thai
            TIBETAN = :tibetan
            TIGRINYA = :tigrinya
            TONGAN = :tongan
            TSWANA = :tswana
            TURKISH = :turkish
            TURKMEN = :turkmen
            UKRAINIAN = :ukrainian
            URDU = :urdu
            UYGHUR = :uyghur
            UZBEK = :uzbek
            VIETNAMESE = :vietnamese
            WELSH = :welsh
            WOLOF = :wolof
            XHOSA = :xhosa
            YIDDISH = :yiddish
            YORUBA = :yoruba
            ZULU = :zulu

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class ByDirectURL < ContextDev::Internal::Type::BaseModel
          # @!attribute direct_url
          #   Full http(s) URL to fetch brand data from (e.g.,
          #   'https://stripe.com/enterprise'). Only this URL is fetched — not the entire
          #   internet.
          #
          #   @return [String]
          required :direct_url, String

          # @!attribute type
          #   Discriminator for direct-URL-based brand retrieval.
          #
          #   @return [Symbol, :by_direct_url]
          required :type, const: :by_direct_url

          # @!attribute tags
          #   Optional caller-defined tags for tracking this request. Tags are recorded on the
          #   request's usage log and can be used to filter usage on the dashboard usage page.
          #   Up to 20 tags, each 1-50 characters.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute timeout_ms
          #   Optional timeout in milliseconds for the request. If the request takes longer
          #   than this value, it will be aborted with a 408 status code. Maximum allowed
          #   value is 300000ms (5 minutes).
          #
          #   @return [Integer, nil]
          optional :timeout_ms, Integer, api_name: :timeoutMS

          # @!method initialize(direct_url:, tags: nil, timeout_ms: nil, type: :by_direct_url)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL} for more details.
          #
          #   Retrieve brand data by fetching the provided URL directly. Note: if you use
          #   this, brand data is fetched only from the provided URL — not from the entire
          #   internet — so results are limited to what that single page contains. No domain
          #   resolution, database lookup, or cross-source enrichment is performed. Cannot be
          #   combined with domain, name, email, or ticker.
          #
          #   @param direct_url [String] Full http(s) URL to fetch brand data from (e.g., 'https://stripe.com/enterprise'
          #
          #   @param tags [Array<String>] Optional caller-defined tags for tracking this request. Tags are recorded on the
          #
          #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
          #
          #   @param type [Symbol, :by_direct_url] Discriminator for direct-URL-based brand retrieval.
        end

        class ByTransaction < ContextDev::Internal::Type::BaseModel
          # @!attribute transaction_info
          #   Transaction information to identify the brand.
          #
          #   @return [String]
          required :transaction_info, String

          # @!attribute type
          #   Discriminator for transaction-based brand retrieval.
          #
          #   @return [Symbol, :by_transaction]
          required :type, const: :by_transaction

          # @!attribute city
          #   Optional city name to prioritize when searching for the brand.
          #
          #   @return [String, nil]
          optional :city, String

          # @!attribute country_gl
          #   Optional country code hint (GL parameter) to specify the country when
          #   identifying a transaction.
          #
          #   @return [String, nil]
          optional :country_gl, String

          # @!attribute force_language
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::ForceLanguage, nil]
          optional :force_language,
                   enum: -> { ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage },
                   nil?: true

          # @!attribute high_confidence_only
          #   When set to true, the API performs additional verification to ensure the
          #   identified brand matches the transaction with high confidence.
          #
          #   @return [Boolean, nil]
          optional :high_confidence_only, ContextDev::Internal::Type::Boolean

          # @!attribute max_speed
          #   Optional parameter to optimize the API call for maximum speed. When set to true,
          #   the API will skip time-consuming operations for faster response at the cost of
          #   less comprehensive data.
          #
          #   @return [Boolean, nil]
          optional :max_speed, ContextDev::Internal::Type::Boolean, api_name: :maxSpeed

          # @!attribute mcc
          #   Optional Merchant Category Code (MCC) to help identify the business category or
          #   industry.
          #
          #   @return [String, Float, nil]
          optional :mcc, union: -> { ContextDev::BrandRetrieveParams::Body::ByTransaction::Mcc }

          # @!attribute phone
          #   Optional phone number from the transaction to help verify brand match.
          #
          #   @return [String, Float, nil]
          optional :phone, union: -> { ContextDev::BrandRetrieveParams::Body::ByTransaction::Phone }

          # @!attribute tags
          #   Optional caller-defined tags for tracking this request. Tags are recorded on the
          #   request's usage log and can be used to filter usage on the dashboard usage page.
          #   Up to 20 tags, each 1-50 characters.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute timeout_ms
          #   Optional timeout in milliseconds for the request. If the request takes longer
          #   than this value, it will be aborted with a 408 status code. Maximum allowed
          #   value is 300000ms (5 minutes).
          #
          #   @return [Integer, nil]
          optional :timeout_ms, Integer, api_name: :timeoutMS

          # @!method initialize(transaction_info:, city: nil, country_gl: nil, force_language: nil, high_confidence_only: nil, max_speed: nil, mcc: nil, phone: nil, tags: nil, timeout_ms: nil, type: :by_transaction)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::ByTransaction} for more details.
          #
          #   Identify brand data from a transaction descriptor. Cannot be combined with
          #   domain, name, email, or ticker.
          #
          #   @param transaction_info [String] Transaction information to identify the brand.
          #
          #   @param city [String] Optional city name to prioritize when searching for the brand.
          #
          #   @param country_gl [String] Optional country code hint (GL parameter) to specify the country when identifyin
          #
          #   @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::ForceLanguage, nil]
          #
          #   @param high_confidence_only [Boolean] When set to true, the API performs additional verification to ensure the identif
          #
          #   @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
          #
          #   @param mcc [String, Float] Optional Merchant Category Code (MCC) to help identify the business category or
          #
          #   @param phone [String, Float] Optional phone number from the transaction to help verify brand match.
          #
          #   @param tags [Array<String>] Optional caller-defined tags for tracking this request. Tags are recorded on the
          #
          #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
          #
          #   @param type [Symbol, :by_transaction] Discriminator for transaction-based brand retrieval.

          # @see ContextDev::Models::BrandRetrieveParams::Body::ByTransaction#force_language
          module ForceLanguage
            extend ContextDev::Internal::Type::Enum

            AFRIKAANS = :afrikaans
            ALBANIAN = :albanian
            AMHARIC = :amharic
            ARABIC = :arabic
            ARMENIAN = :armenian
            ASSAMESE = :assamese
            AYMARA = :aymara
            AZERI = :azeri
            BASQUE = :basque
            BELARUSIAN = :belarusian
            BENGALI = :bengali
            BOSNIAN = :bosnian
            BULGARIAN = :bulgarian
            BURMESE = :burmese
            CANTONESE = :cantonese
            CATALAN = :catalan
            CEBUANO = :cebuano
            CHINESE = :chinese
            CORSICAN = :corsican
            CROATIAN = :croatian
            CZECH = :czech
            DANISH = :danish
            DUTCH = :dutch
            ENGLISH = :english
            ESPERANTO = :esperanto
            ESTONIAN = :estonian
            FARSI = :farsi
            FIJIAN = :fijian
            FINNISH = :finnish
            FRENCH = :french
            GALICIAN = :galician
            GEORGIAN = :georgian
            GERMAN = :german
            GREEK = :greek
            GUARANI = :guarani
            GUJARATI = :gujarati
            HAITIAN_CREOLE = :"haitian-creole"
            HAUSA = :hausa
            HAWAIIAN = :hawaiian
            HEBREW = :hebrew
            HINDI = :hindi
            HMONG = :hmong
            HUNGARIAN = :hungarian
            ICELANDIC = :icelandic
            IGBO = :igbo
            INDONESIAN = :indonesian
            IRISH = :irish
            ITALIAN = :italian
            JAPANESE = :japanese
            JAVANESE = :javanese
            KANNADA = :kannada
            KAZAKH = :kazakh
            KHMER = :khmer
            KINYARWANDA = :kinyarwanda
            KOREAN = :korean
            KURDISH = :kurdish
            KYRGYZ = :kyrgyz
            LAO = :lao
            LATIN = :latin
            LATVIAN = :latvian
            LINGALA = :lingala
            LITHUANIAN = :lithuanian
            LUXEMBOURGISH = :luxembourgish
            MACEDONIAN = :macedonian
            MALAGASY = :malagasy
            MALAY = :malay
            MALAYALAM = :malayalam
            MALTESE = :maltese
            MAORI = :maori
            MARATHI = :marathi
            MONGOLIAN = :mongolian
            NEPALI = :nepali
            NORWEGIAN = :norwegian
            ODIA = :odia
            OROMO = :oromo
            PASHTO = :pashto
            PIDGIN = :pidgin
            POLISH = :polish
            PORTUGUESE = :portuguese
            PUNJABI = :punjabi
            QUECHUA = :quechua
            ROMANIAN = :romanian
            RUSSIAN = :russian
            SAMOAN = :samoan
            SCOTTISH_GAELIC = :"scottish-gaelic"
            SERBIAN = :serbian
            SESOTHO = :sesotho
            SHONA = :shona
            SINDHI = :sindhi
            SINHALA = :sinhala
            SLOVAK = :slovak
            SLOVENE = :slovene
            SOMALI = :somali
            SPANISH = :spanish
            SUNDANESE = :sundanese
            SWAHILI = :swahili
            SWEDISH = :swedish
            TAGALOG = :tagalog
            TAJIK = :tajik
            TAMIL = :tamil
            TATAR = :tatar
            TELUGU = :telugu
            THAI = :thai
            TIBETAN = :tibetan
            TIGRINYA = :tigrinya
            TONGAN = :tongan
            TSWANA = :tswana
            TURKISH = :turkish
            TURKMEN = :turkmen
            UKRAINIAN = :ukrainian
            URDU = :urdu
            UYGHUR = :uyghur
            UZBEK = :uzbek
            VIETNAMESE = :vietnamese
            WELSH = :welsh
            WOLOF = :wolof
            XHOSA = :xhosa
            YIDDISH = :yiddish
            YORUBA = :yoruba
            ZULU = :zulu

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Optional Merchant Category Code (MCC) to help identify the business category or
          # industry.
          #
          # @see ContextDev::Models::BrandRetrieveParams::Body::ByTransaction#mcc
          module Mcc
            extend ContextDev::Internal::Type::Union

            variant String

            variant Float

            # @!method self.variants
            #   @return [Array(String, Float)]
          end

          # Optional phone number from the transaction to help verify brand match.
          #
          # @see ContextDev::Models::BrandRetrieveParams::Body::ByTransaction#phone
          module Phone
            extend ContextDev::Internal::Type::Union

            variant String

            variant Float

            # @!method self.variants
            #   @return [Array(String, Float)]
          end
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::BrandRetrieveParams::Body::ByDomain, ContextDev::Models::BrandRetrieveParams::Body::ByName, ContextDev::Models::BrandRetrieveParams::Body::ByEmail, ContextDev::Models::BrandRetrieveParams::Body::ByTicker, ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction)]
      end
    end
  end
end
