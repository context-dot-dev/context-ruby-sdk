# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Brand#search
    class BrandSearchResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute results
      #   Up to 10 matching brands: name matches first, then domain matches, each group
      #   ordered by popularity. Empty when nothing matches.
      #
      #   @return [Array<ContextDev::Models::BrandSearchResponse::Result>]
      required :results,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandSearchResponse::Result] }

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::BrandSearchResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BrandSearchResponse::KeyMetadata }

      # @!method initialize(request_id:, results:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BrandSearchResponse} for more details.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param results [Array<ContextDev::Models::BrandSearchResponse::Result>] Up to 10 matching brands: name matches first, then domain matches, each group or
      #
      #   @param key_metadata [ContextDev::Models::BrandSearchResponse::KeyMetadata] Credits this request used and your remaining balance.

      class Result < ContextDev::Internal::Type::BaseModel
        # @!attribute domain
        #   Domain of the brand.
        #
        #   @return [String]
        required :domain, String

        # @!attribute logo
        #   Logo Link URL that serves the brand's logo with your organization's client ID.
        #   Use it directly as an image source.
        #
        #   @return [String]
        required :logo, String

        # @!attribute name
        #   Name of the brand. Empty string when unknown.
        #
        #   @return [String]
        required :name, String

        # @!attribute country
        #   Country of the brand, as an uppercase ISO 3166-1 alpha-2 code. Omitted when
        #   unknown.
        #
        #   @return [Symbol, ContextDev::Models::BrandSearchResponse::Result::Country, nil]
        optional :country, enum: -> { ContextDev::Models::BrandSearchResponse::Result::Country }

        # @!attribute description
        #   Short description of the brand. Omitted when unknown.
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute language
        #   Primary language of the brand. Omitted when unknown.
        #
        #   @return [Symbol, ContextDev::Models::BrandSearchResponse::Result::Language, nil]
        optional :language, enum: -> { ContextDev::Models::BrandSearchResponse::Result::Language }

        # @!method initialize(domain:, logo:, name:, country: nil, description: nil, language: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::BrandSearchResponse::Result} for more details.
        #
        #   @param domain [String] Domain of the brand.
        #
        #   @param logo [String] Logo Link URL that serves the brand's logo with your organization's client ID. U
        #
        #   @param name [String] Name of the brand. Empty string when unknown.
        #
        #   @param country [Symbol, ContextDev::Models::BrandSearchResponse::Result::Country] Country of the brand, as an uppercase ISO 3166-1 alpha-2 code. Omitted when unkn
        #
        #   @param description [String] Short description of the brand. Omitted when unknown.
        #
        #   @param language [Symbol, ContextDev::Models::BrandSearchResponse::Result::Language] Primary language of the brand. Omitted when unknown.

        # Country of the brand, as an uppercase ISO 3166-1 alpha-2 code. Omitted when
        # unknown.
        #
        # @see ContextDev::Models::BrandSearchResponse::Result#country
        module Country
          extend ContextDev::Internal::Type::Enum

          AD = :AD
          AE = :AE
          AF = :AF
          AG = :AG
          AI = :AI
          AL = :AL
          AM = :AM
          AO = :AO
          AQ = :AQ
          AR = :AR
          AS = :AS
          AT = :AT
          AU = :AU
          AW = :AW
          AX = :AX
          AZ = :AZ
          BA = :BA
          BB = :BB
          BD = :BD
          BE = :BE
          BF = :BF
          BG = :BG
          BH = :BH
          BI = :BI
          BJ = :BJ
          BL = :BL
          BM = :BM
          BN = :BN
          BO = :BO
          BQ = :BQ
          BR = :BR
          BS = :BS
          BT = :BT
          BV = :BV
          BW = :BW
          BY = :BY
          BZ = :BZ
          CA = :CA
          CC = :CC
          CD = :CD
          CF = :CF
          CG = :CG
          CH = :CH
          CI = :CI
          CK = :CK
          CL = :CL
          CM = :CM
          CN = :CN
          CO = :CO
          CR = :CR
          CU = :CU
          CV = :CV
          CW = :CW
          CX = :CX
          CY = :CY
          CZ = :CZ
          DE = :DE
          DJ = :DJ
          DK = :DK
          DM = :DM
          DO = :DO
          DZ = :DZ
          EC = :EC
          EE = :EE
          EG = :EG
          EH = :EH
          ER = :ER
          ES = :ES
          ET = :ET
          FI = :FI
          FJ = :FJ
          FK = :FK
          FM = :FM
          FO = :FO
          FR = :FR
          GA = :GA
          GB = :GB
          GD = :GD
          GE = :GE
          GF = :GF
          GG = :GG
          GH = :GH
          GI = :GI
          GL = :GL
          GM = :GM
          GN = :GN
          GP = :GP
          GQ = :GQ
          GR = :GR
          GS = :GS
          GT = :GT
          GU = :GU
          GW = :GW
          GY = :GY
          HK = :HK
          HM = :HM
          HN = :HN
          HR = :HR
          HT = :HT
          HU = :HU
          ID = :ID
          IE = :IE
          IL = :IL
          IM = :IM
          IN = :IN
          IO = :IO
          IQ = :IQ
          IR = :IR
          IS = :IS
          IT = :IT
          JE = :JE
          JM = :JM
          JO = :JO
          JP = :JP
          KE = :KE
          KG = :KG
          KH = :KH
          KI = :KI
          KM = :KM
          KN = :KN
          KP = :KP
          KR = :KR
          KW = :KW
          KY = :KY
          KZ = :KZ
          LA = :LA
          LB = :LB
          LC = :LC
          LI = :LI
          LK = :LK
          LR = :LR
          LS = :LS
          LT = :LT
          LU = :LU
          LV = :LV
          LY = :LY
          MA = :MA
          MC = :MC
          MD = :MD
          ME = :ME
          MF = :MF
          MG = :MG
          MH = :MH
          MK = :MK
          ML = :ML
          MM = :MM
          MN = :MN
          MO = :MO
          MP = :MP
          MQ = :MQ
          MR = :MR
          MS = :MS
          MT = :MT
          MU = :MU
          MV = :MV
          MW = :MW
          MX = :MX
          MY = :MY
          MZ = :MZ
          NA = :NA
          NC = :NC
          NE = :NE
          NF = :NF
          NG = :NG
          NI = :NI
          NL = :NL
          NO = :NO
          NP = :NP
          NR = :NR
          NU = :NU
          NZ = :NZ
          OM = :OM
          PA = :PA
          PE = :PE
          PF = :PF
          PG = :PG
          PH = :PH
          PK = :PK
          PL = :PL
          PM = :PM
          PN = :PN
          PR = :PR
          PS = :PS
          PT = :PT
          PW = :PW
          PY = :PY
          QA = :QA
          RE = :RE
          RO = :RO
          RS = :RS
          RU = :RU
          RW = :RW
          SA = :SA
          SB = :SB
          SC = :SC
          SD = :SD
          SE = :SE
          SG = :SG
          SH = :SH
          SI = :SI
          SJ = :SJ
          SK = :SK
          SL = :SL
          SM = :SM
          SN = :SN
          SO = :SO
          SR = :SR
          SS = :SS
          ST = :ST
          SV = :SV
          SX = :SX
          SY = :SY
          SZ = :SZ
          TC = :TC
          TD = :TD
          TF = :TF
          TG = :TG
          TH = :TH
          TJ = :TJ
          TK = :TK
          TL = :TL
          TM = :TM
          TN = :TN
          TO = :TO
          TR = :TR
          TT = :TT
          TV = :TV
          TW = :TW
          TZ = :TZ
          UA = :UA
          UG = :UG
          UM = :UM
          US = :US
          UY = :UY
          UZ = :UZ
          VA = :VA
          VC = :VC
          VE = :VE
          VG = :VG
          VI = :VI
          VN = :VN
          VU = :VU
          WF = :WF
          WS = :WS
          YE = :YE
          YT = :YT
          ZA = :ZA
          ZM = :ZM
          ZW = :ZW

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Primary language of the brand. Omitted when unknown.
        #
        # @see ContextDev::Models::BrandSearchResponse::Result#language
        module Language
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

      # @see ContextDev::Models::BrandSearchResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits your organization has left after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits your organization has left after this request.
      end
    end
  end
end
