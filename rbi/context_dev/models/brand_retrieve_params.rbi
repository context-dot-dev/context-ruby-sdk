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

      # Exactly one of domain, name, email, ticker, or transaction_info must be
      # provided.
      sig do
        returns(
          T.any(
            ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest,
            ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest,
            ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest,
            ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest,
            ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest
          )
        )
      end
      attr_accessor :body

      sig do
        params(
          body:
            T.any(
              ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::OrHash,
              ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::OrHash,
              ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::OrHash,
              ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::OrHash,
              ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::OrHash
            ),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Exactly one of domain, name, email, ticker, or transaction_info must be
        # provided.
        body:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            body:
              T.any(
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest
              ),
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Exactly one of domain, name, email, ticker, or transaction_info must be
      # provided.
      module Body
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest,
              ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest,
              ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest,
              ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest,
              ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest
            )
          end

        class BrandRetrieveByDomainRequest < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest,
                ContextDev::Internal::AnyHash
              )
            end

          # Domain name to retrieve brand data for (e.g., 'stripe.com').
          sig { returns(String) }
          attr_accessor :domain

          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::OrSymbol
              )
            )
          end
          attr_reader :force_language

          sig do
            params(
              force_language:
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::OrSymbol
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
          # less comprehensive data.
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

          # Retrieve brand data by domain. Cannot be combined with name, email, or ticker.
          sig do
            params(
              domain: String,
              force_language:
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::OrSymbol,
              max_age_ms: Integer,
              max_speed: T::Boolean,
              timeout_ms: Integer
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
            # Optional timeout in milliseconds for the request. If the request takes longer
            # than this value, it will be aborted with a 408 status code. Maximum allowed
            # value is 300000ms (5 minutes).
            timeout_ms: nil
          )
          end

          sig do
            override.returns(
              {
                domain: String,
                force_language:
                  ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::OrSymbol,
                max_age_ms: Integer,
                max_speed: T::Boolean,
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
                  ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AFRIKAANS =
              T.let(
                :afrikaans,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            ALBANIAN =
              T.let(
                :albanian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            AMHARIC =
              T.let(
                :amharic,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            ARABIC =
              T.let(
                :arabic,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            ARMENIAN =
              T.let(
                :armenian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            ASSAMESE =
              T.let(
                :assamese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            AYMARA =
              T.let(
                :aymara,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            AZERI =
              T.let(
                :azeri,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            BASQUE =
              T.let(
                :basque,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            BELARUSIAN =
              T.let(
                :belarusian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            BENGALI =
              T.let(
                :bengali,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            BOSNIAN =
              T.let(
                :bosnian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            BULGARIAN =
              T.let(
                :bulgarian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            BURMESE =
              T.let(
                :burmese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            CANTONESE =
              T.let(
                :cantonese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            CATALAN =
              T.let(
                :catalan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            CEBUANO =
              T.let(
                :cebuano,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            CHINESE =
              T.let(
                :chinese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            CORSICAN =
              T.let(
                :corsican,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            CROATIAN =
              T.let(
                :croatian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            CZECH =
              T.let(
                :czech,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            DANISH =
              T.let(
                :danish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            DUTCH =
              T.let(
                :dutch,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            ENGLISH =
              T.let(
                :english,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            ESPERANTO =
              T.let(
                :esperanto,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            ESTONIAN =
              T.let(
                :estonian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            FARSI =
              T.let(
                :farsi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            FIJIAN =
              T.let(
                :fijian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            FINNISH =
              T.let(
                :finnish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            FRENCH =
              T.let(
                :french,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            GALICIAN =
              T.let(
                :galician,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            GEORGIAN =
              T.let(
                :georgian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            GERMAN =
              T.let(
                :german,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            GREEK =
              T.let(
                :greek,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            GUARANI =
              T.let(
                :guarani,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            GUJARATI =
              T.let(
                :gujarati,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            HAITIAN_CREOLE =
              T.let(
                :"haitian-creole",
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            HAUSA =
              T.let(
                :hausa,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            HAWAIIAN =
              T.let(
                :hawaiian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            HEBREW =
              T.let(
                :hebrew,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            HINDI =
              T.let(
                :hindi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            HMONG =
              T.let(
                :hmong,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            HUNGARIAN =
              T.let(
                :hungarian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            ICELANDIC =
              T.let(
                :icelandic,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            IGBO =
              T.let(
                :igbo,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            INDONESIAN =
              T.let(
                :indonesian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            IRISH =
              T.let(
                :irish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            ITALIAN =
              T.let(
                :italian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            JAPANESE =
              T.let(
                :japanese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            JAVANESE =
              T.let(
                :javanese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            KANNADA =
              T.let(
                :kannada,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            KAZAKH =
              T.let(
                :kazakh,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            KHMER =
              T.let(
                :khmer,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            KINYARWANDA =
              T.let(
                :kinyarwanda,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            KOREAN =
              T.let(
                :korean,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            KURDISH =
              T.let(
                :kurdish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            KYRGYZ =
              T.let(
                :kyrgyz,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            LAO =
              T.let(
                :lao,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            LATIN =
              T.let(
                :latin,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            LATVIAN =
              T.let(
                :latvian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            LINGALA =
              T.let(
                :lingala,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            LITHUANIAN =
              T.let(
                :lithuanian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            LUXEMBOURGISH =
              T.let(
                :luxembourgish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            MACEDONIAN =
              T.let(
                :macedonian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            MALAGASY =
              T.let(
                :malagasy,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            MALAY =
              T.let(
                :malay,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            MALAYALAM =
              T.let(
                :malayalam,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            MALTESE =
              T.let(
                :maltese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            MAORI =
              T.let(
                :maori,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            MARATHI =
              T.let(
                :marathi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            MONGOLIAN =
              T.let(
                :mongolian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            NEPALI =
              T.let(
                :nepali,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            NORWEGIAN =
              T.let(
                :norwegian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            ODIA =
              T.let(
                :odia,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            OROMO =
              T.let(
                :oromo,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            PASHTO =
              T.let(
                :pashto,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            PIDGIN =
              T.let(
                :pidgin,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            POLISH =
              T.let(
                :polish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            PORTUGUESE =
              T.let(
                :portuguese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            PUNJABI =
              T.let(
                :punjabi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            QUECHUA =
              T.let(
                :quechua,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            ROMANIAN =
              T.let(
                :romanian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            RUSSIAN =
              T.let(
                :russian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            SAMOAN =
              T.let(
                :samoan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            SCOTTISH_GAELIC =
              T.let(
                :"scottish-gaelic",
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            SERBIAN =
              T.let(
                :serbian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            SESOTHO =
              T.let(
                :sesotho,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            SHONA =
              T.let(
                :shona,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            SINDHI =
              T.let(
                :sindhi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            SINHALA =
              T.let(
                :sinhala,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            SLOVAK =
              T.let(
                :slovak,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            SLOVENE =
              T.let(
                :slovene,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            SOMALI =
              T.let(
                :somali,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            SPANISH =
              T.let(
                :spanish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            SUNDANESE =
              T.let(
                :sundanese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            SWAHILI =
              T.let(
                :swahili,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            SWEDISH =
              T.let(
                :swedish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            TAGALOG =
              T.let(
                :tagalog,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            TAJIK =
              T.let(
                :tajik,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            TAMIL =
              T.let(
                :tamil,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            TATAR =
              T.let(
                :tatar,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            TELUGU =
              T.let(
                :telugu,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            THAI =
              T.let(
                :thai,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            TIBETAN =
              T.let(
                :tibetan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            TIGRINYA =
              T.let(
                :tigrinya,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            TONGAN =
              T.let(
                :tongan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            TSWANA =
              T.let(
                :tswana,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            TURKISH =
              T.let(
                :turkish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            TURKMEN =
              T.let(
                :turkmen,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            UKRAINIAN =
              T.let(
                :ukrainian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            URDU =
              T.let(
                :urdu,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            UYGHUR =
              T.let(
                :uyghur,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            UZBEK =
              T.let(
                :uzbek,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            VIETNAMESE =
              T.let(
                :vietnamese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            WELSH =
              T.let(
                :welsh,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            WOLOF =
              T.let(
                :wolof,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            XHOSA =
              T.let(
                :xhosa,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            YIDDISH =
              T.let(
                :yiddish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            YORUBA =
              T.let(
                :yoruba,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )
            ZULU =
              T.let(
                :zulu,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::BrandRetrieveParams::Body::BrandRetrieveByDomainRequest::ForceLanguage::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class BrandRetrieveByNameRequest < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest,
                ContextDev::Internal::AnyHash
              )
            end

          # Company name to retrieve brand data for (e.g., 'Apple Inc').
          sig { returns(String) }
          attr_accessor :name

          # Optional country code hint (GL parameter) to specify the country when looking up
          # by company name.
          sig { returns(T.nilable(String)) }
          attr_reader :country_gl

          sig { params(country_gl: String).void }
          attr_writer :country_gl

          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::OrSymbol
              )
            )
          end
          attr_reader :force_language

          sig do
            params(
              force_language:
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::OrSymbol
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
          # less comprehensive data.
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

          # Retrieve brand data by company name. Cannot be combined with domain, email, or
          # ticker.
          sig do
            params(
              name: String,
              country_gl: String,
              force_language:
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::OrSymbol,
              max_age_ms: Integer,
              max_speed: T::Boolean,
              timeout_ms: Integer
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
            # Optional timeout in milliseconds for the request. If the request takes longer
            # than this value, it will be aborted with a 408 status code. Maximum allowed
            # value is 300000ms (5 minutes).
            timeout_ms: nil
          )
          end

          sig do
            override.returns(
              {
                name: String,
                country_gl: String,
                force_language:
                  ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::OrSymbol,
                max_age_ms: Integer,
                max_speed: T::Boolean,
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
                  ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AFRIKAANS =
              T.let(
                :afrikaans,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            ALBANIAN =
              T.let(
                :albanian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            AMHARIC =
              T.let(
                :amharic,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            ARABIC =
              T.let(
                :arabic,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            ARMENIAN =
              T.let(
                :armenian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            ASSAMESE =
              T.let(
                :assamese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            AYMARA =
              T.let(
                :aymara,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            AZERI =
              T.let(
                :azeri,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            BASQUE =
              T.let(
                :basque,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            BELARUSIAN =
              T.let(
                :belarusian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            BENGALI =
              T.let(
                :bengali,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            BOSNIAN =
              T.let(
                :bosnian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            BULGARIAN =
              T.let(
                :bulgarian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            BURMESE =
              T.let(
                :burmese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            CANTONESE =
              T.let(
                :cantonese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            CATALAN =
              T.let(
                :catalan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            CEBUANO =
              T.let(
                :cebuano,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            CHINESE =
              T.let(
                :chinese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            CORSICAN =
              T.let(
                :corsican,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            CROATIAN =
              T.let(
                :croatian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            CZECH =
              T.let(
                :czech,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            DANISH =
              T.let(
                :danish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            DUTCH =
              T.let(
                :dutch,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            ENGLISH =
              T.let(
                :english,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            ESPERANTO =
              T.let(
                :esperanto,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            ESTONIAN =
              T.let(
                :estonian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            FARSI =
              T.let(
                :farsi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            FIJIAN =
              T.let(
                :fijian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            FINNISH =
              T.let(
                :finnish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            FRENCH =
              T.let(
                :french,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            GALICIAN =
              T.let(
                :galician,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            GEORGIAN =
              T.let(
                :georgian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            GERMAN =
              T.let(
                :german,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            GREEK =
              T.let(
                :greek,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            GUARANI =
              T.let(
                :guarani,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            GUJARATI =
              T.let(
                :gujarati,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            HAITIAN_CREOLE =
              T.let(
                :"haitian-creole",
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            HAUSA =
              T.let(
                :hausa,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            HAWAIIAN =
              T.let(
                :hawaiian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            HEBREW =
              T.let(
                :hebrew,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            HINDI =
              T.let(
                :hindi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            HMONG =
              T.let(
                :hmong,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            HUNGARIAN =
              T.let(
                :hungarian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            ICELANDIC =
              T.let(
                :icelandic,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            IGBO =
              T.let(
                :igbo,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            INDONESIAN =
              T.let(
                :indonesian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            IRISH =
              T.let(
                :irish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            ITALIAN =
              T.let(
                :italian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            JAPANESE =
              T.let(
                :japanese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            JAVANESE =
              T.let(
                :javanese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            KANNADA =
              T.let(
                :kannada,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            KAZAKH =
              T.let(
                :kazakh,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            KHMER =
              T.let(
                :khmer,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            KINYARWANDA =
              T.let(
                :kinyarwanda,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            KOREAN =
              T.let(
                :korean,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            KURDISH =
              T.let(
                :kurdish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            KYRGYZ =
              T.let(
                :kyrgyz,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            LAO =
              T.let(
                :lao,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            LATIN =
              T.let(
                :latin,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            LATVIAN =
              T.let(
                :latvian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            LINGALA =
              T.let(
                :lingala,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            LITHUANIAN =
              T.let(
                :lithuanian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            LUXEMBOURGISH =
              T.let(
                :luxembourgish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            MACEDONIAN =
              T.let(
                :macedonian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            MALAGASY =
              T.let(
                :malagasy,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            MALAY =
              T.let(
                :malay,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            MALAYALAM =
              T.let(
                :malayalam,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            MALTESE =
              T.let(
                :maltese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            MAORI =
              T.let(
                :maori,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            MARATHI =
              T.let(
                :marathi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            MONGOLIAN =
              T.let(
                :mongolian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            NEPALI =
              T.let(
                :nepali,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            NORWEGIAN =
              T.let(
                :norwegian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            ODIA =
              T.let(
                :odia,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            OROMO =
              T.let(
                :oromo,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            PASHTO =
              T.let(
                :pashto,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            PIDGIN =
              T.let(
                :pidgin,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            POLISH =
              T.let(
                :polish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            PORTUGUESE =
              T.let(
                :portuguese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            PUNJABI =
              T.let(
                :punjabi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            QUECHUA =
              T.let(
                :quechua,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            ROMANIAN =
              T.let(
                :romanian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            RUSSIAN =
              T.let(
                :russian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            SAMOAN =
              T.let(
                :samoan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            SCOTTISH_GAELIC =
              T.let(
                :"scottish-gaelic",
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            SERBIAN =
              T.let(
                :serbian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            SESOTHO =
              T.let(
                :sesotho,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            SHONA =
              T.let(
                :shona,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            SINDHI =
              T.let(
                :sindhi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            SINHALA =
              T.let(
                :sinhala,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            SLOVAK =
              T.let(
                :slovak,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            SLOVENE =
              T.let(
                :slovene,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            SOMALI =
              T.let(
                :somali,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            SPANISH =
              T.let(
                :spanish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            SUNDANESE =
              T.let(
                :sundanese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            SWAHILI =
              T.let(
                :swahili,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            SWEDISH =
              T.let(
                :swedish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            TAGALOG =
              T.let(
                :tagalog,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            TAJIK =
              T.let(
                :tajik,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            TAMIL =
              T.let(
                :tamil,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            TATAR =
              T.let(
                :tatar,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            TELUGU =
              T.let(
                :telugu,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            THAI =
              T.let(
                :thai,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            TIBETAN =
              T.let(
                :tibetan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            TIGRINYA =
              T.let(
                :tigrinya,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            TONGAN =
              T.let(
                :tongan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            TSWANA =
              T.let(
                :tswana,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            TURKISH =
              T.let(
                :turkish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            TURKMEN =
              T.let(
                :turkmen,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            UKRAINIAN =
              T.let(
                :ukrainian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            URDU =
              T.let(
                :urdu,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            UYGHUR =
              T.let(
                :uyghur,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            UZBEK =
              T.let(
                :uzbek,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            VIETNAMESE =
              T.let(
                :vietnamese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            WELSH =
              T.let(
                :welsh,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            WOLOF =
              T.let(
                :wolof,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            XHOSA =
              T.let(
                :xhosa,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            YIDDISH =
              T.let(
                :yiddish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            YORUBA =
              T.let(
                :yoruba,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )
            ZULU =
              T.let(
                :zulu,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::BrandRetrieveParams::Body::BrandRetrieveByNameRequest::ForceLanguage::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class BrandRetrieveByEmailRequest < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest,
                ContextDev::Internal::AnyHash
              )
            end

          # Email address to retrieve brand data for (e.g., 'jane@stripe.com').
          sig { returns(String) }
          attr_accessor :email

          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::OrSymbol
              )
            )
          end
          attr_reader :force_language

          sig do
            params(
              force_language:
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::OrSymbol
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
          # less comprehensive data.
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

          # Retrieve brand data by email address. The domain is extracted from the email.
          # Free and disposable email providers are rejected with 422. Cannot be combined
          # with domain, name, or ticker.
          sig do
            params(
              email: String,
              force_language:
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::OrSymbol,
              max_age_ms: Integer,
              max_speed: T::Boolean,
              timeout_ms: Integer
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
            # Optional timeout in milliseconds for the request. If the request takes longer
            # than this value, it will be aborted with a 408 status code. Maximum allowed
            # value is 300000ms (5 minutes).
            timeout_ms: nil
          )
          end

          sig do
            override.returns(
              {
                email: String,
                force_language:
                  ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::OrSymbol,
                max_age_ms: Integer,
                max_speed: T::Boolean,
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
                  ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AFRIKAANS =
              T.let(
                :afrikaans,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            ALBANIAN =
              T.let(
                :albanian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            AMHARIC =
              T.let(
                :amharic,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            ARABIC =
              T.let(
                :arabic,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            ARMENIAN =
              T.let(
                :armenian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            ASSAMESE =
              T.let(
                :assamese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            AYMARA =
              T.let(
                :aymara,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            AZERI =
              T.let(
                :azeri,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            BASQUE =
              T.let(
                :basque,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            BELARUSIAN =
              T.let(
                :belarusian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            BENGALI =
              T.let(
                :bengali,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            BOSNIAN =
              T.let(
                :bosnian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            BULGARIAN =
              T.let(
                :bulgarian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            BURMESE =
              T.let(
                :burmese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            CANTONESE =
              T.let(
                :cantonese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            CATALAN =
              T.let(
                :catalan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            CEBUANO =
              T.let(
                :cebuano,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            CHINESE =
              T.let(
                :chinese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            CORSICAN =
              T.let(
                :corsican,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            CROATIAN =
              T.let(
                :croatian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            CZECH =
              T.let(
                :czech,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            DANISH =
              T.let(
                :danish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            DUTCH =
              T.let(
                :dutch,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            ENGLISH =
              T.let(
                :english,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            ESPERANTO =
              T.let(
                :esperanto,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            ESTONIAN =
              T.let(
                :estonian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            FARSI =
              T.let(
                :farsi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            FIJIAN =
              T.let(
                :fijian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            FINNISH =
              T.let(
                :finnish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            FRENCH =
              T.let(
                :french,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            GALICIAN =
              T.let(
                :galician,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            GEORGIAN =
              T.let(
                :georgian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            GERMAN =
              T.let(
                :german,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            GREEK =
              T.let(
                :greek,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            GUARANI =
              T.let(
                :guarani,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            GUJARATI =
              T.let(
                :gujarati,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            HAITIAN_CREOLE =
              T.let(
                :"haitian-creole",
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            HAUSA =
              T.let(
                :hausa,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            HAWAIIAN =
              T.let(
                :hawaiian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            HEBREW =
              T.let(
                :hebrew,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            HINDI =
              T.let(
                :hindi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            HMONG =
              T.let(
                :hmong,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            HUNGARIAN =
              T.let(
                :hungarian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            ICELANDIC =
              T.let(
                :icelandic,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            IGBO =
              T.let(
                :igbo,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            INDONESIAN =
              T.let(
                :indonesian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            IRISH =
              T.let(
                :irish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            ITALIAN =
              T.let(
                :italian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            JAPANESE =
              T.let(
                :japanese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            JAVANESE =
              T.let(
                :javanese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            KANNADA =
              T.let(
                :kannada,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            KAZAKH =
              T.let(
                :kazakh,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            KHMER =
              T.let(
                :khmer,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            KINYARWANDA =
              T.let(
                :kinyarwanda,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            KOREAN =
              T.let(
                :korean,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            KURDISH =
              T.let(
                :kurdish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            KYRGYZ =
              T.let(
                :kyrgyz,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            LAO =
              T.let(
                :lao,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            LATIN =
              T.let(
                :latin,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            LATVIAN =
              T.let(
                :latvian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            LINGALA =
              T.let(
                :lingala,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            LITHUANIAN =
              T.let(
                :lithuanian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            LUXEMBOURGISH =
              T.let(
                :luxembourgish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            MACEDONIAN =
              T.let(
                :macedonian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            MALAGASY =
              T.let(
                :malagasy,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            MALAY =
              T.let(
                :malay,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            MALAYALAM =
              T.let(
                :malayalam,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            MALTESE =
              T.let(
                :maltese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            MAORI =
              T.let(
                :maori,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            MARATHI =
              T.let(
                :marathi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            MONGOLIAN =
              T.let(
                :mongolian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            NEPALI =
              T.let(
                :nepali,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            NORWEGIAN =
              T.let(
                :norwegian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            ODIA =
              T.let(
                :odia,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            OROMO =
              T.let(
                :oromo,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            PASHTO =
              T.let(
                :pashto,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            PIDGIN =
              T.let(
                :pidgin,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            POLISH =
              T.let(
                :polish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            PORTUGUESE =
              T.let(
                :portuguese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            PUNJABI =
              T.let(
                :punjabi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            QUECHUA =
              T.let(
                :quechua,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            ROMANIAN =
              T.let(
                :romanian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            RUSSIAN =
              T.let(
                :russian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            SAMOAN =
              T.let(
                :samoan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            SCOTTISH_GAELIC =
              T.let(
                :"scottish-gaelic",
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            SERBIAN =
              T.let(
                :serbian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            SESOTHO =
              T.let(
                :sesotho,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            SHONA =
              T.let(
                :shona,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            SINDHI =
              T.let(
                :sindhi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            SINHALA =
              T.let(
                :sinhala,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            SLOVAK =
              T.let(
                :slovak,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            SLOVENE =
              T.let(
                :slovene,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            SOMALI =
              T.let(
                :somali,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            SPANISH =
              T.let(
                :spanish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            SUNDANESE =
              T.let(
                :sundanese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            SWAHILI =
              T.let(
                :swahili,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            SWEDISH =
              T.let(
                :swedish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            TAGALOG =
              T.let(
                :tagalog,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            TAJIK =
              T.let(
                :tajik,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            TAMIL =
              T.let(
                :tamil,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            TATAR =
              T.let(
                :tatar,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            TELUGU =
              T.let(
                :telugu,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            THAI =
              T.let(
                :thai,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            TIBETAN =
              T.let(
                :tibetan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            TIGRINYA =
              T.let(
                :tigrinya,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            TONGAN =
              T.let(
                :tongan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            TSWANA =
              T.let(
                :tswana,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            TURKISH =
              T.let(
                :turkish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            TURKMEN =
              T.let(
                :turkmen,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            UKRAINIAN =
              T.let(
                :ukrainian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            URDU =
              T.let(
                :urdu,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            UYGHUR =
              T.let(
                :uyghur,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            UZBEK =
              T.let(
                :uzbek,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            VIETNAMESE =
              T.let(
                :vietnamese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            WELSH =
              T.let(
                :welsh,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            WOLOF =
              T.let(
                :wolof,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            XHOSA =
              T.let(
                :xhosa,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            YIDDISH =
              T.let(
                :yiddish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            YORUBA =
              T.let(
                :yoruba,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )
            ZULU =
              T.let(
                :zulu,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::BrandRetrieveParams::Body::BrandRetrieveByEmailRequest::ForceLanguage::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class BrandRetrieveByTickerRequest < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest,
                ContextDev::Internal::AnyHash
              )
            end

          # Stock ticker symbol to retrieve brand data for (e.g., 'AAPL').
          sig { returns(String) }
          attr_accessor :ticker

          sig do
            returns(
              T.nilable(
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::OrSymbol
              )
            )
          end
          attr_reader :force_language

          sig do
            params(
              force_language:
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::OrSymbol
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
          # less comprehensive data.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :max_speed

          sig { params(max_speed: T::Boolean).void }
          attr_writer :max_speed

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
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::OrSymbol,
              max_age_ms: Integer,
              max_speed: T::Boolean,
              ticker_exchange: String,
              timeout_ms: Integer
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
            # Optional stock exchange for the ticker. Defaults to NASDAQ if not specified.
            ticker_exchange: nil,
            # Optional timeout in milliseconds for the request. If the request takes longer
            # than this value, it will be aborted with a 408 status code. Maximum allowed
            # value is 300000ms (5 minutes).
            timeout_ms: nil
          )
          end

          sig do
            override.returns(
              {
                ticker: String,
                force_language:
                  ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::OrSymbol,
                max_age_ms: Integer,
                max_speed: T::Boolean,
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
                  ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AFRIKAANS =
              T.let(
                :afrikaans,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            ALBANIAN =
              T.let(
                :albanian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            AMHARIC =
              T.let(
                :amharic,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            ARABIC =
              T.let(
                :arabic,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            ARMENIAN =
              T.let(
                :armenian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            ASSAMESE =
              T.let(
                :assamese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            AYMARA =
              T.let(
                :aymara,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            AZERI =
              T.let(
                :azeri,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            BASQUE =
              T.let(
                :basque,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            BELARUSIAN =
              T.let(
                :belarusian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            BENGALI =
              T.let(
                :bengali,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            BOSNIAN =
              T.let(
                :bosnian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            BULGARIAN =
              T.let(
                :bulgarian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            BURMESE =
              T.let(
                :burmese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            CANTONESE =
              T.let(
                :cantonese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            CATALAN =
              T.let(
                :catalan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            CEBUANO =
              T.let(
                :cebuano,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            CHINESE =
              T.let(
                :chinese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            CORSICAN =
              T.let(
                :corsican,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            CROATIAN =
              T.let(
                :croatian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            CZECH =
              T.let(
                :czech,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            DANISH =
              T.let(
                :danish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            DUTCH =
              T.let(
                :dutch,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            ENGLISH =
              T.let(
                :english,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            ESPERANTO =
              T.let(
                :esperanto,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            ESTONIAN =
              T.let(
                :estonian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            FARSI =
              T.let(
                :farsi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            FIJIAN =
              T.let(
                :fijian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            FINNISH =
              T.let(
                :finnish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            FRENCH =
              T.let(
                :french,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            GALICIAN =
              T.let(
                :galician,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            GEORGIAN =
              T.let(
                :georgian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            GERMAN =
              T.let(
                :german,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            GREEK =
              T.let(
                :greek,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            GUARANI =
              T.let(
                :guarani,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            GUJARATI =
              T.let(
                :gujarati,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            HAITIAN_CREOLE =
              T.let(
                :"haitian-creole",
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            HAUSA =
              T.let(
                :hausa,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            HAWAIIAN =
              T.let(
                :hawaiian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            HEBREW =
              T.let(
                :hebrew,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            HINDI =
              T.let(
                :hindi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            HMONG =
              T.let(
                :hmong,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            HUNGARIAN =
              T.let(
                :hungarian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            ICELANDIC =
              T.let(
                :icelandic,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            IGBO =
              T.let(
                :igbo,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            INDONESIAN =
              T.let(
                :indonesian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            IRISH =
              T.let(
                :irish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            ITALIAN =
              T.let(
                :italian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            JAPANESE =
              T.let(
                :japanese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            JAVANESE =
              T.let(
                :javanese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            KANNADA =
              T.let(
                :kannada,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            KAZAKH =
              T.let(
                :kazakh,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            KHMER =
              T.let(
                :khmer,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            KINYARWANDA =
              T.let(
                :kinyarwanda,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            KOREAN =
              T.let(
                :korean,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            KURDISH =
              T.let(
                :kurdish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            KYRGYZ =
              T.let(
                :kyrgyz,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            LAO =
              T.let(
                :lao,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            LATIN =
              T.let(
                :latin,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            LATVIAN =
              T.let(
                :latvian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            LINGALA =
              T.let(
                :lingala,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            LITHUANIAN =
              T.let(
                :lithuanian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            LUXEMBOURGISH =
              T.let(
                :luxembourgish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            MACEDONIAN =
              T.let(
                :macedonian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            MALAGASY =
              T.let(
                :malagasy,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            MALAY =
              T.let(
                :malay,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            MALAYALAM =
              T.let(
                :malayalam,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            MALTESE =
              T.let(
                :maltese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            MAORI =
              T.let(
                :maori,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            MARATHI =
              T.let(
                :marathi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            MONGOLIAN =
              T.let(
                :mongolian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            NEPALI =
              T.let(
                :nepali,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            NORWEGIAN =
              T.let(
                :norwegian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            ODIA =
              T.let(
                :odia,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            OROMO =
              T.let(
                :oromo,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            PASHTO =
              T.let(
                :pashto,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            PIDGIN =
              T.let(
                :pidgin,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            POLISH =
              T.let(
                :polish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            PORTUGUESE =
              T.let(
                :portuguese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            PUNJABI =
              T.let(
                :punjabi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            QUECHUA =
              T.let(
                :quechua,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            ROMANIAN =
              T.let(
                :romanian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            RUSSIAN =
              T.let(
                :russian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            SAMOAN =
              T.let(
                :samoan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            SCOTTISH_GAELIC =
              T.let(
                :"scottish-gaelic",
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            SERBIAN =
              T.let(
                :serbian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            SESOTHO =
              T.let(
                :sesotho,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            SHONA =
              T.let(
                :shona,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            SINDHI =
              T.let(
                :sindhi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            SINHALA =
              T.let(
                :sinhala,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            SLOVAK =
              T.let(
                :slovak,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            SLOVENE =
              T.let(
                :slovene,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            SOMALI =
              T.let(
                :somali,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            SPANISH =
              T.let(
                :spanish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            SUNDANESE =
              T.let(
                :sundanese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            SWAHILI =
              T.let(
                :swahili,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            SWEDISH =
              T.let(
                :swedish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            TAGALOG =
              T.let(
                :tagalog,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            TAJIK =
              T.let(
                :tajik,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            TAMIL =
              T.let(
                :tamil,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            TATAR =
              T.let(
                :tatar,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            TELUGU =
              T.let(
                :telugu,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            THAI =
              T.let(
                :thai,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            TIBETAN =
              T.let(
                :tibetan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            TIGRINYA =
              T.let(
                :tigrinya,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            TONGAN =
              T.let(
                :tongan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            TSWANA =
              T.let(
                :tswana,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            TURKISH =
              T.let(
                :turkish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            TURKMEN =
              T.let(
                :turkmen,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            UKRAINIAN =
              T.let(
                :ukrainian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            URDU =
              T.let(
                :urdu,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            UYGHUR =
              T.let(
                :uyghur,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            UZBEK =
              T.let(
                :uzbek,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            VIETNAMESE =
              T.let(
                :vietnamese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            WELSH =
              T.let(
                :welsh,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            WOLOF =
              T.let(
                :wolof,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            XHOSA =
              T.let(
                :xhosa,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            YIDDISH =
              T.let(
                :yiddish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            YORUBA =
              T.let(
                :yoruba,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )
            ZULU =
              T.let(
                :zulu,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::BrandRetrieveParams::Body::BrandRetrieveByTickerRequest::ForceLanguage::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class BrandRetrieveFromTransactionRequest < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest,
                ContextDev::Internal::AnyHash
              )
            end

          # Transaction information to identify the brand.
          sig { returns(String) }
          attr_accessor :transaction_info

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
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::OrSymbol
              )
            )
          end
          attr_reader :force_language

          sig do
            params(
              force_language:
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::OrSymbol
            ).void
          end
          attr_writer :force_language

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
          sig { returns(T.nilable(Integer)) }
          attr_reader :mcc

          sig { params(mcc: Integer).void }
          attr_writer :mcc

          # Optional phone number from the transaction to help verify brand match.
          sig { returns(T.nilable(Float)) }
          attr_reader :phone

          sig { params(phone: Float).void }
          attr_writer :phone

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
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::OrSymbol,
              high_confidence_only: T::Boolean,
              max_speed: T::Boolean,
              mcc: Integer,
              phone: Float,
              timeout_ms: Integer
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
            # Optional timeout in milliseconds for the request. If the request takes longer
            # than this value, it will be aborted with a 408 status code. Maximum allowed
            # value is 300000ms (5 minutes).
            timeout_ms: nil
          )
          end

          sig do
            override.returns(
              {
                transaction_info: String,
                city: String,
                country_gl: String,
                force_language:
                  ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::OrSymbol,
                high_confidence_only: T::Boolean,
                max_speed: T::Boolean,
                mcc: Integer,
                phone: Float,
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
                  ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AFRIKAANS =
              T.let(
                :afrikaans,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            ALBANIAN =
              T.let(
                :albanian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            AMHARIC =
              T.let(
                :amharic,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            ARABIC =
              T.let(
                :arabic,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            ARMENIAN =
              T.let(
                :armenian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            ASSAMESE =
              T.let(
                :assamese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            AYMARA =
              T.let(
                :aymara,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            AZERI =
              T.let(
                :azeri,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            BASQUE =
              T.let(
                :basque,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            BELARUSIAN =
              T.let(
                :belarusian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            BENGALI =
              T.let(
                :bengali,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            BOSNIAN =
              T.let(
                :bosnian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            BULGARIAN =
              T.let(
                :bulgarian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            BURMESE =
              T.let(
                :burmese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            CANTONESE =
              T.let(
                :cantonese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            CATALAN =
              T.let(
                :catalan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            CEBUANO =
              T.let(
                :cebuano,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            CHINESE =
              T.let(
                :chinese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            CORSICAN =
              T.let(
                :corsican,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            CROATIAN =
              T.let(
                :croatian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            CZECH =
              T.let(
                :czech,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            DANISH =
              T.let(
                :danish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            DUTCH =
              T.let(
                :dutch,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            ENGLISH =
              T.let(
                :english,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            ESPERANTO =
              T.let(
                :esperanto,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            ESTONIAN =
              T.let(
                :estonian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            FARSI =
              T.let(
                :farsi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            FIJIAN =
              T.let(
                :fijian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            FINNISH =
              T.let(
                :finnish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            FRENCH =
              T.let(
                :french,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            GALICIAN =
              T.let(
                :galician,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            GEORGIAN =
              T.let(
                :georgian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            GERMAN =
              T.let(
                :german,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            GREEK =
              T.let(
                :greek,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            GUARANI =
              T.let(
                :guarani,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            GUJARATI =
              T.let(
                :gujarati,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            HAITIAN_CREOLE =
              T.let(
                :"haitian-creole",
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            HAUSA =
              T.let(
                :hausa,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            HAWAIIAN =
              T.let(
                :hawaiian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            HEBREW =
              T.let(
                :hebrew,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            HINDI =
              T.let(
                :hindi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            HMONG =
              T.let(
                :hmong,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            HUNGARIAN =
              T.let(
                :hungarian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            ICELANDIC =
              T.let(
                :icelandic,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            IGBO =
              T.let(
                :igbo,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            INDONESIAN =
              T.let(
                :indonesian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            IRISH =
              T.let(
                :irish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            ITALIAN =
              T.let(
                :italian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            JAPANESE =
              T.let(
                :japanese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            JAVANESE =
              T.let(
                :javanese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            KANNADA =
              T.let(
                :kannada,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            KAZAKH =
              T.let(
                :kazakh,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            KHMER =
              T.let(
                :khmer,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            KINYARWANDA =
              T.let(
                :kinyarwanda,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            KOREAN =
              T.let(
                :korean,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            KURDISH =
              T.let(
                :kurdish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            KYRGYZ =
              T.let(
                :kyrgyz,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            LAO =
              T.let(
                :lao,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            LATIN =
              T.let(
                :latin,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            LATVIAN =
              T.let(
                :latvian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            LINGALA =
              T.let(
                :lingala,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            LITHUANIAN =
              T.let(
                :lithuanian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            LUXEMBOURGISH =
              T.let(
                :luxembourgish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            MACEDONIAN =
              T.let(
                :macedonian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            MALAGASY =
              T.let(
                :malagasy,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            MALAY =
              T.let(
                :malay,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            MALAYALAM =
              T.let(
                :malayalam,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            MALTESE =
              T.let(
                :maltese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            MAORI =
              T.let(
                :maori,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            MARATHI =
              T.let(
                :marathi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            MONGOLIAN =
              T.let(
                :mongolian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            NEPALI =
              T.let(
                :nepali,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            NORWEGIAN =
              T.let(
                :norwegian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            ODIA =
              T.let(
                :odia,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            OROMO =
              T.let(
                :oromo,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            PASHTO =
              T.let(
                :pashto,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            PIDGIN =
              T.let(
                :pidgin,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            POLISH =
              T.let(
                :polish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            PORTUGUESE =
              T.let(
                :portuguese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            PUNJABI =
              T.let(
                :punjabi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            QUECHUA =
              T.let(
                :quechua,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            ROMANIAN =
              T.let(
                :romanian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            RUSSIAN =
              T.let(
                :russian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            SAMOAN =
              T.let(
                :samoan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            SCOTTISH_GAELIC =
              T.let(
                :"scottish-gaelic",
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            SERBIAN =
              T.let(
                :serbian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            SESOTHO =
              T.let(
                :sesotho,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            SHONA =
              T.let(
                :shona,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            SINDHI =
              T.let(
                :sindhi,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            SINHALA =
              T.let(
                :sinhala,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            SLOVAK =
              T.let(
                :slovak,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            SLOVENE =
              T.let(
                :slovene,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            SOMALI =
              T.let(
                :somali,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            SPANISH =
              T.let(
                :spanish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            SUNDANESE =
              T.let(
                :sundanese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            SWAHILI =
              T.let(
                :swahili,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            SWEDISH =
              T.let(
                :swedish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            TAGALOG =
              T.let(
                :tagalog,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            TAJIK =
              T.let(
                :tajik,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            TAMIL =
              T.let(
                :tamil,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            TATAR =
              T.let(
                :tatar,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            TELUGU =
              T.let(
                :telugu,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            THAI =
              T.let(
                :thai,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            TIBETAN =
              T.let(
                :tibetan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            TIGRINYA =
              T.let(
                :tigrinya,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            TONGAN =
              T.let(
                :tongan,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            TSWANA =
              T.let(
                :tswana,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            TURKISH =
              T.let(
                :turkish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            TURKMEN =
              T.let(
                :turkmen,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            UKRAINIAN =
              T.let(
                :ukrainian,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            URDU =
              T.let(
                :urdu,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            UYGHUR =
              T.let(
                :uyghur,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            UZBEK =
              T.let(
                :uzbek,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            VIETNAMESE =
              T.let(
                :vietnamese,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            WELSH =
              T.let(
                :welsh,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            WOLOF =
              T.let(
                :wolof,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            XHOSA =
              T.let(
                :xhosa,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            YIDDISH =
              T.let(
                :yiddish,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            YORUBA =
              T.let(
                :yoruba,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )
            ZULU =
              T.let(
                :zulu,
                ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::BrandRetrieveParams::Body::BrandRetrieveFromTransactionRequest::ForceLanguage::TaggedSymbol
                ]
              )
            end
            def self.values
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
