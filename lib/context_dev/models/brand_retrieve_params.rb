# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Brand#retrieve
    class BrandRetrieveParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute body
      #   Exactly one of domain, name, email, ticker, or transaction_info must be
      #   provided.
      #
      #   @return [ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByNameRequest, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest]
      required :body, union: -> { ContextDev::BrandRetrieveParams::Body }

      # @!method initialize(body:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BrandRetrieveParams} for more details.
      #
      #   @param body [ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByNameRequest, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest] Exactly one of domain, name, email, ticker, or transaction_info must be provided
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Exactly one of domain, name, email, ticker, or transaction_info must be
      # provided.
      module Body
        extend ContextDev::Internal::Type::Union

        # Retrieve brand data by domain. Cannot be combined with name, email, or ticker.
        variant -> { ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest }

        # Retrieve brand data by company name. Cannot be combined with domain, email, or ticker.
        variant -> { ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest }

        # Retrieve brand data by email address. The domain is extracted from the email. Free and disposable email providers are rejected with 422. Cannot be combined with domain, name, or ticker.
        variant -> { ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest }

        # Retrieve brand data by stock ticker. Cannot be combined with domain, name, or email.
        variant -> { ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest }

        # Identify brand data from a transaction descriptor. Cannot be combined with domain, name, email, or ticker.
        variant -> { ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest }

        class BrandRetrieveByDomainRequest < ContextDev::Internal::Type::BaseModel
          # @!attribute domain
          #   Domain name to retrieve brand data for (e.g., 'stripe.com').
          #
          #   @return [String]
          required :domain, String

          # @!attribute force_language
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage, nil]
          optional :force_language,
                   enum: -> { ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage }

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

          # @!attribute timeout_ms
          #   Optional timeout in milliseconds for the request. If the request takes longer
          #   than this value, it will be aborted with a 408 status code. Maximum allowed
          #   value is 300000ms (5 minutes).
          #
          #   @return [Integer, nil]
          optional :timeout_ms, Integer, api_name: :timeoutMS

          # @!method initialize(domain:, force_language: nil, max_age_ms: nil, max_speed: nil, timeout_ms: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest}
          #   for more details.
          #
          #   Retrieve brand data by domain. Cannot be combined with name, email, or ticker.
          #
          #   @param domain [String] Domain name to retrieve brand data for (e.g., 'stripe.com').
          #
          #   @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage]
          #
          #   @param max_age_ms [Integer] Maximum age in milliseconds for cached brand data before the API performs a hard
          #
          #   @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
          #
          #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th

          # @see ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest#force_language
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

        class BrandRetrieveByNameRequest < ContextDev::Internal::Type::BaseModel
          # @!attribute name
          #   Company name to retrieve brand data for (e.g., 'Apple Inc').
          #
          #   @return [String]
          required :name, String

          # @!attribute country_gl
          #   Optional country code hint (GL parameter) to specify the country when looking up
          #   by company name.
          #
          #   @return [String, nil]
          optional :country_gl, String

          # @!attribute force_language
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage, nil]
          optional :force_language,
                   enum: -> { ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage }

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

          # @!attribute timeout_ms
          #   Optional timeout in milliseconds for the request. If the request takes longer
          #   than this value, it will be aborted with a 408 status code. Maximum allowed
          #   value is 300000ms (5 minutes).
          #
          #   @return [Integer, nil]
          optional :timeout_ms, Integer, api_name: :timeoutMS

          # @!method initialize(name:, country_gl: nil, force_language: nil, max_age_ms: nil, max_speed: nil, timeout_ms: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByNameRequest} for
          #   more details.
          #
          #   Retrieve brand data by company name. Cannot be combined with domain, email, or
          #   ticker.
          #
          #   @param name [String] Company name to retrieve brand data for (e.g., 'Apple Inc').
          #
          #   @param country_gl [String] Optional country code hint (GL parameter) to specify the country when looking up
          #
          #   @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage]
          #
          #   @param max_age_ms [Integer] Maximum age in milliseconds for cached brand data before the API performs a hard
          #
          #   @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
          #
          #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th

          # @see ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByNameRequest#force_language
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

        class BrandRetrieveByEmailRequest < ContextDev::Internal::Type::BaseModel
          # @!attribute email
          #   Email address to retrieve brand data for (e.g., 'jane@stripe.com').
          #
          #   @return [String]
          required :email, String

          # @!attribute force_language
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage, nil]
          optional :force_language,
                   enum: -> { ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage }

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

          # @!attribute timeout_ms
          #   Optional timeout in milliseconds for the request. If the request takes longer
          #   than this value, it will be aborted with a 408 status code. Maximum allowed
          #   value is 300000ms (5 minutes).
          #
          #   @return [Integer, nil]
          optional :timeout_ms, Integer, api_name: :timeoutMS

          # @!method initialize(email:, force_language: nil, max_age_ms: nil, max_speed: nil, timeout_ms: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest} for
          #   more details.
          #
          #   Retrieve brand data by email address. The domain is extracted from the email.
          #   Free and disposable email providers are rejected with 422. Cannot be combined
          #   with domain, name, or ticker.
          #
          #   @param email [String] Email address to retrieve brand data for (e.g., 'jane@stripe.com').
          #
          #   @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage]
          #
          #   @param max_age_ms [Integer] Maximum age in milliseconds for cached brand data before the API performs a hard
          #
          #   @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
          #
          #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th

          # @see ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest#force_language
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

        class BrandRetrieveByTickerRequest < ContextDev::Internal::Type::BaseModel
          # @!attribute ticker
          #   Stock ticker symbol to retrieve brand data for (e.g., 'AAPL').
          #
          #   @return [String]
          required :ticker, String

          # @!attribute force_language
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage, nil]
          optional :force_language,
                   enum: -> { ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage }

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

          # @!method initialize(ticker:, force_language: nil, max_age_ms: nil, max_speed: nil, ticker_exchange: nil, timeout_ms: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest}
          #   for more details.
          #
          #   Retrieve brand data by stock ticker. Cannot be combined with domain, name, or
          #   email.
          #
          #   @param ticker [String] Stock ticker symbol to retrieve brand data for (e.g., 'AAPL').
          #
          #   @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage]
          #
          #   @param max_age_ms [Integer] Maximum age in milliseconds for cached brand data before the API performs a hard
          #
          #   @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
          #
          #   @param ticker_exchange [String] Optional stock exchange for the ticker. Defaults to NASDAQ if not specified.
          #
          #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th

          # @see ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest#force_language
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

        class BrandRetrieveFromTransactionRequest < ContextDev::Internal::Type::BaseModel
          # @!attribute transaction_info
          #   Transaction information to identify the brand.
          #
          #   @return [String]
          required :transaction_info, String

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
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage, nil]
          optional :force_language,
                   enum: -> { ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage }

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
          #   @return [Integer, nil]
          optional :mcc, Integer

          # @!attribute phone
          #   Optional phone number from the transaction to help verify brand match.
          #
          #   @return [Float, nil]
          optional :phone, Float

          # @!attribute timeout_ms
          #   Optional timeout in milliseconds for the request. If the request takes longer
          #   than this value, it will be aborted with a 408 status code. Maximum allowed
          #   value is 300000ms (5 minutes).
          #
          #   @return [Integer, nil]
          optional :timeout_ms, Integer, api_name: :timeoutMS

          # @!method initialize(transaction_info:, city: nil, country_gl: nil, force_language: nil, high_confidence_only: nil, max_speed: nil, mcc: nil, phone: nil, timeout_ms: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest}
          #   for more details.
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
          #   @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage]
          #
          #   @param high_confidence_only [Boolean] When set to true, the API performs additional verification to ensure the identif
          #
          #   @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
          #
          #   @param mcc [Integer] Optional Merchant Category Code (MCC) to help identify the business category or
          #
          #   @param phone [Float] Optional phone number from the transaction to help verify brand match.
          #
          #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th

          # @see ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest#force_language
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

        # @!method self.variants
        #   @return [Array(ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByNameRequest, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest, ContextDev::Models::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest)]
      end
    end
  end
end
