# typed: strong

module ContextDev
  module Models
    class IndustryRetrieveSicResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::IndustryRetrieveSicResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Echoes back which SIC dataset was used to classify the brand.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::IndustryRetrieveSicResponse::Classification::TaggedSymbol
          )
        )
      end
      attr_reader :classification

      sig do
        params(
          classification:
            ContextDev::Models::IndustryRetrieveSicResponse::Classification::OrSymbol
        ).void
      end
      attr_writer :classification

      # Array of SIC codes with confidence scores. Extra fields depend on the requested
      # classification: `original_sic` results include `majorGroup` and
      # `majorGroupName`; `latest_sec` results include `office`.
      sig do
        returns(
          T.nilable(
            T::Array[ContextDev::Models::IndustryRetrieveSicResponse::Code]
          )
        )
      end
      attr_reader :codes

      sig do
        params(
          codes:
            T::Array[
              ContextDev::Models::IndustryRetrieveSicResponse::Code::OrHash
            ]
        ).void
      end
      attr_writer :codes

      # Domain found for the brand
      sig { returns(T.nilable(String)) }
      attr_reader :domain

      sig { params(domain: String).void }
      attr_writer :domain

      # Credit usage, included whenever a valid API key is provided.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::IndustryRetrieveSicResponse::KeyMetadata
          )
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::IndustryRetrieveSicResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # Status of the response, e.g., 'ok'
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # Industry classification type, for sic api it will be `sic`
      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      sig do
        params(
          classification:
            ContextDev::Models::IndustryRetrieveSicResponse::Classification::OrSymbol,
          codes:
            T::Array[
              ContextDev::Models::IndustryRetrieveSicResponse::Code::OrHash
            ],
          domain: String,
          key_metadata:
            ContextDev::Models::IndustryRetrieveSicResponse::KeyMetadata::OrHash,
          status: String,
          type: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Echoes back which SIC dataset was used to classify the brand.
        classification: nil,
        # Array of SIC codes with confidence scores. Extra fields depend on the requested
        # classification: `original_sic` results include `majorGroup` and
        # `majorGroupName`; `latest_sec` results include `office`.
        codes: nil,
        # Domain found for the brand
        domain: nil,
        # Credit usage, included whenever a valid API key is provided.
        key_metadata: nil,
        # Status of the response, e.g., 'ok'
        status: nil,
        # Industry classification type, for sic api it will be `sic`
        type: nil
      )
      end

      sig do
        override.returns(
          {
            classification:
              ContextDev::Models::IndustryRetrieveSicResponse::Classification::TaggedSymbol,
            codes:
              T::Array[ContextDev::Models::IndustryRetrieveSicResponse::Code],
            domain: String,
            key_metadata:
              ContextDev::Models::IndustryRetrieveSicResponse::KeyMetadata,
            status: String,
            type: String
          }
        )
      end
      def to_hash
      end

      # Echoes back which SIC dataset was used to classify the brand.
      module Classification
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              ContextDev::Models::IndustryRetrieveSicResponse::Classification
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ORIGINAL_SIC =
          T.let(
            :original_sic,
            ContextDev::Models::IndustryRetrieveSicResponse::Classification::TaggedSymbol
          )
        LATEST_SEC =
          T.let(
            :latest_sec,
            ContextDev::Models::IndustryRetrieveSicResponse::Classification::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::IndustryRetrieveSicResponse::Classification::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Code < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::IndustryRetrieveSicResponse::Code,
              ContextDev::Internal::AnyHash
            )
          end

        # SIC code (4-digit).
        sig { returns(String) }
        attr_accessor :code

        # Confidence level for how well this SIC code matches the company description.
        sig do
          returns(
            ContextDev::Models::IndustryRetrieveSicResponse::Code::Confidence::TaggedSymbol
          )
        end
        attr_accessor :confidence

        # SIC industry title.
        sig { returns(String) }
        attr_accessor :name

        # 2-digit major group identifier (the leading two digits of the code). Only
        # present when `classification` is `original_sic`.
        sig { returns(T.nilable(String)) }
        attr_reader :major_group

        sig { params(major_group: String).void }
        attr_writer :major_group

        # Description of the 2-digit major group. Only present when `classification` is
        # `original_sic`.
        sig { returns(T.nilable(String)) }
        attr_reader :major_group_name

        sig { params(major_group_name: String).void }
        attr_writer :major_group_name

        # SEC review office responsible for filings under this code. Only present when
        # `classification` is `latest_sec`.
        sig { returns(T.nilable(String)) }
        attr_reader :office

        sig { params(office: String).void }
        attr_writer :office

        sig do
          params(
            code: String,
            confidence:
              ContextDev::Models::IndustryRetrieveSicResponse::Code::Confidence::OrSymbol,
            name: String,
            major_group: String,
            major_group_name: String,
            office: String
          ).returns(T.attached_class)
        end
        def self.new(
          # SIC code (4-digit).
          code:,
          # Confidence level for how well this SIC code matches the company description.
          confidence:,
          # SIC industry title.
          name:,
          # 2-digit major group identifier (the leading two digits of the code). Only
          # present when `classification` is `original_sic`.
          major_group: nil,
          # Description of the 2-digit major group. Only present when `classification` is
          # `original_sic`.
          major_group_name: nil,
          # SEC review office responsible for filings under this code. Only present when
          # `classification` is `latest_sec`.
          office: nil
        )
        end

        sig do
          override.returns(
            {
              code: String,
              confidence:
                ContextDev::Models::IndustryRetrieveSicResponse::Code::Confidence::TaggedSymbol,
              name: String,
              major_group: String,
              major_group_name: String,
              office: String
            }
          )
        end
        def to_hash
        end

        # Confidence level for how well this SIC code matches the company description.
        module Confidence
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::IndustryRetrieveSicResponse::Code::Confidence
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HIGH =
            T.let(
              :high,
              ContextDev::Models::IndustryRetrieveSicResponse::Code::Confidence::TaggedSymbol
            )
          MEDIUM =
            T.let(
              :medium,
              ContextDev::Models::IndustryRetrieveSicResponse::Code::Confidence::TaggedSymbol
            )
          LOW =
            T.let(
              :low,
              ContextDev::Models::IndustryRetrieveSicResponse::Code::Confidence::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::IndustryRetrieveSicResponse::Code::Confidence::TaggedSymbol
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
              ContextDev::Models::IndustryRetrieveSicResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits used by this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits remaining for your organization.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Credit usage, included whenever a valid API key is provided.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Credits used by this request.
          credits_consumed:,
          # Credits remaining for your organization.
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
