# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Brand#retrieve
    class BrandRetrieveParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute body
      #   Brand lookup. Set `type` to choose how to identify the brand.
      #
      #   @return [ContextDev::Models::BrandRetrieveParams::Body::ByDomain, ContextDev::Models::BrandRetrieveParams::Body::ByName, ContextDev::Models::BrandRetrieveParams::Body::ByEmail, ContextDev::Models::BrandRetrieveParams::Body::ByTicker, ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction]
      required :body, union: -> { ContextDev::BrandRetrieveParams::Body }

      # @!method initialize(body:, request_options: {})
      #   @param body [ContextDev::Models::BrandRetrieveParams::Body::ByDomain, ContextDev::Models::BrandRetrieveParams::Body::ByName, ContextDev::Models::BrandRetrieveParams::Body::ByEmail, ContextDev::Models::BrandRetrieveParams::Body::ByTicker, ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction] Brand lookup. Set `type` to choose how to identify the brand.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Brand lookup. Set `type` to choose how to identify the brand.
      module Body
        extend ContextDev::Internal::Type::Union

        discriminator :type

        # Look up a brand by its domain.
        variant :by_domain, -> { ContextDev::BrandRetrieveParams::Body::ByDomain }

        # Look up a brand by company name.
        variant :by_name, -> { ContextDev::BrandRetrieveParams::Body::ByName }

        # Look up a brand from a work email address. Free and disposable email providers return 422.
        variant :by_email, -> { ContextDev::BrandRetrieveParams::Body::ByEmail }

        # Look up a publicly traded company by stock ticker.
        variant :by_ticker, -> { ContextDev::BrandRetrieveParams::Body::ByTicker }

        # Extract brand data from a single page. Only that URL is read, and no data from other sources is added.
        variant :by_direct_url, -> { ContextDev::BrandRetrieveParams::Body::ByDirectURL }

        # Identify the merchant behind a card or bank transaction descriptor.
        variant :by_transaction, -> { ContextDev::BrandRetrieveParams::Body::ByTransaction }

        class ByDomain < ContextDev::Internal::Type::BaseModel
          # @!attribute domain
          #   Domain of the brand, such as `stripe.com`.
          #
          #   @return [String]
          required :domain, String

          # @!attribute type
          #   Set to `by_domain` to look up a brand by domain.
          #
          #   @return [Symbol, :by_domain]
          required :type, const: :by_domain

          # @!attribute force_language
          #   Translate the brand's `title`, `description`, and `slogan` into this language.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByDomain::ForceLanguage, nil]
          optional :force_language,
                   enum: -> { ContextDev::BrandRetrieveParams::Body::ByDomain::ForceLanguage },
                   nil?: true

          # @!attribute max_age_ms
          #   Maximum age of cached brand data, in milliseconds. `0` always fetches fresh.
          #   Defaults to 90 days (7776000000 ms). Values above 1 year (31536000000 ms) are
          #   capped at 1 year.
          #
          #   @return [Integer, nil]
          optional :max_age_ms, Integer, api_name: :maxAgeMs

          # @!attribute max_speed
          #   Skip slower enrichment steps for a faster, less detailed response.
          #
          #   @return [Boolean, nil]
          optional :max_speed, ContextDev::Internal::Type::Boolean, api_name: :maxSpeed

          # @!attribute policies
          #   Access policy IDs to apply; each URL must pass all of them. Requires access
          #   policies enabled for your organization; otherwise returns
          #   `ACCESS_POLICIES_NOT_ENABLED`.
          #
          #   @return [Array<String>, nil]
          optional :policies, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute tags
          #   Labels for this request. Filter usage and request logs by them in the dashboard
          #   or with `GET /org/logs`.
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

          # @!attribute zdr
          #   `enabled` turns off request logs and traces and keeps request and response
          #   content out of usage logs. Brand data and hosted assets may still be stored.
          #   Returns 403 `ZDR_NOT_ENABLED` unless your organization has ZDR.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByDomain::Zdr, nil]
          optional :zdr, enum: -> { ContextDev::BrandRetrieveParams::Body::ByDomain::Zdr }

          # @!method initialize(domain:, force_language: nil, max_age_ms: nil, max_speed: nil, policies: nil, tags: nil, timeout_opts: nil, zdr: nil, type: :by_domain)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::ByDomain} for more details.
          #
          #   Look up a brand by its domain.
          #
          #   @param domain [String] Domain of the brand, such as `stripe.com`.
          #
          #   @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByDomain::ForceLanguage, nil] Translate the brand's `title`, `description`, and `slogan` into this language.
          #
          #   @param max_age_ms [Integer] Maximum age of cached brand data, in milliseconds. `0` always fetches fresh. Def
          #
          #   @param max_speed [Boolean] Skip slower enrichment steps for a faster, less detailed response.
          #
          #   @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
          #
          #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
          #
          #   @param timeout_opts [ContextDev::Models::BrandRetrieveParams::Body::ByDomain::TimeoutOpts] Request deadline and what to return when it passes.
          #
          #   @param zdr [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByDomain::Zdr] `enabled` turns off request logs and traces and keeps request and response conte
          #
          #   @param type [Symbol, :by_domain] Set to `by_domain` to look up a brand by domain.

          # Translate the brand's `title`, `description`, and `slogan` into this language.
          #
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
            #   `fail` returns 408 at the deadline. `return-partial` returns the results
            #   collected so far and marks the response as partial.
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
            #   @param behavior [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByDomain::TimeoutOpts::Behavior] `fail` returns 408 at the deadline. `return-partial` returns the results collect

            # `fail` returns 408 at the deadline. `return-partial` returns the results
            # collected so far and marks the response as partial.
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

          # `enabled` turns off request logs and traces and keeps request and response
          # content out of usage logs. Brand data and hosted assets may still be stored.
          # Returns 403 `ZDR_NOT_ENABLED` unless your organization has ZDR.
          #
          # @see ContextDev::Models::BrandRetrieveParams::Body::ByDomain#zdr
          module Zdr
            extend ContextDev::Internal::Type::Enum

            ENABLED = :enabled
            DISABLED = :disabled

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class ByName < ContextDev::Internal::Type::BaseModel
          # @!attribute name
          #   Company name, such as `Apple Inc`.
          #
          #   @return [String]
          required :name, String

          # @!attribute type
          #   Set to `by_name` to look up a brand by company name.
          #
          #   @return [Symbol, :by_name]
          required :type, const: :by_name

          # @!attribute country
          #   Lowercase ISO 3166-1 alpha-2 country code, such as `us`.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByName::Country, nil]
          optional :country, enum: -> { ContextDev::BrandRetrieveParams::Body::ByName::Country }

          # @!attribute force_language
          #   Translate the brand's `title`, `description`, and `slogan` into this language.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByName::ForceLanguage, nil]
          optional :force_language,
                   enum: -> { ContextDev::BrandRetrieveParams::Body::ByName::ForceLanguage },
                   nil?: true

          # @!attribute max_age_ms
          #   Maximum age of cached brand data, in milliseconds. `0` always fetches fresh.
          #   Defaults to 90 days (7776000000 ms). Values above 1 year (31536000000 ms) are
          #   capped at 1 year.
          #
          #   @return [Integer, nil]
          optional :max_age_ms, Integer, api_name: :maxAgeMs

          # @!attribute max_speed
          #   Skip slower enrichment steps for a faster, less detailed response.
          #
          #   @return [Boolean, nil]
          optional :max_speed, ContextDev::Internal::Type::Boolean, api_name: :maxSpeed

          # @!attribute policies
          #   Access policy IDs to apply; each URL must pass all of them. Requires access
          #   policies enabled for your organization; otherwise returns
          #   `ACCESS_POLICIES_NOT_ENABLED`.
          #
          #   @return [Array<String>, nil]
          optional :policies, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute tags
          #   Labels for this request. Filter usage and request logs by them in the dashboard
          #   or with `GET /org/logs`.
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

          # @!attribute zdr
          #   `enabled` turns off request logs and traces and keeps request and response
          #   content out of usage logs. Brand data and hosted assets may still be stored.
          #   Returns 403 `ZDR_NOT_ENABLED` unless your organization has ZDR.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByName::Zdr, nil]
          optional :zdr, enum: -> { ContextDev::BrandRetrieveParams::Body::ByName::Zdr }

          # @!method initialize(name:, country: nil, force_language: nil, max_age_ms: nil, max_speed: nil, policies: nil, tags: nil, timeout_opts: nil, zdr: nil, type: :by_name)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::ByName} for more details.
          #
          #   Look up a brand by company name.
          #
          #   @param name [String] Company name, such as `Apple Inc`.
          #
          #   @param country [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByName::Country] Lowercase ISO 3166-1 alpha-2 country code, such as `us`.
          #
          #   @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByName::ForceLanguage, nil] Translate the brand's `title`, `description`, and `slogan` into this language.
          #
          #   @param max_age_ms [Integer] Maximum age of cached brand data, in milliseconds. `0` always fetches fresh. Def
          #
          #   @param max_speed [Boolean] Skip slower enrichment steps for a faster, less detailed response.
          #
          #   @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
          #
          #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
          #
          #   @param timeout_opts [ContextDev::Models::BrandRetrieveParams::Body::ByName::TimeoutOpts] Request deadline and what to return when it passes.
          #
          #   @param zdr [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByName::Zdr] `enabled` turns off request logs and traces and keeps request and response conte
          #
          #   @param type [Symbol, :by_name] Set to `by_name` to look up a brand by company name.

          # Lowercase ISO 3166-1 alpha-2 country code, such as `us`.
          #
          # @see ContextDev::Models::BrandRetrieveParams::Body::ByName#country
          module Country
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

          # Translate the brand's `title`, `description`, and `slogan` into this language.
          #
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
            #   `fail` returns 408 at the deadline. `return-partial` returns the results
            #   collected so far and marks the response as partial.
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
            #   @param behavior [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByName::TimeoutOpts::Behavior] `fail` returns 408 at the deadline. `return-partial` returns the results collect

            # `fail` returns 408 at the deadline. `return-partial` returns the results
            # collected so far and marks the response as partial.
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

          # `enabled` turns off request logs and traces and keeps request and response
          # content out of usage logs. Brand data and hosted assets may still be stored.
          # Returns 403 `ZDR_NOT_ENABLED` unless your organization has ZDR.
          #
          # @see ContextDev::Models::BrandRetrieveParams::Body::ByName#zdr
          module Zdr
            extend ContextDev::Internal::Type::Enum

            ENABLED = :enabled
            DISABLED = :disabled

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class ByEmail < ContextDev::Internal::Type::BaseModel
          # @!attribute email
          #   Work email address, such as `jane@stripe.com`. The brand is looked up from its
          #   domain.
          #
          #   @return [String]
          required :email, String

          # @!attribute type
          #   Set to `by_email` to look up a brand from a work email address.
          #
          #   @return [Symbol, :by_email]
          required :type, const: :by_email

          # @!attribute force_language
          #   Translate the brand's `title`, `description`, and `slogan` into this language.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByEmail::ForceLanguage, nil]
          optional :force_language,
                   enum: -> { ContextDev::BrandRetrieveParams::Body::ByEmail::ForceLanguage },
                   nil?: true

          # @!attribute max_age_ms
          #   Maximum age of cached brand data, in milliseconds. `0` always fetches fresh.
          #   Defaults to 90 days (7776000000 ms). Values above 1 year (31536000000 ms) are
          #   capped at 1 year.
          #
          #   @return [Integer, nil]
          optional :max_age_ms, Integer, api_name: :maxAgeMs

          # @!attribute max_speed
          #   Skip slower enrichment steps for a faster, less detailed response.
          #
          #   @return [Boolean, nil]
          optional :max_speed, ContextDev::Internal::Type::Boolean, api_name: :maxSpeed

          # @!attribute policies
          #   Access policy IDs to apply; each URL must pass all of them. Requires access
          #   policies enabled for your organization; otherwise returns
          #   `ACCESS_POLICIES_NOT_ENABLED`.
          #
          #   @return [Array<String>, nil]
          optional :policies, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute tags
          #   Labels for this request. Filter usage and request logs by them in the dashboard
          #   or with `GET /org/logs`.
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

          # @!attribute zdr
          #   `enabled` turns off request logs and traces and keeps request and response
          #   content out of usage logs. Brand data and hosted assets may still be stored.
          #   Returns 403 `ZDR_NOT_ENABLED` unless your organization has ZDR.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByEmail::Zdr, nil]
          optional :zdr, enum: -> { ContextDev::BrandRetrieveParams::Body::ByEmail::Zdr }

          # @!method initialize(email:, force_language: nil, max_age_ms: nil, max_speed: nil, policies: nil, tags: nil, timeout_opts: nil, zdr: nil, type: :by_email)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::ByEmail} for more details.
          #
          #   Look up a brand from a work email address. Free and disposable email providers
          #   return 422.
          #
          #   @param email [String] Work email address, such as `jane@stripe.com`. The brand is looked up from its d
          #
          #   @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByEmail::ForceLanguage, nil] Translate the brand's `title`, `description`, and `slogan` into this language.
          #
          #   @param max_age_ms [Integer] Maximum age of cached brand data, in milliseconds. `0` always fetches fresh. Def
          #
          #   @param max_speed [Boolean] Skip slower enrichment steps for a faster, less detailed response.
          #
          #   @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
          #
          #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
          #
          #   @param timeout_opts [ContextDev::Models::BrandRetrieveParams::Body::ByEmail::TimeoutOpts] Request deadline and what to return when it passes.
          #
          #   @param zdr [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByEmail::Zdr] `enabled` turns off request logs and traces and keeps request and response conte
          #
          #   @param type [Symbol, :by_email] Set to `by_email` to look up a brand from a work email address.

          # Translate the brand's `title`, `description`, and `slogan` into this language.
          #
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
            #   `fail` returns 408 at the deadline. `return-partial` returns the results
            #   collected so far and marks the response as partial.
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
            #   @param behavior [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByEmail::TimeoutOpts::Behavior] `fail` returns 408 at the deadline. `return-partial` returns the results collect

            # `fail` returns 408 at the deadline. `return-partial` returns the results
            # collected so far and marks the response as partial.
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

          # `enabled` turns off request logs and traces and keeps request and response
          # content out of usage logs. Brand data and hosted assets may still be stored.
          # Returns 403 `ZDR_NOT_ENABLED` unless your organization has ZDR.
          #
          # @see ContextDev::Models::BrandRetrieveParams::Body::ByEmail#zdr
          module Zdr
            extend ContextDev::Internal::Type::Enum

            ENABLED = :enabled
            DISABLED = :disabled

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class ByTicker < ContextDev::Internal::Type::BaseModel
          # @!attribute ticker
          #   Stock ticker symbol, such as `AAPL`.
          #
          #   @return [String]
          required :ticker, String

          # @!attribute type
          #   Set to `by_ticker` to look up a brand by stock ticker.
          #
          #   @return [Symbol, :by_ticker]
          required :type, const: :by_ticker

          # @!attribute force_language
          #   Translate the brand's `title`, `description`, and `slogan` into this language.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTicker::ForceLanguage, nil]
          optional :force_language,
                   enum: -> { ContextDev::BrandRetrieveParams::Body::ByTicker::ForceLanguage },
                   nil?: true

          # @!attribute max_age_ms
          #   Maximum age of cached brand data, in milliseconds. `0` always fetches fresh.
          #   Defaults to 90 days (7776000000 ms). Values above 1 year (31536000000 ms) are
          #   capped at 1 year.
          #
          #   @return [Integer, nil]
          optional :max_age_ms, Integer, api_name: :maxAgeMs

          # @!attribute max_speed
          #   Skip slower enrichment steps for a faster, less detailed response.
          #
          #   @return [Boolean, nil]
          optional :max_speed, ContextDev::Internal::Type::Boolean, api_name: :maxSpeed

          # @!attribute policies
          #   Access policy IDs to apply; each URL must pass all of them. Requires access
          #   policies enabled for your organization; otherwise returns
          #   `ACCESS_POLICIES_NOT_ENABLED`.
          #
          #   @return [Array<String>, nil]
          optional :policies, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute tags
          #   Labels for this request. Filter usage and request logs by them in the dashboard
          #   or with `GET /org/logs`.
          #
          #   @return [Array<String>, nil]
          optional :tags, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute ticker_exchange
          #   Stock exchange code, such as `NASDAQ` or `LSE`.
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

          # @!attribute zdr
          #   `enabled` turns off request logs and traces and keeps request and response
          #   content out of usage logs. Brand data and hosted assets may still be stored.
          #   Returns 403 `ZDR_NOT_ENABLED` unless your organization has ZDR.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTicker::Zdr, nil]
          optional :zdr, enum: -> { ContextDev::BrandRetrieveParams::Body::ByTicker::Zdr }

          # @!method initialize(ticker:, force_language: nil, max_age_ms: nil, max_speed: nil, policies: nil, tags: nil, ticker_exchange: nil, timeout_opts: nil, zdr: nil, type: :by_ticker)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::ByTicker} for more details.
          #
          #   Look up a publicly traded company by stock ticker.
          #
          #   @param ticker [String] Stock ticker symbol, such as `AAPL`.
          #
          #   @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTicker::ForceLanguage, nil] Translate the brand's `title`, `description`, and `slogan` into this language.
          #
          #   @param max_age_ms [Integer] Maximum age of cached brand data, in milliseconds. `0` always fetches fresh. Def
          #
          #   @param max_speed [Boolean] Skip slower enrichment steps for a faster, less detailed response.
          #
          #   @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
          #
          #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
          #
          #   @param ticker_exchange [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTicker::TickerExchange] Stock exchange code, such as `NASDAQ` or `LSE`.
          #
          #   @param timeout_opts [ContextDev::Models::BrandRetrieveParams::Body::ByTicker::TimeoutOpts] Request deadline and what to return when it passes.
          #
          #   @param zdr [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTicker::Zdr] `enabled` turns off request logs and traces and keeps request and response conte
          #
          #   @param type [Symbol, :by_ticker] Set to `by_ticker` to look up a brand by stock ticker.

          # Translate the brand's `title`, `description`, and `slogan` into this language.
          #
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

          # Stock exchange code, such as `NASDAQ` or `LSE`.
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
            #   `fail` returns 408 at the deadline. `return-partial` returns the results
            #   collected so far and marks the response as partial.
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
            #   @param behavior [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTicker::TimeoutOpts::Behavior] `fail` returns 408 at the deadline. `return-partial` returns the results collect

            # `fail` returns 408 at the deadline. `return-partial` returns the results
            # collected so far and marks the response as partial.
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

          # `enabled` turns off request logs and traces and keeps request and response
          # content out of usage logs. Brand data and hosted assets may still be stored.
          # Returns 403 `ZDR_NOT_ENABLED` unless your organization has ZDR.
          #
          # @see ContextDev::Models::BrandRetrieveParams::Body::ByTicker#zdr
          module Zdr
            extend ContextDev::Internal::Type::Enum

            ENABLED = :enabled
            DISABLED = :disabled

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class ByDirectURL < ContextDev::Internal::Type::BaseModel
          # @!attribute direct_url
          #   Full `http` or `https` URL of the page to read, such as
          #   `https://stripe.com/enterprise`. Only this page is fetched.
          #
          #   @return [String]
          required :direct_url, String

          # @!attribute type
          #   Set to `by_direct_url` to extract brand data from a single page.
          #
          #   @return [Symbol, :by_direct_url]
          required :type, const: :by_direct_url

          # @!attribute policies
          #   Access policy IDs to apply; each URL must pass all of them. Requires access
          #   policies enabled for your organization; otherwise returns
          #   `ACCESS_POLICIES_NOT_ENABLED`.
          #
          #   @return [Array<String>, nil]
          optional :policies, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute tags
          #   Labels for this request. Filter usage and request logs by them in the dashboard
          #   or with `GET /org/logs`.
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

          # @!attribute zdr
          #   `enabled` turns off request logs and traces and keeps request and response
          #   content out of usage logs. Brand data and hosted assets may still be stored.
          #   Returns 403 `ZDR_NOT_ENABLED` unless your organization has ZDR.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL::Zdr, nil]
          optional :zdr, enum: -> { ContextDev::BrandRetrieveParams::Body::ByDirectURL::Zdr }

          # @!method initialize(direct_url:, policies: nil, tags: nil, timeout_opts: nil, zdr: nil, type: :by_direct_url)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL} for more details.
          #
          #   Extract brand data from a single page. Only that URL is read, and no data from
          #   other sources is added.
          #
          #   @param direct_url [String] Full `http` or `https` URL of the page to read, such as `https://stripe.com/ente
          #
          #   @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
          #
          #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
          #
          #   @param timeout_opts [ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts] Request deadline and what to return when it passes.
          #
          #   @param zdr [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL::Zdr] `enabled` turns off request logs and traces and keeps request and response conte
          #
          #   @param type [Symbol, :by_direct_url] Set to `by_direct_url` to extract brand data from a single page.

          # @see ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL#timeout_opts
          class TimeoutOpts < ContextDev::Internal::Type::BaseModel
            # @!attribute milliseconds
            #   Deadline in milliseconds.
            #
            #   @return [Integer]
            required :milliseconds, Integer

            # @!attribute behavior
            #   `fail` returns 408 at the deadline. `return-partial` returns the results
            #   collected so far and marks the response as partial.
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
            #   @param behavior [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL::TimeoutOpts::Behavior] `fail` returns 408 at the deadline. `return-partial` returns the results collect

            # `fail` returns 408 at the deadline. `return-partial` returns the results
            # collected so far and marks the response as partial.
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

          # `enabled` turns off request logs and traces and keeps request and response
          # content out of usage logs. Brand data and hosted assets may still be stored.
          # Returns 403 `ZDR_NOT_ENABLED` unless your organization has ZDR.
          #
          # @see ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL#zdr
          module Zdr
            extend ContextDev::Internal::Type::Enum

            ENABLED = :enabled
            DISABLED = :disabled

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class ByTransaction < ContextDev::Internal::Type::BaseModel
          # @!attribute transaction_info
          #   Transaction descriptor from a card or bank statement, such as `SQ *COFFEE SHOP`.
          #
          #   @return [String]
          required :transaction_info, String

          # @!attribute type
          #   Set to `by_transaction` to identify the merchant behind a transaction
          #   descriptor.
          #
          #   @return [Symbol, :by_transaction]
          required :type, const: :by_transaction

          # @!attribute city
          #   City where the transaction took place. Brands in this city are preferred.
          #
          #   @return [String, nil]
          optional :city, String

          # @!attribute country
          #   Lowercase ISO 3166-1 alpha-2 country code, such as `us`.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::Country, nil]
          optional :country, enum: -> { ContextDev::BrandRetrieveParams::Body::ByTransaction::Country }

          # @!attribute force_language
          #   Translate the brand's `title`, `description`, and `slogan` into this language.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::ForceLanguage, nil]
          optional :force_language,
                   enum: -> { ContextDev::BrandRetrieveParams::Body::ByTransaction::ForceLanguage },
                   nil?: true

          # @!attribute high_confidence_only
          #   Run extra verification so the returned brand matches the transaction with high
          #   confidence.
          #
          #   @return [Boolean, nil]
          optional :high_confidence_only, ContextDev::Internal::Type::Boolean

          # @!attribute max_speed
          #   Skip slower enrichment steps for a faster, less detailed response.
          #
          #   @return [Boolean, nil]
          optional :max_speed, ContextDev::Internal::Type::Boolean, api_name: :maxSpeed

          # @!attribute mcc
          #   Merchant Category Code (MCC) from the transaction. Helps identify the type of
          #   business.
          #
          #   @return [String, Float, nil]
          optional :mcc, union: -> { ContextDev::BrandRetrieveParams::Body::ByTransaction::Mcc }

          # @!attribute phone
          #   Merchant phone number from the transaction. Helps confirm the match.
          #
          #   @return [String, Float, nil]
          optional :phone, union: -> { ContextDev::BrandRetrieveParams::Body::ByTransaction::Phone }

          # @!attribute policies
          #   Access policy IDs to apply; each URL must pass all of them. Requires access
          #   policies enabled for your organization; otherwise returns
          #   `ACCESS_POLICIES_NOT_ENABLED`.
          #
          #   @return [Array<String>, nil]
          optional :policies, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute tags
          #   Labels for this request. Filter usage and request logs by them in the dashboard
          #   or with `GET /org/logs`.
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

          # @!attribute zdr
          #   `enabled` turns off request logs and traces and keeps request and response
          #   content out of usage logs. Brand data and hosted assets may still be stored.
          #   Returns 403 `ZDR_NOT_ENABLED` unless your organization has ZDR.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::Zdr, nil]
          optional :zdr, enum: -> { ContextDev::BrandRetrieveParams::Body::ByTransaction::Zdr }

          # @!method initialize(transaction_info:, city: nil, country: nil, force_language: nil, high_confidence_only: nil, max_speed: nil, mcc: nil, phone: nil, policies: nil, tags: nil, timeout_opts: nil, zdr: nil, type: :by_transaction)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveParams::Body::ByTransaction} for more details.
          #
          #   Identify the merchant behind a card or bank transaction descriptor.
          #
          #   @param transaction_info [String] Transaction descriptor from a card or bank statement, such as `SQ *COFFEE SHOP`.
          #
          #   @param city [String] City where the transaction took place. Brands in this city are preferred.
          #
          #   @param country [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::Country] Lowercase ISO 3166-1 alpha-2 country code, such as `us`.
          #
          #   @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::ForceLanguage, nil] Translate the brand's `title`, `description`, and `slogan` into this language.
          #
          #   @param high_confidence_only [Boolean] Run extra verification so the returned brand matches the transaction with high c
          #
          #   @param max_speed [Boolean] Skip slower enrichment steps for a faster, less detailed response.
          #
          #   @param mcc [String, Float] Merchant Category Code (MCC) from the transaction. Helps identify the type of bu
          #
          #   @param phone [String, Float] Merchant phone number from the transaction. Helps confirm the match.
          #
          #   @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
          #
          #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
          #
          #   @param timeout_opts [ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts] Request deadline and what to return when it passes.
          #
          #   @param zdr [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::Zdr] `enabled` turns off request logs and traces and keeps request and response conte
          #
          #   @param type [Symbol, :by_transaction] Set to `by_transaction` to identify the merchant behind a transaction descriptor

          # Lowercase ISO 3166-1 alpha-2 country code, such as `us`.
          #
          # @see ContextDev::Models::BrandRetrieveParams::Body::ByTransaction#country
          module Country
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

          # Translate the brand's `title`, `description`, and `slogan` into this language.
          #
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

          # Merchant Category Code (MCC) from the transaction. Helps identify the type of
          # business.
          #
          # @see ContextDev::Models::BrandRetrieveParams::Body::ByTransaction#mcc
          module Mcc
            extend ContextDev::Internal::Type::Union

            variant String

            variant Float

            # @!method self.variants
            #   @return [Array(String, Float)]
          end

          # Merchant phone number from the transaction. Helps confirm the match.
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
            #   `fail` returns 408 at the deadline. `return-partial` returns the results
            #   collected so far and marks the response as partial.
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
            #   @param behavior [Symbol, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction::TimeoutOpts::Behavior] `fail` returns 408 at the deadline. `return-partial` returns the results collect

            # `fail` returns 408 at the deadline. `return-partial` returns the results
            # collected so far and marks the response as partial.
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

          # `enabled` turns off request logs and traces and keeps request and response
          # content out of usage logs. Brand data and hosted assets may still be stored.
          # Returns 403 `ZDR_NOT_ENABLED` unless your organization has ZDR.
          #
          # @see ContextDev::Models::BrandRetrieveParams::Body::ByTransaction#zdr
          module Zdr
            extend ContextDev::Internal::Type::Enum

            ENABLED = :enabled
            DISABLED = :disabled

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::BrandRetrieveParams::Body::ByDomain, ContextDev::Models::BrandRetrieveParams::Body::ByName, ContextDev::Models::BrandRetrieveParams::Body::ByEmail, ContextDev::Models::BrandRetrieveParams::Body::ByTicker, ContextDev::Models::BrandRetrieveParams::Body::ByDirectURL, ContextDev::Models::BrandRetrieveParams::Body::ByTransaction)]
      end
    end
  end
end
