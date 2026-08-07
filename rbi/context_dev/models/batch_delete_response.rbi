# typed: strong

module ContextDev
  module Models
    class BatchDeleteResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::BatchDeleteResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # ID of the deleted batch.
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Always true on success.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :deleted

      sig { params(deleted: T::Boolean).void }
      attr_writer :deleted

      # Metadata about the API key used for the request. Included in every response
      # whenever a valid API key is provided, even when the response status is not 200.
      sig do
        returns(T.nilable(ContextDev::Models::BatchDeleteResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::BatchDeleteResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          id: String,
          deleted: T::Boolean,
          key_metadata:
            ContextDev::Models::BatchDeleteResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the deleted batch.
        id: nil,
        # Always true on success.
        deleted: nil,
        # Metadata about the API key used for the request. Included in every response
        # whenever a valid API key is provided, even when the response status is not 200.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            deleted: T::Boolean,
            key_metadata: ContextDev::Models::BatchDeleteResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchDeleteResponse::KeyMetadata,
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
