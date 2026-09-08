# typed: strong

module ContextDev
  module Models
    class UtilityPrefetchResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::UtilityPrefetchResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # The domain that was queued for prefetching
      sig { returns(T.nilable(String)) }
      attr_reader :domain

      sig { params(domain: String).void }
      attr_writer :domain

      # Credit usage, included whenever a valid API key is provided.
      sig do
        returns(
          T.nilable(ContextDev::Models::UtilityPrefetchResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::UtilityPrefetchResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # Success message
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      # Status of the response, e.g., 'ok'
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # The type of prefetch that was queued, echoed from the request
      sig do
        returns(
          T.nilable(
            ContextDev::Models::UtilityPrefetchResponse::Type::TaggedSymbol
          )
        )
      end
      attr_reader :type

      sig do
        params(
          type: ContextDev::Models::UtilityPrefetchResponse::Type::OrSymbol
        ).void
      end
      attr_writer :type

      sig do
        params(
          domain: String,
          key_metadata:
            ContextDev::Models::UtilityPrefetchResponse::KeyMetadata::OrHash,
          message: String,
          status: String,
          type: ContextDev::Models::UtilityPrefetchResponse::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The domain that was queued for prefetching
        domain: nil,
        # Credit usage, included whenever a valid API key is provided.
        key_metadata: nil,
        # Success message
        message: nil,
        # Status of the response, e.g., 'ok'
        status: nil,
        # The type of prefetch that was queued, echoed from the request
        type: nil
      )
      end

      sig do
        override.returns(
          {
            domain: String,
            key_metadata:
              ContextDev::Models::UtilityPrefetchResponse::KeyMetadata,
            message: String,
            status: String,
            type:
              ContextDev::Models::UtilityPrefetchResponse::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::UtilityPrefetchResponse::KeyMetadata,
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

      # The type of prefetch that was queued, echoed from the request
      module Type
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::UtilityPrefetchResponse::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BRAND =
          T.let(
            :brand,
            ContextDev::Models::UtilityPrefetchResponse::Type::TaggedSymbol
          )
        STYLEGUIDE =
          T.let(
            :styleguide,
            ContextDev::Models::UtilityPrefetchResponse::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::UtilityPrefetchResponse::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
