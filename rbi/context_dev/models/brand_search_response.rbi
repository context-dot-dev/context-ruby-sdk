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

      # Up to 10 matching brands, most popular first. Empty when nothing matches.
      sig { returns(T::Array[ContextDev::Models::BrandSearchResponse::Result]) }
      attr_accessor :results

      # Metadata about the API key used for the request. Included in every response
      # whenever a valid API key is provided, even when the response status is not 200.
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
          results:
            T::Array[ContextDev::Models::BrandSearchResponse::Result::OrHash],
          key_metadata:
            ContextDev::Models::BrandSearchResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Up to 10 matching brands, most popular first. Empty when nothing matches.
        results:,
        # Metadata about the API key used for the request. Included in every response
        # whenever a valid API key is provided, even when the response status is not 200.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
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

        # The brand's domain.
        sig { returns(String) }
        attr_accessor :domain

        # Logo link URL that serves the brand's logo, generated per request for the
        # calling organization.
        sig { returns(String) }
        attr_accessor :logo

        # The brand's name. Empty string when unknown.
        sig { returns(String) }
        attr_accessor :name

        sig do
          params(domain: String, logo: String, name: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # The brand's domain.
          domain:,
          # Logo link URL that serves the brand's logo, generated per request for the
          # calling organization.
          logo:,
          # The brand's name. Empty string when unknown.
          name:
        )
        end

        sig { override.returns({ domain: String, logo: String, name: String }) }
        def to_hash
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

        # The number of credits consumed by this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # The number of credits remaining for your organization after this request.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Metadata about the API key used for the request. Included in every response
        # whenever a valid API key is provided, even when the response status is not 200.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # The number of credits consumed by this request.
          credits_consumed:,
          # The number of credits remaining for your organization after this request.
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
