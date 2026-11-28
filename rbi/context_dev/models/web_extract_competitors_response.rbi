# typed: strong

module ContextDev
  module Models
    class WebExtractCompetitorsResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebExtractCompetitorsResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Direct competitors, ordered by relevance and confidence.
      sig do
        returns(
          T::Array[
            ContextDev::Models::WebExtractCompetitorsResponse::Competitor
          ]
        )
      end
      attr_accessor :competitors

      # Normalized domain from the request.
      sig { returns(String) }
      attr_accessor :domain

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Always `ok` on success.
      sig do
        returns(
          ContextDev::Models::WebExtractCompetitorsResponse::Status::TaggedSymbol
        )
      end
      attr_accessor :status

      # Profile of the requested company, inferred from its website.
      sig { returns(ContextDev::Models::WebExtractCompetitorsResponse::Target) }
      attr_reader :target

      sig do
        params(
          target:
            ContextDev::Models::WebExtractCompetitorsResponse::Target::OrHash
        ).void
      end
      attr_writer :target

      # Credits this request used and your remaining balance.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::WebExtractCompetitorsResponse::KeyMetadata
          )
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::WebExtractCompetitorsResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # `true` when the deadline passed with `timeoutOpts.behavior` set to
      # `return-partial`. Only results finished in time are included.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :partial

      sig { params(partial: T::Boolean).void }
      attr_writer :partial

      sig do
        params(
          competitors:
            T::Array[
              ContextDev::Models::WebExtractCompetitorsResponse::Competitor::OrHash
            ],
          domain: String,
          request_id: String,
          status:
            ContextDev::Models::WebExtractCompetitorsResponse::Status::OrSymbol,
          target:
            ContextDev::Models::WebExtractCompetitorsResponse::Target::OrHash,
          key_metadata:
            ContextDev::Models::WebExtractCompetitorsResponse::KeyMetadata::OrHash,
          partial: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Direct competitors, ordered by relevance and confidence.
        competitors:,
        # Normalized domain from the request.
        domain:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Always `ok` on success.
        status:,
        # Profile of the requested company, inferred from its website.
        target:,
        # Credits this request used and your remaining balance.
        key_metadata: nil,
        # `true` when the deadline passed with `timeoutOpts.behavior` set to
        # `return-partial`. Only results finished in time are included.
        partial: nil
      )
      end

      sig do
        override.returns(
          {
            competitors:
              T::Array[
                ContextDev::Models::WebExtractCompetitorsResponse::Competitor
              ],
            domain: String,
            request_id: String,
            status:
              ContextDev::Models::WebExtractCompetitorsResponse::Status::TaggedSymbol,
            target: ContextDev::Models::WebExtractCompetitorsResponse::Target,
            key_metadata:
              ContextDev::Models::WebExtractCompetitorsResponse::KeyMetadata,
            partial: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Competitor < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebExtractCompetitorsResponse::Competitor,
              ContextDev::Internal::AnyHash
            )
          end

        # Confidence that this company is a direct competitor.
        sig do
          returns(
            ContextDev::Models::WebExtractCompetitorsResponse::Competitor::Confidence::TaggedSymbol
          )
        end
        attr_accessor :confidence

        # Short description of what the competitor offers.
        sig { returns(String) }
        attr_accessor :description

        # Competitor's official domain, normalized.
        sig { returns(String) }
        attr_accessor :domain

        # Competitor company or product name.
        sig { returns(String) }
        attr_accessor :name

        # Search result URLs used as evidence for this competitor.
        sig { returns(T::Array[String]) }
        attr_accessor :source_urls

        # Competitor's website URL.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            confidence:
              ContextDev::Models::WebExtractCompetitorsResponse::Competitor::Confidence::OrSymbol,
            description: String,
            domain: String,
            name: String,
            source_urls: T::Array[String],
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Confidence that this company is a direct competitor.
          confidence:,
          # Short description of what the competitor offers.
          description:,
          # Competitor's official domain, normalized.
          domain:,
          # Competitor company or product name.
          name:,
          # Search result URLs used as evidence for this competitor.
          source_urls:,
          # Competitor's website URL.
          url:
        )
        end

        sig do
          override.returns(
            {
              confidence:
                ContextDev::Models::WebExtractCompetitorsResponse::Competitor::Confidence::TaggedSymbol,
              description: String,
              domain: String,
              name: String,
              source_urls: T::Array[String],
              url: String
            }
          )
        end
        def to_hash
        end

        # Confidence that this company is a direct competitor.
        module Confidence
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::WebExtractCompetitorsResponse::Competitor::Confidence
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HIGH =
            T.let(
              :high,
              ContextDev::Models::WebExtractCompetitorsResponse::Competitor::Confidence::TaggedSymbol
            )
          MEDIUM =
            T.let(
              :medium,
              ContextDev::Models::WebExtractCompetitorsResponse::Competitor::Confidence::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebExtractCompetitorsResponse::Competitor::Confidence::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Always `ok` on success.
      module Status
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              ContextDev::Models::WebExtractCompetitorsResponse::Status
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OK =
          T.let(
            :ok,
            ContextDev::Models::WebExtractCompetitorsResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebExtractCompetitorsResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Target < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebExtractCompetitorsResponse::Target,
              ContextDev::Internal::AnyHash
            )
          end

        # Company or product name, inferred from its website.
        sig { returns(String) }
        attr_accessor :company_name

        # Product category or market the company operates in.
        sig { returns(String) }
        attr_accessor :field

        # One-sentence summary of what the company sells and who it serves.
        sig { returns(String) }
        attr_accessor :field_description

        # Website URL that was analyzed.
        sig { returns(String) }
        attr_accessor :website_url

        # Profile of the requested company, inferred from its website.
        sig do
          params(
            company_name: String,
            field: String,
            field_description: String,
            website_url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Company or product name, inferred from its website.
          company_name:,
          # Product category or market the company operates in.
          field:,
          # One-sentence summary of what the company sells and who it serves.
          field_description:,
          # Website URL that was analyzed.
          website_url:
        )
        end

        sig do
          override.returns(
            {
              company_name: String,
              field: String,
              field_description: String,
              website_url: String
            }
          )
        end
        def to_hash
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebExtractCompetitorsResponse::KeyMetadata,
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
