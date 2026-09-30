# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Brand#retrieve
    class BrandRetrieveParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute body
      #   One lookup, chosen by `type`.
      #
      #   @return [ContextDev::Models::BrandRetrieveParams::Body::ByDomain, ContextDev::Models::BrandRetrieveParams::Body::ByName, ContextDev::Models::BrandRetrieveParams::Body::ByEmail, ContextDev::Models::BrandRetrieveParams::Body::ByTicker, ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction]
      required :body, union: -> { ContextDev::BrandRetrieveParams::Body }

      # @!method initialize(body:, request_options: {})
      #   @param body [ContextDev::Models::BrandRetrieveParams::Body::ByDomain, ContextDev::Models::BrandRetrieveParams::Body::ByName, ContextDev::Models::BrandRetrieveParams::Body::ByEmail, ContextDev::Models::BrandRetrieveParams::Body::ByTicker, ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction] One lookup, chosen by `type`.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # One lookup, chosen by `type`.
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

        # Retrieve brand data from this exact URL. Cross-site enrichment and other lookup identifiers are excluded.
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
          #   Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1
          #   year. `0` refreshes.
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
          #   Labels for filtering usage in the dashboard.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute timeout_opts
          #   Request deadline and what to return when it passes.
          #
          #   @return [ContextDev::Models::BrandRetrieveParams::Body::ByDomain::TimeoutOpts, nil]
          optional :timeout_opts,
                   -> { ContextDev::BrandRetrieveParams::Body::ByDomain::TimeoutOpts },
                   api_name: :timeoutOpts

          # @!method initialize(domain:, force_language: nil, max_age_ms: nil, max_speed: nil, tags: nil, timeout_opts: nil, type: :by_domain)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::ByDomain} for more details.
          #
          #   Retrieve brand data by domain. Cannot be combined with name, email, or ticker.
          #
          #   @param domain [String] Domain name to retrieve brand data for (e.g., 'stripe.com').
          #
          #   @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByDomain::ForceLanguage, nil]
          #
          #   @param max_age_ms [Integer] Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1 yea
          #
          #   @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
          #
          #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
          #
          #   @param timeout_opts [ContextDev::Models::BrandRetrieveParams::Body::ByDomain::TimeoutOpts] Request deadline and what to return when it passes.
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

          # @see ContextDev::Models::BrandRetrieveParams::Body::ByDomain#timeout_opts
          class TimeoutOpts < ContextDev::Internal::Type::BaseModel
            # @!attribute milliseconds
            #   Deadline in milliseconds.
            #
            #   @return [Integer]
            required :milliseconds, Integer

            # @!attribute behavior
            #   "fail" returns 408 at the deadline. "return-partial" returns available results;
            #   inspect the response’s partial flag.
            #
            #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByDomain::TimeoutOpts::Behavior, nil]
            optional :behavior, enum: -> { ContextDev::BrandRetrieveParams::Body::ByDomain::TimeoutOpts::Behavior }

            # @!method initialize(milliseconds:, behavior: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::BrandRetrieveParams::Body::ByDomain::TimeoutOpts} for more
            #   details.
            #
            #   Request deadline and what to return when it passes.
            #
            #   @param milliseconds [Integer] Deadline in milliseconds.
            #
            #   @param behavior [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByDomain::TimeoutOpts::Behavior] "fail" returns 408 at the deadline. "return-partial" returns available results;

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            #
            # @see ContextDev::Models::BrandRetrieveParams::Body::ByDomain::TimeoutOpts#behavior
            module Behavior
              extend ContextDev::Internal::Type::Enum

              FAIL = :fail
              RETURN_PARTIAL = :"return-partial"

              # @!method self.values
              #   @return [Array<Symbol>]
            end
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
          #   Two-letter ISO 3166-1 alpha-2 country code (GL parameter) used to localize
          #   search.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByName::CountryGl, nil]
          optional :country_gl, enum: -> { ContextDev::BrandRetrieveParams::Body::ByName::CountryGl }

          # @!attribute force_language
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByName::ForceLanguage, nil]
          optional :force_language,
                   enum: -> { ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage },
                   nil?: true

          # @!attribute max_age_ms
          #   Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1
          #   year. `0` refreshes.
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
          #   Labels for filtering usage in the dashboard.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute timeout_opts
          #   Request deadline and what to return when it passes.
          #
          #   @return [ContextDev::Models::BrandRetrieveParams::Body::ByName::TimeoutOpts, nil]
          optional :timeout_opts,
                   -> { ContextDev::BrandRetrieveParams::Body::ByName::TimeoutOpts },
                   api_name: :timeoutOpts

          # @!method initialize(name:, country_gl: nil, force_language: nil, max_age_ms: nil, max_speed: nil, tags: nil, timeout_opts: nil, type: :by_name)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::ByName} for more details.
          #
          #   Retrieve brand data by company name. Cannot be combined with domain, email, or
          #   ticker.
          #
          #   @param name [String] Company name to retrieve brand data for (e.g., 'Apple Inc').
          #
          #   @param country_gl [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByName::CountryGl] Two-letter ISO 3166-1 alpha-2 country code (GL parameter) used to localize searc
          #
          #   @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByName::ForceLanguage, nil]
          #
          #   @param max_age_ms [Integer] Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1 yea
          #
          #   @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
          #
          #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
          #
          #   @param timeout_opts [ContextDev::Models::BrandRetrieveParams::Body::ByName::TimeoutOpts] Request deadline and what to return when it passes.
          #
          #   @param type [Symbol, :by_name] Discriminator for name-based brand retrieval.

          # Two-letter ISO 3166-1 alpha-2 country code (GL parameter) used to localize
          # search.
          #
          # @see ContextDev::Models::BrandRetrieveParams::Body::ByName#country_gl
          module CountryGl
            extend ContextDev::Internal::Type::Enum

            AF = :af
            AL = :al
            DZ = :dz
            AS = :as
            AD = :ad
            AO = :ao
            AI = :ai
            AQ = :aq
            AG = :ag
            AR = :ar
            AM = :am
            AW = :aw
            AU = :au
            AT = :at
            AZ = :az
            BS = :bs
            BH = :bh
            BD = :bd
            BB = :bb
            BY = :by
            BE = :be
            BZ = :bz
            BJ = :bj
            BM = :bm
            BT = :bt
            BO = :bo
            BA = :ba
            BW = :bw
            BV = :bv
            BR = :br
            IO = :io
            BN = :bn
            BG = :bg
            BF = :bf
            BI = :bi
            KH = :kh
            CM = :cm
            CA = :ca
            CV = :cv
            KY = :ky
            CF = :cf
            TD = :td
            CL = :cl
            CN = :cn
            CX = :cx
            CC = :cc
            CO = :co
            KM = :km
            CG = :cg
            CD = :cd
            CK = :ck
            CR = :cr
            CI = :ci
            HR = :hr
            CU = :cu
            CY = :cy
            CZ = :cz
            DK = :dk
            DJ = :dj
            DM = :dm
            DO = :do
            EC = :ec
            EG = :eg
            SV = :sv
            GQ = :gq
            ER = :er
            EE = :ee
            ET = :et
            FK = :fk
            FO = :fo
            FJ = :fj
            FI = :fi
            FR = :fr
            GF = :gf
            PF = :pf
            TF = :tf
            GA = :ga
            GM = :gm
            GE = :ge
            DE = :de
            GH = :gh
            GI = :gi
            GR = :gr
            GL = :gl
            GD = :gd
            GP = :gp
            GU = :gu
            GT = :gt
            GN = :gn
            GW = :gw
            GY = :gy
            HT = :ht
            HM = :hm
            VA = :va
            HN = :hn
            HK = :hk
            HU = :hu
            IS = :is
            IN = :in
            ID = :id
            IR = :ir
            IQ = :iq
            IE = :ie
            IL = :il
            IT = :it
            JM = :jm
            JP = :jp
            JO = :jo
            KZ = :kz
            KE = :ke
            KI = :ki
            KP = :kp
            KR = :kr
            KW = :kw
            KG = :kg
            LA = :la
            LV = :lv
            LB = :lb
            LS = :ls
            LR = :lr
            LY = :ly
            LI = :li
            LT = :lt
            LU = :lu
            MO = :mo
            MK = :mk
            MG = :mg
            MW = :mw
            MY = :my
            MV = :mv
            ML = :ml
            MT = :mt
            MH = :mh
            MQ = :mq
            MR = :mr
            MU = :mu
            YT = :yt
            MX = :mx
            FM = :fm
            MD = :md
            MC = :mc
            MN = :mn
            MS = :ms
            MA = :ma
            MZ = :mz
            MM = :mm
            NA = :na
            NR = :nr
            NP = :np
            NL = :nl
            AN = :an
            NC = :nc
            NZ = :nz
            NI = :ni
            NE = :ne
            NG = :ng
            NU = :nu
            NF = :nf
            MP = :mp
            NO = :no
            OM = :om
            PK = :pk
            PW = :pw
            PS = :ps
            PA = :pa
            PG = :pg
            PY = :py
            PE = :pe
            PH = :ph
            PN = :pn
            PL = :pl
            PT = :pt
            PR = :pr
            QA = :qa
            RE = :re
            RO = :ro
            RU = :ru
            RW = :rw
            SH = :sh
            KN = :kn
            LC = :lc
            PM = :pm
            VC = :vc
            WS = :ws
            SM = :sm
            ST = :st
            SA = :sa
            SN = :sn
            RS = :rs
            SC = :sc
            SL = :sl
            SG = :sg
            SK = :sk
            SI = :si
            SB = :sb
            SO = :so
            ZA = :za
            GS = :gs
            ES = :es
            LK = :lk
            SD = :sd
            SR = :sr
            SJ = :sj
            SZ = :sz
            SE = :se
            CH = :ch
            SY = :sy
            TW = :tw
            TJ = :tj
            TZ = :tz
            TH = :th
            TL = :tl
            TG = :tg
            TK = :tk
            TO = :to
            TT = :tt
            TN = :tn
            TR = :tr
            TM = :tm
            TC = :tc
            TV = :tv
            UG = :ug
            UA = :ua
            AE = :ae
            GB = :gb
            US = :us
            UM = :um
            UY = :uy
            UZ = :uz
            VU = :vu
            VE = :ve
            VN = :vn
            VG = :vg
            VI = :vi
            WF = :wf
            EH = :eh
            YE = :ye
            ZM = :zm
            ZW = :zw

            # @!method self.values
            #   @return [Array<Symbol>]
          end

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

          # @see ContextDev::Models::BrandRetrieveParams::Body::ByName#timeout_opts
          class TimeoutOpts < ContextDev::Internal::Type::BaseModel
            # @!attribute milliseconds
            #   Deadline in milliseconds.
            #
            #   @return [Integer]
            required :milliseconds, Integer

            # @!attribute behavior
            #   "fail" returns 408 at the deadline. "return-partial" returns available results;
            #   inspect the response’s partial flag.
            #
            #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByName::TimeoutOpts::Behavior, nil]
            optional :behavior, enum: -> { ContextDev::BrandRetrieveParams::Body::ByName::TimeoutOpts::Behavior }

            # @!method initialize(milliseconds:, behavior: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::BrandRetrieveParams::Body::ByName::TimeoutOpts} for more
            #   details.
            #
            #   Request deadline and what to return when it passes.
            #
            #   @param milliseconds [Integer] Deadline in milliseconds.
            #
            #   @param behavior [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByName::TimeoutOpts::Behavior] "fail" returns 408 at the deadline. "return-partial" returns available results;

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            #
            # @see ContextDev::Models::BrandRetrieveParams::Body::ByName::TimeoutOpts#behavior
            module Behavior
              extend ContextDev::Internal::Type::Enum

              FAIL = :fail
              RETURN_PARTIAL = :"return-partial"

              # @!method self.values
              #   @return [Array<Symbol>]
            end
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
          #   Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1
          #   year. `0` refreshes.
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
          #   Labels for filtering usage in the dashboard.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute timeout_opts
          #   Request deadline and what to return when it passes.
          #
          #   @return [ContextDev::Models::BrandRetrieveParams::Body::ByEmail::TimeoutOpts, nil]
          optional :timeout_opts,
                   -> { ContextDev::BrandRetrieveParams::Body::ByEmail::TimeoutOpts },
                   api_name: :timeoutOpts

          # @!method initialize(email:, force_language: nil, max_age_ms: nil, max_speed: nil, tags: nil, timeout_opts: nil, type: :by_email)
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
          #   @param max_age_ms [Integer] Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1 yea
          #
          #   @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
          #
          #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
          #
          #   @param timeout_opts [ContextDev::Models::BrandRetrieveParams::Body::ByEmail::TimeoutOpts] Request deadline and what to return when it passes.
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

          # @see ContextDev::Models::BrandRetrieveParams::Body::ByEmail#timeout_opts
          class TimeoutOpts < ContextDev::Internal::Type::BaseModel
            # @!attribute milliseconds
            #   Deadline in milliseconds.
            #
            #   @return [Integer]
            required :milliseconds, Integer

            # @!attribute behavior
            #   "fail" returns 408 at the deadline. "return-partial" returns available results;
            #   inspect the response’s partial flag.
            #
            #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByEmail::TimeoutOpts::Behavior, nil]
            optional :behavior, enum: -> { ContextDev::BrandRetrieveParams::Body::ByEmail::TimeoutOpts::Behavior }

            # @!method initialize(milliseconds:, behavior: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::BrandRetrieveParams::Body::ByEmail::TimeoutOpts} for more
            #   details.
            #
            #   Request deadline and what to return when it passes.
            #
            #   @param milliseconds [Integer] Deadline in milliseconds.
            #
            #   @param behavior [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByEmail::TimeoutOpts::Behavior] "fail" returns 408 at the deadline. "return-partial" returns available results;

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            #
            # @see ContextDev::Models::BrandRetrieveParams::Body::ByEmail::TimeoutOpts#behavior
            module Behavior
              extend ContextDev::Internal::Type::Enum

              FAIL = :fail
              RETURN_PARTIAL = :"return-partial"

              # @!method self.values
              #   @return [Array<Symbol>]
            end
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
          #   Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1
          #   year. `0` refreshes.
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
          #   Labels for filtering usage in the dashboard.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute ticker_exchange
          #   Stock exchange code.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTicker::TickerExchange, nil]
          optional :ticker_exchange, enum: -> { ContextDev::BrandRetrieveParams::Body::ByTicker::TickerExchange }

          # @!attribute timeout_opts
          #   Request deadline and what to return when it passes.
          #
          #   @return [ContextDev::Models::BrandRetrieveParams::Body::ByTicker::TimeoutOpts, nil]
          optional :timeout_opts,
                   -> { ContextDev::BrandRetrieveParams::Body::ByTicker::TimeoutOpts },
                   api_name: :timeoutOpts

          # @!method initialize(ticker:, force_language: nil, max_age_ms: nil, max_speed: nil, tags: nil, ticker_exchange: nil, timeout_opts: nil, type: :by_ticker)
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
          #   @param max_age_ms [Integer] Maximum age of cached brand data in ms. Defaults to 3 months; clamped to 0–1 yea
          #
          #   @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
          #
          #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
          #
          #   @param ticker_exchange [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTicker::TickerExchange] Stock exchange code.
          #
          #   @param timeout_opts [ContextDev::Models::BrandRetrieveParams::Body::ByTicker::TimeoutOpts] Request deadline and what to return when it passes.
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

          # Stock exchange code.
          #
          # @see ContextDev::Models::BrandRetrieveParams::Body::ByTicker#ticker_exchange
          module TickerExchange
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

          # @see ContextDev::Models::BrandRetrieveParams::Body::ByTicker#timeout_opts
          class TimeoutOpts < ContextDev::Internal::Type::BaseModel
            # @!attribute milliseconds
            #   Deadline in milliseconds.
            #
            #   @return [Integer]
            required :milliseconds, Integer

            # @!attribute behavior
            #   "fail" returns 408 at the deadline. "return-partial" returns available results;
            #   inspect the response’s partial flag.
            #
            #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTicker::TimeoutOpts::Behavior, nil]
            optional :behavior, enum: -> { ContextDev::BrandRetrieveParams::Body::ByTicker::TimeoutOpts::Behavior }

            # @!method initialize(milliseconds:, behavior: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::BrandRetrieveParams::Body::ByTicker::TimeoutOpts} for more
            #   details.
            #
            #   Request deadline and what to return when it passes.
            #
            #   @param milliseconds [Integer] Deadline in milliseconds.
            #
            #   @param behavior [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTicker::TimeoutOpts::Behavior] "fail" returns 408 at the deadline. "return-partial" returns available results;

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            #
            # @see ContextDev::Models::BrandRetrieveParams::Body::ByTicker::TimeoutOpts#behavior
            module Behavior
              extend ContextDev::Internal::Type::Enum

              FAIL = :fail
              RETURN_PARTIAL = :"return-partial"

              # @!method self.values
              #   @return [Array<Symbol>]
            end
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
          #   Labels for filtering usage in the dashboard.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute timeout_opts
          #   Request deadline and what to return when it passes.
          #
          #   @return [ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts, nil]
          optional :timeout_opts,
                   -> { ContextDev::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts },
                   api_name: :timeoutOpts

          # @!method initialize(direct_url:, tags: nil, timeout_opts: nil, type: :by_direct_url)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL} for more details.
          #
          #   Retrieve brand data from this exact URL. Cross-site enrichment and other lookup
          #   identifiers are excluded.
          #
          #   @param direct_url [String] Full http(s) URL to fetch brand data from (e.g., 'https://stripe.com/enterprise'
          #
          #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
          #
          #   @param timeout_opts [ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts] Request deadline and what to return when it passes.
          #
          #   @param type [Symbol, :by_direct_url] Discriminator for direct-URL-based brand retrieval.

          # @see ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL#timeout_opts
          class TimeoutOpts < ContextDev::Internal::Type::BaseModel
            # @!attribute milliseconds
            #   Deadline in milliseconds.
            #
            #   @return [Integer]
            required :milliseconds, Integer

            # @!attribute behavior
            #   "fail" returns 408 at the deadline. "return-partial" returns available results;
            #   inspect the response’s partial flag.
            #
            #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts::Behavior, nil]
            optional :behavior, enum: -> { ContextDev::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts::Behavior }

            # @!method initialize(milliseconds:, behavior: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts} for
            #   more details.
            #
            #   Request deadline and what to return when it passes.
            #
            #   @param milliseconds [Integer] Deadline in milliseconds.
            #
            #   @param behavior [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts::Behavior] "fail" returns 408 at the deadline. "return-partial" returns available results;

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            #
            # @see ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts#behavior
            module Behavior
              extend ContextDev::Internal::Type::Enum

              FAIL = :fail
              RETURN_PARTIAL = :"return-partial"

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
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
          #   Two-letter ISO 3166-1 alpha-2 country code (GL parameter) used to localize
          #   search.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::CountryGl, nil]
          optional :country_gl, enum: -> { ContextDev::BrandRetrieveParams::Body::ByTransaction::CountryGl }

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
          #   Labels for filtering usage in the dashboard.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute timeout_opts
          #   Request deadline and what to return when it passes.
          #
          #   @return [ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts, nil]
          optional :timeout_opts,
                   -> { ContextDev::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts },
                   api_name: :timeoutOpts

          # @!method initialize(transaction_info:, city: nil, country_gl: nil, force_language: nil, high_confidence_only: nil, max_speed: nil, mcc: nil, phone: nil, tags: nil, timeout_opts: nil, type: :by_transaction)
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
          #   @param country_gl [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::CountryGl] Two-letter ISO 3166-1 alpha-2 country code (GL parameter) used to localize searc
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
          #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
          #
          #   @param timeout_opts [ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts] Request deadline and what to return when it passes.
          #
          #   @param type [Symbol, :by_transaction] Discriminator for transaction-based brand retrieval.

          # Two-letter ISO 3166-1 alpha-2 country code (GL parameter) used to localize
          # search.
          #
          # @see ContextDev::Models::BrandRetrieveParams::Body::ByTransaction#country_gl
          module CountryGl
            extend ContextDev::Internal::Type::Enum

            AF = :af
            AL = :al
            DZ = :dz
            AS = :as
            AD = :ad
            AO = :ao
            AI = :ai
            AQ = :aq
            AG = :ag
            AR = :ar
            AM = :am
            AW = :aw
            AU = :au
            AT = :at
            AZ = :az
            BS = :bs
            BH = :bh
            BD = :bd
            BB = :bb
            BY = :by
            BE = :be
            BZ = :bz
            BJ = :bj
            BM = :bm
            BT = :bt
            BO = :bo
            BA = :ba
            BW = :bw
            BV = :bv
            BR = :br
            IO = :io
            BN = :bn
            BG = :bg
            BF = :bf
            BI = :bi
            KH = :kh
            CM = :cm
            CA = :ca
            CV = :cv
            KY = :ky
            CF = :cf
            TD = :td
            CL = :cl
            CN = :cn
            CX = :cx
            CC = :cc
            CO = :co
            KM = :km
            CG = :cg
            CD = :cd
            CK = :ck
            CR = :cr
            CI = :ci
            HR = :hr
            CU = :cu
            CY = :cy
            CZ = :cz
            DK = :dk
            DJ = :dj
            DM = :dm
            DO = :do
            EC = :ec
            EG = :eg
            SV = :sv
            GQ = :gq
            ER = :er
            EE = :ee
            ET = :et
            FK = :fk
            FO = :fo
            FJ = :fj
            FI = :fi
            FR = :fr
            GF = :gf
            PF = :pf
            TF = :tf
            GA = :ga
            GM = :gm
            GE = :ge
            DE = :de
            GH = :gh
            GI = :gi
            GR = :gr
            GL = :gl
            GD = :gd
            GP = :gp
            GU = :gu
            GT = :gt
            GN = :gn
            GW = :gw
            GY = :gy
            HT = :ht
            HM = :hm
            VA = :va
            HN = :hn
            HK = :hk
            HU = :hu
            IS = :is
            IN = :in
            ID = :id
            IR = :ir
            IQ = :iq
            IE = :ie
            IL = :il
            IT = :it
            JM = :jm
            JP = :jp
            JO = :jo
            KZ = :kz
            KE = :ke
            KI = :ki
            KP = :kp
            KR = :kr
            KW = :kw
            KG = :kg
            LA = :la
            LV = :lv
            LB = :lb
            LS = :ls
            LR = :lr
            LY = :ly
            LI = :li
            LT = :lt
            LU = :lu
            MO = :mo
            MK = :mk
            MG = :mg
            MW = :mw
            MY = :my
            MV = :mv
            ML = :ml
            MT = :mt
            MH = :mh
            MQ = :mq
            MR = :mr
            MU = :mu
            YT = :yt
            MX = :mx
            FM = :fm
            MD = :md
            MC = :mc
            MN = :mn
            MS = :ms
            MA = :ma
            MZ = :mz
            MM = :mm
            NA = :na
            NR = :nr
            NP = :np
            NL = :nl
            AN = :an
            NC = :nc
            NZ = :nz
            NI = :ni
            NE = :ne
            NG = :ng
            NU = :nu
            NF = :nf
            MP = :mp
            NO = :no
            OM = :om
            PK = :pk
            PW = :pw
            PS = :ps
            PA = :pa
            PG = :pg
            PY = :py
            PE = :pe
            PH = :ph
            PN = :pn
            PL = :pl
            PT = :pt
            PR = :pr
            QA = :qa
            RE = :re
            RO = :ro
            RU = :ru
            RW = :rw
            SH = :sh
            KN = :kn
            LC = :lc
            PM = :pm
            VC = :vc
            WS = :ws
            SM = :sm
            ST = :st
            SA = :sa
            SN = :sn
            RS = :rs
            SC = :sc
            SL = :sl
            SG = :sg
            SK = :sk
            SI = :si
            SB = :sb
            SO = :so
            ZA = :za
            GS = :gs
            ES = :es
            LK = :lk
            SD = :sd
            SR = :sr
            SJ = :sj
            SZ = :sz
            SE = :se
            CH = :ch
            SY = :sy
            TW = :tw
            TJ = :tj
            TZ = :tz
            TH = :th
            TL = :tl
            TG = :tg
            TK = :tk
            TO = :to
            TT = :tt
            TN = :tn
            TR = :tr
            TM = :tm
            TC = :tc
            TV = :tv
            UG = :ug
            UA = :ua
            AE = :ae
            GB = :gb
            US = :us
            UM = :um
            UY = :uy
            UZ = :uz
            VU = :vu
            VE = :ve
            VN = :vn
            VG = :vg
            VI = :vi
            WF = :wf
            EH = :eh
            YE = :ye
            ZM = :zm
            ZW = :zw

            # @!method self.values
            #   @return [Array<Symbol>]
          end

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

          # @see ContextDev::Models::BrandRetrieveParams::Body::ByTransaction#timeout_opts
          class TimeoutOpts < ContextDev::Internal::Type::BaseModel
            # @!attribute milliseconds
            #   Deadline in milliseconds.
            #
            #   @return [Integer]
            required :milliseconds, Integer

            # @!attribute behavior
            #   "fail" returns 408 at the deadline. "return-partial" returns available results;
            #   inspect the response’s partial flag.
            #
            #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts::Behavior, nil]
            optional :behavior,
                     enum: -> { ContextDev::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts::Behavior }

            # @!method initialize(milliseconds:, behavior: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts} for
            #   more details.
            #
            #   Request deadline and what to return when it passes.
            #
            #   @param milliseconds [Integer] Deadline in milliseconds.
            #
            #   @param behavior [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts::Behavior] "fail" returns 408 at the deadline. "return-partial" returns available results;

            # "fail" returns 408 at the deadline. "return-partial" returns available results;
            # inspect the response’s partial flag.
            #
            # @see ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts#behavior
            module Behavior
              extend ContextDev::Internal::Type::Enum

              FAIL = :fail
              RETURN_PARTIAL = :"return-partial"

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::BrandRetrieveParams::Body::ByDomain, ContextDev::Models::BrandRetrieveParams::Body::ByName, ContextDev::Models::BrandRetrieveParams::Body::ByEmail, ContextDev::Models::BrandRetrieveParams::Body::ByTicker, ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction)]
      end
    end
  end
end
