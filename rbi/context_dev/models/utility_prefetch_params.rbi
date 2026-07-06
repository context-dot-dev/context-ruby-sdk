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

      # Identifier of the brand to prefetch. Provide exactly one of domain or email.
      sig { returns(ContextDev::UtilityPrefetchParams::Identifier) }
      attr_reader :identifier

      sig do
        params(
          identifier: ContextDev::UtilityPrefetchParams::Identifier::OrHash
        ).void
      end
      attr_writer :identifier

      # What to prefetch. Currently only 'brand' is supported.
      sig { returns(ContextDev::UtilityPrefetchParams::Type::OrSymbol) }
      attr_accessor :type

      # Optional timeout in milliseconds for the request. If the request takes longer
      # than this value, it will be aborted with a 408 status code. Maximum allowed
      # value is 300000ms (5 minutes).
      sig { returns(T.nilable(Integer)) }
      attr_reader :timeout_ms

      sig { params(timeout_ms: Integer).void }
      attr_writer :timeout_ms

      sig do
        params(
          identifier: ContextDev::UtilityPrefetchParams::Identifier::OrHash,
          type: ContextDev::UtilityPrefetchParams::Type::OrSymbol,
          timeout_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Identifier of the brand to prefetch. Provide exactly one of domain or email.
        identifier:,
        # What to prefetch. Currently only 'brand' is supported.
        type:,
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
            identifier: ContextDev::UtilityPrefetchParams::Identifier,
            type: ContextDev::UtilityPrefetchParams::Type::OrSymbol,
            timeout_ms: Integer,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Identifier < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::UtilityPrefetchParams::Identifier,
              ContextDev::Internal::AnyHash
            )
          end

        # Domain name to prefetch brand data for
        sig { returns(T.nilable(String)) }
        attr_reader :domain

        sig { params(domain: String).void }
        attr_writer :domain

        # Email address to prefetch brand data for. The domain will be extracted from the
        # email. Free email providers (gmail.com, yahoo.com, etc.) and disposable email
        # addresses are not allowed.
        sig { returns(T.nilable(String)) }
        attr_reader :email

        sig { params(email: String).void }
        attr_writer :email

        # Identifier of the brand to prefetch. Provide exactly one of domain or email.
        sig { params(domain: String, email: String).returns(T.attached_class) }
        def self.new(
          # Domain name to prefetch brand data for
          domain: nil,
          # Email address to prefetch brand data for. The domain will be extracted from the
          # email. Free email providers (gmail.com, yahoo.com, etc.) and disposable email
          # addresses are not allowed.
          email: nil
        )
        end

        sig { override.returns({ domain: String, email: String }) }
        def to_hash
        end
      end

      # What to prefetch. Currently only 'brand' is supported.
      module Type
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::UtilityPrefetchParams::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BRAND =
          T.let(:brand, ContextDev::UtilityPrefetchParams::Type::TaggedSymbol)

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
