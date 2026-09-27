# typed: strong

module ContextDev
  module Models
    class FeedbackSubmitResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::FeedbackSubmitResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # True when feedback for this request_id was already recorded; the original
      # feedback_id is returned.
      sig { returns(T::Boolean) }
      attr_accessor :already_submitted

      # ID of the stored feedback.
      sig { returns(String) }
      attr_accessor :feedback_id

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Credits this request used and your remaining balance.
      sig do
        returns(
          T.nilable(ContextDev::Models::FeedbackSubmitResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::FeedbackSubmitResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          already_submitted: T::Boolean,
          feedback_id: String,
          request_id: String,
          key_metadata:
            ContextDev::Models::FeedbackSubmitResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # True when feedback for this request_id was already recorded; the original
        # feedback_id is returned.
        already_submitted:,
        # ID of the stored feedback.
        feedback_id:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Credits this request used and your remaining balance.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            already_submitted: T::Boolean,
            feedback_id: String,
            request_id: String,
            key_metadata:
              ContextDev::Models::FeedbackSubmitResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::FeedbackSubmitResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits remaining for your organization.
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
