# typed: strong

module ContextDev
  module Models
    class BrandSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::BrandSearchParams, ContextDev::Internal::AnyHash)
        end

      # Search term, matched against the fields in `queryBy`, such as `nike`,
      # `nike.com`, or `nik`.
      sig { returns(String) }
      attr_accessor :query

      # Match the search term as a prefix, so `nik` matches Nike while the user is still
      # typing. Set to `false` to match whole words only.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :autocomplete

      sig { params(autocomplete: T::Boolean).void }
      attr_writer :autocomplete

      # Only return brands in this country, as an uppercase ISO 3166-1 alpha-2 code such
      # as `US` or `GB`.
      sig do
        returns(T.nilable(ContextDev::BrandSearchParams::Country::OrSymbol))
      end
      attr_reader :country

      sig do
        params(country: ContextDev::BrandSearchParams::Country::OrSymbol).void
      end
      attr_writer :country

      # Only return brands with this primary language, such as `english` or `french`.
      sig do
        returns(T.nilable(ContextDev::BrandSearchParams::Language::OrSymbol))
      end
      attr_reader :language

      sig do
        params(language: ContextDev::BrandSearchParams::Language::OrSymbol).void
      end
      attr_writer :language

      # Fields to match the search term against: `name`, `domain`, or both. Send a
      # comma-separated list or repeat the parameter.
      sig do
        returns(
          T.nilable(T::Array[ContextDev::BrandSearchParams::QueryBy::OrSymbol])
        )
      end
      attr_reader :query_by

      sig do
        params(
          query_by: T::Array[ContextDev::BrandSearchParams::QueryBy::OrSymbol]
        ).void
      end
      attr_writer :query_by

      # Comma-separated labels for this request, such as `production,team-alpha`. Filter
      # usage and request logs by them.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Maximum number of typos to tolerate when matching. `0` requires exact spelling.
      sig { returns(T.nilable(Integer)) }
      attr_reader :typo_tolerance

      sig { params(typo_tolerance: Integer).void }
      attr_writer :typo_tolerance

      sig do
        params(
          query: String,
          autocomplete: T::Boolean,
          country: ContextDev::BrandSearchParams::Country::OrSymbol,
          language: ContextDev::BrandSearchParams::Language::OrSymbol,
          query_by: T::Array[ContextDev::BrandSearchParams::QueryBy::OrSymbol],
          tags: T::Array[String],
          typo_tolerance: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Search term, matched against the fields in `queryBy`, such as `nike`,
        # `nike.com`, or `nik`.
        query:,
        # Match the search term as a prefix, so `nik` matches Nike while the user is still
        # typing. Set to `false` to match whole words only.
        autocomplete: nil,
        # Only return brands in this country, as an uppercase ISO 3166-1 alpha-2 code such
        # as `US` or `GB`.
        country: nil,
        # Only return brands with this primary language, such as `english` or `french`.
        language: nil,
        # Fields to match the search term against: `name`, `domain`, or both. Send a
        # comma-separated list or repeat the parameter.
        query_by: nil,
        # Comma-separated labels for this request, such as `production,team-alpha`. Filter
        # usage and request logs by them.
        tags: nil,
        # Maximum number of typos to tolerate when matching. `0` requires exact spelling.
        typo_tolerance: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            query: String,
            autocomplete: T::Boolean,
            country: ContextDev::BrandSearchParams::Country::OrSymbol,
            language: ContextDev::BrandSearchParams::Language::OrSymbol,
            query_by:
              T::Array[ContextDev::BrandSearchParams::QueryBy::OrSymbol],
            tags: T::Array[String],
            typo_tolerance: Integer,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Only return brands in this country, as an uppercase ISO 3166-1 alpha-2 code such
      # as `US` or `GB`.
      module Country
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::BrandSearchParams::Country) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AD = T.let(:AD, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        AE = T.let(:AE, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        AF = T.let(:AF, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        AG = T.let(:AG, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        AI = T.let(:AI, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        AL = T.let(:AL, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        AM = T.let(:AM, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        AO = T.let(:AO, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        AQ = T.let(:AQ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        AR = T.let(:AR, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        AS = T.let(:AS, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        AT = T.let(:AT, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        AU = T.let(:AU, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        AW = T.let(:AW, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        AX = T.let(:AX, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        AZ = T.let(:AZ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BA = T.let(:BA, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BB = T.let(:BB, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BD = T.let(:BD, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BE = T.let(:BE, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BF = T.let(:BF, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BG = T.let(:BG, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BH = T.let(:BH, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BI = T.let(:BI, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BJ = T.let(:BJ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BL = T.let(:BL, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BM = T.let(:BM, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BN = T.let(:BN, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BO = T.let(:BO, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BQ = T.let(:BQ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BR = T.let(:BR, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BS = T.let(:BS, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BT = T.let(:BT, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BV = T.let(:BV, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BW = T.let(:BW, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BY = T.let(:BY, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        BZ = T.let(:BZ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CA = T.let(:CA, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CC = T.let(:CC, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CD = T.let(:CD, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CF = T.let(:CF, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CG = T.let(:CG, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CH = T.let(:CH, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CI = T.let(:CI, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CK = T.let(:CK, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CL = T.let(:CL, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CM = T.let(:CM, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CN = T.let(:CN, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CO = T.let(:CO, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CR = T.let(:CR, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CU = T.let(:CU, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CV = T.let(:CV, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CW = T.let(:CW, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CX = T.let(:CX, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CY = T.let(:CY, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        CZ = T.let(:CZ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        DE = T.let(:DE, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        DJ = T.let(:DJ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        DK = T.let(:DK, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        DM = T.let(:DM, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        DO = T.let(:DO, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        DZ = T.let(:DZ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        EC = T.let(:EC, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        EE = T.let(:EE, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        EG = T.let(:EG, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        EH = T.let(:EH, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        ER = T.let(:ER, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        ES = T.let(:ES, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        ET = T.let(:ET, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        FI = T.let(:FI, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        FJ = T.let(:FJ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        FK = T.let(:FK, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        FM = T.let(:FM, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        FO = T.let(:FO, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        FR = T.let(:FR, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GA = T.let(:GA, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GB = T.let(:GB, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GD = T.let(:GD, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GE = T.let(:GE, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GF = T.let(:GF, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GG = T.let(:GG, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GH = T.let(:GH, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GI = T.let(:GI, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GL = T.let(:GL, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GM = T.let(:GM, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GN = T.let(:GN, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GP = T.let(:GP, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GQ = T.let(:GQ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GR = T.let(:GR, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GS = T.let(:GS, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GT = T.let(:GT, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GU = T.let(:GU, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GW = T.let(:GW, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        GY = T.let(:GY, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        HK = T.let(:HK, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        HM = T.let(:HM, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        HN = T.let(:HN, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        HR = T.let(:HR, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        HT = T.let(:HT, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        HU = T.let(:HU, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        ID = T.let(:ID, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        IE = T.let(:IE, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        IL = T.let(:IL, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        IM = T.let(:IM, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        IN = T.let(:IN, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        IO = T.let(:IO, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        IQ = T.let(:IQ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        IR = T.let(:IR, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        IS = T.let(:IS, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        IT = T.let(:IT, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        JE = T.let(:JE, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        JM = T.let(:JM, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        JO = T.let(:JO, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        JP = T.let(:JP, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        KE = T.let(:KE, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        KG = T.let(:KG, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        KH = T.let(:KH, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        KI = T.let(:KI, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        KM = T.let(:KM, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        KN = T.let(:KN, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        KP = T.let(:KP, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        KR = T.let(:KR, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        KW = T.let(:KW, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        KY = T.let(:KY, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        KZ = T.let(:KZ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        LA = T.let(:LA, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        LB = T.let(:LB, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        LC = T.let(:LC, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        LI = T.let(:LI, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        LK = T.let(:LK, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        LR = T.let(:LR, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        LS = T.let(:LS, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        LT = T.let(:LT, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        LU = T.let(:LU, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        LV = T.let(:LV, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        LY = T.let(:LY, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MA = T.let(:MA, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MC = T.let(:MC, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MD = T.let(:MD, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        ME = T.let(:ME, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MF = T.let(:MF, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MG = T.let(:MG, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MH = T.let(:MH, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MK = T.let(:MK, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        ML = T.let(:ML, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MM = T.let(:MM, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MN = T.let(:MN, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MO = T.let(:MO, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MP = T.let(:MP, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MQ = T.let(:MQ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MR = T.let(:MR, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MS = T.let(:MS, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MT = T.let(:MT, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MU = T.let(:MU, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MV = T.let(:MV, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MW = T.let(:MW, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MX = T.let(:MX, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MY = T.let(:MY, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        MZ = T.let(:MZ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        NA = T.let(:NA, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        NC = T.let(:NC, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        NE = T.let(:NE, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        NF = T.let(:NF, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        NG = T.let(:NG, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        NI = T.let(:NI, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        NL = T.let(:NL, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        NO = T.let(:NO, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        NP = T.let(:NP, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        NR = T.let(:NR, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        NU = T.let(:NU, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        NZ = T.let(:NZ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        OM = T.let(:OM, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        PA = T.let(:PA, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        PE = T.let(:PE, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        PF = T.let(:PF, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        PG = T.let(:PG, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        PH = T.let(:PH, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        PK = T.let(:PK, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        PL = T.let(:PL, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        PM = T.let(:PM, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        PN = T.let(:PN, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        PR = T.let(:PR, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        PS = T.let(:PS, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        PT = T.let(:PT, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        PW = T.let(:PW, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        PY = T.let(:PY, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        QA = T.let(:QA, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        RE = T.let(:RE, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        RO = T.let(:RO, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        RS = T.let(:RS, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        RU = T.let(:RU, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        RW = T.let(:RW, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SA = T.let(:SA, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SB = T.let(:SB, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SC = T.let(:SC, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SD = T.let(:SD, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SE = T.let(:SE, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SG = T.let(:SG, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SH = T.let(:SH, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SI = T.let(:SI, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SJ = T.let(:SJ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SK = T.let(:SK, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SL = T.let(:SL, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SM = T.let(:SM, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SN = T.let(:SN, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SO = T.let(:SO, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SR = T.let(:SR, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SS = T.let(:SS, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        ST = T.let(:ST, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SV = T.let(:SV, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SX = T.let(:SX, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SY = T.let(:SY, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        SZ = T.let(:SZ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        TC = T.let(:TC, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        TD = T.let(:TD, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        TF = T.let(:TF, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        TG = T.let(:TG, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        TH = T.let(:TH, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        TJ = T.let(:TJ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        TK = T.let(:TK, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        TL = T.let(:TL, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        TM = T.let(:TM, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        TN = T.let(:TN, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        TO = T.let(:TO, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        TR = T.let(:TR, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        TT = T.let(:TT, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        TV = T.let(:TV, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        TW = T.let(:TW, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        TZ = T.let(:TZ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        UA = T.let(:UA, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        UG = T.let(:UG, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        UM = T.let(:UM, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        US = T.let(:US, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        UY = T.let(:UY, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        UZ = T.let(:UZ, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        VA = T.let(:VA, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        VC = T.let(:VC, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        VE = T.let(:VE, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        VG = T.let(:VG, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        VI = T.let(:VI, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        VN = T.let(:VN, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        VU = T.let(:VU, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        WF = T.let(:WF, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        WS = T.let(:WS, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        YE = T.let(:YE, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        YT = T.let(:YT, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        ZA = T.let(:ZA, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        ZM = T.let(:ZM, ContextDev::BrandSearchParams::Country::TaggedSymbol)
        ZW = T.let(:ZW, ContextDev::BrandSearchParams::Country::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::BrandSearchParams::Country::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Only return brands with this primary language, such as `english` or `french`.
      module Language
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::BrandSearchParams::Language)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AFRIKAANS =
          T.let(
            :afrikaans,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        ALBANIAN =
          T.let(
            :albanian,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        AMHARIC =
          T.let(:amharic, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        ARABIC =
          T.let(:arabic, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        ARMENIAN =
          T.let(
            :armenian,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        ASSAMESE =
          T.let(
            :assamese,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        AYMARA =
          T.let(:aymara, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        AZERI =
          T.let(:azeri, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        BASQUE =
          T.let(:basque, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        BELARUSIAN =
          T.let(
            :belarusian,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        BENGALI =
          T.let(:bengali, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        BOSNIAN =
          T.let(:bosnian, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        BULGARIAN =
          T.let(
            :bulgarian,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        BURMESE =
          T.let(:burmese, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        CANTONESE =
          T.let(
            :cantonese,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        CATALAN =
          T.let(:catalan, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        CEBUANO =
          T.let(:cebuano, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        CHINESE =
          T.let(:chinese, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        CORSICAN =
          T.let(
            :corsican,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        CROATIAN =
          T.let(
            :croatian,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        CZECH =
          T.let(:czech, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        DANISH =
          T.let(:danish, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        DUTCH =
          T.let(:dutch, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        ENGLISH =
          T.let(:english, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        ESPERANTO =
          T.let(
            :esperanto,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        ESTONIAN =
          T.let(
            :estonian,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        FARSI =
          T.let(:farsi, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        FIJIAN =
          T.let(:fijian, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        FINNISH =
          T.let(:finnish, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        FRENCH =
          T.let(:french, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        GALICIAN =
          T.let(
            :galician,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        GEORGIAN =
          T.let(
            :georgian,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        GERMAN =
          T.let(:german, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        GREEK =
          T.let(:greek, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        GUARANI =
          T.let(:guarani, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        GUJARATI =
          T.let(
            :gujarati,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        HAITIAN_CREOLE =
          T.let(
            :"haitian-creole",
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        HAUSA =
          T.let(:hausa, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        HAWAIIAN =
          T.let(
            :hawaiian,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        HEBREW =
          T.let(:hebrew, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        HINDI =
          T.let(:hindi, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        HMONG =
          T.let(:hmong, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        HUNGARIAN =
          T.let(
            :hungarian,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        ICELANDIC =
          T.let(
            :icelandic,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        IGBO =
          T.let(:igbo, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        INDONESIAN =
          T.let(
            :indonesian,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        IRISH =
          T.let(:irish, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        ITALIAN =
          T.let(:italian, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        JAPANESE =
          T.let(
            :japanese,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        JAVANESE =
          T.let(
            :javanese,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        KANNADA =
          T.let(:kannada, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        KAZAKH =
          T.let(:kazakh, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        KHMER =
          T.let(:khmer, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        KINYARWANDA =
          T.let(
            :kinyarwanda,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        KOREAN =
          T.let(:korean, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        KURDISH =
          T.let(:kurdish, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        KYRGYZ =
          T.let(:kyrgyz, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        LAO = T.let(:lao, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        LATIN =
          T.let(:latin, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        LATVIAN =
          T.let(:latvian, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        LINGALA =
          T.let(:lingala, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        LITHUANIAN =
          T.let(
            :lithuanian,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        LUXEMBOURGISH =
          T.let(
            :luxembourgish,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        MACEDONIAN =
          T.let(
            :macedonian,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        MALAGASY =
          T.let(
            :malagasy,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        MALAY =
          T.let(:malay, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        MALAYALAM =
          T.let(
            :malayalam,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        MALTESE =
          T.let(:maltese, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        MAORI =
          T.let(:maori, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        MARATHI =
          T.let(:marathi, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        MONGOLIAN =
          T.let(
            :mongolian,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        NEPALI =
          T.let(:nepali, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        NORWEGIAN =
          T.let(
            :norwegian,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        ODIA =
          T.let(:odia, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        OROMO =
          T.let(:oromo, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        PASHTO =
          T.let(:pashto, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        PIDGIN =
          T.let(:pidgin, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        POLISH =
          T.let(:polish, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        PORTUGUESE =
          T.let(
            :portuguese,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        PUNJABI =
          T.let(:punjabi, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        QUECHUA =
          T.let(:quechua, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        ROMANIAN =
          T.let(
            :romanian,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        RUSSIAN =
          T.let(:russian, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        SAMOAN =
          T.let(:samoan, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        SCOTTISH_GAELIC =
          T.let(
            :"scottish-gaelic",
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        SERBIAN =
          T.let(:serbian, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        SESOTHO =
          T.let(:sesotho, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        SHONA =
          T.let(:shona, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        SINDHI =
          T.let(:sindhi, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        SINHALA =
          T.let(:sinhala, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        SLOVAK =
          T.let(:slovak, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        SLOVENE =
          T.let(:slovene, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        SOMALI =
          T.let(:somali, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        SPANISH =
          T.let(:spanish, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        SUNDANESE =
          T.let(
            :sundanese,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        SWAHILI =
          T.let(:swahili, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        SWEDISH =
          T.let(:swedish, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        TAGALOG =
          T.let(:tagalog, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        TAJIK =
          T.let(:tajik, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        TAMIL =
          T.let(:tamil, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        TATAR =
          T.let(:tatar, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        TELUGU =
          T.let(:telugu, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        THAI =
          T.let(:thai, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        TIBETAN =
          T.let(:tibetan, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        TIGRINYA =
          T.let(
            :tigrinya,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        TONGAN =
          T.let(:tongan, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        TSWANA =
          T.let(:tswana, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        TURKISH =
          T.let(:turkish, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        TURKMEN =
          T.let(:turkmen, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        UKRAINIAN =
          T.let(
            :ukrainian,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        URDU =
          T.let(:urdu, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        UYGHUR =
          T.let(:uyghur, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        UZBEK =
          T.let(:uzbek, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        VIETNAMESE =
          T.let(
            :vietnamese,
            ContextDev::BrandSearchParams::Language::TaggedSymbol
          )
        WELSH =
          T.let(:welsh, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        WOLOF =
          T.let(:wolof, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        XHOSA =
          T.let(:xhosa, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        YIDDISH =
          T.let(:yiddish, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        YORUBA =
          T.let(:yoruba, ContextDev::BrandSearchParams::Language::TaggedSymbol)
        ZULU =
          T.let(:zulu, ContextDev::BrandSearchParams::Language::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::BrandSearchParams::Language::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module QueryBy
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::BrandSearchParams::QueryBy) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NAME =
          T.let(:name, ContextDev::BrandSearchParams::QueryBy::TaggedSymbol)
        DOMAIN =
          T.let(:domain, ContextDev::BrandSearchParams::QueryBy::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::BrandSearchParams::QueryBy::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
