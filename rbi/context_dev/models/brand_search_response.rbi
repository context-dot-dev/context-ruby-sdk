# typed: strong

module ContextDev
  module Models
    class BrandSearchResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::BrandSearchResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Up to 10 matching brands: name matches first, then domain matches, each group
      # ordered by popularity. Empty when nothing matches.
      sig { returns(T::Array[ContextDev::Models::BrandSearchResponse::Result]) }
      attr_accessor :results

      # Credits this request used and your remaining balance.
      sig do
        returns(T.nilable(ContextDev::Models::BrandSearchResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::BrandSearchResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          request_id: String,
          results:
            T::Array[ContextDev::Models::BrandSearchResponse::Result::OrHash],
          key_metadata:
            ContextDev::Models::BrandSearchResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Up to 10 matching brands: name matches first, then domain matches, each group
        # ordered by popularity. Empty when nothing matches.
        results:,
        # Credits this request used and your remaining balance.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            request_id: String,
            results: T::Array[ContextDev::Models::BrandSearchResponse::Result],
            key_metadata: ContextDev::Models::BrandSearchResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class Result < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BrandSearchResponse::Result,
              ContextDev::Internal::AnyHash
            )
          end

        # Domain of the brand.
        sig { returns(String) }
        attr_accessor :domain

        # Logo Link URL that serves the brand's logo with your organization's client ID.
        # Use it directly as an image source.
        sig { returns(String) }
        attr_accessor :logo

        # Name of the brand. Empty string when unknown.
        sig { returns(String) }
        attr_accessor :name

        # Country of the brand, as an uppercase ISO 3166-1 alpha-2 code. Omitted when
        # unknown.
        sig do
          returns(
            T.nilable(
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          )
        end
        attr_reader :country

        sig do
          params(
            country:
              ContextDev::Models::BrandSearchResponse::Result::Country::OrSymbol
          ).void
        end
        attr_writer :country

        # Short description of the brand. Omitted when unknown.
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # Primary language of the brand. Omitted when unknown.
        sig do
          returns(
            T.nilable(
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          )
        end
        attr_reader :language

        sig do
          params(
            language:
              ContextDev::Models::BrandSearchResponse::Result::Language::OrSymbol
          ).void
        end
        attr_writer :language

        sig do
          params(
            domain: String,
            logo: String,
            name: String,
            country:
              ContextDev::Models::BrandSearchResponse::Result::Country::OrSymbol,
            description: String,
            language:
              ContextDev::Models::BrandSearchResponse::Result::Language::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Domain of the brand.
          domain:,
          # Logo Link URL that serves the brand's logo with your organization's client ID.
          # Use it directly as an image source.
          logo:,
          # Name of the brand. Empty string when unknown.
          name:,
          # Country of the brand, as an uppercase ISO 3166-1 alpha-2 code. Omitted when
          # unknown.
          country: nil,
          # Short description of the brand. Omitted when unknown.
          description: nil,
          # Primary language of the brand. Omitted when unknown.
          language: nil
        )
        end

        sig do
          override.returns(
            {
              domain: String,
              logo: String,
              name: String,
              country:
                ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol,
              description: String,
              language:
                ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Country of the brand, as an uppercase ISO 3166-1 alpha-2 code. Omitted when
        # unknown.
        module Country
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::BrandSearchResponse::Result::Country
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AD =
            T.let(
              :AD,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          AE =
            T.let(
              :AE,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          AF =
            T.let(
              :AF,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          AG =
            T.let(
              :AG,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          AI =
            T.let(
              :AI,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          AL =
            T.let(
              :AL,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          AM =
            T.let(
              :AM,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          AO =
            T.let(
              :AO,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          AQ =
            T.let(
              :AQ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          AR =
            T.let(
              :AR,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          AS =
            T.let(
              :AS,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          AT =
            T.let(
              :AT,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          AU =
            T.let(
              :AU,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          AW =
            T.let(
              :AW,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          AX =
            T.let(
              :AX,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          AZ =
            T.let(
              :AZ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BA =
            T.let(
              :BA,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BB =
            T.let(
              :BB,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BD =
            T.let(
              :BD,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BE =
            T.let(
              :BE,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BF =
            T.let(
              :BF,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BG =
            T.let(
              :BG,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BH =
            T.let(
              :BH,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BI =
            T.let(
              :BI,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BJ =
            T.let(
              :BJ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BL =
            T.let(
              :BL,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BM =
            T.let(
              :BM,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BN =
            T.let(
              :BN,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BO =
            T.let(
              :BO,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BQ =
            T.let(
              :BQ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BR =
            T.let(
              :BR,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BS =
            T.let(
              :BS,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BT =
            T.let(
              :BT,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BV =
            T.let(
              :BV,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BW =
            T.let(
              :BW,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BY =
            T.let(
              :BY,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          BZ =
            T.let(
              :BZ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CA =
            T.let(
              :CA,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CC =
            T.let(
              :CC,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CD =
            T.let(
              :CD,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CF =
            T.let(
              :CF,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CG =
            T.let(
              :CG,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CH =
            T.let(
              :CH,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CI =
            T.let(
              :CI,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CK =
            T.let(
              :CK,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CL =
            T.let(
              :CL,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CM =
            T.let(
              :CM,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CN =
            T.let(
              :CN,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CO =
            T.let(
              :CO,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CR =
            T.let(
              :CR,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CU =
            T.let(
              :CU,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CV =
            T.let(
              :CV,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CW =
            T.let(
              :CW,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CX =
            T.let(
              :CX,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CY =
            T.let(
              :CY,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          CZ =
            T.let(
              :CZ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          DE =
            T.let(
              :DE,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          DJ =
            T.let(
              :DJ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          DK =
            T.let(
              :DK,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          DM =
            T.let(
              :DM,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          DO =
            T.let(
              :DO,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          DZ =
            T.let(
              :DZ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          EC =
            T.let(
              :EC,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          EE =
            T.let(
              :EE,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          EG =
            T.let(
              :EG,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          EH =
            T.let(
              :EH,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          ER =
            T.let(
              :ER,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          ES =
            T.let(
              :ES,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          ET =
            T.let(
              :ET,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          FI =
            T.let(
              :FI,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          FJ =
            T.let(
              :FJ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          FK =
            T.let(
              :FK,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          FM =
            T.let(
              :FM,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          FO =
            T.let(
              :FO,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          FR =
            T.let(
              :FR,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GA =
            T.let(
              :GA,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GB =
            T.let(
              :GB,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GD =
            T.let(
              :GD,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GE =
            T.let(
              :GE,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GF =
            T.let(
              :GF,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GG =
            T.let(
              :GG,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GH =
            T.let(
              :GH,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GI =
            T.let(
              :GI,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GL =
            T.let(
              :GL,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GM =
            T.let(
              :GM,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GN =
            T.let(
              :GN,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GP =
            T.let(
              :GP,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GQ =
            T.let(
              :GQ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GR =
            T.let(
              :GR,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GS =
            T.let(
              :GS,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GT =
            T.let(
              :GT,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GU =
            T.let(
              :GU,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GW =
            T.let(
              :GW,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          GY =
            T.let(
              :GY,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          HK =
            T.let(
              :HK,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          HM =
            T.let(
              :HM,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          HN =
            T.let(
              :HN,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          HR =
            T.let(
              :HR,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          HT =
            T.let(
              :HT,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          HU =
            T.let(
              :HU,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          ID =
            T.let(
              :ID,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          IE =
            T.let(
              :IE,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          IL =
            T.let(
              :IL,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          IM =
            T.let(
              :IM,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          IN =
            T.let(
              :IN,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          IO =
            T.let(
              :IO,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          IQ =
            T.let(
              :IQ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          IR =
            T.let(
              :IR,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          IS =
            T.let(
              :IS,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          IT =
            T.let(
              :IT,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          JE =
            T.let(
              :JE,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          JM =
            T.let(
              :JM,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          JO =
            T.let(
              :JO,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          JP =
            T.let(
              :JP,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          KE =
            T.let(
              :KE,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          KG =
            T.let(
              :KG,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          KH =
            T.let(
              :KH,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          KI =
            T.let(
              :KI,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          KM =
            T.let(
              :KM,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          KN =
            T.let(
              :KN,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          KP =
            T.let(
              :KP,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          KR =
            T.let(
              :KR,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          KW =
            T.let(
              :KW,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          KY =
            T.let(
              :KY,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          KZ =
            T.let(
              :KZ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          LA =
            T.let(
              :LA,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          LB =
            T.let(
              :LB,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          LC =
            T.let(
              :LC,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          LI =
            T.let(
              :LI,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          LK =
            T.let(
              :LK,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          LR =
            T.let(
              :LR,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          LS =
            T.let(
              :LS,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          LT =
            T.let(
              :LT,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          LU =
            T.let(
              :LU,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          LV =
            T.let(
              :LV,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          LY =
            T.let(
              :LY,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MA =
            T.let(
              :MA,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MC =
            T.let(
              :MC,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MD =
            T.let(
              :MD,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          ME =
            T.let(
              :ME,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MF =
            T.let(
              :MF,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MG =
            T.let(
              :MG,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MH =
            T.let(
              :MH,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MK =
            T.let(
              :MK,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          ML =
            T.let(
              :ML,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MM =
            T.let(
              :MM,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MN =
            T.let(
              :MN,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MO =
            T.let(
              :MO,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MP =
            T.let(
              :MP,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MQ =
            T.let(
              :MQ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MR =
            T.let(
              :MR,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MS =
            T.let(
              :MS,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MT =
            T.let(
              :MT,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MU =
            T.let(
              :MU,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MV =
            T.let(
              :MV,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MW =
            T.let(
              :MW,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MX =
            T.let(
              :MX,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MY =
            T.let(
              :MY,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          MZ =
            T.let(
              :MZ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          NA =
            T.let(
              :NA,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          NC =
            T.let(
              :NC,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          NE =
            T.let(
              :NE,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          NF =
            T.let(
              :NF,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          NG =
            T.let(
              :NG,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          NI =
            T.let(
              :NI,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          NL =
            T.let(
              :NL,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          NO =
            T.let(
              :NO,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          NP =
            T.let(
              :NP,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          NR =
            T.let(
              :NR,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          NU =
            T.let(
              :NU,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          NZ =
            T.let(
              :NZ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          OM =
            T.let(
              :OM,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          PA =
            T.let(
              :PA,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          PE =
            T.let(
              :PE,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          PF =
            T.let(
              :PF,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          PG =
            T.let(
              :PG,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          PH =
            T.let(
              :PH,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          PK =
            T.let(
              :PK,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          PL =
            T.let(
              :PL,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          PM =
            T.let(
              :PM,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          PN =
            T.let(
              :PN,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          PR =
            T.let(
              :PR,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          PS =
            T.let(
              :PS,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          PT =
            T.let(
              :PT,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          PW =
            T.let(
              :PW,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          PY =
            T.let(
              :PY,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          QA =
            T.let(
              :QA,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          RE =
            T.let(
              :RE,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          RO =
            T.let(
              :RO,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          RS =
            T.let(
              :RS,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          RU =
            T.let(
              :RU,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          RW =
            T.let(
              :RW,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SA =
            T.let(
              :SA,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SB =
            T.let(
              :SB,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SC =
            T.let(
              :SC,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SD =
            T.let(
              :SD,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SE =
            T.let(
              :SE,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SG =
            T.let(
              :SG,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SH =
            T.let(
              :SH,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SI =
            T.let(
              :SI,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SJ =
            T.let(
              :SJ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SK =
            T.let(
              :SK,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SL =
            T.let(
              :SL,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SM =
            T.let(
              :SM,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SN =
            T.let(
              :SN,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SO =
            T.let(
              :SO,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SR =
            T.let(
              :SR,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SS =
            T.let(
              :SS,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          ST =
            T.let(
              :ST,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SV =
            T.let(
              :SV,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SX =
            T.let(
              :SX,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SY =
            T.let(
              :SY,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          SZ =
            T.let(
              :SZ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          TC =
            T.let(
              :TC,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          TD =
            T.let(
              :TD,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          TF =
            T.let(
              :TF,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          TG =
            T.let(
              :TG,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          TH =
            T.let(
              :TH,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          TJ =
            T.let(
              :TJ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          TK =
            T.let(
              :TK,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          TL =
            T.let(
              :TL,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          TM =
            T.let(
              :TM,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          TN =
            T.let(
              :TN,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          TO =
            T.let(
              :TO,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          TR =
            T.let(
              :TR,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          TT =
            T.let(
              :TT,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          TV =
            T.let(
              :TV,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          TW =
            T.let(
              :TW,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          TZ =
            T.let(
              :TZ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          UA =
            T.let(
              :UA,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          UG =
            T.let(
              :UG,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          UM =
            T.let(
              :UM,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          US =
            T.let(
              :US,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          UY =
            T.let(
              :UY,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          UZ =
            T.let(
              :UZ,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          VA =
            T.let(
              :VA,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          VC =
            T.let(
              :VC,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          VE =
            T.let(
              :VE,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          VG =
            T.let(
              :VG,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          VI =
            T.let(
              :VI,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          VN =
            T.let(
              :VN,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          VU =
            T.let(
              :VU,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          WF =
            T.let(
              :WF,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          WS =
            T.let(
              :WS,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          YE =
            T.let(
              :YE,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          YT =
            T.let(
              :YT,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          ZA =
            T.let(
              :ZA,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          ZM =
            T.let(
              :ZM,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )
          ZW =
            T.let(
              :ZW,
              ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::BrandSearchResponse::Result::Country::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Primary language of the brand. Omitted when unknown.
        module Language
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::BrandSearchResponse::Result::Language
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AFRIKAANS =
            T.let(
              :afrikaans,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          ALBANIAN =
            T.let(
              :albanian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          AMHARIC =
            T.let(
              :amharic,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          ARABIC =
            T.let(
              :arabic,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          ARMENIAN =
            T.let(
              :armenian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          ASSAMESE =
            T.let(
              :assamese,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          AYMARA =
            T.let(
              :aymara,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          AZERI =
            T.let(
              :azeri,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          BASQUE =
            T.let(
              :basque,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          BELARUSIAN =
            T.let(
              :belarusian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          BENGALI =
            T.let(
              :bengali,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          BOSNIAN =
            T.let(
              :bosnian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          BULGARIAN =
            T.let(
              :bulgarian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          BURMESE =
            T.let(
              :burmese,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          CANTONESE =
            T.let(
              :cantonese,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          CATALAN =
            T.let(
              :catalan,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          CEBUANO =
            T.let(
              :cebuano,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          CHINESE =
            T.let(
              :chinese,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          CORSICAN =
            T.let(
              :corsican,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          CROATIAN =
            T.let(
              :croatian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          CZECH =
            T.let(
              :czech,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          DANISH =
            T.let(
              :danish,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          DUTCH =
            T.let(
              :dutch,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          ENGLISH =
            T.let(
              :english,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          ESPERANTO =
            T.let(
              :esperanto,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          ESTONIAN =
            T.let(
              :estonian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          FARSI =
            T.let(
              :farsi,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          FIJIAN =
            T.let(
              :fijian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          FINNISH =
            T.let(
              :finnish,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          FRENCH =
            T.let(
              :french,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          GALICIAN =
            T.let(
              :galician,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          GEORGIAN =
            T.let(
              :georgian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          GERMAN =
            T.let(
              :german,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          GREEK =
            T.let(
              :greek,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          GUARANI =
            T.let(
              :guarani,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          GUJARATI =
            T.let(
              :gujarati,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          HAITIAN_CREOLE =
            T.let(
              :"haitian-creole",
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          HAUSA =
            T.let(
              :hausa,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          HAWAIIAN =
            T.let(
              :hawaiian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          HEBREW =
            T.let(
              :hebrew,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          HINDI =
            T.let(
              :hindi,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          HMONG =
            T.let(
              :hmong,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          HUNGARIAN =
            T.let(
              :hungarian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          ICELANDIC =
            T.let(
              :icelandic,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          IGBO =
            T.let(
              :igbo,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          INDONESIAN =
            T.let(
              :indonesian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          IRISH =
            T.let(
              :irish,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          ITALIAN =
            T.let(
              :italian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          JAPANESE =
            T.let(
              :japanese,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          JAVANESE =
            T.let(
              :javanese,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          KANNADA =
            T.let(
              :kannada,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          KAZAKH =
            T.let(
              :kazakh,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          KHMER =
            T.let(
              :khmer,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          KINYARWANDA =
            T.let(
              :kinyarwanda,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          KOREAN =
            T.let(
              :korean,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          KURDISH =
            T.let(
              :kurdish,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          KYRGYZ =
            T.let(
              :kyrgyz,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          LAO =
            T.let(
              :lao,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          LATIN =
            T.let(
              :latin,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          LATVIAN =
            T.let(
              :latvian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          LINGALA =
            T.let(
              :lingala,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          LITHUANIAN =
            T.let(
              :lithuanian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          LUXEMBOURGISH =
            T.let(
              :luxembourgish,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          MACEDONIAN =
            T.let(
              :macedonian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          MALAGASY =
            T.let(
              :malagasy,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          MALAY =
            T.let(
              :malay,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          MALAYALAM =
            T.let(
              :malayalam,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          MALTESE =
            T.let(
              :maltese,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          MAORI =
            T.let(
              :maori,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          MARATHI =
            T.let(
              :marathi,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          MONGOLIAN =
            T.let(
              :mongolian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          NEPALI =
            T.let(
              :nepali,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          NORWEGIAN =
            T.let(
              :norwegian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          ODIA =
            T.let(
              :odia,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          OROMO =
            T.let(
              :oromo,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          PASHTO =
            T.let(
              :pashto,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          PIDGIN =
            T.let(
              :pidgin,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          POLISH =
            T.let(
              :polish,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          PORTUGUESE =
            T.let(
              :portuguese,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          PUNJABI =
            T.let(
              :punjabi,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          QUECHUA =
            T.let(
              :quechua,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          ROMANIAN =
            T.let(
              :romanian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          RUSSIAN =
            T.let(
              :russian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          SAMOAN =
            T.let(
              :samoan,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          SCOTTISH_GAELIC =
            T.let(
              :"scottish-gaelic",
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          SERBIAN =
            T.let(
              :serbian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          SESOTHO =
            T.let(
              :sesotho,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          SHONA =
            T.let(
              :shona,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          SINDHI =
            T.let(
              :sindhi,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          SINHALA =
            T.let(
              :sinhala,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          SLOVAK =
            T.let(
              :slovak,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          SLOVENE =
            T.let(
              :slovene,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          SOMALI =
            T.let(
              :somali,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          SPANISH =
            T.let(
              :spanish,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          SUNDANESE =
            T.let(
              :sundanese,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          SWAHILI =
            T.let(
              :swahili,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          SWEDISH =
            T.let(
              :swedish,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          TAGALOG =
            T.let(
              :tagalog,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          TAJIK =
            T.let(
              :tajik,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          TAMIL =
            T.let(
              :tamil,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          TATAR =
            T.let(
              :tatar,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          TELUGU =
            T.let(
              :telugu,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          THAI =
            T.let(
              :thai,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          TIBETAN =
            T.let(
              :tibetan,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          TIGRINYA =
            T.let(
              :tigrinya,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          TONGAN =
            T.let(
              :tongan,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          TSWANA =
            T.let(
              :tswana,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          TURKISH =
            T.let(
              :turkish,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          TURKMEN =
            T.let(
              :turkmen,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          UKRAINIAN =
            T.let(
              :ukrainian,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          URDU =
            T.let(
              :urdu,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          UYGHUR =
            T.let(
              :uyghur,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          UZBEK =
            T.let(
              :uzbek,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          VIETNAMESE =
            T.let(
              :vietnamese,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          WELSH =
            T.let(
              :welsh,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          WOLOF =
            T.let(
              :wolof,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          XHOSA =
            T.let(
              :xhosa,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          YIDDISH =
            T.let(
              :yiddish,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          YORUBA =
            T.let(
              :yoruba,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )
          ZULU =
            T.let(
              :zulu,
              ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::BrandSearchResponse::Result::Language::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BrandSearchResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits your organization has left after this request.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Credits this request used and your remaining balance.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Credits charged for this request.
          credits_consumed:,
          # Credits your organization has left after this request.
          credits_remaining:
        )
        end

        sig do
          override.returns(
            { credits_consumed: Integer, credits_remaining: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
