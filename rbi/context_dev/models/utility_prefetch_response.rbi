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

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Domain queued for prefetching.
      sig { returns(T.nilable(String)) }
      attr_reader :domain

      sig { params(domain: String).void }
      attr_writer :domain

      # Credits this request used and your remaining balance.
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

      # Human-readable confirmation.
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      # Always `ok` on success.
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # Data type that was queued, from the request.
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
          request_id: String,
          domain: String,
          key_metadata:
            ContextDev::Models::UtilityPrefetchResponse::KeyMetadata::OrHash,
          message: String,
          status: String,
          type: ContextDev::Models::UtilityPrefetchResponse::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Domain queued for prefetching.
        domain: nil,
        # Credits this request used and your remaining balance.
        key_metadata: nil,
        # Human-readable confirmation.
        message: nil,
        # Always `ok` on success.
        status: nil,
        # Data type that was queued, from the request.
        type: nil
      )
      end

      sig do
        override.returns(
          {
            request_id: String,
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

      # Data type that was queued, from the request.
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
