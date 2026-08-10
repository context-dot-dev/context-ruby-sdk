# typed: strong

module ContextDev
  module Models
    class UtilityPrefetchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::UtilityPrefetchParams,
            ContextDev::Internal::AnyHash
          )
        end

      # Identifier of the target to prefetch. Provide exactly one of domain or email.
      sig do
        returns(
          T.any(
            ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier,
            ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier
          )
        )
      end
      attr_accessor :identifier

      # What to prefetch: 'brand' warms the brand data cache, 'styleguide' warms the
      # styleguide cache.
      sig { returns(ContextDev::UtilityPrefetchParams::Type::OrSymbol) }
      attr_accessor :type

      # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Optional timeout in milliseconds for the request. If the request takes longer
      # than this value, it will be aborted with a 408 status code. Maximum allowed
      # value is 300000ms (5 minutes).
      sig { returns(T.nilable(Integer)) }
      attr_reader :timeout_ms

      sig { params(timeout_ms: Integer).void }
      attr_writer :timeout_ms

      sig do
        params(
          identifier:
            T.any(
              ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier::OrHash,
              ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier::OrHash
            ),
          type: ContextDev::UtilityPrefetchParams::Type::OrSymbol,
          tags: T::Array[String],
          timeout_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Identifier of the target to prefetch. Provide exactly one of domain or email.
        identifier:,
        # What to prefetch: 'brand' warms the brand data cache, 'styleguide' warms the
        # styleguide cache.
        type:,
        # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
        tags: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            identifier:
              T.any(
                ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier,
                ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier
              ),
            type: ContextDev::UtilityPrefetchParams::Type::OrSymbol,
            tags: T::Array[String],
            timeout_ms: Integer,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Identifier of the target to prefetch. Provide exactly one of domain or email.
      module Identifier
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier,
              ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier
            )
          end

        class UtilityPrefetchDomainIdentifier < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier,
                ContextDev::Internal::AnyHash
              )
            end

          # Domain name to prefetch data for
          sig { returns(String) }
          attr_accessor :domain

          # Prefetch by domain.
          sig { params(domain: String).returns(T.attached_class) }
          def self.new(
            # Domain name to prefetch data for
            domain:
          )
          end

          sig { override.returns({ domain: String }) }
          def to_hash
          end
        end

        class UtilityPrefetchEmailIdentifier < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier,
                ContextDev::Internal::AnyHash
              )
            end

          # Email address to prefetch data for. The domain will be extracted from the email.
          # Free email providers (gmail.com, yahoo.com, etc.) and disposable email addresses
          # are not allowed.
          sig { returns(String) }
          attr_accessor :email

          # Prefetch by email. The domain will be extracted and validated.
          sig { params(email: String).returns(T.attached_class) }
          def self.new(
            # Email address to prefetch data for. The domain will be extracted from the email.
            # Free email providers (gmail.com, yahoo.com, etc.) and disposable email addresses
            # are not allowed.
            email:
          )
          end

          sig { override.returns({ email: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[ContextDev::UtilityPrefetchParams::Identifier::Variants]
          )
        end
        def self.variants
        end
      end

      # What to prefetch: 'brand' warms the brand data cache, 'styleguide' warms the
      # styleguide cache.
      module Type
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::UtilityPrefetchParams::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BRAND =
          T.let(:brand, ContextDev::UtilityPrefetchParams::Type::TaggedSymbol)
        STYLEGUIDE =
          T.let(
            :styleguide,
            ContextDev::UtilityPrefetchParams::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::UtilityPrefetchParams::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
