# typed: strong

module ContextDev
  module Models
    class WebAnswersResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebAnswersResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # The answer, in the shape requested by json_format.
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :json_content

      # URLs that supplied search results or readable page content, in first-seen order.
      # Unreadable pages are excluded.
      sig { returns(T::Array[String]) }
      attr_accessor :sources

      # Credit usage, included whenever a valid API key is provided.
      sig do
        returns(T.nilable(ContextDev::Models::WebAnswersResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::WebAnswersResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # True when the request deadline ended research and the answer uses the evidence
      # collected so far.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :partial

      sig { params(partial: T::Boolean).void }
      attr_writer :partial

      sig do
        params(
          json_content: T::Hash[Symbol, T.anything],
          sources: T::Array[String],
          key_metadata:
            ContextDev::Models::WebAnswersResponse::KeyMetadata::OrHash,
          partial: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The answer, in the shape requested by json_format.
        json_content:,
        # URLs that supplied search results or readable page content, in first-seen order.
        # Unreadable pages are excluded.
        sources:,
        # Credit usage, included whenever a valid API key is provided.
        key_metadata: nil,
        # True when the request deadline ended research and the answer uses the evidence
        # collected so far.
        partial: nil
      )
      end

      sig do
        override.returns(
          {
            json_content: T::Hash[Symbol, T.anything],
            sources: T::Array[String],
            key_metadata: ContextDev::Models::WebAnswersResponse::KeyMetadata,
            partial: T::Boolean
          }
        )
      end
      def to_hash
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebAnswersResponse::KeyMetadata,
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
