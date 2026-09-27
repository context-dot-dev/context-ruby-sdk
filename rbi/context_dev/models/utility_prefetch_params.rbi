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

      # Data to prefetch.
      sig { returns(ContextDev::UtilityPrefetchParams::Type::OrSymbol) }
      attr_accessor :type

      # Labels for filtering usage in the dashboard.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Request deadline and what to return when it passes.
      sig { returns(T.nilable(ContextDev::UtilityPrefetchParams::TimeoutOpts)) }
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts: ContextDev::UtilityPrefetchParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      sig do
        params(
          identifier:
            T.any(
              ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier::OrHash,
              ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier::OrHash
            ),
          type: ContextDev::UtilityPrefetchParams::Type::OrSymbol,
          tags: T::Array[String],
          timeout_opts: ContextDev::UtilityPrefetchParams::TimeoutOpts::OrHash,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Identifier of the target to prefetch. Provide exactly one of domain or email.
        identifier:,
        # Data to prefetch.
        type:,
        # Labels for filtering usage in the dashboard.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
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
            timeout_opts: ContextDev::UtilityPrefetchParams::TimeoutOpts,
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

          # Domain, e.g. `stripe.com`.
          sig { returns(String) }
          attr_accessor :domain

          # Prefetch by domain.
          sig { params(domain: String).returns(T.attached_class) }
          def self.new(
            # Domain, e.g. `stripe.com`.
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

      # Data to prefetch.
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

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::UtilityPrefetchParams::TimeoutOpts,
              ContextDev::Internal::AnyHash
            )
          end

        # Deadline in milliseconds.
        sig { returns(Integer) }
        attr_accessor :milliseconds

        # Only "fail" is supported: return 408 at the deadline.
        sig do
          returns(
            T.nilable(
              ContextDev::UtilityPrefetchParams::TimeoutOpts::Behavior::OrSymbol
            )
          )
        end
        attr_reader :behavior

        sig do
          params(
            behavior:
              ContextDev::UtilityPrefetchParams::TimeoutOpts::Behavior::OrSymbol
          ).void
        end
        attr_writer :behavior

        # Request deadline and what to return when it passes.
        sig do
          params(
            milliseconds: Integer,
            behavior:
              ContextDev::UtilityPrefetchParams::TimeoutOpts::Behavior::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Deadline in milliseconds.
          milliseconds:,
          # Only "fail" is supported: return 408 at the deadline.
          behavior: nil
        )
        end

        sig do
          override.returns(
            {
              milliseconds: Integer,
              behavior:
                ContextDev::UtilityPrefetchParams::TimeoutOpts::Behavior::OrSymbol
            }
          )
        end
        def to_hash
        end

        # Only "fail" is supported: return 408 at the deadline.
        module Behavior
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::UtilityPrefetchParams::TimeoutOpts::Behavior
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAIL =
            T.let(
              :fail,
              ContextDev::UtilityPrefetchParams::TimeoutOpts::Behavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::UtilityPrefetchParams::TimeoutOpts::Behavior::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
