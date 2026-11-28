# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Brand#search
    class BrandSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute query
      #   Search term, matched against the fields in `queryBy`, such as `nike`,
      #   `nike.com`, or `nik`.
      #
      #   @return [String]
      required :query, String

      # @!attribute autocomplete
      #   Match the search term as a prefix, so `nik` matches Nike while the user is still
      #   typing. Set to `false` to match whole words only.
      #
      #   @return [Boolean, nil]
      optional :autocomplete, ContextDev::Internal::Type::Boolean

      # @!attribute country
      #   Only return brands in this country, as an uppercase ISO 3166-1 alpha-2 code such
      #   as `US` or `GB`.
      #
      #   @return [Symbol, ContextDev::Models::BrandSearchParams::Country, nil]
      optional :country, enum: -> { ContextDev::BrandSearchParams::Country }

      # @!attribute language
      #   Only return brands with this primary language, such as `english` or `french`.
      #
      #   @return [Symbol, ContextDev::Models::BrandSearchParams::Language, nil]
      optional :language, enum: -> { ContextDev::BrandSearchParams::Language }

      # @!attribute query_by
      #   Fields to match the search term against: `name`, `domain`, or both. Send a
      #   comma-separated list or repeat the parameter.
      #
      #   @return [Array<Symbol, ContextDev::Models::BrandSearchParams::QueryBy>, nil]
      optional :query_by,
               -> { ContextDev::Internal::Type::ArrayOf[enum: ContextDev::BrandSearchParams::QueryBy] }

      # @!attribute tags
      #   Comma-separated labels for this request, such as `production,team-alpha`. Filter
      #   usage and request logs by them.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute typo_tolerance
      #   Maximum number of typos to tolerate when matching. `0` requires exact spelling.
      #
      #   @return [Integer, nil]
      optional :typo_tolerance, Integer

      # @!method initialize(query:, autocomplete: nil, country: nil, language: nil, query_by: nil, tags: nil, typo_tolerance: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BrandSearchParams} for more details.
      #
      #   @param query [String] Search term, matched against the fields in `queryBy`, such as `nike`, `nike.com`
      #
      #   @param autocomplete [Boolean] Match the search term as a prefix, so `nik` matches Nike while the user is still
      #
      #   @param country [Symbol, ContextDev::Models::BrandSearchParams::Country] Only return brands in this country, as an uppercase ISO 3166-1 alpha-2 code such
      #
      #   @param language [Symbol, ContextDev::Models::BrandSearchParams::Language] Only return brands with this primary language, such as `english` or `french`.
      #
      #   @param query_by [Array<Symbol, ContextDev::Models::BrandSearchParams::QueryBy>] Fields to match the search term against: `name`, `domain`, or both. Send a comma
      #
      #   @param tags [Array<String>] Comma-separated labels for this request, such as `production,team-alpha`. Filter
      #
      #   @param typo_tolerance [Integer] Maximum number of typos to tolerate when matching. `0` requires exact spelling.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Only return brands in this country, as an uppercase ISO 3166-1 alpha-2 code such
      # as `US` or `GB`.
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

      # Only return brands with this primary language, such as `english` or `french`.
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

      module QueryBy
        extend ContextDev::Internal::Type::Enum

        NAME = :name
        DOMAIN = :domain

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
